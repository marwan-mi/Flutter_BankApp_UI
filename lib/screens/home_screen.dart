import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_app_v1/constants/color_constant.dart';
import 'package:ui_app_v1/models/card_model.dart';
import 'package:ui_app_v1/models/operation_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // indicator
  int current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/svg/drawer_icon.svg'),
                    Container(
                        height: 59,
                        width: 59,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/user_image.png')),
                        ))
                  ]),
            ),
            // Card
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54)),
                    Text('Amanda Alex',
                        style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                  ]),
            ),
            SizedBox(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 6),
                itemBuilder: (context, index) {
                  return Container(
                    height: 199,
                    width: 344,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(cards[index].cardBackground!),
                    ),
                    child: Stack(children: [
                      Positioned(
                          child: SvgPicture.asset(cards[index].cardElementTop)),
                      Positioned(
                        child: SvgPicture.asset(cards[index].cardElementBottom),
                        bottom: 0,
                        right: 0,
                      ),
                      Positioned(
                        left: 29,
                        top: 48,
                        child: Text(
                          'CARD NUMBER',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 65,
                        child: Text(
                          cards[index].cardNumber,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor),
                        ),
                      ),
                      Positioned(
                        right: 21,
                        top: 35,
                        child: Image.asset(cards[index].cardType),
                        width: 27,
                        height: 27,
                      ),
                      Positioned(
                        left: 29,
                        bottom: 45,
                        child: Text(
                          'CARD HOLDNAME',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        bottom: 21,
                        child: Text(
                          cards[index].user,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor),
                        ),
                      ),
                      Positioned(
                        left: 202,
                        bottom: 45,
                        child: Text(
                          'EXPIRY DATE',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kWhiteColor),
                        ),
                      ),
                      Positioned(
                        left: 202,
                        bottom: 21,
                        child: Text(
                          cards[index].user,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor),
                        ),
                      ),
                    ]),
                  );
                },
                itemCount: cards.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 13, top: 29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Operations'),
                  Row(
                      children: map<Widget>(datas, (index, selected) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      height: 9,
                      width: 9,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == index ? kBlueColor : kTwentyBlueColor),
                    );
                  })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
