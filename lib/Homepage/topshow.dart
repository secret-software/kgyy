import 'package:flutter/material.dart';

// 自定义指示器长度-------------------------------------------------------

class CustomTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const CustomTabIndicator({
    this.width = 20,
    this.strokeCap = StrokeCap.round,
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
  })  : assert(borderSide != null),
        assert(insets != null);

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the tab
  /// indicator's bounds in terms of its (centered) tab widget with
  /// [TabBarIndicatorSize.label], or the entire tab with
  /// [TabBarIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  ///新增的属性
  final double width; // 控制器宽度
  final StrokeCap strokeCap; // 控制器边角形状

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomTabIndicator) {
      return CustomTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomTabIndicator) {
      return CustomTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }

  ///决定控制器宽度的方法
  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    assert(rect != null);
    assert(textDirection != null);
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    // 希望的宽度
    double wantWidth = this.width;
    // 取中间坐标
    double cw = (indicator.left + indicator.right) / 2;

    print(
        '$cw,indicator left${indicator.left}, right ${indicator.right}, indicator top ${indicator.top},indicator bottom${indicator.bottom}, border width${borderSide.width}');
    //这里是核心代码 //下划线靠左
    // return Rect.fromLTWH(indicator.left,
    //     indicator.bottom - borderSide.width, wantWidth, borderSide.width);

    //下划线居中
    return Rect.fromLTWH(cw - wantWidth / 2,
        indicator.bottom - borderSide.width, wantWidth, borderSide.width);
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : assert(decoration != null),
        super(onChanged);

  final CustomTabIndicator decoration;

  ///决定控制器边角形状的方法
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.borderSide.width / 2.0);
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = decoration.strokeCap; //这块更改为想要的形状
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}
// ----------------------------------------------------------------------------------



// 软件图标样式
Widget topShow(dynamic ic, String name, double? width) {
  return Column(
    children: [
      Icon(
        ic,
        color: Colors.blue,
      ),
      const SizedBox(height: 8.0),
      Text(
        name,
        style: const TextStyle(fontSize: 14),
      ),
    ],
  );
}

// 专属推荐封面样式
Widget topShow2(String image, String name, double? width) {
  var playbox = Container(
    height: 15,
    width: 40,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      children: const [
        Icon(
          Icons.play_arrow,
          size: 10,
        ),
        Text(
          "448万",
          style: TextStyle(fontSize: 8),
        )
      ],
    ),
  );
  return Column(
    children: [
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: width,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: playbox,
          ),
        ],
      ),
      const SizedBox(
        height: 10,
        width: 40,
      ),
      Text(
        name,
        style: const TextStyle(fontSize: 14),
      )
    ],
  );
}

// 歌曲排列样式
Widget topShow3(String image, String name1, String name2, double? width) {
return Row(
  children: [
      const Icon(Icons.add_circle),
      SizedBox(width: 10),
      ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              image,
              width: width,
            ),
          ),
      SizedBox(width: 10),
      Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children:[Text(
        name1,
         style: const TextStyle(fontSize: 16),
        ),
        Text(
          name2,
         style: const TextStyle(fontSize: 12,color: Colors.grey),)
        ]
       
      ),
      
        Spacer(),
      const Icon(Icons.chat_bubble,size:16),
      const Icon(Icons.more_vert_rounded),
  ],
);
}

//直播封面样式
Widget topShow4(String image, String text1, String text2, double? width) {
return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: width,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child:Text(
        text1,
        style: const TextStyle(fontSize: 14),
      ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child:Text(
        text2,
        style: const TextStyle(fontSize: 14),
      ),
          ),
        ],
      );
}


// 唱歌直播封面
Widget topShow5(String image, String text1,String text2,String text3,double? width) {
  var singbox = Container(
    height: 15,
    width: 50,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      children:  [
       const Icon(
          Icons.person,
          size: 10,
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 8),
        )
      ],
    ),
  );
return 
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: width,
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child:
            Row(
              children: [
                const Icon(
          Icons.person,
          size: 10,
        ),
                Text(
        text1,
        style: const TextStyle(fontSize: 12),
      ),
              ],
            )
            
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child:singbox,
          ),
        ],
      ),
    Text(text3),
  ],
);


}


// 个人页面排列样式
Widget topShow6(String text1) {
return Container(
   margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 196, 229, 232),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            const Icon(Icons.keyboard_arrow_up),
                            Text(
                              text1,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            const Icon(Icons.more_vert_rounded),
                            const Icon(Icons.keyboard_arrow_right)
                          ],
                        )

);
}
