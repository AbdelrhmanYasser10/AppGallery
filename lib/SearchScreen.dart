import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_app/Gallary.dart';



class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  var category_controller = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(1, 13, 88, 1),
        centerTitle: true,
        title:Text('SEARCH APP',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),) ,
      ),
      body: Material(
        color:Color.fromRGBO(31, 27, 103, 1) ,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0,),
                  child: Image.asset('assests/images/Test.png',width: 200.0, height: 200.0,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SEARCH FOR ANY PHOTO YOU WANT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),),
                  ],
                ),
                ListTile(
                  title: TextFormField(
                    focusNode: myFocusNode,
                    controller: category_controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      labelText:'Enter a Category',
                      labelStyle: TextStyle(
                          color: Colors.white70,
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    height: 40.0,
                    color: Color.fromRGBO(75, 67, 181, 1),
                    onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context){
                              return gallery(
                                category: category_controller.text,
                              );
                            }
                          )
                        );
                    },
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('SEARCH',style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}