import 'package:flutter/material.dart';
import 'package:wynk_clone/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .12,),
              const Text('Settings',style: subHeading,),
              SizedBox(height: MediaQuery.of(context).size.height * .1,),
              listTile(context, 'Todo'),
              listTile(context, 'Todo'),
              listTile(context, 'Todo'),
              listTile(context, 'Todo'),
              listTile(context, 'Todo'),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(context,text){
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        child: Text('$text',style: optionsText,),
      ),
      onTap: (){

      },
    );
  }

}
