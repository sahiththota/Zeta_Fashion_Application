import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/home_page.dart';

import 'productScreen.dart';



class MenFashion extends StatelessWidget {
   const MenFashion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: MenFashionState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenFashionState extends StatefulWidget {
   const MenFashionState({Key? key}) : super(key: key);

  @override
  State <MenFashionState> createState() => _MenFashionStateState();
}

class _MenFashionStateState extends State<MenFashionState> {

  // ignore: non_ant_identifier_names, non_constant_identifier_names
  final List<Map> ImageList = [
    {"name": "Product 1", "description" : "Made by @", "iconPath": "https://static.fibre2fashion.com/articleresources/images/81/8092/mens-fashion_big_Big.jpg",},
    {"name": "Product 2", "description" : "Made by @","iconPath": "https://static.wixstatic.com/media/4c2e0b5374204d6ca536142df349729f.jpg/v1/fill/w_1880,h_1040,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Male%20fashion%20model.jpg"},
    {"name": "Product 3", "description" : "Made by @","iconPath": "https://centralandme.com/wp-content/uploads/2017/09/sweat-shirt-thumb.jpg"},
    {"name": "Product 4", "description" : "Made by @","iconPath": "https://img.mensxp.com/media/content/2019/Dec/2-1576647108.jpg"},
    {"name": "Product 5", "description" : "Made by @","iconPath": "https://i.pinimg.com/originals/b2/d5/5f/b2d55fe4e18775a6146fb5c5d7b26f78.jpg"},
    {"name": "Product 6", "description" : "Made by @", "iconPath": "https://static.fibre2fashion.com/articleresources/images/81/8092/mens-fashion_big_Big.jpg",},
    {"name": "Product 7", "description" : "Made by @","iconPath": "https://static.wixstatic.com/media/4c2e0b5374204d6ca536142df349729f.jpg/v1/fill/w_1880,h_1040,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Male%20fashion%20model.jpg"},
    {"name": "Product 8", "description" : "Made by @","iconPath": "https://centralandme.com/wp-content/uploads/2017/09/sweat-shirt-thumb.jpg"},
    {"name": "Product 9", "description" : "Made by @","iconPath": "https://img.mensxp.com/media/content/2019/Dec/2-1576647108.jpg"},
    {"name": "Product 10", "description" : "Made by @","iconPath": "https://i.pinimg.com/originals/b2/d5/5f/b2d55fe4e18775a6146fb5c5d7b26f78.jpg"},
  ];


  Icon customIcon =  const Icon(Icons.search);
  Widget customSearchBar =  const Text("Men's Fashion");
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: customSearchBar,
        centerTitle: true,
        leading: IconButton(
          icon:  const Icon(
          Icons.arrow_back,
          ), onPressed: ()=>
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  const HomePage()))
        },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () =>{
                setState((){
                  if(customIcon.icon == Icons.search){
                    customIcon =  const Icon(Icons.cancel);
                    customSearchBar =  const TextField(
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
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text("Men's Fashions");
                  }
                })
              },
              icon: customIcon,
          ),
          IconButton(onPressed: () => {
          }, icon:  const Icon(
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
                physics:  const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: ImageList.length,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    MaterialPageRoute(builder: (context) =>   const ProductScreen()))
                              },
                              child: Padding(
                                padding:  const EdgeInsets.all(15),
                                child: Image.network(
                                  ImageList[index]['iconPath'],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                             const SizedBox(height: 2),
                            Text(
                              ImageList[index]["name"],
                              textAlign: TextAlign.center,
                              style:  const TextStyle(
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


              const SizedBox(height: 20,)
            ]),

        ),
      ],
    ),
    );
  }
}

