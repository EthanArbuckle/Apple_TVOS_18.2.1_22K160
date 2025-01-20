@interface NSOperation
- (BOOL)isPending;
- (id)debugDescription;
- (id)description;
- (id)pendingDependenciesString:(id)a3;
- (id)selfname;
- (void)addNullableDependency:(id)a3;
- (void)linearDependencies:(id)a3;
- (void)linearDependenciesWithSelfFirst:(id)a3;
- (void)removeDependenciesUponCompletion;
@end

@implementation NSOperation

- (id)selfname
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));

  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%@)", v7, v8));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  return v9;
}

- (void)linearDependencies:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(NSOperation **)(*((void *)&v9 + 1) + 8LL * (void)v8) != self) {
          -[NSOperation addDependency:](self, "addDependency:", (void)v9);
        }
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }

  [v5 addObject:self];
  objc_sync_exit(v5);
}

- (void)linearDependenciesWithSelfFirst:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        __int128 v9 = *(NSOperation **)(*((void *)&v10 + 1) + 8LL * (void)v8);
        if (v9 != self)
        {
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "isPending", (void)v10))
          {
            -[NSOperation addDependency:](v9, "addDependency:", self);
            if (-[NSOperation isPending](v9, "isPending")) {
              goto LABEL_11;
            }
            -[NSOperation removeDependency:](v9, "removeDependency:", self);
          }

          -[NSOperation addDependency:](self, "addDependency:", v9);
        }

- (id)pendingDependenciesString:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation dependencies](self, "dependencies"));
  id v6 = [v5 copy];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 indexesOfObjectsPassingTest:&stru_10028A420]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectsAtIndexes:v7]);

  if ([v8 count])
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));
    __int128 v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v4,  v9));
  }

  else
  {
    __int128 v10 = &stru_10028E390;
  }

  return v10;
}

- (id)description
{
  if (-[NSOperation isFinished](self, "isFinished"))
  {
    v3 = @"finished";
  }

  else if (-[NSOperation isCancelled](self, "isCancelled"))
  {
    v3 = @"cancelled";
  }

  else if (-[NSOperation isExecuting](self, "isExecuting"))
  {
    v3 = @"executing";
  }

  else
  {
    unsigned int v4 = -[NSOperation isReady](self, "isReady");
    v3 = @"pending";
    if (v4) {
      v3 = @"ready";
    }
  }

  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation selfname](self, "selfname"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation pendingDependenciesString:](self, "pendingDependenciesString:", @" dep:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@%@>",  v6,  v5,  v7));

  return v8;
}

- (id)debugDescription
{
  if (-[NSOperation isFinished](self, "isFinished"))
  {
    v3 = @"finished";
  }

  else if (-[NSOperation isCancelled](self, "isCancelled"))
  {
    v3 = @"cancelled";
  }

  else if (-[NSOperation isExecuting](self, "isExecuting"))
  {
    v3 = @"executing";
  }

  else
  {
    unsigned int v4 = -[NSOperation isReady](self, "isReady");
    v3 = @"pending";
    if (v4) {
      v3 = @"ready";
    }
  }

  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation selfname](self, "selfname"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation pendingDependenciesString:](self, "pendingDependenciesString:", @" dep:"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ (%p): %@%@>",  v6,  self,  v5,  v7));

  return v8;
}

- (BOOL)isPending
{
  if (-[NSOperation isExecuting](self, "isExecuting") || -[NSOperation isFinished](self, "isFinished")) {
    return 0;
  }
  else {
    return !-[NSOperation isCancelled](self, "isCancelled");
  }
}

- (void)addNullableDependency:(id)a3
{
  if (a3) {
    -[NSOperation addDependency:](self, "addDependency:");
  }
}

- (void)removeDependenciesUponCompletion
{
  id location = 0LL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1001D04B8;
  v3[3] = &unk_100276D20;
  objc_copyWeak(&v4, &location);
  -[NSOperation setCompletionBlock:](self, "setCompletionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end