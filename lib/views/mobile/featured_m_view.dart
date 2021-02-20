import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeaturedMView extends StatefulWidget {
  final GlobalKey key;

  FeaturedMView({@required this.key});

  @override
  _FeaturedMViewState createState() => _FeaturedMViewState();
}

class _FeaturedMViewState extends State<FeaturedMView> {
  final List<String> imgList = [
    'https://i.imgur.com/N8zPEsLl.jpg',
    'https://i.imgur.com/ZexNYsyl.jpg',
    'https://i.imgur.com/qSUCFxKl.jpg',
    'https://i.imgur.com/Gsld1Nyl.jpg',
    'https://i.imgur.com/JHcm5wAl.jpg',
    'https://i.imgur.com/HsXUvnDl.jpg',
    'https://i.imgur.com/Umo107il.jpg',
    'https://i.imgur.com/hDx41yal.jpg',
  ];

  int _current = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      imgList.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 40,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text('FEATURED WORK',
                style: Theme.of(context).textTheme.headline3),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 40,
            ),
            child: Text('RECENT PROJECTS',
                style: Theme.of(context).textTheme.headline5),
          ),
          CarouselSlider.builder(
            itemCount: imgList.length,
            options: CarouselOptions(
                height: 400,
                autoPlay: true,
                aspectRatio: 2.5,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            itemBuilder: (context, index, realIdx) {
              return Container(
                child: Center(
                    child: Image.network(
                  imgList[index],
                  fit: BoxFit.cover,
                  width: 1000,
                )),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
