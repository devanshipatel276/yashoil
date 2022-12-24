import 'package:yash_oil/app/ui/login/login_controller.dart';

import '../../../util/exports.dart';

class LoginPage extends BaseGetResponsiveView<LoginController> {
  LoginPage({super.key});

  @override
  String getTag() => (LoginController).toString();

  @override
  Widget buildPhoneWidget() => _phoneAndTabletView();

  Widget _phoneAndTabletView() {
    return Scaffold(
        backgroundColor: AppColors.orangeBackGroundColor,
        body: Form(
          key: controller.formKey,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
            child: Column(
              children: [
                showLogo(),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 16.0),
                        child: CustomTextLabel(
                          label: AppString.logInKey.tr,
                          style: AppStyles.textDoubleExtraLarge,
                        ),
                      ),
                      CustomTextLabel(
                        label: AppString.loginDescriptionKey.tr,
                        style: AppStyles.textRegular.copyWith(
                          letterSpacing: 0.5,
                          height: 1.5,
                        ),
                        maxLines: 3,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0.0, 36.0, 0.0, 12.0),
                        child: CustomTextFormField(
                          controller: controller.emailController,
                          label: AppString.emailAddressKey.tr,
                          prefixIcon: Assets.svg.icUser,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            return value.toString().validateEmail();
                          },
                        ),
                      ),
                      Obx(
                        () => CustomTextFormField(
                            obscureText: controller.isObscureText.value,
                            controller: controller.passwordController,
                            label: AppString.passwordKey.tr,
                            prefixIcon: Assets.svg.icKey,
                            suffixOnClick: () {},
                            suffix: GestureDetector(
                                onTap: () {
                                  controller.isObscureText.value =
                                      !controller.isObscureText.value;
                                },
                                child: Transform.translate(
                                  offset: const Offset(0, 2),
                                  child: loadMaterialIcon(
                                      controller.isObscureText.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 20),
                                )),
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              return value.toString().validatePassword();
                            }),
                      ),
                      Container(
                        width: 120.0,
                        margin: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 14.0),
                        child: CustomPrimaryButton(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 16, bottom: 16),
                          text: AppString.logInKey.tr,
                          textStyle: AppStyles.textMedium.copyWith(
                            color: AppColors.redTextColor,
                          ),
                          onClick: () {
                            if (controller.formKey.currentState!.validate()) {
                              FireBaseDB.firebaseLogin(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // loginAndForgotPswdWidget(),
              ],
            ),
          ),
        ));
  }
}
