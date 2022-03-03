import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:officesv/utility/my_constant.dart';
import 'package:officesv/widgets/show_button.dart';
import 'package:officesv/widgets/show_form.dart';
import 'package:officesv/widgets/show_image.dart';
import 'package:officesv/widgets/show_text.dart';

class AddJOb extends StatefulWidget {
  const AddJOb({
    Key? key,
  }) : super(key: key);

  @override
  State<AddJOb> createState() => _AddJObState();
}

class _AddJObState extends State<AddJOb> {
  var factorKeys = <int>[
    1,
    2,
    3,
    4,
  ];

  int? choosedFactoryKey;
  String? chooseAgree, addDate;
  var itemChooses = <bool>[false, false, false];
  DateTime? dateTime;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  File? file;

  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
    addDate = dateFormat.format(dateTime!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('Add Job'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusScopeNode()),
        behavior: HitTestBehavior.opaque,
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              newImage(),
              newJob(),
              newDetail(),
              newFactoryKey(),
              displayCalculate(),
              newAgree(),
              chooseItem(),
              newAddDate(),
              ShowButton(label: 'Add JOb to Server', pressFunc: () {}),

              // choosedFactoryKey == null ? SizedBox() : Text(choosedFactoryKey.toString()),
            ],
          ),
        )),
      ),
    );
  }

  Container newAddDate() {
    dateTime = DateTime.now();
    addDate = dateFormat.format(dateTime!);

    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 50),
      padding: const EdgeInsets.all(16),
      decoration: MyConstant().curBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShowText(
            label: 'Add Date :',
            textStyle: MyConstant().h2Style(),
          ),
          SizedBox(
            width: 250,
            child: ListTile(
              title: ShowText(label: addDate ?? 'dd/mm/yyyy'),
              trailing: IconButton(
                onPressed: () async {
                  DateTime? chooseDateTime = await showDatePicker(
                      context: context,
                      initialDate: dateTime!,
                      firstDate: DateTime(dateTime!.year - 1),
                      lastDate: DateTime(dateTime!.year + 1));

                  if (chooseDateTime != null) {
                    setState(() {
                      addDate = dateFormat.format(chooseDateTime);
                    });
                  }
                },
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 36,
                  color: MyConstant.dark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container chooseItem() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: MyConstant().curBorder(),
      child: Column(
        children: [
          SizedBox(
              width: 250,
              child: ShowText(
                label: 'Item :',
                textStyle: MyConstant().h2Style(),
              )),
          newCheckBox(index: 0, label: 'Doramon'),
          newCheckBox(index: 1, label: 'Nobita'),
          newCheckBox(index: 2, label: 'Sunako'),
        ],
      ),
    );
  }

  SizedBox newCheckBox({required int index, required String label}) {
    return SizedBox(
      width: 250,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: ShowText(label: label),
        value: itemChooses[index],
        onChanged: (value) {
          setState(() {
            itemChooses[index] = value!;
          });
        },
      ),
    );
  }

  Container newAgree() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: MyConstant().curBorder(),
      child: Column(
        children: [
          SizedBox(
            width: 250,
            child: ShowText(
              label: 'Agree :',
              textStyle: MyConstant().h2Style(),
            ),
          ),
          Container(
            width: 250,
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  child: RadioListTile(
                    title: ShowText(label: 'Yes'),
                    value: 'yes',
                    groupValue: chooseAgree,
                    onChanged: (value) {
                      setState(() {
                        chooseAgree = value as String?;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: RadioListTile(
                    title: ShowText(label: 'No'),
                    value: 'no',
                    groupValue: chooseAgree,
                    onChanged: (value) {
                      setState(() {
                        chooseAgree = value as String?;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget displayCalculate() {
    return choosedFactoryKey == null
        ? SizedBox()
        : Container(
            alignment: Alignment.center,
            width: 250,
            height: 40,
            decoration: MyConstant().curBorder(),
            child: ShowText(
                label:
                    '$choosedFactoryKey x 500 = ${choosedFactoryKey! * 500}'),
          );
  }

  Container newFactoryKey() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: 250,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: MyConstant().curBorder(),
      child: DropdownButton<dynamic>(
          hint: Row(
            children: [
              Icon(
                Icons.android,
                color: MyConstant.dark,
              ),
              const SizedBox(
                width: 16,
              ),
              const ShowText(label: 'Please Choose FactoryKey'),
            ],
          ),
          value: choosedFactoryKey,
          items: factorKeys
              .map(
                (e) => DropdownMenuItem(
                  child: ShowText(label: 'Factory Key => $e'),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              choosedFactoryKey = value;
            });
            print('chooseFactoryKey==> $choosedFactoryKey');
          }),
    );
  }

  ShowForm newDetail() {
    return ShowForm(
        label: 'Detail :',
        iconData: Icons.details,
        changeFunc: (String string) {});
  }

  ShowForm newJob() {
    return ShowForm(
        label: 'JOb :', iconData: Icons.work, changeFunc: (String string) {});
  }

  SizedBox newImage() {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: [
          ShowImage(
            path: 'images/picture.png',
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
                onPressed: () {
                  chooseImageDialog();
                },
                icon: Icon(
                  Icons.add_a_photo,
                  size: 48,
                  color: MyConstant.dark,
                )),
          ),
        ],
      ),
    );
  }

  Future<void> chooseImageDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const ShowImage(
            path: 'images/picture.png',
          ),
          title: ShowText(
            label: 'กรุณาเลือกรูปภาพ',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: const ShowText(label: 'โดยการ คลิก Camera หรือ Gallery'),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                processTakePhoto();
              },
              child: const Text('Camera')),
              TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Gallery')),
              TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
        ],
      ),
    );
  }

  void processTakePhoto() {

    
  }
}
