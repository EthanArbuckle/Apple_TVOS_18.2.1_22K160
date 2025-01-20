@interface _OSLogStreamFilter
- (NSData)data;
- (_OSLogStreamFilter)initWithPredicate:(id)a3;
- (id)dictionaryForComparisonPredicate:(id)a3;
- (id)encodePredicate:(id)a3;
- (unint64_t)flagsForPredicate:(id)a3;
- (void)addCategory:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addProcess:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addProcessID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addProcessImagePath:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addSubsystem:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)addUserID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5;
- (void)processComparisonPredicate:(id)a3;
- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5;
- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5 returningDict:(id *)a6;
- (void)reduceFilter:(id)a3;
- (void)visitPredicate:(id)a3;
@end

@implementation _OSLogStreamFilter

- (_OSLogStreamFilter)initWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = getenv("LOG_USE_STREAMFILTER");
  if (v5 && !strcmp(v5, "0"))
  {
    v13 = 0LL;
  }

  else
  {
    [MEMORY[0x189604010] setWithArray:&unk_189F1D058];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604010] setWithArray:&unk_189F1D070];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189604010] setWithArray:&unk_189F1D088];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS____OSLogStreamFilter;
    v9 = -[_OSLogStreamFilter init](&v17, sel_init);
    if (v9)
    {
      _OSLogGetSimplePredicate(v4, v6, v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (requiresLogicalExpression(v10))
      {
        uint64_t v11 = -[_OSLogStreamFilter encodePredicate:](v9, "encodePredicate:", v10);
        filter = v9->_filter;
        v9->_filter = (NSMutableDictionary *)v11;

        -[_OSLogStreamFilter reduceFilter:](v9, "reduceFilter:", v9->_filter);
      }

      else
      {
        v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        v15 = v9->_filter;
        v9->_filter = v14;

        [v10 acceptVisitor:v9 flags:0];
      }
    }

    self = v9;

    v13 = self;
  }

  return v13;
}

- (id)encodePredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_OSLogStreamFilter dictionaryForComparisonPredicate:](self, "dictionaryForComparisonPredicate:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v5 setObject:v6 forKeyedSubscript:@"logicalExp"];
      id v7 = v4;
      if ([v7 compoundPredicateType] != 2)
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v7, "compoundPredicateType"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setObject:v8 forKeyedSubscript:@"operator"];
      }

      v9 = (void *)MEMORY[0x189603FA8];
      [v7 subpredicates];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v6;
      [v6 setObject:v11 forKeyedSubscript:@"subfilters"];
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      [v7 subpredicates];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          uint64_t v16 = 0LL;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            -[_OSLogStreamFilter encodePredicate:]( self,  "encodePredicate:",  *(void *)(*((void *)&v20 + 1) + 8 * v16));
            objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17) {
              [v11 addObject:v17];
            }

            ++v16;
          }

          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v14);
      }
    }
  }

  return v5;
}

