@interface TVPFetchManager
- (NSMutableDictionary)objectsToFetchResultsMapping;
- (PHFetchResult)rootFetchResult;
- (TVPFetchManager)initWithFetchResult:(id)a3;
- (id)fetchManagerByApplyingChange:(id)a3;
- (id)fetchResultForObject:(id)a3 missBlock:(id)a4;
- (void)_setFetchResult:(id)a3 forObject:(id)a4;
- (void)resetObjectCache;
- (void)setObjectsToFetchResultsMapping:(id)a3;
- (void)setRootFetchResult:(id)a3;
@end

@implementation TVPFetchManager

- (TVPFetchManager)initWithFetchResult:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVPFetchManager;
  v6 = -[TVPFetchManager init](&v10, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    objectsToFetchResultsMapping = v6->_objectsToFetchResultsMapping;
    v6->_objectsToFetchResultsMapping = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_rootFetchResult, a3);
  }

  return v6;
}

- (id)fetchResultForObject:(id)a3 missBlock:(id)a4
{
  id v7 = a3;
  v8 = (uint64_t (**)(void))a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_objectsToFetchResultsMapping, "objectForKey:", v7));
  if (!v9)
  {
    uint64_t v10 = v8[2](v8);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!v11) {
      sub_100079C7C((uint64_t)a2, (uint64_t)self);
    }
    v9 = (void *)v11;
    -[TVPFetchManager _setFetchResult:forObject:](self, "_setFetchResult:forObject:", v11, v7);
  }

  return v9;
}

- (id)fetchManagerByApplyingChange:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 changeDetailsForFetchResult:self->_rootFetchResult]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchResultAfterChanges]);
  v6 = -[TVPFetchManager initWithFetchResult:](objc_alloc(&OBJC_CLASS___TVPFetchManager), "initWithFetchResult:", v5);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "changedObjects", (void)v17));
        unsigned __int8 v14 = [v13 containsObject:v12];

        if ((v14 & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_objectsToFetchResultsMapping,  "objectForKey:",  v12));
          if (v15) {
            -[TVPFetchManager _setFetchResult:forObject:](v6, "_setFetchResult:forObject:", v15, v12);
          }
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v6;
}

- (void)resetObjectCache
{
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  objectsToFetchResultsMapping = self->_objectsToFetchResultsMapping;
  self->_objectsToFetchResultsMapping = v3;
}

- (void)_setFetchResult:(id)a3 forObject:(id)a4
{
}

- (PHFetchResult)rootFetchResult
{
  return self->_rootFetchResult;
}

- (void)setRootFetchResult:(id)a3
{
}

- (NSMutableDictionary)objectsToFetchResultsMapping
{
  return self->_objectsToFetchResultsMapping;
}

- (void)setObjectsToFetchResultsMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end