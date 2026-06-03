import 'package:flutter/material.dart';
import '../utilitarios/tema_app.dart';

class EcraCriarPerfil extends StatefulWidget {
  final void Function(String nome, String email) aoGuardar;
  final String? nomeInicial;
  final String? emailInicial;

  const EcraCriarPerfil({
    super.key,
    required this.aoGuardar,
    this.nomeInicial,
    this.emailInicial,
  });

  @override
  State<EcraCriarPerfil> createState() => _EcraCriarPerfilState();
}

class _EcraCriarPerfilState extends State<EcraCriarPerfil> {
  final _formKey          = GlobalKey<FormState>();
 late final TextEditingController _nomeController;
 late final TextEditingController _emailController;
  final _passwordController = TextEditingController();
  bool _verPassword         = false;

  @override
  void initState() {
    super.initState();
    _nomeController  = TextEditingController(text: widget.nomeInicial ?? '');
    _emailController = TextEditingController(text: widget.emailInicial ?? '');
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      widget.aoGuardar(
        _nomeController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.nomeInicial != null;

    return Scaffold(
      backgroundColor: TemaApp.corFundo,
      appBar: AppBar(
        title: Text(editando ? 'Editar Perfil' : 'Criar Perfil'),
        backgroundColor: TemaApp.corPrimaria,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              const CircleAvatar(
                radius: 50,
                backgroundColor: TemaApp.corPrimaria,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 32),

              // nome
              TextFormField(
                controller: _nomeController,
                decoration: _decoracao('Nome completo', Icons.person),
                textCapitalization: TextCapitalization.words,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Por favor insere o teu nome';
                  }
                  if (v.trim().length < 3) {
                    return 'O nome deve ter pelo menos 3 letras';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // email
              TextFormField(
                controller: _emailController,
                decoration: _decoracao('Email', Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Por favor insere o teu email';
                  }
                  if (!v.contains('@') || !v.contains('.')) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // password (só na criação)
              if (!editando)
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_verPassword,
                  decoration: _decoracao(
                    'Password',
                    Icons.lock,
                    sufixo: IconButton(
                      icon: Icon(
                        _verPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () =>
                          setState(() => _verPassword = !_verPassword),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Por favor insere uma password';
                    }
                    if (v.length < 6) {
                      return 'A password deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),

              const SizedBox(height: 40),

              // botão guardar
              ElevatedButton.icon(
                onPressed: _guardar,
                icon: const Icon(Icons.check),
                label: Text(editando ? 'Guardar Alterações' : 'Criar Perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TemaApp.corPrimaria,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // botão cancelar
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Cancelar'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: TemaApp.corPrimaria,
                  side: const BorderSide(color: TemaApp.corPrimaria),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _decoracao(String label, IconData icone,
      {Widget? sufixo}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icone, color: TemaApp.corPrimaria),
      suffixIcon: sufixo,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: TemaApp.corPrimaria, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
}