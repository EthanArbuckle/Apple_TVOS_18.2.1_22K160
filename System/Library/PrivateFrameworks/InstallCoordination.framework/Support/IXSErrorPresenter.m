@interface IXSErrorPresenter
+ (id)sharedPresenter;
- (BOOL)localizedErrorForAppName:(id)a3 unlocalizedError:(id)a4 localizedError:(id *)a5 withError:(id *)a6;
- (IXSErrorPresenter)init;
- (void)_presentErrorHighlightingLocalizedAppName:(id)a3 withHighlightedAppRecord:(id)a4 bundleIDs:(id)a5 code:(int64_t)a6 errorSource:(unint64_t)a7 underlyingError:(id)a8;
- (void)presentErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6;
- (void)presentErrorForIdentities:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6;
- (void)presentErrorForIdentity:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6;
@end

@implementation IXSErrorPresenter

+ (id)sharedPresenter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003690;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8E10 != -1) {
    dispatch_once(&qword_1000E8E10, block);
  }
  return (id)qword_1000E8E08;
}

- (IXSErrorPresenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IXSErrorPresenter;
  return -[IXSErrorPresenter init](&v3, "init");
}

- (void)presentErrorForIdentity:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));

  -[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]( self,  "presentErrorForIdentities:code:underlyingError:errorSource:",  v12,  a4,  v10,  a6,  v13);
}

- (void)presentErrorForIdentities:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = IXStringForClientID(a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 136316162;
    v80 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
    __int16 v81 = 2048;
    int64_t v82 = a4;
    __int16 v83 = 2112;
    id v84 = v15;
    __int16 v85 = 2112;
    id v86 = v11;
    __int16 v87 = 2112;
    id v88 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Asked to present alert for error %ld source %@ underlying error %@ for identities %@",  buf,  0x34u);
  }

  if ([v10 count])
  {
    v55 = self;
    unint64_t v56 = a6;
    int64_t v57 = a4;
    id v58 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    id v59 = v10;
    id v17 = v10;
    id v65 = [v17 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (!v65)
    {
      v61 = 0LL;
      v18 = 0LL;
      goto LABEL_41;
    }

    v61 = 0LL;
    v18 = 0LL;
    uint64_t v64 = *(void *)v74;
    id v62 = v17;
    v60 = v16;
    while (1)
    {
      for (i = 0LL; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v74 != v64) {
          objc_enumerationMutation(v17);
        }
        v20 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
        v21 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]);
        id v72 = 0LL;
        v23 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v21,  "initWithBundleIdentifier:allowPlaceholder:error:",  v22,  1LL,  &v72);
        id v24 = v72;

        if (!v23)
        {
          v38 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          v26 = (Block_layout *)objc_claimAutoreleasedReturnValue([v20 bundleID]);
          *(_DWORD *)buf = 136315650;
          v80 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
          __int16 v81 = 2112;
          int64_t v82 = (int64_t)v26;
          __int16 v83 = 2112;
          id v84 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get LSApplicationRecord for identifier %@: %@",  buf,  0x20u);
          goto LABEL_34;
        }

        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 personaUniqueString]);
        v26 = &stru_1000CCB60;
        if (v25)
        {
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472LL;
          v70[2] = sub_100003E40;
          v70[3] = &unk_1000CCB88;
          v71 = v25;
          v26 = objc_retainBlock(v70);

LABEL_13:
          if (v26)
          {
            v63 = v18;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
            unsigned __int8 v28 = [v27 isSharedIPad];

            if ((v28 & 1) == 0)
            {
              __int128 v68 = 0u;
              __int128 v69 = 0u;
              __int128 v66 = 0u;
              __int128 v67 = 0u;
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord identities](v23, "identities"));
              id v30 = [v29 countByEnumeratingWithState:&v66 objects:v77 count:16];
              if (v30)
              {
                id v31 = v30;
                uint64_t v32 = *(void *)v67;
                while (2)
                {
                  for (j = 0LL; j != v31; j = (char *)j + 1)
                  {
                    if (*(void *)v67 != v32) {
                      objc_enumerationMutation(v29);
                    }
                    if ((((uint64_t (*)(Block_layout *, void))v26->invoke)( v26,  *(void *)(*((void *)&v66 + 1) + 8LL * (void)j)) & 1) != 0)
                    {

                      v16 = v60;
                      goto LABEL_30;
                    }
                  }

                  id v31 = [v29 countByEnumeratingWithState:&v66 objects:v77 count:16];
                  if (v31) {
                    continue;
                  }
                  break;
                }
              }

              v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]);
                v37 = (void *)objc_claimAutoreleasedReturnValue([v20 personaUniqueString]);
                *(_DWORD *)buf = 136315650;
                v80 = "-[IXSErrorPresenter presentErrorForIdentities:code:underlyingError:errorSource:]";
                __int16 v81 = 2112;
                int64_t v82 = (int64_t)v36;
                __int16 v83 = 2112;
                id v84 = v37;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s: Managed personas for %@ do not contain %@",  buf,  0x20u);
              }

              v16 = v60;
              v18 = v63;
              goto LABEL_33;
            }

