@interface CPLDirectPullChangeSession
+ (id)selfCrashResetReason;
- (id)clientWorkDescription;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
@end

@implementation CPLDirectPullChangeSession

- (id)clientWorkDescription
{
  return @"client pulling changes";
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
      id v12 = sub_10013AF3C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412290;
        v43 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  buf,  0xCu);
      }
    }

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10013AF7C;
    v40[3] = &unk_10023DBC8;
    id v41 = v11;
    id v16 = v11;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v40);
    v17 = v41;
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectPullChangeSession abstractObject](self, "abstractObject"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 libraryManager]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 platformObject]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 engineLibrary]);
    objc_storeWeak((id *)((char *)&self->_lastSeenLibraryVersion + 2), v21);

    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v23 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained store]);
    objc_storeWeak((id *)((char *)&self->_engineLibrary + 2), v23);

    id v24 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 scopes]);
    objc_storeWeak((id *)((char *)&self->_store + 2), v25);

    id v26 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 pullQueue]);
    objc_storeWeak((id *)((char *)&self->_scopes + 2), v27);

    id v28 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 idMapping]);
    objc_storeWeak((id *)((char *)&self->_pullQueue + 2), v29);

    id v30 = objc_loadWeakRetained((id *)((char *)&self->_lastSeenLibraryVersion + 2));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 scheduler]);
    objc_storeWeak((id *)((char *)&self->_idMapping + 2), v31);

    id v32 = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10013AFC8;
    v37[3] = &unk_100245870;
    v37[4] = self;
    id v38 = v9;
    id v39 = v10;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10013B1B0;
    v35[3] = &unk_100246248;
    v35[4] = self;
    id v36 = v11;
    id v33 = v11;
    id v34 = [v32 performWriteTransactionWithBlock:v37 completionHandler:v35];

    v17 = v38;
  }
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v5 = a3;
  -[CPLDirectChangeSession discardTentativeResetReason](self, "discardTentativeResetReason");
  if (-[CPLDirectChangeSession tearedDown](self, "tearedDown"))
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_10013AF3C();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = NSStringFromSelector(a2);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  (uint8_t *)&buf,  0xCu);
      }
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10013B520;
    v20[3] = &unk_10023DBC8;
    id v21 = v5;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v20);
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000LL;
    id v24 = sub_10013B570;
    v25 = sub_10013B580;
    id v26 = 0LL;
    v18[0] = 0LL;
    v18[1] = v18;
    v18[2] = 0x2020000000LL;
    char v19 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10013B588;
    v17[3] = &unk_100246DB0;
    v17[4] = self;
    v17[5] = &buf;
    v17[6] = v18;
    v17[7] = a2;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10013BE80;
    v12[3] = &unk_100246E00;
    v12[4] = self;
    id v13 = v5;
    v14 = v18;
    p___int128 buf = &buf;
    SEL v16 = a2;
    id v11 = [WeakRetained performWriteTransactionWithBlock:v17 completionHandler:v12];

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (-[CPLDirectChangeSession tearedDown](self, "tearedDown"))
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10013AF3C();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromSelector(a2);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  (uint8_t *)&buf,  0xCu);
      }
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10013C364;
    v22[3] = &unk_10023DBC8;
    id v23 = v8;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v22);
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000LL;
    id v26 = sub_10013B570;
    v27 = sub_10013B580;
    id v28 = 0LL;
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10013C3B4;
    void v18[3] = &unk_100246E98;
    v18[4] = self;
    p___int128 buf = &buf;
    SEL v21 = a2;
    id v19 = v7;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10013CCD8;
    v15[3] = &unk_100246EC0;
    v17 = &buf;
    v15[4] = self;
    id v16 = v8;
    id v14 = [WeakRetained performWriteTransactionWithBlock:v18 completionHandler:v15];

    _Block_object_dispose(&buf, 8);
  }
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  -[CPLDirectChangeSession discardTentativeResetReason](self, "discardTentativeResetReason");
  if (-[CPLDirectChangeSession tearedDown](self, "tearedDown"))
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_10013AF3C();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = NSStringFromSelector(a2);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        *(_DWORD *)__int128 buf = 138412290;
        SEL v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ was called while the session was already teared down",  buf,  0xCu);
      }
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10013D128;
    void v18[3] = &unk_10023DBC8;
    id v19 = v5;
    id v10 = v5;
    -[CPLDirectChangeSession dispatchCallback:](self, "dispatchCallback:", v18);
    id v11 = v19;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_engineLibrary + 2));
    id v16 = v5;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10013D174;
    v17[3] = &unk_10023F188;
    v17[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10013D8B8;
    v15[3] = &unk_100246248;
    v15[4] = self;
    id v13 = v5;
    id v14 = [WeakRetained performWriteTransactionWithBlock:v17 completionHandler:v15];

    id v11 = v16;
  }
}

+ (id)selfCrashResetReason
{
  if (qword_1002A37C0 != -1) {
    dispatch_once(&qword_1002A37C0, &stru_100246EE0);
  }
  return (id)qword_1002A37C8;
}

- (void).cxx_destruct
{
}

@end