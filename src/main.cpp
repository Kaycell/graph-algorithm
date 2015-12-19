#include <iostream>

#include "graph.h"

using namespace std;

int main()
{
  graph g(3);

  g.addEdge(0, 2);
  g.addEdge(1, 2);
  cout << g.num_vertices() << " vertices, "
    << g.num_edges()  << " edges." << endl;

  return 0;
}
