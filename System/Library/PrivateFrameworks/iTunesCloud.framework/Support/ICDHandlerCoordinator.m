@interface ICDHandlerCoordinator
+ (id)_managedHandlerClasses;
- (BOOL)isSetupCompleted;
- (ICDBackgroundTaskScheduling)taskScheduler;
- (ICDHandlerCoordinator)initWithLibraryManagementPolicy:(int64_t)a3 backgroundTaskScheduler:(id)a4;
- (NSString)description;
- (id)_configurationsToActivateForChange:(id)a3 initialSetup:(BOOL)a4;
- (id)_configurationsToRemoveForChange:(id)a3 initialSetup:(BOOL)a4;
- (int64_t)libraryManagementPolicy;
- (void)_deauthenticateUnsupportedConfigurationsFromChange:(id)a3 initialSetup:(BOOL)a4 completion:(id)a5;
- (void)_processActiveConfigurationChange:(id)a3 initialSetup:(BOOL)a4;
- (void)_processSupportedConfigurationsChange:(id)a3 initialSetup:(BOOL)a4;
- (void)changeLibraryManagementPolicy:(int64_t)a3 withAccountsStateChange:(id)a4;
- (void)enumerateHandlersForAccountState:(id)a3 usingBlock:(id)a4;
- (void)setLibraryManagementPolicy:(int64_t)a3;
- (void)setSetupCompleted:(BOOL)a3;
- (void)setupHandlersWithAccountStateChange:(id)a3;
- (void)updateHandlersWithAccountStateChange:(id)a3;
@end

@implementation ICDHandlerCoordinator

- (ICDHandlerCoordinator)initWithLibraryManagementPolicy:(int64_t)a3 backgroundTaskScheduler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICDHandlerCoordinator;
  v7 = -[ICDHandlerCoordinator init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_libraryManagementPolicy = a3;
    objc_storeWeak((id *)&v7->_taskScheduler, v6);
    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v9;

    -[NSOperationQueue setQualityOfService:](v8->_operationQueue, "setQualityOfService:", 25LL);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setName:]( v8->_operationQueue,  "setName:",  @"com.apple.itunescloudd.ICDHandlerCoordinator.operationQueue");
  }

  return v8;
}

- (NSString)description
{
  unint64_t libraryManagementPolicy = self->_libraryManagementPolicy;
  if (libraryManagementPolicy > 2) {
    v3 = @"Unknown";
  }
  else {
    v3 = off_1001A57A8[libraryManagementPolicy];
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<ICDHandlerCoordinator %p: [policy=%@]>",  self,  v3);
}

- (void)setupHandlersWithAccountStateChange:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D30F8;
  v9[3] = &unk_1001A5760;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  id v8 = [v6 initWithStartHandler:v9];
  [v8 setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.setupHandlersWithAccountStateChange"];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);
}

- (void)updateHandlersWithAccountStateChange:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D2ABC;
  v9[3] = &unk_1001A5760;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  id v8 = [v6 initWithStartHandler:v9];
  [v8 setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.updateHandlersWithAccountStateChange"];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v8);
}

- (void)enumerateHandlersForAccountState:(id)a3 usingBlock:(id)a4
{
  id v18 = a3;
  id v5 = (void (**)(id, void *))a4;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[ICDHandlerCoordinator _managedHandlerClasses]( &OBJC_CLASS___ICDHandlerCoordinator,  "_managedHandlerClasses"));
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v9);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        SEL v11 = (void *)objc_claimAutoreleasedReturnValue([v18 supportedConfigurations]);
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            v15 = 0LL;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = (void *)objc_claimAutoreleasedReturnValue( [v10 handlerForConfiguration:*(void *)(*((void *)&v19 + 1) + 8 * (void)v15)]);
              v5[2](v5, v16);

              v15 = (char *)v15 + 1;
            }

            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v13);
        }

        v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v7);
  }
}

- (void)changeLibraryManagementPolicy:(int64_t)a3 withAccountsStateChange:(id)a4
{
  id v7 = a4;
  if (!-[ICDHandlerCoordinator isSetupCompleted](self, "isSetupCompleted"))
  {
    SEL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  }

  id v8 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D28F4;
  v12[3] = &unk_1001A5760;
  id v13 = v7;
  int64_t v14 = a3;
  v12[4] = self;
  id v9 = v7;
  id v10 = [v8 initWithStartHandler:v12];
  [v10 setName:@"com.apple.itunescloudd.ICDHandlerCoordinator.changeLibraryManagementPolicy"];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v10);
}

