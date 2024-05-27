import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:nike_store/conroller/cart.dart';
import 'package:nike_store/model/shoesProduct.dart';
import 'package:nike_store/view/widgets/productCard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ScrollController _scrollController = ScrollController();
  ValueNotifier<bool> isScrooling = ValueNotifier(false);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _items = Provider.of<cart>(context).cartItems;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: _items.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Draggable(
                    data: shoesItem[index],
                    feedback: Transform.scale(
                      scale: 0.5,
                      child: Image.asset(_items[index].prodImages[0])),
                    child: productCard(_items[index]));
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child:
                          Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Delete',
                              style: GoogleFonts.aBeeZee(fontSize: 20),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(child: Transform.scale(
                              scale: 2,
                              child: DragTarget<shoes>(
                                
                                 onAccept: (data) {
                        Provider.of<cart>(context, listen: false)
                            .deleteFromCart(data);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("Item Deleted"),));
                      },
                                builder:(context, candidateData, rejectedData) =>  Lottie.network('https://assets9.lottiefiles.com/packages/lf20_5ruqbW/Delete.json',))))
                          ],
                        ),
                      ),
                    ),
                ],
              ))
        ],
      ),
    );
  }
}
