@interface CPLDirectPushChangeSession
+ (id)selfCrashResetReason;
- (id)clientWorkDescription;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)finalizeWithCompletionHandler:(id)a3;
@end

@implementation CPLDirectPushChangeSession

- (id)clientWorkDescription
{
  return @"client pushing changes";
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (-[CPLDirectChangeSession tearedDown](self, "tearedDown"))
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_10013EB00();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412290;
        v42 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  buf,  0xCu);
      }
    }

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10013EB40;
    v39[3] = &unk_10023DBC8;
    id v40 = v11;
    id v16 = v11;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v39);
    v17 = v40;
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectPushChangeSession abstractObject](self, "abstractObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 libraryManager]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 platformObject]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 engineLibrary]);
    objc_storeWeak((id *)((char *)&self->_lastSeenLibraryVersion + 2), v21);

    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    [WeakRetained clientIsPushingChanges];

    id v23 = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 store]);
    objc_storeWeak((id *)((char *)&self->_engineLibrary + 2), v24);

    id v25 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 pushRepository]);
    objc_storeWeak((id *)((char *)&self->_store + 2), v26);

    id v27 = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 scheduler]);
    objc_storeWeak((id *)((char *)&self->_pushRepository + 2), v28);

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v30 = *(CPLEngineScheduler **)((char *)&self->_scheduler + 2);
    *(CPLEngineScheduler **)((char *)&self->_scheduler + 2) = (CPLEngineScheduler *)v29;

    id v31 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10013EB8C;
    v36[3] = &unk_100245870;
    v36[4] = self;
    id v37 = v9;
    id v38 = v10;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10013ED2C;
    v34[3] = &unk_100246248;
    v34[4] = self;
    id v35 = v11;
    id v32 = v11;
    id v33 = [v31 performWriteTransactionWithBlock:v36 completionHandler:v34];

    v17 = v37;
  }
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
  [WeakRetained clientIsPushingChanges];

  -[CPLDirectChangeSession discardTentativeResetReason](self, "discardTentativeResetReason");
  if (-[CPLDirectChangeSession tearedDown](self, "tearedDown"))
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_10013EB00();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = NSStringFromSelector(a2);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  buf,  0xCu);
      }
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10013EFC4;
    v19[3] = &unk_10023DBC8;
    id v20 = v5;
    id v11 = v5;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v19);
    id v12 = v20;
  }

  else
  {
    id v13 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    id v17 = v5;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10013F010;
    v18[3] = &unk_10023F188;
    v18[4] = self;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10013F434;
    v16[3] = &unk_100246248;
    v16[4] = self;
    id v14 = v5;
    id v15 = [v13 performWriteTransactionWithBlock:v18 completionHandler:v16];

    id v12 = v17;
  }
}

- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
  [WeakRetained clientIsPushingChanges];

  -[CPLDirectChangeSession discardTentativeResetReason](self, "discardTentativeResetReason");
  if (-[CPLDirectChangeSession tearedDown](self, "tearedDown"))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10013EB00();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  (uint8_t *)&buf,  0xCu);
      }
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10013F814;
    v30[3] = &unk_10023DBC8;
    id v31 = v8;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v30);
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000LL;
    v34 = sub_10013F86C;
    id v35 = sub_10013F87C;
    id v36 = 0LL;
    v28[0] = 0LL;
    v28[1] = v28;
    v28[2] = 0x3032000000LL;
    v28[3] = sub_10013F86C;
    v28[4] = sub_10013F87C;
    id v29 = 0LL;
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x2020000000LL;
    char v27 = 0;
    id v14 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10013F884;
    v21[3] = &unk_100246F98;
    v21[4] = self;
    id v22 = v7;
    id v23 = v28;
    p___int128 buf = &buf;
    SEL v25 = a2;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10013FF28;
    v16[3] = &unk_100247010;
    v18 = &buf;
    v19 = v26;
    v16[4] = self;
    id v17 = v8;
    id v20 = v28;
    id v15 = [v14 performWriteTransactionWithBlock:v21 completionHandler:v16];

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&buf, 8);
  }
}

+ (id)selfCrashResetReason
{
  if (qword_1002A37F0 != -1) {
    dispatch_once(&qword_1002A37F0, &stru_100247030);
  }
  return (id)qword_1002A37F8;
}

- (void).cxx_destruct
{
}

@end