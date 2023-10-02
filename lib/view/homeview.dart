import 'package:api_app/model/product_model_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Dio dio = Dio();
  List<ProductListModel> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(productList[index].title),
                  subtitle: Text(productList[index].description),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(productList[index].image),
                  ),
                  trailing: Text(productList[index].price.toString()),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: productList.length,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                fixedSize: MaterialStatePropertyAll(
                  Size(150, 30),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              onPressed: () {
                getproduct();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => GetDataScreen(),
                //     ));
              },
              child: Text("get Data"),
            ),
          ],
        ),
      ),
    );
  }

  getproduct() async {
    try {
      await dio.get("https://fakestoreapi.com/products").then((value) {
        productList = productListModelFromJson(value.data);
        debugPrint("get product successfull");
        setState(() {});
      });
    } on DioException catch (error) {
      debugPrint(error.message);
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
