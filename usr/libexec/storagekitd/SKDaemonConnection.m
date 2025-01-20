@interface SKDaemonConnection
+ (int64_t)checkPrivilegeLevelWithConnection:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)authorizeRequestForRoot;
- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7;
- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5;
- (BOOL)requiresMountAudit;
- (SKDaemonConnection)initWithConnection:(id)a3;
- (id)_safe_object:(id)a3;
- (id)eraseWithEraser:(id)a3 reply:(id)a4;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7 failResGenFunc:(id)a8;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 failResGenFunc:(id)a7;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRoot:(BOOL)a7 failResGenFunc:(id)a8;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5;
- (id)preflightRequestWithDisksArr:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRootForInternal:(BOOL)a7 failResGenFunc:(id)a8;
- (id)resizeDisk:(id)a3 size:(unint64_t)a4 reply:(id)a5;
- (int64_t)privilege;
- (unsigned)authRef;
- (unsigned)gid;
- (unsigned)uid;
- (void)childDisksForWholeDisk:(id)a3 withCompletionUUID:(id)a4;
- (void)diskForPath:(id)a3 withCompletionUUID:(id)a4;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)ejectDisk:(id)a3 withCompletionUUID:(id)a4;
- (void)filesystemsWithCompletionUUID:(id)a3;
- (void)initialPopulateComplete;
- (void)isBusyWithCompletionUUID:(id)a3;
- (void)managerResumed;
- (void)managerStalled;
- (void)mountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5;
- (void)physicalStoresForAPFSVolume:(id)a3 withCompletionUUID:(id)a4;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 withCompletionUUID:(id)a5;
- (void)renameDisk:(id)a3 to:(id)a4 withCompletionUUID:(id)a5;
- (void)setAuthRef:(unsigned __int8)a3;
- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionUUID:(id)a5;
- (void)setPrivilege:(int64_t)a3;
- (void)syncAllDisksWithCompletionUUID:(id)a3;
- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5;
- (void)volumesForAPFSPS:(id)a3 withCompletionUUID:(id)a4;
- (void)wholeDiskForDiskDictionary:(id)a3 withCompletionUUID:(id)a4;
@end

@implementation SKDaemonConnection

+ (int64_t)checkPrivilegeLevelWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = sub_10000E2BC();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "A SK client wants to connect", (uint8_t *)v19, 2u);
  }

  if (sub_10000EEF8((uint64_t)off_1000518A8, v3))
  {
    id v6 = sub_10000E2BC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client entitled for destructive operations",  (uint8_t *)v19,  2u);
    }

    int64_t v8 = 3LL;
    goto LABEL_22;
  }

  if (sub_10000EEF8((uint64_t)off_1000518A0, v3))
  {
    id v9 = sub_10000E2BC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      int64_t v8 = 2LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client entitled for destructive external operations",  (uint8_t *)v19,  2u);
    }

    else
    {
      int64_t v8 = 2LL;
    }

    goto LABEL_22;
  }

  if (!sub_10000EEF8((uint64_t)off_100051898, v3))
  {
    BOOL v11 = sub_10000EEF8((uint64_t)off_100051890, v3);
    id v12 = sub_10000E2BC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v19[0]) = 0;
        v14 = "Client entitled for information";
        v15 = v7;
        uint32_t v16 = 2;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)v19, v16);
      }
    }

    else if (v13)
    {
      unsigned int v17 = [v3 processIdentifier];
      v19[0] = 67109120;
      v19[1] = v17;
      v14 = "Client (%d) not entitiled, applying default level (information)";
      v15 = v7;
      uint32_t v16 = 8;
      goto LABEL_20;
    }

    int64_t v8 = 0LL;
    goto LABEL_22;
  }

  id v10 = sub_10000E2BC();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client entitled for state-changing",  (uint8_t *)v19,  2u);
  }

  int64_t v8 = 1LL;
LABEL_22:

  return v8;
}

