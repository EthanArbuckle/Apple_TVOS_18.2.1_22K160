@interface FamilyManager
+ (FamilyManager)sharedInstance;
- (BOOL)_bootstrapFamilyIfNeededSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5;
- (BOOL)askToBuyEnabledForActiveAccountWithLogKey:(id)a3 lookupFamilyInfoIfNeeded:(BOOL)a4 authIfNeeded:(BOOL)a5 hadFamilyInfo:(BOOL *)a6 error:(id *)a7;
- (FamilyManager)init;
- (id)_familyMembersSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5;
- (id)familyAccountIDs;
- (id)familyMembers;
- (id)fetchFamilyAccountIDsSuppressDialogs:(BOOL)a3;
- (void)_beginObservingAccountChangeNotification;
- (void)_clearFamily;
- (void)_handleAccountChangedNotification;
- (void)_updateFamilyInfoFollowingAccountChangeIfNeeded:(id)a3;
- (void)performMigration;
@end

@implementation FamilyManager

- (FamilyManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FamilyManager;
  v2 = -[FamilyManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.storekit.FamilyManager.dispatch", &_dispatch_queue_attr_concurrent);
    dispatch = v2->_dispatch;
    v2->_dispatch = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.storekit.FamilyManager.notifications", &_dispatch_queue_attr_concurrent);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    -[FamilyManager _beginObservingAccountChangeNotification](v2, "_beginObservingAccountChangeNotification");
  }

  return v2;
}

+ (FamilyManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000419CC;
  block[3] = &unk_1002E6B20;
  block[4] = a1;
  if (qword_10032E4F0 != -1) {
    dispatch_once(&qword_10032E4F0, block);
  }
  return (FamilyManager *)(id)qword_10032E4E8;
}

- (BOOL)askToBuyEnabledForActiveAccountWithLogKey:(id)a3 lookupFamilyInfoIfNeeded:(BOOL)a4 authIfNeeded:(BOOL)a5 hadFamilyInfo:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  os_log_t v13 = (os_log_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_activeiTunesAccount"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ams_DSID](v13, "ams_DSID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[FamilyInfoLookupTask cachedFamilyInfoWithLogKey:]( &OBJC_CLASS___FamilyInfoLookupTask,  "cachedFamilyInfoWithLogKey:",  v11));
  unint64_t v16 = (unint64_t)v15;
  BOOL v17 = v15 != 0LL;
  if (!v15)
  {
    if (qword_10032E540 != -1) {
      dispatch_once(&qword_10032E540, &stru_1002E8C58);
    }
    v23 = (void *)qword_10032E4F8;
    if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
    {
      loga = v23;
      BOOL v24 = v17;
      id v25 = v11;
      v26 = (void *)objc_opt_class(self);
      v48 = a7;
      v50 = a6;
      id v27 = v26;
      v28 = v13;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s ams_DSID](v13, "ams_DSID"));
      *(_DWORD *)buf = 138543874;
      v61 = v26;
      id v11 = v25;
      BOOL v17 = v24;
      __int16 v62 = 2114;
      id v63 = v11;
      __int16 v64 = 2114;
      v65 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  loga,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Did not find cached FamilyInfo for account: %{public}@",  buf,  0x20u);

      os_log_t v13 = v28;
      a7 = v48;
      a6 = v50;
    }

    v18 = 0LL;
    if (v10) {
      goto LABEL_3;
    }
LABEL_9:
    id v22 = 0LL;
    goto LABEL_10;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 familyMembers]);
  if (!v10) {
    goto LABEL_9;
  }
LABEL_3:
  id v59 = 0LL;
  uint64_t v19 = objc_claimAutoreleasedReturnValue( -[FamilyManager _familyMembersSuppressDialogs:logKey:error:]( self,  "_familyMembersSuppressDialogs:logKey:error:",  !v9,  v11,  &v59));
  v20 = v18;
  v18 = (void *)v19;
  unint64_t v21 = v16 | v19;
  id v22 = v59;

  BOOL v17 = v21 != 0;
