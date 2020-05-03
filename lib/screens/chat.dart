import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class _Chat {
  final client = Client(
    'xqf4gbfwu2ec',
    logLevel: Level.INFO,
  );

  Future<Client> init() async {
    await client.setGuestUser(
      User(id: 'You'
      ),
    );
    final user = User(id: "carlos", extraData: {
      "name": "John Doe",
    });

    await client.setUser(
      user,
      client.devToken("carlos"),
    );

    return client;
  }
}


class Chat extends StatelessWidget {
  final List sport;
  Chat(this.sport);

  @override
  Widget build(BuildContext context) {
    _Chat c = _Chat();
    var x = c.init();
    return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text('${sport[0]} Chat'),
                backgroundColor: Colors.green,
              ),
              body: FutureBuilder(
                future: x,
                builder: (context, snapshot){
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ContainerWithInterceptor(snapshot.data, sport[1]);
                  }
                },
              ),
            );
  }
}
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
             // messageBuilder: _messageBuilder,
            ),
          ),
          MessageInput(),
        ],
    );
  }

}

class ContainerWithInterceptor extends StatefulWidget {
  final Client client;
  final int sport;
  ContainerWithInterceptor(this.client, this.sport);

  @override
  State createState() => _ContainerWithInterceptorState();
}

class _ContainerWithInterceptorState extends State<ContainerWithInterceptor> {

  Widget build(BuildContext context) {
    var cc = widget.client.channel("messaging", id: "${widget.sport}");
    print(widget.sport);
    print("-------------------------------------------------------------");
    cc.watch();
    return StreamChat(
      client: widget.client,
      child: StreamChannel(
        channel: cc,
        child: ChannelPage(),
      ),
    );
  }
}