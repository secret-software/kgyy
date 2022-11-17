import 'package:flutter/material.dart';
import 'package:flutter_application_1/font.dart';
import './topshow.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //生命周期函数：组件初始化
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//  leading: IconButton(
//  icon:const Icon(Icons.menu), onPressed: () {
//  print('左侧的按钮图标');
// },
//  ),
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
                  child: Text("视频"),
                ),
                Tab(
                  child: Text("音频"),
                ),
                Tab(
                  child: Text("小说"),
                ),
                Tab(
                  child: Text("国语"),
                ),
                Tab(
                  child: Text("英语"),
                ),
                Tab(
                  child: Text("纯音乐"),
                ),
                Tab(
                  child: Text("流行"),
                ),
                Tab(
                  child: Text("国风"),
                ),
              ]),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add_circle_outline,
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
               children:[Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CustomSearchBar(),
                const CeniconBar(),
                const CenexclusiveBar(),
               const VipexclusiveBar(),
               const OldexclusiveBar()
              ],
            ),] 
            ),
  
            ListView(
              children: const [
                ListTile(
                  title: Text("2"),
                )
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("3"),
                )
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("4"),
                )
              ],
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text("5"),
                )
              ],
            ),
            const Text("6"),
            const Text("7"),
            const Text("8"),
            const Text("9"),
          ],
        ));
  }
}

//上方搜索框
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0, right: 15, bottom: 5, left: 15),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20)),
                      color: Color.fromARGB(255, 225, 218, 218),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          CustomSearchBarButton(icon: Icons.search),
                          Text('鹿晗线上音乐会'),
                          Spacer(),
                        ]),
                  ),
                ),
                CustomSearchBarButton(icon: MYFont.maikefeng)
              ],
            ),
          ),
        ));
  }
}

class CustomSearchBarButton extends StatelessWidget {
  const CustomSearchBarButton({super.key, required this.icon});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.05),
          borderRadius: BorderRadius.circular(16)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.grey[600],
          size: 24,
        ),
      ),
    );
  }
}

//中间软件图标
class CeniconBar extends StatelessWidget {
   const CeniconBar({
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
                              topShow(Icons.library_music_outlined, "乐库", 40),
                              topShow(Icons.turned_in, "猜你喜欢", 40),
                              topShow(Icons.calendar_month, "每日推荐", 40),
                              topShow(Icons.church_sharp, "排行榜", 40),
                              topShow(Icons.more_outlined, "更多", 40),
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                );
  }
}

// 中间专属推荐
class CenexclusiveBar extends StatelessWidget{
   const CenexclusiveBar({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return  Container(
                  width: 350,
                  height: 300,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 196, 229, 232),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.keyboard_arrow_up),
                            Text(
                              "专属推荐",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert_rounded),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                topShow2("images/pc1.png", '民谣酒馆', 90),
                                topShow2("images/pc1.png", '网络红歌', 90),
                                topShow2("images/pc1.png", '90回忆录', 90),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                topShow2("images/pc1.png", '粤语怀旧', 90),
                                topShow2("images/pc1.png", '超燃bgm', 90),
                                topShow2("images/pc1.png", '粤语回忆', 90),
                              ],
                            ),
                          ],
                        ))
                  ]),
                );
  }
}


// vip推荐
class VipexclusiveBar extends StatelessWidget{
   const VipexclusiveBar({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Container(width: 350,
                  height: 200,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 196, 229, 232),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.keyboard_arrow_up),
                            Text(
                              "VIP专属推荐",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert_rounded),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )),
                  
                  Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                           topShow3("images/pc2.png", '踏雪','邓寓君（等什么君）', 40),
                           SizedBox(height: 10,),
                           topShow3("images/pc2.png", '纪念','旺仔小乔-昨日少年如风', 40),
                           SizedBox(height: 10,),
                           topShow3("images/pc2.png", '认输','桃籽、何文宇-认输', 40)
                          ],
                        ))
                  ]),);

  }
}

// 经典怀旧金曲
class OldexclusiveBar extends StatelessWidget{
   const OldexclusiveBar({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Container(width: 350,
                  height: 230,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 196, 229, 232),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.keyboard_arrow_up),
                            Text(
                              "经典怀旧金曲",
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert_rounded),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )),
                  Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(Icons.diamond,color: Colors.amber),
                            Text(
                              "2首VIP歌曲 限免完整播放",
                              style: TextStyle(fontSize: 12),
                            ),
                            Spacer(),
                             Text(
                              "新客专享价",
                              style: TextStyle(fontSize: 12,color: Colors.amber),
                            ),
                            Icon(Icons.keyboard_arrow_right,color: Colors.amber)
                          ],
                        )),
                  
                  Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                           topShow3("images/pc2.png", '前前前世','RADWIMPS', 40),
                           SizedBox(height: 10,),
                           topShow3("images/pc2.png", '时光机','周杰伦-魔杰座', 40),
                           SizedBox(height: 10,),
                           topShow3("images/pc2.png", '分裂','周杰伦-八度空间', 40)
                          ],
                        ))
                  ]),);

  }
}
