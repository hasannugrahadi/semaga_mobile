import 'package:flutter/material.dart';

Padding QuizPage(BuildContext context){
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(

        ),
        SizedBox(

        ),
        Wrap(
          children: [

          ],
        ),
        GestureDetector(
          child: SizedBox(

          ),
          onTap: (){
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context){
                return SizedBox(

                );
              }
            );
          },
        )
      ],
    ),
  );
}