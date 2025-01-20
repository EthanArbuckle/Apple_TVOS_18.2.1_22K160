@interface ICDPlaybackPositionService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDPlaybackPositionService)init;
- (id)_connectionClientIdentity;
- (void)_handleImportNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification;
- (void)_performNotificationSyncForLibraryWithUID:(id)a3;
- (void)_setupNotificationHandlers;
- (void)dealloc;
- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)start;
- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
@end

@implementation ICDPlaybackPositionService

- (ICDPlaybackPositionService)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionService;
  v2 = -[ICDPlaybackPositionService init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_didStart = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___ICDPlaybackPositionRequestController);
    requestController = v3->_requestController;
    v3->_requestController = v4;
  }

  return v3;
}

- (void)start
{
  self->_didStart = 1;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionService;
  -[ICDPlaybackPositionService dealloc](&v4, "dealloc");
}

- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v15 = 138544130;
    v16 = self;
    __int16 v17 = 2114;
    v18 = v11;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ synchronizePlaybackPositionsForLibraryWithIdentifier:] Received request from connection %{public}@ for library with identifier %{public}@. checkpoint=%{BOOL}u",  (uint8_t *)&v15,  0x26u);
  }

  v12 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  v14 = -[ICDPlaybackPositionRequestContext initWithLibraryIdentifier:domain:clientIdentity:]( v12,  "initWithLibraryIdentifier:domain:clientIdentity:",  v8,  v9,  v13);

  -[ICDPlaybackPositionRequestController scheduleSyncWithContext:isCheckpoint:]( self->_requestController,  "scheduleSyncWithContext:isCheckpoint:",  v14,  v5);
}

- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    int v9 = 138543874;
    v10 = self;
    __int16 v11 = 2114;
    v12 = v6;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier:] Received request from connection %{public}@ for library with identifier %{public}@.",  (uint8_t *)&v9,  0x20u);
  }

  requestController = self->_requestController;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  -[ICDPlaybackPositionRequestController deletePlaybackPositionEntitiesFromLibraryWithIdentifier:clientIdentity:]( requestController,  "deletePlaybackPositionEntitiesFromLibraryWithIdentifier:clientIdentity:",  v4,  v8);
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
    int v11 = 138543874;
    v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ deletePlaybackPositionEntity:] Received request from connection %{public}@. libraryUID=%{public}@",  (uint8_t *)&v11,  0x20u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  v10 = -[ICDPlaybackPositionRequestContext initWithEntity:clientIdentity:]( v8,  "initWithEntity:clientIdentity:",  v4,  v9);

  -[ICDPlaybackPositionRequestController deletePlaybackPositionWithRequestContext:]( self->_requestController,  "deletePlaybackPositionWithRequestContext:",  v10);
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 libraryIdentifier]);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = self;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2114;
    v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ persistPlaybackPositionEntity:isCheckpoint:completionBlock:] Received request from connection %{public }@. libraryUID=%{public}@",  buf,  0x20u);
  }

  __int16 v13 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  __int16 v15 = -[ICDPlaybackPositionRequestContext initWithEntity:clientIdentity:]( v13,  "initWithEntity:clientIdentity:",  v8,  v14);

  requestController = self->_requestController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000487A0;
  v18[3] = &unk_1001A3BB0;
  v18[4] = self;
  id v19 = v9;
  id v17 = v9;
  -[ICDPlaybackPositionRequestController persistPlaybackPositionWithContext:isCheckpoint:completionHandler:]( requestController,  "persistPlaybackPositionWithContext:isCheckpoint:completionHandler:",  v15,  v6,  v18);
}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138544386;
    __int16 v24 = self;
    __int16 v25 = 2114;
    v26 = v15;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ getLocalPlaybackPositionForEntityIdentifiers:] Received request from connection %{public}@ for domain %{public}@ with library (%{public}@). identifiers=%{public}@",  buf,  0x34u);
  }

  requestController = self->_requestController;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000485D4;
  v20[3] = &unk_1001A2E00;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v18 = v13;
  id v19 = v12;
  -[ICDPlaybackPositionRequestController getLocalPlaybackPositionForEntityIdentifiers:forDomain:fromLibraryWithIdentifier:clientIdentity:completionBlock:]( requestController,  "getLocalPlaybackPositionForEntityIdentifiers:forDomain:fromLibraryWithIdentifier:clientIdentity:completionBlock:",  v10,  v11,  v19,  v17,  v20);
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 libraryIdentifier]);
    int v11 = 138543874;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ updateForeignDatabaseWithValuesFromPlaybackPositionEntity:] Received request from connection %{public} @. libraryUID=%{public}@",  (uint8_t *)&v11,  0x20u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  id v10 = -[ICDPlaybackPositionRequestContext initWithEntity:clientIdentity:]( v8,  "initWithEntity:clientIdentity:",  v4,  v9);

  -[ICDPlaybackPositionRequestController updateForeignDatabaseWithRequestContext:]( self->_requestController,  "updateForeignDatabaseWithRequestContext:",  v10);
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
    *(_DWORD *)buf = 138543874;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ pullPlaybackPositionEntity:] Received request from connection %{public}@. libraryUID=%{public}@",  buf,  0x20u);
  }

  int v11 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  __int16 v13 = -[ICDPlaybackPositionRequestContext initWithEntity:clientIdentity:]( v11,  "initWithEntity:clientIdentity:",  v6,  v12);

  requestController = self->_requestController;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004842C;
  v16[3] = &unk_1001A2E28;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  -[ICDPlaybackPositionRequestController pullPlaybackPositionWithRequestContext:completionBlock:]( requestController,  "pullPlaybackPositionWithRequestContext:completionBlock:",  v13,  v16);
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 2114;
    v23 = v9;
    __int16 v24 = 2114;
    __int16 v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@ pushPlaybackPositionEntity:completionBlock:] Received request from connection %{public}@. libraryUID=%{public}@",  buf,  0x20u);
  }

  int v11 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICDPlaybackPositionService _connectionClientIdentity](self, "_connectionClientIdentity"));
  __int16 v13 = -[ICDPlaybackPositionRequestContext initWithEntity:clientIdentity:]( v11,  "initWithEntity:clientIdentity:",  v6,  v12);

  requestController = self->_requestController;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000482B0;
  v17[3] = &unk_1001A2E50;
  id v18 = v6;
  id v19 = v7;
  v17[4] = self;
  id v15 = v6;
  id v16 = v7;
  -[ICDPlaybackPositionRequestController pushPlaybackPositionWithContext:completionHandler:]( requestController,  "pushPlaybackPositionWithContext:completionHandler:",  v13,  v17);
}

