import 'package:flutter/material.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import 'package:my_library/utils/extension.dart';
import '../constants/String.dart';
import '../constants/dimens.dart';
class FloatingActionButtonExtended extends StatelessWidget {
  const FloatingActionButtonExtended({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        isExtended: true,
        backgroundColor: Colors.grey,
        label: Row(
          children: const [
            Icon(Icons.collections_bookmark),
            SizedBox(
              width: kSP10x,
            ),
            EasyTextWidget(
              text: kCreateNewCollectionText,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: Colors.grey[850],
                  title: const EasyTextWidget(
                    text:kCreateCollectionText ,
                    color: Colors.white,
                    fontSize: kFZ20,
                  ),
                  content: Form(
                    key: context.getShelvesTabBlocInstance().getGlobalFormKey,
                    child: TextFormField(
                      controller: context
                          .getShelvesTabBlocInstance()
                          .getTextEditingController,
                      autofocus: true,
                      validator: (text) {
                        if (text?.isEmpty??true) {
                          return kEmptyCollectionNameWarning;
                        }
                        return null;
                      },
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      color: Colors.amber,
                      onPressed: () {
                        context.navigateBack(context);
                      },
                      child: const EasyTextWidget(text:kCancelText ),
                    ),
                    MaterialButton(
                      color: Colors.white,
                      onPressed: () {
                        if (context
                            .getShelvesTabBlocInstance()
                            .getGlobalFormKey
                            .currentState
                            ?.validate() ??
                            false) {
                          context
                              .getShelvesTabBlocInstance()
                              .createShelfBooks(context
                              .getShelvesTabBlocInstance()
                              .getTextEditingController
                              .text);
                          context.navigateBack(context);
                          context.getShelvesTabBlocInstance().getTextEditingController.clear();

                          // context.navigateBack(context);
                        }
                      },
                      child: const EasyTextWidget(text: kCreateText),
                    ),
                  ],
                );
              });
        }

    );
  }
}
