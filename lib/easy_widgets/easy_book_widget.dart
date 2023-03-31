import 'package:flutter/material.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import '../constants/dimens.dart';
import '../easy_widgets/easy_cached_network_image.dart';
class EasyBookWidget extends StatelessWidget {
  const EasyBookWidget({
    super.key,
    required this.bookImage,
    required this.bookTitle,
    required this.bookListName,
    required this.onPressedFavIcon,
    required this.isFavorite,
    required this.onTapAddToShelf
  });

  final String bookImage;
  final String bookTitle;
  final String bookListName;
  final Function onPressedFavIcon;
  final bool isFavorite;
  final Function onTapAddToShelf;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          overviewBookScrollHeight,
      margin: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: InkWell(
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
              height: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 5,
                    child: ListTile(
                      leading: EasyCachedNetworkImage(
                          img:bookImage ),
                      title: EasyTextWidget(
                        text:bookTitle,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      subtitle: EasyTextWidget(
                        text:bookListName,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.remove_circle),
                    title: EasyTextWidget(
                      text: 'Remove Download',
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.delete),
                    title: EasyTextWidget(
                      text: 'Delete From Library',
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                   ListTile(
                    leading: const Icon(Icons.add),
                    title: const EasyTextWidget(
                      text: 'Add to Shelf',
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    onTap: ()=>onTapAddToShelf(),
                  ),
                ],
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kSP10x),
              child: Stack(children: [
                EasyCachedNetworkImage(
                  img:bookImage,
                  height: overviewBookHeight,
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                      onPressed:(){
                        onPressedFavIcon();
                      },
                      icon: (isFavorite)
                          ? const Icon(
                        Icons.favorite,
                        size: 35,
                        color: Colors.red,
                      )
                          : const Icon(
                        Icons.favorite_outline,
                        size: 35,
                      )),
                )
              ]),
            ),
            EasyTextWidget(
              text:bookTitle,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
