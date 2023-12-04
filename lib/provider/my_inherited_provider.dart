import 'package:flutter/material.dart';
import 'package:provider_demo/provider/my_change_notifier.dart';

class MyInheritedProvider<T extends MyChangeNotifier> extends InheritedWidget {
  final T model;

  const MyInheritedProvider(
    this.model, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);


  static MyInheritedProvider of(BuildContext context, {bool listen = false}) {
    if (listen) {
      /// 使用dependOnInheritedWidgetOfExactType来获取MyInheritedProvider，可以绑定依赖关系
      final MyInheritedProvider? result =
          context.dependOnInheritedWidgetOfExactType<MyInheritedProvider>();
      assert(result != null, 'No MyInheritedProvider found in context');
      return result!;
    } else {
      /// 使用getElementForInheritedWidgetOfExactType来获取Element，再获取其widget，不绑定依赖关系
      final MyInheritedProvider? result = context
          .getElementForInheritedWidgetOfExactType<MyInheritedProvider>()!
          .widget as MyInheritedProvider?;
      assert(result != null, 'No MyInheritedProvider found in context');
      return result!;
    }
  }

  /// 决定是否进行通知依赖
  @override
  bool updateShouldNotify(MyInheritedProvider old) {
    return true;
  }
}

class Consumer extends  StatelessWidget {
  /// {@template provider.consumer.constructor}
  /// Consumes a [Provider<T>]
  /// {@endtemplate}
  Widget? child;
  bool? listen = false;
  Consumer({
    Key? key,
    required this.builder,
    this.child,
    this.listen
  }) : super(key: key);

  /// {@template provider.consumer.builder}
  /// Build a widget tree based on the value from a [Provider<T>].
  ///
  /// Must not be `null`.
  /// {@endtemplate}
  final Widget Function(
      BuildContext context,
      MyInheritedProvider value,
      Widget? child,
      ) builder;



  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      MyInheritedProvider.of(context,listen: listen!!),
      child,
    );
  }
}

