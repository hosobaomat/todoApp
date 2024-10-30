import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class Cardbody extends StatelessWidget {
  var ten;

  Cardbody({
    super.key,
    required this.ten,
    required this.idd,
  });
  final Function idd;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: const Color(0xffDFDFDF),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              ten.name,
              style: const TextStyle(
                  color: Color(0xff4B4b4b),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
            onTap: () async {
              if (await confirm(context)) {
                return idd(ten.id);
              }
              return print('pressCancel');
            },
            child: const Icon(
              Icons.delete_outline,
              color: Color(0xff4b4b4b),
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
