import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PopularUpdate extends StatefulWidget {
  const PopularUpdate({Key? key}) : super(key: key);

  @override
  _PopularUpdateState createState() => _PopularUpdateState();
}

class _PopularUpdateState extends State<PopularUpdate> {
  List info = [];
  _readData() async{
    await DefaultAssetBundle.of(context).loadString('json/detail.json').then((s){
      setState(() {
        info = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              onPressed: (){
              Get.back();
    },
              icon: Icon(Icons.arrow_back),
        ),
        ),
            body: Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 10),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for(int i=0;  i< info.length; i++)
                        Container(
                          height: 240,
                          margin: EdgeInsets.only(bottom: 30),
                          child: GestureDetector(
                                  onTap: (){
                                    Get.toNamed("/detail/", arguments: {
                                      'title': info[i]['title'].toString(),
                                      'name': info[i]['name'].toString(),
                                      'text': info[i]['text'].toString(),
                                      'img': info[i]['img'].toString(),
                                      'time': info[i]['time'].toString(),
                                      'prize': info[i]['prize'].toString(),
                                    });
                                  },

                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20, top: 20),
                                    height: 220,
                                    width: MediaQuery.of(context).size.width-20,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:i.isEven?Color(0xFF69c5df):Color(0xFF9294cc)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                            child:Row(
                                              children: [
                                                Text(
                                                  info[i]['title'],
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.w500,
                                                      color:Colors.white
                                                  ),
                                                ),
                                                Expanded(child: Container())
                                              ],
                                            )
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          width:MediaQuery.of(context).size.width,
                                          child: Text(
                                            info[i]['text'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:Color(0xFFb8eefc)
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Divider(thickness: 1.0,),
                                        Row(
                                            children:[for(int i=0; i<4; i++)
                                              Container(

                                                width: 50,
                                                height: 50,
                                                child: Container(

                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(25),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              info[i]['img']
                                                          ),
                                                          fit: BoxFit.cover
                                                      )
                                                  ),
                                                ),
                                              )
                                            ]

                                                ),
                                      ],
                                ),
                              ),
                        )
                        ),
                      ],
                    ),
                  ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
