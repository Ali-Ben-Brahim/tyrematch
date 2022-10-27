import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/read/read_files.dart';

class UnderReadFolders extends StatefulWidget {
  var path;
  UnderReadFolders({Key key, this.path}) : super(key: key);

  @override
  State<UnderReadFolders> createState() => _UnderReadFoldersState();
}

class _UnderReadFoldersState extends State<UnderReadFolders> {
  var folders=[];
  @override
  void initState() {
    readfolder();
    super.initState();
  }
  readfolder()async{
    var fold =await widget.path.listSync();
    setState(() {
      folders =fold;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: folders.isEmpty
            ? Container(
                child: Center(
                child: Text(""),
              ))
            : Container(
              child: ListView.builder(
                  itemCount: folders.length,
                  itemBuilder: (context, index) {
                    var ar = folders[index].toString().split('/');
                    return Card(
                      child: SizedBox(
                        height: 100,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ReadFiles(
                                  path: (folders[index]),
                                )));
                          },
                          leading: Icon(Icons.folder),
                          title: Text(
                              "${ar[ar.length - 1].toString().substring(0, ar[ar.length - 1].toString().length - 1)}"),
                        ),
                      )
                    );
                  }),
            ));
  }
}
