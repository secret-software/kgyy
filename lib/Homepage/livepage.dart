import 'package:flutter/material.dart';
import './topshow.dart';

class LivePage extends StatefulWidget {
  const LivePage({super.key});
  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
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
                  child: Text("繁星"),
                ),
                Tab(
                  child: Text("关注"),
                ),
                Tab(
                  child: Text("鱼声"),
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
              children: [Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SrcollBar(),
                const ReminderBar(),
                Image.asset("images/pc3.png"),
                const LiveBar(),
              ],
            ),],
            ),
            
            const Text("2.2"),
            const Text("2.3")
          ],
        ));
  }
}

// 上方滚动选项
class SrcollBar extends StatelessWidget {
  const SrcollBar({
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
                  "推荐",
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
                  "新秀",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "音乐",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "颜值",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "跳舞",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  "国风",
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
          const Positioned(
            right: 0,
            bottom: 10,
            child: Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}

// 中间提示部分
class ReminderBar extends StatelessWidget {
  const ReminderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            "推荐主播",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(width: 10),
           Text(
            "过滤PK",
            style: TextStyle(fontSize: 12,color:Colors.grey ),
          ),
          Spacer(),
          Icon(Icons.access_time),
           SizedBox(width: 10),
           Icon(Icons.catching_pokemon,color:Colors.amber),
        ],
      ),
    );
  }
}

// 直播封面
class LiveBar extends StatelessWidget {
  const LiveBar({
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
          topShow4("images/pc4.png", '乐乐', '颜值', 180),
          topShow4("images/pc4.png", '星星', '舞蹈', 180),
         ],

      ),
      SizedBox(height: 10),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          topShow4("images/pc4.png", '哈哈', 'PK', 180),
          topShow4("images/pc4.png", '呵呵', '游戏', 180),
         ],

      ),
    ]),
    );
  }
}
