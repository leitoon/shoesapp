

import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold
    (
     
      body:Column
      (
        children: 
        [
          CustomAppBar(texto: 'For you'),
          SizedBox(height: 20,),
          Expanded(child: 
          SingleChildScrollView
          (
            physics: BouncingScrollPhysics(),
            child: Column
            (
              children: 
              [
                 Hero(
                  tag: 'zapato-1',
                  child: ZapatoSizePreview()),
          ZapatoDescripcion(
          titulo: 'Nike Air Max 720',
          descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
          )
              ],
            ),
          )
          ),
          AgregrarCarritoBoton(monto:180)
         
        ],
      ),
    );
  }

}