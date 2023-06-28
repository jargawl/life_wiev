// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'login_body.dart';

// class EmailButton extends StatelessWidget {
//   const EmailButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return ElevatedButton(
//       onPressed: () => Navigator.of(context).push(LoginBody.route()),
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(
//           Colors.blue,
//         ),
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//         ),
//       ),
//       child: SizedBox(
//         width: 0.7 * screenWidth,
//         height: 40,
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(
//                 Icons.mail,
//                 size: 24,
//                 color: Colors.white,
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 'Login with email and password',
//                 style: GoogleFonts.wellfleet(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
