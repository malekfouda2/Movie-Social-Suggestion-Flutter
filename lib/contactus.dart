import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_app/my_drawer.dart';

import 'my_drawer.dart';

class contactUs extends StatelessWidget {
  const contactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           drawer: const MyDrawer(),

    );
  }
}
