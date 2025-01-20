@interface PBProfileAccountsMigrator
+ (BOOL)isMigrationRequired;
+ (id)_makeGuestAddProfileRequestWithAccount:(id)a3 isActive:(BOOL)a4 personaUniqueString:(id)a5 overrideName:(id)a6;
+ (id)_makePrimaryAddProfileRequestWithContext:(id)a3;
- (PBProfileAccountsMigrator)init;
- (void)_performMigrationWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)_queue_createGuestPersonaWithCompletion:(id)a3;
- (void)_queue_performMigrationWithContext:(id)a3 completion:(id)a4;
- (void)performMigrationWithCompletionQueue:(id)a3 completion:(id)a4;
@end

@implementation PBProfileAccountsMigrator

- (PBProfileAccountsMigrator)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBProfileAccountsMigrator;
  v2 = -[PBProfileAccountsMigrator init](&v8, "init");
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.PineBoard.PBProfileAccountsMigrator.queue");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;
  }

  return v2;
}

+ (BOOL)isMigrationRequired
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  char v3 = [v2 BOOLForKey:@"PerformedCreateUserProfilesMigration"] ^ 1;

  return v3;
}

- (void)performMigrationWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001AC35C;
  v11[3] = &unk_1003DAC80;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_performMigrationWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001AC618;
  v31[3] = &unk_1003D0E50;
  id v7 = a4;
  id v33 = v7;
  id v8 = v6;
  id v32 = v8;
  id v9 = objc_retainBlock(v31);
  if ([(id)objc_opt_class(self) isMigrationRequired])
  {
    if (self->_queue_performingMigration)
    {
      id v10 = sub_1001AC6E0();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10028B728(v11, v12, v13, v14, v15, v16, v17, v18);
      }

      ((void (*)(void *, void, void))v9[2])(v9, 0LL, 0LL);
    }

    else
    {
      self->_queue_performingMigration = 1;
      id v19 = sub_1001AC6E0();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      os_signpost_id_t v21 = os_signpost_id_generate(v20);

      id v22 = sub_1001AC6E0();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      v24 = v23;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "Create profiles from accounts migration",  "",  buf,  2u);
      }

      id v25 = sub_1001AC6E0();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[PBProfileAccountsMigrator _performMigrationWithCompletionQueue:completion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s: Performing create profiles from accounts migration.",  buf,  0xCu);
      }

      v27 = -[PBCreateUserProfilesMigrationContext initWithAccountStore:]( objc_alloc(&OBJC_CLASS___PBCreateUserProfilesMigrationContext),  "initWithAccountStore:",  self->_accountStore);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1001AC724;
      v28[3] = &unk_1003DB388;
      v28[4] = self;
      os_signpost_id_t v30 = v21;
      v29 = v9;
      -[PBProfileAccountsMigrator _queue_performMigrationWithContext:completion:]( self,  "_queue_performMigrationWithContext:completion:",  v27,  v28);
    }
  }

  else
  {
    ((void (*)(void *, uint64_t, void))v9[2])(v9, 1LL, 0LL);
  }
}

- (void)_queue_performMigrationWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40 = v7;
  if (!v7)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"context != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B798(a2);
    }
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x1001AD000LL);
  }

  if (!v8)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B848(a2);
    }
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x1001AD064LL);
  }

  v39 = v8;
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v72 = 0LL;
  v73 = (id *)&v72;
  uint64_t v74 = 0x3032000000LL;
  v75 = sub_1001AD0C0;
  v76 = sub_1001AD0D0;
  id v77 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 iCloudAltDSID]);
  if (v9)
  {
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 gameCenterAltDSID]);
    BOOL v11 = v10 == 0LL;

    if (v11)
    {
      id obj = 0LL;
      goto LABEL_11;
    }
  }

  id v12 = [(id)objc_opt_class(self) _makePrimaryAddProfileRequestWithContext:v7];
  id obj = (id)objc_claimAutoreleasedReturnValue(v12);
  id v13 = sub_1001AC6E0();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v81 = "-[PBProfileAccountsMigrator _queue_performMigrationWithContext:completion:]";
    __int16 v82 = 2112;
    id v83 = obj;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: Adding primary profile add request. {request=%@}",  buf,  0x16u);
  }

  -[NSMutableArray addObject:](v48, "addObject:", obj);
