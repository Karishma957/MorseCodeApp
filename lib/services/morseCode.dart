class MorseCode {
  static const Map<String, String> morseToStringList = {
    '.-': 'A',
    '-...': 'B',
    '-.-.': 'C',
    '-..': 'D',
    '.': 'E',
    '..-.': 'F',
    '--.': 'G',
    '....': 'H',
    '..': 'I',
    '.---': 'J',
    '-.-': 'K',
    '.-..': 'L',
    '--': 'M',
    '-.': 'N',
    '---': 'O',
    '.--.': 'P',
    '--.-': 'Q',
    '.-.': 'R',
    '...': 'S',
    '-': 'T',
    '..-': 'U',
    '...-': 'V',
    '.--': 'W',
    '-..-': 'X',
    '-.--': 'Y',
    '--..': 'Z',
    "-----": '0', // 0
    ".----": '1', // 1
    "..---": '2', // 2
    "...--": '3', // 3
    "....-": '4', // 4
    ".....": '5', // 5
    "-....": '6', // 6
    "--...": '7', // 7
    "---..": '8', // 8
    "----.": '9',
  };
  static const Map<String, String> stringToMorseList = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..',
    '0': "-----", // 0
    '1': ".----", // 1
    '2': "..---", // 2
    '3': "...--", // 3
    '4': "....-", // 4
    '5': ".....", // 5
    '6': "-....", // 6
    '7': "--...", // 7
    '8': "---..", // 8
    '9': "----.",
  };

  static String convertMorseToString(String s) {
    if (s == ' ' || s == '\n') {
      return s;
    } else if (morseToStringList.containsKey(s)) {
      return morseToStringList[s];
    } else {
      return '';
    }
  }

  static List<String> convertStringToMorse(String s) {
    List<String> convertedString = [];
    List<String> str = s.split('');
    for (int i = 0; i < str.length; i++) {
      if (stringToMorseList.containsKey(str[i])) {
        convertedString.add(stringToMorseList[str[i]]);
      } else if (str[i] == ' ') {
        convertedString.add(' ');
      } else {}
    }
    return convertedString;
  }
}