- (SKDaemonConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___SKDaemonConnection;
  v5 = -[SKDaemonConnection init](&v21, "init");
  if (!v5)
  {
LABEL_14:
    BOOL v11 = v5;
    goto LABEL_15;
  }

  int64_t v6 = +[SKDaemonConnection checkPrivilegeLevelWithConnection:]( &OBJC_CLASS___SKDaemonConnection,  "checkPrivilegeLevelWithConnection:",  v4);
  *((void *)v5 + 4) = v6;
  if (v6 != -1)
  {
    if (sub_10000EEF8((uint64_t)off_1000518B0, v4))
    {
      id v7 = sub_10000E2BC();
      int64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client has audited mounts entitlement",  buf,  2u);
      }

      v5[16] = 1;
    }

    id v9 = sub_100003EFC();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v4 setExportedInterface:v10];

    [v4 setExportedObject:v5];
    *((_DWORD *)v5 + 5) = [v4 effectiveUserIdentifier];
    *((_DWORD *)v5 + 6) = [v4 effectiveGroupIdentifier];
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
    __int128 v12 = *(_OWORD *)&buf[16];
    *(_OWORD *)(v5 + 40) = *(_OWORD *)buf;
    *(_OWORD *)(v5 + 56) = v12;
    id v13 = sub_100004094();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v4 setRemoteObjectInterface:v14];

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 remoteObjectProxyWithErrorHandler:&stru_100044E60]);
    uint32_t v16 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v15;

    id v17 = sub_10000E2BC();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v4 processIdentifier];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SKDaemonConnection initWithConnection:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: Connected via XPC from pid %d",  buf,  0x12u);
    }

    goto LABEL_14;
  }

  BOOL v11 = 0LL;
LABEL_15:

  return v11;
}

- (BOOL)authorizeRequestForRoot
{
  id v2 = sub_10000E2BC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    int64_t v6 = "-[SKDaemonConnection authorizeRequestForRoot]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s: Not allowed for non-root users on this platform",  (uint8_t *)&v5,  0xCu);
  }

  return 0;
}

- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7
{
  id v11 = a3;
  __int128 v12 = (char *)a5;
  if (!v11)
  {
    id v18 = sub_10000E2BC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v17 = "Couldn't find disk for given disk dictionary.";
      unsigned int v19 = v15;
      uint32_t v20 = 2;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v17, buf, v20);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  int64_t v13 = -[SKDaemonConnection privilege](self, "privilege");
  if (v13 < a4)
  {
    id v14 = sub_10000E2BC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543362;
        v28 = v12;
        id v17 = "Missing entitlement, request denied for UUID: %{public}@.";
LABEL_14:
        unsigned int v19 = v15;
        uint32_t v20 = 12;
        goto LABEL_15;
      }
    }

    else if (v16)
    {
      *(_DWORD *)buf = 136446210;
      v28 = a6;
      id v17 = "Missing entitlement, request denied for API: %{public}s.";
      goto LABEL_14;
    }

- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5
{
  return -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:]( self,  "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:",  a3,  a4,  0LL,  a5,  1LL);
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5
{
  id v8 = a3;
  id v9 = sub_10000E2BC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2080;
    unsigned int v19 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s",  (uint8_t *)&v16,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 knownDiskForDictionary:v8]);

  unsigned int v13 = -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:]( self,  "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:",  v12,  a4,  0LL,  a5,  1LL);
  id v14 = 0LL;
  if (v13) {
    id v14 = v12;
  }

  return v14;
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 failResGenFunc:(id)a7
{
  return -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:]( self,  "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:",  a3,  a4,  a5,  a6,  1LL,  a7);
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRoot:(BOOL)a7 failResGenFunc:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  int v16 = (uint64_t (**)(void))a8;
  if (v9 && !-[SKDaemonConnection authorizeRequestForRoot](self, "authorizeRequestForRoot"))
  {
    progressHandler = self->_progressHandler;
    uint64_t v19 = v16[2](v16);
    uint32_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:]( progressHandler,  "requestWithUUID:didCompleteWithResult:",  v15,  v20);

    id v17 = 0LL;
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:]( self,  "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:",  v14,  a4,  v15,  a6,  !v9,  v16));
  }

  return v17;
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7 failResGenFunc:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  int v16 = (uint64_t (**)(void))a8;
  id v17 = sub_10000E2BC();
  __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412802;
    id v27 = v14;
    __int16 v28 = 2080;
    v29 = a6;
    __int16 v30 = 2114;
    id v31 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  (uint8_t *)&v26,  0x20u);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  uint32_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 knownDiskForDictionary:v14]);

  if (-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:]( self,  "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:",  v20,  a4,  v15,  a6,  v9))
  {
    id v21 = v20;
  }

  else
  {
    progressHandler = self->_progressHandler;
    uint64_t v23 = v16[2](v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:]( progressHandler,  "requestWithUUID:didCompleteWithResult:",  v15,  v24);

    id v21 = 0LL;
  }

  return v21;
}

- (id)preflightRequestWithDisksArr:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRootForInternal:(BOOL)a7 failResGenFunc:(id)a8
{
  BOOL v36 = a7;
  id v13 = a3;
  id v37 = a5;
  id v14 = (uint64_t (**)(void))a8;
  id v15 = sub_10000E2BC();
  int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v44 = v13;
    __int16 v45 = 2080;
    v46 = a6;
    __int16 v47 = 2114;
    id v48 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  buf,  0x20u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v13;
  id v18 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    v34 = v14;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)i);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager", v34));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 knownDiskForDictionary:v22]);

        if (!v24)
        {
          id v28 = sub_10000E2BC();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Couldn't find disk for given disk dictionary.",  buf,  2u);
          }

