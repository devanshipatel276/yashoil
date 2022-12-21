import 'package:form_field_validator/form_field_validator.dart';

import '../../../util/exports.dart';


// ignore: camel_case_types
class AppTextFormField extends StatefulWidget {
  final String? placeHolder;
  final TextInputAction? input;
  final MultiValidator? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onTextChange;
  final FocusNode? focusNode;
  final int? maxLength;

  AppTextFormField({
    this.placeHolder,
    this.input,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.onTextChange,
    this.maxLength,
    this.focusNode,
  });

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

// ignore: camel_case_types
class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _passwordVisible = false;

  currentOnChange() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Stack(alignment: Alignment.centerRight, children: [
        TextFormField(
            onChanged: (val) {
              if (widget.onTextChange != null) {
                widget.onTextChange!();
              } else {
                currentOnChange();
              }
            },
            focusNode: widget.focusNode,
            controller: widget.controller,
            maxLength: widget.maxLength,
            onFieldSubmitted: (_) => widget.input == TextInputAction.next
                ? FocusScope.of(context).nextFocus()
                : null,
            textInputAction: widget.input,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            validator: widget.validator!,
            autocorrect: false,
            // style: AppTheme.editTextStyle,
            textAlign: TextAlign.start,
            obscureText: widget.obscureText == null ? false : !_passwordVisible,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    right: widget.obscureText ?? false ? 40 : 0),
                counterText: '',
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: widget.placeHolder,
                hintStyle: const TextStyle(
                    // fontFamily: AppTheme.fontNameRaleway,
                    fontSize: 15.0,
                    color: Color(0XFF1D1D1D)))),
        widget.obscureText ?? false
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : Container()
      ]),
    );
  }
}
