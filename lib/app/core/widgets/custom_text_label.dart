import '../../../util/exports.dart';

class CustomTextLabel extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;

  const CustomTextLabel(
      {Key? key,
      this.label = "",
      this.style,
      this.overflow,
      this.maxLines,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style ?? AppStyles.textRegular,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
