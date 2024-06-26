import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

class changeStatus extends StatefulWidget {
  const changeStatus({Key? key}) : super(key: key);

  @override
  State<changeStatus> createState() => _changeStatusState();
}

class _changeStatusState extends State<changeStatus> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order Tracker Demo"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Order Demo"),
            onPressed: () {
              orderSummaryBottomSheet(context);
            },
          ),
        ));
  }

  void orderSummaryBottomSheet(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: mQuery.size.height * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: OrderTracker(
                    status: Status.order,
                    activeColor: Colors.green,
                    inActiveColor: Colors.grey[300],
                    orderTitleAndDateList: orderList,
                    shippedTitleAndDateList: shippedList,
                    outOfDeliveryTitleAndDateList: outOfDeliveryList,
                    deliveredTitleAndDateList: deliveredList,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: mQuery.size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Color(0xff29b2fe),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: mQuery.size.height * 0.02,
                            color: Colors.white,
                            fontFamily: 'SatoshiBold',
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
