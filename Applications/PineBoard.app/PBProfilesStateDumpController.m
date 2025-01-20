@interface PBProfilesStateDumpController
- (PBProfilesStateDumpController)initWithDelegate:(id)a3;
- (id)_customerLogsStateDump;
@end

@implementation PBProfilesStateDumpController

- (PBProfilesStateDumpController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBProfilesStateDumpController;
  v5 = -[PBProfilesStateDumpController init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_initWeak(&location, v6);
    v7 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100148938;
    v12[3] = &unk_1003D04B8;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle( &_dispatch_main_q,  @"PineBoard - User Profiles - All Users",  v12);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    stateCaptureHandle = v6->_stateCaptureHandle;
    v6->_stateCaptureHandle = (BSInvalidatable *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)_customerLogsStateDump
{
  id v4 = sub_100084680();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dumping all profiles state.", buf, 2u);
  }

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileStoreSnapshotForProfilesStateDumpController:self]);

  if (!v8)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"snapshot != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002865E0(a2);
    }
    _bs_set_crash_log_message([v41 UTF8String]);
    __break(0);
    JUMPOUT(0x100148DB4LL);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryProfile]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pb_identifier"));
  v11 = (void *)v10;
  if (v10) {
    v12 = (const __CFString *)v10;
  }
  else {
    v12 = &stru_1003E2910;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, @"primaryUser");

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 activeProfile]);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pb_identifier"));
  objc_super v15 = (void *)v14;
  if (v14) {
    v16 = (const __CFString *)v14;
  }
  else {
    v16 = &stru_1003E2910;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v16, @"selectedUser");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 profiles]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);

  if (!v19)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"profiles != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028669C(a2);
    }
    _bs_set_crash_log_message([v42 UTF8String]);
    __break(0);
    JUMPOUT(0x100148E18LL);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100148E20;
  v52[3] = &unk_1003D93A8;
  id v20 = v17;
  id v53 = v20;
  uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bs_map:", v52));
  if (v21) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v21, @"users");
  }
  v44 = (void *)v21;
  v46 = v8;
  v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bs_reduce:block:", v22, &stru_1003D93E8));

  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allValues]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bs_compactMap:", &stru_1003D9408));

  if ([v25 count]) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v25,  @"usersSharingiTunes");
  }
  v47 = v6;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v45 = v20;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ams_iTunesAccounts"));
  id v27 = [v26 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (!v27)
  {
    v37 = v8;
    v36 = v47;
    v38 = (void *)v21;
    v39 = v45;
    goto LABEL_29;
  }

  id v28 = v27;
  v43 = v19;
  uint64_t v29 = 0LL;
  uint64_t v30 = *(void *)v49;
  do
  {
    for (i = 0LL; i != v28; i = (char *)i + 1)
    {
      if (*(void *)v49 != v30) {
        objc_enumerationMutation(v26);
      }
      v32 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_altDSID"));
      if ((objc_msgSend(v32, "ams_isLocalAccount") & 1) == 0)
      {
        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v33]);
          id v35 = [v34 count];

          if (!v35) {
            ++v29;
          }
        }
      }
    }

    id v28 = [v26 countByEnumeratingWithState:&v48 objects:v55 count:16];
  }

  while (v28);

  v37 = v46;
  v36 = v47;
  v19 = v43;
  v38 = v44;
  v39 = v45;
  if (v29 >= 1)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v29));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v47,  "setObject:forKeyedSubscript:",  v26,  @"iTunesAccountsWithoutUserCount");
LABEL_29:
  }

  return v36;
}

- (void).cxx_destruct
{
}

@end