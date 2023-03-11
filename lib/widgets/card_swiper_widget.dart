import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:Gatitos/models/cat_model.dart';

class CardSwiper extends StatefulWidget {
  final List<Cat> cats;

  CardSwiper({super.key, required this.cats});

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  final _swiperController = SwiperController();
  int _globalIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _swiperController.addListener(() {});

    return Container(
      padding: EdgeInsets.only(top: 5),
      width: double.infinity,
      //height: 300,
      child: Swiper(
        onTap: (index) {
          // No encuentra a cats
          Navigator.pushNamed(context, 'detail', arguments: cats[index]);
        },
        controller: _swiperController,
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              // No encuentra a cats
              image: NetworkImage(cats[index].getCatImage()),
              placeholder: AssetImage('assets/images/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },
        onIndexChanged: (value) {
          _globalIndex = _swiperController.index;
          if (_globalIndex == 10) {
            // Cuando llegas al último slide, ejecuta una acción específica aquí
            print('Llegaste al límite del itemCount del Swiper');
          }
        },
        // No encuentra a cats
        itemCount: cats.length,
        //pagination: SwiperPagination(),
        //control: SwiperControl(),
      ),
    );
  }
}
