import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pay/pay.dart';

class GooglePayTest extends StatelessWidget {
  const GooglePayTest({super.key});

  onPaymentResult(Map result) {
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'default_payment_profile_google_pay.json',
      paymentItems: const [
        PaymentItem(
          label: 'Total',
          amount: '99.99',
          status: PaymentItemStatus.final_price,
        )
      ],
      type: GooglePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: onPaymentResult,
      childOnError: const Text('//Error Google Pay//'),
      onPressed: () {
        log('Google Pay button pressed');
      },
      onError: (error) {
        log('Error $error');
      },
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
