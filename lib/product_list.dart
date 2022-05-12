import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/home_page.dart';

import 'productScreen.dart';



class MenFashion extends StatelessWidget {
   MenFashion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MenFashionState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenFashionState extends StatefulWidget {
   MenFashionState({Key? key}) : super(key: key);

  @override
  _MenFashionStateState createState() => _MenFashionStateState();
}

class _MenFashionStateState extends State<MenFashionState> {

  // ignore: non_ant_identifier_names
  final List<Map> ImageList = [
    {"name": "Product 1", "iconPath": "assets/men.jpg",},
    {"name": "Product 2", "iconPath": "assets/men.jpg"},
    {"name": "Product 3", "iconPath": "assets/men.jpg"},
    {"name": "Product 4", "iconPath": "assets/men.jpg"},
    {"name": "Product 5", "iconPath": "assets/men.jpg"},
    {"name": "Product 6", "iconPath": "assets/men.jpg"},
    {"name": "Product 7", "iconPath": "assets/men.jpg"},
    {"name": "Product 8", "iconPath": "assets/men.jpg"},
    {"name": "Product 9", "iconPath": "assets/men.jpg"},
  ];


  Icon customIcon =  Icon(Icons.search);
  Widget customSearchBar =  Text("Mens Fashion");
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: customSearchBar,
        centerTitle: true,
        leading: IconButton(
          icon:  Icon(
          Icons.arrow_back,
          ), onPressed: ()=>
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  HomePage()))
        },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () =>{
                setState((){
                  if(customIcon.icon == Icons.search){
                    customIcon =  Icon(Icons.cancel);
                    customSearchBar =  TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Products",
                        hintStyle:  TextStyle(color: Colors.white)

                      ),
                      style:  TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    );
                  }
                  else{
                    customIcon = Icon(Icons.search);
                    customSearchBar = Text("Mens Fashions");
                  }
                })
              },
              icon: customIcon,
          ),
          IconButton(onPressed: () => {
          }, icon:  Icon(
            Icons.filter_alt_outlined,
            size: 25,
          ),)
        ],

      ),
    body: Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[

              GridView.builder(
                physics:  ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: ImageList.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    semanticContainer: true,
                    color: Colors.white,
                    elevation: 0.2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      height: 300,
                      width: 200,
                      child: InkWell(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () => {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>   ProductScreen()))
                              },
                              child: Padding(
                                padding:  EdgeInsets.all(15),
                                child: Image.asset(
                                  ImageList[index]['iconPath'],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                             SizedBox(height: 5),
                            Text(
                              ImageList[index]["name"],
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                  fontSize: 20,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  );

                },
              ),


              SizedBox(height: 20,)
            ]),

        ),
      ],
    ),
    );
  }
}

