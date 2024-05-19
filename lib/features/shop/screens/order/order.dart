import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/features/shop/screens/order/widgets/order_list.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Мои заказы',
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItems(),
      ),
    );
  }
}
