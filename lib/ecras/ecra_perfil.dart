import 'dart:io';
import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';
import '../Servicos/servico_base_dados.dart';
import 'ecra_criar_perfil.dart';

class EcraPerfil extends StatefulWidget {
  const EcraPerfil({super.key});

  @override
  State<EcraPerfil> createState() => _EcraPerfilState();
}

class _EcraPerfilState extends State<EcraPerfil> {
  String? _nome;
  String? _email;
  File?   _foto;
  bool    _aCarregar = true;

  @override
  void initState() {
    super.initState();
    _carregarDaBD();
  }

  // ── lê o perfil guardado na BD ao abrir o ecrã ──────────────────────────
  Future<void> _carregarDaBD() async {
    final perfil = await ServicoBD.carregarPerfil();
    setState(() {
      _nome       = perfil?['nome'];
      _email      = perfil?['email'];
      _aCarregar  = false;
    });
  }

  void _irParaCriarPerfil() async {
    final resultado = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => EcraCriarPerfil(
          aoGuardar: (nome, email) {
            Navigator.pop(context, {'nome': nome, 'email': email});
          },
        ),
      ),
    );
    if (resultado != null) {
      await ServicoBD.guardarPerfil(
        resultado['nome'] as String,
        resultado['email'] as String,
      );
      setState(() {
        _nome  = resultado['nome'];
        _email = resultado['email'];
      });
    }
  }

  void _editarPerfil() async {
    final resultado = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => EcraCriarPerfil(
          nomeInicial:  _nome,
          emailInicial: _email,
          aoGuardar: (nome, email) {
            Navigator.pop(context, {'nome': nome, 'email': email});
          },
        ),
      ),
    );
    if (resultado != null) {
      await ServicoBD.guardarPerfil(
        resultado['nome'] as String,
        resultado['email'] as String,
      );
      setState(() {
        _nome  = resultado['nome'];
        _email = resultado['email'];
        _foto  = resultado['foto'];
      });
    }
  }

  void _apagarPerfil() async {
    await ServicoBD.apagarPerfil();
    setState(() {
      _nome  = null;
      _email = null;
      _foto  = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final temPerfil = _nome != null;

    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: TemaApp.corPrimaria,
        foregroundColor: Colors.white,
        actions: temPerfil
            ? [
                IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Editar Perfil',
                  onPressed: _editarPerfil,
                )
              ]
            : [],
      ),
      body: _aCarregar
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: temPerfil ? _perfilCriado() : _semPerfil(),
              ),
            ),
    );
  }

  Widget _perfilCriado() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: TemaApp.corPrimaria,
          backgroundImage: _foto != null ? FileImage(_foto!) : null,
          child: _foto == null
              ? const Icon(Icons.person, size: 65, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 20),
        Text(_nome!, style: TemaApp.estiloTitulo),
        const SizedBox(height: 8),
        Text(_email!, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 24),

        ElevatedButton.icon(
          onPressed: _editarPerfil,
          icon: const Icon(Icons.edit),
          label: const Text('Editar Perfil'),
          style: ElevatedButton.styleFrom(
            backgroundColor: TemaApp.corPrimaria,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 12),

        OutlinedButton.icon(
          onPressed: _apagarPerfil,
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          label: const Text('Apagar Perfil',
              style: TextStyle(color: Colors.red)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }

  Widget _semPerfil() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 55,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person_add, size: 60, color: Colors.white),
        ),
        const SizedBox(height: 20),
        const Text('Sem perfil criado', style: TemaApp.estiloTitulo),
        const SizedBox(height: 8),
        const Text(
          'Cria o teu perfil para guardares\na tua pontuação no ranking.',
          style: TextStyle(color: Colors.grey, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: _irParaCriarPerfil,
          icon: const Icon(Icons.person_add),
          label: const Text('Criar Perfil'),
          style: ElevatedButton.styleFrom(
            backgroundColor: TemaApp.corPrimaria,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
