import 'package:flutter/material.dart';
import 'package:karsome/helper/navigationHelper.dart';
import 'package:karsome/infrastructure/models/address_model.dart';
import 'package:karsome/infrastructure/services/address_services.dart';
import 'package:karsome/infrastructure/services/getUserId.dart';
import 'package:karsome/screens/address/add_address.dart';
import 'package:karsome/screens/address/widgets/address_app_bar.dart';
import 'package:karsome/screens/address/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addressAppBar('Address'),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Addresses',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          StreamProvider.value(
            value: AddressServices().fetchUserRecord(getUserID()),
            initialData: AddAddressModel(),
            builder: (context, child) {
              AddAddressModel address = context.watch<AddAddressModel>();
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Address :',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: address.address.toString(),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: 'Area :',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            address.area.toString().isEmpty
                                ? const Text('Not Available')
                                : CustomText(
                                    text: address.area.toString(),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: 'Floor :',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: address.floor.toString(),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: 'Appartment :',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: address.apartment.toString(),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: 'Aditional Information :',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: address.additionalInfo.toString(),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ),
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
                          onPressed: () {
                            NavigationHelper.pushRoute(
                                context,
                                AddAddressView(
                                  address: address.address.toString(),
                                  area: address.area.toString(),
                                  bName: address.buildingName.toString(),
                                  floor: address.floor.toString(),
                                  apartment: address.apartment.toString(),
                                  additional: address.additionalInfo.toString(),
                                ));
                          },
                          child: const Text(
                            'Add Address',
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
