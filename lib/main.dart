import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHome(),
    );
  }
}

class MyHome extends StatelessWidget{
  MyHome({super.key});

  TextEditingController formController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Validation",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: formController,
                validator:(searchText) {
                  if(searchText == null || searchText.isEmpty){
                    return "This field is required";
                  }
                  if(searchText.length < 8){
                    return "Text length must be > 8 letters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                  ),
                  focusColor: Colors.blueGrey,
                  labelText: "Seach field",
                  hintText: "Seach any user"
                ),
              ),
            ),
            IconButton(onPressed: (){
              if(formKey.currentState!.validate()){
              }
            }, icon:Icon(Icons.search))
          ],
        ),
      ),
    );
  }

}