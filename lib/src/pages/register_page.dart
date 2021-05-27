import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _sel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(children: [
        _contenedorLeft(),
        _containerRegister(context),
      ]),
    );
  }

  Align _contenedorLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 80, top: 80),
        child: Column(
          children: [
            Image.asset(
              'assets/icono1.png',
              width: 400,
            ),
            Text(
              'Bienvenido',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              child: Text(
                'Completa el resgistro de tu cuenta en poco tiempo y obten tu cuenta.',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              child: Container(
                  width: 120,
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(color: Colors.blue[900],fontSize: 20),
                  ))),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Align _containerRegister(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 246, 1),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250),
                topLeft: Radius.circular(250))),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Container(
         
          child: Column(
            children: [
              SizedBox(height: 60,),
              Text('Crea una cuenta',style: TextStyle(fontSize: 40),),
                SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _campoCorreo(context),
                        SizedBox(height: 60,),
                      _campoCorreo(context),
                        SizedBox(height: 60,),
                      _campoCorreo(context),
                        SizedBox(height: 60,),
                      _campoCorreo(context),
                    ],
                  ),
                  SizedBox(width: 50,),
                  Column(
                    children: [
                      _campoCorreo(context),
                        SizedBox(height: 60,),
                      _campoCorreo(context),
                        SizedBox(height: 60,),
                      _campoCorreo(context),
                        SizedBox(height: 60,),
                      _campoCorreo(context),
                    ],
                  )
                ],
              ),
                SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(right: 680),
                child: _checkTerminos(context),
              ),
                SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(left:680),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[900])),
                    child: Container(
                        width: 200,
                        child: Center(
                            child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkTerminos(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            // activeColor: azulOscuro(),
            checkColor: Colors.white,
            value: _sel,
            onChanged: (bool resp) {
              setState(() {
                _sel = resp;
              });
            },
          ),
          Text(
            'Acepto los',
          ),
          TextButton(
            child: Text(
              "Términos y Condiciones",
            ),
            onPressed: () {
              Navigator.pushNamed(context, "home");
            },
          ),
          Text(
            'de uso.',
          ),
        ],
      
    );
  }

  Widget _campoCorreo(BuildContext context) {
    return Container(
      width: 500,
      child: TextField(

        
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
         border: OutlineInputBorder(
          
        ),
          suffixIcon: Icon(
            Icons.email,
          ), // myIcon is a 48px-wide widget.

          hintText: 'correo_ejemplo@mail.com',
        ),
        onChanged: (v) {},
      ),
    );
  }

  Widget _campoFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        suffixIcon: Icon(
          Icons.calendar_today_outlined,
        ), // myIcon is a 48px-wide widget.

        hintText: 'mm/dd/yyyy',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }

  Widget _campoContrasena(BuildContext context) {
    return TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(),
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.only(),
            child: Icon(
              Icons.lock_outline,
            ), // myIcon is a 48px-wide widget.
          ),
          hintText: '*******',
        ));
  }
}
