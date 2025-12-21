import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const PaymentScreen(),
    );
  }
}

/// =======================
/// OOP – PAYMENT METHOD
/// =======================
abstract class PaymentMethod {
  String get name;
  String get assetPath;
}

class PayPalMethod extends PaymentMethod {
  @override
  String get name => "PayPal";

  @override
  String get assetPath => "assets/images/paypal.png";
}

class ZaloPayMethod extends PaymentMethod {
  @override
  String get name => "ZaloPay";

  @override
  String get assetPath => "assets/images/zalopay.png";
}

class ApplePayMethod extends PaymentMethod {
  @override
  String get name => "Apple Pay";

  @override
  String get assetPath => "assets/images/applepay.png";
}

/// =======================
/// PAYMENT SCREEN
/// =======================
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? selectedMethod;

  final List<PaymentMethod> methods = [
    PayPalMethod(),
    ZaloPayMethod(),
    ApplePayMethod(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0068FF),
        title: const Text("Chọn hình thức thanh toán"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),

          /// ===== TOP DISPLAY (QUAN TRỌNG NHẤT) =====
          SizedBox(
            height: 120,
            child: Center(
              child: selectedMethod == null
                  ? Image.asset("assets/images/illustration.png", height: 80)
                  : Image.asset(selectedMethod!.assetPath, height: 80),
            ),
          ),

          const SizedBox(height: 16),
          const Divider(),

          /// ===== PAYMENT LIST =====
          Expanded(
            child: ListView.builder(
              itemCount: methods.length,
              itemBuilder: (context, index) {
                final method = methods[index];
                final isSelected = selectedMethod == method;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMethod = method;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF0068FF)
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: const Color(0xFF0068FF),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            method.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Image.asset(method.assetPath, height: 22),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// ===== CONTINUE =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: selectedMethod == null ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0068FF),
                  disabledBackgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
