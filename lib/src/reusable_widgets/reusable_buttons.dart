import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final IconData buttonIcon;
  final String title;
  final String subTitle;
  final Widget page;
  const ResetButton({
    super.key, required this.buttonIcon, required this.title, required this.subTitle, required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(buttonIcon,size: 60,),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: Theme.of(context).textTheme.titleLarge,),
                Text(subTitle,style: Theme.of(context).textTheme.bodyMedium,)
              ],
            )
          ],
        ),
      ),
    );
  }
}