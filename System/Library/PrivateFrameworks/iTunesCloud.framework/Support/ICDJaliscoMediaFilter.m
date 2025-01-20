@interface ICDJaliscoMediaFilter
- (ICDJaliscoMediaFilter)initWithKindsToExclude:(id)a3 supportedMediaKindsHandler:(id)a4;
- (NSArray)supportedMediaKinds;
- (NSString)daapQueryFilterString;
@end

@implementation ICDJaliscoMediaFilter

- (ICDJaliscoMediaFilter)initWithKindsToExclude:(id)a3 supportedMediaKindsHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICDJaliscoMediaFilter;
  v8 = -[ICDJaliscoMediaFilter init](&v12, "init");
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    excludedKinds = v8->_excludedKinds;
    v8->_excludedKinds = v9;

    objc_storeStrong((id *)&v8->_supportedMediaKindsHandler, a4);
  }

  return v8;
}

- (NSArray)supportedMediaKinds
{
  supportedMediaKinds = self->_supportedMediaKinds;
  if (!supportedMediaKinds)
  {
    if (self->_excludedKinds) {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"));
    }
    else {
      uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    v5 = (void *)v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", &off_1001B3E80));
    if (ICSystemApplicationIsInstalled(0LL))
    {
      if (-[ICDJaliscoSupportedMediaKindsHandler shouldIncludeMediaKindSongForJaliscoImport]( self->_supportedMediaKindsHandler,  "shouldIncludeMediaKindSongForJaliscoImport")) {
        [v6 addObject:&off_1001B3E98];
      }
      [v6 addObject:&off_1001B3EB0];
      [v6 addObject:&off_1001B3EC8];
    }

    if (ICSystemApplicationIsInstalled(1LL))
    {
      [v6 addObject:&off_1001B3EE0];
      [v6 addObject:&off_1001B3EF8];
      [v6 addObject:&off_1001B3F10];
    }

    [v6 minusSet:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary jaliscoGetSortedMediaKinds:]( &OBJC_CLASS___ML3MusicLibrary,  "jaliscoGetSortedMediaKinds:",  v7));
    v9 = self->_supportedMediaKinds;
    self->_supportedMediaKinds = v8;

    v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_supportedMediaKinds;
      int v13 = 138543874;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2114;
      v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Supported media kinds=%{public}@, Disabled media kinds=%{public}@",  (uint8_t *)&v13,  0x20u);
    }

    supportedMediaKinds = self->_supportedMediaKinds;
  }

  return supportedMediaKinds;
}

- (NSString)daapQueryFilterString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.itunes.extended-media-kind" stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDJaliscoMediaFilter supportedMediaKinds](self, "supportedMediaKinds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDJaliscoMediaFilter supportedMediaKinds](self, "supportedMediaKinds"));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"'%@:%d'",  v3,  [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) intValue]));
        [v5 addObject:v11];

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v8);
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@","]);
  int v13 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Media importer query filter set to: %{public}@",  buf,  0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v12));
  return (NSString *)v14;
}

- (void).cxx_destruct
{
}

@end