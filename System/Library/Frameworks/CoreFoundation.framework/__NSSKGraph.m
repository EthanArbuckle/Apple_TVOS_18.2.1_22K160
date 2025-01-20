@interface __NSSKGraph
- (BOOL)addEdgeWithH1:(unint64_t)a3 withH2:(unint64_t)a4;
- (BOOL)isEmpty;
- (__NSSKGraph)initWithNumberOfVertices:(int64_t)a3 numberOfEdges:(int64_t)a4;
- (edge)isAcyclic;
- (unint64_t)numOfEdges;
- (void)dealloc;
@end

@implementation __NSSKGraph

- (__NSSKGraph)initWithNumberOfVertices:(int64_t)a3 numberOfEdges:(int64_t)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____NSSKGraph;
  v6 = -[__NSSKGraph init](&v8, sel_init);
  if (v6)
  {
    v6->_vertices = (vertex *)calloc(a3, 0x18uLL);
    v6->_edges = (edge *)calloc(a4, 0x20uLL);
    v6->_numV = a3;
    v6->_numE = a4;
    v6->_currE = 0LL;
    v6->_dump = a4 + 1;
    v6->_l_end = 0LL;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  free(self->_edges);
  unint64_t numV = self->_numV;
  if (numV)
  {
    uint64_t v4 = 24 * numV - 8;
    do
    {
      v5 = *(void **)((char *)&self->_vertices->var0 + v4);
      if (v5) {
        free(v5);
      }
      v4 -= 24LL;
      --numV;
    }

    while (numV);
  }

  free(self->_vertices);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSSKGraph;
  -[__NSSKGraph dealloc](&v6, sel_dealloc);
}

- (BOOL)addEdgeWithH1:(unint64_t)a3 withH2:(unint64_t)a4
{
  edges = self->_edges;
  vertices = self->_vertices;
  edges[self->_currE].var0 = self->_currE;
  edges[self->_currE].var1[0] = a3;
  edges[self->_currE].var1[1] = a4;
  edges[self->_currE].var2 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = &vertices[a3];
  if (v9->var0)
  {
    v10 = &vertices[a3];
    unint64_t var1 = v10->var1;
    p_unint64_t var1 = (uint64_t *)&v10->var1;
    unint64_t v11 = var1;
    if (var1 - 1 == v9->var0)
    {
      uint64_t v14 = 2 * v11;
      var2 = calloc(2 * v11, 8uLL);
      v16 = &vertices[a3];
      memcpy(var2, v16->var2, 8 * *p_var1);
      free(v16->var2);
      v16->var2 = var2;
      uint64_t *p_var1 = v14;
    }

    else
    {
      var2 = vertices[a3].var2;
    }
  }

  else
  {
    var2 = calloc(4uLL, 8uLL);
    v17 = &vertices[a3];
    v17->unint64_t var1 = 4LL;
    v17->var2 = var2;
    void *var2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  var2[v9->var0] = self->_currE;
  uint64_t v18 = v9->var0 + 1;
  v9->var0 = v18;
  var2[v18] = 0x7FFFFFFFFFFFFFFFLL;
  v19 = self->_vertices;
  v20 = &v19[a4];
  if (v20->var0)
  {
    v21 = &v19[a4];
    unint64_t v24 = v21->var1;
    v23 = (uint64_t *)&v21->var1;
    unint64_t v22 = v24;
    if (v24 - 1 == v20->var0)
    {
      uint64_t v25 = 2 * v22;
      v26 = calloc(2 * v22, 8uLL);
      v27 = &v19[a4];
      memcpy(v26, v27->var2, 8 * *v23);
      free(v27->var2);
      v27->var2 = v26;
      uint64_t *v23 = v25;
    }

    else
    {
      v26 = v19[a4].var2;
    }
  }

  else
  {
    v26 = calloc(4uLL, 8uLL);
    v28 = &v19[a4];
    v28->unint64_t var1 = 4LL;
    v28->var2 = v26;
    void *v26 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v26[v20->var0] = self->_currE;
  uint64_t v29 = v20->var0 + 1;
  v20->var0 = v29;
  v26[v29] = 0x7FFFFFFFFFFFFFFFLL;
  ++self->_currE;
  return 1;
}

- (BOOL)isEmpty
{
  return self->_l_end == self->_numE;
}

- (unint64_t)numOfEdges
{
  return self->_numE;
}

- (edge)isAcyclic
{
  v3 = (edge **)calloc(self->_numE, 8uLL);
  uint64_t v4 = calloc(self->_numE, 8uLL);
  if (self->_numE)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    do
    {
      vertices = self->_vertices;
      uint64_t v9 = &self->_edges[v5];
      unint64_t v10 = v9->var1[0];
      if (vertices[v10].var0 == 1 || (unint64_t v10 = v9->var1[1], vertices[v10].var0 == 1))
      {
        v9->var2 = v10;
        v4[v6++] = v9;
      }

      ++v7;
      ++v5;
    }

    while (v7 < self->_numE);
    if (v6)
    {
      for (unint64_t i = 0LL; i < v6; ++i)
      {
        v12 = (edge *)v4[i];
        unint64_t l_end = self->_l_end;
        self->_unint64_t l_end = l_end + 1;
        v3[l_end] = v12;
        uint64_t v14 = self->_vertices;
        unint64_t v16 = v12->var1[0];
        unint64_t v15 = v12->var1[1];
        v17 = &v14[v16];
        if (v17->var0 == 2) {
          uint64_t v18 = v12->var1[0];
        }
        else {
          uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v14[v15].var0 == 2) {
          uint64_t v19 = v12->var1[1];
        }
        else {
          uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v17->var1)
        {
          unint64_t v20 = 0LL;
          var2 = v14[v16].var2;
          do
          {
            unint64_t v22 = var2[v20];
            if (v22 == v12->var0)
            {
              var2[v20] = self->_dump;
              --v17->var0;
              unint64_t v22 = var2[v20];
            }

            if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            ++v20;
          }

          while (v20 < v17->var1);
          unint64_t v15 = v12->var1[1];
        }

        v23 = &v14[v15];
        if (v23->var1)
        {
          unint64_t v24 = 0LL;
          uint64_t v25 = v14[v15].var2;
          do
          {
            unint64_t v26 = v25[v24];
            if (v26 == v12->var0)
            {
              v25[v24] = self->_dump;
              --v23->var0;
              unint64_t v26 = v25[v24];
            }

            if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            ++v24;
          }

          while (v24 < v23->var1);
        }

        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = &v14[v18];
          unint64_t var1 = v27->var1;
          if (var1)
          {
            uint64_t v29 = 0LL;
            v30 = &v14[v18];
            v33 = v30->var2;
            p_var2 = &v30->var2;
            v32 = v33;
            unint64_t dump = self->_dump;
            while (1)
            {
              unint64_t v35 = v32[v29];
              if (v35 != dump) {
                break;
              }
              if (var1 == ++v29) {
                goto LABEL_37;
              }
            }

            v36 = &self->_edges[v35];
            if (v36->var2 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v4[v6++] = v36;
              v36->var2 = v18;
              unint64_t dump = self->_dump;
              v32 = *p_var2;
            }

            v32[v29] = dump;
            --v27->var0;
          }
        }

@end