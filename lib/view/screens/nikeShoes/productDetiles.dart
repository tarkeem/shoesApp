

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../model/shoesProduct.dart';
import 'package:shoesstore/view/widgets/orderNowSheet.dart';
import 'package:shoesstore/view/widgets/shakeTransition.dart';

class productDetilesScreen extends StatelessWidget {
  bool floating_button_visible = true;
  ValueNotifier<bool> _floating_button_visible = ValueNotifier(true);
  static const routNmae = '/pagedetails';

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    shoes prod =shoesItem[0];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/nike_logo.png', height: 40),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ShakeTransition(
            axis: Axis.vertical,
            child: SizedBox(
              height: deviceSize.height * 0.6,
              child: Column(
                children: [
                  Text(prod.model),
                  Expanded(
                    child: PageView.builder(
                      itemCount: prod.prodImages.length,
                      itemBuilder: (context, index) {
                        return Hero(
                            tag: '${prod.prodImages[index]}',
                            child: Image.asset(prod.prodImages[index]));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          ShakeTransition(
            duration: Duration(seconds: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: '${prod.model}',
                  child: Material(
                    child: Text(
                      prod.model,
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${prod.oldPrice.toString()}\$',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Color.fromARGB(255, 0, 0, 0),
                            decorationStyle: TextDecorationStyle.double)),
                    Text(
                      '${prod.currentPrice.toString()}\$',
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    )
                  ],
                )
              ],
            ),
          ),
          ShakeTransition(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'available size:',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SizedBox(
            height: 5,
          ),
          ShakeTransition(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('26f'),
                  Text('30f'),
                  Builder(builder: (cxt) {
                    return InkWell(
                        onTap: () async {
                          _floating_button_visible.value = false;
                          await _showBottomSheet(cxt, prod);
                          _floating_button_visible.value = true;
                        },
                        child: Text('35f'));
                  }),
                  Text('39f'),
                  Text('42f'),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _floating_button_visible,
        builder: (context, value, child) {
          if (value) {
            return IconButton(onPressed: () {}, icon: Icon(Icons.favorite));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  _showBottomSheet(cxt, shoes prod) {
    //opaque is resbosible for disappearing the page that is behind
    Navigator.of(cxt).push(PageRouteBuilder(opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeTransition(
            child: orderSheet(prod),
            opacity: animation),
    ));

    /*return Scaffold.of(cxt).showBottomSheet(
      (context) => Container(
        color: Colors.black.withOpacity(0.2),
        height: MediaQuery.of(cxt).size.height * 0.6,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  prod.prodImages[0],
                  scale: 2,
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(prod.model), Text(prod.model_num.toString())],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('26f'),
                Text('30f'),
                Builder(builder: (cxt) {
                  return InkWell(
                      onTap: () async {
                        _floating_button_visible.value = false;
                        await _showBottomSheet(cxt, prod);
                        _floating_button_visible.value = true;
                      },
                      child: Text('35f'));
                }),
                Text('39f'),
                Text('42f'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ElevatedButton(onPressed: () {}, child: Text('Order Now'))],
            )
          ],
        ),
      ),
    );*/
  }
}
