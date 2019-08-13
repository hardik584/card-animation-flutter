import 'dart:io';
import 'package:flutter/material.dart';
import 'designswipe.dart';

class AnimationOneDetails extends StatelessWidget {
 
  final int index;

  const AnimationOneDetails({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
               Hero(
            tag: "image$index",
            child: Image.asset(images[index],height: MediaQuery.of(context).size.height/1.1, fit: BoxFit.cover)),
            Positioned(
              top: 30,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget>[
                IconButton(
               color: Colors.white,
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,                    
                    child: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,color: Colors.black,)),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
               color: Colors.white,
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon( Icons.more_vert,color: Colors.black,size: 25,)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],),
            ),
            Positioned(
              bottom: 30,
              left: 15,
              child:  Hero(
                    tag: "title$index",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(forestnames[index]["title"], style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
            ),
            
            ],),
             Container(
              width: MediaQuery.of(context).size.width,
              
              padding: EdgeInsets.only(top: 30,left: 10,right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                 borderRadius: new BorderRadius.only(
                  topLeft:  const  Radius.circular(40.0),
                  topRight: const  Radius.circular(40.0))
                ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:20.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
               color: Colors.grey[300],
                 borderRadius: new BorderRadius.only(
                  topLeft:  const  Radius.circular(40.0),
                  topRight: const  Radius.circular(40.0),
                  bottomLeft: const  Radius.circular(40.0),
                  bottomRight: const  Radius.circular(40.0),
                  )
                ),
                        
                        width: 80,
                        height: 5,
                        child: Text(' '),
                      ),
                    ),
                  ),
                  Text('1. What do you think is the importance of biodiversity in natural ecosystems?',style: TextStyle(fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Text('The largest biodiversity of ecosystems and species functions in natural environmental environments in which ecosystems have evolved without human impact through millions of years of climatic and geographical conditions enabling the development of various life forms. These types of high biodiversity sites can be found in unpolluted rainforest ecosystems in tropical forests, in temperate climates and in coral reefs.'),

                ],
              ),
            )
          ],
        ),
      ),
     
    );
  }
}