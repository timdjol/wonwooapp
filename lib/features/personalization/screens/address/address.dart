import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/features/personalization/screens/address/add_new_address.dart';
import 'package:wonwoo/features/personalization/screens/address/widgets/single_address.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(
                selectedAddress: true,
              ),
              TSingleAddress(
                selectedAddress: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