LABEL_21:
          progressHandler = self->_progressHandler;
          id v14 = v34;
          uint64_t v31 = v34[2](v34);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:]( progressHandler,  "requestWithUUID:didCompleteWithResult:",  v37,  v32);
          int v26 = obj;

          id v27 = 0LL;
          goto LABEL_22;
        }

        if (v36)
        {
          unsigned int v25 = [v24 isInternal];
          if (!-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:]( self,  "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:",  v24,  a4,  v37,  a6,  v25 ^ 1)
            || v25 && !-[SKDaemonConnection authorizeRequestForRoot](self, "authorizeRequestForRoot"))
          {
            goto LABEL_21;
          }
        }

        else if (!-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:]( self,  "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:",  v24,  a4,  v37,  a6,  1LL))
        {
          goto LABEL_21;
        }

        [v17 addObject:v24];
      }

      id v19 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      id v14 = v34;
      if (v19) {
        continue;
      }
      break;
    }
  }

  int v26 = obj;

  id v27 = v17;
LABEL_22:

  return v27;
}

- (void)initialPopulateComplete
{
}

- (void)disksAppeared:(id)a3
{
}

- (void)disksChanged:(id)a3
{
}

- (void)disksDisappeared:(id)a3
{
}

- (void)managerStalled
{
}

- (void)managerResumed
{
}

- (void)syncAllDisksWithCompletionUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000E2BC();
  int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DAEMON - waiting for initialPopulateComplete",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000FED8;
  v9[3] = &unk_100044EB0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 syncAllDisksWithCompletionBlock:v9];
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionUUID:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10000E2BC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SKDaemonConnection setDaemonOptionsWithLanguage:authRef:withCompletionUUID:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Preflight at %s with UUID: %{public}@",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  char v18 = 1;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100010088;
  v14[3] = &unk_100044ED8;
  v14[4] = self;
  id v13 = v9;
  id v15 = v13;
  int v16 = buf;
  [v12 setDaemonOptionsWithLanguage:v8 authRef:v6 withCompletionBlock:v14];

  _Block_object_dispose(buf, 8);
}

- (void)diskForPath:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000E2BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[SKDaemonConnection diskForPath:withCompletionUUID:]";
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight at %s with UUID: %{public}@",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100010294;
  v12[3] = &unk_100044F00;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 diskForPath:v7 withCallbackBlock:v12];
}

- (void)wholeDiskForDiskDictionary:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000E2BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2080;
    id v19 = "-[SKDaemonConnection wholeDiskForDiskDictionary:withCompletionUUID:]";
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  buf,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 knownDiskForDictionary:v6]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000104CC;
  v14[3] = &unk_100044F00;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v10 wholeDiskForDisk:v12 withCallbackBlock:v14];
}

- (void)childDisksForWholeDisk:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000E2BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2080;
    id v19 = "-[SKDaemonConnection childDisksForWholeDisk:withCompletionUUID:]";
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  buf,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 knownDiskForDictionary:v6]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100010704;
  v14[3] = &unk_100044F28;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v10 childDisksForWholeDisk:v12 withCallbackBlock:v14];
}

- (void)isBusyWithCompletionUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000E2BC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v12 = "-[SKDaemonConnection isBusyWithCompletionUUID:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Preflight at %s with UUID: %{public}@",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000109A4;
  v9[3] = &unk_100044F50;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 isBusy:v9];
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 withCompletionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10000E2BC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v8;
    __int16 v20 = 2080;
    id v21 = "-[SKDaemonConnection recacheDisk:options:withCompletionUUID:]";
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  buf,  0x20u);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 knownDiskForDictionary:v8]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100010BD8;
  v16[3] = &unk_100044EB0;
  v16[4] = self;
  id v17 = v9;
  id v15 = v9;
  [v12 recacheDisk:v14 options:a4 callbackBlock:v16];
}

- (void)filesystemsWithCompletionUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000E2BC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v12 = "-[SKDaemonConnection filesystemsWithCompletionUUID:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Preflight at %s with UUID: %{public}@",  buf,  0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100010D18;
  v9[3] = &unk_100044F28;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 filesystemsWithCallbackBlock:v9];
}

- (void)physicalStoresForAPFSVolume:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000E2BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2080;
    id v19 = "-[SKDaemonConnection physicalStoresForAPFSVolume:withCompletionUUID:]";
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  buf,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 knownDiskForDictionary:v6]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100010F3C;
  v14[3] = &unk_100044F28;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v10 physicalStoresForAPFSVolume:v12 completionBlock:v14];
}

