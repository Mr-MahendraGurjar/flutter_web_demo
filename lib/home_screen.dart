import 'package:flutter/material.dart';
import 'package:flutter_web_demo/model/user__response.dart';
import 'package:flutter_web_demo/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProvider userProvider;
  List<UserResponse> listData = [];

  @override
  initState() {
    intializeDataAndAPI();
    super.initState();
  }

  void intializeDataAndAPI() async {
    if (this.mounted) {
      Future.delayed(Duration.zero, () async {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        listData = await userProvider.getUserDetail();
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Data'),
          centerTitle: true,
        ),
        body: Consumer<UserProvider>(
          builder: (context, model, _) => Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              width: MediaQuery.of(context).size.width,
              child: model.isLoading
                  ? Container(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.cyan,
                            child: Expanded(
                              child: ListView.builder(
                                itemCount: listData.length,
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      model.setValue(
                                          listData[index].name.toString(),
                                          listData[index].description,
                                          listData[index].image);
                                    },
                                    child: ListTile(
                                        title: Text(listData[index].name),
                                        subtitle:
                                            Text(listData[index].description),
                                        leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                listData[index].image),
                                            backgroundColor: Colors.blue)),
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.444,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: model.imagePath.isEmpty
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(model.imagePath),
                                        ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.title.isEmpty ? '' : model.title + " :",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(model.subTitle.isEmpty
                                    ? ''
                                    : model.subTitle)
                              ]),
                        )
                      ],
                    )),
        ),
      ),
    );
  }
}
