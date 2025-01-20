@interface BKTouchEventServer
- (BKTouchEventServer)init;
- (id)transform3DForDisplayUUID:(id)a3 layerID:(id)a4 contextID:(id)a5;
- (void)_lock_updateContextIDMap;
- (void)_lock_updateSceneHostSettings;
- (void)connectionDidBegin:(id)a3 process:(id)a4;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)setContextIDs:(id)a3 forHitTestContextCategory:(id)a4;
- (void)setSceneHostSettings:(id)a3 forContextID:(id)a4;
@end

@implementation BKTouchEventServer

- (BKTouchEventServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___BKTouchEventServer;
  v2 = -[BKTouchEventServer init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___BKHIDDomainServiceServer);
    uint64_t v4 = BKSTouchEventBSServiceName;
    uint64_t v6 = BKLogTouchEvents(v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = -[BKHIDDomainServiceServer initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:]( v3,  "initWithDelegate:serverTarget:serverProtocol:clientProtocol:serviceName:queue:log:entitlement:",  v2,  v2,  &OBJC_PROTOCOL___BKSTouchEventServer_IPC,  &OBJC_PROTOCOL___BKSTouchEventClient_IPC,  v4,  0LL,  v7,  0LL);
    server = v2->_server;
    v2->_server = v8;

    -[BKHIDDomainServiceServer activate](v2->_server, "activate");
  }

  return v2;
}

- (void)setSceneHostSettings:(id)a3 forContextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteProcess]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 auditToken]);
  objc_super v11 = v10;
  if (v10) {
    [v10 realToken];
  }
  else {
    memset(v32, 0, sizeof(v32));
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
  unsigned __int8 v13 = [v12 auditTokenRepresentsSystemApp:v32];

  if ((v13 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v8));
    v17 = (os_log_s *)v16;
    if (v16) {
      v18 = *(void **)(v16 + 8);
    }
    else {
      v18 = 0LL;
    }
    id v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v7]);
    uint64_t v21 = BSEqualObjects(v20, v6);
    if ((v21 & 1) == 0)
    {
      uint64_t v23 = BKLogTouchEvents(v21, v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = [v7 unsignedIntValue];
        v31 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        uint64_t v25 = NSStringFromBKSSceneHostTouchBehavior([v20 touchBehavior]);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v25);
        uint64_t v26 = NSStringFromBKSSceneHostTouchBehavior([v6 touchBehavior]);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v34 = v29;
        *(_WORD *)&v34[4] = 2114;
        *(void *)&v34[6] = v31;
        __int16 v35 = 2114;
        v36 = v30;
        __int16 v37 = 2114;
        v38 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "new scene host settings: contextID:%X <%{public}@> %{public}@ -> %{public}@",  buf,  0x26u);
      }

      if (v6) {
        [v19 setObject:v6 forKey:v7];
      }
      else {
        [v19 removeObjectForKey:v7];
      }
      -[BKTouchEventServer _lock_updateSceneHostSettings](self, "_lock_updateSceneHostSettings", v28);
    }

    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    uint64_t v27 = BKLogTouchEvents(v14, v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v34 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "non-shell process cannot modify scene host settings: %{public}@",  buf,  0xCu);
    }
  }
}

