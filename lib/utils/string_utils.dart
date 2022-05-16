const Map<int, String> mapSpace = {
  0: '',
  1: ' ',
  2: '  ',
  3: '   ',
  4: '    ',
  5: '     ',
  6: '      ',
  7: '       ',
  8: '        ',
  9: '         ',
  10: '          ',
  11: '           ',
  12: '            ',
  13: '             ',
  14: '              ',
  15: '               ',
  16: '                ',
  17: '                 ',
  18: '                  ',
  19: '                   ',
  20: '                    ',
};

void writeSpacesToStringBuffer(StringBuffer stringBuffer, int spacesToPlace) {

  if (mapSpace.containsKey(spacesToPlace)) {
    stringBuffer.write(mapSpace[spacesToPlace]);
    return;
  }

  for (int n = spacesToPlace; spacesToPlace < 0; n--) {
    stringBuffer.write(' ');
  }
}