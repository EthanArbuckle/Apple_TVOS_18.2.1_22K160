@interface PLAssetsdResourceAvailabilityService
- (PLAssetsdResourceAvailabilityService)initWithLibraryServicesManager:(id)a3 shellObject:(id)a4 trustedCallerBundleID:(id)a5 clientPid:(int)a6;
- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject;
- (id)_clientPidPrefixedTaskIdentifierWithTaskIdentifier:(id)a3;
- (id)appyCorrectionsToAssetWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)appyCorrectionsToResourceWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)makeResourceAvailableWithRequest:(id)a3 reply:(id)a4;
- (id)runVideoRequest:(id)a3 reply:(id)a4;
- (void)initializeSharedMemoryForCacheMetricsCollector:(id)a3;
- (void)makeResourceUnavailableWithRequest:(id)a3;
@end

@implementation PLAssetsdResourceAvailabilityService

- (PLAssetsdResourceAvailabilityService)initWithLibraryServicesManager:(id)a3 shellObject:(id)a4 trustedCallerBundleID:(id)a5 clientPid:(int)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PLAssetsdResourceAvailabilityService;
  v13 = -[PLAssetsdResourceAvailabilityService initWithLibraryServicesManager:]( &v16,  "initWithLibraryServicesManager:",  a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cacheMetricsShellObject, a4);
    objc_storeStrong((id *)&v14->_trustedCallerBundleID, a5);
    v14->_clientPid = a6;
  }

  return v14;
}

- (id)_clientPidPrefixedTaskIdentifierWithTaskIdentifier:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%lu)%@",  self->_clientPid,  a3);
}

- (id)makeResourceAvailableWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:]( self,  "newShortLivedLibraryWithName:",  "-[PLAssetsdResourceAvailabilityService makeResourceAvailableWithRequest:reply:]");
  id v25 = 0LL;
  char v9 = sub_100007B8C(v8, &v25);
  id v10 = v25;
  if ((v9 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 taskIdentifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[PLAssetsdResourceAvailabilityService _clientPidPrefixedTaskIdentifierWithTaskIdentifier:]( self,  "_clientPidPrefixedTaskIdentifierWithTaskIdentifier:",  v12));

    id v14 = [[PHServerResourceRequestRunner alloc] initWithTaskIdentifier:v13];
    trustedCallerBundleID = self->_trustedCallerBundleID;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000806C;
    v20[3] = &unk_100020CA0;
    id v21 = v11;
    id v22 = v6;
    id v23 = v13;
    id v24 = v7;
    id v16 = v13;
    id v17 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v14 makeResourceAvailableWithRequest:v22 library:v8 clientBundleID:trustedCallerBundleID reply:v20]);
  }

  else
  {
    (*((void (**)(id, void, void, void, void, id))v7 + 2))(v7, 0LL, 0LL, 0LL, 0LL, v10);
    v18 = 0LL;
  }

  return v18;
}

- (void)makeResourceUnavailableWithRequest:(id)a3
{
  id v9 = a3;
  id v4 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:]( self,  "newShortLivedLibraryWithName:",  "-[PLAssetsdResourceAvailabilityService makeResourceUnavailableWithRequest:]");
  if (sub_100007B8C(v4, 0LL))
  {
    id v5 = objc_alloc(&OBJC_CLASS___PHServerResourceRequestRunner);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 taskIdentifier]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PLAssetsdResourceAvailabilityService _clientPidPrefixedTaskIdentifierWithTaskIdentifier:]( self,  "_clientPidPrefixedTaskIdentifierWithTaskIdentifier:",  v6));
    id v8 = [v5 initWithTaskIdentifier:v7];

    [v8 makeResourceUnavailableWithRequest:v9 library:v4];
  }
}

