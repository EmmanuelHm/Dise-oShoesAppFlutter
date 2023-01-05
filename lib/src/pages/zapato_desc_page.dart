import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';
import 'package:animate_do/animate_do.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            const Hero(
              tag: 'zapato-1',
              child: ZapatoSizePreview(fullScreen: true),
            ),
            Positioned(
              top: 80,
              child: FloatingActionButton(
                onPressed: () {
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.chevron_left,
                    color: Colors.white, size: 60),
              ),
            )
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColorsAndMore(),
                  _BotonesLikeCardSettings()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCardSettings extends StatelessWidget {
  const _BotonesLikeCardSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings,
              color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(
                    left: 90,
                    child: _BotonColor(
                        Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(
                    left: 60,
                    child: _BotonColor(
                        Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(
                    left: 30,
                    child: _BotonColor(
                        Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),
          const BotonNaranja(
            texto: 'More related item',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaranja(texto: 'Buy Now', ancho: 120, alto: 40),
            )
          ],
        ),
      ),
    );
  }
}
