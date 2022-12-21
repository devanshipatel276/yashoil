
import '../../../util/exports.dart';

class DialogUtils extends StatelessWidget {
  final String message;
  final String? title;
  final String? okBtnTitle;
  final String? cancelBtnTitle;
  final Function()? onOkClicked;
  final Function()? onCancelClicked;

  const DialogUtils({
    required this.message,
    this.title,
    this.okBtnTitle,
    this.cancelBtnTitle,
    this.onOkClicked,
    this.onCancelClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius_normal)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: AppConstant.MAX_WIDTH),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.space_xlarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: Dimens.space_xxlarge),
              if (title.isNotNullOrBlank)
                Column(
                  children: <Widget>[
                    Text(
                      title!,
                      style: AppStyles.textBold
                          .copyWith(fontSize: Dimens.text_medium),
                    ),
                    const SizedBox(height: Dimens.space_medium),
                  ],
                ),
              if (message.isNotBlank)
                Column(
                  children: <Widget>[
                    Text(
                      message,
                      style: AppStyles.textNormal.copyWith(
                          overflow: TextOverflow.visible,
                          height: Dimens.text_height_xxlarge),
                    ),
                    const SizedBox(height: Dimens.space_large),
                  ],
                ),
              if (okBtnTitle.isNotNullOrBlank) ...[
                CustomButton(
                  height: Dimens.button_size_large,
                  titleTextStyle: AppStyles.textNormal,
                  title: okBtnTitle!,
                  onTap: () {
                    Navigator.pop(context);
                    if (onOkClicked != null) onOkClicked!();
                  },
                ),
                const SizedBox(height: Dimens.space_normal),
              ],
              if (cancelBtnTitle.isNotNullOrBlank)
                CustomButton(
                  height: Dimens.button_size_large,
                  titleTextStyle: AppStyles.textNormal,
                  title: cancelBtnTitle!,
                  backgroundColor: AppColors.primaryColor,
                  hasBorder: false,
                  titleColor: AppColors.primaryColor,
                  onTap: () {
                    Navigator.pop(context);
                    if (onCancelClicked != null) onCancelClicked!();
                  },
                ),
              const SizedBox(height: Dimens.space_medium),
            ],
          ),
        ),
      ),
    );
  }
}