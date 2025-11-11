///a
import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(home:HomeScreen(),debugShowCheckedModeBanner:false));

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:Text("Home Screen"),backgroundColor:Colors.purple),
    body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      Text("Welcome to Flutter Navigation!",style:TextStyle(color:Colors.purple,fontSize:18,fontWeight:FontWeight.bold)),
      SizedBox(height:20),
      ElevatedButton(
        child:Text("Go to Second Screen"),
        onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>SecondScreen())))
    ])),
  );
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:Text("Second Screen"),backgroundColor:Colors.teal),
    body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      Text("This is the Second Screen!",style:TextStyle(color:Colors.teal,fontSize:18,fontWeight:FontWeight.bold)),
      SizedBox(height:20),
      ElevatedButton(child:Text("Go Back"),onPressed:()=>Navigator.pop(c))
    ])),
  );
}
///b
import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  initialRoute:'/',
  routes:{
    '/':(c)=>Home(),
    '/second':(c)=>Second(),
    '/third':(c)=>Third(),
  },
  debugShowCheckedModeBanner:false,
));

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:Text("Home - Named Routes"),backgroundColor:Colors.purple[800]),
    body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      Text("Welcome to Named Routes!",style:TextStyle(color:Colors.purple,fontSize:18,fontWeight:FontWeight.bold)),
      SizedBox(height:15),
      ElevatedButton(child:Text("Go to Second Screen"),onPressed:()=>Navigator.pushNamed(c,'/second')),
      ElevatedButton(child:Text("Go to Third Screen"),onPressed:()=>Navigator.pushNamed(c,'/third'))
    ])),
  );
}

class Second extends StatelessWidget{
  @override
  Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:Text("Second Screen"),backgroundColor:Colors.orange),
    body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      Text("This is the Second Screen!",style:TextStyle(color:Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
      SizedBox(height:20),
      ElevatedButton(child:Text("Go Back"),onPressed:()=>Navigator.pop(c))
    ])),
  );
}

class Third extends StatelessWidget{
  @override
  Widget build(BuildContext c)=>Scaffold(
    appBar:AppBar(title:Text("Third Screen"),backgroundColor:Colors.blue),
    body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
      Text("This is the Third Screen!",style:TextStyle(color:Colors.blue,fontSize:18,fontWeight:FontWeight.bold)),
      SizedBox(height:20),
      ElevatedButton(child:Text("Go Back"),onPressed:()=>Navigator.pop(c))
    ])),
  );
}
