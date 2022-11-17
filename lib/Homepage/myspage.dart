import 'package:flutter/material.dart';
import './topshow.dart';
import 'package:flutter_application_1/font.dart';

class MysPage extends StatefulWidget {
  const MysPage({super.key});
  @override
  State<MysPage> createState() => _MysPageState();
}

class _MysPageState extends State<MysPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
                child: Text("音乐"),
              ),
              Tab(
                child: Text("艺人"),
              ),
              Tab(
                child: Text("动态"),
              ),
              Tab(
                child: Text("消息"),
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
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              print('右侧的按钮图标');
            },
          ),
        ],
      ),
      body: TabBarView(controller: _tabController, children: [
        ListView(
          children: [
            Column(
              children: const [
                UserBar(),
                CeniconsBar(),
                LikeBar(),
                BottomSelectBar(),
              ],
            )
          ],
        )
      ]),
    );
  }
}

// 用户信息部分
class UserBar extends StatelessWidget {
  const UserBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 196, 229, 232),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 60,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("空"),
                  Row(
                    children: const [
                      Icon(
                        Icons.man,
                        size: 14,
                      ),
                      Icon(
                        Icons.diamond,
                        size: 14,
                      ),
                      Text("LV.0")
                    ],
                  ),
                  Row(
                    children: const [Text("0 关注  0 粉丝")],
                  )
                ],
              ),
              Spacer(),
              Column(
                children: [
                  const Text("切换模式"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.person),
                      Icon(MYFont.maikefeng),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(children:const [
                    Icon(Icons.monetization_on,color: Colors.amber,),
                     Text("任务中心",style: TextStyle(fontSize: 14),)
                  ]),
                  const Text("做任务免费领会员",style: TextStyle(fontSize: 14,color:Colors.grey),)
                ],
              ),
                Column(
                children: [
                  Row(children:const [
                    Icon(Icons.diamond,color: Colors.amber,),
                     Text("会员中心",style: TextStyle(fontSize: 14),)
                  ]),
                  const Text("VIP包年仅需99",style: TextStyle(fontSize: 14,color:Colors.grey),)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}


class CeniconsBar extends StatelessWidget {
   const CeniconsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Positioned(
                        child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.only(top: 10.0),
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 196, 229, 232),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              topShow(Icons.library_music_outlined, "本地", 40),
                              topShow(Icons.turned_in, "音频", 40),
                              topShow(Icons.calendar_month, "云盘", 40),
                              topShow(Icons.church_sharp, "最近", 40),
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                );
  }
}


class LikeBar extends StatelessWidget {
   const LikeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Container(
       margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      width: 350,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 196, 229, 232),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.favorite,color: Colors.red,size:30),
                          const SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("我喜欢",style: TextStyle(fontSize: 18),),
                              Text("0首",style:TextStyle(color: Colors.grey),)
                            ],

                          ),
                          const Spacer(),
                    
                          Container(
      width: 70,
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
          Icon(Icons.home,size: 16,color: Colors.blue,),
          Text("猜你喜欢", style: TextStyle(fontSize: 10,color: Colors.blue),)
        ],
      ),
    ),

                        ]
                        
                      ),
    );
  }
}

// 下方选项部分
class BottomSelectBar extends StatelessWidget {
  const BottomSelectBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      return Column(
         children: [
          topShow6("歌单"),
          topShow6("已购音乐"),
          topShow6("铃声彩铃"),
          topShow6("常用功能"),
          topShow6("小程序"),
          topShow6("AI歌手"),
         ],
      );
  }
}