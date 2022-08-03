import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/dados/models/estoria.dart';
import 'package:facebook_interface/uteis/my_custom_scroll_behavior.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';

import '../dados/models/usuario.dart';

class AreaEstoria extends StatelessWidget {
  final Usuario usuario;
  final List<Estoria> estorias;

  const AreaEstoria({
    Key? key,
    required this.usuario,
    required this.estorias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      // Permite rolagem horizontal utilizando o mouse no design para web
      child: ScrollConfiguration(
        // Classe criada para configurar e permitir a rolagem das estorias na horizontal na web
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + estorias.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              Estoria estoriaUsuario = Estoria(
                usuario: usuarioAtual,
                urlImagem: usuarioAtual.urlImagem,
              );

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CartaoEstoria(
                  estoria: estoriaUsuario,
                  adicionarEstoria: true,
                ),
              );
            }

            Estoria estoria = estorias[index - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                estoria: estoria,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  final Estoria estoria;
  final bool adicionarEstoria;

  const CartaoEstoria({
    Key? key,
    required this.estoria,
    this.adicionarEstoria = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeEstoria,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: adicionarEstoria
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    color: PaletaCores.AZUL_FACEBOOK,
                    iconSize: 30,
                  ),
                )
              : ImagemPerfil(
                  imagemUrl: estoria.urlImagem,
                  foiVizualizado: estoria.foiVisualizado,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            adicionarEstoria ? 'Criar story' : estoria.usuario.nome,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
