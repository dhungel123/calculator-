



import 'package:calculator_app/calculator_button.dart';
import 'package:calculator_app/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_expressions/math_expressions.dart';

import 'menu.dart';

class CalculatorScreen extends StatefulWidget {
  
  
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List<Menu> _buttonList =[];
  @override
  void initState() {
    super.initState();
    _buttonList =  [
      Menu(label: 'AC',color: CustomTheme.orangeColor,onPressed: (){
        expression = '';
        result = '';

      }),
      Menu(label: 'C',color: CustomTheme.orangeColor,onPressed: (){
        if(expression.isNotEmpty){
          expression = expression.substring(0,expression.length-1);
        }
      }),
      Menu(label: '%',color: CustomTheme.orangeColor),
      Menu(label: '/',color: CustomTheme.orangeColor),
      Menu(label: '7',color: CustomTheme.white),
      Menu(label: '8',color: CustomTheme.white),
      Menu(label: '9',color: CustomTheme.white),
      Menu(label: 'x',color: CustomTheme.orangeColor,onPressed: (){
        expression = expression+ '*';
      }),
      Menu(label: '4',color: CustomTheme.white),
      Menu(label: '5',color: CustomTheme.white),
      Menu(label: '6',color: CustomTheme.white),
      Menu(label: '-',color: CustomTheme.orangeColor),
      Menu(label: '1',color: CustomTheme.white),
      Menu(label: '2',color: CustomTheme.white),
      Menu(label: '3',color: CustomTheme.white),
      Menu(label: '+',color: CustomTheme.orangeColor),
      Menu(label: '0',color: CustomTheme.white),
      Menu(label: '.',color: CustomTheme.white),
      Menu(label: '=',color: CustomTheme.orangeColor,onPressed: (){
        if(expression.isNotEmpty){
          try{
            final parser = Parser();
            final parserExpression = parser.parse(expression);
            result = (parserExpression.evaluate(
              EvaluationType.REAL,
              ContextModel(),
            ) as num).toStringAsFixed(2);
            setState(() {

            });

          }catch (e){
            Fluttertoast.showToast(msg: 'Invalid format/Expression');
          }
        }

      }),
    ];

  }
  String expression = '';
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Text(result,
              //textAlign:TextAlign.end,
              maxLines:1,
              style: TextStyle(fontSize: 38,color: Colors.white,
            ),),
            alignment: Alignment.centerRight,
          ),
          Container(
            child: Text(expression,
              //textAlign:TextAlign.end,
              maxLines:1,
              style: TextStyle(fontSize: 32,color: Colors.white54,
              ),),
            alignment: Alignment.centerRight,
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _buttonList.length,
              itemBuilder:(context, index){
                return CalculatorButton(label: _buttonList[index].label,
                  textColor: _buttonList[index].color,
                  onPressed: (){
                  if(_buttonList[index].onPressed!=null ){
                    _buttonList[index].onPressed!();

                  }else{
                    expression = expression +_buttonList[index].label;

                  }
                  setState(() {

                  });
                  },

                );

              }
          ),
          // Row(
          //   children: [
          //     CalculatorButton(
          //       label: '=',
          //       onPressed: (){
          //
          //
          //       },
          //     )
          //
          //   ],
          // )

        ],
      )
    );
  }
}
