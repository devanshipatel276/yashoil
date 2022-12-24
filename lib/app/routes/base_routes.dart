import '../../util/exports.dart';

GetPage basePage(
    {required String name,
    required Widget Function() page,
    Duration? transitionDuration,
    required Bindings binding,
    List<GetMiddleware>? middlewares,
    Transition transition = Transition.fadeIn}) {
  return GetPage(
      name: name,
      transitionDuration: transitionDuration,
      page: page,
      binding: binding,
      middlewares: middlewares,
      transition: transition,
      preventDuplicates: true,
      popGesture: true);
}
