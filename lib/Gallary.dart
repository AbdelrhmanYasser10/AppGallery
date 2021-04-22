import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_app/main.dart';

class gallery extends StatefulWidget {
  String category;
  gallery({
  @required this.category,
});
  @override
  _galleryState createState() => _galleryState();
}

class _galleryState extends State<gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 13, 88, 1),
        centerTitle: true,
        title:Text('${widget.category.toUpperCase()} GALLERY',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),),
        leading: IconButton(icon:Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),onPressed:
          Navigator.of(context).pop,),
      ),
      body: Material(
        color:Color.fromRGBO(31, 27, 103, 1),
        child: FutureBuilder(
          future: getPics(widget.category),
          builder: (context,snapShot){
            Map data = snapShot.data;
            if(snapShot.hasError){
              print(snapShot.error);
              return Center(
                child: Text(
                    'Faild to get response from the server',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            else if(snapShot.hasData){
              return Center(
                child: ListView.builder(
                  itemCount: data.length + 10,
                  itemBuilder: (context,index){
                    return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children : [

                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: InkWell(
                                    onTap: (){

                                    },
                                    child: Image.network(
                                      '${data['hits'][index]['largeImageURL']}',
                                    ),
                                ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: Text('Total Number of views : ${data['hits'][index]['views']}',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.white,
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.bottomCenter,

                                children : [

                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: Image.network(
                                        '${data['hits'][index + 3]['largeImageURL']}',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,

                                    child: Text('Total Number of views : ${data['hits'][index + 3]['views']}',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.white,
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    );
                  },
                ),
              );
            }
            else if(!snapShot.hasData){
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }
            else{
              return Text(
                  'Undefiend process',
              );
            }
          },
        ),
      ),
    );
  }
}
