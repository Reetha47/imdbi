import 'package:film_rater/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listen extends StatefulWidget {
  const Listen({super.key});

  @override
  State<Listen> createState() => _ListenState();
}

class _ListenState extends State<Listen> {
  @override
  Widget build(BuildContext context) {
    var searchData = ModalRoute.of(context)?.settings.arguments as String;
    final light = Provider.of<List_provider>(context, listen: false);
    light.getlists(searchData);
    return Scaffold(
      appBar: AppBar(
        title: Text("Films"),
      ),
      body: Consumer<List_provider>(builder: (context, data, _) {
        return data.lists.isNotEmpty
            ? GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: flipAxis(Axis.horizontal),
                children: List.generate( data.lists.length,(index) => Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                      width: MediaQuery.of(context).size.width*0.5,
                      child: Image.network(data.lists[index].Poster )),
                    Text(data.lists[index].Title,
                    
                        ),
                        Text(data.lists[index].Year),
                        Text(data.lists[index].Type)
                  ],
                )),
             
                    
                    )
            : const SizedBox();
      }),
    );
  }
}
