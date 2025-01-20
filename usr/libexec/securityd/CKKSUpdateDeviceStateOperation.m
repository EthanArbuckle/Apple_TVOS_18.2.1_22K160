@interface CKKSUpdateDeviceStateOperation
- (BOOL)rateLimit;
- (CKKSOperationDependencies)deps;
- (CKKSUpdateDeviceStateOperation)initWithOperationDependencies:(id)a3 rateLimit:(BOOL)a4 ckoperationGroup:(id)a5;
- (CKOperationGroup)group;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setGroup:(id)a3;
- (void)setRateLimit:(BOOL)a3;
@end

@implementation CKKSUpdateDeviceStateOperation

- (CKKSUpdateDeviceStateOperation)initWithOperationDependencies:(id)a3 rateLimit:(BOOL)a4 ckoperationGroup:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CKKSUpdateDeviceStateOperation;
  v11 = -[CKKSGroupOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 134), a3);
    objc_storeStrong((id *)(v12 + 142), a5);
    v12[128] = a4;
  }

  return (CKKSUpdateDeviceStateOperation *)v12;
}

- (void)groupStart
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 personaAdapter]);
  [v3 prepareThreadForKeychainAPIUseForPersonaIdentifier:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 accountStateTracker]);

  if (v34)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v34 ckdeviceIDInitialized]);
    id v6 = [v5 wait:200000000000];

    if (v6)
    {
      id v7 = sub_1000AA6AC(@"ckksdevice", 0LL);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "CK device ID not initialized, likely quitting",  buf,  2u);
      }
    }

    uint64_t v32 = objc_claimAutoreleasedReturnValue([v34 ckdeviceID]);
    if (v32)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cdpCapableiCloudAccountInitialized", v32));
      id v10 = [v9 wait:500000000];

      if (v10)
      {
        id v11 = sub_1000AA6AC(@"ckksdevice", 0LL);
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Not quite sure if the account is HSA2/Managed or not. Probably will quit?",  buf,  2u);
        }
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 databaseProvider]);

      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSUpdateDeviceStateOperation deps](self, "deps"));
      id obj = (id)objc_claimAutoreleasedReturnValue([v16 activeManagedViews]);

      id v17 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v41;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v41 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)i);
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472LL;
            v37[2] = sub_10008D8F0;
            v37[3] = &unk_100284860;
            v37[4] = v20;
            v37[5] = self;
            objc_copyWeak(&v39, location);
            id v21 = v13;
            id v38 = v21;
            [v15 dispatchSyncWithSQLTransaction:v37];

            objc_destroyWeak(&v39);
          }

          id v17 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
        }

        while (v17);
        v13 = v21;
      }

      v22 = obj;
    }

    else
    {
      id v27 = sub_1000AA6AC(@"ckksdevice", 0LL);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "CK device ID not initialized, quitting",  buf,  2u);
      }

      v48[0] = @"CK device ID missing";
      v47[0] = NSLocalizedDescriptionKey;
      v47[1] = NSUnderlyingErrorKey;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "ckdeviceIDError", 0));
      v30 = v29;
      if (v29) {
        id v31 = v29;
      }
      else {
        id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      }
      v13 = v31;

      v48[1] = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  2LL));
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  59LL,  v15));
      -[CKKSResultOperation setError:](self, "setError:", v22);
    }

    objc_destroyWeak(location);
  }

  else
  {
    id v23 = sub_1000AA6AC(@"ckksdevice", 0LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "no AccountTracker object",  (uint8_t *)location,  2u);
    }

    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    v50 = @"no AccountTracker object";
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  57LL,  v25));
    -[CKKSResultOperation setError:](self, "setError:", v26);
  }
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 134LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 142LL, 1);
}

- (void)setGroup:(id)a3
{
}

- (BOOL)rateLimit
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setRateLimit:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (void).cxx_destruct
{
}

@end