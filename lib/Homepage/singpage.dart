import 'package:flutter/material.dart';
import './topshow.dart';
import 'package:flutter_application_1/font.dart';

class SingPage extends StatefulWidget {
  const SingPage({super.key});
  @override
  State<SingPage> createState() => _SingPageState();
}

class _SingPageState extends State<SingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: TabBar(
              isScrollable: true,
              indicatorWeight: 0.5,
              indicator: const CustomTabIndicator(
                width: 10,
                borderSide: BorderSide(width: 1.0, color: Colors.blue),
              ),
              labelStyle: const TextStyle(
                fontSize: 18,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 12,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs: const [
                Tab(
                  child: Text("唱歌"),
                ),
                Tab(
                  child: Text("玩游戏"),
                ),
              ]),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                print('右侧的按钮图标');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.date_range,
                color: Colors.black,
              ),
              onPressed: () {
                print('右侧的按钮图标');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                print('右侧的按钮图标');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                print('右侧的按钮图标');
              },
            ),
          ],
        ),

        body: TabBarView(
          controller: _tabController,
          children: [
           ListView(
            children: [
              Column(
                  children: const [
                     CentersingBar(),
                     CenselectBar(),
                     SingLiveBar(),
                  ],

              )
            ],

           )
          ]
          ),
    );
  }
    }

    //对唱按钮部分
    class CentersingBar extends StatelessWidget {
  const CentersingBar({
    super.key,
  });

  Widget build(BuildContext context) {
       return Container(
        margin: const EdgeInsets.only(top:10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                  width: 195,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 173, 168),
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("我要唱",style: TextStyle(fontSize: 16),),
                            Text("千万曲库任唱",style: TextStyle(color: Colors.grey,fontSize: 12),)
                          ],
                        ),
                        const Icon(MYFont.maikefeng,size:60.0,color: Color.fromARGB(255, 238, 101, 91),),
                      ],
                    )
            ),
            Container(
                  width: 175,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 188, 203, 241),
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("高潮对唱",style: TextStyle(fontSize: 16),),
                            Text("1v1 连麦 PK",style: TextStyle(color: Colors.grey,fontSize: 12),)
                          ],
                        ),
                        const Icon(Icons.workspace_premium,size:60.0,color: Color.fromARGB(255, 111, 181, 239),),
                      ],
                    )
            ),
          ],
        ),
       );
  }
  }

  //中间选项部分
  class CenselectBar extends StatelessWidget {
  const CenselectBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Stack(
        children: [
          TabBar(
            isScrollable: true,
            indicatorWeight: 0.1,
            indicatorPadding: const EdgeInsets.all(5),
            indicator: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              
              Tab(
                child: Text(
                  "最近",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            
              Tab(
                child: Text(
                  "推荐",
                  style: TextStyle(fontSize: 12),
                ),
              ),
             
              Tab(
                child: Text(
                  "交友",
                  style: TextStyle(fontSize: 12),
                ),
              ),
           
              Tab(
                child: Text(
                  "斗歌",
                  style: TextStyle(fontSize: 12),
                ),
              ),
             
              Tab(
                child: Text(
                  "抢麦",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            
              Tab(
                child: Text(
                  "附近",
                  style: TextStyle(fontSize: 12),
                ),
              ),
               Tab(
                child: Text(
                  "搞笑",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              
            ],
          ),
          Positioned(
            right: 0,
            bottom: 7,
            child:  Container(
      width: 72,
      height: 35,
      padding: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        // ignore: prefer_const_constructors
        border:  Border.all(
          color: Colors.blue,
          width: 2,
        )
      ),
      child: Row(
        children: const [
          Icon(Icons.home,size: 14,color: Colors.blue,),
          Text("我的K房", style: TextStyle(fontSize: 12,color: Colors.blue),)
        ],
      ),
    ),
          ),
        ],
      ),
    );
  }
}

// 唱歌直播封面样式
class SingLiveBar extends StatelessWidget {
  const SingLiveBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(bottom:5.0),
    child: Column(children: [
      Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          topShow5("images/pc5.png", '乐乐', '零点有十分','元素', 180),
          topShow5("images/pc5.png", '星星','迷魂曲', '五星', 180),
         ],

      ),
      SizedBox(height: 10),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          topShow5("images/pc5.png", '哈哈','半岛铁盒', '自娱自乐', 180),
          topShow5("images/pc5.png", '呵呵', '慢慢','温柔的k房', 180),
         ],

      ),
      SizedBox(height: 10),
      Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          topShow5("images/pc5.png", '你好', '摩登爱情','00后听歌房', 180),
          topShow5("images/pc5.png", '即兴', '即兴','慕言的k房', 180),
         ],
      ),
      SizedBox(height: 10),
      Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          topShow5("images/pc5.png", '拐人', '告白气球', '小盆友练歌房',180),
          topShow5("images/pc5.png", '安静', '为啥不回家', '一直很安静',180),
         ],
      ),
    ]),
    );
  }
}
