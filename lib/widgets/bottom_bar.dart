import 'package:trackandtrace/widgets/bottom_bar_column.dart';
import 'package:trackandtrace/widgets/info_text.dart';
import 'package:trackandtrace/widgets/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color.fromRGBO(119, 15, 42, 1),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    BottomBarColumn(
                      heading: 'Jon Mcarthur',
                      s1: '0421 817 781',
                      s2: 'jon@jmet.com.au',
                      // s3: '',
                    ),
                    BottomBarColumn(
                      heading: 'JME Office',
                      s1: '40/191-193 McCredie Rd,',
                      s2: 'Smithfield NSW, 2164',
                      // s3: '',
                    ),
                    BottomBarColumn(
                      heading: 'Track & Trace',
                      s1: 'Sign Up',
                      s2: 'Login',
                      // s3: '',
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 20),
                const InfoText(
                  type: 'Jon Mcarthur',
                  text: 'jon@jmet.com.au',
                ),
                const SizedBox(height: 5),
                const InfoText(
                  type: 'JME Office',
                  text: '40/191-193 McCredie Rd, Smithfield NSW, 2164',
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2019 | JME TRANSPORT',
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BottomBarColumn(
                      heading: 'Jon Mcarthur',
                      s1: '0421 817 781',
                      s2: 'jon@jmet.com.au',
                      //  s3: '',
                    ),
                    const BottomBarColumn(
                      heading: 'JME Office',
                      s1: '40/191-193 McCredie Rd,',
                      s2: 'Smithfield NSW, 2164',
                      //  s3: '',
                    ),
                    const BottomBarColumn(
                      heading: 'Track & Trace',
                      s1: 'Sign Up',
                      s2: 'Login',
                      //  s3: '',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        InfoText(
                          type: 'Jon Mcarthur',
                          text: 'jon@jmet.com.au',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'JME Office',
                          text: '40/191-193 McCredie Rd, Smithfield NSW, 2164',
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2019 | JME TRANSPORT',
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
