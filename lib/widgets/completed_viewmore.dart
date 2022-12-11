import 'package:flutter/material.dart';

class CompletedViewMore extends StatelessWidget {

  final String firstText;
  final String lastText;
  const CompletedViewMore({Key? key, required this.firstText, required this.lastText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only( right: 10,),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                firstText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              InkWell(
                onTap: (){},
                child:  Text(
                  lastText,
                  style: const TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ],
      ),

    );
  }
}
