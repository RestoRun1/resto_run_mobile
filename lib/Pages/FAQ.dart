import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/helper.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FAQ extends StatefulWidget {
  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final double TOGGLE_BUTON_WIDTH = 200;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: AppColors.darkGreen),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Padding(
                padding: const  EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(9)),
                        child: BackButton(
                          color: AppColors.lightGreen,
                        )),
                    
                    Text("FAQ", style: TextStyle(color: AppColors.white),),
                  ],
                ),
              ),

              const Spacer(),
              Container(

                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                height: 0.8 * MediaQuery.sizeOf(context).height,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 0.1 * currentHeight,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Scrollbar(
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () => {
                                      setState(
                                        () => index = 0,
                                      )
                                    },
                                child: Text("Card"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        index == 0
                                            ? AppColors.black
                                            : AppColors.backgroundLightWhite),
                                    foregroundColor: MaterialStateProperty.all(
                                        index == 0
                                            ? AppColors.white
                                            : AppColors.black))),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () => {
                                      setState(
                                        () => index = 1,
                                      )
                                    },
                                child: Text("Refund"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        index == 1
                                            ? AppColors.black
                                            : AppColors.backgroundLightWhite),
                                    foregroundColor: MaterialStateProperty.all(
                                        index == 1
                                            ? AppColors.white
                                            : AppColors.black))),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () => {
                                      setState(
                                        () => index = 2,
                                      )
                                    },
                                child: Text("Crypto"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        index == 2
                                            ? AppColors.black
                                            : AppColors.backgroundLightWhite),
                                    foregroundColor: MaterialStateProperty.all(
                                        index == 2
                                            ? AppColors.white
                                            : AppColors.black))),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () => {
                                      setState(
                                        () => index = 3,
                                      )
                                    },
                                child: Text("Credit"),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        index == 3
                                            ? AppColors.black
                                            : AppColors.backgroundLightWhite),
                                    foregroundColor: MaterialStateProperty.all(
                                        index == 3
                                            ? AppColors.white
                                            : AppColors.black))),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    QuestionSection(
                        title: "How to change mobile phone on the app?",
                        expandedText:
                            "Lorem ipsum dolor sit amet consectetur. Eget tortor purus et ornare pharetra pretium. Neque fermentum enim pharetra faucibus. Ipsum eu nunc nunc eu pharetra id volutpat in. Ipsum vel amet in et varius adipiscing morbi lorem.")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionSection extends StatefulWidget {
  final String title;
  final String expandedText;

  const QuestionSection({
    Key? key,
    required this.title,
    required this.expandedText,
  }) : super(key: key);

  @override
  State<QuestionSection> createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection>
    with SingleTickerProviderStateMixin {
  TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  bool isExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.textGrey),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                  if (isExpanded) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(widget.title, style: textStyle, softWrap: true,)),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: _controller.view,
              child: isExpanded
                  ? Text(
                      widget.expandedText,
                      style: TextStyle(fontSize: 16),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
