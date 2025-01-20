@interface FamilyInfoLookupTask
+ (id)_cachedFamilyInfoLookupResultForAccount:(id)a3 ignoreCacheTimeout:(BOOL)a4 logKey:(id)a5;
+ (id)_currentCachedFamilyInfoWithLogKey:(id)a3;
+ (id)_pathForCachedFamilyInfoLookupResult;
+ (id)_processURLResult:(id)a3;
+ (id)cachedFamilyInfoWithLogKey:(id)a3;
- (AMSBagProtocol)bag;
- (BOOL)suppressDialogs;
- (FamilyInfoLookupTask)initWithBag:(id)a3;
- (NSString)logKey;
- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4;
- (id)performFamilyInfoLookup;
- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4;
- (void)setBag:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setSuppressDialogs:(BOOL)a3;
@end

@implementation FamilyInfoLookupTask

- (FamilyInfoLookupTask)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FamilyInfoLookupTask;
  v6 = -[FamilyInfoLookupTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

+ (id)cachedFamilyInfoWithLogKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccount"));

  if (v6) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _cachedFamilyInfoLookupResultForAccount:v6 ignoreCacheTimeout:1 logKey:v4]);
  }
  else {
    v7 = 0LL;
  }

  return v7;
}

- (id)performFamilyInfoLookup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask logKey](self, "logKey"));

  if (!v3)
  {
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    logKey = self->_logKey;
    self->_logKey = v4;
  }

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004639C;
  v8[3] = &unk_1002E8ED8;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask performTaskWithBlock:](self, "performTaskWithBlock:", v8));
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

- (id)_performFamilyInfoRequestForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask bag](self, "bag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLForKey:@"family-info"]);
  id v27 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueWithError:&v27]);
  id v10 = v27;

  if (!v9)
  {
    if (qword_10032E6E0 != -1) {
      dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_ERROR))
    {
      sub_1002602D8();
      if (a4) {
        goto LABEL_11;
      }
    }

    else if (a4)
    {
LABEL_11:
      uint64_t v18 = ASDErrorWithUnderlyingError( v10,  ASDErrorDomain,  500LL,  @"Family Info Lookup Failed",  @"We were unable to get the family cricle URL.");
      v17 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v18);
      goto LABEL_14;
    }

    v17 = 0LL;
    goto LABEL_14;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___AMSURLRequestEncoder);
  -[AMSURLRequestEncoder setAccount:](v11, "setAccount:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask bag](self, "bag"));
  -[AMSURLRequestEncoder setBag:](v11, "setBag:", v12);

  if (-[FamilyInfoLookupTask suppressDialogs](self, "suppressDialogs")) {
    -[AMSURLRequestEncoder setDialogOptions:](v11, "setDialogOptions:", 1LL);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask logKey](self, "logKey"));
  -[AMSURLRequestEncoder setLogUUID:](v11, "setLogUUID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue( -[AMSURLRequestEncoder requestWithMethod:URL:parameters:]( v11,  "requestWithMethod:URL:parameters:",  2LL,  v9,  0LL));
  id v26 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 resultWithError:&v26]);
  id v16 = v26;

  if (v16)
  {
    v17 = 0LL;
    if (a4) {
      *a4 = v16;
    }
  }

  else
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___AMSPromise);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSURLSession defaultSession](&OBJC_CLASS___AMSURLSession, "defaultSession"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 completionHandlerAdapter]);
    id v25 = v6;
    id v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 dataTaskWithRequest:v15 completionHandler:v21]);

    [v23 resume];
    v17 = (void *)objc_claimAutoreleasedReturnValue([v19 resultWithError:a4]);

    id v10 = v22;
    id v6 = v25;
  }

LABEL_14:
  return v17;
}

+ (id)_processURLResult:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
      id v5 = v3;
    }
    else {
      id v5 = 0LL;
    }

    if (v5) {
      id v6 = -[FamilyInfoLookupResult initWithDictionaryRepresentation:cached:]( objc_alloc(&OBJC_CLASS___FamilyInfoLookupResult),  "initWithDictionaryRepresentation:cached:",  v5,  0LL);
    }
    else {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_cacheFamilyInfoLookupResult:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[FamilyInfoLookupTask _pathForCachedFamilyInfoLookupResult]( &OBJC_CLASS___FamilyInfoLookupTask,  "_pathForCachedFamilyInfoLookupResult"));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));

    if (v9)
    {
      v31[0] = @"account";
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));
      v32[0] = v10;
      v31[1] = @"circle";
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryRepresentation]);
      v32[1] = v11;
      v31[2] = @"timestamp";
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v32[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  3LL));
      id v30 = 0LL;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v13,  200LL,  0LL,  &v30));
      id v15 = v30;

      if (v14)
      {
        id v29 = v15;
        unsigned __int8 v16 = [v14 writeToFile:v8 options:1 error:&v29];
        id v17 = v29;

        if ((v16 & 1) != 0)
        {
          if (qword_10032E6E0 != -1) {
            dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
          }
          uint64_t v18 = (void *)qword_10032E698;
          if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = v18;
            uint64_t v20 = objc_opt_class(self);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask logKey](self, "logKey"));
            *(_DWORD *)buf = 138543874;
            uint64_t v34 = v20;
            __int16 v35 = 2114;
            v36 = v21;
            __int16 v37 = 2114;
            v38 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Wrote the serialized family info to: %{public}@",  buf,  0x20u);
          }
        }

        else
        {
          if (qword_10032E6E0 != -1) {
            dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
          }
          if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_ERROR)) {
            sub_100260404();
          }
        }

        id v15 = v17;
      }

      else
      {
        if (qword_10032E6E0 != -1) {
          dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
        }
        if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_ERROR)) {
          sub_100260364();
        }
      }

      goto LABEL_28;
    }

    if (qword_10032E6E0 != -1) {
      dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
    }
    id v26 = (void *)qword_10032E698;
    if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v26;
      uint64_t v27 = objc_opt_class(self);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask logKey](self, "logKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v7 hashedDescription]);
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      v36 = v25;
      __int16 v37 = 2114;
      v38 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Unable to cache a family info lookup because the given account has no DSID. account = %{public}@",  buf,  0x20u);

      goto LABEL_17;
    }
  }

  else
  {
    if (qword_10032E6E0 != -1) {
      dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
    }
    id v22 = (void *)qword_10032E698;
    if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      uint64_t v24 = objc_opt_class(self);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v24;
      __int16 v35 = 2114;
      v36 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Unable to generate the path in order to cache a family info lookup.",  buf,  0x16u);
LABEL_17:
    }
  }

