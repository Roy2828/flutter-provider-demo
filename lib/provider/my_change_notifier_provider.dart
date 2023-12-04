import 'package:flutter/material.dart';
import 'package:provider_demo/provider/my_change_notifier.dart';
import 'package:provider_demo/provider/my_inherited_provider.dart';

class MyChangeNotifierProvider<T extends MyChangeNotifier>
    extends StatefulWidget {
  final Widget child;
  final T model;

  const MyChangeNotifierProvider(this.child, this.model, {Key? key})
      : super(key: key);

  @override
  State<MyChangeNotifierProvider> createState() =>
      _MyChangeNotifierProviderState();
}

class _MyChangeNotifierProviderState extends State<MyChangeNotifierProvider> {
  doSetState() {
    setState(() {
      print("更新");
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 这里的child是外部传入的child，并不会每次重新创建对象
    return MyInheritedProvider(
      widget.model,
      child: widget.child,
    );
  }

  /// 该方法进行状态类中的刷新方法绑定，最终状态类发生变化需要更新时，是调用了这里绑定的方法，即setState
  @override
  void didUpdateWidget(
      covariant MyChangeNotifierProvider<MyChangeNotifier> oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.model.registerListener(doSetState);
  }
}