- (void)setSetupCompleted:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_setupCompleted = a3;
  objc_sync_exit(obj);
}

- (BOOL)isSetupCompleted
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL setupCompleted = v2->_setupCompleted;
  objc_sync_exit(v2);

  return setupCompleted;
}

- (id)_configurationsToActivateForChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 initialState]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 supportedConfigurations]);

  if (v4 && ([v5 supportedConfigurationsChanged] & 1) == 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));

    id v7 = (void *)v8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finalState]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedConfigurations]);

  id v11 = [v10 mutableCopy];
  [v11 minusSet:v7];
  id v12 = [v11 copy];

  return v12;
}

- (id)_configurationsToRemoveForChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 initialState]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 supportedConfigurations]);

  if (v4 && ([v5 supportedConfigurationsChanged] & 1) == 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));

    id v7 = (void *)v8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finalState]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 supportedConfigurations]);

  id v11 = [v7 mutableCopy];
  [v11 minusSet:v10];
  id v12 = [v11 copy];

  return v12;
}

- (void)_deauthenticateUnsupportedConfigurationsFromChange:(id)a3 initialSetup:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v29 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 finalState]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v9 activeConfiguration]);

  v30 = v8;
  v33 = (void *)objc_claimAutoreleasedReturnValue( -[ICDHandlerCoordinator _configurationsToRemoveForChange:initialSetup:]( self,  "_configurationsToRemoveForChange:initialSetup:",  v8,  v6));
  id v10 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v55 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Deauthenticating handlers for unsupported accounts",  buf,  0xCu);
  }

  v36 = self;
  group = dispatch_group_create();
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_managedHandlerClasses");
  id obj = (id)objc_claimAutoreleasedReturnValue(v12);
  id v34 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v49;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v49 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v13;
        int64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        id v38 = v33;
        id v15 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v45;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v45 != v17) {
                objc_enumerationMutation(v38);
              }
              __int128 v19 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
              __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userIdentity]);
              id v21 = (id)objc_claimAutoreleasedReturnValue([v20 accountDSID]);
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v39 userIdentity]);
              id v23 = (id)objc_claimAutoreleasedReturnValue([v22 accountDSID]);
              if (v21 == v23)
              {
              }

              else
              {
                __int128 v24 = v23;
                unsigned __int8 v25 = [v21 isEqual:v23];

                if ((v25 & 1) != 0) {
                  continue;
                }
                dispatch_group_enter(group);
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v14 handlerForConfiguration:v19]);
                v42[0] = _NSConcreteStackBlock;
                v42[1] = 3221225472LL;
                v42[2] = sub_1000D27B4;
                v42[3] = &unk_1001A71A8;
                v42[4] = v36;
                v42[5] = v14;
                v42[6] = v19;
                v43 = group;
                [v20 becomeInactiveWithDeauthentication:1 completion:v42];
              }
            }

            id v16 = [v38 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }

          while (v16);
        }

        uint64_t v13 = v35 + 1;
      }

      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }

    while (v34);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D28E4;
  block[3] = &unk_1001A6BE0;
  id v41 = v29;
  id v28 = v29;
  dispatch_group_notify(group, v27, block);
}

- (void)_processSupportedConfigurationsChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((id)-[ICDHandlerCoordinator libraryManagementPolicy](self, "libraryManagementPolicy") != (id)2)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v28 handleFailureInMethod:a2 object:self file:@"ICDHandlerCoordinator.m" lineNumber:278 description:@"The method _processSupportedConfigurationsChange:initialSetup: is only suitable for parallel multi user setup."];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 finalState]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeConfiguration]);

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[ICDHandlerCoordinator _configurationsToActivateForChange:initialSetup:]( self,  "_configurationsToActivateForChange:initialSetup:",  v7,  v4));
  id v10 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v49 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Enabling handlers for supported accounts",  buf,  0xCu);
  }

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICDHandlerCoordinator taskScheduler](self, "taskScheduler"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_managedHandlerClasses");
  id obj = (id)objc_claimAutoreleasedReturnValue(v12);
  id v33 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v33)
  {
    uint64_t v30 = *(void *)v43;
    id v31 = v7;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v13;
        int64_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
        if (v9)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * v13) handlerForConfiguration:v9]);
          [v15 setTaskScheduler:v35];
          [v15 becomeActive];
        }

        v36 = v14;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v37 = v32;
        id v16 = [v37 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v37);
              }
              __int128 v20 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 userIdentity]);
              id v22 = (id)objc_claimAutoreleasedReturnValue([v21 accountDSID]);
              id v23 = v9;
              __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v9 userIdentity]);
              id v25 = (id)objc_claimAutoreleasedReturnValue([v24 accountDSID]);
              if (v22 == v25)
              {
              }

              else
              {
                __int128 v26 = v25;
                unsigned __int8 v27 = [v22 isEqual:v25];

                id v9 = v23;
                if ((v27 & 1) != 0) {
                  continue;
                }
                id v21 = (void *)objc_claimAutoreleasedReturnValue([v36 handlerForConfiguration:v20]);
                [v21 setTaskScheduler:v35];
                [v21 becomeActive];
              }
            }

            id v17 = [v37 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v17);
        }

        uint64_t v13 = v34 + 1;
        id v7 = v31;
      }

      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v33);
  }
}

