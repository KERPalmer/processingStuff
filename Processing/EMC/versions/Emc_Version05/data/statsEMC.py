#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov 14 12:42:48 2020

@author: kenanpalmer
"""
def readFile():
    results=[]
    f = open("Results.txt")
    for line in f:
        result=line.strip("\n").split(" ")
        results.append(result)
    return results
def getwins():
    results=readFile()
    redwins=0
    bluewins=0
    for result in results:
        if result[0]=="0":
            redwins+=1
        else:
            bluewins+=1
    return bluewins,redwins
        
print(getwins())
