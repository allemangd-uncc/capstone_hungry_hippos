import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:capstone_hungry_hippos/globals.dart' as globals;

class Chat extends StatelessWidget {
  final List sport;
  Chat(this.sport);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text('${sport[0]} Chat'),
                backgroundColor: Colors.green,
              ),
              body: ContainerWithInterceptor(globals.client, sport[1]),
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
             //messageBuilder: _messageBuilder,
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