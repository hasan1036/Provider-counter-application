import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(MultiProvider(providers: [
//   ChangeNotifierProvider(create: (context)=>counter())
//   ], child: MyApp()));
// }

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>counter())
  ],child: MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',


      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        centerTitle: true,
        title: Column(

          children: [
            Text("Provider"),
          ],
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Count value is: ${context.watch<counter>().count}"),
             SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 FloatingActionButton(onPressed: (){
                   context.read<counter>().incrementCount();
                 }, child: Icon(Icons.add),),
                 SizedBox(width: 10),
                 FloatingActionButton(onPressed: (){
                   context.read<counter>().decrementCount();
                 }, child: Icon(Icons.remove),),
               ],
             )
           ],
        ),
      ),

    );
  }
}



class counter extends ChangeNotifier{
   var _count = 0;
   int get count => _count;


   void incrementCount(){
     _count++;
     notifyListeners();
   }

   void decrementCount(){
     _count--;
     notifyListeners();
   }



}