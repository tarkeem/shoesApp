import 'dart:html';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shoesstore/conroller/cart.dart';
import 'package:shoesstore/constants.dart';
import '../../model/shoesProduct.dart';

class orderSheet extends StatefulWidget {
  shoes prod;
  orderSheet(this.prod);

  @override
  State<orderSheet> createState() => _orderSheetState();
}

class _orderSheetState extends State<orderSheet>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> isCircular = ValueNotifier(false);
  double buttonWidth = 160.0;
  double circularbuttonWidth = 60.0;
  late AnimationController _animationController;
  late Animation _animation;
  late Animation _animation2;
  late Animation _animation3;
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          0.3,
        )));
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.4,
          0.6,
        )));
    _animation3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(.7, 1.0, curve: Curves.easeInBack)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Material(
      //material widget covers all spaces
      color: Colors.transparent.withOpacity(0.3),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned.fill(
                child: Transform.translate(
                    offset: Offset(0, 500 * _animation3.value as double),
                    child: _buildBottomSheet(deviceSize))),
            Positioned(
              bottom: deviceSize.height * 0.1,
              left: deviceSize.width / 2 -
                  lerpDouble(circularbuttonWidth, buttonWidth,
                              _animation.value as double)!
                          .toDouble() /
                      2,
              right: deviceSize.width / 2 -
                  lerpDouble(circularbuttonWidth, buttonWidth,
                              _animation.value as double)!
                          .toDouble() /
                      2,
              child: Transform.translate(
                  offset: Offset(0, 500 * _animation3.value as double),
                  child: bottomButton()),
            ),
          ],
        ),
      ),
    );
  }

  InkWell bottomButton() {
    return InkWell(
      onTap: () {
        isCircular = ValueNotifier(true);
        for (int i = 0; i < counter; i++) {
          Provider.of<cart>(context,listen: false).addToCart(widget.prod);
        }
        counter = 0;
        _animationController
            .forward()
            .then((value) => Navigator.of(context).pop());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color.fromARGB(255, 16, 194, 60),
        ),
        width: (buttonWidth * _animation.value)
            .clamp(circularbuttonWidth, buttonWidth),
        child: ValueListenableBuilder(
            valueListenable: isCircular,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Icon(Icons.shopping_cart)),
                    if (value == false) ...[
                      SizedBox(
                        width: 10,
                      ),
                      Text('order')
                    ]
                  ],
                ),
              );
            }),
      ),
    );
  }

  TweenAnimationBuilder<double> _buildBottomSheet(Size deviceSize) {
    print(_animation.value);
    double panelSize = (deviceSize.width * _animation.value)
        .clamp(circularbuttonWidth, deviceSize.width);
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400),
      tween: Tween(begin: 1, end: 0),
      builder: (context, value, child) => Transform.translate(
          child: child, offset: Offset(0, value * deviceSize.height * 0.6)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: lerpDouble(deviceSize.height * 0.4, deviceSize.height * 0.804,
                _animation2.value),
            left: deviceSize.width / 2 - panelSize / 2,
            width: panelSize,
            child: Container(
                height: (deviceSize.height * 0.6 * _animation.value)
                    .clamp(circularbuttonWidth, deviceSize.height * 0.6),
                width: (deviceSize.width * _animation.value)
                    .clamp(circularbuttonWidth, deviceSize.width),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            widget.prod.prodImages[0],
                          ),
                          if (_animation.value >= 1) ...[
                            Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  widget.prod.model,
                                  style: constants()
                                      .bigFontStyle
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  widget.prod.model_num.toString(),
                                  style: constants()
                                      .bigFontStyle
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  "${widget.prod.oldPrice}\$",
                                  style: constants().middleFontStyle.copyWith(
                                      fontSize: 35, color: Colors.green),
                                ),
                                Text(
                                  "${widget.prod.currentPrice}\$",
                                  style: constants().middleFontStyle.copyWith(
                                      color: Colors.red,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationColor: Colors.black,
                                      decorationThickness: 2.5,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                       InkWell(
                                        onTap: () {
                                          setState(() {
                                            counter--;
                                          });
                                        },
                                         child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                            child: Icon(Icons.remove),
                                          ),
                                       ),
                    
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                              
                                              counter.toString(),
                                              style: constants()
                                                  .bigFontStyle
                                                  .copyWith(fontStyle: FontStyle.normal,fontFamily: null,color: Colors.black),
                                            ),
                                    ),
                                      
                                      
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            counter++;
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Color.fromARGB(255, 10, 206, 14),
                                            child: Icon(Icons.add),
                                          ),
                                      ),
                                      
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]
                        ],
                      ),
                    ),
                    if (_animation.value >= 1) Spacer()
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
