@interface RMPersistentHistoryNotifier
+ (id)sharedQueryQueue;
- (BOOL)hasStarted;
- (BOOL)queryNeeded;
- (BOOL)shouldUsePersistentHistoryToken;
- (NSManagedObjectContext)context;
- (NSPersistentHistoryToken)persistentHistoryToken;
- (NSSet)ignoredTransactionAuthors;
- (NSSet)interestingEntities;
- (RMPersistentHistoryNotifier)initWithContext:(id)a3;
- (RMPersistentHistoryNotifier)initWithPersistentHistoryToken:(id)a3 context:(id)a4;
- (RMPersistentHistoryNotifierDelegate)delegate;
- (void)_delayedQuery;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_queryForTransactionsWithCompletion:(id)a3;
- (void)_scheduleQueryForTransactions;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setIgnoredTransactionAuthors:(id)a3;
- (void)setInterestingEntities:(id)a3;
- (void)setPersistentHistoryToken:(id)a3;
- (void)setQueryNeeded:(BOOL)a3;
- (void)start;
@end

@implementation RMPersistentHistoryNotifier

- (RMPersistentHistoryNotifier)initWithPersistentHistoryToken:(id)a3 context:(id)a4
{
  id v6 = a3;
  v7 = -[RMPersistentHistoryNotifier initWithContext:](self, "initWithContext:", a4);
  if (v7)
  {
    v8 = (NSPersistentHistoryToken *)[v6 copy];
    persistentHistoryToken = v7->_persistentHistoryToken;
    v7->_persistentHistoryToken = v8;

    v7->_shouldUsePersistentHistoryToken = 1;
    v10 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
    queryCondition = v7->_queryCondition;
    v7->_queryCondition = v10;

    v7->_queryNeeded = 0;
  }

  return v7;
}

- (RMPersistentHistoryNotifier)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RMPersistentHistoryNotifier;
  id v6 = -[RMPersistentHistoryNotifier init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_shouldUsePersistentHistoryToken = 0;
    v8 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
    queryCondition = v7->_queryCondition;
    v7->_queryCondition = v8;

    v7->_queryNeeded = 0;
  }

  return v7;
}

- (void)dealloc
{
  if (-[RMPersistentHistoryNotifier hasStarted](self, "hasStarted")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Stopped persistent history notifier (%p).",  buf,  0xCu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RMPersistentHistoryNotifier;
  -[RMPersistentHistoryNotifier dealloc](&v3, "dealloc");
}

+ (id)sharedQueryQueue
{
  if (qword_1000CF298 != -1) {
    dispatch_once(&qword_1000CF298, &stru_1000BA4B8);
  }
  return (id)qword_1000CF290;
}

- (void)start
{
  if (-[RMPersistentHistoryNotifier hasStarted](self, "hasStarted"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000506A0();
    }
  }

  else
  {
    objc_super v3 = _os_activity_create( (void *)&_mh_execute_header,  "Starting persistent history notifier",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v11);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100050708();
    }
    -[RMPersistentHistoryNotifier setHasStarted:](self, "setHasStarted:", 1LL);
    if (!-[RMPersistentHistoryNotifier shouldUsePersistentHistoryToken](self, "shouldUsePersistentHistoryToken"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier persistentHistoryToken](self, "persistentHistoryToken"));
      BOOL v5 = v4 == 0LL;

      if (v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier context](self, "context"));
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistentStoreCoordinator]);

        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentStores]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 currentPersistentHistoryTokenFromStores:v8]);
        -[RMPersistentHistoryNotifier setPersistentHistoryToken:](self, "setPersistentHistoryToken:", v9);
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:self selector:"_managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    -[RMPersistentHistoryNotifier _scheduleQueryForTransactions](self, "_scheduleQueryForTransactions");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Started persistent history notifier (%p).",  buf,  0xCu);
    }

    os_activity_scope_leave(&v11);
  }

- (void)_managedObjectContextDidSave:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier context](self, "context"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 persistentStoreCoordinator]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentStoreCoordinator]);

  if (v6 == v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100050770();
    }
    -[RMPersistentHistoryNotifier _scheduleQueryForTransactions](self, "_scheduleQueryForTransactions");
  }
}