- (void)presentErrorForAppWithLocalizedName:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 errorSource:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = IXStringForClientID(a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = 136316162;
    id v17 = "-[IXSErrorPresenter presentErrorForAppWithLocalizedName:code:underlyingError:errorSource:]";
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2112;
    v21 = v15;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Asked to present alert for error %ld source %@ underlying error %@ for app named %@",  (uint8_t *)&v16,  0x34u);
  }

  -[IXSErrorPresenter _presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:errorSource:underlyingError:]( self,  "_presentErrorHighlightingLocalizedAppName:withHighlightedAppRecord:bundleIDs:code:errorSource:underlyingError:",  v10,  0LL,  0LL,  a4,  a6,  v11);
}

- (void)_presentErrorHighlightingLocalizedAppName:(id)a3 withHighlightedAppRecord:(id)a4 bundleIDs:(id)a5 code:(int64_t)a6 errorSource:(unint64_t)a7 underlyingError:(id)a8
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000040AC;
  v18[3] = &unk_1000CCBB0;
  id v19 = a5;
  int64_t v20 = a6;
  unint64_t v21 = a7;
  id v13 = v19;
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_retainBlock(v18);
  IXPresentErrorHighlightingLocalizedAppName(v16, v15, v13, a6, v17, v14);
}

- (BOOL)localizedErrorForAppName:(id)a3 unlocalizedError:(id)a4 localizedError:(id *)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 code];
  if (v10
    && a5
    && (uint64_t v12 = (uint64_t)v11,
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]),
        unsigned __int8 v14 = [v13 isEqualToString:@"IXUserPresentableErrorDomain"],
        v13,
        (v14 & 1) != 0))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v15));

    id v17 = sub_10002B478(v9, 1uLL, v12);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 setObject:v18 forKeyedSubscript:NSLocalizedDescriptionKey];

    if (v12 == 16)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
      int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      id v21 = sub_10002B550(v20, v9, 1uLL);
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      [v16 setObject:v22 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    }

    else
    {
      id v35 = sub_10002B690(v9, 1uLL, v12);
      int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v35);
      [v16 setObject:v20 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
    }

    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IXUserPresentableErrorDomain",  v12,  v16));
    id v34 = 0LL;
  }

  else
  {
    id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100079074(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    id v33 = sub_10003556C( (uint64_t)"-[IXSErrorPresenter localizedErrorForAppName:unlocalizedError:localizedError:withError:]",  153LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Invalid parameter(s)",  v32,  v38);
    id v34 = (id)objc_claimAutoreleasedReturnValue(v33);
    if (a6 && v34)
    {
      id v34 = v34;
      *a6 = v34;
    }
  }

  BOOL v36 = v34 == 0LL;

  return v36;
}

@end