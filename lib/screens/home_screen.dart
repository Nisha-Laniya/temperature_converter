import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:temperature_converter/provider/temperature_provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    final temperatureProvider = Provider.of<TemperatureProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WeConvert',
                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: Text(
                      'Enter Temperature',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8).w),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10).r,
                      child: Column(
                        children: [
                          TextField(
                            decoration:
                                InputDecoration(hintText: 'Enter Temperature'),
                            keyboardType: TextInputType.number,
                            controller: temperatureProvider.textController,
                          ),
                          Row(
                            children: [
                              Text(
                                'Select current metrics',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16.sp),
                              ),
                              Spacer(),
                              Consumer<TemperatureProvider>(
                                builder: (context,value,child) {
                                  return DropdownButton<String>(
                                    value: value.finalSelectedValue,
                                    items: list.map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    onChanged: (values) {
                                        value.selectedValue = values!;
                                        print(values);
                                        value.converter();
                                    },
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: Text(
                      'Target Temperature',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10).w,
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 5, right: 5, bottom: 5).r,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5).r,
                              child: TabBar(
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12).w,
                                  color: Colors.white,
                                ),
                                isScrollable: true,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 30.sp),
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'Celsius',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Fahrenheit',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'kelvin',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                                onTap: (value) {
                                    temperatureProvider.tabValue = value;
                                    print(value);
                                    temperatureProvider.converter();
                                },
                              ),
                            ),
                          ),
                        ),
                        Consumer<TemperatureProvider>(
                          builder: (context,value,child) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, top: 5, bottom: 5).r,
                              child: Text(value.finalOutput),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