- (void)_scheduleQueryForTransactions
{
  objc_super v3 = self->_queryCondition;
  -[NSConditionLock lock](v3, "lock");
  NSInteger v4 = -[NSConditionLock condition](self->_queryCondition, "condition");
  switch(v4)
  {
    case 2LL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000508C0();
      }
      -[RMPersistentHistoryNotifier setQueryNeeded:](self, "setQueryNeeded:", 1LL);
      BOOL v5 = v3;
      uint64_t v6 = 2LL;
      goto LABEL_13;
    case 1LL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100050858();
      }
      BOOL v5 = v3;
      uint64_t v6 = 1LL;
LABEL_13:
      -[NSConditionLock unlockWithCondition:](v5, "unlockWithCondition:", v6);
      break;
    case 0LL:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1000507F0();
      }
      -[NSConditionLock unlockWithCondition:](v3, "unlockWithCondition:", 1LL);
      -[RMPersistentHistoryNotifier _delayedQuery](self, "_delayedQuery");
      break;
  }
}

- (void)_delayedQuery
{
  objc_super v3 = self->_queryCondition;
  objc_initWeak(&location, self);
  -[NSConditionLock lockWhenCondition:](v3, "lockWhenCondition:", 1LL);
  -[NSConditionLock unlockWithCondition:](v3, "unlockWithCondition:", 2LL);
  NSInteger v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMPersistentHistoryNotifier sharedQueryQueue]( &OBJC_CLASS___RMPersistentHistoryNotifier,  "sharedQueryQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004F8C0;
  v6[3] = &unk_1000B8FF8;
  objc_copyWeak(&v8, &location);
  BOOL v5 = v3;
  v7 = v5;
  [v4 addOperationWithBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_queryForTransactionsWithCompletion:(id)a3
{
  v34 = (void (**)(void))a3;
  v36 = self;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier delegate](self, "delegate"));
  char v4 = objc_opt_respondsToSelector(v35, "persistentHistoryNotifier:isChangeInteresting:stop:");
  uint64_t v90 = 0LL;
  v91 = &v90;
  uint64_t v92 = 0x3032000000LL;
  v93 = sub_1000501C0;
  v94 = sub_1000501D0;
  id v95 = 0LL;
  uint64_t v84 = 0LL;
  v85 = &v84;
  uint64_t v86 = 0x3032000000LL;
  v87 = sub_1000501C0;
  v88 = sub_1000501D0;
  id v89 = 0LL;
  uint64_t v78 = 0LL;
  v79 = &v78;
  uint64_t v80 = 0x3032000000LL;
  v81 = sub_1000501C0;
  v82 = sub_1000501D0;
  id v83 = 0LL;
  uint64_t v72 = 0LL;
  v73 = &v72;
  uint64_t v74 = 0x3032000000LL;
  v75 = sub_1000501C0;
  v76 = sub_1000501D0;
  id v77 = 0LL;
  uint64_t v68 = 0LL;
  v69 = &v68;
  uint64_t v70 = 0x2020000000LL;
  char v71 = 0;
  char v39 = objc_opt_respondsToSelector(v35, "persistentHistoryNotifier:hasChanges:");
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_1000501D8;
  v58[3] = &unk_1000BA4E0;
  char v66 = v4 & 1;
  char v5 = v39;
  char v67 = v39 & 1;
  id v59 = (id)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier context](v36, "context"));
  v60 = v36;
  v61 = &v84;
  v62 = &v68;
  v63 = &v78;
  v64 = &v90;
  v65 = &v72;
  id v33 = v59;
  [v59 performBlockAndWait:v58];
  if (*((_BYTE *)v69 + 24))
  {
    v34[2]();
    goto LABEL_38;
  }

  v38 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier ignoredTransactionAuthors](v36, "ignoredTransactionAuthors"));
  uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier interestingEntities](v36, "interestingEntities"));
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  char v57 = 0;
  v31 = v6;
  if ((v4 & 1) != 0)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100050464;
    v50[3] = &unk_1000BA508;
    v7 = v50;
    v50[4] = v6;
    id v51 = v35;
    v52 = v36;
    v53 = &v54;
    id v8 = objc_retainBlock(v50);
  }

  else
  {
    if (!v6)
    {
      id v8 = &stru_1000BA570;
      goto LABEL_8;
    }

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_100050504;
    v49[3] = &unk_1000BA530;
    v7 = v49;
    v49[4] = v6;
    id v8 = objc_retainBlock(v49);
  }

