#include "graph.h"

graph::graph(int v) {
  this->v = v;
  e = 0;
  adj = new list<int>[v];
}

graph::~graph() {
  delete[] adj;
}

int graph::num_vertices() const {
  return v;
}

int graph::num_edges() const {
  return e;
}

void graph::addEdge(int v, int w) {
  adj[v].push_back(w);
  adj[w].push_back(v);
  ++e;
}
