import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_app_v1/constants/color_constant.dart';
import 'package:ui_app_v1/models/card_model.dart';
import 'package:ui_app_v1/models/operation_model.dart';
import 'package:ui_app_v1/models/transaction_model.dart';

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
      body: SafeArea(
        child: Container(
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
                              color: kBlackColor)),
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
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 29, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Operations',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor),
                    ),
                    Row(
                        children: map<Widget>(datas, (index, selected) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 9,
                        width: 9,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                current == index ? kBlueColor : kTwentyBlueColor),
                      );
                    })),
                  ],
                ),
              ),
              SizedBox(
                  height: 123,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: datas.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                          isSelected: current == index,
                          operation: datas[index].name,
                          selectedIcon: datas[index].selectedIcon,
                          unselectedIcon: datas[index].unselectedIcon,
                        ),
                      );
                    }),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, bottom: 13, top: 29, right: 10),
                child: Text(
                  'Transaction Histories',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                ),
              ),
              ListView.builder(
                itemCount: transactions.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 76,
                    margin: const EdgeInsets.only(bottom: 13),
                    padding: const EdgeInsets.only(
                        left: 24, top: 12, bottom: 12, right: 22),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: kTenBlackColor,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(8.0, 8.0),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Row(
                          children: [
                            Container(
                              height: 57,
                              width: 57,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage(transactions[index].photo))),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(transactions[index].name,
                                    style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: kBlackColor)),
                                Text(transactions[index].date,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: kGreyColor)),
                              ],
                            )
                          ],
                        ),
                        Row(children: [
                          Text(transactions[index].amount,
                                    style: GoogleFonts.inter(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: kBlueColor)),
                        ],)
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String? operation;
  final String? selectedIcon;
  final String? unselectedIcon;
  final bool? isSelected;
  const OperationCard(
      {Key? key,
      this.operation,
      this.selectedIcon,
      this.unselectedIcon,
      this.isSelected})
      : super(key: key);

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 123,
      width: 123,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(8.0, 8.0),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected! ? kBlueColor : kWhiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.isSelected!
              ? widget.selectedIcon!
              : widget.unselectedIcon!),
          Text(widget.operation!,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: widget.isSelected! ? kWhiteColor : kBlackColor))
        ],
      ),
    );
  }
}
