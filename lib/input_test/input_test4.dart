import 'package:flutter/material.dart';

class InputTyr4 extends StatefulWidget {
  var l4;
  InputTyr4({Key key, this.formKey,this.l4}) : super(key: key);
  GlobalKey formKey;

  @override
  State<InputTyr4> createState() => _InputTyr4State();
}

class _InputTyr4State extends State<InputTyr4> {
  final TextEditingController _tyreIdController = TextEditingController();
  final TextEditingController _tyreModelIdController = TextEditingController();
  final TextEditingController _tyrePositionIdController =
      TextEditingController();
  final TextEditingController _fittingHController = TextEditingController();
  final TextEditingController _fittingKmController = TextEditingController();
  final TextEditingController _fittingRtdController = TextEditingController();
  final TextEditingController _fittingDateController = TextEditingController();
  final TextEditingController _activeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    remplir();
  }
remplir() {
    _tyreIdController.text = widget.l4[1].toString();
    _tyreModelIdController.text = widget.l4[2].toString();
    _tyrePositionIdController.text = widget.l4[0].toString();
    _fittingHController.text = widget.l4[4].toString();
    _fittingKmController.text = widget.l4[5].toString();
    _fittingRtdController.text = widget.l4[6].toString();
    _fittingDateController.text = widget.l4[7].toString();
    _activeController.text = widget.l4[8].toString();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              // tyre model id
              TextFormField(
                controller: _tyreModelIdController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("tyre model id"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // tyre id
              TextFormField(
                controller: _tyreIdController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("tyre id"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // tyre position id
              TextFormField(
                controller: _tyrePositionIdController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("tyre position id"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // fitting h
              TextFormField(
                controller: _fittingHController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("fitting h"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // fitting km
              TextFormField(
                controller: _fittingKmController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("fitting km"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // fitting RTD
              TextFormField(
                controller: _fittingRtdController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("fitting RTD"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // active
              TextFormField(
                controller: _activeController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("active"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              // fitting date
              TextFormField(
                controller: _fittingDateController,
                validator: (value) => value.isEmpty ? 'Required' : null,
                decoration: InputDecoration(
                  label: const Text("fitting date"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black38,
                        width: 2,
                      )),
                ),
                textInputAction: TextInputAction.go,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
