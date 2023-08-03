import 'package:api_project/controller.dart';
import 'package:api_project/store_info/store_info_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'order/order_controller.dart';
import 'order/order_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());
  // final homeController = Get.put(HomeController(),permanent: false);
  final storeInfoController = Get.put(StoreInfoController(), permanent: false);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreInfoController>(
        init: StoreInfoController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: const Color(0xffF5F6FB),
            appBar: AppBar(
              centerTitle: false,
              title: storeInfoController.isLoading
                  ? Text("Welcome ${storeInfoController.data.firstName ?? ""}")
                  : const Text(""),
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: const EdgeInsets.only(left: 180, right: 10),
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: const Color(0xffB8256E),
                              ),
                              width: 5,
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        storeInfoController.isLoading
                                            ? Text(
                                                storeInfoController.data.slug ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const Text(""),
                                        DropdownButton(
                                            hint: const Text(
                                              "Switch Store",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            underline: const SizedBox(),
                                            items: controller
                                                .restoreModel()
                                                .map<DropdownMenuItem>(
                                                    (e) => DropdownMenuItem(
                                                          value: e.slug,
                                                          child: (TextButton(
                                                            onPressed: () {
                                                              controller
                                                                  .switchStore(
                                                                      e.id);
                                                            },
                                                            child: Text(e.slug),
                                                          )),
                                                        ))
                                                .toList(),
                                            onChanged: (value) {}),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.logout_outlined,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.storefront_rounded,
                    color: Color(0xffB8256E),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (orderController) {
                          return orderController.isLoading
                              ? Column(
                                  children: [
                                    SfCartesianChart(
                                        axes: <ChartAxis>[
                                          NumericAxis(
                                              majorGridLines:
                                                  const MajorGridLines(
                                                      width: 0),
                                              majorTickLines:
                                                  const MajorTickLines(
                                                width: 0,
                                              ),

                                              //Hide the axis line of y-axis
                                              axisLine: AxisLine(width: 0),
                                              opposedPosition: true,
                                              name: "yAxis",
                                              minimum: 0,
                                              maximum: 20,
                                              interval: 5),
                                        ],
                                        primaryXAxis: CategoryAxis(
                                            majorGridLines:
                                                const MajorGridLines(width: 0),
                                            majorTickLines:
                                                const MajorTickLines(
                                              width: 0,
                                            ),

                                            //Hide the axis line of y-axis
                                            axisLine: const AxisLine(width: 0)),
                                        primaryYAxis: NumericAxis(
                                            minimum: 0,
                                            maximum: 800,
                                            interval: 200,
                                            axisLine: const AxisLine(width: 0),
                                            majorTickLines:
                                                const MajorTickLines(
                                              width: 0,
                                            ),
                                            majorGridLines: MajorGridLines(
                                                color: const Color(0xffE4E4E4)
                                                    .withOpacity(0.7))),
                                        tooltipBehavior:
                                            orderController.tooltip,
                                        plotAreaBorderWidth: 0,
                                        series: <ChartSeries<ChartData,
                                            String>>[
                                          ColumnSeries<ChartData, String>(
                                              width: 0.5,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25),
                                                      topRight:
                                                          Radius.circular(25)),
                                              spacing: 0.2,
                                              dataSource: orderController.datas,
                                              xValueMapper:
                                                  (ChartData data, _) => data.z,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                              name: '',
                                              color: const Color.fromRGBO(
                                                  64, 154, 122, 1.0)),
                                          ColumnSeries<ChartData, String>(
                                              spacing: 0.2,
                                              width: 0.5,
                                              dataSource:
                                                  orderController.datas1,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25),
                                                      topRight:
                                                          Radius.circular(25)),
                                              xValueMapper:
                                                  (ChartData data, _) => data.z,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                              xAxisName: "xAxis",
                                              yAxisName: "yAxis",
                                              name: '',
                                              color: const Color.fromRGBO(
                                                  196, 6, 81, 1.0)),
                                        ]),
                                        orderController.data.isNotEmpty
                                        ?SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                              itemCount: 4,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                var date = DateTime.parse(
                                                    orderController
                                                        .data[index].createdAt);
                                                print(date);
                                                return ListTile(
                                                    title: Text(orderController
                                                            .data[index]
                                                            .variants?[0]
                                                            .variant
                                                            ?.product
                                                            ?.name ??
                                                        ""),
                                                    trailing:
                                                        Text(date.toString()));
                                              })

                                    ):const Text("There are no orders"),
                                    Container(
                                      margin: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                           Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              child: Text("Free Membership",
                                                  style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width/ 24.5,
                                                      fontWeight: FontWeight.bold))),
                                          Stack(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 40.0,
                                                    horizontal: 40),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("Sales"),
                                                    Text("10000 SAR")
                                                  ],
                                                ),
                                              ),
                                              SfLinearGauge(
                                                  barPointers: [
                                                    LinearBarPointer(
                                                      color: const Color(
                                                          0xffB8256E),
                                                      value: orderController.sum
                                                          .toDouble(),
                                                      position:
                                                          LinearElementPosition
                                                              .cross,
                                                      edgeStyle: LinearEdgeStyle
                                                          .bothCurve,
                                                    )
                                                  ],
                                                  showTicks: false,
                                                  showLabels: false,
                                                  minimum: 0.0,
                                                  maximum: 10000.0,
                                                  markerPointers: [
                                                    LinearWidgetPointer(
                                                      value: orderController.sum
                                                          .toDouble(),
                                                      position:
                                                          LinearElementPosition
                                                              .outside,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            const Image(
                                                              image: AssetImage(
                                                                  "assets/popup.png"),
                                                              width: 70,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          5.0),
                                                              child: Text(
                                                                  orderController
                                                                      .sum
                                                                      .toString()),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    LinearShapePointer(
                                                      width: 20,
                                                      height: 20,
                                                      borderWidth: 2,
                                                      borderColor: const Color(
                                                          0xffB8256E),
                                                      color:
                                                          Colors.grey.shade50,
                                                      value: orderController.sum
                                                          .toDouble(),
                                                      position:
                                                          LinearElementPosition
                                                              .cross,
                                                      shapeType:
                                                          LinearShapePointerType
                                                              .circle,
                                                      markerAlignment:
                                                          LinearMarkerAlignment
                                                              .center,
                                                    ),
                                                    LinearShapePointer(
                                                      width: 11,
                                                      height: 11,
                                                      color: const Color(
                                                          0xffB8256E),
                                                      value: orderController.sum
                                                          .toDouble(),
                                                      position:
                                                          LinearElementPosition
                                                              .cross,
                                                      shapeType:
                                                          LinearShapePointerType
                                                              .circle,
                                                      markerAlignment:
                                                          LinearMarkerAlignment
                                                              .center,
                                                    ),
                                                  ],
                                                  orientation:
                                                      LinearGaugeOrientation
                                                          .horizontal,
                                                  axisTrackStyle:
                                                      LinearAxisTrackStyle(
                                                    color: Colors.grey.shade300,
                                                    edgeStyle: LinearEdgeStyle
                                                        .bothCurve,
                                                    thickness: 6.0,
                                                  )),
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text(
                                              "Include",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color: Color(0xffB8256E),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        "Up to 10K Monthly Sales")
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .check_circle_rounded,
                                                        color:
                                                            Color(0xffB8256E)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("1 User ")
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.lock_open,
                                                        color: Colors.grey),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Email Support",
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8)),
                                                  color: Color(0xffFAE6EF),
                                                ),
                                                width: double.infinity,
                                                height: 80,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 110,
                                                        vertical: 13),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Color(0xffB8256E),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8))),
                                                  onPressed: () {},
                                                  child: const Text(
                                                    "Upgrade",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      )),
                                );
                        }),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) {
                    //
                    //     return ListTile(
                    //       title: TextButton(onPressed: () {
                    //         controller.switchStore(controller.restoreModel()[index].id);
                    //       }, child: Text(controller.restoreModel()[index].slug),),);},
                    //   itemCount: controller.restoreModel().length,
                    // )

                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          controller.logout();
                        },
                        child: const Text("Logout"))
                  ],
                ),
              ),
            ),

            // SingleChildScrollView(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       children: [
            //
            //         ListView.builder(
            //           shrinkWrap: true,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: TextButton(
            //                 onPressed: () {
            //                   controller
            //                       .switchStore(controller.restoreModel()[index].id);
            //                 },
            //                 child: Text(controller.restoreModel()[index].slug),
            //               ),
            //             );
            //           },
            //           itemCount: controller.restoreModel().length,
            //         ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         ElevatedButton(
            //             onPressed: () async {
            //               controller.logout();
            //             },
            //             child: const Text("Logout"))
            //       ],
            //     ),
            //   ),
            // ),
          );
        });
  }
}
