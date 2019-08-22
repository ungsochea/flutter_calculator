import 'package:flutter/material.dart';

void main(){
   
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App',
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent
      ),
      )
  );

}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Riel','Dollars','Baht'];
  final double _mininumPadding = 5.0;
  var _currentItemSelected = '';

  @override
  void initState(){
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

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
                  style: textStyle,
                  controller: principalController,
                  decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Priciple e.g. 1200',
                    labelStyle: textStyle,
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
                  style: textStyle,
                  controller: roiController,
                  decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'In percent',
                    labelStyle: textStyle,
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
                    style: textStyle,
                    controller: termController,
                    decoration: InputDecoration(
                      labelText: 'Term',
                      hintText: 'Time in year',
                      labelStyle: textStyle,
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

                    value: _currentItemSelected,

                    onChanged: (String newValueSeleted){
                      _onDropDownItemSelected(newValueSeleted);
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
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text('Calculate',textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          this.displayResult = _calculateTotalReturns();
                        });
                      },
                    ),
                  ),
                  Expanded( 
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Reset',style: textStyle,textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  ),

                ],
              )), 

              Padding(
                padding: EdgeInsets.all(_mininumPadding * 2),
                child: Text(this.displayResult,style: textStyle,),
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
  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
  String _calculateTotalReturns(){
    double princiapl = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = princiapl + (princiapl * roi * term)/100;
    String result = 'After $term year, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }
  void _reset(){
    principalController.text ='';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}

