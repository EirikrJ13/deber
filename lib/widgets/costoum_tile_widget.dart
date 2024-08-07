import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CostoumTileWidget extends StatelessWidget {
  final IconData lead;
  final String label;
  final IconData end;
  final String route;

  const CostoumTileWidget({
    Key? key,
    required this.lead,
    required this.label,
    required this.route,
    this.end = Icons.arrow_forward_ios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(route),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          leading: Icon(
            lead,
            color: Theme.of(context).primaryColor,
            size: 28.0,
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          trailing: Icon(
            end,
            color: Theme.of(context).primaryColor,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
