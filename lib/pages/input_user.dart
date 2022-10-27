import 'package:flutter/material.dart';

class InputUser extends StatefulWidget {
  const InputUser({Key key}) : super(key: key);

  @override
  State<InputUser> createState() => _InputUserState();
}

class _InputUserState extends State<InputUser> {

  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _numberOfAxlesController = TextEditingController();
  final TextEditingController _axle1SizeController = TextEditingController();
  final TextEditingController _axle1TyreController = TextEditingController();
  final TextEditingController _axle1MaxWeightController = TextEditingController();
  final TextEditingController _axle2SizeController = TextEditingController();
  final TextEditingController _axle2TyreController = TextEditingController();
  final TextEditingController _axle2MaxWeightController = TextEditingController();
  final TextEditingController _axle3SizeController = TextEditingController();
  final TextEditingController _axle3TyreController = TextEditingController();
  final TextEditingController _axle3MaxWeightController = TextEditingController();
  final TextEditingController _webFleetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> brands =['Continental','Mitas','michelin','goodyear','BKT','trelleborg','yokohama alliance','vredestein'];
  String selectedBrand ;
  List applications =['trucktor','harvester','Trailer'];
  String selectedApplication ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20 ,15 ,20 , 0),
        child: SingleChildScrollView(
          child: Form(
                key:_formKey ,
                child: Column(
                  children: [
                    // Brands
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration:const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.0, style: BorderStyle.solid,color: Colors.black38),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      child: DropdownButtonFormField<String>(
                        decoration:const InputDecoration.collapsed(
                          hintText: 'Brands'
                        ),
                        validator: (value) => value == null? 'Required' : null,
                        value: selectedBrand,
                        items: brands.map(
                          (brand) => DropdownMenuItem<String>(
                            value: brand,
                            child: Padding(
                              padding: const EdgeInsets.only(left :10.0),
                              child: Text(brand ,style: const TextStyle(fontSize: 20,color: Colors.black54),),
                            )
                          )
                        ).toList(),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 35,
                        onChanged: (String value) {  
                          setState(() {
                            selectedBrand = value;
                          });
                          
                        },
                      ),
                    ),
                    const SizedBox(height: 15,),
                    // Applications
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration:const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.0, style: BorderStyle.solid,color: Colors.black38),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration:const InputDecoration.collapsed(
                          hintText: 'Applications'
                        ),
                        validator: (value) => value == null? 'Required' : null,
                        value: selectedApplication,
                        items: applications.map(
                          (application) => DropdownMenuItem<String>(
                            value: application,
                            child: Padding(
                              padding: const EdgeInsets.only(left :10.0),
                              child: Text(application ,style: const TextStyle(fontSize: 20,color: Colors.black54),),
                            )
                          )
                        ).toList(),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 35,
                        onChanged: (String value) {  
                          setState(() {
                            selectedApplication = value;
                          });
                          
                        },
                      ),
                    ),
                    const SizedBox(height: 15,),
                    // Vehicle model
                    TextFormField(
                      controller: _vehicleModelController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Vehicle model"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // number of axles
                    TextFormField(
                      controller: _numberOfAxlesController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Number of axles"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // Axle 1
                    TextFormField(
                      controller: _axle1SizeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("axle 1 size"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle1TyreController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 1 tyre"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle1MaxWeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 1 max weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // Axle 2
                    TextFormField(
                      controller: _axle2SizeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 size"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle2TyreController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 tyre"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle2MaxWeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 2 max weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    // Axle 3
                    TextFormField(
                      controller: _axle3SizeController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 size"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle3TyreController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 tyre"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _axle3MaxWeightController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Axle 3 max weight"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: _webFleetController,
                      validator: (value)=> value.isEmpty? 'Required' :null,
                      decoration:  InputDecoration(
                        label: const Text("Web fleet"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2,
                          )
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            side: const BorderSide(
                              width: 1,
                              color: Colors.black
                            )
                          )
                        ),
                      backgroundColor:MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(const Size(349, 48)),
                      textStyle:MaterialStateProperty.all(const TextStyle(fontSize: 16))),
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            
                          }
                        },
                      child: const Text("Send" , 
                      style: TextStyle(
                        color: Color.fromRGBO(75, 174, 79,1)
                        ),
                      ),
                    ),
                  ],   
              ),
            ),
        ), 
      ),
    );
  }
}