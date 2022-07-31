import 'package:facebook_interface/componentes/area_criar_postagem.dart';
import 'package:facebook_interface/componentes/area_estoria.dart';
import 'package:facebook_interface/componentes/botao_circulo.dart';
import 'package:facebook_interface/componentes/cartao_postagem.dart';
import 'package:facebook_interface/dados/models/postagem.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:facebook_interface/dados/dados.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            floating: true,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: PaletaCores.AZUL_FACEBOOK,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              BotaoCirculo(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: () {},
              ),
              BotaoCirculo(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: AreaCriarPostagem(usuario: usuarioAtual),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaEstoria(
                usuario: usuarioAtual,
                estorias: estorias,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Postagem postagem = postagens[index];
                return CartaoPostagem(
                  postagem: postagem,
                );
              },
              childCount: postagens.length,
            ),
          ),
        ],
      ),
    );
  }
}
