import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/loader.dart';
import 'package:shop_app/size_config.dart';

class FeedbackBody extends StatelessWidget {
  const FeedbackBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width:
                    getProportionateScreenWidth(SizeConfig.screenWidth * 0.8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                    tag: 'Feedback',
                    child: Image.asset(
                      'assets/images/ps4_console_white_1.png',
                    ),
                  ),
                ),
              ),
              const StarPicker(),
              Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(20),
                ),
                child: TextFormField(
                  minLines: 5, //Normal textInputField will be displayed
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Add your comment',
                    labelText: 'Comment',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(20),
                ),
                child: DefaultButton(
                    text: 'Submit',
                    onPress: () {
                      FocusScope.of(context).requestFocus(FocusNode());

                      Navigator.of(context).restorablePush(dialogBuilder);

                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StarPicker extends StatefulWidget {
  const StarPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<StarPicker> createState() => _StarPickerState();
}

class _StarPickerState extends State<StarPicker> {
  int star = 4;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            5,
            (index) => Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(18)),
                  height: getProportionateScreenHeight(55),
                  width: getProportionateScreenHeight(55),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/Star Icon.svg',
                    color: index <= star
                        ? const Color(0xFFFFE431)
                        : const Color(0xFFDBDEE4),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          star = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
