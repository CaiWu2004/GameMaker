//myText = ""

//var file = file_text_open_read("credits_Player1.txt")
//if (file != -1){
//	while (!file_text_eof(file)){
//		myText += file_text_readln(file) + "\n"
//	}
	
//	file_text_close(file)
//} else {
//	myText = "Error: File not found!"
//}

myText = ""
scroll_y = 0


//two arrays: one lists the files needed to be read, the other lists the heading to be printed above each file's content
var _files = ["credits_Player1.txt", "credits_Player2.txt"]
var _titles = ["Player 1 Sprite Credits", "Player 2 Sprite Credits"]

//loop runs once per file so we don't need to run it twice to read both files
for (var i = 0; i < array_length(_files); i++){
	//adds the heading, then \n\n = line break twice to leave a blank line under it
	myText += _titles[i] + "\n\n"
	
	//opens the text file for reading, it returns -1 if the file can't be found
	var _file = file_text_open_read(_files[i])
	
	//if file opened, it reads one line at a time until the end of the file, 
	//and adds each line plus a line break to myText.
	//Then it closes the file.
	//Error control if file not found
	if (_file != -1 ){
		while (!file_text_eof(_file)){
			myText += file_text_readln(_file) + "\n"
		}
		file_text_close(_file)
	} else {
		myText += "Error: " + _files[i] + " not found!\n"
	}
	
	//adds the gap between the sections of both files
	myText += "\n\n"
}

//removes hidden carriage-return characters, which cause odd spacing in files made on Windows
myText = string_replace_all(myText, "\r", "")
//turns tab characters into four spaces, because credits files use tabs for indentation and tabs don't draw well in GameMaker
myText = string_replace_all(myText, "\t", "    ")