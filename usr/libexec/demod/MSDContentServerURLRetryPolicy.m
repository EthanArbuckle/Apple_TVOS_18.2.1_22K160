@interface MSDContentServerURLRetryPolicy
- (BOOL)cachingHubAvailable;
- (BOOL)localHubReachable;
- (MSDContentServerURLRetryPolicy)initWithContext:(id)a3;
- (MSDFileDownloadCredentials)fdc;
- (NSArray)localURLList;
- (NSArray)remoteURLList;
- (NSDictionary)localCredential;
- (NSDictionary)remoteCredential;
- (NSString)serverType;
- (id)buildLocalURLListFromContext:(id)a3;
- (id)getCredential;
- (id)getURLSchemaList:(id)a3;
- (id)nextTry;
- (unint64_t)currentTry;
- (void)setCachingHubAvailable:(BOOL)a3;
- (void)setCurrentTry:(unint64_t)a3;
- (void)setFdc:(id)a3;
- (void)setLocalCredential:(id)a3;
- (void)setLocalHubReachable:(BOOL)a3;
- (void)setLocalURLList:(id)a3;
- (void)setRemoteCredential:(id)a3;
- (void)setRemoteURLList:(id)a3;
- (void)setServerType:(id)a3;
@end

@implementation MSDContentServerURLRetryPolicy

- (MSDContentServerURLRetryPolicy)initWithContext:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MSDContentServerURLRetryPolicy;
  v5 = -[MSDContentServerURLRetryPolicy init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 fdc]);
    -[MSDContentServerURLRetryPolicy setFdc:](v5, "setFdc:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 fdc]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 originServer]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 localCredentialForOriginServer:v8]);
    -[MSDContentServerURLRetryPolicy setLocalCredential:](v5, "setLocalCredential:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 fdc]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 originServer]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteCredentialForOriginServer:v11]);
    -[MSDContentServerURLRetryPolicy setRemoteCredential:](v5, "setRemoteCredential:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localCredential](v5, "localCredential"));
    -[MSDContentServerURLRetryPolicy setCachingHubAvailable:](v5, "setCachingHubAvailable:", v13 != 0LL);

    -[MSDContentServerURLRetryPolicy setServerType:](v5, "setServerType:", @"remoteCDN");
    if ([v4 tryCachingHub]
      && -[MSDContentServerURLRetryPolicy cachingHubAvailable](v5, "cachingHubAvailable"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[MSDContentServerURLRetryPolicy buildLocalURLListFromContext:]( v5,  "buildLocalURLListFromContext:",  v4));
      -[MSDContentServerURLRetryPolicy setLocalURLList:](v5, "setLocalURLList:", v14);

      -[MSDContentServerURLRetryPolicy setServerType:](v5, "setServerType:", @"localCachingHub");
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteCredential](v5, "remoteCredential"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteCredential](v5, "remoteCredential"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy getURLSchemaList:](v5, "getURLSchemaList:", v16));
      -[MSDContentServerURLRetryPolicy setRemoteURLList:](v5, "setRemoteURLList:", v17);
    }

    -[MSDContentServerURLRetryPolicy setCurrentTry:](v5, "setCurrentTry:", 0LL);
    -[MSDContentServerURLRetryPolicy setLocalHubReachable:]( v5,  "setLocalHubReachable:",  [v4 tryCachingHub]);
    v18 = v5;
  }

  return v5;
}

- (id)nextTry
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
  unsigned int v4 = [v3 isEqualToString:@"localCachingHub"];

  if (v4)
  {
    unint64_t v5 = -[MSDContentServerURLRetryPolicy currentTry](self, "currentTry");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localURLList](self, "localURLList"));
    id v7 = [v6 count];

    if (v5 < (unint64_t)v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localURLList](self, "localURLList"));
      v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "objectAtIndex:",  -[MSDContentServerURLRetryPolicy currentTry](self, "currentTry")));

      goto LABEL_8;
    }

    id v10 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000A0A14((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
    }

    -[MSDContentServerURLRetryPolicy setLocalHubReachable:](self, "setLocalHubReachable:", 0LL);
    -[MSDContentServerURLRetryPolicy setServerType:](self, "setServerType:", @"remoteCDN");
    -[MSDContentServerURLRetryPolicy setCurrentTry:](self, "setCurrentTry:", 0LL);
  }

  v9 = 0LL;
