import 'package:flutter/material.dart';
class SecondPage extends StatefulWidget {
  final HeroTag;
  final ProductName;
  final ProductPrice;
  SecondPage(this.HeroTag , this.ProductName , this.ProductPrice);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var selectedCard = 'weight' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed:(){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
            style: TextStyle(
              fontFamily: 'Montez',
              fontSize: 18.0,
              color: Colors.white
            ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: (){},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children:[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height-82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white
                  ),
                  height: MediaQuery.of(context).size.height-100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left:(MediaQuery.of(context).size.width/ 2)-100,
                child: Hero(
                  tag: widget.HeroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.HeroTag),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                height: 200,
                width: 200,
              ),
              Positioned(
                top: 250.0,left: 25.0,right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.ProductName,
                      style: TextStyle(
                        fontSize: 22.0,fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.ProductPrice,
                          style: TextStyle(fontSize: 20.0,color: Colors.grey),
                        ),
                        Container(height:25.0,width: 1.0,color: Colors.grey),
                        Container(width: 125.0,height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Color(0xFF7A9BEE),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: (){},
                                child: Container(height: 25.0,width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF7A9BEE),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                             Text('0',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12.0,
                               ),
                             ),
                              InkWell(
                                onTap: (){},
                                child: Container(height: 25.0,width: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Color(0xFF7A9BEE),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _buildInfoCard('excellant(quality)', '1'),
                          SizedBox(width: 10.0,),
                          _buildInfoCard('high(quality)', '2'),
                          SizedBox(width: 10.0,),
                          _buildInfoCard('very-good(quality)', '3'),
                          SizedBox(width: 10.0,),
                          _buildInfoCard('good(quality)', '4'),
                          SizedBox(width: 10.0,),
                          _buildInfoCard('low(quality)', '5'),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]
      ),
    );
  }
  Widget _buildInfoCard (String CardTitle,String Info){
    return InkWell(
        onTap:(){
          selectCard(CardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CardTitle ==selectedCard? Color(0xFF7A9BEE):Colors.white,
                border: Border.all(
                  color:CardTitle==selectedCard? Colors.transparent:Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75,
                )
            ),
            height: 100,width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  CardTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: CardTitle == selectedCard? Colors.white:Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15.0 , bottom: 8.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Info,
                          style: TextStyle(
                            fontSize: 12,
                            color: CardTitle == selectedCard? Colors.white:Colors.black,
                          ),
                        ),
                      ],
                    )
                ),
              ],
            )
        )
    );
  }
  selectCard(CardTitle){
    setState(() {
      selectedCard=CardTitle;
    });
  }

}
