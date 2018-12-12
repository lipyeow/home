#!/usr/bin/python

S="kamehameha"
P="iehamaa"

slen=len(S)
plen=len(P)

def longestcommonsuffix(s,p,i,j):

  print "lcs(" + str(i) + "," + str(j) + ")"

  if i==0 or j==0:
    return 0
  if s[i]==p[j]:
    #print "matching " + s[i] + " with " + p[j]
    return 1+longestcommonsuffix(s,p,i-1,j-1)
  else:
    return longestcommonsuffix(s,p,i-1,j-1)

#print longestcommonsuffix(S,P,6,4)

curmax=0;
for i in range(slen):
  for j in range(plen):
    l = longestcommonsuffix(S,P,i,j)
    if l>curmax:
      curmax = l

print "Length of longest common substring = " + str(curmax)

