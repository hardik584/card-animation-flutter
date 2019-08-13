import 'dart:io';  
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'animate.dart';

const List<String> images = [
  "images/1.png",
  "images/2.png",
  "images/3.png",
  "images/2175404.jpg",
];

const List<Map> forestnames = [
  {
    "title": "Amazone Rain Forest",
  },
  {
    "title": "Sinharaja Forest",
  },
  {
    "title": "Sumatra Rain Forest",
  },
  {
    "title": "Galaxy",
  },
];
class AnimationOnePage extends StatefulWidget {
  static final String path = "lib/src/pages/animations/animation1/animation1.dart";
  
  @override
  _AnimationOnePageState createState() => _AnimationOnePageState();
}

class _AnimationOnePageState extends State<AnimationOnePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  int prevIndex = 0;
  final SwiperController _swiperController = SwiperController();
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Best Forest ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: " in the World"),
          ])),
          Expanded(
            flex: 3,
            child: Swiper(
              physics: BouncingScrollPhysics(),
              viewportFraction: 0.8,
              itemCount: 3,
              loop: false,
              fade: 1.0,

              controller: _swiperController,
              onIndexChanged: (index) {
                _controller.reverse();
                setState(() {
                  prevIndex = currentIndex;
                  currentIndex = index;
                  _controller.forward();
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                 
                      Container(
                         padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  pageBuilder: (_, __, ___) => AnimationOneDetails(index: index,))),
                          child: Hero(
                            tag: "image$index",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                     Positioned(
                      bottom: 15,
                      left: 15,
                      child:  Container(
                        decoration: BoxDecoration(
                             color: Color.fromRGBO(0, 0, 0, 0.3),
                            borderRadius: new BorderRadius.only(
                  bottomLeft:  const  Radius.circular(21.0),
                 bottomRight: const  Radius.circular(21.0))
                ),
                        height: 50,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width/1.4,
                     
                        child: currentIndex == 0 ? Text('Africa',style: TextStyle(color: Colors.lime,fontSize: 20,fontWeight: FontWeight.bold),):Text('Sri Lanka',style: TextStyle(color: Colors.lime,fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  ],
               
                );
              },
            ),
          ),
          Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: currentIndex == 0 ? 1 : 0,
                child: _buildDesc(0),
                duration: Duration(milliseconds: 800),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 1 ? 1 : 0,
                child: _buildDesc(1),
                duration: Duration(milliseconds: 800),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 2 ? 1 : 0,
                child: _buildDesc(2),
                duration: Duration(milliseconds: 800),
              ),
              AnimatedOpacity(
                opacity: currentIndex == 3 ? 1 : 0,
                child: _buildDesc(3),
                duration: Duration(milliseconds: 800),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDesc(int index) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10.0),
          Hero(
            tag: "title$index",
            child: Material(
              type: MaterialType.transparency,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  forestnames[index]["title"],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}