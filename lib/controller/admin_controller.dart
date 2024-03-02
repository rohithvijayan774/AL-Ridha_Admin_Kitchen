import 'dart:developer';
import 'dart:io';

import 'package:admin/Dashboard/home.dart';
import 'package:admin/models/deliveryboy_model.dart';
import 'package:admin/models/products_model.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminController extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  bool obscureText = true;
  FocusNode passwordFocus = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final addDelvBoyKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController userEmailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController vehiclenumbercontroller = TextEditingController();
  TextEditingController licensenumbercontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();

  void changeObscure() {
    obscureText = !obscureText;
    if (obscureText) {
      passwordFocus.unfocus();
    } else {
      passwordFocus.requestFocus();
    }
    notifyListeners();
  }

  Future<void> adminLogin(
    String username,
    String password,
    context,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: username, password: password);
      final admin = firebaseAuth.currentUser!.uid;

      if (admin == 'YEVbJHbAYMSI0D6m52Kc1u5Xagl1') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Home()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Check username or password')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Admin login failed : $e')));
    }
  }

/////////////////////////DELIVERY BOY///////////////////////////////////////
  DeliveryBoyModel? _deliveryBoyModel;
  DeliveryBoyModel get delierBoyModel => _deliveryBoyModel!;

  Future saveDeliveryboy(
    String delvryBoyName,
    String delvryBoyEmail,
    String delvryBoyPassword,
    String delvryBoyLicenseNumber,
    String delvryBoyMobileNumber,
    String delvryBoyVehicleNumber,
    context,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: delvryBoyEmail, password: delvryBoyPassword);
      final delvryBoyID = userCredential.user!.uid;

      _deliveryBoyModel = DeliveryBoyModel(
          delvryBoyID: delvryBoyID,
          delvryBoyName: delvryBoyName,
          delvryBoyEmail: delvryBoyEmail,
          delvryBoyLicenseNumber: delvryBoyLicenseNumber,
          delvryBoyMobileNumber: delvryBoyMobileNumber,
          delvryBoyVehicleNumber: delvryBoyVehicleNumber);

      await firebaseFirestore
          .collection('deliveryBoys')
          .doc(delvryBoyID)
          .set(_deliveryBoyModel!.toMap());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
              inMaterialBanner: true,
              title: 'Success',
              message: 'Delivery Boy Successfully Created',
              contentType: ContentType.success)));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: AwesomeSnackbarContent(
                inMaterialBanner: true,
                title: 'Failed',
                message: 'Weak Password',
                contentType: ContentType.failure)));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: AwesomeSnackbarContent(
                inMaterialBanner: true,
                title: 'Failed',
                message: 'Email already in use',
                contentType: ContentType.failure)));
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<DeliveryBoyModel> deliveryBoysList = [];
  DeliveryBoyModel? deliveryBoy;

  Future fetchDeliveryBoys() async {
    try {
      deliveryBoysList.clear();
      CollectionReference doctorsRef =
          firebaseFirestore.collection('deliveryBoys');
      QuerySnapshot doctorsSnapshot = await doctorsRef.get();

      for (var doc in doctorsSnapshot.docs) {
        String delvryBoyID = doc['delvryBoyID'];
        String delvryBoyName = doc['delvryBoyName'];
        String delvryBoyEmail = doc['delvryBoyEmail'];
        String delvryBoyLicenseNumber = doc['delvryBoyLicenseNumber'];
        String delvryBoyMobileNumber = doc['delvryBoyMobileNumber'];
        String delvryBoyVehicleNumber = doc['delvryBoyVehicleNumber'];

        deliveryBoy = DeliveryBoyModel(
            delvryBoyID: delvryBoyID,
            delvryBoyName: delvryBoyName,
            delvryBoyEmail: delvryBoyEmail,
            delvryBoyLicenseNumber: delvryBoyLicenseNumber,
            delvryBoyMobileNumber: delvryBoyMobileNumber,
            delvryBoyVehicleNumber: delvryBoyVehicleNumber);
        deliveryBoysList.add(deliveryBoy!);
      }
    } catch (e) {
      print(e);
    }
  }

  ////////////////////////ADD PRODUCTS/////////////////////////////////////////
  TextEditingController productTitlecontroller = TextEditingController();
  TextEditingController productPiccontroller = TextEditingController();
  TextEditingController productDescriptioncontroller = TextEditingController();
  TextEditingController productPricecontroller = TextEditingController();
  TextEditingController productOffercontroller = TextEditingController();

  void clearFields() {
    productTitlecontroller.clear();
    productPiccontroller.clear();
    productDescriptioncontroller.clear();
    productPricecontroller.clear();
    productOffercontroller.clear();
    pickProductPic = null;
    notifyListeners();
  }

  ProductsModel? _prodcutsModel;
  ProductsModel get productsModel => _prodcutsModel!;

  Future storeProducts(
      String productTitle,
      String productImage,
      String productDescription,
      int productPrice,
      int productOffer,
      String collectionName,
      context) async {
    try {
      final docID = firebaseFirestore.collection(collectionName).doc();
      _prodcutsModel = ProductsModel(
          productID: docID.id,
          productTitle: productTitle,
          productDescription: productDescription,
          productImage: productImage,
          productPrice: productPrice,
          productOffer: productOffer);

      await docID.set(_prodcutsModel!.toMap());
      await firebaseFirestore
          .collection('My Shop')
          .doc(docID.id)
          .set(_prodcutsModel!.toMap());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
              inMaterialBanner: true,
              title: 'Success',
              message: 'New Item Successfully Created',
              contentType: ContentType.success)));
      notifyListeners();
    } catch (e) {
      print('//////////////failed to store data : $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
              inMaterialBanner: true,
              title: 'Failed',
              message: 'Failed to store new items : $e',
              contentType: ContentType.failure)));
    }
  }

  List<ProductsModel> productsList = [];
  ProductsModel? products;
  Future fetchProducts(String collection) async {
    try {
      productsList.clear();
      CollectionReference productsRef =
          firebaseFirestore.collection(collection);
      QuerySnapshot productsSnapshot = await productsRef.get();

      for (var doc in productsSnapshot.docs) {
        String productID = doc['productID'];
        String productTitle = doc['productTitle'];
        String productImage = doc['productImage'];
        String productDescription = doc['productDescription'];
        int productPrice = doc['productPrice'];
        int productOffer = doc['productOffer'];

        products = ProductsModel(
            productID: productID,
            productTitle: productTitle,
            productDescription: productDescription,
            productImage: productImage,
            productPrice: productPrice,
            productOffer: productOffer);

        productsList.add(products!);
      }
    } catch (e) {
      print('Fetching products failed :$e');
    }
  }

  int productPrice = 0;
  int productOffer = 0;

  void changeData(
    int data,
    TextEditingController controller,
  ) {
    data = int.parse(controller.text);
    notifyListeners();
  }

  //////////////////////////////////

  File? pickProductPic;
  Uint8List webImage = Uint8List(0);

  Future<void> selectProductPic() async {
    try {
      if (!kIsWeb) {
        final pickedPic =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (pickedPic != null) {
          pickProductPic = File(pickedPic.path);
        }
      } else {
        final ImagePicker picker = ImagePicker();
        XFile? image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          var img = await image.readAsBytes();
          webImage = Uint8List.fromList(img);
          pickProductPic = File(image.path);
          print('////////////////// Image picked');
          notifyListeners();
        }
      }
    } catch (e) {
      print('Image select failed : $e');
    }
    notifyListeners();
  }

  Future<String> uploadProductPic(String picName, String path) async {
    try {
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');

      if (!kIsWeb && pickProductPic != null) {
        String filePath = '$path/$picName';
        Reference ref = FirebaseStorage.instance.ref().child(filePath);
        UploadTask uploadTask = ref.putFile(pickProductPic!, metadata);
        TaskSnapshot snapshot = await uploadTask;
        String downloadURL = await snapshot.ref.getDownloadURL();
        print('Image uploaded to Firebase Storage: $downloadURL');
        return downloadURL;
      } else if (kIsWeb && webImage.isNotEmpty) {
        String filePath = '$path/$picName';
        Reference ref = FirebaseStorage.instance.ref().child(filePath);
        UploadTask uploadTask = ref.putData(webImage, metadata);
        TaskSnapshot snapshot = await uploadTask;
        String downloadURL = await snapshot.ref.getDownloadURL();
        print('Image uploaded to Firebase Storage: $downloadURL');
        return downloadURL;
      } else {
        print('No image selected');
        return ''; // Return empty string or handle error accordingly
      }
    } catch (e) {
      print('Image upload failed: $e');
      return ''; // Return empty string or handle error accordingly
    }
  }

  Future<void> uploadProductpic(
    String picName,
    String collection,
  ) async {
    String imageUrl = await uploadProductPic(picName, collection);
    log('//////////$imageUrl');
    if (imageUrl.isNotEmpty) {
      DocumentReference docRef =
          firebaseFirestore.collection(collection).doc(productsModel.productID);
      await docRef.update({'productImage': imageUrl});
      productsModel.productImage = imageUrl;
      _prodcutsModel = productsModel;

      notifyListeners();
    }
  }
}
