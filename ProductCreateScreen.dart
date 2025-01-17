
import 'package:flutter/cupertino.dart';
import 'package:crud/RestAPI/RestClient.dart';
import 'package:crud/style/style.dart';
import 'package:flutter/material.dart';

class ProductCreatescreen extends StatefulWidget {
  const ProductCreatescreen({super.key});

  @override
  State<ProductCreatescreen> createState() => _ProductcreatescreenState();
}

class _ProductcreatescreenState extends State<ProductCreatescreen> {

  Map<String, String> FromValues={"Img":"", "ProductCode":"", "ProductName":"", "Qty":"", "TotalPrice":"", "UnitPrice":""};
  bool Loading=false;

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
      //await ProductCreateRequest(FromValues); // Product update....
      setState(() {
        Loading=false;
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Product'),),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading? (Center(child: CircularProgressIndicator(),)):((SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(onChanged: (Textvalue){
                    InputOnChange("ProductName", Textvalue);
                  },decoration: AppInputDecoration('Product Name'),),

                  SizedBox(height: 20),
                  TextFormField(onChanged: (Textvalue){
                    InputOnChange("ProductCode", Textvalue);
                  },decoration: AppInputDecoration('Product Code'),),

                  SizedBox(height: 20),
                  TextFormField(onChanged: (Textvalue){
                    InputOnChange("Img", Textvalue);
                  },decoration: AppInputDecoration('Product Image'),),

                  SizedBox(height: 20),
                  TextFormField(onChanged: (Textvalue){
                    InputOnChange("UnitPrice", Textvalue);
                  },decoration: AppInputDecoration('Unit Price'),),

                  SizedBox(height: 20),
                  TextFormField(onChanged: (Textvalue){
                    InputOnChange("TotalPrice", Textvalue);
                  },decoration: AppInputDecoration('Total Price'),),

                  SizedBox(height: 20),

                  AppDropDownStyle(
                    DropdownButton(
                      value: FromValues['Qty'],
                      items: const [
                        DropdownMenuItem(child: Text('Select Qty'), value: "",),
                        DropdownMenuItem(child: Text('1 Pcs'), value: "1 Pcs",),
                        DropdownMenuItem(child: Text('2 Pcs'), value: "2 Pcs",),
                        DropdownMenuItem(child: Text('3 Pcs'), value: "3 Pcs",),
                        DropdownMenuItem(child: Text('4 Pcs'), value: "4 Pcs",)
                      ],
                      onChanged: (Textvalue){
                        InputOnChange("Qty", Textvalue);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
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
