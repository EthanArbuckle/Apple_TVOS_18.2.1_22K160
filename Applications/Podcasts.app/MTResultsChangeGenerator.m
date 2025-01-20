@interface MTResultsChangeGenerator
- (MTResultsChangeGenerator)initWithDelegate:(id)a3;
- (MTResultsChangeGeneratorDelegate)delegate;
- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5;
- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5 autoremove:(BOOL)a6;
- (id)box:(id)a3;
- (id)closestIndexPathToRow:(unint64_t)a3 forIndexPaths:(id)a4;
- (id)objectsToIndexPathDictionary:(id)a3 inSection:(unint64_t)a4;
- (id)unbox:(id)a3;
- (void)generateChangesForExistingObjects:(id)a3 newObjects:(id)a4 inSection:(unint64_t)a5;
- (void)removeIndexPath:(id)a3 forObject:(id)a4 fromMap:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MTResultsChangeGenerator

- (MTResultsChangeGenerator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTResultsChangeGenerator;
  v5 = -[MTResultsChangeGenerator init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTResultsChangeGenerator setDelegate:](v5, "setDelegate:", v4);
  }

  return v6;
}

- (void)generateChangesForExistingObjects:(id)a3 newObjects:(id)a4 inSection:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue( -[MTResultsChangeGenerator objectsToIndexPathDictionary:inSection:]( self,  "objectsToIndexPathDictionary:inSection:",  v8,  a5));
    v41 = (void *)objc_claimAutoreleasedReturnValue( -[MTResultsChangeGenerator objectsToIndexPathDictionary:inSection:]( self,  "objectsToIndexPathDictionary:inSection:",  v10,  a5));
    id v11 = [v41 mutableCopy];
    v42 = v10;
    if ([v8 count])
    {
      unint64_t v12 = 0LL;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v12]);
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v12,  a5));
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTResultsChangeGenerator bestIndexPathForObject:atIndex:fromMap:autoremove:]( self,  "bestIndexPathForObject:atIndex:fromMap:autoremove:",  v13,  v12,  v11,  0LL));
        if (v15)
        {
          -[MTResultsChangeGenerator removeIndexPath:forObject:fromMap:]( self,  "removeIndexPath:forObject:fromMap:",  v15,  v13,  v11);
        }

        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator delegate](self, "delegate"));
          [v16 generator:self didChangeObject:v13 atIndexPath:v14 forChangeType:2 newIndexPath:0];
        }

        ++v12;
      }

      while (v12 < (unint64_t)[v8 count]);
    }

    id v43 = v8;
    unint64_t v44 = a5;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v11 allKeys]);
    id v17 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    v48 = v11;
    if (v17)
    {
      id v18 = v17;
      uint64_t v47 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator unbox:](self, "unbox:", v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v20]);
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          id v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v50;
            do
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v50 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)j);
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator delegate](self, "delegate"));
                [v28 generator:self didChangeObject:v21 atIndexPath:0 forChangeType:1 newIndexPath:v27];
              }

              id v24 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }

            while (v24);
          }

          id v11 = v48;
        }

        id v18 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }

      while (v18);
    }

    v10 = v42;
    id v8 = v43;
    unint64_t v29 = v44;
    v30 = &OBJC_CLASS___DebugUtil_ptr;
    if ([v42 count])
    {
      unint64_t v31 = 0LL;
      do
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v42 objectAtIndex:v31]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v30[142] indexPathForRow:v31 inSection:v29]);
        v34 = (void *)objc_claimAutoreleasedReturnValue( -[MTResultsChangeGenerator bestIndexPathForObject:atIndex:fromMap:]( self,  "bestIndexPathForObject:atIndex:fromMap:",  v32,  v31,  v45));
        v35 = v34;
        if (v34)
        {
          unsigned int v36 = [v34 isEqual:v33];
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator delegate](self, "delegate"));
          v38 = v37;
          BOOL v39 = v36 == 0;
          unint64_t v29 = v44;
          if (v39) {
            uint64_t v40 = 3LL;
          }
          else {
            uint64_t v40 = 4LL;
          }
          [v37 generator:self didChangeObject:v32 atIndexPath:v35 forChangeType:v40 newIndexPath:v33];

          v30 = &OBJC_CLASS___DebugUtil_ptr;
        }

        ++v31;
      }

      while (v31 < (unint64_t)[v42 count]);
    }
  }
}

- (id)objectsToIndexPathDictionary:(id)a3 inSection:(unint64_t)a4
{
  id v6 = a3;
  v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
  if ([v6 count])
  {
    unint64_t v8 = 0LL;
    do
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator box:](self, "box:", v9));
      id v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v10));
      if (!v11)
      {
        id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v11, v10);
      }

      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  v8,  a4));
      -[NSMutableSet addObject:](v11, "addObject:", v12);

      ++v8;
    }

    while (v8 < (unint64_t)[v6 count]);
  }

  return v7;
}

- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5
{
  return -[MTResultsChangeGenerator bestIndexPathForObject:atIndex:fromMap:autoremove:]( self,  "bestIndexPathForObject:atIndex:fromMap:autoremove:",  a3,  a4,  a5,  1LL);
}

- (id)bestIndexPathForObject:(id)a3 atIndex:(unint64_t)a4 fromMap:(id)a5 autoremove:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator box:](self, "box:", a3));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);
  v13 = v12;
  if (v12 && [v12 count])
  {
    if ([v13 count] == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 anyObject]);
      if (v6) {
        [v10 removeObjectForKey:v11];
      }
    }

    else
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue( -[MTResultsChangeGenerator closestIndexPathToRow:forIndexPaths:]( self,  "closestIndexPathToRow:forIndexPaths:",  a4,  v13));
      v14 = (void *)v16;
      if (v6 && v16) {
        [v13 removeObject:v16];
      }
    }
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)removeIndexPath:(id)a3 forObject:(id)a4 fromMap:(id)a5
{
  if (a3 && a4)
  {
    if (a5)
    {
      id v8 = a5;
      id v9 = a3;
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTResultsChangeGenerator box:](self, "box:", a4));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v11]);

      [v10 removeObject:v9];
    }
  }

- (id)closestIndexPathToRow:(unint64_t)a3 forIndexPaths:(id)a4
{
  id v5 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v18;
    unint64_t v10 = -1LL;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v13 = (char *)[v12 row];
        else {
          v14 = (char *)(a3 - (void)v13);
        }
        if (!v8 || (unint64_t)v14 < v10)
        {
          id v15 = v12;

          unint64_t v10 = (unint64_t)v14;
          id v8 = v15;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)box:(id)a3
{
  id v3 = a3;
  id v4 = -[MTResultsChangeWrapper initWithObject:]( objc_alloc(&OBJC_CLASS___MTResultsChangeWrapper),  "initWithObject:",  v3);

  return v4;
}

- (id)unbox:(id)a3
{
  return [a3 object];
}

- (MTResultsChangeGeneratorDelegate)delegate
{
  return (MTResultsChangeGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end