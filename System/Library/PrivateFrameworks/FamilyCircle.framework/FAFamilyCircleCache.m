@interface FAFamilyCircleCache
+ (id)cacheQueue;
- (ACAccount)account;
- (BOOL)_isCacheDate:(id)a3 withinDuration:(double)a4;
- (FAFamilyCircleCache)initWithAccount:(id)a3;
- (id)_cacheDataWithFamilyCircle:(id)a3 serverTag:(id)a4;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)_onQueue:(id)a3;
- (id)_username;
- (id)invalidate;
- (id)load;
- (id)loadWithError:(id *)a3;
- (id)updateWithFamilyCircle:(id)a3 serverTag:(id)a4;
@end

@implementation FAFamilyCircleCache

- (FAFamilyCircleCache)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAFamilyCircleCache;
  v6 = -[FAFamilyCircleCache init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)_cacheURLWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v13 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v13]);
  id v6 = v13;

  if (v6)
  {
    uint64_t v9 = _FALogSystem(v7, v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002A908();
    }

    if (a3) {
      *a3 = v6;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"FamilyCircle/CircleCache.plist"]);

  return v11;
}

+ (id)cacheQueue
{
  if (qword_100052718 != -1) {
    dispatch_once(&qword_100052718, &stru_1000419A8);
  }
  return (id)qword_100052710;
}

- (id)_fetchData:(id *)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10000D7BC;
  v14 = sub_10000D7CC;
  id v15 = 0LL;
  id v5 = [(id)objc_opt_class(self) cacheQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D7D4;
  block[3] = &unk_100041580;
  block[4] = self;
  block[5] = &v10;
  block[6] = a3;
  dispatch_sync(v6, block);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_username
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_personID"));

  return v3;
}

- (id)load
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000D934;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)loadWithError:(id *)a3
{
  uint64_t v5 = _FASignpostLogSystem(self, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = _FASignpostCreate();
  uint64_t v9 = v8;

  uint64_t v12 = _FASignpostLogSystem(v10, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  unint64_t v15 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "LoadFamilyCache",  "",  buf,  2u);
  }

  uint64_t v18 = _FASignpostLogSystem(v16, v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10002AA88();
  }

  id v98 = 0LL;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache _fetchData:](self, "_fetchData:", &v98));
  id v21 = v98;
  v23 = v21;
  if (v21)
  {
    uint64_t v24 = _FALogSystem(v21, v22);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10002AA28();
    }

    if (a3) {
      *a3 = v23;
    }
    uint64_t Nanoseconds = _FASignpostGetNanoseconds(v7, v9);
    uint64_t v28 = _FASignpostLogSystem(Nanoseconds, v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  v7,  "LoadFamilyCache",  "",  buf,  2u);
    }

    uint64_t v33 = _FASignpostLogSystem(v31, v32);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10002A968();
    }
LABEL_59:
    v49 = 0LL;
    goto LABEL_60;
  }

  if (!v20) {
    goto LABEL_54;
  }
  id v97 = 0LL;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v20,  0LL,  0LL,  &v97));
  v36 = (os_log_s *)v97;
  v34 = v36;
  if (!v36)
  {
    if (v35)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"username"]);
      v95 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"serverTag"]);
      uint64_t v51 = objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"timestamp"]);
      v93 = v35;
      v52 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:@"circle"]);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache _username](self, "_username"));
      v94 = v50;
      v49 = (FAFamilyCircleCacheResponse *)[v50 isEqualToString:v53];

      v96 = (void *)v51;
      BOOL v56 = v51 == 0;
      v57 = v52;
      if (v56) {
        int v58 = 0;
      }
      else {
        int v58 = (int)v49;
      }
      if (!v52) {
        int v58 = 0;
      }
      char v92 = v58;
      if (v58 == 1)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKeyedSubscript:@"cacheDuration"]);
        [v59 doubleValue];
        double v61 = v60;

        if (v61 == 0.0)
        {
          uint64_t v64 = _FALogSystem(v62, v63);
          v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v100 = 0x40F5180000000000LL;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Defaulting to cache age of: %f",  buf,  0xCu);
          }

          double v61 = 86400.0;
        }

        v66 = -[FAFamilyCircle initWithServerResponse:]( objc_alloc(&OBJC_CLASS___FAFamilyCircle),  "initWithServerResponse:",  v52);
        v49 = -[FAFamilyCircleCacheResponse initWithFamilyCircle:serverTag:cacheDate:maxAge:]( objc_alloc(&OBJC_CLASS___FAFamilyCircleCacheResponse),  "initWithFamilyCircle:serverTag:cacheDate:maxAge:",  v66,  v95,  v96,  v61);
        uint64_t v91 = _FASignpostGetNanoseconds(v7, v9);
        uint64_t v68 = _FASignpostLogSystem(v91, v67);
        v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
        v70 = v69;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v70,  OS_SIGNPOST_INTERVAL_END,  v7,  "LoadFamilyCache",  "",  buf,  2u);
        }

        uint64_t v73 = _FASignpostLogSystem(v71, v72);
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
          sub_10002A968();
        }

        v57 = v52;
      }

      else
      {
        uint64_t v77 = _FALogSystem(v54, v55);
        v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v49));
          v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v96 == 0LL));
          uint64_t v79 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v57 == 0LL));
          *(_DWORD *)buf = 138412802;
          uint64_t v100 = (uint64_t)v90;
          __int16 v101 = 2112;
          v102 = v89;
          __int16 v103 = 2112;
          uint64_t v104 = v79;
          v49 = (FAFamilyCircleCacheResponse *)v79;
          v66 = v78;
          _os_log_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEFAULT,  "Invalid cache detected... validUser: %@, cachedTimestamp: %@, cachedCirclePlist: %@",  buf,  0x20u);
        }

        else
        {
          v66 = v78;
        }
      }

      v35 = v93;

      if ((v92 & 1) != 0) {
        goto LABEL_28;
      }
    }

    else
    {
      uint64_t v75 = _FALogSystem(0LL, v37);
      v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleCache plist == nil", buf, 2u);
      }
    }

