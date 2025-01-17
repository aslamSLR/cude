
import 'package:flutter/cupertino.dart';
import 'package:crud/RestAPI/RestClient.dart';
import 'package:crud/style/style.dart';
import 'package:flutter/material.dart';

import 'ProductGridViewScreen.dart';


class ProductUpdateScreen extends StatefulWidget {

  final Map productItem;
  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {

  Map<String, String> FromValues={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  bool Loading=false;


  @override
  void initState(){
    setState(() {
      FromValues.update("Img", (value)=> widget.productItem["Img"]);
      FromValues.update("ProductCode", (value)=> widget.productItem["ProductCode"]);
      FromValues.update("ProductName", (value)=> widget.productItem["ProductName"]);
      //FromValues.update("Qty", (value)=> widget.productItem["Qty"]);
      FromValues.update("TotalPrice", (value)=> widget.productItem["TotalPrice"]);
      FromValues.update("UnitPrice", (value)=> widget.productItem["UnitPrice"]);
    });

  }

  InputOnChange(MapKey, Textvalue){
    setState(() {

      FromValues.update(MapKey, (value)=> Textvalue);
    });
  }

  FromOnSubmit() async {

    if(FromValues['Img']!.length==0){
      ErrorToast('Product image link required');
    }

    else if(FromValues['ProductCode']!.length==0){
      ErrorToast('Product code required');
    }

    else if(FromValues['ProductName']!.length==0){
      ErrorToast('Product name required');
    }

    else if(FromValues['Qty']!.length==0){
      ErrorToast('Qty required');
    }

    else if(FromValues['TotalPrice']!.length==0){
      ErrorToast('Total price required');
    }

    else if(FromValues['UnitPrice']!.length==0){
      ErrorToast('Unit price required');
    }
    else{
      setState(() {
        Loading=true;
      });
      await ProductUpdateRequest(FromValues,widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=> ProductGridViewScreen()),
          (Route route)=> false
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Product'),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              child: Loading? (Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: FromValues["ProductName"],
                      onChanged: (Textvalue){
                      InputOnChange("ProductName", Textvalue);
                    },decoration: AppInputDecoration('Product Name'),),

                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: FromValues["ProductCode"],
                      onChanged: (Textvalue){
                      InputOnChange("ProductCode", Textvalue);
                    },decoration: AppInputDecoration('Product Code'),),

                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: FromValues["Img"],
                      onChanged: (Textvalue){
                      InputOnChange("Img", Textvalue);
                    },decoration: AppInputDecoration('Product Image'),),

                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: FromValues["UnitPrice"],
                      onChanged: (Textvalue){
                      InputOnChange("UnitPrice", Textvalue);
                    },decoration: AppInputDecoration('Unit Price'),),

                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: FromValues["TotalPrice"],
                      onChanged: (Textvalue){
                      InputOnChange("TotalPrice", Textvalue);
                    },decoration: AppInputDecoration('Total Price'),),

                    SizedBox(height: 20),

                    AppDropDownStyle(
                      DropdownButton(
                        value: FromValues['Qty'],
                        items: [
                          DropdownMenuItem(child: Text('Select Qt'), value: ""),
                          DropdownMenuItem(child: Text('1 Pcs'), value: "1 Pcs"),
                          DropdownMenuItem(child: Text('2 Pcs'), value: "2 Pcs"),
                          DropdownMenuItem(child: Text('3 Pcs'), value: "3 Pcs"),
                          DropdownMenuItem(child: Text('4 Pcs'), value: "4 Pcs"),
                        ],
                        onChanged: (Textvalue){
                          InputOnChange("Qty",Textvalue);
                        },
                        underline: Container(),
                        isExpanded: true,
                      )
                    ),
                    SizedBox(height: 20),

                    Container(
                        child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: (){
                            FromOnSubmit();
                          },
                          child: SuccessButtonChild('Submit'),
                        )
                    )
                  ],
                ),
              )))
          )
        ],
      ),
    );
  }
}
