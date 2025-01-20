@interface AKAuthorizationIconManager
+ (id)sharedManager;
- (AKAuthorizationIconManager)init;
- (BOOL)_isFetchingIconWithRequestContext:(id)a3;
- (id)_dataBlockForKey:(id)a3;
- (id)_serviceIDForRequestContext:(id)a3;
- (id)_startFetchingIconForBundleID:(id)a3 size:(id)a4 scale:(id)a5;
- (void)_removeDataBlockForKey:(id)a3;
- (void)_setDataBlock:(id)a3 forKey:(id)a4;
- (void)continueFetchingIconWithRequestContext:(id)a3 completion:(id)a4;
- (void)setFetchIconBlockForPresenter:(id)a3 withContext:(id)a4;
- (void)startFetchingIconWithRequestContext:(id)a3;
@end

@implementation AKAuthorizationIconManager

- (AKAuthorizationIconManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AKAuthorizationIconManager;
  result = -[AKAuthorizationIconManager init](&v3, "init");
  if (result) {
    result->_dataBlocksLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)sharedManager
{
  if (qword_10020F1D8 != -1) {
    dispatch_once(&qword_10020F1D8, &stru_1001C6420);
  }
  return (id)qword_10020F1D0;
}

- (void)startFetchingIconWithRequestContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationIconManager _serviceIDForRequestContext:](self, "_serviceIDForRequestContext:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 _proxiedClientBundleID]);
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 _iconScale]);
  v8 = (void *)v7;
  v9 = &off_1001D8C88;
  if (v7) {
    v9 = (_UNKNOWN **)v7;
  }
  v25 = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 _iconSize]);
  if (v5) {
    BOOL v11 = v6 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 _iconData]);

  id v14 = [v4 _isWebLogin];
  if ((v14 & 1) != 0)
  {
    int v15 = 1;
  }

  else
  {
    id v14 = [v4 _isSubscriptionLogin];
    int v15 = (int)v14;
  }

  if (v13) {
    int v16 = 0;
  }
  else {
    int v16 = v15;
  }
  int v17 = v16 & v12;
  uint64_t v18 = _AKLogSystem(v14);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (v17 == 1)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = self;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@: Starting to fetch icon for request context (%@)",  buf,  0x16u);
    }

    v21 = v25;
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationIconManager _startFetchingIconForBundleID:size:scale:]( self,  "_startFetchingIconForBundleID:size:scale:",  v6,  v10,  v25));
    -[AKAuthorizationIconManager _setDataBlock:forKey:](self, "_setDataBlock:forKey:", v20, v5);
  }

  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22 = @"NO";
      *(_DWORD *)buf = 138413314;
      v27 = self;
      if (v12) {
        v23 = @"YES";
      }
      else {
        v23 = @"NO";
      }
      __int16 v28 = 2112;
      id v29 = v4;
      if (v13) {
        v24 = @"YES";
      }
      else {
        v24 = @"NO";
      }
      __int16 v30 = 2112;
      if (v15) {
        v22 = @"YES";
      }
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v22;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%@: Determined request context (%@) is not eligible for remotely fetching icon (hasParameters: %@, hasData: %@, hasFetchContext: %@)",  buf,  0x34u);
    }

    v21 = v25;
  }
}

- (void)setFetchIconBlockForPresenter:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 credentialRequestContext]);
  unsigned int v9 = -[AKAuthorizationIconManager _isFetchingIconWithRequestContext:](self, "_isFetchingIconWithRequestContext:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 credentialRequestContext]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[AKAuthorizationIconManager _serviceIDForRequestContext:]( self,  "_serviceIDForRequestContext:",  v10));

    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000056F0;
    v13[3] = &unk_1001C6470;
    objc_copyWeak(&v15, &location);
    id v12 = v11;
    id v14 = v12;
    [v6 setFetchIconBlock:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)continueFetchingIconWithRequestContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, os_activity_s *))a4;
  if (-[AKAuthorizationIconManager _isFetchingIconWithRequestContext:](self, "_isFetchingIconWithRequestContext:", v6))
  {
    v8 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/icon-fetching",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v8, &v11);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationIconManager _serviceIDForRequestContext:](self, "_serviceIDForRequestContext:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationIconManager _dataBlockForKey:](self, "_dataBlockForKey:", v9));
    [v10 setCompletion:v7];

    os_activity_scope_leave(&v11);
  }

  else
  {
    v8 = (os_activity_s *)objc_claimAutoreleasedReturnValue(+[NSError ak_errorWithCode:](&OBJC_CLASS___NSError, "ak_errorWithCode:", -7044LL));
    v7[2](v7, 0LL, v8);
  }
}

- (id)_startFetchingIconForBundleID:(id)a3 size:(id)a4 scale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = _os_activity_create( (void *)&_mh_execute_header,  "authkit/icon-fetching",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100005AB4;
  v16[3] = &unk_1001C64C0;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AKCoordinatedDataBlock startCoordinatingBlock:]( &OBJC_CLASS___AKCoordinatedDataBlock,  "startCoordinatingBlock:",  v16));

  os_activity_scope_leave(&state);
  return v14;
}

- (BOOL)_isFetchingIconWithRequestContext:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationIconManager _serviceIDForRequestContext:](self, "_serviceIDForRequestContext:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAuthorizationIconManager _dataBlockForKey:](self, "_dataBlockForKey:", v4));
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_serviceIDForRequestContext:(id)a3
{
  id v3 = a3;
  if ([v3 _isSubscriptionLogin])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _proxiedClientBundleID]);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 authorizationRequest]);

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 clientID]);
    id v3 = v5;
  }

  return v4;
}

- (id)_dataBlockForKey:(id)a3
{
  p_dataBlocksLock = &self->_dataBlocksLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100005D70;
  v8[3] = &unk_1001C64E8;
  v8[4] = self;
  id v9 = a3;
  id v4 = v9;
  os_unfair_lock_lock(p_dataBlocksLock);
  id v5 = sub_100005D70((uint64_t)v8);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_unfair_lock_unlock(p_dataBlocksLock);

  return v6;
}

- (void)_setDataBlock:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  p_dataBlocksLock = &self->_dataBlocksLock;
  v11[2] = sub_100005E34;
  v11[3] = &unk_1001C6510;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_unfair_lock_lock(p_dataBlocksLock);
  sub_100005E34(v11);
  os_unfair_lock_unlock(p_dataBlocksLock);
}

- (void)_removeDataBlockForKey:(id)a3
{
  p_dataBlocksLock = &self->_dataBlocksLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005F14;
  v5[3] = &unk_1001C6538;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_dataBlocksLock);
  sub_100005F14((uint64_t)v5);
  os_unfair_lock_unlock(p_dataBlocksLock);
}

- (void).cxx_destruct
{
}

@end