- (void)reduceFilter:(id)a3
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"logicalExp"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    v60 = v4;
    v61 = v5;
    [v5 objectForKeyedSubscript:@"subfilters"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v79;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v79 != v10) {
            objc_enumerationMutation(v7);
          }
          -[_OSLogStreamFilter reduceFilter:](self, "reduceFilter:", *(void *)(*((void *)&v78 + 1) + 8 * i));
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v78 objects:v84 count:16];
      }

      while (v9);
    }

    if ([v7 count])
    {
      unint64_t v12 = 0LL;
      do
      {
        [v7 objectAtIndexedSubscript:v12];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 count];

        if (!v14) {
          [v7 removeObjectAtIndex:v12--];
        }
        ++v12;
      }

      while (v12 < [v7 count]);
    }

    id v4 = v60;
    id v6 = v61;
    if ([v7 count])
    {
      [v61 objectForKeyedSubscript:@"operator"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v7;
      if (!v15) {
        goto LABEL_36;
      }
      uint64_t v16 = v15;
      uint64_t v17 = [v15 unsignedIntegerValue];

      if (v17)
      {
        if (v17 == 1)
        {
          if ([v7 count])
          {
            unint64_t v18 = 0LL;
            do
            {
              [v7 objectAtIndexedSubscript:v18];
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              [v19 objectForKeyedSubscript:@"logicalExp"];
              __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v21 = v20;
              if (v20)
              {
                [v20 objectForKeyedSubscript:@"operator"];
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  __int128 v23 = v22;
                  uint64_t v24 = [v22 unsignedIntegerValue];

                  if (v24 == 1)
                  {
                    [v21 objectForKeyedSubscript:@"subfilters"];
                    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
                    [v64 removeObjectAtIndex:v18--];
                    [v64 addObjectsFromArray:v25];
                  }
                }
              }

              ++v18;
              id v7 = v64;
            }

            while (v18 < [v64 count]);
          }

          id v4 = v60;
          id v6 = v61;
          if ([v7 count] != 1) {
            goto LABEL_70;
          }
          [v61 setObject:0 forKeyedSubscript:@"operator"];
          goto LABEL_36;
        }
      }

      else
      {
        [v7 objectAtIndexedSubscript:0];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 objectForKeyedSubscript:@"logicalExp"];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {

          id v4 = v60;
LABEL_69:
          id v6 = v61;
          goto LABEL_70;
        }

        v28 = v27;
        [v27 objectForKeyedSubscript:@"operator"];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = (uint64_t)v29;
        if (v29)
        {
          uint64_t v30 = [v29 unsignedIntegerValue];

          if (v30)
          {
            uint64_t v17 = 0LL;
          }

          else
          {
            [v28 objectForKeyedSubscript:@"subfilters"];
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            [v31 objectAtIndexedSubscript:0];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 removeAllObjects];
            [v7 addObject:v32];
            [v61 setObject:0 forKeyedSubscript:@"operator"];

            uint64_t v17 = 2LL;
          }
        }
      }

      id v4 = v60;
      id v6 = v61;
      if (v17 == 2)
      {
LABEL_36:
        [v6 setObject:0 forKeyedSubscript:@"operator"];
        if ([v7 count])
        {
          id v67 = 0LL;
          unint64_t v33 = 0LL;
          do
          {
            [v7 objectAtIndexedSubscript:v33];
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            [v34 objectForKeyedSubscript:@"logicalExp"];
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = v35;
              [v35 objectForKeyedSubscript:@"operator"];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v37
                || (v38 = v37,
                    v39 = v34,
                    uint64_t v40 = [v37 unsignedIntegerValue],
                    v38,
                    BOOL v41 = v40 == 2,
                    v34 = v39,
                    v41))
              {
                v58 = v36;
                [v36 objectForKeyedSubscript:@"subfilters"];
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                [v7 removeObjectAtIndex:v33--];
                [v7 addObjectsFromArray:v42];
              }

              else
              {
                v58 = v36;
              }
            }

            else
            {
              if (v67)
              {
                v62 = v34;
                unint64_t v63 = v33;
                __int128 v76 = 0u;
                __int128 v77 = 0u;
                __int128 v74 = 0u;
                __int128 v75 = 0u;
                obuint64_t j = v34;
                uint64_t v66 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                if (v66)
                {
                  uint64_t v65 = *(void *)v75;
                  do
                  {
                    uint64_t v43 = 0LL;
                    do
                    {
                      if (*(void *)v75 != v65) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v69 = v43;
                      uint64_t v44 = *(void *)(*((void *)&v74 + 1) + 8 * v43);
                      [obj objectForKeyedSubscript:v44];
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      [v67 objectForKeyedSubscript:v44];
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v46)
                      {
                        v46 = (void *)objc_opt_new();
                        [v67 setObject:v46 forKeyedSubscript:v44];
                      }

                      __int128 v72 = 0u;
                      __int128 v73 = 0u;
                      __int128 v70 = 0u;
                      __int128 v71 = 0u;
                      id v47 = v45;
                      uint64_t v48 = [v47 countByEnumeratingWithState:&v70 objects:v82 count:16];
                      if (v48)
                      {
                        uint64_t v49 = v48;
                        uint64_t v50 = *(void *)v71;
                        do
                        {
                          for (uint64_t j = 0LL; j != v49; ++j)
                          {
                            if (*(void *)v71 != v50) {
                              objc_enumerationMutation(v47);
                            }
                            uint64_t v52 = *(void *)(*((void *)&v70 + 1) + 8 * j);
                            [v47 objectForKeyedSubscript:v52];
                            v53 = (void *)objc_claimAutoreleasedReturnValue();
                            uint64_t v54 = [v53 unsignedLongLongValue];

                            [v46 objectForKeyedSubscript:v52];
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            uint64_t v56 = [v55 unsignedLongLongValue];

                            [MEMORY[0x189607968] numberWithUnsignedLongLong:v56 | v54];
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            [v46 setObject:v57 forKeyedSubscript:v52];
                          }

                          uint64_t v49 = [v47 countByEnumeratingWithState:&v70 objects:v82 count:16];
                        }

                        while (v49);
                      }

                      uint64_t v43 = v69 + 1;
                    }

                    while (v69 + 1 != v66);
                    uint64_t v66 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                  }

                  while (v66);
                }

                id v7 = v64;
                [v64 removeObjectAtIndex:v63];
                unint64_t v33 = v63 - 1;
                v34 = v62;
              }

              else
              {
                id v67 = v34;
              }

              v58 = 0LL;
            }

            ++v33;
          }

          while (v33 < [v7 count]);
        }

        else
        {
          id v67 = 0LL;
        }

        id v4 = v60;
        if ([v7 count] == 1)
        {
          [v7 objectAtIndexedSubscript:0];
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          [v60 removeAllObjects];
          [v60 addEntriesFromDictionary:v59];
        }

        goto LABEL_69;
      }
    }

    else
    {
      [v60 setObject:0 forKeyedSubscript:@"logicalExp"];
    }

