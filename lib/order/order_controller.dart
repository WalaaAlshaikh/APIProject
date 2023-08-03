import 'package:api_project/order/order_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../service.dart';
import 'order_screen.dart';

class OrderController extends GetxController{

  final service=AuthService();
  final storage=GetStorage();
  bool isLoading = false;
  var sum=0;

  late final List<DataOrder> data;
  late List<ChartData> datas;
  late List<ChartData> datas1;
  late TooltipBehavior tooltip;
  List<String> idString=[];
  List<DataOrder> idOrder=[];
  var seen =<String>{};
  @override
  void onInit() {
    datas = [
      ChartData('', 191,"1 week"),
      ChartData('', 750,"2 week"),
      ChartData('', 300,"3 week"),
      ChartData('', 530,"4 week"),
    ];
    datas1 = [
      ChartData('', 3,"1 week"),
      ChartData('', 1,"2 week"),
      ChartData('', 5,"3 week"),
      ChartData('', 20,"4 week"),
    ];
    tooltip = TooltipBehavior(enable: true);
    super.onInit();
    getOrder();
  }

  Future getOrder() async {
    await service.getOrders(onDone: (value){
     data= value.data;
     sum=data.fold(0, (prev, element) => prev + element.total);
     isLoading = true;
      update();
    }, onError: (value){
      Get.snackbar('Something went wrong', value,duration:Duration(minutes: 5) );
    });

  }

  List<DataOrder> orderExist(int index){
    idOrder=data.where((element) => seen.add(element.variants![index].variant!.product!.name)).toList();

return idOrder;
}


}