@interface PBAuxiliarySceneManager
+ (BOOL)canProcessSceneRequestWithOptions:(id)a3 forWorkspace:(id)a4;
- (BOOL)createdSceneForProcess:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (NSMutableDictionary)presenters;
- (NSMutableDictionary)trackedSceneIdentifiers;
- (PBAuxiliarySceneManager)init;
- (void)dealloc;
- (void)destroyScenesWithPersistentIdentifiers:(id)a3 forProcess:(id)a4 completion:(id)a5;
- (void)registerPresenter:(id)a3 forActivityType:(id)a4;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)sceneManager:(id)a3 didDestroyScene:(id)a4;
- (void)sceneManager:(id)a3 willDestroyScene:(id)a4;
- (void)setPresenters:(id)a3;
- (void)setTrackedSceneIdentifiers:(id)a3;
@end

@implementation PBAuxiliarySceneManager

- (PBAuxiliarySceneManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBAuxiliarySceneManager;
  v2 = -[PBAuxiliarySceneManager init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    presenters = v2->_presenters;
    v2->_presenters = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    trackedSceneIdentifiers = v2->_trackedSceneIdentifiers;
    v2->_trackedSceneIdentifiers = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    [v7 addObserver:v2];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBAuxiliarySceneManager;
  -[PBAuxiliarySceneManager dealloc](&v4, "dealloc");
}

+ (BOOL)canProcessSceneRequestWithOptions:(id)a3 forWorkspace:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([a4 process]);
  else {
    LOBYTE(v7) = 0;
  }
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UISceneRequestOptions);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v8);

  return v7 & isKindOfClass;
}

- (void)registerPresenter:(id)a3 forActivityType:(id)a4
{
}

- (BOOL)createdSceneForProcess:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UISceneRequestOptions);
  id v12 = v9;
  v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      v14 = v13;
    }
    else {
      v14 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  id v15 = v14;

  if (!v15)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid scene request options class"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002806FC(a2, (uint64_t)self, (uint64_t)v45);
    }
    _bs_set_crash_log_message([v45 UTF8String]);
    __break(0);
    JUMPOUT(0x1000FC56CLL);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  v48 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 actions]);
  id v17 = [v16 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v17)
  {
    id v18 = v17;
    v46 = v13;
    v47 = (void (**)(void, void, void))v10;
    v19 = 0LL;
    uint64_t v20 = *(void *)v60;
    while (2)
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v60 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___UIActivityContinuationAction);
        id v24 = v22;
        v25 = v24;
        if (v23)
        {
          if ((objc_opt_isKindOfClass(v24, v23) & 1) != 0) {
            v26 = v25;
          }
          else {
            v26 = 0LL;
          }
        }

        else
        {
          v26 = 0LL;
        }

        id v27 = v26;

        if (v27)
        {
          presenters = self->_presenters;
          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 activityType]);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](presenters, "objectForKey:", v29));

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v30 sceneIdentifierForActivity:v27 withProcess:v8]);
            id v32 = [v30 presentingLayoutLevel];
            if (v31)
            {
              id v39 = v32;

              v40 = (void *)objc_claimAutoreleasedReturnValue([v31 identifier]);
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_1000FC574;
              block[3] = &unk_1003D7470;
              v13 = v46;
              id v51 = v46;
              id v52 = v40;
              id v58 = v39;
              id v53 = v8;
              v36 = v48;
              id v54 = v48;
              v55 = self;
              id v38 = v30;
              id v56 = v38;
              id v10 = v47;
              v57 = v47;
              id v41 = v40;
              dispatch_async(&_dispatch_main_q, block);

              BOOL v37 = 1;
              goto LABEL_33;
            }

            NSErrorUserInfoKey v65 = NSDebugDescriptionErrorKey;
            v66 = @"Scene creation failed, application lacks entitlement";
            v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
            uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.PineBoard.PBSceneManager",  1LL,  v33));

            v19 = (void *)v34;
          }
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v18) {
        continue;
      }
      break;
    }

    v13 = v46;
    id v10 = v47;
    if (v47)
    {
      v36 = v48;
      NSErrorUserInfoKey v35 = NSDebugDescriptionErrorKey;
      if (!v19) {
        goto LABEL_30;
      }
      ((void (**)(void, void, void *))v47)[2](v47, 0LL, v19);
      BOOL v37 = 0;
      v31 = 0LL;
      id v38 = 0LL;
      goto LABEL_33;
    }

    BOOL v37 = 0;
    v31 = 0LL;
    id v38 = 0LL;
LABEL_32:
    v36 = v48;
    goto LABEL_33;
  }

  if (!v10)
  {
    BOOL v37 = 0;
    v31 = 0LL;
    id v38 = 0LL;
    v19 = 0LL;
    goto LABEL_32;
  }

  NSErrorUserInfoKey v35 = NSDebugDescriptionErrorKey;
  v36 = v15;
