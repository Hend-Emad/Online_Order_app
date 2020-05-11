import 'package:com/Second%20Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD), body: ListView(children: <Widget>[
      //header
      Padding(padding: EdgeInsets.only(top: 15.0, left: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {},),
            Container(width: 125,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.filter_list),
                    color: Colors.white,
                    onPressed: () {},),
                  IconButton(icon: Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: () {},)
                ],),)
          ],),),
      SizedBox(height: 25.0,),
      Padding(padding: EdgeInsets.only(left: 40.0),
        child: Row(children: <Widget>[
          Text('Super Market', style: TextStyle(fontFamily: 'Montez',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25.0),),
          SizedBox(width: 5.0),
          Text('Products', style: TextStyle(fontFamily: 'Montez',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25.0),),
        ],),),
      SizedBox(height: 40.0,),
      Container(height: MediaQuery
          .of(context)
          .size
          .height - 185,
        decoration: BoxDecoration(color: Colors.white70,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),),
        child: ListView(primary: false,
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 45.0),
              child: Container(height: MediaQuery
                  .of(context)
                  .size
                  .height - 300,
                child: ListView(children: <Widget>[
                  _buildSupermarketItems(
                      'images/1.png', "Kitchen Tissues", "\$15"),
                  _buildSupermarketItems('images/2.png', "Indomie", "\$3"),
                  _buildSupermarketItems('images/88.png', "Soy-Sauce", "\$132"),
                  _buildSupermarketItems('images/4.png', "Crispy", "\$25"),
                  _buildSupermarketItems('images/5.png', "Cheese", "\$11"),
                  _buildSupermarketItems(
                      'images/6.png', "Cheese-Light", "\$15"),
                  _buildSupermarketItems('images/7.png', "Gersy", "\$10"),
                  _buildSupermarketItems('images/8.png', "Mandoline", "\$5"),
                  _buildSupermarketItems('images/9.png', "Cookies", "\$5"),
                  _buildSupermarketItems('images/10.png', "Milk", "\$16.5"),
                ],),),)
          ],),)
    ],),);
  }

  Widget _buildSupermarketItems(String Imgpath, String ProductName,
      String ProductPrice) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder:(context) =>SecondPage(Imgpath,ProductName,ProductPrice)
            ));
      },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
              Hero(
                tag: Imgpath,
                child: Image(image: AssetImage(Imgpath),
                  fit: BoxFit.cover,
                  height: 75.0,
                  width: 75.0,),
              ),
              SizedBox(width: 10.0,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(ProductName, style: TextStyle(
                      fontSize: 17.0, 
                      fontWeight: FontWeight.bold),
                  ),
                  Text(ProductPrice,
                    style: TextStyle(fontSize: 15.0,
                      color: Colors.blueGrey,),
                  )
                ],)
            ],
            ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}