- (NSData)data
{
  filter = self->_filter;
  if (filter)
  {
    filter = (void *)[filter count];
    if (filter)
    {
      [MEMORY[0x1896079E8] dataWithPropertyList:self->_filter format:200 options:0 error:0];
      filter = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSData *)filter;
}

- (void)addProcessID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v18 = v8;
    if (a5)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      *a5 = v10;
    }

    else
    {
      pids = self->_pids;
      if (!pids)
      {
        unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v13 = self->_pids;
        self->_pids = v12;

        pids = self->_pids;
      }

      uint64_t v9 = pids;
      uint64_t v10 = self->_filter;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"pid");
    [v18 stringValue];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 unsignedLongLongValue];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v16 | a4];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v14);

    id v8 = v18;
  }
}

- (void)addProcess:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      *a5 = v10;
    }

    else
    {
      processes = self->_processes;
      if (!processes)
      {
        unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v13 = self->_processes;
        self->_processes = v12;

        processes = self->_processes;
      }

      uint64_t v9 = processes;
      uint64_t v10 = self->_filter;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"process");
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 unsignedLongLongValue];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v15 | a4];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    id v8 = v17;
  }
}

- (void)addProcessImagePath:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      *a5 = v10;
    }

    else
    {
      processImagePaths = self->_processImagePaths;
      if (!processImagePaths)
      {
        unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v13 = self->_processImagePaths;
        self->_processImagePaths = v12;

        processImagePaths = self->_processImagePaths;
      }

      uint64_t v9 = processImagePaths;
      uint64_t v10 = self->_filter;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v9,  @"processImagePath");
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 unsignedLongLongValue];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v15 | a4];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    id v8 = v17;
  }
}

- (void)addUserID:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v18 = v8;
    if (a5)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      *a5 = v10;
    }

    else
    {
      uids = self->_uids;
      if (!uids)
      {
        unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v13 = self->_uids;
        self->_uids = v12;

        uids = self->_uids;
      }

      uint64_t v9 = uids;
      uint64_t v10 = self->_filter;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"uid");
    [v18 stringValue];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v14);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 unsignedLongLongValue];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v16 | a4];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v14);

    id v8 = v18;
  }
}

- (void)addSubsystem:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      *a5 = v10;
    }

    else
    {
      subsystems = self->_subsystems;
      if (!subsystems)
      {
        unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v13 = self->_subsystems;
        self->_subsystems = v12;

        subsystems = self->_subsystems;
      }

      uint64_t v9 = subsystems;
      uint64_t v10 = self->_filter;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"subsystem");
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 unsignedLongLongValue];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v15 | a4];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    id v8 = v17;
  }
}

