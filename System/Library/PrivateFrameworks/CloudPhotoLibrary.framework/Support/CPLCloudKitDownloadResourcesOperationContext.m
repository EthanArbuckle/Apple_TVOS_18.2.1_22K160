@interface CPLCloudKitDownloadResourcesOperationContext
- (CPLCloudKitDownloadResourcesOperationContext)initWithResourceType:(unint64_t)a3;
- (id)extendedStatusDescriptionStrings;
- (id)operationDescription;
- (unint64_t)resourceType;
- (void)addResource:(id)a3;
- (void)recordCompletionForResource:(id)a3 withError:(id)a4;
- (void)updateProgress:(double)a3 forResource:(id)a4;
@end

@implementation CPLCloudKitDownloadResourcesOperationContext

- (CPLCloudKitDownloadResourcesOperationContext)initWithResourceType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitDownloadResourcesOperationContext;
  result = -[CPLCloudKitDownloadResourcesOperationContext init](&v5, "init");
  if (result) {
    result->_resourceType = a3;
  }
  return result;
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  resourceToProgressMap = self->_resourceToProgressMap;
  id v8 = v4;
  if (!resourceToProgressMap)
  {
    v6 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  6LL);
    v7 = self->_resourceToProgressMap;
    self->_resourceToProgressMap = v6;

    id v4 = v8;
    resourceToProgressMap = self->_resourceToProgressMap;
  }

  -[NSMapTable setObject:forKey:](resourceToProgressMap, "setObject:forKey:", &off_10025A050, v4);
}

- (void)updateProgress:(double)a3 forResource:(id)a4
{
  uint64_t v5 = (uint64_t)(a3 * 100.0);
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
  -[NSMapTable setObject:forKey:](self->_resourceToProgressMap, "setObject:forKey:", v7, v6);
}

- (void)recordCompletionForResource:(id)a3 withError:(id)a4
{
  resourceToProgressMap = self->_resourceToProgressMap;
  if (a4) {
    id v6 = &off_10025A068;
  }
  else {
    id v6 = &off_10025A080;
  }
  -[NSMapTable setObject:forKey:](resourceToProgressMap, "setObject:forKey:", v6, a3);
}

- (id)operationDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  self->_resourceType));
  v3 = (void *)objc_claimAutoreleasedReturnValue([@"for " stringByAppendingString:v2]);

  return v3;
}

- (id)extendedStatusDescriptionStrings
{
  v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = 72LL;
  v50 = self;
  NSUInteger v4 = -[NSMapTable count](self->_resourceToProgressMap, "count");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v46 = [v5 BOOLForKey:@"CPLUseCompactCloudKitStatus"];

  if (v4)
  {
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v6 = v50->_resourceToProgressMap;
    id v7 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      v47 = 0LL;
      uint64_t v49 = *(void *)v52;
      v45 = v6;
      do
      {
        v12 = 0LL;
        id v48 = v8;
        do
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&v50->super.super.isa + v3) objectForKey:v13]);
          uint64_t v15 = (uint64_t)[v14 integerValue];
          if (v15 < 100)
          {
            uint64_t v16 = v15;
            uint64_t v17 = v3;
            v18 = (void *)objc_claimAutoreleasedReturnValue([v13 identity]);
            id v19 = [v18 fileSize];
            if ((v46 & 1) == 0)
            {
              uint64_t v43 = v11;
              uint64_t v44 = v9;
              if (v14)
              {
                v20 = &stru_1002482B0;
                if (v16 < 0) {
                  v20 = @" [error]";
                }
                v41 = v20;
                uint64_t v42 = v16 & ~(v16 >> 63);
                v21 = objc_alloc(&OBJC_CLASS___NSString);
                v22 = (void *)objc_claimAutoreleasedReturnValue([v13 itemScopedIdentifier]);
                v23 = (void *)objc_claimAutoreleasedReturnValue([v18 fileUTI]);
                v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v19,  3LL));
                v25 = -[NSString initWithFormat:]( v21,  "initWithFormat:",  @"\t%@ (%@, %@) [%ld%%]%@",  v22,  v23,  v24,  v42,  v41);
              }

              else
              {
                v26 = objc_alloc(&OBJC_CLASS___NSString);
                v22 = (void *)objc_claimAutoreleasedReturnValue([v13 itemScopedIdentifier]);
                v23 = (void *)objc_claimAutoreleasedReturnValue([v18 fileUTI]);
                v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v19,  3LL));
                v25 = -[NSString initWithFormat:]( v26,  "initWithFormat:",  @"\t%@ (%@, %@) [waiting]",  v22,  v23,  v24,  v38,  v39);
              }

              v27 = v25;

              -[NSMutableArray addObject:](v40, "addObject:", v27);
              v47 = v27;
              uint64_t v11 = v43;
              uint64_t v9 = v44;
            }

            v11 += (uint64_t)v19;
            ++v9;

            uint64_t v3 = v17;
            id v6 = v45;
            id v8 = v48;
          }

          else
          {
            ++v10;
          }

          v12 = (char *)v12 + 1;
        }

        while (v8 != v12);
        id v8 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
      }

      while (v8);

      if (v10)
      {
        v28 = objc_alloc(&OBJC_CLASS___NSString);
        uint64_t v29 = objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  v50->_resourceType));
        uint64_t v30 = v11;
        v31 = (void *)v29;
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v30,  3LL));
        v33 = -[NSString initWithFormat:]( v28,  "initWithFormat:",  @"\t\t%lu (+ %lu downloaded) x %@ in batch (%@)",  v9,  v10,  v31,  v32);
LABEL_24:
        v36 = v33;

        -[NSMutableArray addObject:](v40, "addObject:", v36);
        return v40;
      }

      uint64_t v34 = v11;
    }

    else
    {

      v47 = 0LL;
      uint64_t v34 = 0LL;
      uint64_t v9 = 0LL;
    }

    v35 = objc_alloc(&OBJC_CLASS___NSString);
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  v50->_resourceType));
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v34,  3LL));
    v33 = -[NSString initWithFormat:](v35, "initWithFormat:", @"\t\t%lu x %@ in batch (%@)", v9, v31, v32, v38);
    goto LABEL_24;
  }

  return v40;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void).cxx_destruct
{
}

@end