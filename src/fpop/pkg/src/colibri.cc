/* February 2014 Guillem Rigaill <rigaill@evry.inra.fr> 

   This file is part of the R package fpop

   fpop is free software; you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License (LGPL) as published by
   the Free Software Foundation; either version 2.1 of the License, or
   (at your option) any later version.
   
   opfp is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Lesser General Public License for more details.
   
   You should have received a copy of the GNU Lesser General Public License
   along with opfp; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#include "colibri.h"
// op +fp version for the L2 loss
// profil: represent a vector (double) of length nbi
// lambda: is the value (double) of the penalty (recall that the penalty i K lambda where K is the number of segment)
// mini and maxi: are the minimum and maximum value of mu during the function pruning. They should be equal to the min and max value of the vector profil)
// origine : will be updated by the function and contain at index i the position of the last breakpoint of the best segmentation arriving at position 
// cout_n will be updated by the function and contain at index i the cost of the best segmentation arriving at position i
void colibri_op_c (const double *profil, const int *nbi, const double *lambda_, const double *mini, const double *maxi, int *origine,
double *cout_n)
{
	int nb=*nbi;
	double lambda = *lambda_;
	double min=*mini;
	double max=*maxi;

	int minPosition=-1;
	double minCurrent=-10.0;
	
        /* Initialisation of object once and for all */
	//Polynome2 * p1;
	Liste * l1;  
	//Polynome2 * pTest;

	Polynome2 **stock= new Polynome2* [nb]; 
	for ( int t =0; t < nb; t++ ) stock[t]= new Polynome2();
		
         
	/* Parametrization of the first candidate segmentation (i.e 1 segment from ]0, 1] the min cost is (0 + lambda)  */
	stock[0]->reset(1.0, -2*profil[0], lambda,  -10);
	stock[0]->setStatus(2);
	
	l1 = new Liste(max, min, stock[0]);

	l1->computeMinOrMax(&minCurrent, &minPosition);
	cout_n[0] = minCurrent + lambda;
	origine[0] = minPosition;
        /* For any new data point t do 1), 2) and 3) */
	for ( int t =1; t < nb; t++ ){
        	 /* Slide 1 and Prune */
		 l1->computeRoots(cout_n[t-1]);
		 stock[t]->reset(0.0, 0.0, cout_n[t-1],  t);
		 l1->resetAllBorders(stock[t]);
		 l1->checkForDoublon();
		 l1->add(1.0, -2*profil[t], 0.0);

		 /* Compute Min */
		 l1->computeMinOrMax(&minCurrent, &minPosition);
		 cout_n[t]=minCurrent + lambda;
		 origine[t] = minPosition;	
	}
	  
	/* free stock */
	for ( int t =0; t < nb; t++ ) delete(stock[t]);
	delete[] stock;  
}

// count the number of candidate
void colibri_op_c_analysis (const double *profil, const int *nbi, const double *lambda_, const double *mini, const double *maxi, int *origine, double *cout_n, int *nbcandidate)
{
	int nb=*nbi;
	double lambda = *lambda_;
	double min=*mini;
	double max=*maxi;

	int minPosition=-1;
	double minCurrent=-10.0;
	
	int *index = new int[nb];
	for(int i =0; i < nb; i++) index[i] = -1;
	for(int i =0; i < nb; i++) nbcandidate[i] = 0;
        /* Initialisation of object once and for all */
	//Polynome2 * p1;
	Liste * l1;  
	//Polynome2 * pTest;

	Polynome2 **stock= new Polynome2* [nb]; 
	for ( int t =0; t < nb; t++ ) stock[t]= new Polynome2();
		
         
	/* Parametrization of the first candidate segmentation (i.e 1 segment from ]0, 1] the min cost is (0 + lambda)  */
	stock[0]->reset(1.0, -2*profil[0], lambda,  -10);
	stock[0]->setStatus(2);
	
	l1 = new Liste(max, min, stock[0]);

	l1->computeMinOrMax(&minCurrent, &minPosition);
	cout_n[0] = minCurrent + lambda;
	origine[0] = minPosition;
        /* For any new data point t do 1), 2) and 3) */
	for ( int t =1; t < nb; t++ ){
        	 /* Slide 1 and Prune */
		 l1->computeRoots(cout_n[t-1]);
		 stock[t]->reset(0.0, 0.0, cout_n[t-1],  t);
		 l1->resetAllBorders(stock[t]);
		 l1->checkForDoublon();
		 l1->add(1.0, -2*profil[t], 0.0);

		 /* Compute Min */
		 l1->computeMinOrMax(&minCurrent, &minPosition);
		 cout_n[t]=minCurrent + lambda;
		 origine[t] = minPosition;
		 //* count candidate *//	
		 nbcandidate[t] = l1->compteCand(index, t);
	}
	  
	/* free stock */
	for ( int t =0; t < nb; t++ ) delete(stock[t]);
	delete[] stock;  
	delete[] index;
}




