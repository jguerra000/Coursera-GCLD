#con = url ("http://biostat.jhsph.edu/~jleek/contact.html")
con = url ("http://www.marca.com",  open="r")

htmlCode = readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

#Answer:
#Web page down