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

#include "Node.h"


Node::Node(int I, double V, int LI, int HI)
{
	Value = V;
	Index = I;
	LowIndex = LI;
	HighIndex = HI;
}

bool Node::operator<(Node &Other)
{
	return (Value < Other.Value);
}

bool Node::operator<=(Node &Other)
{
	return (Value <= Other.Value);
}

Node::Node()
{
	Value = 0;
	Index = 0;
	LowIndex = 0;
	HighIndex = 0;	
}


Node Node::operator=(Node &Other)
{
	Value = Other.Value;
	Index = Other.Index;
	LowIndex = Other.LowIndex;
	HighIndex = Other.HighIndex;
	return *this;
}

void Swap(Node &a, Node &b)
{
	Node c = a;
	a = b;
	b = c;
}