- (id)transform3DForDisplayUUID:(id)a3 layerID:(id)a4 contextID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteProcess]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 auditToken]);
  uint64_t v13 = BKLayerTransformLookupEntitlement;
  unsigned __int8 v14 = [v12 hasEntitlement:BKLayerTransformLookupEntitlement];

  if ((v14 & 1) != 0)
  {
    if (v7)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](&OBJC_CLASS___CAWindowServer, "serverIfRunning"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 displayWithUniqueId:v7]);
    }

    else
    {
      id v21 = sub_1000195F8();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
    }

    id v22 = [v8 unsignedLongLongValue];
    id v23 = [v9 unsignedIntValue];
    if (v18)
    {
      [v18 transformFromLayerId:v22 inContextId:v23];
    }

    else
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      memset(buf, 0, sizeof(buf));
    }

    id v20 = objc_alloc_init(&OBJC_CLASS____BKSCATransform3DContainer);
    v27[4] = v31;
    v27[5] = v32;
    v27[6] = v33;
    v27[7] = v34;
    v27[0] = *(_OWORD *)buf;
    v27[1] = *(_OWORD *)&buf[16];
    v27[2] = v29;
    v27[3] = v30;
    [v20 setTransform:v27];
  }

  else
  {
    uint64_t v19 = BKLogTouchEvents(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = BSProcessDescriptionForPID([v11 pid]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "process '%{public}@' must have entitlement %{public}@ to look up CA transforms",  buf,  0x16u);
    }

    id v20 = 0LL;
  }

  return v20;
}

- (void)setContextIDs:(id)a3 forHitTestContextCategory:(id)a4
{
  id v6 = a3;
  id v7 = [a4 integerValue];
  if (a4)
  {
    id v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](&OBJC_CLASS___BSServiceConnection, "currentContext"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteProcess]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 auditToken]);
    uint64_t v13 = BKHitTestContextCategoryEntitlement;
    unsigned int v14 = [v12 hasEntitlement:BKHitTestContextCategoryEntitlement];

    if (v14)
    {
      os_unfair_lock_lock(&self->_lock);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKHIDDomainServiceServer userInfoForConnection:](self->_server, "userInfoForConnection:", v10));
      id v18 = v6;
      uint64_t v19 = v18;
      if (v17)
      {
        if (![v18 count])
        {

          uint64_t v19 = 0LL;
        }

        id v20 = [v19 copy];
        id v21 = (void *)v17[2];
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
        [v21 setObject:v20 forKeyedSubscript:v22];
      }

      -[BKTouchEventServer _lock_updateContextIDMap](self, "_lock_updateContextIDMap");
      os_unfair_lock_unlock(&self->_lock);
    }

    else
    {
      uint64_t v24 = BKLogTouchEvents(v15, v16);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138543618;
        uint64_t v27 = v11;
        __int16 v28 = 2114;
        uint64_t v29 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "setContextIDs:forHitTestContextCategory: %{public}@ doesn't have entitlement %{public}@",  (uint8_t *)&v26,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v23 = BKLogTouchEvents(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "gotta specify a category, bucko",  (uint8_t *)&v26,  2u);
    }
  }
}

- (void)connectionDidBegin:(id)a3 process:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS____BKTouchServerClientRecord);
  -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:", v6, v5);
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BKTouchEventServer _lock_updateSceneHostSettings](self, "_lock_updateSceneHostSettings");
  -[BKTouchEventServer _lock_updateContextIDMap](self, "_lock_updateContextIDMap");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateSceneHostSettings
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  server = self->_server;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D40C;
  v7[3] = &unk_1000B6458;
  uint64_t v8 = v3;
  id v5 = v3;
  -[BKHIDDomainServiceServer enumerateUserInfoWithBlock:](server, "enumerateUserInfoWithBlock:", v7);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayController sharedInstance](&OBJC_CLASS___BKDisplayController, "sharedInstance"));
  [v6 setSceneHostSettings:v5];
}

- (void)_lock_updateContextIDMap
{
  uint64_t v10 = 0LL;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = sub_10002D23C;
  unsigned int v14 = sub_10002D24C;
  id v15 = 0LL;
  server = self->_server;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002D254;
  v9[3] = &unk_1000B64A8;
  v9[4] = &v10;
  id v4 = -[BKHIDDomainServiceServer enumerateUserInfoWithBlock:](server, "enumerateUserInfoWithBlock:", v9);
  uint64_t v6 = BKLogTouchEvents(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v11[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "contextID category map is now %{public}@",  buf,  0xCu);
  }

  objc_storeStrong((id *)&self->_lock_contextIDToCategory, (id)v11[5]);
  _Block_object_dispose(&v10, 8);
}

- (void).cxx_destruct
{
}

@end