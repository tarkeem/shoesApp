import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../model/shoesProduct.dart';
import 'package:shoesstore/view/widgets/productCard.dart';

//height: kToolbarHeight,to get the hight of appbar
class shoppingBoard extends StatelessWidget {
  const shoppingBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/nike_logo.png',
                scale: 2.5,
              ),
              Expanded(child: ListView.builder(
                itemCount: shoesItem.length,
                itemBuilder: (context, index) => productCard(shoesItem[index]),))
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: kToolbarHeight,
            child: Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  )),
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )),
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  )),
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                    ),
                  )),
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )),
                ],
              ),
            ))
      ],
    ));
  }
}
