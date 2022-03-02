
### Stateful
- Generation Key: stful
- Usage of Variables: Text('$variable')
- Set Variable: setState(() {variable++;});

### Style
- DefaultTextStyle => for setting the default text style beneath an object

### Navigation

```
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (_) => AboutScreen(),
    ),
);
```