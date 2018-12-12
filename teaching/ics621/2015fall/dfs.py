#!/usr/bin/python

A = [ [2,3,4],
      [1,3,4],
      [1,2,4],
      [1,2,3,7],
      [6,7],
      [5,7],
      [4,5,6,11,8,9],
      [7,9,10],
      [7,8],
      [8],
      [7,12,14],
      [11,13],
      [12,14,15],
      [11,13],
      [13,17,18],
      [17,18,19],
      [15,16,18,19],
      [15,16,17,20,23],
      [16,17],
      [18,21,22],
      [20,22],
      [21,20],
      [18]]

color = [0]*24

def dfs(A,color,i,j):

  print "dfs(" + str(i) + "," + str(j) + ")"

  if color[i]>0:
    return 0
  color[i]=1
  traversed =1
  print A[i-1]
  for k in A[i-1]:
    traversed += dfs(A,color,k,j+traversed)
  return traversed


dfs(A,color,1,0)
