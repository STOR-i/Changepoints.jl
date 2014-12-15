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
#ifndef POLYNOME2H
#define POLYNOME2H
#include <iostream>
#include <math.h>
#include <float.h>
#include <stdlib.h>

class Polynome2 {
 private:
     double a2, a1, a0;
     /* racine du polynome - A*/
     double rac1, rac2;
     /* status of the polynome 0 = roots not computed, 1 = computed*/
     int status;
     int origine;
 public:
     /* constructors and destructors */
     Polynome2()
     : a0(0),a1(0),a2(0),rac1(0.),rac2(0.),status(0),origine(0) {}
     ~Polynome2() {}
     Polynome2(double A2, double A1, double A0, int origine_)
     : a0(A0),a1(A1),a2(A2),rac1(0.),rac2(0.),status(0),origine(origine_) {}
     /* a few operations */
	/* reset */
     inline
     void reset(double A2, double A1, double A0, int origine_);
     /* getter and setter */
     inline
     double geta2();
     inline
     double geta1();
     inline
     double geta0();
     inline
     double getRacine1();
     inline
     double getRacine2();
     inline
     void seta2(double);
     inline
     void seta1(double);
     inline
     void seta0(double);
     inline
     void setRacine1(double);
     inline
     void setRacine2(double);
     inline
     void setStatus(int);
     inline
     int getStatus();
     inline
     int getOrigine();
     /* Delta and others */
     inline
     double eval(double);
     inline
     double delta();
     /* Delta  of the Polynome - double */
     inline
     double delta(double);
     inline
     void roots();
     /* Roots  of the Polynome - double */
     inline
     void roots(double);
     inline
     void add(double, double, double);
     inline
     void minOrMax(double *, double *, int *);
     /* print and others */
     inline
     void show();
};
/* reset */
void Polynome2::reset(double A2, double A1, double A0, int origine_)
{
	a2= A2;
    a1= A1;
    a0= A0;
    rac1=0.;//*A
    rac2=0.;//*A
    status=0;
    origine= origine_;
}
/* getter and setter */
double Polynome2::geta2()
{
	return(a2);
}
double Polynome2::geta1()
{
	return(a1);
}
double Polynome2::geta0()
{
	return(a0);
}
void Polynome2::seta2(double a2_)
{
	a2=a2_;
}
void Polynome2::seta1(double a1_)
{
	a1=a1_;
}
void Polynome2::seta0(double a0_)
{
	a0=a0_;
}

void Polynome2::setRacine1(double rac1_)
{
	rac1=rac1_;
}

double Polynome2::getRacine1()
{
	return(this->rac1);
}
void Polynome2::setRacine2(double rac2_)
{
	rac2=rac2_;
}

double Polynome2::getRacine2()
{
	return(this->rac2);
}

int Polynome2::getStatus(){
	return(this->status);
}
int Polynome2::getOrigine()
{
	return(this->origine);
}
void Polynome2::setStatus(int status_)
{
	status=status_;
}
/* Delta and Others */
double Polynome2::eval(double X)
{
	return( (a2) * X*X + (a1)*X + (a0) );
}
void Polynome2::minOrMax(double *minOrMax, double *tmp, int *origine_)
{
	if(this->getStatus() != 0)
	{

		*tmp = -0.25 * a1*a1 / (a2) + (a0) ;
		if((*tmp) < (*minOrMax) )
		{
			(*minOrMax) = (*tmp);
			(*origine_) = this->getOrigine();
		}
		this->setStatus(0);
	}
}
double Polynome2::delta()
{
	return( a1*a1 - 4* (a2)* (a0));
}

double Polynome2::delta(double a0_)
{
	return( a1*a1 - 4* (a2)* (a0 - a0_));
}
void Polynome2::roots()
{
	if(this->getStatus() == 0)
	{
		double delta = this->delta();
		if(delta == 0)
		{
			this->setRacine1( -(a1)/(2*(a2)));
			this->setRacine2(0.);//*A
		}
		if(delta < 0)
		{
			this->setRacine1(0.);//*A
			this->setRacine2(0.);//*A
		}
		if(delta > 0)
		{
			delta = sqrt(delta);
			this->setRacine1( (-(a1) + delta ) / (2*(a2)));
			this->setRacine2( (-(a1) - delta ) / (2*(a2)));
		}
		this->setStatus(1);
	}
}
void Polynome2::roots(double a0_)
{
	if(this->getStatus() != 1)
	{
		double delta = this->delta(a0_);
		if(delta == 0)
		{
			this->setRacine1( -(a1)/(2*(a2)));
			this->setRacine2(0.);//*A
		}
		if(delta < 0)
		{
			this->setRacine1(0.);//*A
			this->setRacine2(0.);//*A
		}
		if(delta > 0)
		{
			delta = sqrt(delta);
			this->setRacine1( (-(a1) + delta ) / (2*(a2)));
			this->setRacine2( (-(a1) - delta ) / (2*(a2)));
		}
		this->setStatus(1);
	}
}
void Polynome2::add(double a2_, double a1_, double a0_)
{
	if( this->getStatus() != 2)
	{
		this->a2 = a2+ a2_;
		this->a1 = a1+ a1_;
		this->a0 = a0+ a0_;
		this->setStatus(2);
	}
}
/* print and others */
void Polynome2::show()
{

   //std::cout << this->geta2() << " x^2 + " << this->geta1() << " x + " << this->geta0() << std::endl;
   //std::cout << "Rc1 : " << this->getRacine1() << " , Rc2 : " << this->getRacine2() << ", St : " << this->getStatus() << ", Or : " << this->getOrigine() << std::endl;
   //std::cout << "-----------------------" <<std::endl;
}
#endif //POLYNOME2H
