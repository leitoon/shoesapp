

import 'package:flutter/material.dart';
import 'package:shoesapp/widgets/custom_widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
     
      body:Column
      (
        children: 
        [
          CustomAppBar(texto: 'For you'),
          SizedBox(height: 20,),
          ZapatoSizePreview()
        ],
      ),
    );
  }

}