- (void)_processActiveConfigurationChange:(id)a3 initialSetup:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (-[ICDHandlerCoordinator libraryManagementPolicy](self, "libraryManagementPolicy")
    && (id)-[ICDHandlerCoordinator libraryManagementPolicy](self, "libraryManagementPolicy") != (id)1)
  {
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v30 handleFailureInMethod:a2 object:self file:@"ICDHandlerCoordinator.m" lineNumber:305 description:@"The method _processActiveConfigurationChange:initialSetup: is only suitable for single user and serial multi user setup."];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 initialState]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 activeConfiguration]);

  if (v4 && ([v7 activeConfigurationChanged] & 1) == 0)
  {

    uint64_t v9 = 0LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 finalState]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 activeConfiguration]);

  if (v9 | v11)
  {
    id v31 = v7;
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICDHandlerCoordinator taskScheduler](self, "taskScheduler"));
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v14 = objc_msgSend((id)objc_opt_class(self, v13), "_managedHandlerClasses");
    id obj = (id)objc_claimAutoreleasedReturnValue(v14);
    id v36 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (!v36) {
      goto LABEL_35;
    }
    uint64_t v35 = *(void *)v42;
    uint64_t v33 = v11;
    uint64_t v34 = v9;
    while (1)
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerForConfiguration:v9]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerForConfiguration:v11]);
        [v17 setTaskScheduler:v12];
        [v18 setTaskScheduler:v12];
        __int128 v19 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          __int128 v46 = self;
          __int16 v47 = 2048;
          __int128 v48 = v17;
          __int16 v49 = 2048;
          __int128 v50 = v18;
          __int16 v51 = 2114;
          v52 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Handler transition: [%p] -> [%p] - class=%{public}@",  buf,  0x2Au);
        }

        if ((id)-[ICDHandlerCoordinator libraryManagementPolicy](self, "libraryManagementPolicy") == (id)1)
        {
          __int128 v20 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v9 userIdentity]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountDSID]);
            *(_DWORD *)buf = 138544130;
            __int128 v46 = self;
            __int16 v47 = 2048;
            __int128 v48 = v17;
            __int16 v49 = 2114;
            __int128 v50 = v16;
            __int16 v51 = 2114;
            v52 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Deactivating handler %p - class=%{public}@ dsid=%{public}@",  buf,  0x2Au);

            uint64_t v11 = v33;
            uint64_t v9 = v34;
          }

          [v17 becomeInactiveWithDeauthentication:0 completion:0];
          id v23 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
LABEL_31:
            id v28 = (void *)objc_claimAutoreleasedReturnValue([(id)v11 userIdentity]);
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 accountDSID]);
            *(_DWORD *)buf = 138544130;
            __int128 v46 = self;
            __int16 v47 = 2048;
            __int128 v48 = v18;
            __int16 v49 = 2114;
            __int128 v50 = v16;
            __int16 v51 = 2114;
            v52 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Activating handler %p - class=%{public}@ dsid=%{public}@",  buf,  0x2Au);

            uint64_t v11 = v33;
            uint64_t v9 = v34;
          }

- (int64_t)libraryManagementPolicy
{
  return self->_libraryManagementPolicy;
}

- (void)setLibraryManagementPolicy:(int64_t)a3
{
  self->_unint64_t libraryManagementPolicy = a3;
}

- (ICDBackgroundTaskScheduling)taskScheduler
{
  return (ICDBackgroundTaskScheduling *)objc_loadWeakRetained((id *)&self->_taskScheduler);
}

- (void).cxx_destruct
{
}

+ (id)_managedHandlerClasses
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned __int8 v4 = [v3 isMac];

  if ((v4 & 1) == 0) {
    objc_msgSend(v2, "addObject:", objc_opt_class(ICDCloudMusicLibraryRequestHandler, v5));
  }
  return v2;
}

@end