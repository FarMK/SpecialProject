import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/ExtendedPages.dart';
import 'package:hello/authServices.dart';
import 'package:hello/loginscreen.dart';
import 'package:hello/user.dart';
import 'package:provider/provider.dart';

import 'landing.dart';
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
    return StreamProvider.value(
      value: AuthServices().currentUser,
      child: MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.marmeladTextTheme(Theme.of(context).textTheme)),
        home: Landing(),
      ),
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
          Container(
            padding: EdgeInsets.only(left: 2),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.logout, color: Colors.black),
                    onPressed: () {
                      AuthServices().logOut();
                    })
              ],
            ),
          ),
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
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                                  image:
                                      Image.network(kitchenItems[index].mainurl)
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
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExtendedPages(arr: _bathroomItems)));
              },
              icon: Icon(Icons.dashboard),
            ),
            title: Text('Товары для ванной',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            //Второй горизонтальный список
            width: double.infinity,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _bathroomItems.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowInfo(
                                  title: _bathroomItems[index].title,
                                  id: _bathroomItems[index].id,
                                  price: _bathroomItems[index].price,
                                  mainurl: _bathroomItems[index].mainurl,
                                  description:
                                      _bathroomItems[index].description,
                                  length: _bathroomItems.length,
                                  url1: _bathroomItems[index].url1,
                                  url2: _bathroomItems[index].url2,
                                  amount: _bathroomItems[index].amount,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
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
                                          _bathroomItems[index].mainurl)
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
                              '${_bathroomItems[index].price}\$',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExtendedPages(arr: _bedroomItems)));
              },
              icon: Icon(Icons.dashboard),
            ),
            title: Text('Товары для спальни',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            //Третий горизонтальный список
            width: double.infinity,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _bedroomItems.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowInfo(
                                  title: _bedroomItems[index].title,
                                  id: _bedroomItems[index].id,
                                  price: _bedroomItems[index].price,
                                  mainurl: _bedroomItems[index].mainurl,
                                  description: _bedroomItems[index].description,
                                  length: _bedroomItems.length,
                                  url1: _bedroomItems[index].url1,
                                  url2: _bedroomItems[index].url2,
                                  amount: _bedroomItems[index].amount,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 200,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.red[700],
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
                                          _bathroomItems[index].mainurl)
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
                              '${_bathroomItems[index].price}\$',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  //товары для кухни
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

  //товары для ванной
  List<Products> _bathroomItems = [
    Products(
      id: 'b1',
      title: 'Душевая кабинка',
      description: 'Просторная и удобная',
      price: 300,
      mainurl:
          'https://i.pinimg.com/564x/e1/3a/8a/e13a8a5e6967a77d11196e9bd3ce7724.jpg',
      url1:
          'https://i.pinimg.com/564x/68/96/47/68964729b7f2d96aff272eb915fbf1e0.jpg',
      url2:
          'https://i.pinimg.com/564x/3a/ac/43/3aac43df0204339330cc62b990680590.jpg',
      amount: 30,
    ),
    Products(
      id: 'b2',
      title: 'Стиральная машина',
      description: 'Компактная и стильная',
      price: 250,
      mainurl:
          'https://i.pinimg.com/564x/e4/19/f7/e419f79ac30c70f88af18a08f1669f1d.jpg',
      url1:
          'https://i.pinimg.com/564x/75/9d/39/759d3917150696eb98d19375c07b6cdc.jpg',
      url2:
          'https://i.pinimg.com/564x/29/48/73/2948732a615d1264549305f6040919e3.jpg',
      amount: 30,
    ),
    Products(
      id: 'b3',
      title: 'Раковина',
      description: 'Вместительная и современная',
      price: 150,
      mainurl:
          'https://i.pinimg.com/564x/23/36/6e/23366e99b91efb516a3dbb6773859b77.jpg',
      url1:
          'https://i.pinimg.com/236x/71/da/61/71da613d06ae5cce802b52576efc8385.jpg',
      url2:
          'https://i.pinimg.com/564x/e2/31/ea/e231eaed868564f351767e7daa8a6e72.jpg',
      amount: 15,
    ),
    Products(
      id: 'b4',
      title: 'Унитаз',
      description: 'Удобный и не булькает',
      price: 150,
      mainurl:
          'https://i.pinimg.com/236x/df/99/2f/df992ff99e26db2aea515d656d3772dc.jpg',
      url1:
          'https://i.pinimg.com/564x/2c/eb/5e/2ceb5eb7583102ebae246c36b6a5f358.jpg',
      url2:
          'https://i.pinimg.com/564x/a8/ca/d4/a8cad4d6cd39487306d51f357711f7bb.jpg',
      amount: 15,
    ),
  ];

  //Товары для спальни
  List<Products> _bedroomItems = [
    Products(
      id: 'h1',
      title: 'Кровать',
      description: 'Удобная и большая',
      price: 300,
      mainurl:
          'https://i.pinimg.com/564x/40/62/05/4062056ae4370d4d20994ce35fdf6ab1.jpg',
      url1:
          'https://i.pinimg.com/564x/ec/8a/4c/ec8a4c6b438fffc83b925cbee2e4132d.jpg',
      url2:
          'https://i.pinimg.com/564x/32/7c/24/327c243b98b1faa32cf94bfd9f136004.jpg',
      amount: 15,
    ),
    Products(
      id: 'h2',
      title: 'Пуфик',
      description: 'Компактный и мягкий',
      price: 50,
      mainurl:
          'https://i.pinimg.com/564x/0d/5b/f0/0d5bf01b5bf2456cea3f52a28b834537.jpg',
      url1:
          'https://i.pinimg.com/564x/dc/64/d6/dc64d67d55510feda51d74e60ae4134f.jpg',
      url2:
          'https://i.pinimg.com/564x/97/87/c9/9787c9b16ae0671a582a7fa706b72a86.jpg',
      amount: 40,
    ),
    Products(
      id: 'h3',
      title: 'Тумба',
      description: 'Вместительная и стильная',
      price: 100,
      mainurl:
          'https://i.pinimg.com/564x/20/27/41/2027414bbbc862aaba9e9c4d454c0191.jpg',
      url1:
          'https://i.pinimg.com/564x/70/68/fb/7068fb66199dcc8d53eaab4a966e6d6d.jpg',
      url2:
          'https://i.pinimg.com/564x/56/ad/1e/56ad1e6437aa16bbe1e92ac12a6c12ad.jpg',
      amount: 40,
    ),
    Products(
      id: 'h4',
      title: 'Торшер',
      description: 'Яркий и с приятным освещением',
      price: 30,
      mainurl:
          'https://i.pinimg.com/564x/34/b1/77/34b177dcdeca0537350f4222af1d68b6.jpg',
      url1:
          'https://i.pinimg.com/564x/d3/1d/f5/d31df518dd3d06cd852877f6d74f9d59.jpg',
      url2:
          'https://i.pinimg.com/236x/a6/2a/ef/a62aef27dec749076cb387ae2f5bb9c4.jpg',
      amount: 40,
    ),
  ];
}