LABEL_10:
  LOBYTE(v30) = 0;
  if (v18 && !v22 && v14)
  {
    os_log_t log = v13;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v31 = (void *)objc_claimAutoreleasedReturnValue([(id)v16 familyMembers]);
    id v30 = [v31 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v30)
    {
      v44 = 0LL;
      v45 = v18;
      BOOL v46 = v17;
      v49 = a7;
      v51 = a6;
      id v47 = v11;
      uint64_t v32 = *(void *)v56;
      while (2)
      {
        for (i = 0LL; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(v31);
          }
          v34 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
          uint64_t v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "iTunesDSID", v44));
          if (v35)
          {
            v36 = (void *)v35;
            v37 = (void *)objc_claimAutoreleasedReturnValue([v34 iTunesDSID]);
            unsigned int v38 = [v37 isEqualToNumber:v14];

            if (v38)
            {
              LODWORD(v30) = [v34 isAskToBuyEnabled];
              if (qword_10032E540 != -1) {
                dispatch_once(&qword_10032E540, &stru_1002E8C58);
              }
              id v11 = v47;
              a7 = v49;
              a6 = v51;
              id v22 = v44;
              v39 = (void *)qword_10032E4F8;
              if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
              {
                v40 = v39;
                v41 = (void *)objc_opt_class(self);
                *(_DWORD *)buf = 138544130;
                v61 = v41;
                __int16 v62 = 2114;
                id v63 = v47;
                __int16 v64 = 2114;
                v65 = v14;
                __int16 v66 = 1024;
                int v67 = (int)v30;
                id v42 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Family member found for account: %{public}@ askToBuyEnabled: %d",  buf,  0x26u);
              }

              BOOL v17 = v46;
              v18 = v45;
              goto LABEL_28;
            }
          }
        }

        id v30 = [v31 countByEnumeratingWithState:&v55 objects:v68 count:16];
        if (v30) {
          continue;
        }
        break;
      }

      id v11 = v47;
      a7 = v49;
      a6 = v51;
      BOOL v17 = v46;
      id v22 = v44;
      v18 = v45;
    }

- (id)familyAccountIDs
{
  return -[FamilyManager fetchFamilyAccountIDsSuppressDialogs:](self, "fetchFamilyAccountIDsSuppressDialogs:", 0LL);
}

- (id)fetchFamilyAccountIDsSuppressDialogs:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  -[FamilyManager _bootstrapFamilyIfNeededSuppressDialogs:logKey:error:]( self,  "_bootstrapFamilyIfNeededSuppressDialogs:logKey:error:",  v3,  v5,  0LL);
  -[NSLock lock](self->_lock, "lock");
  id v6 = -[NSArray copy](self->_familyAccountIDs, "copy");
  -[NSLock unlock](self->_lock, "unlock");

  return v6;
}

- (id)familyMembers
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[FamilyManager _familyMembersSuppressDialogs:logKey:error:]( self,  "_familyMembersSuppressDialogs:logKey:error:",  0LL,  v3,  0LL));

  return v4;
}

- (void)performMigration
{
  dispatch = self->_dispatch;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100041F4C;
  block[3] = &unk_1002E7958;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatch, block);
}

- (void)_beginObservingAccountChangeNotification
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver sharedInstance](&OBJC_CLASS___ActiveAccountObserver, "sharedInstance"));
  [v7 addObserver:self selector:"_handleAccountChangedNotification" name:@"AccountStorePrimaryAccountDidChange" object:v3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
  dispatch_queue_t v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
  currentAccountDSID = self->_currentAccountDSID;
  self->_currentAccountDSID = v5;
}

- (BOOL)_bootstrapFamilyIfNeededSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (self->_lastFamilyCheck > 0.0)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v9 timeIntervalSinceNow];
    double v11 = v10;

    if (v11 >= -10800.0)
    {
      id v20 = 0LL;
      goto LABEL_44;
    }
  }

  if (qword_10032E540 != -1) {
    dispatch_once(&qword_10032E540, &stru_1002E8C58);
  }
  v12 = (void *)qword_10032E4F8;
  if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v13 = v12;
    *(_DWORD *)buf = 138543874;
    id v67 = (id)objc_opt_class(self);
    __int16 v68 = 2114;
    id v69 = v8;
    __int16 v70 = 1024;
    LODWORD(v71) = 1;
    id v14 = v67;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Bootstrapping family : refresh from server: %d",  buf,  0x1Cu);
  }

  v15 = objc_alloc(&OBJC_CLASS___FamilyInfoLookupTask);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[Bag defaultBag](&OBJC_CLASS____TtC9storekitd3Bag, "defaultBag"));
  BOOL v17 = -[FamilyInfoLookupTask initWithBag:](v15, "initWithBag:", v16);

  -[FamilyInfoLookupTask setLogKey:](v17, "setLogKey:", v8);
  -[FamilyInfoLookupTask setSuppressDialogs:](v17, "setSuppressDialogs:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FamilyInfoLookupTask performFamilyInfoLookup](v17, "performFamilyInfoLookup"));
  id v64 = 0LL;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 resultWithError:&v64]);
  id v20 = v64;

  if (v20)
  {
    if (qword_10032E540 != -1) {
      dispatch_once(&qword_10032E540, &stru_1002E8C58);
    }
    unint64_t v21 = (void *)qword_10032E4F8;
    if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_ERROR))
    {
      id v22 = v21;
      v23 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138544130;
      id v67 = v23;
      __int16 v68 = 2114;
      id v69 = v8;
      __int16 v70 = 2114;
      id v71 = v20;
      __int16 v72 = 1024;
      BOOL v73 = v6;
      id v24 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "[%{public}@] [%{public}@] Family circle request resulted in error: [%{public}@] isBackground: %d",  buf,  0x26u);
    }

    goto LABEL_40;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  self->_lastFamilyCheck = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v19 familyMembers]);

  if (!v26) {
    goto LABEL_40;
  }
  __int128 v55 = v17;
  __int128 v57 = a5;
  id v58 = v8;
  -[NSLock lock](self->_lock, "lock");
  v54 = v19;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 familyMembers]);
  v28 = (NSArray *)[v27 copy];
  familyMembers = self->_familyMembers;
  self->_familyMembers = v28;

  id v30 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ams_DSID"));

  id v59 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v56 = self;
  uint64_t v32 = self->_familyMembers;
  id v33 = -[NSArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v60,  v65,  16LL);
  if (!v33) {
    goto LABEL_34;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v61;
  do
  {
    for (i = 0LL; i != v34; i = (char *)i + 1)
    {
      if (*(void *)v61 != v35) {
        objc_enumerationMutation(v32);
      }
      v37 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
      if (!v31)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v60 + 1) + 8 * (void)i) iTunesDSID]);
        unint64_t v16 = v44;
        if (v44)
        {

LABEL_30:
          v41 = v16;
          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v37 iTunesDSID]);
          -[NSMutableArray addObject:](v59, "addObject:", v16);
