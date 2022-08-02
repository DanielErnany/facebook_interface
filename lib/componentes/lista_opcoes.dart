import 'package:facebook_interface/componentes/botao_imagem_perfil.dart';
import 'package:facebook_interface/dados/models/usuario.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListaOpcoes extends StatelessWidget {
  final Usuario usuario;

  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.AZUL_FACEBOOK, 'Amigos'],
    [LineIcons.facebookMessenger, PaletaCores.AZUL_FACEBOOK, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.users, PaletaCores.AZUL_FACEBOOK, 'Grupos'],
    [Icons.storefront_outlined, PaletaCores.AZUL_FACEBOOK, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais'],
  ];

  const ListaOpcoes({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: _opcoes.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: BotaoImagemPerfil(
              usuario: usuario,
              onTap: () {},
            ),
          );
        }

        List item = _opcoes[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Opcao(
            icone: item[0],
            cor: item[1],
            texto: item[2],
            onTap: () {},
          ),
        );
      },
    );
  }
}

class Opcao extends StatelessWidget {
  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback onTap;

  const Opcao({
    Key? key,
    required this.icone,
    required this.cor,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icone,
            color: cor,
            size: 35,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
