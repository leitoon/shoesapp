import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/helpers/helpers.dart';
import 'package:shoesapp/widgets/custom_widgets.dart';

import '../models/zapato_model.dart';

class ZapatpDescPage extends StatelessWidget {
  const ZapatpDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return  Scaffold
    (
      body: Column
      (
        children: 
        [
          Stack(children: [
            const Hero(
              tag: 'zapato-1',
              child: Material(child: ZapatoSizePreview(fullscreen:true))),
            Positioned(
            top: 80,
            child: 
            InkWell(
              onTap: (){
                cambiarStatusDark();
                Navigator.pop(context);
              },
              child: const Icon(Icons.chevron_left,color: Colors.white,size: 60,))
           
            )
            ]),
          const Expanded(child: SingleChildScrollView
          (
            child: Column
            (
              children: 
              [
                ZapatoDescripcion(
          titulo: 'Nike Air Max 720',
          descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
          ),
          _MontoBuyNow(),
           _Coloresymas(),
           _BotonesLikeCartSettings()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container
    (
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row
      (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
        [
          _BotonSombreado(icon: Icon(Icons.favorite, color: Colors.red,size: 25,),),
          _BotonSombreado(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4),size: 25,),),
          _BotonSombreado(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4),size: 25,),)

        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container
    (
      width: 55,
          height: 55,
          decoration: BoxDecoration
          (
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10)

              )
            ]
          ),
          child: icon,
    );
  }
}

class _Coloresymas extends StatelessWidget {
  const _Coloresymas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      
      padding:  EdgeInsets.symmetric(horizontal: 30.0),
      child: Row
      (
        children: 
        [
          Expanded(child: Stack
          
          (
            children: 
            [
              Positioned(
                left: 90,
                child: _BotonColor(color: Color(0xffC6D642), index: 4, assets: 'assets/imgs/verde.png'),
            
                ),
            Positioned(
              left: 60,
              child: _BotonColor(color: Color(0xffFFAD29), index: 3, assets: 'assets/imgs/amarillo.png'),),
             Positioned(
              left: 30,
              child: _BotonColor(color: Color(0xff2099F1), index: 2, assets: 'assets/imgs/azul.png')),
          _BotonColor(color: Color(0xff364D56), index: 1, assets: 'assets/imgs/negro.png'),
            ],
          )),
         
        
         BotonNaranja(texto: 'More related items',alto: 30,ancho: 170,color:Color(0xffFFC675) ,)
        
          
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String assets;
  const _BotonColor({
    super.key, required this.color, required this.index, required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index*100),
      duration: Duration(milliseconds: 300),
      child: InkWell(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context,listen: false);
          zapatoModel.assetImage=assets;
          print(assets);
        },
        child: Container
        (
          width: 45,
          height: 45,
          decoration: BoxDecoration
          (
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: const EdgeInsets.only(top: 20,bottom: 20),
        child:  Row
        (
          children: 
          [
            Text('\$ 180.0',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Buy now',ancho: 120,alto: 40,))
          ],
        ),
      ),
    );
  }
}