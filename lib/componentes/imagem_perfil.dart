import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class ImagemPerfil extends StatelessWidget {
  final String imagemUrl;
  final bool foiVizualizado;

  const ImagemPerfil({
    Key? key,
    required this.imagemUrl,
    this.foiVizualizado = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: PaletaCores.AZUL_FACEBOOK,
      child: CircleAvatar(
        radius: foiVizualizado ? 22 : 17,
        backgroundImage: CachedNetworkImageProvider(imagemUrl),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
