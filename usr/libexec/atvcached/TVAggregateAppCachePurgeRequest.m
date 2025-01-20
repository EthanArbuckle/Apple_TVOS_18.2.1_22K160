@interface TVAggregateAppCachePurgeRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)performBlockInTerminationAssertionForRequiredApplications:(id)a3;
- (NSArray)applications;
- (NSArray)applicationsRequiringTermination;
- (NSMutableDictionary)mutableRequests;
- (NSString)description;
- (NSURL)cacheURL;
- (TVAggregateAppCachePurgeRequest)init;
- (TVAggregateAppCachePurgeRequest)initWithCacheURL:(id)a3;
- (TVAggregateAppCachePurgeRequest)initWithCoder:(id)a3;
- (TVAggregateAppCachePurgeRequest)initWithPropertyListRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyListRepresentation;
- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4;
- (int64_t)purgeableAmountWithUrgency:(int64_t)a3;
- (int64_t)urgency;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheURL:(id)a3;
- (void)setMutableRequests:(id)a3;
- (void)setPurgeRequest:(id)a3 forApplication:(id)a4;
@end

@implementation TVAggregateAppCachePurgeRequest

- (TVAggregateAppCachePurgeRequest)init
{
  return -[TVAggregateAppCachePurgeRequest initWithCacheURL:](self, "initWithCacheURL:", 0LL);
}

- (TVAggregateAppCachePurgeRequest)initWithCacheURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVAggregateAppCachePurgeRequest;
  v6 = -[TVAggregateAppCachePurgeRequest init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cacheURL, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutableRequests = v7->_mutableRequests;
    v7->_mutableRequests = v8;
  }

  return v7;
}

- (int64_t)urgency
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 4LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005E08;
  v5[3] = &unk_10000C5D0;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)applications
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);

  return (NSArray *)v3;
}

- (NSArray)applicationsRequiringTermination
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100005F30;
  v8[3] = &unk_10000C5F8;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  id v6 = [v5 copy];
  return (NSArray *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
  [v4 encodeObject:v5 forKey:@"TVCacheURL"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  id v6 = [v7 copy];
  [v4 encodeObject:v6 forKey:@"TVPurgeRequests"];
}

- (TVAggregateAppCachePurgeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVAggregateAppCachePurgeRequest;
  id v5 = -[TVAggregateAppCachePurgeRequest init](&v17, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"TVCacheURL"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    cacheURL = v5->_cacheURL;
    v5->_cacheURL = (NSURL *)v7;

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    objc_super v11 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v9,  v10,  objc_opt_class(&OBJC_CLASS___TVSAppCachePurgeRequest),  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v12 forKey:@"TVPurgeRequests"]);
    v14 = (NSMutableDictionary *)[v13 mutableCopy];
    mutableRequests = v5->_mutableRequests;
    v5->_mutableRequests = v14;
  }

  return v5;
}

- (id)propertyListRepresentation
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));

  if (!v3) {
    return 0LL;
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100006280;
  v14 = &unk_10000C5F8;
  v15 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];

  v16[0] = @"TVCacheURL";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL", v11, v12, v13, v14));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  v16[1] = @"TVPurgeRequests";
  v17[0] = v8;
  v17[1] = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

  return v9;
}

- (TVAggregateAppCachePurgeRequest)initWithPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TVCacheURL"]);
  if (v5
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
        unsigned int v7 = [v6 fileExistsAtPath:v5],
        v6,
        v7))
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___TVAggregateAppCachePurgeRequest;
    uint64_t v8 = -[TVAggregateAppCachePurgeRequest init](&v19, "init");
    if (v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));
      cacheURL = v8->_cacheURL;
      v8->_cacheURL = (NSURL *)v9;

      objc_super v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      mutableRequests = v8->_mutableRequests;
      v8->_mutableRequests = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TVPurgeRequests"]);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        void v17[2] = sub_100006458;
        v17[3] = &unk_10000C3F0;
        v18 = v8;
        [v13 enumerateKeysAndObjectsUsingBlock:v17];
      }
    }

    self = v8;
    v15 = self;
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(&OBJC_CLASS___TVAggregateAppCachePurgeRequest);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
  id v6 = -[TVAggregateAppCachePurgeRequest initWithCacheURL:](v4, "initWithCacheURL:", v5);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  id v8 = [v7 mutableCopy];
  -[TVAggregateAppCachePurgeRequest setMutableRequests:](v6, "setMutableRequests:", v8);

  return v6;
}

- (void)setPurgeRequest:(id)a3 forApplication:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v6)
  {
    if (!v16)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
      [v15 removeObjectForKey:v6];
      goto LABEL_9;
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v16 cacheURL]);

    if (v7)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
      if (!v8
        || (uint64_t v9 = (void *)v8,
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 cacheURL]),
            objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL")),
            unsigned __int8 v12 = [v10 isEqual:v11],
            v11,
            v10,
            v9,
            (v12 & 1) != 0))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
        [v13 setObject:v16 forKeyedSubscript:v6];

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
        if (!v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v16 cacheURL]);
          -[TVAggregateAppCachePurgeRequest setCacheURL:](self, "setCacheURL:", v15);