LABEL_8:
  if (v73[5])
  {
    id v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      id v26 = [(id)v73[5] count];
      v27 = @"(none)";
      v28 = v38;
      if (!v38) {
        v28 = @"(none)";
      }
      uint64_t v29 = v91[5];
      if (v31) {
        v27 = v31;
      }
      uint64_t v30 = v85[5];
      *(_DWORD *)buf = 134219266;
      v99 = v36;
      __int16 v100 = 2048;
      id v101 = v26;
      __int16 v102 = 2112;
      v103 = v28;
      __int16 v104 = 2112;
      v105 = v27;
      __int16 v106 = 2112;
      uint64_t v107 = v29;
      __int16 v108 = 2112;
      uint64_t v109 = v30;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Persistent history notifier (%p) processing transactions: %lu { authors = %@, entities = %@, old token = %@, new token = %@ }.",  buf,  0x3Eu);
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id obj = (id)v73[5];
    id v10 = [obj countByEnumeratingWithState:&v45 objects:v97 count:16];
    if (v10)
    {
      uint64_t v40 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v46 != v40) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
          v13 = objc_autoreleasePoolPush();
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 author]);
          if (v14
            && (v15 = (void *)objc_claimAutoreleasedReturnValue([v12 author]),
                unsigned int v16 = -[__CFString containsObject:](v38, "containsObject:", v15),
                v15,
                v16))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218242;
              v99 = v36;
              __int16 v100 = 2112;
              id v101 = v14;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Persistent history notifier (%p) ignoring transaction from author %@",  buf,  0x16u);
            }
          }

          else
          {
            __int128 v43 = 0u;
            __int128 v44 = 0u;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "changes", v31));
            id v18 = [v17 countByEnumeratingWithState:&v41 objects:v96 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v42;
LABEL_21:
              uint64_t v20 = 0LL;
              while (1)
              {
                if (*(void *)v42 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * v20);
                if (*((_BYTE *)v55 + 24)) {
                  break;
                }
                if (v18 == (id)++v20)
                {
                  id v18 = [v17 countByEnumeratingWithState:&v41 objects:v96 count:16];
                  if (v18) {
                    goto LABEL_21;
                  }
                  break;
                }
              }
            }

            char v5 = v39;
          }

          objc_autoreleasePoolPop(v13);
        }

        id v10 = [obj countByEnumeratingWithState:&v45 objects:v97 count:16];
      }

      while (v10);
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RMPersistentHistoryNotifier persistentHistoryToken](v36, "persistentHistoryToken", v31));
  v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v79[5] persistentHistoryToken]);
  BOOL v24 = [v22 compareToken:v23 error:0] == (id)3;

  if (!v24)
  {
    if ((v5 & 1) != 0) {
      [v35 persistentHistoryNotifier:v36 hasChanges:v79[5]];
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([(id)v79[5] persistentHistoryToken]);
    -[RMPersistentHistoryNotifier setPersistentHistoryToken:](v36, "setPersistentHistoryToken:", v25);
  }

  v34[2]();

  _Block_object_dispose(&v54, 8);
LABEL_38:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
}

- (RMPersistentHistoryNotifierDelegate)delegate
{
  return (RMPersistentHistoryNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSSet)ignoredTransactionAuthors
{
  return (NSSet *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIgnoredTransactionAuthors:(id)a3
{
}

- (NSSet)interestingEntities
{
  return (NSSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setInterestingEntities:(id)a3
{
}

- (NSPersistentHistoryToken)persistentHistoryToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPersistentHistoryToken:(id)a3
{
}

- (BOOL)shouldUsePersistentHistoryToken
{
  return self->_shouldUsePersistentHistoryToken;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)queryNeeded
{
  return self->_queryNeeded;
}

- (void)setQueryNeeded:(BOOL)a3
{
  self->_queryNeeded = a3;
}

- (void).cxx_destruct
{
}

@end