// 导入相关的控件
import 'package:flutter/material.dart';
import './font.dart';
import 'Homepage/homepage.dart';
import 'Homepage/livepage.dart';
import 'Homepage/singpage.dart';
import 'Homepage/myspage.dart';

// 入口函数
void main() {
  runApp(const MyApp());
}

// 此处为无状态控件
// flutter中分为有状态控件和无状态控件
// 无状态控件：StatelessWidget  如果一个控件内不需要自己的私有数据则可以声明为无状态控件  有状态控件：StateWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // build函数用来渲染控件的ui结构
    // 每个应用最外层必须要有materialapp属性
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '酷狗音乐',
      theme: ThemeData(
        //用于控制主题颜色
        primarySwatch: Colors.blue,
      ),
      // 通过home用来控制主页
      home: HomeNavigationPage(0),
      // 可以省略new
    );
  }
}

// ignore: must_be_immutable
class HomeNavigationPage extends StatefulWidget {
  HomeNavigationPage(this.currentIndex, {super.key});
  int currentIndex;

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
// ignore: non_constant_identifier_names
  final Screens = [const HomePage(), const LivePage(), const SingPage(), const MysPage(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: widget.currentIndex,
          children: Screens,
        ),
        bottomNavigationBar: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top:40),
                child: BottomNavigationBar(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black87,
                selectedItemColor: Colors.blue[200],
                currentIndex: widget.currentIndex,
                onTap: (index) => setState(() {
                  widget.currentIndex = index;
                }),
                items: [
                  BottomNavigationBarItem(icon: Icon(MYFont.erji), label: "首页"),
                  BottomNavigationBarItem(
                      icon: Icon(MYFont.bofang), label: "直播"),
                  BottomNavigationBarItem(
                      icon: Icon(MYFont.maikefeng), label: "唱玩"),
                  BottomNavigationBarItem(icon: Icon(MYFont.wode), label: "我的"),
                ],
              ),
              ),
              Positioned(
                top: 0,
                left: 6,
                child: Container(
      width: 380,
      height: 40,
      padding: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: const [
          Icon(Icons.album,size: 40,),
          SizedBox(width: 10),
          Text("酷狗音乐 就是歌多"),
          Spacer(),
          Icon(Icons.play_arrow),
          Icon(Icons.skip_next),
          Icon(Icons.format_indent_increase),
        ],
      ),
    ),
              ),
              
              
            
            ],
          ),
        );
  }
}
