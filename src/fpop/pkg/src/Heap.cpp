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

#include "Heap.h"



Heap::~Heap()
{
	delete [] MyHeap;
}

Heap::Heap()
{
	AllocatedSize = 100;
	MyHeap = new Node[AllocatedSize];
	HeapSize = 0; 
}

// Create a Heap with 0 nodes but a given allocation size
//Heap<Node>::Heap(Node *TheN, int NbNodes, int AllocationSize)
Heap::Heap(int AllocationSize)
{
	//if (AllocationSize < NbNodes)
	//	AllocationSize = NbNodes;
	
	if (AllocationSize < 100) 
	{
		AllocatedSize = 100; 
	} else {
		AllocatedSize = AllocationSize; 
	}
	MyHeap = new Node[AllocatedSize];
	//for (int i = 0; i < NbNodes; i++)
	//	AddNode(TheN[i]);
	HeapSize = 0; 
}

void Heap::ReAllocate()
{
	int NewAllocatedSize = 2 * AllocatedSize;
	if (NewAllocatedSize == 0)
		NewAllocatedSize = 1;
	Node *NewNodes = new Node[NewAllocatedSize];
	for (int i = 0; i < HeapSize; i++)
		NewNodes[i] = MyHeap[i];
	delete[] MyHeap;
	MyHeap = NewNodes;
	AllocatedSize = NewAllocatedSize;
}

void Heap::AddNode(Node N)
{
  if (HeapSize == AllocatedSize)
		ReAllocate();
  int CurIndex = HeapSize;
	MyHeap[CurIndex] = N;
  while ((CurIndex > 0) && (MyHeap[CurIndex] < MyHeap[(CurIndex - 1) / 2]))
  {
    Swap(MyHeap[CurIndex], MyHeap[(CurIndex - 1) / 2]);
    CurIndex = (CurIndex - 1) / 2;
  }
  HeapSize++;
}

void Heap::RemoveHead()
{
	MyHeap[0] = MyHeap[HeapSize - 1];
	HeapSize--;
	int CurIndex = 0;
	while (CurIndex < (HeapSize - 2) / 2) // CurNode has two sons
	{
		if ((MyHeap[CurIndex] <= MyHeap[2 * CurIndex + 1]) && (MyHeap[CurIndex] <= MyHeap[2 * CurIndex + 2]))
			break;
		int ExchangeIndex = 2 * CurIndex + 1;
		if (MyHeap[ExchangeIndex + 1] < MyHeap[ExchangeIndex])
			ExchangeIndex++;
		Swap(MyHeap[CurIndex], MyHeap[ExchangeIndex]);
		CurIndex = ExchangeIndex;
	}
	if (CurIndex < (HeapSize - 1) / 2)
	{
		if (MyHeap[CurIndex] < MyHeap[2 * CurIndex + 1])
			Swap(MyHeap[CurIndex], MyHeap[2 * CurIndex + 1]);
	}
}

/*void Heap::Debug()
{
}
*/
/*
ostream & operator<<(ostream &s, const Heap &H)
{
  for (int i = 0; i < H.HeapSize; i++)
		s << H.MyHeap[i];
	s << endl;
  return s;
}
*/


