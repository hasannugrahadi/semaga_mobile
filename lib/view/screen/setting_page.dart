import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Padding SettingBody(String name, String nis, BuildContext context){
  return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ''
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      ''
                    ),
                    Text(
                      ''
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(

          ),
          TextButton(
            child: Text('send again'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontStyle: FontStyle.italic
              ),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
          Divider(

          ),
          TextButton(
            child: Text('send again'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontStyle: FontStyle.italic
              ),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
          Divider(

          ),
          TextButton(
            child: Text('send again'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontStyle: FontStyle.italic
              ),
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
        ],
      ),
  );
}
