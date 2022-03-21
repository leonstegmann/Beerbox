
### Stateful
- Generation Key: stful
- Usage of Variables: Text('$variable')
- Set Variable: setState(() {variable++;});

### Style
- DefaultTextStyle => for setting the default text style beneath an object
- Expanded => objects takes available space
- letterSpacing
- CircleAvatar()
- ThemeData => defines default styles for context
- DecoratedBox

### Structure
- ListView.builder
- Divider()
- Align()

### Interactions
- GestureDetector => do stuff when interacted
- GestureTapCallback => do stuff when tapped 
- SimpleDialog => opens a DialogWindow

#### Buttons
- FlatButton + RaisedButton => two buttons for suggesting one answer

### Code
- Class({String text}) => Constructor with named parameters 

### Navigation

```
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (_) => AboutScreen(),
    ),
);
```

```
Navigator.of(context).pop();
```

### NamingConventions
https://dart.dev/guides/language/effective-dart/style