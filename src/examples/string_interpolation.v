// In V you can define array of string
//  with the following syntax:
areas := ['game', 'web', 'tools', 'science',
    'systems', 'embedded', 'drivers',
]

for area in areas {
	// V uses the ${} notation
    //  to interpolate a variable
	//   or expression right on the string.
	println('Hello, ${area} developers!')
}