- (void)addCategory:(id)a3 flags:(unint64_t)a4 returningDict:(id *)a5
{
  id v8 = a3;
  if ((unint64_t)a5 | (unint64_t)self->_filter)
  {
    id v17 = v8;
    if (a5)
    {
      uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      *a5 = v10;
    }

    else
    {
      categories = self->_categories;
      if (!categories)
      {
        unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
        uint64_t v13 = self->_categories;
        self->_categories = v12;

        categories = self->_categories;
      }

      uint64_t v9 = categories;
      uint64_t v10 = self->_filter;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, @"category");
    -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v17);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 unsignedLongLongValue];

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v15 | a4];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v16, v17);

    id v8 = v17;
  }
}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5 returningDict:(id *)a6
{
  id v13 = a3;
  id v10 = a4;
  if ([v13 expressionType] == 3)
  {
    [v13 keyPath];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v11 isEqualToString:@"processID"] & 1) != 0
      || [v11 isEqualToString:@"processIdentifier"])
    {
      [v10 constantValue];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addProcessID:flags:returningDict:](self, "addProcessID:flags:returningDict:", v12, a5, a6);
    }

    else if ([v11 isEqualToString:@"process"])
    {
      [v10 constantValue];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addProcess:flags:returningDict:](self, "addProcess:flags:returningDict:", v12, a5, a6);
    }

    else if ([v11 isEqualToString:@"processImagePath"])
    {
      [v10 constantValue];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addProcessImagePath:flags:returningDict:]( self,  "addProcessImagePath:flags:returningDict:",  v12,  a5,  a6);
    }

    else if (([v11 isEqualToString:@"userID"] & 1) != 0 {
           || [v11 isEqualToString:@"userIdentifier"])
    }
    {
      [v10 constantValue];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addUserID:flags:returningDict:](self, "addUserID:flags:returningDict:", v12, a5, a6);
    }

    else if ([v11 isEqualToString:@"subsystem"])
    {
      [v10 constantValue];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addSubsystem:flags:returningDict:](self, "addSubsystem:flags:returningDict:", v12, a5, a6);
    }

    else
    {
      [v10 constantValue];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogStreamFilter addCategory:flags:returningDict:](self, "addCategory:flags:returningDict:", v12, a5, a6);
    }

LABEL_6:
  }
}

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4 flags:(unint64_t)a5
{
  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:returningDict:]( self,  "processLeftExpression:andRightExpression:flags:returningDict:",  a3,  a4,  a5,  0LL);
}

- (unint64_t)flagsForPredicate:(id)a3
{
  uint64_t v3 = [a3 predicateOperatorType];
  return (unint64_t)(v3 - 8) < 2 || v3 == 99;
}

- (id)dictionaryForComparisonPredicate:(id)a3
{
  id v4 = a3;
  [v4 leftExpression];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 rightExpression];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = -[_OSLogStreamFilter flagsForPredicate:](self, "flagsForPredicate:", v4);

  id v11 = 0LL;
  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:returningDict:]( self,  "processLeftExpression:andRightExpression:flags:returningDict:",  v5,  v6,  v7,  &v11);
  id v8 = v11;
  if (!v8)
  {
    id v10 = 0LL;
    -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:returningDict:]( self,  "processLeftExpression:andRightExpression:flags:returningDict:",  v6,  v5,  v7,  &v10);
    id v8 = v10;
  }

  return v8;
}

- (void)processComparisonPredicate:(id)a3
{
  id v4 = a3;
  [v4 leftExpression];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 rightExpression];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = -[_OSLogStreamFilter flagsForPredicate:](self, "flagsForPredicate:", v4);

  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:]( self,  "processLeftExpression:andRightExpression:flags:",  v7,  v5,  v6);
  -[_OSLogStreamFilter processLeftExpression:andRightExpression:flags:]( self,  "processLeftExpression:andRightExpression:flags:",  v5,  v7,  v6);
}

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    -[_OSLogStreamFilter processComparisonPredicate:](self, "processComparisonPredicate:", v4);
  }
}

- (void).cxx_destruct
{
}

@end