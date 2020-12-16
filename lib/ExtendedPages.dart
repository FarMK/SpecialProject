import 'package:flutter/material.dart';
import 'package:hello/products.dart';
import 'package:hello/showinfo.dart';

class ExtendedPages extends StatelessWidget {
  final List<Products> arr;

  ExtendedPages({this.arr});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              }),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView.builder(
            itemCount: arr.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowInfo(
                                title: arr[index].title,
                                id: arr[index].id,
                                price: arr[index].price,
                                mainurl: arr[index].mainurl,
                                description: arr[index].description,
                                length: arr.length,
                                url1: arr[index].url1,
                                url2: arr[index].url2,
                                amount: arr[index].amount,
                              )));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 40),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: Image.network(arr[index].mainurl).image,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Название модели: ${arr[index].title}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20),
                              Text('Цена: ${arr[index].price}\$',
                                  style: TextStyle(fontSize: 23)),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
