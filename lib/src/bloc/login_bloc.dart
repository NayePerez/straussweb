import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:straussweb/src/bloc/validators.dart';
class LoginBloc with Validators {


  final _nameController = BehaviorSubject<String>();
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _dateController = BehaviorSubject<String>();
  final _pageController = BehaviorSubject<String>();


  // Recuperar los datos del Stream
  Stream<String> get nameStream     => _nameController.stream.transform( validarName );
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
  Stream<String> get dateStream => _dateController.transform( validarDate );
  Stream<String> get pageStream => _pageController.stream;

  Stream<bool> get formValidStream => Rx.combineLatest4(nameStream ,emailStream, passwordStream, dateStream, (n , e, p, d) => true );
  Stream<bool> get formValidStreamLogin => Rx.combineLatest2(emailStream, passwordStream, (e, p) => true );


  // Insertar valores al Stream
   Function(String) get changeName    => _nameController.sink.add;
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeDate => _dateController.sink.add;
  Function(String) get changePage => _pageController.sink.add;


  // Obtener el último valor ingresado a los streams
   String get name    => _nameController.value;
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get date => _dateController.value;
  String get page => _pageController.value;

  dispose() {
     _pageController?.close();
    _nameController?.close();
    _emailController?.close();
    _passwordController?.close();
    _dateController?.close();
  }

}

