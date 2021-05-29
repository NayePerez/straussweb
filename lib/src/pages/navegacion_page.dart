import 'package:flutter/material.dart';
import 'package:straussweb/src/pages/config_page.dart';
import 'package:straussweb/src/pages/help_page.dart';
import 'package:straussweb/src/pages/home_page.dart';
import 'package:straussweb/src/pages/mypost_page.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarPage(),
            Container(
              height: MediaQuery.of(context).size.height - 60,
            )
          ],
        ),
      ),
    );
  }
}

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  int _page = 0;
  Color _color1 = Colors.blue[900];
  Color _color2 = Colors.grey[500];
  Color _color3 = Colors.grey[500];
  Color _color4 = Colors.grey[500];
  Color _color11 = Colors.blue[900];
  Color _color22 = Colors.white;
  Color _color33 = Colors.white;
  Color _color44 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return appBarWeb();
        }
        if (constraints.maxWidth > 600) {
          return appBarWeb();
        } else {
          return appBarMobil();
        }
      },
    );
  }

  Widget appBarWeb() {
    appBarNavigatorWeb();
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
                          // appBarNavigator();
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
                          // appBarNavigator();
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
                          // appBarNavigator();
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
                          // appBarNavigator();
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
            _crearBotonLogin(context),
            SizedBox(
              width: 10,
            ),
            _crearBotonRegister(context)
          ],
        ),
      ),
    );
  }

  Widget appBarMobil() {
    appBarNavigatorMovil();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.black54)),
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Colors.blue[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                _menuPop()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    child: IconButton(
                        icon: Icon(Icons.home, size: 26, color: _color1),
                        onPressed: () {
                          setState(() {
                            _page = 0;
                            appBarNavigatorMovil();
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37),
                    child: Container(color: _color11, height: 6, width: 100),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    child: IconButton(
                        icon: Icon(Icons.person_pin_circle_rounded,
                            color: _color2, size: 26),
                        onPressed: () {
                          setState(() {
                            _page = 1;
                            appBarNavigatorMovil();
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37),
                    child: Container(color: _color22, height: 6, width: 100),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    child: IconButton(
                        icon: Icon(Icons.help_center_outlined,
                            color: _color3, size: 26),
                        onPressed: () {
                          setState(() {
                            _page = 2;
                            appBarNavigatorMovil();
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37),
                    child: Container(color: _color33, height: 6, width: 100),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    child: IconButton(
                        tooltip: 'Home',
                        icon: Icon(Icons.handyman_outlined,
                            color: _color4, size: 26),
                        onPressed: () {
                          setState(() {
                            _page = 3;
                            appBarNavigatorMovil();
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37),
                    child: Container(color: _color44, height: 6, width: 100),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  appBarNavigatorMovil() {
    switch (_page) {
      case 0:
        _color1 = Colors.blue[900];
        _color2 = Colors.grey[500];
        _color3 = Colors.grey[500];
        _color4 = Colors.grey[500];
        _color11 = Colors.blue[900];
        _color22 = Colors.white;
        _color33 = Colors.white;
        _color44 = Colors.white;

        return HomePage();
        break;
      case 1:
        _color1 = Colors.grey[500];
        _color2 = Colors.blue[900];
        _color3 = Colors.grey[500];
        _color4 = Colors.grey[500];
        _color11 = Colors.white;
        _color22 = Colors.blue[900];
        _color33 = Colors.white;
        _color44 = Colors.white;

        //return MyPostPage();
        break;
      case 2:
        _color1 = Colors.grey[500];
        _color2 = Colors.grey[500];
        _color3 = Colors.blue[900];
        _color4 = Colors.grey[500];
        _color11 = Colors.white;
        _color22 = Colors.white;
        _color33 = Colors.blue[900];
        _color44 = Colors.white;

        //return HelpPage();
        break;
      case 3:
        _color1 = Colors.grey[500];
        _color2 = Colors.grey[500];
        _color3 = Colors.grey[500];
        _color4 = Colors.blue[900];
        _color11 = Colors.white;
        _color22 = Colors.white;
        _color33 = Colors.white;
        _color44 = Colors.blue[900];

        // return ConfigPage();
        break;
      default:
      // return HomePage();
    }
  }

  appBarNavigatorWeb() {
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

        //return MyPostPage();
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

        //return HelpPage();
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

        // return ConfigPage();
        break;
      default:
      // return HomePage();
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

  Widget _crearBotonLogin(BuildContext context) {
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
          onPressed: () {
            Navigator.pushNamed(context, 'login');
          },
        ));
  }

  Widget _crearBotonRegister(BuildContext context) {
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
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
        ));
  }

  Widget _menuPop() {
    return PopupMenuButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onSelected: (selectedValue) {
          selectedValue
              ? Navigator.pushNamed(context, 'register')
              : Navigator.pushNamed(context, 'login');
        },
        itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(child: Text('Crear cuenta'), value: true),
              PopupMenuItem(child: Text('Inicar Sesión'), value: false),
            ]);
  }
}
