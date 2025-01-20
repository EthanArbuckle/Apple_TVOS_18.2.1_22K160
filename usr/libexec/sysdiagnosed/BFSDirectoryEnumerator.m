@interface BFSDirectoryEnumerator
+ (id)BFSEnumeratorWithPath:(id)a3 withDepth:(unint64_t)a4;
- (NSMutableArray)directoryQueue;
- (id)getNextMatch;
- (unint64_t)depth;
- (void)setDepth:(unint64_t)a3;
- (void)setDirectoryQueue:(id)a3;
@end

@implementation BFSDirectoryEnumerator

+ (id)BFSEnumeratorWithPath:(id)a3 withDepth:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___BFSDirectoryEnumerator);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[BFSDirectory BFSDirectoryWithURL:withDepth:]( &OBJC_CLASS___BFSDirectory,  "BFSDirectoryWithURL:withDepth:",  v5,  a4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v7));
    -[BFSDirectoryEnumerator setDirectoryQueue:](v6, "setDirectoryQueue:", v8);

    -[BFSDirectoryEnumerator setDepth:](v6, "setDepth:", a4);
  }

  return v6;
}

- (id)getNextMatch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = 0LL;
    while (1)
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

      uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 url]);
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 urlEnumerator]);

        if (!v10)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
          [v25 removeObjectAtIndex:0];

          v12 = (void *)objc_claimAutoreleasedReturnValue([v5 url]);
          goto LABEL_19;
        }
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 urlEnumerator]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nextObject]);

      if (v12) {
        break;
      }
LABEL_16:
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
      [v21 removeObjectAtIndex:0];

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
      id v23 = [v22 count];

      if (!v23)
      {
        v12 = 0LL;
        goto LABEL_19;
      }
    }

    while (1)
    {
      id v26 = 0LL;
      unsigned int v13 = [v12 getResourceValue:&v26 forKey:NSURLIsDirectoryKey error:0];
      id v14 = v26;
      v15 = v14;
      if (-[BFSDirectoryEnumerator depth](self, "depth")) {
        v16 = (char *)[v5 remainingDepth] - 1;
      }
      else {
        v16 = 0LL;
      }
      if (!-[BFSDirectoryEnumerator depth](self, "depth") || [v5 remainingDepth] && v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectoryEnumerator directoryQueue](self, "directoryQueue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[BFSDirectory BFSDirectoryWithURL:withDepth:]( &OBJC_CLASS___BFSDirectory,  "BFSDirectoryWithURL:withDepth:",  v12,  v16));
        [v17 addObject:v18];
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue([v5 urlEnumerator]);
      uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 nextObject]);

      v12 = (void *)v20;
      if (!v20) {
        goto LABEL_16;
      }
    }

LABEL_19:
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (NSMutableArray)directoryQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDirectoryQueue:(id)a3
{
}

- (unint64_t)depth
{
  return self->_depth;
}

- (void)setDepth:(unint64_t)a3
{
  self->_depth = a3;
}

- (void).cxx_destruct
{
}

@end