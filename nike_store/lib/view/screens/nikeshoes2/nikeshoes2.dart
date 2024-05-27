import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nike_store/constants.dart';
import 'package:nike_store/view/screens/nikeshoes2/cartScreen.dart';
import '../../../model/shoesProduct.dart';
import 'package:nike_store/view/screens/nikeshoes2/nikeshoes2details.dart';
import 'package:vector_math/vector_math.dart' as vectoe;

class nikeshoesmain2 extends StatefulWidget {
  const nikeshoesmain2({super.key});

  @override
  State<nikeshoesmain2> createState() => _nikeshoesmain2State();
}

class _nikeshoesmain2State extends State<nikeshoesmain2> {
  PageController _pageController = PageController(viewportFraction: 0.75);

  double page = 0;
  int selected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        page = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('NIKE',style: GoogleFonts.akatab().copyWith(fontSize: 40,color: Colors.white),),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.linear);
                    },
                    child: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.subscriptions_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: topIcons,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: selected == 0 ? pageItems() : CartScreen()),
            bottomBar()
          ],
        ),
      ),
    );
  }

  PageView pageItems() {
    return PageView.builder(
      scrollBehavior: AppScrollBehavior(),
      controller: _pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        double perc = (page - index).abs();
        double factor = 1 - perc;

        return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ,
            child: Opacity(
                opacity: factor.clamp(0.6, 1), child: _itempageview(index)));
      },
    );
  }

  List<Widget> get topIcons {
    return [
      Text(
        'sport',
        style: constants().smallFontStyle.copyWith(color: Colors.white),
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        'club',
        style: constants().smallFontStyle.copyWith(color: Color.fromARGB(255, 26, 255, 0)),
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        'run',
        style: constants().smallFontStyle.copyWith(color: Colors.yellow),
      )
    ];
  }

  AnimatedContainer bottomBar() {
    return AnimatedContainer(
      height: kToolbarHeight,
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:  shoesItem[page.floor()].col),
      duration: Duration(milliseconds: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.person),
          InkWell(
            onTap: () {
              setState(() {
                selected = 0;
              });
            },
            child: selected == 0
                ? TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 400),

                  tween: Tween(begin: 0,end: 1),

                  builder:(context, value, child) =>Container(
                    padding: EdgeInsets.all(12*value),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                    
                    child: Icon(Icons.home)),
                )
                : Icon(Icons.person),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selected = 1;
              });
            },
            child: selected == 1
                ? TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 400),

                  tween: Tween(begin: 0,end: 1),

                  builder:(context, value, child) =>Container(
                    padding: EdgeInsets.all(12*value),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                    
                    child: Icon(Icons.shopping_cart)),
                )
                : Icon(Icons.shopping_cart),
          )
        ],
      ),
    );
  }
}

class _itempageview extends StatelessWidget {
  int index;
  _itempageview(this.index);

  @override
  Widget build(BuildContext context) {
    shoes item = shoesItem[index];
    return LayoutBuilder(
      builder: (context, constrain) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: shoesItem[index].col,
          ),
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    children: [
                      Text(
                        item.model,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "${item.currentPrice}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  )),
              Positioned(
                top: constrain.maxHeight * 0.3,
                child: Hero(
                  tag: '$index txt',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "N I K E",
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 30,
                          fontStyle: FontStyle.italic),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: -50,
                  top: constrain.maxHeight * 0.3,
                  child: Transform.rotate(
                      angle: vectoe.radians(-45),
                      child: Hero(
                        flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                if(flightDirection==HeroFlightDirection.pop)
                {
                  return Container();
                }
                return fromHeroContext.widget;
              },
                          tag: '$index pic',
                          child: Image.asset(item.prodImages[1])))),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return FadeTransition(
                                opacity: animation,
                                child: nikeshoes2details(index),
                              );
                            },
                          ));
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}



class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}