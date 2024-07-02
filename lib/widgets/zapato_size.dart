import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/zapato_model.dart';
import '../pages/zapato_desc_page.dart';

class ZapatoSizePreview  extends StatelessWidget {
  final bool fullscreen;

  const ZapatoSizePreview({super.key,  this.fullscreen=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()
      {
        if(!fullscreen)
        {
          Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>ZapatpDescPage() ));
        }
      } ,
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: (fullscreen)?5:30.0,
          vertical: (fullscreen)?5:0),
        child: Container
        (
          width: double.infinity,
          height: (fullscreen)?418:430,
          decoration: BoxDecoration
          (
            color: Color(0xffFFCF53),
            borderRadius: 
            (!fullscreen)?
            BorderRadius.circular(50):
            BorderRadius.only(bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
            topLeft: Radius.circular(40),
            topRight:  Radius.circular(40)
            )
          ),
          child: Column
          (
            children: 
            [
              _ZapatoConSombra(),
              if(!fullscreen)
              _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row
      (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: 
        [
          _TallaZapatoCaja(numero: 7,),
          _TallaZapatoCaja(numero: 7.5,),
          _TallaZapatoCaja(numero: 8,),
          _TallaZapatoCaja(numero: 8.5,),
          _TallaZapatoCaja(numero: 9,),
          _TallaZapatoCaja(numero: 9.5,)
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;
  const _TallaZapatoCaja({
    super.key, required this.numero,
  });

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Container
    (
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration
      (
        color:(numero==zapatoModel.talla) ? Color(0xffF1A23A): Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: 
        [
          BoxShadow
          (
            color: (numero==zapatoModel.talla) ? Color(0xffF1A23A) : Colors.transparent,
            blurRadius: 10,
            offset: Offset(0, 5)
            
          )
        ]
      ),
      child:InkWell(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context,listen: false);
          zapatoModel.talla=numero;
        },
        child: Text(numero.toString().replaceAll('.0', ''),
        style:TextStyle
        (
          color: (numero==zapatoModel.talla)?Colors.white: Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold
        ) ,),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack
      (
        children: 
        [
          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()),
          Image.asset(zapatoModel.assetImage)
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container
      (
        width: 230,
        height: 120,
        decoration: BoxDecoration
        (
         // color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: 
          [
            BoxShadow
            (
              color: Color(0xffEAA14E),
              blurRadius: 40
            )
          ]
        ),
      ),
    );
  }
}