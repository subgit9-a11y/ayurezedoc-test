import os

file_path = r'c:\Users\SUBHASH\Desktop\AYUREZE PROJECT\ayureze-doctor-app-main\lib\screens\profile\profile.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# 574 is index 573
# Current state of 574-576:
# 574:                                         ),
# 575:                                       ),
# 576:                                     ),

# We want:
# 574:                                         ],
# 575:                                       ),
# 576:                                     ),
# 577:                                   ),
# 578:                                 ),
# 579:                               ),

# Let's rebuild the lines from 574 onwards.
new_closings = [
    '                                        ],\n',
    '                                      ),\n',
    '                                    ),\n',
    '                                  ),\n',
    '                                ),\n',
    '                              ),\n'
]

# We are replacing indices 573, 574, 575 (lines 574, 575, 576)
lines[573:576] = new_closings

with open(file_path, 'w', encoding='utf-8') as f:
    f.writelines(lines)

print("Fixed profile.dart structural error with 6 closings.")