+ (id)_cachedFamilyInfoLookupResultForAccount:(id)a3 ignoreCacheTimeout:(BOOL)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_DSID"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _currentCachedFamilyInfoWithLogKey:v9]);
    v12 = v11;
    if (!v11)
    {
      id v19 = 0LL;
LABEL_33:

      goto LABEL_34;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"account"]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
      id v15 = v13;
    }
    else {
      id v15 = 0LL;
    }

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_DSID"));
    unsigned __int8 v21 = [v15 isEqualToNumber:v20];

    if ((v21 & 1) != 0)
    {
      if (a4)
      {
LABEL_25:
        id v30 = objc_alloc(&OBJC_CLASS___FamilyInfoLookupResult);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"circle"]);
        id v19 = -[FamilyInfoLookupResult initWithDictionaryRepresentation:cached:]( v30,  "initWithDictionaryRepresentation:cached:",  v31,  1LL);

LABEL_32:
        goto LABEL_33;
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"timestamp"]);
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDate);
      if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0) {
        id v24 = v22;
      }
      else {
        id v24 = 0LL;
      }

      if (v24)
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v27 timeIntervalSinceDate:v24];
        double v29 = v28;

        if (v29 > 2.22044605e-16 && v29 < 604800.0)
        {

          goto LABEL_25;
        }
      }

      if (qword_10032E6E0 != -1) {
        dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
      }
      v32 = (void *)qword_10032E698;
      if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        int v36 = 138543618;
        id v37 = (id)objc_opt_class(a1);
        __int16 v38 = 2114;
        id v39 = v9;
        id v34 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] We have cached family info for the account, but it's too old to return.",  (uint8_t *)&v36,  0x16u);
      }
    }

    else
    {
      if (qword_10032E6E0 != -1) {
        dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
      }
      id v25 = (void *)qword_10032E698;
      if (!os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      id v24 = v25;
      int v36 = 138543618;
      id v37 = (id)objc_opt_class(a1);
      __int16 v38 = 2114;
      id v39 = v9;
      id v26 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Our cached family info isn't for the given account.",  (uint8_t *)&v36,  0x16u);
    }

LABEL_31:
    id v19 = 0LL;
    goto LABEL_32;
  }

  if (qword_10032E6E0 != -1) {
    dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
  }
  unsigned __int8 v16 = (void *)qword_10032E698;
  if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    int v36 = 138543618;
    id v37 = (id)objc_opt_class(a1);
    __int16 v38 = 2114;
    id v39 = v9;
    id v18 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Unable to load cached family info because the account has no DSID. ",  (uint8_t *)&v36,  0x16u);
  }

  id v19 = 0LL;
LABEL_34:

  return v19;
}

+ (id)_currentCachedFamilyInfoWithLogKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _pathForCachedFamilyInfoLookupResult]);
  if (v5)
  {
    id v6 = -[NSData initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSData), "initWithContentsOfFile:", v5);
    if (v6)
    {
      if (qword_10032E6E0 != -1) {
        dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
      }
      id v7 = (void *)qword_10032E698;
      if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = objc_opt_class(a1);
        __int16 v20 = 2114;
        id v21 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Load cached FamilyInfo",  buf,  0x16u);
      }

      id v17 = 0LL;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v17));
      id v10 = v17;
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      id v12 = 0LL;
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
        id v12 = v9;
      }

      if (!v12)
      {
        if (qword_10032E6E0 != -1) {
          dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
        }
        v13 = (void *)qword_10032E698;
        if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_ERROR))
        {
          id v15 = v13;
          uint64_t v16 = objc_opt_class(a1);
          *(_DWORD *)buf = 138543874;
          uint64_t v19 = v16;
          __int16 v20 = 2114;
          id v21 = v4;
          __int16 v22 = 2114;
          id v23 = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] Failed to deserialize the cached FamilyInfo. Error: %{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    if (qword_10032E6E0 != -1) {
      dispatch_once(&qword_10032E6E0, &stru_1002E8EF8);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E698, OS_LOG_TYPE_ERROR)) {
      sub_1002604A4();
    }
    id v12 = 0LL;
  }

  return v12;
}

+ (id)_pathForCachedFamilyInfoLookupResult
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sk_persistedDataURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"JFamilyCircle.plist"]);

  return v5;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (BOOL)suppressDialogs
{
  return self->_suppressDialogs;
}

- (void)setSuppressDialogs:(BOOL)a3
{
  self->_suppressDialogs = a3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end