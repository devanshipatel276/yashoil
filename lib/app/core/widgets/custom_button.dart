
import '../../../util/exports.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? image;
  final TextStyle? titleTextStyle;
  final Function? onTap;
  final bool isLoading;
  final Color backgroundColor;
  final Color? disabledColor;
  final Color titleColor;
  final bool hasBorder;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final bool isEnabled;
  final double height;
  final double width;
  final double imageWidth;
  final double imageHeight;

  const CustomButton({
    required this.title,
    this.image,
    this.titleTextStyle,
    this.onTap,
    this.isLoading = false,
    this.backgroundColor = AppColors.primaryColor,
    this.disabledColor = AppColors.primaryColor,
    this.titleColor = Colors.white,
    this.hasBorder = false,
    this.borderColor = AppColors.primaryColor,
    this.borderWidth = Dimens.border_width_small,
    this.borderRadius = Dimens.radius_small,
    this.isEnabled = true,
    this.height = Dimens.button_size_normal,
    this.width = double.infinity,
    this.imageHeight = Dimens.icon_size_xsmall,
    this.imageWidth = Dimens.icon_size_xsmall,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: hasBorder ? BorderStyle.solid : BorderStyle.none),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor:
            isEnabled && !isLoading ? backgroundColor : disabledColor,
        textStyle: (titleTextStyle ?? AppStyles.textNormal).copyWith(color: titleColor),
      ),
      onPressed: isEnabled && onTap != null && !isLoading
          ? onTap as void Function()?
          : () {},
      child: Container(
        constraints: const BoxConstraints(maxWidth: AppConstant.MAX_WIDTH),
        height: height,
        width: width,
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: Dimens.icon_size_normal,
                  height: Dimens.icon_size_normal,
                  child: CircularProgressIndicator(
                    strokeWidth: Dimens.border_width_large,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black),
                    backgroundColor: Colors.black.withOpacity(0.2),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (image != null) ...[
                      Container(
                        width: imageWidth,
                        height: imageHeight,
                        child: Image.asset(
                          image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: Dimens.space_normal,
                      ),
                    ],
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(title,
                          style: (titleTextStyle ?? AppStyles.textNormal).apply(color: titleColor)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
