@interface DebugHierarchyCrawler
+ (id)crawlerWithRequestContext:(id)a3 knownObjectsMap:(id)a4;
- (DebugHierarchyCrawler)initWithRequestContext:(id)a3 knownObjectsMap:(id)a4;
- (DebugHierarchyCrawlerOptions)options;
- (DebugHierarchyRequestActionExecutor)actionExecutor;
- (DebugHierarchyRequestExecutionContext)requestContext;
- (NSMapTable)knownObjectsMap;
- (id)_entryPointClasses;
- (void)crawlDebugHierarchyObject:(id)a3 inGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6 withParentDefinedVisibility:(int64_t)a7;
- (void)crawlEntryPointClasses;
- (void)enumerateDebugHierarchyObjects:(id)a3 inGroupWithID:(id)a4 options:(id)a5 asDirectChildren:(BOOL)a6 belowParent:(id)a7;
- (void)setActionExecutor:(id)a3;
- (void)setKnownObjectsMap:(id)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation DebugHierarchyCrawler

+ (id)crawlerWithRequestContext:(id)a3 knownObjectsMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithRequestContext:v7 knownObjectsMap:v6];

  return v8;
}

- (DebugHierarchyCrawler)initWithRequestContext:(id)a3 knownObjectsMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DebugHierarchyCrawler;
  v9 = -[DebugHierarchyCrawler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_knownObjectsMap, a4);
    objc_storeStrong((id *)&v10->_requestContext, a3);
  }

  return v10;
}

- (void)crawlEntryPointClasses
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler _entryPointClasses](self, "_entryPointClasses"));
  id v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        v4 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyEntryPointProtocolHelper debugHierarchyGroupingIDsOnClass:]( &OBJC_CLASS___DebugHierarchyEntryPointProtocolHelper,  "debugHierarchyGroupingIDsOnClass:",  v3));
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v5 = v4;
        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v21;
          do
          {
            for (j = 0LL; j != v6; j = (char *)j + 1)
            {
              if (*(void *)v21 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)j);
              v10 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler options](self, "options"));
              if (v10)
              {
                v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler options](self, "options"));
                unsigned int v12 = [v11 shouldCrawlGroupWithID:v9];

                if (!v12) {
                  continue;
                }
              }

              id v19 = 0LL;
              v13 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyEntryPointProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:onEntryPointClass:]( &OBJC_CLASS___DebugHierarchyEntryPointProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:onEntryPointClass:",  v9,  &v19,  v3));
              id v14 = v19;
              -[DebugHierarchyCrawler enumerateDebugHierarchyObjects:inGroupWithID:options:asDirectChildren:belowParent:]( self,  "enumerateDebugHierarchyObjects:inGroupWithID:options:asDirectChildren:belowParent:",  v13,  v9,  v14,  1LL,  0LL);
            }

            id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }

          while (v6);
        }
      }

      id v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v17);
  }
}

- (DebugHierarchyCrawlerOptions)options
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler requestContext](self, "requestContext"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 request]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 crawlerOptions]);

  return (DebugHierarchyCrawlerOptions *)v4;
}

- (void)enumerateDebugHierarchyObjects:(id)a3 inGroupWithID:(id)a4 options:(id)a5 asDirectChildren:(BOOL)a6 belowParent:(id)a7
{
  BOOL v8 = a6;
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v21 count])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"visibilityImplementationDetail"]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"visibilityAppleInternal"]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"visibilityInvisible"]);
    if ([v21 count])
    {
      unint64_t v18 = 0LL;
      do
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v18]);
        if (v13)
        {
          if ([v15 containsIndex:v18])
          {
            uint64_t v20 = 2LL;
          }

          else if ([v16 containsIndex:v18])
          {
            uint64_t v20 = 4LL;
          }

          else if ([v17 containsIndex:v18])
          {
            uint64_t v20 = 8LL;
          }

          else
          {
            uint64_t v20 = 1LL;
          }
        }

        else
        {
          uint64_t v20 = 1LL;
        }

        -[DebugHierarchyCrawler crawlDebugHierarchyObject:inGroupWithID:asDirectChild:belowParent:withParentDefinedVisibility:]( self,  "crawlDebugHierarchyObject:inGroupWithID:asDirectChild:belowParent:withParentDefinedVisibility:",  v19,  v12,  v8,  v14,  v20);

        ++v18;
      }

      while ((unint64_t)[v21 count] > v18);
    }
  }
}

