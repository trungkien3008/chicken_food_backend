import 'package:emax_backend/models/models.dart';
import 'package:emax_backend/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  
  final DatabaseService databaseService = DatabaseService();
  final DatabaseService database = DatabaseService();

  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(database.getProducts());
    super.onInit();
  }
  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity=> newProduct['quantity'];
  get isRecommended =>newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(int index, Product product,double value){
    product.price=value.toDouble();
    products[index]=product;

  }
  void updateProductQuantity(
    int index, Product product,int value
  ){
    product.quantity = value;
    products[index]=product;
  }
  void saveNewProductPrice(Product product, String field, double value) {
    database.updateField(product, field, value);
  }
void saveNewProductQuantity(Product product, String field, int value) {
    database.updateField(product, field, value);
  }
}