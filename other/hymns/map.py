import re

fname="Lyrics-Pass_me_not-G.txt"

def isChordLine(line):
    if len(re.findall(r'\ \ \ ', line)) > 1:
        return True
    return False

def transpose(line):
    #return line.translate(trans)    
    #return line.translate(str.maketrans("CDEFGAB","GABCDEF"))    
    return line.translate(str.maketrans("GABCDEF", "CDEFGAB"))    

with open(fname, "r") as fp:
    for line in fp:
        if isChordLine(line):
            #print("is chordline:")
            print(transpose(line), end="")
        else:
            print(line, end="")