LABEL_11:
  uint64_t v15 = dispatch_group_create();
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v41 = (id)objc_claimAutoreleasedReturnValue([v7 iTunesAccounts]);
  id v43 = [v41 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v69 != v42) {
          objc_enumerationMutation(v41);
        }
        uint64_t v16 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([obj iTunesAltDSID]);
        if (v17)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([obj iTunesAltDSID]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_altDSID"));
          char v20 = BSEqualStrings(v18, v19);

          if ((v20 & 1) != 0) {
            continue;
          }
        }

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_homeUserIdentifiers"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:"));
        if ([v46 count])
        {
          id v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pbd_selectedHomeUserIdentifier"));
          if (!v21 || ([v46 containsObject:v21] & 1) == 0)
          {
            uint64_t v22 = objc_claimAutoreleasedReturnValue([v45 firstObject]);

            id v21 = (id)v22;
          }

          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          id v23 = v46;
          id v24 = [v23 countByEnumeratingWithState:&v64 objects:v78 count:16];
          if (v24)
          {
            uint64_t v25 = *(void *)v65;
            do
            {
              for (j = 0LL; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v65 != v25) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v27 = *(void *)(*((void *)&v64 + 1) + 8LL * (void)j);
                else {
                  char v28 = 0;
                }
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pbd_localOverrideNameForHomeUserIdentifier:", v27));
                dispatch_group_enter(v15);
                v58[0] = _NSConcreteStackBlock;
                v58[1] = 3221225472LL;
                v58[2] = sub_1001AD0E8;
                v58[3] = &unk_1003DB3B0;
                char v63 = v28;
                v62 = &v72;
                v58[4] = self;
                v58[5] = v16;
                id v30 = v29;
                id v59 = v30;
                v60 = v48;
                v61 = v15;
                -[PBProfileAccountsMigrator _queue_createGuestPersonaWithCompletion:]( self,  "_queue_createGuestPersonaWithCompletion:",  v58);
              }

              id v24 = [v23 countByEnumeratingWithState:&v64 objects:v78 count:16];
            }

            while (v24);
          }
        }

        else
        {
          if (v73[5]) {
            unsigned __int8 v31 = 0;
          }
          else {
            unsigned __int8 v31 = [v16 isActive];
          }
          id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_altDSID"));
          id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pbd_localOverrideNameForItunesAltDSID:", v32));

          dispatch_group_enter(v15);
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472LL;
          v52[2] = sub_1001AD230;
          v52[3] = &unk_1003DB3B0;
          unsigned __int8 v57 = v31;
          v56 = &v72;
          v52[4] = self;
          v52[5] = v16;
          id v21 = v33;
          id v53 = v21;
          v54 = v48;
          v55 = v15;
          -[PBProfileAccountsMigrator _queue_createGuestPersonaWithCompletion:]( self,  "_queue_createGuestPersonaWithCompletion:",  v52);
        }
      }

      id v43 = [v41 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }

    while (v43);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AD378;
  block[3] = &unk_1003D2560;
  v50 = v48;
  id v51 = v39;
  v35 = v48;
  id v36 = v39;
  dispatch_group_notify(v15, queue, block);

  _Block_object_dispose(&v72, 8);
}

- (void)_queue_createGuestPersonaWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028B8F8(a2);
    }
    _bs_set_crash_log_message([v18 UTF8String]);
    __break(0);
    JUMPOUT(0x1001AD628LL);
  }

  id v6 = v5;
  id v7 = sub_1001AC6E0();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (char *)os_signpost_id_generate(v8);

  id v10 = sub_1001AC6E0();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v9,  "Create guest persona",  "",  buf,  2u);
  }

  id v13 = sub_1001AC6E0();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[PBProfileAccountsMigrator _queue_createGuestPersonaWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Creating guest persona.", buf, 0xCu);
  }

  uint64_t v22 = kUMUserPersonaTypeKey;
  id v23 = &off_1003FE0E8;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  objc_initWeak((id *)buf, self);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001AD65C;
  v19[3] = &unk_1003DB3D8;
  v21[1] = v9;
  objc_copyWeak(v21, (id *)buf);
  id v17 = v6;
  id v20 = v17;
  [v16 createUserPersona:v15 passcodeData:0 completionHandler:v19];

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

+ (id)_makePrimaryAddProfileRequestWithContext:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]);

  if (!v4
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesAccountsByAltDSID]),
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAltDSID]),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]),
        v6,
        v5,
        !v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 gameCenterAltDSID]);

    if (!v8
      || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesAccountsByAltDSID]),
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 gameCenterAltDSID]),
          id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]),
          v10,
          v9,
          !v7))
    {
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesAccounts]);
      id v12 = [v11 count];

      if (v12 != (id)1)
      {
LABEL_11:
        id v7 = 0LL;
        goto LABEL_12;
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 iTunesAccounts]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:0]);

      if (!v7) {
        goto LABEL_12;
      }
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_homeUserIdentifiers"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
  if ((unint64_t)[v15 count] >= 2)
  {

    goto LABEL_11;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

  if (v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pbd_localOverrideNameForHomeUserIdentifier:", v16));
    int v18 = 0;
    goto LABEL_13;
  }

+ (id)_makeGuestAddProfileRequestWithAccount:(id)a3 isActive:(BOOL)a4 personaUniqueString:(id)a5 overrideName:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!v10)
  {
    id v16 = sub_1001AC6E0();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10028BA2C(v14, v17, v18, v19, v20, v21, v22, v23);
    }
    id v12 = 0LL;
    goto LABEL_7;
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___UPAddProfileRequest);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_altDSID"));
  -[UPAddProfileRequest setITunesAltDSID:](v12, "setITunesAltDSID:", v13);

  -[UPAddProfileRequest setPersonaUniqueIdentifier:](v12, "setPersonaUniqueIdentifier:", v10);
  -[UPAddProfileRequest setActive:](v12, "setActive:", v8);
  if (v11)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[UPSetting customNameSettingWithName:]( &OBJC_CLASS___UPSetting,  "customNameSettingWithName:",  v11));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
    -[UPAddProfileRequest setSettings:](v12, "setSettings:", v15);

LABEL_7:
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end