- (void)crawlDebugHierarchyObject:(id)a3 inGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6 withParentDefinedVisibility:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    v15 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v12);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler knownObjectsMap](self, "knownObjectsMap"));
    [v16 setObject:v12 forKey:v15];
  }

  int64_t v17 = DebugHierarchyVisibilityForObject(v12, a7);
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler requestContext](self, "requestContext"));
  unsigned int v19 = [v18 hasAlreadyFetchedDebugHierarchyObject:v12];

  if (v19)
  {
    if (!v9)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler requestContext](self, "requestContext"));
      [v20 addReferencedDebugHierarchyObject:v12 withVisibility:v17 toGroupWithID:v13 asDirectChild:0 belowParent:v14];
    }

    goto LABEL_18;
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler options](self, "options"));
  if (v21)
  {
    __int128 v22 = (void *)v21;
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler options](self, "options"));
    unsigned int v24 = [v23 shouldCrawlObject:v12];

    if (v24) {
      uint64_t v25 = 4LL;
    }
    else {
      uint64_t v25 = 2LL;
    }
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler requestContext](self, "requestContext"));
    [v26 addDebugHierarchyObject:v12 withVisibility:v17 fetchStatus:v25 toGroupWithID:v13 asDirectChild:v9 belowParent:v14];

    if (!v24) {
      goto LABEL_18;
    }
  }

  else
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler requestContext](self, "requestContext"));
    [v27 addDebugHierarchyObject:v12 withVisibility:v17 fetchStatus:4 toGroupWithID:v13 asDirectChild:v9 belowParent:v14];
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler requestContext](self, "requestContext"));
  v30 = (objc_class *)objc_opt_class(v12, v29);
  if (v30 && (v31 = v30, object_isClass(v30)))
  {
    v32 = NSStringFromClass(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  }

  else
  {
    v33 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v28 runtimeTypeWithName:v33]);

  id v42 = 0LL;
  id v43 = 0LL;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper childObjectsForObject:withType:outGroupingID:outOptions:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "childObjectsForObject:withType:outGroupingID:outOptions:",  v12,  v34,  &v43,  &v42));
  id v36 = v43;
  id v37 = v42;
  -[DebugHierarchyCrawler enumerateDebugHierarchyObjects:inGroupWithID:options:asDirectChildren:belowParent:]( self,  "enumerateDebugHierarchyObjects:inGroupWithID:options:asDirectChildren:belowParent:",  v35,  v36,  v37,  1LL,  v12);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = __119__DebugHierarchyCrawler_crawlDebugHierarchyObject_inGroupWithID_asDirectChild_belowParent_withParentDefinedVisibility___block_invoke;
  v40[3] = &unk_206C8;
  v40[4] = self;
  id v38 = v12;
  id v41 = v38;
  +[DebugHierarchyObjectProtocolHelper enumerateAdditionalGroupsAndObjectsOfObject:withType:withBlock:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "enumerateAdditionalGroupsAndObjectsOfObject:withType:withBlock:",  v38,  v34,  v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawler actionExecutor](self, "actionExecutor"));
  [v39 executeActionsWithObject:v38];

LABEL_18:
}

id __119__DebugHierarchyCrawler_crawlDebugHierarchyObject_inGroupWithID_asDirectChild_belowParent_withParentDefinedVisibility___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) enumerateDebugHierarchyObjects:a3 inGroupWithID:a2 options:a4 asDirectChildren:0 belowParent:*(void *)(a1 + 40)];
}

- (id)_entryPointClasses
{
  id v2 = DebugHierarchyEntryPointClasses();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (+[DebugHierarchyEntryPointProtocolHelper classImplementsRequiredEntryPointMethods:]( &OBJC_CLASS___DebugHierarchyEntryPointProtocolHelper,  "classImplementsRequiredEntryPointMethods:",  v10,  (void)v13))
        {
          [v4 addObject:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (DebugHierarchyRequestActionExecutor)actionExecutor
{
  return (DebugHierarchyRequestActionExecutor *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActionExecutor:(id)a3
{
}

- (NSMapTable)knownObjectsMap
{
  return self->_knownObjectsMap;
}

- (void)setKnownObjectsMap:(id)a3
{
}

- (DebugHierarchyRequestExecutionContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end