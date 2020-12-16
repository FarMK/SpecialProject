import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/ExtendedPages.dart';
import 'package:hello/loginscreen.dart';

import 'showinfo.dart';
import 'package:hello/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.marmeladTextTheme(Theme.of(context).textTheme)),
      home: LoginScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          ListTile(
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExtendedPages(arr: kitchenItems)));
              },
              icon: Icon(Icons.dashboard),
            ),
            title: Text('Товары для кухни',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            //первый горизонтальный список
            width: double.infinity,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kitchenItems.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowInfo(
                                  title: kitchenItems[index].title,
                                  id: kitchenItems[index].id,
                                  price: kitchenItems[index].price,
                                  mainurl: kitchenItems[index].mainurl,
                                  description: kitchenItems[index].description,
                                  length: kitchenItems.length,
                                  url1: kitchenItems[index].url1,
                                  url2: kitchenItems[index].url2,
                                  amount: kitchenItems[index].amount,
                                )));
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: Image.network(
                                            kitchenItems[index].mainurl)
                                        .image,
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                '${kitchenItems[index].price}\$',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    ));
  }

  final List<Products> kitchenItems = [
    Products(
      id: 'p1',
      title: 'Посудомойка',
      description: 'Удобная посудомойка для кухни',
      price: 300,
      mainurl:
          'https://i.pinimg.com/564x/09/e6/06/09e606cec9ff08d40fb6b6f8648f98d7.jpg',
      url1:
          'https://i.pinimg.com/564x/2c/c6/ce/2cc6ce66e918fcf3c68d90bbbb5c34be.jpg',
      url2:
          'https://i.pinimg.com/564x/b2/0c/f9/b20cf936bfab966fc6203a039eaea061.jpg',
      amount: 32,
    ),
    Products(
      id: 'p2',
      title: 'Газовая плита',
      description: 'УПлита для кухни',
      price: 250,
      mainurl:
          'https://i.pinimg.com/564x/6c/fc/09/6cfc099bccdcc6642910e1f39363ddf3.jpg',
      url1:
          'https://i.pinimg.com/564x/ff/9a/51/ff9a51f1da6cac345cb59cb6756fda69.jpg',
      url2:
          'https://i.pinimg.com/564x/46/6b/de/466bde6c01050ec9b97a1fb50bf2bf30.jpg',
      amount: 20,
    ),
    Products(
      id: 'p3',
      title: 'Блендер',
      description: 'Мощный блендер для коктейлей',
      price: 100,
      mainurl:
          'https://i.pinimg.com/564x/b9/7b/45/b97b45bc0343327b14edc6212b185f4f.jpg',
      url1:
          'https://i.pinimg.com/236x/0c/f9/b5/0cf9b53dfe7cbf47138db303fde91d7e.jpg',
      url2:
          'https://i.pinimg.com/564x/4e/85/a8/4e85a8013dfbf67982d7efeebdc7251a.jpg',
      amount: 50,
    ),
    Products(
      id: 'p4',
      title: 'Холодильник',
      description: 'Вместиттельный и комфортабельный',
      price: 400,
      mainurl:
          'https://i.pinimg.com/564x/e9/88/90/e988904c674541c1165b3a1becce7768.jpg',
      url1:
          'https://i.pinimg.com/564x/e4/e1/8b/e4e18b4c77acef391e931390bdf0ea33.jpg',
      url2:
          'https://i.pinimg.com/236x/69/3c/99/693c99b1e76e3c99c3e8dc4fd9dbeaf8.jpg',
      amount: 20,
    ),
  ];
}
