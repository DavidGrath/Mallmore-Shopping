import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightBlue),
            padding: EdgeInsets.all(20),
            child: Text(
              "Use \"DAVGRTH\" Coupon to get 99% off",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.modulate),
                    child: Image(
                      image: AssetImage("images/shoes_pixabay_2.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Super Flash Sale\n50% Off",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          )),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Text(
                              "03",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            ":",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Text("37",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            ":",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Text("20",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
              // ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage("images/fashion_shoes_pixabay.jpg"),
                      width: MediaQuery.of(context).size.width,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text("80% Off Super Mega Sale",
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Happy Birthday",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
