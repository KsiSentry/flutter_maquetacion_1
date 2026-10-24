import 'package:flutter/material.dart';
import 'package:flutter_maquetacion_1/login_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Estados de requisitos
  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasNumber = false;

  void _checkPasswordRequirements(String value) {
    setState(() {
      _hasMinLength = value.length >= 8;
      _hasUppercase = value.contains(RegExp(r'[A-Z]'));
      _hasNumber = value.contains(RegExp(r'[0-9]'));
    });
  }

  bool get _isFormValid {
    return _hasMinLength &&
        _hasUppercase &&
        _hasNumber &&
        _passwordController.text.isNotEmpty &&
        _passwordController.text == _confirmPasswordController.text;
  }

  void _handleResetPassword() {
    if (!_isFormValid) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Las contraseñas no coinciden')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor cumple con todos los requisitos')),
        );
      }
      return;
    }

    // Muestra mensaje de éxito y regresa a Login
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Contraseña restablecida con éxito!'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      body: Stack(
        children: [
          // ================= BACKGROUND DECORATIONS =================
          // Círculo/Burbuja superior derecha magenta
          Positioned(
            top: -60,
            right: -50,
            child: Container(
              width: 240,
              height: 240,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF8A2393), Color(0xFFE94057)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Círculo amarillo medio derecho
          Positioned(
            top: 300,
            right: 30,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFFFFCC00),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Círculo azul claro inferior izquierdo
          Positioned(
            bottom: -50,
            left: -40,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: const Color(0xFFBBDEFB).withValues(alpha: 0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Cuadrado naranja rotado inferior derecho
          Positioned(
            bottom: 40,
            right: -20,
            child: Transform.rotate(
              angle: 0.35,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF9900), Color(0xFFFF5500)],
                  ),
                ),
              ),
            ),
          ),

          // ================= MAIN CONTENT =================
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),

                  // BOTÓN ATRÁS Y ETIQUETA "CÓDIGO VERIFICADO"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                          color: Colors.black87,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.check_circle_outline,
                              size: 16,
                              color: Color(0xFF2E7D32),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Código verificado',
                              style: TextStyle(
                                color: Color(0xFF2E7D32),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ÍCONO CANDADO
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8E2DE2), Color(0xFFF000FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF8E2DE2).withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.lock_open_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TÍTULOS
                  const Text(
                    'Crea una nueva\ncontraseña',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1E2D),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tu nueva contraseña debe ser diferente a las que usaste antes.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // INPUT NUEVA CONTRASEÑA
                  const Text(
                    'Nueva contraseña',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D2D3A),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    onChanged: (val) {
                      _checkPasswordRequirements(val);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black45,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Color(0xFF8E2DE2), width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // INPUT CONFIRMAR CONTRASEÑA
                  const Text(
                    'Confirmar contraseña',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D2D3A),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: const TextStyle(color: Colors.black26),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.black45,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: Color(0xFF8E2DE2), width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // LISTA DE REQUISITOS (EN TIEMPO REAL)
                  _buildRequirementItem('Mínimo 8 caracteres', _hasMinLength),
                  const SizedBox(height: 8),
                  _buildRequirementItem('Al menos una mayúscula', _hasUppercase),
                  const SizedBox(height: 8),
                  _buildRequirementItem('Al menos un número', _hasNumber),

                  const SizedBox(height: 32),

                  // BOTÓN RESTABLECER CONTRASEÑA
                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: LinearGradient(
                        colors: _isFormValid
                            ? [const Color(0xFF7F00FF), const Color(0xFFE100FF)]
                            : [
                                const Color(0xFF7F00FF).withValues(alpha: 0.5),
                                const Color(0xFFE100FF).withValues(alpha: 0.5)
                              ],
                      ),
                      boxShadow: _isFormValid
                          ? [
                              BoxShadow(
                                color: const Color(0xFF7F00FF).withValues(alpha: 0.35),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ]
                          : [],
                    ),
                    child: ElevatedButton(
                      onPressed: _handleResetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Restablecer contraseña',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET AUXILIAR PARA REQUISITOS
  Widget _buildRequirementItem(String text, bool isFulfilled) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: 18,
          color: isFulfilled ? const Color(0xFF2E7D32) : Colors.grey.shade300,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: isFulfilled ? const Color(0xFF2E7D32) : Colors.black45,
            fontWeight: isFulfilled ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}