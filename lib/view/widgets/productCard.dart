import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../model/shoesProduct.dart';

class productCard extends StatelessWidget {
  shoes prod;
  productCard(this.prod);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.3),
          ),
          height: 250,
          width: 250,
          child: GridTile(
              header: Hero(
                tag: '${prod.model}',
                child: Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    prod.model,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.shopping_cart)],
              ),
              child: Hero(
                  tag: '${prod.prodImages[0]}',
                  child: Image.asset(prod.prodImages[0],))),
        ),
      
    );
  }
}
