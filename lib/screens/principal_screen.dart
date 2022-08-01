import 'package:facebook_interface/componentes/navegacao_abas.dart';
import 'package:facebook_interface/screens/home_screen.dart';
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
    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        body: TabBarView(children: _telas),
        bottomNavigationBar: NavegacaoAbas(
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
