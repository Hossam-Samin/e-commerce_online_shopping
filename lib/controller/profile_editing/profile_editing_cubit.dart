import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:e_commerce/controller/profile_editing/profile_editing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditing extends Cubit<ProfileEditingState> {
  ProfileEditing() : super(InitAppState());

  static ProfileEditing get(context) => BlocProvider.of(context);

  XFile? image;
  File? iimage;
  final ImagePicker _imagePicker = ImagePicker();

  Future pickImageFromGallary() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    iimage = File(image.path);
    emit(PickImageFromGallary());
  }

  Future pickImageFromCamera() async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (image == null) return null;
    iimage = File(image.path);
    emit(PickImageFromCamera());
  }
}
