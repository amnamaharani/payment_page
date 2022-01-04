import 'package:flutter/material.dart';
import 'package:payment_page/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top:8.0, left: 32, right: 32 ),
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/icon_one.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                SizedBox(width: 6,),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                ),
              ],
            ),
            SizedBox(height: 16,),
            Text(
              'Go unlock all features and \n build your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget option(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selectedIndex == index
                    ? Color(0xff007DFF)
                    : Color(0xff4D587C),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selectedIndex == index
                  ? Image.asset(
                      'assets/images/check_one.png',
                      width: 18,
                      height: 18,
                    )
                  : Image.asset(
                      'assets/images/check.png',
                      width: 18,
                      height: 18,
                    ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: planTextStyle,
                  ),
                  Text(
                    subTitle,
                    style: descTextStyle,
                  ),
                ],
              ),
              SizedBox(width: 91,),
              Text(
                pricing,
                style: priceTextStyle,
              ),
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff007DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                option(0,'Monthly', 'Good for starting up', '\$20'),
                option(1,'Quarterly', 'Focusing on building', '\$55'),
                option(2, 'Yearly', 'Steady company', '\$220'),
                SizedBox(height: 20,),
                selectedIndex == -1 ? SizedBox() : checkoutButton(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}