//Here the main controller
import 'package:flutter/material.dart';

bool getLogiado() {
  return false;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mensajeInferior(
  BuildContext context,
  String mensaje,
  Color? backgroundColor,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          mensaje,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: backgroundColor ?? const Color.fromARGB(255, 0, 0, 0),
    ),
  );
}
