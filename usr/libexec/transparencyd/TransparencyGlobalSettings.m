@interface TransparencyGlobalSettings
- (BOOL)setupCloudKit;
- (BOOL)shouldFetch:(id)a3;
- (CKContainer)container;
- (CKDatabase)publicCloudDatabase;
- (TransparencyAnalytics)logger;
- (TransparencyGlobalSettings)initWithContainer:(id)a3 dew:(id)a4 logger:(id)a5;
- (TransparencyGlobalSettingsProtocol)delegate;
- (_TtP13transparencyd34DewConfigurationObjectiveCProtocol_)dew;
- (void)fetchCloudData:(id)a3 updateField:(id)a4 complete:(id)a5;
- (void)fetchSettings:(id)a3 force:(BOOL)a4;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDew:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPublicCloudDatabase:(id)a3;
- (void)updateDewConfigurationWithData:(id)a3;
- (void)updateSFAConfigurationWithData:(id)a3;
@end

@implementation TransparencyGlobalSettings

- (TransparencyGlobalSettings)initWithContainer:(id)a3 dew:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics")
    && (v14.receiver = self,
        v14.super_class = (Class)&OBJC_CLASS___TransparencyGlobalSettings,
        v11 = -[TransparencyGlobalSettings init](&v14, "init"),
        (self = v11) != 0LL))
  {
    -[TransparencyGlobalSettings setLogger:](v11, "setLogger:", v10);
    -[TransparencyGlobalSettings setDew:](self, "setDew:", v9);
    -[TransparencyGlobalSettings setDelegate:](self, "setDelegate:", self);
    -[TransparencyGlobalSettings setContainer:](self, "setContainer:", v8);
    self = self;
    v12 = self;
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (BOOL)setupCloudKit
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings container](v2, "container"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings publicCloudDatabase](v2, "publicCloudDatabase"));

    if (v4)
    {
      LOBYTE(v3) = 0;
      LOBYTE(v5) = 1;
    }

    else
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings container](v2, "container"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue([(id)v3 publicCloudDatabase]);
      -[TransparencyGlobalSettings setPublicCloudDatabase:](v2, "setPublicCloudDatabase:", v5);

      LOBYTE(v3) = 1;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  objc_sync_exit(v2);

  return (v5 | v3) & 1;
}

- (void)fetchSettings:(id)a3 force:(BOOL)a4
{
  v6 = (_xpc_activity_s *)a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings delegate](self, "delegate"));
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x3032000000LL;
  v14[3] = sub_10004E0D0;
  v14[4] = sub_10004E0E0;
  id v15 = 0LL;
  id v15 = (id)os_transaction_create("com.apple.transparency.fetchSettings");
  if (v6 && xpc_activity_should_defer(v6))
  {
    if (qword_1002E6530 != -1) {
      dispatch_once(&qword_1002E6530, &stru_10027AE68);
    }
    id v8 = (os_log_s *)qword_1002E6538;
    if (os_log_type_enabled((os_log_t)qword_1002E6538, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deferring fetchSettings", buf, 2u);
    }

    xpc_activity_set_state(v6, 3LL);
  }

  else if (v7 && (a4 || [v7 shouldFetch:@"globalSettingsKey"]))
  {
    v17[0] = @"TransparencySFASettings";
    v17[1] = @"TransparencyDewSettings";
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004E118;
    v11[3] = &unk_10027AED0;
    objc_copyWeak(&v12, &location);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004E348;
    v10[3] = &unk_10027AF18;
    v10[4] = v14;
    [v7 fetchCloudData:v9 updateField:v11 complete:v10];
    objc_destroyWeak(&v12);
  }

  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

- (BOOL)shouldFetch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings logger](self, "logger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 datePropertyForKey:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:86400.0]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v7 && (uint64_t)[v7 compare:v8] >= 1)
  {
    if (qword_1002E6530 != -1) {
      dispatch_once(&qword_1002E6530, &stru_10027AF38);
    }
    id v9 = (os_log_s *)qword_1002E6538;
    if (os_log_type_enabled((os_log_t)qword_1002E6538, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "No enough time passed to run the CKFetch for new configuration",  v13,  2u);
    }

    BOOL v10 = 0;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings logger](self, "logger"));
    [v11 setDateProperty:v8 forKey:@"globalSettingsKey"];

    BOOL v10 = 1;
  }

  return v10;
}

- (void)fetchCloudData:(id)a3 updateField:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  if (-[TransparencyGlobalSettings setupCloudKit](self, "setupCloudKit"))
  {
    v23 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v12 = (CKFetchRecordsOperation *)v8;
    id v13 = -[CKFetchRecordsOperation countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      while (2)
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = -[CKRecordID initWithRecordName:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)i));
          if (!v17)
          {
            if (qword_1002E6530 != -1) {
              dispatch_once(&qword_1002E6530, &stru_10027AF58);
            }
            id v9 = v23;
            v22 = (os_log_s *)qword_1002E6538;
            if (os_log_type_enabled((os_log_t)qword_1002E6538, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to create CKRecord", buf, 2u);
            }

            v10[2](v10, 0LL);
            goto LABEL_17;
          }

          v18 = v17;
          [v11 addObject:v17];
        }

        id v14 = -[CKFetchRecordsOperation countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v29,  v33,  16LL);
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v12 = -[CKFetchRecordsOperation initWithRecordIDs:]( objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation),  "initWithRecordIDs:",  v11);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10004E920;
    v26[3] = &unk_10027AFC0;
    id v9 = v23;
    id v27 = v23;
    -[CKFetchRecordsOperation setPerRecordCompletionBlock:](v12, "setPerRecordCompletionBlock:", v26);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004EB68;
    v24[3] = &unk_10027A7D0;
    v25 = v10;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v24));
    [v19 addDependency:v12];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    [v20 addOperation:v19];

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings publicCloudDatabase](self, "publicCloudDatabase"));
    [v21 addOperation:v12];

LABEL_17:
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorNetwork,  -1001LL,  @"time out"));
    ((void (**)(id, void *))v10)[2](v10, v11);
  }
}

- (void)updateSFAConfigurationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings logger](self, "logger"));
  [v5 updateCollectionConfigurationWithData:v4];
}

- (void)updateDewConfigurationWithData:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyGlobalSettings dew](self, "dew"));
  [v5 updateDewConfigurationWithData:v4];
}

- (TransparencyGlobalSettingsProtocol)delegate
{
  return (TransparencyGlobalSettingsProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContainer:(id)a3
{
}

- (CKDatabase)publicCloudDatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPublicCloudDatabase:(id)a3
{
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLogger:(id)a3
{
}

- (_TtP13transparencyd34DewConfigurationObjectiveCProtocol_)dew
{
  return (_TtP13transparencyd34DewConfigurationObjectiveCProtocol_ *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDew:(id)a3
{
}

- (void).cxx_destruct
{
}

@end