
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/e_books_your_books_bloc.dart';
import '../constants/dimens.dart';
import '../data/vos/home_screen_vo/books_vo/books_vo.dart';
import '../easy_widgets/easy_cached_network_image.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Selector<EBooksYourBooksBloc, List<BooksVO>?>(
      selector: (_, obj) => obj.getFavBooks,
      shouldRebuild: (previous, next) => previous != next,
      builder: (context, favBooks, _) {
        return Visibility(
          visible: favBooks?.isNotEmpty ?? false,
          child: CarouselSlider.builder(
            itemCount: favBooks?.length ?? 0,
            options: CarouselOptions(
                height: 260,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom),
            itemBuilder: (context, index, realIndex) {
              return SizedBox(
                width: 260,
                child: Stack(children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kSP10x),
                      child: EasyCachedNetworkImage(
                        img: favBooks?[index].bookImage ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
              );
            },
          ),
        );
      },
    );
  }
}