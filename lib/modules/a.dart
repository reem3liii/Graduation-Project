import 'package:flutter/material.dart';

// needs to be StatefulWidget, so we can keep track of the count of the fields internally
class PlayerList extends StatefulWidget {
  const PlayerList({
    this.initialCount = 5,
  });

  // also allow for a dynamic number of starting players
  final int initialCount;

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  int fieldCount = 0;
  int nextIndex = 0;
  // you must keep track of the TextEditingControllers if you want the values to persist correctly
  List<TextEditingController> controllers = <TextEditingController>[];

  // create the list of TextFields, based off the list of TextControllers
  List<Widget> _buildList() {
    int i;
    // fill in keys if the list is not long enough (in case we added one)
    if (controllers.length < fieldCount) {
      for (i = controllers.length; i < fieldCount; i++) {
        controllers.add(TextEditingController());
      }
    }

    i = 0;
    // cycle through the controllers, and recreate each, one per available controller
    return controllers.map<Widget>((TextEditingController controller) {
      int displayNumber = i + 1;
      i++;
      return TextField(
        controller: controller,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: "Player $displayNumber",
          counterText: "",
          prefixIcon: const Icon(Icons.person),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              // when removing a TextField, you must do two things:
              // 1. decrement the number of controllers you should have (fieldCount)
              // 2. actually remove this field's controller from the list of controllers
              setState(() {
                fieldCount--;
                controllers.remove(controller);
              });
            },
          ),
        ),
      );
    }).toList(); // convert to a list
  }


  @override
  Widget build(BuildContext context) {
    // generate the list of TextFields
    final List<Widget> children = _buildList();

    // append an 'add player' button to the end of the list
    children.add(
      GestureDetector(
        onTap: () {
          // when adding a player, we only need to inc the fieldCount, because the _buildList()
          // will handle the creation of the new TextEditingController
          setState(() {
            fieldCount++;
          });
        },
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'add player',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    // build the ListView
    return ListView(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: children,
    );
  }

  @override
  void initState() {
    super.initState();

    // upon creation, copy the starting count to the current count
    fieldCount = widget.initialCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(PlayerList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}