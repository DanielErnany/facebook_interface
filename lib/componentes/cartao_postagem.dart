import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/dados/models/postagem.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CartaoPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          // Cabeçalho
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabecalhoPostagem(postagem: postagem),
                Text(postagem.descricao),
              ],
            ),
          ),
          // Imagem postagens
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(imageUrl: postagem.urlImagem),
          ),
          // Area estatiscas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: EstatiscasPostagem(postagem: postagem),
          ),
        ],
      ),
    );
  }
}

class CabecalhoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CabecalhoPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          imagemUrl: postagem.urlImagem,
          foiVizualizado: true,
        ),
        const SizedBox(width: 8),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postagem.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${postagem.tempoAtras} - ',
                  ),
                  Icon(Icons.public, size: 12, color: Colors.grey[600])
                ],
              )
            ],
          ),
        ),

        // Informações do usuario
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}

class EstatiscasPostagem extends StatelessWidget {
  final Postagem postagem;

  const EstatiscasPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PaletaCores.AZUL_FACEBOOK,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                "${postagem.curtidas}",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${postagem.comentarios} comentários",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${postagem.compartilhamentos} compartilhamentos",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(thickness: 1.2),
        Row(
          children: [
            BotaoPostagem(
              icon: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              text: 'Curtir',
              onTap: () {},
            ),
            BotaoPostagem(
              icon: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              text: 'Comentar',
              onTap: () {},
            ),
            BotaoPostagem(
              icon: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              text: 'Compartilhar',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class BotaoPostagem extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const BotaoPostagem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
