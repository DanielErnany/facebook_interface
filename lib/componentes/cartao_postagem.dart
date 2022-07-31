import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/dados/models/postagem.dart';
import 'package:flutter/material.dart';

class CartaoPostagem extends StatelessWidget {
  final Postagem postagem;

  const CartaoPostagem({
    Key? key,
    required this.postagem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(color: Colors.red, width: 100, height: 100),
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