LABEL_54:
    uint64_t v80 = _FASignpostGetNanoseconds(v7, v9);
    uint64_t v82 = _FASignpostLogSystem(v80, v81);
    v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
    v84 = v83;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v84,  OS_SIGNPOST_INTERVAL_END,  v7,  "LoadFamilyCache",  "",  buf,  2u);
    }

    uint64_t v87 = _FASignpostLogSystem(v85, v86);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      sub_10002A968();
    }
    goto LABEL_59;
  }

  uint64_t v38 = _FALogSystem(v36, v37);
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    sub_10002A9C8();
  }

  if (a3) {
    *a3 = v34;
  }
  uint64_t v40 = _FASignpostGetNanoseconds(v7, v9);
  uint64_t v42 = _FASignpostLogSystem(v40, v41);
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  v44 = v43;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v44,  OS_SIGNPOST_INTERVAL_END,  v7,  "LoadFamilyCache",  "",  buf,  2u);
  }

  uint64_t v47 = _FASignpostLogSystem(v45, v46);
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
    sub_10002A968();
  }

  v49 = 0LL;
LABEL_28:

LABEL_60:
  return v49;
}

- (BOOL)_isCacheDate:(id)a3 withinDuration:(double)a4
{
  id v5 = a3;
  id v6 = [v5 timeIntervalSinceNow];
  double v8 = fabs(v7);
  uint64_t v10 = _FALogSystem(v6, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8 >= a4)
  {
    if (v12)
    {
      int v15 = 138412290;
      id v16 = v5;
      id v13 = "Attempting to fetch the family circle from the server as the cache is stale (%@)";
      goto LABEL_6;
    }
  }

  else if (v12)
  {
    int v15 = 138412290;
    id v16 = v5;
    id v13 = "Skipping server fetch of family circle as the cache is fresh (%@)";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
  }

  return v8 < a4;
}

- (id)_cacheDataWithFamilyCircle:(id)a3 serverTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000E2EC;
  v13[3] = &unk_100041258;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = -[AAFPromise initWithBlock:](v8, "initWithBlock:", v13);

  return v11;
}

- (id)_cacheURL
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000E478;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)_createCacheFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache _cacheURL](self, "_cacheURL"));
  v4 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v3 then]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000E584;
  v8[3] = &unk_100041558;
  v8[4] = self;
  uint64_t v5 = ((uint64_t (**)(void, void *))v4)[2](v4, v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)updateWithFamilyCircle:(id)a3 serverTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000E7A4;
  v13[3] = &unk_100041258;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = -[AAFPromise initWithBlock:](v8, "initWithBlock:", v13);

  return v11;
}

- (id)_onQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000EB2C;
  v9[3] = &unk_1000415D0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = -[AAFPromise initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (id)invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyCircleCache _cacheURL](self, "_cacheURL"));
  id v4 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v3 then]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000ECE8;
  v8[3] = &unk_100041558;
  v8[4] = self;
  uint64_t v5 = ((uint64_t (**)(void, void *))v4)[2](v4, v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

  ;
}

@end