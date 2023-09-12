// /// Provider的局部刷新
// /// 上次的通用版本在数值改变的时候会触发整个Provider包裹的builder函数
// // (可以使用child进行渲染UI，用法可以查看第一篇文章https://blog.csdn.net/Mr_Tony/article/details/111414413)，
// // 在性能上会有一点问题
// /// 通过Provider提供的局部刷新功能可以减少这个性能损耗，简单示例代码如下:import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';void main() => runApp(MyApp());class Count with ChangeNotifier {int _count = 1;int _age = 1;int get count => _count;int get age => _age;void increment() {_count++;notifyListeners();}void incrementAge() {_age++;notifyListeners();}
// }class MyApp extends StatelessWidget {@overrideWidget build(BuildContext context) {return MaterialApp(title: 'Material App',home: Scaffold(appBar: AppBar(title: Text('Material App Bar'),),body: Center(child: Container(child: Home(),),),),);}
// }class Home extends StatelessWidget {@overrideWidget build(BuildContext context) {return ChangeNotifierProvider<Count>(create: (_) => Count(),builder: (context, child) {print('YM---->重新build');return Column(children: [Selector<Count,int>(//两个对象对应输入(Count)和输出(int)builder: (context,count,int){//这个count是selector中返回的数据print('build111111');return Text('数值:$count');},selector: (_,count){return count.count;},),RaisedButton(onPressed: () {context.read<Count>().increment();// context.read<Count>().incrementAge();},child: Text('计数'),),Selector<Count,int>(builder: (context,count,int){print('build22222222');return Text('数值age:$count');},selector: (_,count){return count.age;},),RaisedButton(onPressed: () {context.read<Count>().incrementAge();},child: Text('计数age'),),],);},);}
