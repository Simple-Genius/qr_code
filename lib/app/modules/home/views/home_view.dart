import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF1EFE5),
        body: Column(
          children: [
            const SizedBox(height: 85),
            Center(child: Image.asset("images/Ebene 1.png")),
            const SizedBox(height: 128),
            Container(
              height: 295,
              width: 295,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: MobileScanner(
                controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.normal),
                onDetect: (capture) {
                  debugPrint(
                      " This is it 00 ${capture.barcodes.first.rawValue}");
                  controller.number.value = capture.barcodes.first.rawValue ??
                      "Please scan to see the number";
                },
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                'The number from the qr code is ${controller.number.value}',
                style: GoogleFonts.roboto(
                    fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 81),
            Text(
              'Scannen Sie den QR-Code',
              style:
                  GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              'Scannen Sie den QR-Code auf der Unterseite des\nGateways, um die Installation fortzusetzen ',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Color(0xff898989),
                  fontSize: 14),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