LABEL_30:
  NSErrorUserInfoKey v63 = v35;
  v64 = @"Scene creation failed, activity not supported";
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.PineBoard.PBSceneManager",  2LL,  v42));
  (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v43);

  BOOL v37 = 0;
  v31 = 0LL;
  id v38 = 0LL;
  v19 = 0LL;
LABEL_33:

  return v37;
}

- (void)destroyScenesWithPersistentIdentifiers:(id)a3 forProcess:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v33 = a4;
  v30 = (void (**)(id, void, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  id v10 = dispatch_group_create();
  v31 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v8 count]);
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  obj = (NSMutableArray *)v8;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 sceneWithIdentifier:v14]);
        v16 = v15;
        if (v15)
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue([v15 clientProcess]);
          BOOL v18 = v17 == v33;

          if (!v18)
          {
            NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
            id v58 = @"Scene does not belong to requesting client process.";
            id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
            v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBAuxiliarySceneManager",  1LL,  v27));
            v30[2](v30, 0LL, v28);

            v26 = obj;
            goto LABEL_17;
          }

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_trackedSceneIdentifiers, "objectForKey:", v14));
          if (v19)
          {
            -[NSMutableArray addObject:](v31, "addObject:", v14);
            dispatch_group_enter(v10);
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472LL;
            v49[2] = sub_1000FCFBC;
            v49[3] = &unk_1003CFF08;
            v50 = v10;
            [v19 dismissAuxiliaryScene:v16 completion:v49];
          }
        }
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (-[NSMutableArray count](v31, "count"))
  {
    v30[2](v30, 1LL, 0LL);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_1000FCFD4;
    v46[3] = &unk_1003CFEB8;
    v47 = v31;
    id v48 = v9;
    uint64_t v20 = objc_retainBlock(v46);
    uint64_t v40 = 0LL;
    id v41 = &v40;
    uint64_t v42 = 0x3032000000LL;
    v43 = sub_1000FD17C;
    v44 = sub_1000FD18C;
    id v45 = 0LL;
    v21 = objc_alloc(&OBJC_CLASS___BSWatchdog);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000FD1A4;
    v37[3] = &unk_1003D7498;
    v22 = v20;
    id v38 = v22;
    id v39 = &v40;
    uint64_t v23 = -[BSWatchdog initWithTimeout:queue:completion:]( v21,  "initWithTimeout:queue:completion:",  &_dispatch_main_q,  v37,  0.75);
    id v24 = (void *)v41[5];
    v41[5] = (uint64_t)v23;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000FD1F4;
    block[3] = &unk_1003D5710;
    v36 = &v40;
    v25 = v22;
    id v35 = v25;
    dispatch_group_notify(v10, &_dispatch_main_q, block);

    [(id)v41[5] start];
    _Block_object_dispose(&v40, 8);

    v26 = v47;
  }

  else
  {
    NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
    id v56 = @"No scene handles found for provided persistence IDs.";
    v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PBAuxiliarySceneManager",  2LL,  v26));
    v30[2](v30, 0LL, v29);
  }

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_trackedSceneIdentifiers, "objectForKey:", v6));
  if (v7)
  {
    id v8 = sub_100083C30();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[PBAuxiliarySceneManager sceneManager:didCreateScene:]";
      __int16 v15 = 2112;
      v16 = v6;
      __int16 v17 = 2048;
      id v18 = [v7 presentingLayoutLevel];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s - present auxiliary scene %@ at level %li",  buf,  0x20u);
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000FD3A4;
    v10[3] = &unk_1003CFEB8;
    id v11 = v7;
    id v12 = v5;
    dispatch_async(&_dispatch_main_q, v10);
  }
}

- (void)sceneManager:(id)a3 willDestroyScene:(id)a4
{
  id v5 = a4;
  if (([v5 isValid] & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_trackedSceneIdentifiers, "objectForKey:", v6));
    if (v7)
    {
      id v8 = sub_100083C30();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v14 = "-[PBAuxiliarySceneManager sceneManager:willDestroyScene:]";
        __int16 v15 = 2112;
        v16 = v6;
        __int16 v17 = 2048;
        id v18 = [v7 presentingLayoutLevel];
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s - dismiss auxiliary scene %@ at level %li",  buf,  0x20u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1000FD530;
      v10[3] = &unk_1003CFEB8;
      id v11 = v7;
      id v12 = v5;
      dispatch_async(&_dispatch_main_q, v10);
    }
  }
}

- (void)sceneManager:(id)a3 didDestroyScene:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_trackedSceneIdentifiers, "objectForKey:", v5));

  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_trackedSceneIdentifiers, "removeObjectForKey:", v5);
    id v7 = sub_100083C30();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[PBAuxiliarySceneManager sceneManager:didDestroyScene:]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - stop tracking auxiliary scene %@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

- (NSMutableDictionary)presenters
{
  return self->_presenters;
}

- (void)setPresenters:(id)a3
{
}

- (NSMutableDictionary)trackedSceneIdentifiers
{
  return self->_trackedSceneIdentifiers;
}

- (void)setTrackedSceneIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end