import 'package:booking/commons/widgets/simplenetworkimage.dart';
import 'package:flutter/material.dart';

class NetworkImageHeroPage extends StatelessWidget {
  const NetworkImageHeroPage({super.key, required this.uri, required this.tag});

  final String uri;
  final Object tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: Hero(
          tag: tag,
          child: SimpleNetworkImage(uri: uri, fit: BoxFit.contain),
        )),
      ),
    );
  }
}
