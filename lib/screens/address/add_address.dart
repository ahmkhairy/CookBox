import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:karsome/infrastructure/models/address_model.dart';
import 'package:karsome/infrastructure/services/address_services.dart';
import 'package:karsome/screens/address/widgets/address_app_bar.dart';
import 'package:karsome/screens/address/widgets/custom_text.dart';

class AddAddressView extends StatefulWidget {
  String address;
  String area;
  String bName;
  String floor;
  String apartment;
  String additional;

  AddAddressView(
      {super.key,
      required this.address,
      required this.area,
      required this.bName,
      required this.floor,
      required this.apartment,
      required this.additional});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

bool isLoading = false;

class _AddAddressViewState extends State<AddAddressView> {
  AddressServices addressServices = AddressServices();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController bNameController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController apartController = TextEditingController();
  TextEditingController additionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: addressAppBar('Add Address'),
        body: _getUI(context),
      ),
    );
  }

  Widget _getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Add Address', fontSize: 20),
            const SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Address Name (required)',
              fontSize: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            _getTextField(widget.address.isEmpty ? '' : widget.address,
                controller: addressController),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Area (required)',
              fontSize: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            _getTextField(widget.area.isEmpty ? "" : widget.area,
                controller: areaController),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Building Name (required)',
              fontSize: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            _getTextField(widget.bName.isEmpty ? "" : widget.bName,
                controller: bNameController),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Floor',
                        fontSize: 10,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _getTextField(widget.floor.isEmpty ? "" : widget.floor,
                          controller: floorController),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Apartment',
                        fontSize: 10,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _getTextField(
                          widget.apartment.isEmpty ? "" : widget.apartment,
                          controller: apartController),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Additional Information',
              fontSize: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            _getTextField(widget.additional.isEmpty ? "" : widget.additional,
                controller: additionalController, line: 7, hight: 140),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Add Address',
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _getTextField(String text,
      {int line = 1, double hight = 50, TextEditingController? controller}) {
    return SizedBox(
      height: hight,
      child: TextField(
        controller: controller,
        maxLines: line,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          hintText: text,
          hintStyle: const TextStyle(fontSize: 11),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }
}