- (void)volumesForAPFSPS:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000E2BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v6;
    __int16 v18 = 2080;
    id v19 = "-[SKDaemonConnection volumesForAPFSPS:withCompletionUUID:]";
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight for %@ at %s with UUID: %{public}@",  buf,  0x20u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 knownDiskForDictionary:v6]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100011240;
  v14[3] = &unk_100044F28;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v10 volumesForAPFSPS:v12 completionBlock:v14];
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:]( self,  "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:",  a3,  1LL,  v9,  "-[SKDaemonConnection renameDisk:to:withCompletionUUID:]",  &stru_100044F90));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10001154C;
    v12[3] = &unk_100044FB8;
    v12[4] = self;
    id v13 = v9;
    [v11 renameDisk:v10 to:v8 withCompletionBlock:v12];
  }
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:]( self,  "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:",  a3,  1LL,  v9,  "-[SKDaemonConnection unmountDisk:options:withCompletionUUID:]",  &stru_100044FD8));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100011778;
    v12[3] = &unk_100044FB8;
    v12[4] = self;
    id v13 = v9;
    [v11 unmountDisk:v10 options:v8 withCompletionBlock:v12];
  }
}

- (void)mountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 knownDiskForDictionary:v10]);

  id v13 = objc_alloc(&OBJC_CLASS___SKMountOperation);
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_1000119FC;
  __int16 v22 = &unk_100044FB8;
  id v23 = self;
  id v14 = v8;
  id v24 = v14;
  id v15 = -[SKMountOperation initWithDisk:options:connection:completionBlock:]( v13,  "initWithDisk:options:connection:completionBlock:",  v12,  v9,  self,  &v19);

  if (v15)
  {
    if (-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:]( self,  "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:",  v12,  1LL,  v14,  "-[SKDaemonConnection mountDisk:options:withCompletionUUID:]",  -[SKMountOperation authenticateOnInit](v15, "authenticateOnInit", v19, v20, v21, v22, v23) ^ 1))
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
      [v16 _scheduleOperation:v15];
    }

    else
    {
      progressHandler = self->_progressHandler;
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 112LL, 0LL));
      unsigned int v25 = v16;
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      -[SKHelperClientProtocol requestWithUUID:didCompleteWithResult:]( progressHandler,  "requestWithUUID:didCompleteWithResult:",  v14,  v18);
    }
  }
}

- (void)ejectDisk:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:]( self,  "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:",  a3,  1LL,  v6,  "-[SKDaemonConnection ejectDisk:withCompletionUUID:]",  &stru_100044FF8));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100011C0C;
    v9[3] = &unk_100044FB8;
    v9[4] = self;
    id v10 = v6;
    [v8 ejectDisk:v7 withCompletionBlock:v9];
  }
}

- (id)_safe_object:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v6 = v5;

  return v6;
}

- (id)eraseWithEraser:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000E2BC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 2082;
    __int16 v22 = "-[SKDaemonConnection eraseWithEraser:reply:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Preflight check for %@ at %{public}s",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 disk]);
  unsigned __int8 v11 = -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:prettyFunc:]( self,  "preflightRequestWithSKDisk:entitlementLevel:prettyFunc:",  v10,  3LL,  "-[SKDaemonConnection eraseWithEraser:reply:]");

  if ((v11 & 1) != 0)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100011ED4;
    v16[3] = &unk_100045020;
    v16[4] = self;
    id v17 = v7;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 eraseWithEraser:v6 completionBlock:v16]);
    id v14 = v17;
  }

  else
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 112LL, 0LL));
    __int16 v18 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
    id v13 = 0LL;
  }

  return v13;
}

- (id)resizeDisk:(id)a3 size:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:prettyFunc:]( self,  "preflightRequestWithDiskDict:entitlementLevel:prettyFunc:",  a3,  3LL,  "-[SKDaemonConnection resizeDisk:size:reply:]"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100012144;
    v14[3] = &unk_100045048;
    id v15 = v8;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 resize:v9 toSize:a4 completionBlock:v14]);
  }

  else
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 112LL, 0LL));
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    unsigned __int8 v11 = 0LL;
  }

  return v11;
}

- (int64_t)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(int64_t)a3
{
  self->_privilege = a3;
}

- (BOOL)requiresMountAudit
{
  return self->_requiresMountAudit;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unsigned)authRef
{
  return self->_authRef;
}

- (void)setAuthRef:(unsigned __int8)a3
{
  self->_authRef = a3;
}

- (void).cxx_destruct
{
}

@end