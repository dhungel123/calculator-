import 'package:flutter/material.dart';

class SliderExampleScreen extends StatefulWidget{
  const SliderExampleScreen({super.key});
  @override
  State<SliderExampleScreen> createState() =>_SliderExampleScreenState();


}
class _SliderExampleScreenState extends State<SliderExampleScreen>{
  double sliderValue = 0;
  @override
  Widget build( BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider app'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.lerp(EdgeInsets.zero, EdgeInsets.only(bottom:150),sliderValue),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Color.lerp(Colors.red, Colors.black, sliderValue),
                  borderRadius: BorderRadius.lerp(BorderRadius.circular(0) , BorderRadius.circular(100), sliderValue)
              )
            ),
            SizedBox(
              height: 20,
            ),
            Slider(
                value: sliderValue,
                onChanged: (value){
                  sliderValue= value;
                  print(value);
                  setState(() {});

            }),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),

    );
  }

}