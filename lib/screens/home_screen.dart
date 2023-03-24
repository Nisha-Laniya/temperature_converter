import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> list = <String>['Celsius', 'Fahrenheit','Kelvin'];

class _HomeScreenState extends State<HomeScreen>{
   String selectedValue = list.first;
   TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('WeConvert',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Enter Temperature',style: TextStyle(color: Colors.grey),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Column(
                        children: [
                           TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter Temperature'
                            ),
                            keyboardType: TextInputType.number,
                            controller: textController,
                          ),
                          Row(
                            children: [
                              Text('Select current metrics',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                              Spacer(),
                              DropdownButton<String>(
                                  value: selectedValue,
                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {

                                    setState(() {
                                      selectedValue = value!;
                                      print(selectedValue);
                                    });
                                  }
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Target Temperature',style: TextStyle(color: Colors.grey),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),

                                  isScrollable: true,
                                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                                  tabs: const [
                                    Tab(child: Text('Celsius',style: TextStyle(color: Colors.black),),),
                                    Tab(child: Text('Fahrenheit',style: TextStyle(color: Colors.black),),),
                                    Tab(child: Text('kelvin',style: TextStyle(color: Colors.black),),),
                                  ]
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 50,
                        //   child: TabBarView(
                        //     controller: tabController,
                        //       children: [
                        //         Text('1'),
                        //         Text('2'),
                        //         Text('3'),
                        //       ]
                        //   ),
                        // ),
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