LABEL_8:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
  unsigned int v19 = [v18 isEqualToString:@"remoteCDN"];

  if (v19)
  {
    if (-[MSDContentServerURLRetryPolicy currentTry](self, "currentTry")
      || (v28 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteURLList](self, "remoteURLList")),
          id v29 = [v28 count],
          v28,
          !v29))
    {
      id v20 = sub_10003A95C();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000A09B0((uint64_t)self, v21, v22, v23, v24, v25, v26, v27);
      }
    }

    else
    {
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteURLList](self, "remoteURLList"));
      uint64_t v30 = objc_claimAutoreleasedReturnValue(-[os_log_s objectAtIndex:](v21, "objectAtIndex:", 0LL));

      v9 = (void *)v30;
    }
  }

  if (v9)
  {
    v31 = objc_alloc_init(&OBJC_CLASS___MSDServerRetryInfo);
    -[MSDServerRetryInfo setUrlSchema:](v31, "setUrlSchema:", v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
    -[MSDServerRetryInfo setServerType:](v31, "setServerType:", v32);

    -[MSDServerRetryInfo setLocalHubReachable:]( v31,  "setLocalHubReachable:",  -[MSDContentServerURLRetryPolicy localHubReachable](self, "localHubReachable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy getCredential](self, "getCredential"));
    -[MSDServerRetryInfo setCredential:](v31, "setCredential:", v33);
  }

  else
  {
    v31 = 0LL;
  }

  -[MSDContentServerURLRetryPolicy setCurrentTry:]( self,  "setCurrentTry:",  (char *)-[MSDContentServerURLRetryPolicy currentTry](self, "currentTry") + 1);

  return v31;
}

- (id)getCredential
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy serverType](self, "serverType"));
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy remoteCredential](self, "remoteCredential"));
  }
  unint64_t v5 = (void *)v4;

  return v5;
}

- (id)buildLocalURLListFromContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy localCredential](self, "localCredential"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServerURLRetryPolicy getURLSchemaList:](self, "getURLSchemaList:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 cachedLocalURL]);
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 cachedLocalURL]);
    [v6 removeObject:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 cachedLocalURL]);
    [v6 insertObject:v10 atIndex:0];
  }

  return v6;
}

- (id)getURLSchemaList:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"URLSchema"]);
  if (!v7)
  {
    id v17 = sub_10003A95C();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000A0A78((uint64_t)self, (uint64_t)v4, v13);
    }
    goto LABEL_9;
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      -[NSMutableArray addObject:](v5, "addObject:", v7);
      goto LABEL_6;
    }

    id v12 = sub_10003A95C();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543874;
      unsigned int v19 = self;
      __int16 v20 = 2114;
      id v21 = (id)objc_opt_class(v7, v14);
      __int16 v22 = 2114;
      id v23 = v4;
      id v16 = v21;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: Unrecognized URL Scheme type :%{public}@ from download credential %{public}@",  (uint8_t *)&v18,  0x20u);
    }

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (MSDFileDownloadCredentials)fdc
{
  return (MSDFileDownloadCredentials *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFdc:(id)a3
{
}

- (NSArray)localURLList
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLocalURLList:(id)a3
{
}

- (NSArray)remoteURLList
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setRemoteURLList:(id)a3
{
}

- (unint64_t)currentTry
{
  return self->_currentTry;
}

- (void)setCurrentTry:(unint64_t)a3
{
  self->_currentTry = a3;
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setServerType:(id)a3
{
}

- (BOOL)cachingHubAvailable
{
  return self->_cachingHubAvailable;
}

- (void)setCachingHubAvailable:(BOOL)a3
{
  self->_cachingHubAvailable = a3;
}

- (NSDictionary)localCredential
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setLocalCredential:(id)a3
{
}

- (NSDictionary)remoteCredential
{
  return (NSDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setRemoteCredential:(id)a3
{
}

- (void).cxx_destruct
{
}

@end