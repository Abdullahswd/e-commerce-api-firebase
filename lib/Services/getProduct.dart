import "package:e_commerce_api/model/product_model.dart";
import "package:http/http.dart" as http;

getProduct() async {
  Uri url = Uri.parse("https://dummyjson.com/products");
  var res = await http.get(url);
  try {
    if (res.statusCode == 200) {
      var data = productModelFromJson(res.body);
      return data.products;
    } else {
      print("if any error  ");
    }
  } catch (ex) {
    print(ex.toString());
  }
}
