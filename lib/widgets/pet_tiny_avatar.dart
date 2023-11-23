import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetTinyAvatar extends StatelessWidget {
  final String? networkImageURL;
  const PetTinyAvatar({
    super.key,
    required this.networkImageURL,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: networkImageURL == null
          ? const AssetImage('assets/images/profile_pic.png')
          : NetworkImage(networkImageURL!) as ImageProvider<Object>,
    );
  }
}
