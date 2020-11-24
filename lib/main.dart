import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        //body: ProperForm(),
        body: FormDemo(),
      ),
    );
  }
}

class ProperForm extends StatefulWidget {
  ProperForm({Key key}) : super(key: key);

  @override
  _ProperFormState createState() => _ProperFormState();
}

class _ProperFormState extends State<ProperForm> {
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Form(
         key: _key,
         child: ListView(
         children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              icon: Icon(Icons.verified_user)
            ),
            validator: (String value) {
              if( value.isEmpty) {
                return 'Este campo no deberia estar vacio.';
              }
              return null;
            },
          ),
          RaisedButton( child: Text('Enviar'), onPressed: () {
            if(_key.currentState.validate()) {
            }
          })
         ],
        )),
    );
  }
}





class FormDemo extends StatefulWidget {
  FormDemo({Key key}) : super(key: key);

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {

  TextEditingController _controller = TextEditingController();
  var input = '';
  var _temperatureValueFrom = 'Celsius';
  var _temperatureValueTo = 'Farhenit';
  List<String> _temperatures = ['Celsius', 'Farhenit'];
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: [
           Text('Value'),
           TextField(
             controller: _controller,
             onChanged: (String value) {
               setState(() {
                 input = value;
               });
              
             },
           ),
           Text('From'),
           DropdownButton(
             isExpanded: true,
             value: _temperatureValueFrom,
             items: _temperatures.map((e) => DropdownMenuItem(
               value: e, child: Text(e)
             )).toList(), onChanged: (String value){
                setState(() {
                   _temperatureValueFrom = value;
                });
               
             }),
             Text('To'),
             DropdownButton(
               value: _temperatureValueTo,
               isExpanded: true,
               items: _temperatures.map((e) => DropdownMenuItem(
                 value: e, child: Text(e),
               )).toList(), 
               onChanged: (String value) {
                  setState(() {
                    _temperatureValueTo = value;
                  });
               }),
           RaisedButton(
             child: Text('Convert'),
             onPressed: () {
                setState(() {
                  //celcius to fare =
                  //ºF = (ºC · 1,8) + 32
                  var _resultCF = double.tryParse(input) * 1.8 + 32; 
                  input = 'El resultado es $_resultCF';
                });
             }),
            Text('${input}'),

         ]
       ),
    );
  }
}