LABEL_31:

          unint64_t v16 = v41;
          continue;
        }
      }

      unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue([v37 iTunesDSID]);
      v39 = v38;
      if (v38) {
        BOOL v40 = v31 == 0LL;
      }
      else {
        BOOL v40 = 1;
      }
      if (v40)
      {

        v41 = v16;
        if (v31) {
          continue;
        }
        goto LABEL_31;
      }

      id v42 = (void *)objc_claimAutoreleasedReturnValue([v37 iTunesDSID]);
      unsigned __int8 v43 = [v42 isEqualToNumber:v31];

      if ((v43 & 1) == 0) {
        goto LABEL_30;
      }
    }

    id v34 = -[NSArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v60,  v65,  16LL);
  }

  while (v34);
LABEL_34:

  v45 = (NSArray *)-[NSMutableArray copy](v59, "copy");
  familyAccountIDs = v56->_familyAccountIDs;
  v56->_familyAccountIDs = v45;

  -[NSLock unlock](v56->_lock, "unlock");
  a5 = v57;
  id v8 = v58;
  uint64_t v19 = v54;
  id v20 = 0LL;
  if (-[NSArray count](v56->_familyAccountIDs, "count"))
  {
    if (qword_10032E540 != -1) {
      dispatch_once(&qword_10032E540, &stru_1002E8C58);
    }
    id v47 = (void *)qword_10032E4F8;
    if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = (void *)objc_opt_class(v56);
      v50 = v56->_familyAccountIDs;
      id v51 = v49;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](v50, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543874;
      id v67 = v49;
      __int16 v68 = 2114;
      id v69 = v58;
      __int16 v70 = 2114;
      id v71 = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Set family accounts to: [%{public}@]",  buf,  0x20u);
    }
  }

  BOOL v17 = v55;
LABEL_40:

  if (a5 && v20)
  {
    id v20 = v20;
    *a5 = v20;
  }

