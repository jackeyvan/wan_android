import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: Container(
          color: Colors.amber,
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              itemBuilder: (tx, index) {
                return const Card(
                  child: InkWell(
                    child: ListTile(
                        title: Text("我是大法师打发标题"),
                        subtitle: Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "wohaishi阿凡达还是发来发发呆",
                              maxLines: 5,
                            ))),
                  ),
                );
              }),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // stretch: true,
              pinned: true,
              floating: true,
              snap: true,
              // leading: DrawerButton(),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("玩安卓"),
                centerTitle: false,
                background: Image.network(
                  'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
      ),
    );
  }
}
