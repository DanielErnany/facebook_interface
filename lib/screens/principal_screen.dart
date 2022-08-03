import 'package:facebook_interface/componentes/navegacao_abas.dart';
import 'package:facebook_interface/componentes/navegacao_abas_desktop.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/screens/home_screen.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _indiceAbaSelecionada = 0;

  final List<Widget> _telas = [
    const HomeScreen(),
    const Scaffold(backgroundColor: Colors.orange),
    const Scaffold(backgroundColor: Colors.red),
    const Scaffold(backgroundColor: Colors.green),
    const Scaffold(backgroundColor: Colors.purple),
  ];

  final List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    Icons.menu,
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);

    final larguraTela = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: NavegacaoAbasDesktop(
                  usuario: usuarioAtual,
                  icones: _icones,
                  onTap: (index) {
                    setState(() {
                      _indiceAbaSelecionada = index;
                    });
                  },
                  indiceAbaSelecionada: _indiceAbaSelecionada,
                ),
                preferredSize: Size(larguraTela, 65),
              )
            : null,
        body: SafeArea(
          child: TabBarView(children: _telas),
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavegacaoAbas(
                icones: _icones,
                onTap: (index) {
                  setState(() {
                    _indiceAbaSelecionada = index;
                  });
                },
                indiceAbaSelecionada: _indiceAbaSelecionada,
              ),
      ),
    );
  }
}
