import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

const confirm = 'Confirmar';

class CreateSessionConfirmButton extends StatelessWidget {
  final VoidCallback onTap;
  const CreateSessionConfirmButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [BoxShadow(
                  offset: Offset.fromDirection(1, 1.5),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  color: AppColors.shadow
              )]
          ),
          child: const Center(child: Text(confirm, style: TextStyle(color: AppColors.white, fontSize: 28),)),
        ),
      ),
    );
  }
}
