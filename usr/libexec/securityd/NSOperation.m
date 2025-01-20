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

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%@)", v6, v7));
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v8;
}

- (void)linearDependencies:(id)a3
{
  id v4 = a3;
  objc_sync_enter(v4);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(NSOperation **)(*((void *)&v11 + 1) + 8LL * (void)v8) != self) {
          -[NSOperation addDependency:](self, "addDependency:", (void)v11);
        }
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }

    while (v6);
  }

  [v5 addObject:self];
  if ((unint64_t)[v5 count] >= 0x65)
  {
    v9 = sub_10001267C("SecError");
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = 100;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ckks-operation: linear dependencies exceeds %d operations",  buf,  8u);
    }
  }

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
        v9 = *(NSOperation **)(*((void *)&v10 + 1) + 8LL * (void)v8);
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
  id v5 = objc_autoreleasePoolPush();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation dependencies](self, "dependencies"));
  id v7 = [v6 copy];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 indexesOfObjectsPassingTest:&stru_10028FE78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectsAtIndexes:v8]);

  if ([v9 count])
  {
    off_1002DE630();
    if (*v10 < 0x15u)
    {
      __int128 v12 = v10;
      v24 = v5;
      ++*v10;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v14 = v9;
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            v20 = objc_autoreleasePoolPush();
            v21 = (void *)objc_claimAutoreleasedReturnValue([v19 description]);
            [v13 addObject:v21];

            objc_autoreleasePoolPop(v20);
          }

          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }

        while (v16);
      }

      --*v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));
      __int128 v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  v4,  v22));

      id v5 = v24;
    }

    else
    {
      __int128 v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<recursion too deep>"));
    }
  }

  else
  {
    __int128 v11 = &stru_100294B48;
  }

  objc_autoreleasePoolPop(v5);
  return v11;
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation pendingDependenciesString:](self, "pendingDependenciesString:", @" dep:"));
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation pendingDependenciesString:](self, "pendingDependenciesString:", @" dep:"));
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
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10011BF9C;
  v3[3] = &unk_100291A38;
  objc_copyWeak(&v4, &location);
  -[NSOperation setCompletionBlock:](self, "setCompletionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end