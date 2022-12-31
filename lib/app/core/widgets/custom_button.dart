import '../../../util/exports.dart';

// ignore: must_be_immutable
class CustomPrimaryButton extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final String text;
  final Function()? onClick;
  final double radius;
  final bool? toCurvedAtStart;
  final Key? key1;
  final String? prefixIcon;
  final Size? prefixIconSize;
  MaterialStateProperty<OutlinedBorder?>? shape;

  CustomPrimaryButton(
      {this.backgroundColor = AppColors.whiteBackGroundColor,
      this.padding =
          const EdgeInsets.only(left: 36, right: 36, top: 18, bottom: 18),
      this.text = "",
      this.onClick,
      this.radius = 40,
      this.key1,
      this.textStyle,
      this.shape,
      this.toCurvedAtStart = false,
      this.prefixIcon,
      this.prefixIconSize =
          const Size(AppConstant.suffixIconSize, AppConstant.suffixIconSize)})
      : super(key: key1);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: shape ??
              MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: ((toCurvedAtStart ?? false)
                    ? const BorderRadiusDirectional.only(
                        topStart: Radius.circular(18.0),
                        bottomStart: Radius.circular(18.0),
                      )
                    : BorderRadius.circular(radius)),
              ))),
      onPressed: () {
        hideKeyboard();
        onClick?.call();
      },
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: prefixIcon.isNotNullOrEmpty,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 0),
                child: loadAsset(path: prefixIcon ?? "", size: prefixIconSize),
              ),
            ),
            Text(
              text,
              style: textStyle ??
                  AppStyles.textRegular
                      .copyWith(color: AppColors.purpleTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
