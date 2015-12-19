#ifndef GRAPH_H
# define GRAPH_H

# include <vector>
# include <list>

using namespace std;

class graph {
  int       v;
  int       e;
  list<int> *adj;

  graph(graph const&);

  public:
  graph(int);
  ~graph();

  int num_vertices() const;
  int num_edges() const;

  void addEdge(int, int);
};

#endif /* ! GRAPH_H */