- (id)runVideoRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:]( self,  "newShortLivedLibraryWithName:",  "-[PLAssetsdResourceAvailabilityService runVideoRequest:reply:]");
  id v24 = 0LL;
  char v9 = sub_100007B8C(v8, &v24);
  id v10 = v24;
  if ((v9 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 taskIdentifier]);
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[PLAssetsdResourceAvailabilityService _clientPidPrefixedTaskIdentifierWithTaskIdentifier:]( self,  "_clientPidPrefixedTaskIdentifierWithTaskIdentifier:",  v12));

    id v14 = [[PHServerResourceRequestRunner alloc] initWithTaskIdentifier:v13];
    trustedCallerBundleID = self->_trustedCallerBundleID;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100007EB0;
    v20[3] = &unk_100020CC8;
    id v21 = v11;
    id v22 = v13;
    id v23 = v7;
    id v16 = v13;
    id v17 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue( [v14 chooseVideoWithRequest:v6 library:v8 clientBundleID:trustedCallerBundleID reply:v20]);
  }

  else
  {
    (*((void (**)(id, void, void, void, void, void, id))v7 + 2))(v7, 0LL, 0LL, 0LL, 0LL, 0LL, v10);
    v18 = 0LL;
  }

  return v18;
}

- (id)appyCorrectionsToResourceWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:]( self,  "newShortLivedLibraryWithName:",  "-[PLAssetsdResourceAvailabilityService appyCorrectionsToResourceWithRequest:errorCodes:reply:]");
  id v23 = 0LL;
  char v12 = sub_100007B8C(v11, &v23);
  id v13 = v23;
  if ((v12 & 1) != 0)
  {
    id v14 = objc_alloc(&OBJC_CLASS___PHServerResourceRequestRunner);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 taskIdentifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PLAssetsdResourceAvailabilityService _clientPidPrefixedTaskIdentifierWithTaskIdentifier:]( self,  "_clientPidPrefixedTaskIdentifierWithTaskIdentifier:",  v15));
    id v17 = [v14 initWithTaskIdentifier:v16];

    trustedCallerBundleID = self->_trustedCallerBundleID;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100007E60;
    v21[3] = &unk_100020CF0;
    id v22 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue( [v17 applyResourceScopeCorrectionsWithRequest:v8 errorCodes:v9 clientBundleID:trustedCallerBundleID library:v11 reply:v21]);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
    v19 = 0LL;
  }

  return v19;
}

- (id)appyCorrectionsToAssetWithRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[PLAssetsdResourceAvailabilityService newShortLivedLibraryWithName:]( self,  "newShortLivedLibraryWithName:",  "-[PLAssetsdResourceAvailabilityService appyCorrectionsToAssetWithRequest:errorCodes:reply:]");
  id v23 = 0LL;
  char v12 = sub_100007B8C(v11, &v23);
  id v13 = v23;
  if ((v12 & 1) != 0)
  {
    id v14 = objc_alloc(&OBJC_CLASS___PHServerResourceRequestRunner);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v8 taskIdentifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[PLAssetsdResourceAvailabilityService _clientPidPrefixedTaskIdentifierWithTaskIdentifier:]( self,  "_clientPidPrefixedTaskIdentifierWithTaskIdentifier:",  v15));
    id v17 = [v14 initWithTaskIdentifier:v16];

    trustedCallerBundleID = self->_trustedCallerBundleID;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100007E10;
    v21[3] = &unk_100020CF0;
    id v22 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue( [v17 applyAssetScopeCorrectionsWithRequest:v8 errorCodes:v9 clientBundleID:trustedCallerBundleID library:v11 reply:v21]);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
    v19 = 0LL;
  }

  return v19;
}

- (void)initializeSharedMemoryForCacheMetricsCollector:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  *(_OWORD *)sel = 0u;
  __int128 v12 = 0u;
  unsigned int v5 = +[PLXPCMessageLogger enabled](&OBJC_CLASS___PLXPCMessageLogger, "enabled", 0LL);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create( (void *)&_mh_execute_header,  "PLXPC Service: initializeSharedMemoryForCacheMetricsCollector:",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object", (void)v12));
  id v7 = [[PLCacheMetricsCollectorServer alloc] initWithXPCObject:v6];
  -[PLCacheMetricsCollectorServerShell setCacheMetricsCollectorServer:]( self->_cacheMetricsShellObject,  "setCacheMetricsCollectorServer:",  v7);

  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    uint64_t Log = PLRequestGetLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Log);
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v17 = Name;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_END,  v14,  "PLXPC Sync",  "%{public}s",  buf,  0xCu);
    }
  }
}

- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject
{
  return self->_cacheMetricsShellObject;
}

- (void).cxx_destruct
{
}

@end