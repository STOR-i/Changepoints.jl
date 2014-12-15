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
#include<R_ext/Arith.h>

// this function is visible by R
extern "C" {
void colibri_op_R_c (double *profil, int *nbi, double *lambda_, double *mini, double *maxi, int *origine,
double *cout_n){
    colibri_op_c (profil, nbi, lambda_, mini, maxi, origine, cout_n);
  }

void colibri_op_R_c_analysis (double *profil, int *nbi, double *lambda_, double *mini, double *maxi, int *origine,
double *cout_n, int *nbcandidate){
    colibri_op_c_analysis (profil, nbi, lambda_, mini, maxi, origine, cout_n, nbcandidate);
  }
}