- (void)_clearFamily
{
  if (self->_familyMembers)
  {
    if (qword_10032E540 != -1) {
      dispatch_once(&qword_10032E540, &stru_1002E8C58);
    }
    BOOL v3 = (void *)qword_10032E4F8;
    if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      *(_DWORD *)id v8 = 138543362;
      *(void *)&v8[4] = objc_opt_class(self);
      id v5 = *(id *)&v8[4];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared family", v8, 0xCu);
    }
  }

  -[NSLock lock](self->_lock, "lock", *(_OWORD *)v8);
  familyMembers = self->_familyMembers;
  self->_familyMembers = 0LL;
  self->_lastFamilyCheck = 0.0;

  familyAccountIDs = self->_familyAccountIDs;
  self->_familyAccountIDs = 0LL;

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_familyMembersSuppressDialogs:(BOOL)a3 logKey:(id)a4 error:(id *)a5
{
  id v6 = -[NSArray copy](self->_familyMembers, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (void)_handleAccountChangedNotification
{
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100042BD0;
  block[3] = &unk_1002E7958;
  block[4] = self;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
}

- (void)_updateFamilyInfoFollowingAccountChangeIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  v54 = self;
  if (qword_10032E540 != -1) {
    dispatch_once(&qword_10032E540, &stru_1002E8C58);
  }
  id v6 = (void *)qword_10032E4F8;
  if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = (void *)objc_opt_class(self);
    id v9 = v8;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
    *(_DWORD *)buf = 138543874;
    __int128 v62 = v8;
    __int16 v63 = 2114;
    id v64 = v5;
    __int16 v65 = 2114;
    __int16 v66 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Checking if account: %{public}@ has FamilyInfo following account change",  buf,  0x20u);
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[FamilyInfoLookupTask cachedFamilyInfoWithLogKey:]( &OBJC_CLASS___FamilyInfoLookupTask,  "cachedFamilyInfoWithLogKey:",  v5));
  v12 = v11;
  if (v11)
  {
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 familyMembers]);
    id v14 = [v13 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v14)
    {
      id v15 = v14;
      v52 = v12;
      v53 = v5;
      int v16 = 0;
      uint64_t v17 = *(void *)v58;
      uint64_t v55 = *(void *)v58;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 iTunesDSID]);
          if (v20)
          {
            unint64_t v21 = (void *)v20;
            uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
            if (v22)
            {
              v23 = (void *)v22;
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 iTunesDSID]);
              id v25 = v4;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
              int v27 = v16;
              v28 = v13;
              unsigned int v29 = [v24 isEqualToNumber:v26];

              id v4 = v25;
              BOOL v30 = v29 == 0;
              os_log_t v13 = v28;
              int v16 = v27;
              uint64_t v17 = v55;
              if (!v30) {
                int v16 = 1;
              }
            }

            else
            {
            }
          }
        }

        id v15 = [v13 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }

      while (v15);

      v12 = v52;
      id v5 = v53;
      if ((v16 & 1) != 0)
      {
        if (qword_10032E540 != -1) {
          dispatch_once(&qword_10032E540, &stru_1002E8C58);
        }
        v31 = (void *)qword_10032E4F8;
        if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = v31;
          id v33 = (void *)objc_opt_class(v54);
          id v34 = v33;
          uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
          *(_DWORD *)buf = 138543874;
          __int128 v62 = v33;
          __int16 v63 = 2114;
          id v64 = v53;
          __int16 v65 = 2114;
          __int16 v66 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] FamilyInfo found for account: %{public}@",  buf,  0x20u);
        }

        goto LABEL_38;
      }
    }

    else
    {
    }
  }

  if (qword_10032E540 != -1) {
    dispatch_once(&qword_10032E540, &stru_1002E8C58);
  }
  v36 = (void *)qword_10032E4F8;
  if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    unsigned int v38 = (void *)objc_opt_class(v54);
    id v39 = v38;
    BOOL v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
    *(_DWORD *)buf = 138543874;
    __int128 v62 = v38;
    __int16 v63 = 2114;
    id v64 = v5;
    __int16 v65 = 2114;
    __int16 v66 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] FamilyInfo not found account: %{public}@. Attempting to reload silently.",  buf,  0x20u);
  }

  id v56 = 0LL;
  -[FamilyManager _bootstrapFamilyIfNeededSuppressDialogs:logKey:error:]( v54,  "_bootstrapFamilyIfNeededSuppressDialogs:logKey:error:",  1LL,  v5,  &v56);
  id v41 = v56;
  if (v41)
  {
    if (qword_10032E540 != -1) {
      dispatch_once(&qword_10032E540, &stru_1002E8C58);
    }
    id v42 = (void *)qword_10032E4F8;
    if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v43 = v42;
      v44 = (void *)objc_opt_class(v54);
      id v45 = v44;
      BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
      *(_DWORD *)buf = 138544130;
      __int128 v62 = v44;
      __int16 v63 = 2114;
      id v64 = v5;
      __int16 v65 = 2114;
      __int16 v66 = v46;
      __int16 v67 = 2114;
      id v68 = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] Error looking up FamilyInfo for account: %{public}@ error: %{public}@",  buf,  0x2Au);
    }
  }

  else
  {
    if (qword_10032E540 != -1) {
      dispatch_once(&qword_10032E540, &stru_1002E8C58);
    }
    id v47 = (void *)qword_10032E4F8;
    if (os_log_type_enabled((os_log_t)qword_10032E4F8, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = (void *)objc_opt_class(v54);
      id v50 = v49;
      id v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
      *(_DWORD *)buf = 138543874;
      __int128 v62 = v49;
      __int16 v63 = 2114;
      id v64 = v5;
      __int16 v65 = 2114;
      __int16 v66 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] [%{public}@] FamilyInfo reloaded for account: %{public}@",  buf,  0x20u);
    }
  }

LABEL_38:
}

- (void).cxx_destruct
{
}

@end