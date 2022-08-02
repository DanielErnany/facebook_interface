import 'package:facebook_interface/componentes/botao_imagem_perfil.dart';
import 'package:facebook_interface/dados/models/usuario.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  final List<Usuario> usuarios;

  const ListaContatos({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Contatos',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              Usuario usuario = usuarios[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: BotaoImagemPerfil(
                  usuario: usuario,
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
