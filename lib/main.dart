import 'package:blog_mobile/business/CreationCompte/CreationComptePageState.dart';
import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/framework/blogLocalServiceImpl.dart';
import 'package:blog_mobile/framework/blogNetworkServiceImpl.dart';
import 'package:blog_mobile/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';


var getIt = GetIt.instance;
void setup(){
  getIt.registerLazySingleton<BlogNetworkService>(() {
    return BlogNetworkServiceImpl();

  });
   getIt.registerLazySingleton<BlogLocalService>(() {
    return BlogLocalNetworkServiceImpl();

  });
}
void main() {
  setup();
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
      ),
      home: Creationcomptepage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
