import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoesstore/constants.dart';
import 'package:shoesstore/view/widgets/orderNowSheet.dart';
import '../../../model/shoesProduct.dart';
import 'package:shoesstore/view/widgets/shakeTransition.dart';

class nikeshoes2details extends StatefulWidget {
  int index;

  nikeshoes2details(this.index);

  @override
  State<nikeshoes2details> createState() => _nikeshoes2detailsState();
}

class _nikeshoes2detailsState extends State<nikeshoes2details> {
  double size=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(

        children: [
          Expanded(
            flex: 3,
            child: _upbar(widget.index,size)),
          Expanded(
            flex: 2,
            child: ShakeTransition(
            duration: Duration(seconds: 4),
            offset: 100,
            axis: Axis.vertical,
              child: _bottombar((double newsiz){

                  setState(() {
                      size=newsiz;
                  });
                
                
              },widget.index))),
              Center(child: GestureDetector(
                onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(opaque: false,pageBuilder:(context, animation, secondaryAnimation) => orderSheet(shoesItem[widget.index]),));
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.black,Colors.purple]),
                    shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Buy",style: constants().middleFontStyle,),
                  ),
                ),
              ),)
        ],
      ),
    );
  }
}

class _upbar extends StatelessWidget {
  int index;
  double size;
  _upbar(this.index,this.size);

  @override
  Widget build(BuildContext context) {
    var deviceSize=MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (p0, p1) => Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child:BackButton(
            color: Colors.white,
            onPressed: () {
            Navigator.of(context).pop();
          },) ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin:1,end: 0),
            duration: Duration(milliseconds: 600),
            builder:(context, value, child) =>Positioned(
                right:-deviceSize.width*0.5,
                top:-deviceSize.height*0.5,

                child: Container(
                  width: lerpDouble(70, deviceSize.width*1.1 ,1-value) ,
                  height: lerpDouble(70, deviceSize.height*1.1, 1-value) ,
                  decoration: BoxDecoration(
                    color: Colors.primaries[(index + 1)],
                    shape: BoxShape.circle,
                  ),
                )),
          ),
          Positioned(
            top: p1.maxHeight*0.3,
            child: Hero(
              
              tag: '$index txt',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  "N I K E",
                  style: TextStyle(color: Colors.white,
                      fontSize: 30, letterSpacing: 30, fontStyle: FontStyle.italic),
                  softWrap: false,
                ),
              ),
            ),
          ),
          Positioned(
            top: p1.maxHeight*0.3,
            left:p1.maxWidth*0.3,
            
               
                child: TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 700),
                  tween: Tween(begin: 1,end: 1+size*0.2),
                  builder:(context, value, child) =>  Transform.scale(
                    scale: value,
                    child: Container(
                      height: deviceSize.height*0.35,
                      width: deviceSize.width*0.35,
                      child: Hero(
                         tag: '$index pic',
                        child: Image.asset(
                                  shoesItem[index].prodImages[1],
                                  fit: BoxFit.contain,
                                ),
                      ),
                    ),
                  ),
                ),
              )
        ],
      ),
    );
  }
}

class _bottombar extends StatelessWidget {
  Function fun;
  int index;
  _bottombar(this.fun,this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(shoesItem[index].model,style: constants().bigFontStyle,),
        Row(
          children: [
            ...List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.star,color: Colors.white,),
              );
            } )
          ],
        ),


        Align(
          alignment: Alignment.centerLeft,
          child: Text('size:',style: constants().middleFontStyle,)),

        Row(
          children: [
            ...List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    fun(index);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color:Colors.white,
                    child: Text((index+1).toString()),
                  ),
                ),
              );
            } )
          ],
        )
      ],
    );
  }
}
