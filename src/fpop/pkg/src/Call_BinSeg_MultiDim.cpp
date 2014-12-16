/*
 *  CallBinSeg.h
 *  
 *
 *  Created by Guillem Rigaill on 16/05/11. Modified from Michel Koskas
 *  Copyright 2013 INRA, UEVE. All rights reserved.
 *
 */
//#include<R_ext/Arith.h>
#include "Call_BinSeg_MultiDim.h"

void Call_BinSeg (double * dataVec_, int * Kmax_, int * n_, int * P_, int * Ruptures_, double * RupturesCost_){

	int n = *n_;
	int P = *P_;
	int Kmax = *Kmax_;
	double ** data = new double*[n];
	for(int i=0; i< n; i++)
		data[i] = new double[P];
	for(int i =0; i< n; i++)//{
		for(int j=0; j < P; j++)
			//{
			data[i][j] = dataVec_[i+ n*j];
			//printf("%d, %d, %d, %f, ", i, j, i+ n*j, data[i][j]);
			//}
		//printf("\n");
		//}


	BinSeg_MultiDim BinSegRun(data, n, P, 2*Kmax + 10);
	BinSegRun.Initialize(Kmax);
	
        int i=0;
	for (std::list<int>::iterator iter = BinSegRun.Ruptures.begin(); iter != BinSegRun.Ruptures.end(); iter++){
		Ruptures_[i] = *iter;
		i++;
		}
	
	i=0;
	for (std::list<double>::iterator iter = BinSegRun.RupturesCost.begin(); iter != BinSegRun.RupturesCost.end(); iter++){
		RupturesCost_[i] = *iter;
		i++;
		}

	// delete
	for(int i = 0; i<n; i++)
		delete[] data[i];
	delete[] data;	

}