- (id)_connectionClientIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v3 = v2;
  if (!v2)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Could not create client identity with nil connection",  buf,  2u);
    }

    goto LABEL_7;
  }

  [v2 auditToken];
  uint64_t v4 = MSVTCCIdentityForAuditToken(&v9);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
      *(_DWORD *)buf = 138412290;
      int v11 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Could not create client identity from XPCConnection=%@",  buf,  0xCu);
    }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!self->_didStart)
  {
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2114;
      v35 = v8;
      v26 = "%{public}@ Service has not started. Rejecting connection %{public}@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
    }

- (void)_setupNotificationHandlers
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Setting up notifications handlers.",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification" name:ICUserIdentityStoreDidChangeNotification object:0];

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleImportNotification:" name:@"ICDPlaybackPositionImportRequiresSyncNotification" object:0];
}

- (void)_handleImportNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 object]);
  if (v5
    && (int v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 object]),
        int v8 = _NSIsNSString(v7),
        v7,
        v6,
        v8))
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 object]);
    unsigned int v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      int v13 = 138543875;
      BOOL v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 2113;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received %{public}@ notification for library %{private}@. Performing sync.",  (uint8_t *)&v13,  0x20u);
    }

    -[ICDPlaybackPositionService _performNotificationSyncForLibraryWithUID:]( self,  "_performNotificationSyncForLibraryWithUID:",  v9);
  }

  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      int v13 = 138543618;
      BOOL v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@ Received %{public}@ notification without libraryUID",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary allLibraries](&OBJC_CLASS___ML3MusicLibrary, "allLibraries"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004800C;
  v4[3] = &unk_1001A2E78;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)_performNotificationSyncForLibraryWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___ICDPlaybackPositionRequestContext);
  uint64_t v6 = ICPlaybackPositionServiceDomainDefault;
  uint64_t v7 = MSVTCCIdentityForCurrentProcess();
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = -[ICDPlaybackPositionRequestContext initWithLibraryIdentifier:domain:clientIdentity:]( v5,  "initWithLibraryIdentifier:domain:clientIdentity:",  v4,  v6,  v8);

  -[ICDPlaybackPositionRequestController scheduleSyncWithContext:isCheckpoint:]( self->_requestController,  "scheduleSyncWithContext:isCheckpoint:",  v9,  0LL);
}

- (void).cxx_destruct
{
}

@end