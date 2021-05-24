import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/config_page.dart';
import 'package:straussweb/src/pages/help_page.dart';
import 'package:straussweb/src/pages/home_page.dart';
import 'package:straussweb/src/pages/mypost_page.dart';

class NavegacionPage extends StatefulWidget {
  @override
  _NavegacionPageState createState() => _NavegacionPageState();
}

class _NavegacionPageState extends State<NavegacionPage> {
  int _page = 0;
  Color _color1 = Color.fromRGBO(16, 30, 90, 1);
  Color _color2 = Colors.white;
  Color _color3 = Colors.white;
  Color _color4 = Colors.white;
  Color _color11 = Color.fromRGBO(16, 30, 90, 1);
  Color _color22 = Colors.blue[900];
  Color _color33 = Colors.blue[900];
  Color _color44 = Colors.blue[900];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            appBar(),
            Container(
              height: MediaQuery.of(context).size.height - 60,
              child: appBarNavigator(),
            )
            // appBarNavigator()
          ],
        ),
      
    );
  }

  Widget appBar() {
    return Container(
      
      decoration: BoxDecoration(
          color: Colors.blue[900], border: Border.all(color: Colors.black54)),
      height: 60,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/ima7.png',
                height: 45,
              ),
            ),
            Container(
              height: 40,
              width: 250,
              child: _buscarGrupos(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.22,
            ),
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: IconButton(
                      icon: Icon(Icons.home, size: 30, color: _color1),
                      onPressed: () {
                        setState(() {
                          _page = 0;
                          appBarNavigator();
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(color: _color11, height: 6, width: 100),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: IconButton(
                      icon: Icon(Icons.person_pin_circle_rounded,
                          color: _color2, size: 30),
                      onPressed: () {
                        setState(() {
                          _page = 1;
                          appBarNavigator();
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(color: _color22, height: 6, width: 100),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: IconButton(
                      icon: Icon(Icons.help_center_outlined,
                          color: _color3, size: 30),
                      onPressed: () {
                        setState(() {
                          _page = 2;
                          appBarNavigator();
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(color: _color33, height: 6, width: 100),
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: IconButton(
                      tooltip: 'Home',
                      icon: Icon(Icons.handyman_outlined,
                          color: _color4, size: 30),
                      onPressed: () {
                        setState(() {
                          _page = 3;
                          appBarNavigator();
                        });
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(color: _color44, height: 6, width: 100),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
            ),
            _crearBotonLogin(),
            SizedBox(
              width: 10,
            ),
            _crearBotonRegister()
          ],
        ),
      ),
    );
  }

  appBarNavigator() {
    switch (_page) {
      case 0:
        _color1 = Color.fromRGBO(16, 30, 90, 1);
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Color.fromRGBO(16, 30, 90, 1);
        _color22 = Colors.blue[900];
        _color33 = Colors.blue[900];
        _color44 = Colors.blue[900];
        return HomePage();
        break;
      case 1:
        _color1 = Colors.white;
        _color2 = Color.fromRGBO(16, 30, 90, 1);
        _color3 = Colors.white;
        _color4 = Colors.white;
        _color11 = Colors.blue[900];
        _color22 = Color.fromRGBO(16, 30, 90, 1);
        _color33 = Colors.blue[900];
        _color44 = Colors.blue[900];
        return MyPostPage();
        break;
      case 2:
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Color.fromRGBO(16, 30, 90, 1);
        _color4 = Colors.white;
        _color11 = Colors.blue[900];
        _color22 = Colors.blue[900];
        _color33 = Color.fromRGBO(16, 30, 90, 1);
        _color44 = Colors.blue[900];
        return HelpPage();
        break;
      case 3:
        _color1 = Colors.white;
        _color2 = Colors.white;
        _color3 = Colors.white;
        _color4 = Color.fromRGBO(16, 30, 90, 1);
        _color11 = Colors.blue[900];
        _color22 = Colors.blue[900];
        _color33 = Colors.blue[900];
        _color44 = Color.fromRGBO(16, 30, 90, 1);
        return ConfigPage();
        break;
      default:
        return HomePage();
    }
  }

  Widget _buscarGrupos() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
      onTap: () {},
    );
  }

  Widget _crearBotonLogin() {
    return Container(
        height: 30,
        width: 120,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          child: Center(
            child: Text(
              'Ingresar',
              style: TextStyle(color: Colors.blue[900]),
            ),
          ),
          onPressed: () {},
        ));
  }

  Widget _crearBotonRegister() {
    return Container(
        height: 30,
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(16, 30, 90, 1))),
          child: Center(
            child: Text('Crear cuenta'),
          ),
          onPressed: () {},
        ));
  }
}
