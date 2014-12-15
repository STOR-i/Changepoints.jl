/*
 *  Heap.h
 *  
 *
 *  Created by Guillem Rigaill on 16/05/11. Modified from Michel Koskas
 *  Copyright 2013 INRA, UEVE. All rights reserved.
 *
 */

#ifndef _BinSeg_MultiDim_H_
#define _BinSeg_MultiDim_H_

#include <string>
//#include <fstream>
//#include <iostream>
#include <vector>
//#include <list>

#include <math.h>

#include <gsl/gsl_math.h>
#define PlusInfinity GSL_POSINF

#include <cmath>
//#include "Node.h"
#include "Heap.h"




// Cout quadratique
class BinSeg_MultiDim
{
public:
	Heap MyHeap;
	double **data;
	int n;
	int P;
	std::list<int> Ruptures;
	std::list<double> RupturesCost;
	Node Best(int LowIndex, int HighIndex);
	void Initialize(int NbRuptures);
	BinSeg_MultiDim(double ** data_, int n_, int P_, int nbAllocSize);
	//double Cost();
};



#endif
