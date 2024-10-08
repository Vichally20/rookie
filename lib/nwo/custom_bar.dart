import 'package:flutter/material.dart';
import 'package:onkyr/utils/config.dart';

class CustomBar extends StatefulWidget implements PreferredSizeWidget{
  const CustomBar({super.key, this.appTitle, this.route, this.icon, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String? appTitle;
  final String? route;
  final Icon? icon;
  final List<Widget>? actions;

  @override
  State<CustomBar> createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomBar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: const Color(0xFFD6E8EE),
      title: Text(
        widget.appTitle!,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      leading: widget.icon != null
          ? Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        child: IconButton(
          onPressed: () {
            if( widget.route != null){
              Navigator.of(context).pushNamed(widget.route!);
            }else{
              Navigator.of(context).pop();
            }
          },
          icon: widget.icon!,
          iconSize: 16,
          color: Colors.white,
        ),
      )
          : null,
      actions: widget.actions ?? null,  
    );
  }
}