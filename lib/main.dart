import 'package:flutter/material.dart';

import 'services/convercion.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  final exprecioncontroller = TextEditingController();
  String? cadena;
  bool? iscorrecto;
  @override
  Widget build(BuildContext context) {
    Convercion c = Convercion();
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("a*(b + ca*)"),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Introduce la expresion',
                    border: OutlineInputBorder(),
                  ),
                  controller: exprecioncontroller,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Introduce la cadena',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => cadena = value,
                ),
                if (iscorrecto != null)
                  Text(iscorrecto! ? 'Correcto' : 'Incorrecto'),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    c.exprecion = exprecioncontroller.text;
                    iscorrecto = c.comprobarcadena(cadena!);
                    setState(() {});
                  },
                  child: const Text('Comprobar cadena'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
