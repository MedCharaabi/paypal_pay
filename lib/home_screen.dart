import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String tokenizationKey = 'sandbox_hcngzgtw_ntsdn57j753h3cyx';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showNonce(BraintreePaymentMethodNonce nonce) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Payment method nonce:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Nonce: ${nonce.nonce}'),
            const SizedBox(height: 16),
            Text('Type label: ${nonce.typeLabel}'),
            const SizedBox(height: 16),
            Text('Description: ${nonce.description}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var request = BraintreeDropInRequest(
              tokenizationKey: HomeScreen.tokenizationKey,
              collectDeviceData: true,
              paypalRequest: BraintreePayPalRequest(
                amount: '4.30',
                displayName: 'AIBRIGHT',
              ),
              cardEnabled: false,
            );
            final result = await BraintreeDropIn.start(request);
            if (result != null) {
              showNonce(result.paymentMethodNonce);
            }
          },
          child: const Text('Pay with Paypal[ 4.30\$ ]'),
        ),
      ),
    );
  }
}
