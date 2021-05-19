import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _animacionInicio = false;
  bool _sel = false;
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              _crearEmail(context),
              SizedBox(
                height: 30,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/ima5.png',
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'La mejor forma de organizar tu repertorio con tu grupo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _crearBotonRegistrar(context),
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
          width: 120, height: 50, child: Center(child: Text('Login'))),
      onPressed: () {
        setState(() {});
      },
    );
  }

  Widget _crearBotonGoogle(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) =>Colors.blue[900])),
      child: Container(
        width: 120,
        height: 50,
        child: Image.asset(
          'assets/googleicon.png',
          fit: BoxFit.contain,
          width: 20,
        ),
      ),
      onPressed: () {},
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
            color: Colors.deepPurple[700]));

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
        setState(() {});
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
