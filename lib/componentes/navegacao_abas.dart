import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;

  const NavegacaoAbas({
    Key? key,
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: PaletaCores.AZUL_FACEBOOK,
            width: 3,
          ),
        ),
      ),
      tabs: icones
          // Retorn a lista em formato de map para acessar o indice de cada icone
          .asMap()
          .map((index, icon) => MapEntry(
                index,
                Icon(
                  icon,
                  color: indiceAbaSelecionada == index
                      ? PaletaCores.AZUL_FACEBOOK
                      : Colors.black54,
                  size: 30,
                ),
              ))
          .values
          .toList(),
    );
  }
}
