import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/get_color.dart';

class Days extends StatefulWidget {
  Days({
    Key? key,
    required this.dateFormat,
    required this.data,
    required this.size,
    this.colors,
  }) : super(key: key);

  final dateFormat;
  final data;
  final size;
  final String? colors;

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  @override
  Widget build(BuildContext context) {
    Color? color = widget.colors != null ? GetColor.getColor(widget.colors!) : null;
    
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        margin: const EdgeInsets.only(
          right: 20,
          bottom: 20,
          top: 20,
        ),
        width: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.dateFormat.split(',')[1],
              style: TextStyle(
                color: Color(0xFFE8FCFF),
                fontSize: 10,
              ),
            ),
            Image.network(
              'https:${widget.data[1]}',
              width: 45,
              fit: BoxFit.fill,
            ),
            Text(
              '${widget.data[0]}°C',
              style: const TextStyle(
                color: Color(0xFFE8FCFF),
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
   }
}
