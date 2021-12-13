import 'package:flutter/material.dart';
import 'package:marvel_chars/core/extension/context_extension.dart';

import 'package:marvel_chars/view/home/model/marvel_results.dart';

class MarvelCard extends StatelessWidget {
  final MarvelResults chars;
  const MarvelCard({Key? key, required this.chars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(chars.thumbnail.thumbnailPic),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            width: context.width * 0.3,
            height: context.height * 0.2,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  chars.name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
