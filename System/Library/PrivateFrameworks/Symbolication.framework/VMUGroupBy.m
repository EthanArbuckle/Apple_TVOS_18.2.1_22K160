@interface VMUGroupBy
- (VMUGroupBy)initWithGraph:(id)a3;
- (VMUProcessObjectGraph)graph;
- (id)typeNameForNode:(unsigned int)a3;
@end

@implementation VMUGroupBy

- (VMUGroupBy)initWithGraph:(id)a3
{
  v4 = (VMUProcessObjectGraph *)a3;
  v5 = -[VMUGroupBy init](self, "init");
  graph = v5->_graph;
  v5->_graph = v4;

  return v5;
}

- (id)typeNameForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = -[VMUGroupBy graph](self, "graph");
  v6 = v5;
  if (v5)
  {
    [v5 nodeDetails:v3];
  }

  else
  {
    unint64_t v13 = 0LL;
    v14 = 0LL;
  }

  [v14 className];
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = @"(root)";
    switch(v13 >> 60)
    {
      case 1uLL:
        v9 = -[VMUGroupBy graph](self, "graph");
        uint64_t v10 = [v9 shortNodeDescription:v3];
        v11 = (void *)v10;
        v12 = @"non-object";
        if (v10) {
          v12 = (__CFString *)v10;
        }
        v7 = v12;

        goto LABEL_15;
      case 2uLL:
        return v7;
      case 3uLL:
        return @"(kernel)";
      case 4uLL:
        return @"(thread)";
      case 5uLL:
        v9 = -[VMUGroupBy graph](self, "graph");
        [v9 shortNodeDescription:v3];
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

        return v7;
      default:
        return @"(unknown)";
    }
  }

  return v7;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end