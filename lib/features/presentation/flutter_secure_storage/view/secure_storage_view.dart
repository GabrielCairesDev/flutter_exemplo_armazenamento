import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/core/widgets/crud_buttons_widget.dart';
import 'package:flutter_exemplo_armazenamento/core/widgets/text_form_field_widget.dart';
import 'package:flutter_exemplo_armazenamento/features/presentation/flutter_secure_storage/viewmodel/secure_storage_view_model.dart';

class SecureStorageView extends StatelessWidget {
  const SecureStorageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SecureStorageViewModel();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.blue,
              child: Column(
                spacing: 24,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Shared Preferences valor salvo:',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  Text(
                    '>> ${viewModel.value} <<',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  TextFormFieldWidget(
                    controller: viewModel.textEditingController,
                  ),

                  CrudButtonsWidget(
                    onTapCreate: () => viewModel.create(context),
                    onTapRead: () => viewModel.read(context),
                    onTapUpdate: () => viewModel.update(context),
                    onTapDelete: () => viewModel.delete(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
