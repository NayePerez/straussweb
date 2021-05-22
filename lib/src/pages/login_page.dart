import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:straussweb/src/providers/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _animacionInicio = false;
  bool _sel = false;
  AuthProvider auth = AuthProvider.init();
  FirebaseAuth statusAuth = FirebaseAuth.instance;

  void _loadData() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _animacionInicio = true;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            _crearFondo(context),
            contenedor2(context),
            contenedor1(context),
          ],
        ),
      ),
    );
  }

  Widget contenedor1(BuildContext context) {
    return AnimatedPositioned(
        top: 150,
        left: _animacionInicio ? 500 : -1000,
        curve: Curves.decelerate,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                    spreadRadius: 10.0)
              ]),
          height: 600,
          width: 500,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Iniciar Sesión',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    'Correo electronico',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              _crearEmail(context),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              _crearContrasena(context),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _checkTerminos(context),
                  _crearOlvidasteContrasena(context),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Divider(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _crearBotonLogin(context),
                  _crearBotonGoogle(context),
                ],
              ),
            ],
          ),
        ),
        duration: Duration(milliseconds: 1000));
  }

  Widget contenedor2(BuildContext context) {
    return AnimatedPositioned(
        top: 70,
        right: _animacionInicio ? 250 : -1000,
        curve: Curves.decelerate,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[900],
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                      spreadRadius: 10.0)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/35eb7d5bce221d9392feb1e426ba48af.jpg',
                    fit: BoxFit.fill,
                    height: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(  vertical: 50),
                          child: Image.asset(
                            'assets/ima5.png',
                            fit: BoxFit.scaleDown,
                            width: 410,
                            
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text("Aliqua tempor reprehenderit ullamco irure ad cillum. Aliqua tempor reprehenderit ullamco irure ad cillum.  Aliqua tempor reprehenderit ullamco irure ad cillum.", style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                         child: _crearBotonRegistrar(context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            height: 800,
            width: 700),
        duration: Duration(milliseconds: 1000));
  }

  Widget _crearEmail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              color: Colors.blue[900],
            ),
            hintText: 'Email',
            hintStyle: TextStyle(fontStyle: FontStyle.italic)),
        onChanged: (value) {},
      ),
    );
  }

  Widget _crearContrasena(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            icon: Icon(
              Icons.vpn_key_rounded,
              color: Colors.blue[900],
            ),
            hintText: 'Password',
            hintStyle: TextStyle(fontStyle: FontStyle.italic)),
        onChanged: (value) {},
      ),
    );
  }

  Widget _crearBotonLogin(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.blue[900])),
      child: Container(
          width: 120, height: 50, child: Center(child: Text('LOGIN'))),
      onPressed: () {
        setState(() {
          auth.signOut();
        });
      },
    );
  }

  Widget _crearBotonGoogle(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.blue[900])),
      child: Container(
        width: 120,
        height: 50,
        child: Image.asset(
          'assets/googleicon.png',
          fit: BoxFit.contain,
          width: 20,
        ),
      ),
      onPressed: () {
        setState(() {
          auth.signInWithGoogle();
        });
      },
    );
  }

  Widget _crearOlvidasteContrasena(BuildContext context) {
    return TextButton(
      child: Text('¿Olvidaste tu contrseña?'),
      onPressed: () {},
    );
  }

  Widget _crearFondo(BuildContext context) {
    final circulo = Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200.0),
            color: Color.fromRGBO(30, 40, 83, 1)));

    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _animacionInicio ? 1 : 0,
      child: Stack(
        children: <Widget>[
          Positioned(top: 50.0, left: 30.0, child: circulo),
          Positioned(top: -30.0, right: -30.0, child: circulo),
          Positioned(bottom: -50.0, right: -10.0, child: circulo),
          Positioned(bottom: 0.0, right: 200.0, child: circulo),
          Positioned(bottom: -50.0, left: -20.0, child: circulo),
        ],
      ),
    );
  }

  Widget _crearBotonRegistrar(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.white)),
      child: Container(
          width: 150,
          child: Center(
              child: Text(
            'Crear Cuenta',
            style: TextStyle(fontSize: 18, color: Colors.blue[900]),
          ))),
      onPressed: () {
        setState(() {
          Navigator.pushNamed(context, 'register');
        });
      },
    );
  }

  Widget _checkTerminos(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.blue[900],
            checkColor: Colors.white,
            value: _sel,
            onChanged: (bool resp) {
              setState(() {
                _sel = resp;
              });
            },
          ),
          Text(
            'Recordarme',
          ),
        ],
      ),
    );
  }
}
