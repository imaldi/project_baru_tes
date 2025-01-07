import 'package:flutter/material.dart';

class MyGradientContainer extends StatelessWidget {
  final double width;
  final double height;
  final BoxConstraints? constraints;
  final Widget? child;
  final TextStyle textStyle;

  const MyGradientContainer({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.constraints,
    this.child,
    this.textStyle = const TextStyle(
      color: Colors.white, // Warna default putih
      fontSize: 16, // Ukuran teks default
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1617CB), // Kode warna kiri atas
            Color(0xFF8470FC), // Kode warna kanan bawah
          ],
        ),
        borderRadius: BorderRadius.circular(20), // Atur radius sesuai kebutuhan
      ),
      child: DefaultTextStyle(
        style: textStyle,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
