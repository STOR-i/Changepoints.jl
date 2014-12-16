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

#include <list>
#include <iostream>
#include <fstream>
#include "Node.h"

#ifndef _Heap_
#define _Heap_


using namespace std;

class Heap
{
public:
  Node *MyHeap;
  int HeapSize;
  //Heap(Node *TheN = NULL, int NbNodes = 0, int AllocationSize = 0);
  Heap(int AllocationSize);
  Heap();
  ~Heap();
  void AddNode(Node N);
  void RemoveHead();
private:
  //void Debug();
	int AllocatedSize;
	void ReAllocate();
};

//ostream & operator<<(ostream &s, const Heap &H);



#endif



