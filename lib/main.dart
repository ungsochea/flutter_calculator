import 'package:flutter/material.dart';

void main(){
   
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App',
      home: SIForm(),
      )
  );

}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Riel','Dollars','Baht'];
  final _mininumPadding = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      
      body: Container(
        margin: EdgeInsets.all(_mininumPadding * 2),
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            
            Padding(
              padding: EdgeInsets.only(top: _mininumPadding, bottom: _mininumPadding ),
                child:  TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Priciple e.g. 1200',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                )
              ),

              Padding(
              padding: EdgeInsets.only(top: _mininumPadding, bottom: _mininumPadding ),
                child:  TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'In percent',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                )
              ),

              Row(
                children: <Widget>[
                  Expanded(child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'In percent',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                      )
                    ),
                  )),

                  Container(width: _mininumPadding *5,),

                  Expanded(child: DropdownButton<String>(
                    items: _currencies.map((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                    value: 'Riel',

                    onChanged: (String newValueSeleted){

                    },

                  ))
                
                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: _mininumPadding, bottom: _mininumPadding ),
                child: Row(
                children: <Widget>[

                  Expanded( 
                    child: RaisedButton(
                      child: Text('Calculate'),
                      onPressed: (){

                      },
                    ),
                  ),
                  Expanded( 
                    child: RaisedButton(
                      child: Text('Reset'),
                      onPressed: (){

                      },
                    ),
                  ),

                ],
              )), 

              Padding(
                padding: EdgeInsets.all(_mininumPadding * 2),
                child: Text("Todo Text"),
              )

          ],
        ),
      ),
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('images/exchange.png');
    Image image = Image(image: assetImage,width: 125.0,height: 125.0,);

    return Container(child: image,margin: EdgeInsets.all(_mininumPadding * 5));
  }
}