LABEL_9:
        }
      }
    }
  }
}

- (BOOL)performBlockInTerminationAssertionForRequiredApplications:(id)a3
{
  v26 = (void (**)(id, void))a3;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  dispatch_semaphore_t v29 = dispatch_semaphore_create(0LL);
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 1;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVAggregateAppCachePurgeRequest applicationsRequiringTermination]( self,  "applicationsRequiringTermination"));
  id v4 = [v3 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v39;
    id v6 = (void *)FBSApplicationTerminationAssertionReasonCacheDeletion;
    v27 = (void *)FBSApplicationTerminationAssertionReasonInstallation;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        if ([v8 isEqualToString:@"com.apple.PineBoard"])
        {
          id v9 = sub_100007290();
          uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
            sub_100007940(v11, v49, &v50, v10);
          }
        }

        else
        {
          uint64_t v10 = v6;
          if ([v8 isEqualToString:@"com.apple.TVIdleScreen"])
          {
            unsigned __int8 v12 = v27;

            uint64_t v10 = v12;
          }

          id v13 = objc_alloc(&OBJC_CLASS___FBSApplicationTerminationAssertion);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_100006AF8;
          v35[3] = &unk_10000C620;
          v37 = &v42;
          uint64_t v14 = v29;
          v36 = v14;
          id v15 = [v13 initWithBundleID:v8 reason:v10 acquisitionHandler:v35];
          [v30 addObject:v15];
          dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }

    while (v4);
  }

  v26[2](v26, *((unsigned __int8 *)v43 + 24));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v16 = v30;
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
        if ([v20 assertionState] != (id)1)
        {
          id v21 = sub_100007290();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]);
            *(_DWORD *)buf = 138543362;
            v47 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Bundle ID %{public}@ did not allow termination assertion.",  buf,  0xCu);
          }
        }

        [v20 invalidate];
      }

      id v17 = [v16 countByEnumeratingWithState:&v31 objects:v48 count:16];
    }

    while (v17);
  }

  BOOL v24 = *((_BYTE *)v43 + 24) != 0;
  _Block_object_dispose(&v42, 8);

  return v24;
}

- (int64_t)purgeableAmountWithUrgency:(int64_t)a3
{
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  if (-[TVAggregateAppCachePurgeRequest urgency](self, "urgency") <= a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    id v7 = [v6 cacheType];

    if (v7 == (id)3)
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
      if (!v10) {
        __assert_rtn( "-[TVAggregateAppCachePurgeRequest purgeableAmountWithUrgency:]",  "TVAggregateAppCachePurgeRequest.m",  245,  "semaphore != nil");
      }
      dispatch_semaphore_t v11 = v10;
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateService sharedInstance](&OBJC_CLASS___PBSOSUpdateService, "sharedInstance"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100006D70;
      v21[3] = &unk_10000C648;
      v23 = &v24;
      uint64_t v8 = v11;
      v22 = v8;
      [v12 purgeableAssetSpaceWithCompletion:v21];

      dispatch_time_t v13 = dispatch_time(0LL, 30000000000LL);
      dispatch_semaphore_wait(v8, v13);

      goto LABEL_7;
    }

    if (v7 == (id)2)
    {
      uint64_t v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[TVPMediaCacheManager sharedInstance]( &OBJC_CLASS___TVPMediaCacheManager,  "sharedInstance"));
      id v9 = -[dispatch_semaphore_s currentCacheSize](v8, "currentCacheSize");
      v25[3] = (uint64_t)v9;
LABEL_7:

      goto LABEL_11;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
    unsigned int v15 = [v14 checkResourceIsReachableAndReturnError:0];

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
      id v18 = objc_msgSend(v16, "tvcd_sizeOfFileAtURL:", v17);
      v25[3] = (uint64_t)v18;
    }

    else
    {
      v25[3] = 0LL;
    }
  }

- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest mutableRequests](self, "mutableRequests"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  id v10 = [v9 cacheType];

  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
  LODWORD(v8) = [v11 checkResourceIsReachableAndReturnError:0];

  if ((_DWORD)v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100006ED4;
    v14[3] = &unk_10000C670;
    v14[6] = v10;
    v14[7] = a4;
    v14[4] = self;
    v14[5] = &v15;
    v14[8] = a3;
    -[TVAggregateAppCachePurgeRequest performBlockInTerminationAssertionForRequiredApplications:]( self,  "performBlockInTerminationAssertionForRequiredApplications:",  v14);
  }

  int64_t v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVAggregateAppCachePurgeRequest cacheURL](self, "cacheURL"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> URL: %@",  v3,  self,  v4));

  return (NSString *)v5;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
}

- (NSMutableDictionary)mutableRequests
{
  return self->_mutableRequests;
}

- (void)setMutableRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end