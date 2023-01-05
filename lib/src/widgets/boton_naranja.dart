import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final String texto;
  final double ancho;
  final double alto;
  final Color color;
  const BotonNaranja({
    super.key,
    required this.texto,
    this.ancho = 150,
    this.alto = 50,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho,
      height: alto,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
