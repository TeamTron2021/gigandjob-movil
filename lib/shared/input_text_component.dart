import 'package:flutter/material.dart';

class InputTextComponent extends StatelessWidget {
	final IconData icon;
	final String placelholder;
	final bool obscure;
	final TextEditingController controller;
	final onTap;
	final validator;
	final readOnly;
	const InputTextComponent({
		Key? key,
		required this.icon, 
		required this.placelholder, 
		required this.obscure, 
		required this.controller, 
		this.onTap,
		this.validator,
		this.readOnly = false
	}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return TextFormField(
			obscureText: obscure,
			enableSuggestions: false,
			autocorrect: false,
			controller: controller,
			onTap: onTap,
			validator: validator,
			readOnly: readOnly,
			decoration: InputDecoration(
				filled: true,
				fillColor: Colors.grey[200],
				prefixIcon: Icon(icon),
				hintText: placelholder,
      			border: OutlineInputBorder(
        			borderRadius: BorderRadius.circular(30.0),
            		borderSide: const BorderSide(
                		width: 0, 
                		style: BorderStyle.none,
            		),
      			),
			),
		);
	}

}
