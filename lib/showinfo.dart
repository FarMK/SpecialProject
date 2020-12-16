import 'package:flutter/material.dart';
import 'main.dart';

class ShowInfo extends StatelessWidget {
  final String title;
  final String id;
  final String description;
  final num price;
  final String mainurl;
  final int length;
  final String url1;
  final String url2;
  final int amount;

  ShowInfo(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.mainurl,
      this.length,
      this.url1,
      this.url2,
      this.amount});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
          backgroundColor: Colors.blue[700],
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ),
          body: Container(
              child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: PageView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: Image.network(mainurl).image,
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: Image.network(url1).image,
                        fit: BoxFit.cover,
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: Image.network(url2).image,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                width: double.infinity,
                height: 250,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('id:$id', style: TextStyle(fontSize: 18)),
                      Text('Название модели: $title',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Описание:$description',
                          style: TextStyle(fontSize: 18)),
                      Text('Цена: $price\$', style: TextStyle(fontSize: 23)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateRequest(
                                amount: amount,
                                price: price,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  width: 120,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text('Купить', style: TextStyle(fontSize: 20)),
                ),
              )
            ],
          ))),
    );
  }
}

class CreateRequest extends StatefulWidget {
  final int amount;
  final num price;
  CreateRequest({this.amount, this.price});

  _CreateRequestState createState() =>
      _CreateRequestState(amount: amount, price: price);
}

class _CreateRequestState extends State {
  int amount;
  num price;
  _CreateRequestState({this.amount, this.price});

  int _count = 0;
  num result = 0;

  void counter(bool ispressed) {
    setState(() {
      if (ispressed) {
        if (_count < amount) {
          _count++;
        }
      }

      if (!ispressed) {
        if (_count > 1) {
          --_count;
        }
      }
    });
  }

  @override
  Widget build(BuildContext conext) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Оформление заказа', style: TextStyle(fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        counter(false);
                      },
                    ),
                    Text('$_count'),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        counter(true);
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestInfo(
                                  price: price,
                                  count: _count,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Подтвердить',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestInfo extends StatelessWidget {
  final num price;
  final int count;

  RequestInfo({this.count, this.price});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 250,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Ваш заказ оформлен', style: TextStyle(fontSize: 20)),
                Text('Общая стоимость: ${price * count}\$',
                    style: TextStyle(fontSize: 20)),
                Text('Спасибо за покупку!',
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Вернуться',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
