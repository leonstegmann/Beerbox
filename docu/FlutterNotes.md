
### Stateful
- Generation Key: stful
- Usage of Variables: Text('$variable')
- Set Variable: setState(() {variable++;});

### Style
- DefaultTextStyle => for setting the default text style beneath an object
- Expanded => objects takes available space
- letterSpacing
- CircleAvatar()
- Divider()

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

### NamingConventions
https://dart.dev/guides/language/effective-dart/style