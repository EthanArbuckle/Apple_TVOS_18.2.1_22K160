@interface ACRemoteDataclassOwnersManager
- (ACRemoteDataclassOwnersManager)init;
- (id)_accountStore;
- (id)_dataclassOwnerBundles;
- (id)_dataclassToOwnerMap;
- (id)_ownerForDataclass:(id)a3;
- (void)_cacheDataclassOwnersLimitedToDataclass:(id)a3 withOwnerLoadBlock:(id)a4;
- (void)_decrementBusyCounterForAccount:(id)a3;
- (void)_incrementBusyCounterForAccount:(id)a3;
- (void)_setDataclassOwnerBundles:(id)a3;
- (void)_setOwner:(id)a3 forDataclass:(id)a4;
- (void)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5;
- (void)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5;
- (void)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5;
- (void)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5;
- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4;
- (void)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 completion:(id)a6;
- (void)preloadDataclassOwnersWithCompletion:(id)a3;
@end

@implementation ACRemoteDataclassOwnersManager

- (ACRemoteDataclassOwnersManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACRemoteDataclassOwnersManager;
  v2 = -[ACRemoteDataclassOwnersManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.accounts.dom.actions", v4);
    dataclassActionQueue = v2->_dataclassActionQueue;
    v2->_dataclassActionQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingActionBatches = v2->_pendingActionBatches;
    v2->_pendingActionBatches = v7;
  }

  return v2;
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
    dispatch_queue_t v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }

  return accountStore;
}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = sub_1000059B4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = _ACSignpostCreate();
  uint64_t v9 = v8;

  id v10 = sub_1000059B4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "DataclassPreload",  (const char *)&unk_100007411,  buf,  2u);
  }

  id v13 = sub_1000059B4();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100005B78(v7, v14);
  }

  uint64_t v15 = _ACLogSystem( -[ACRemoteDataclassOwnersManager _cacheDataclassOwnersLimitedToDataclass:withOwnerLoadBlock:]( self,  "_cacheDataclassOwnersLimitedToDataclass:withOwnerLoadBlock:",  0LL,  0LL));
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100005B38(v16);
  }

  _ACSignpostGetNanoseconds(v7, v9);
  id v17 = sub_1000059B4();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v22 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_END,  v7,  "DataclassPreload",  (const char *)&unk_100007411,  v22,  2u);
  }

  id v20 = sub_1000059B4();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100005AD4();
  }

  v4[2](v4, 0LL);
}

- (void)actionsForAddingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  id v10 = a3;
  id v11 = sub_1000059B4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = _ACSignpostCreate();
  uint64_t v15 = v14;

  id v16 = sub_1000059B4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    int v32 = 138543362;
    id v33 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "ActionsForAdding",  " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ",  (uint8_t *)&v32,  0xCu);
  }

  id v19 = sub_1000059B4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005CAC();
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
  [v10 _setAccountStore:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _ownerForDataclass:](self, "_ownerForDataclass:", v8));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 actionsForAddingAccount:v10 forDataclass:v8]);

  uint64_t v25 = _ACLogSystem(v24);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_100005C4C();
  }

  _ACSignpostGetNanoseconds(v13, v15);
  id v27 = sub_1000059B4();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    LOWORD(v32) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v29,  OS_SIGNPOST_INTERVAL_END,  v13,  "ActionsForAdding",  (const char *)&unk_100007411,  (uint8_t *)&v32,  2u);
  }

  id v30 = sub_1000059B4();
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_100005BE8();
  }

  v9[2](v9, v23, 0LL);
}

- (void)actionsForDeletingAccount:(id)a3 affectingDataclass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = sub_1000059B4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = _ACSignpostCreate();
  uint64_t v15 = v14;

  id v16 = sub_1000059B4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v9;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "ActionsForDeleting",  " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ",  buf,  0xCu);
  }

  id v19 = sub_1000059B4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005D70();
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
  [v8 _setAccountStore:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _ownerForDataclass:](self, "_ownerForDataclass:", v9));
  if ((objc_opt_respondsToSelector(v22, "actionsForDeletingAccount:forDataclass:withError:") & 1) != 0)
  {
    id v33 = 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 actionsForDeletingAccount:v8 forDataclass:v9 withError:&v33]);
    uint64_t v24 = (uint64_t)v33;
    uint64_t v25 = (void *)v24;
  }

  else
  {
    uint64_t v24 = objc_opt_respondsToSelector(v22, "actionsForDeletingAccount:forDataclass:");
    if ((v24 & 1) != 0)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 actionsForDeletingAccount:v8 forDataclass:v9]);
      v23 = (void *)v24;
    }

    else
    {
      v23 = 0LL;
    }

    uint64_t v25 = 0LL;
  }

  uint64_t v26 = _ACLogSystem(v24);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_100005C4C();
  }

  _ACSignpostGetNanoseconds(v13, v15);
  id v28 = sub_1000059B4();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = v29;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  v13,  "ActionsForDeleting",  (const char *)&unk_100007411,  buf,  2u);
  }

  id v31 = sub_1000059B4();
  int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_100005D0C();
  }

  v10[2](v10, v23, v25);
}

- (void)actionsForEnablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = sub_1000059B4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = _ACSignpostCreate();
  uint64_t v15 = v14;

  id v16 = sub_1000059B4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "ActionsForEnabling",  " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ",  buf,  0xCu);
  }

  id v19 = sub_1000059B4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005E34();
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
  [v9 _setAccountStore:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _ownerForDataclass:](self, "_ownerForDataclass:", v8));
  if ((objc_opt_respondsToSelector(v22, "actionsForEnablingDataclassOnAccount:forDataclass:withError:") & 1) != 0)
  {
    id v33 = 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 actionsForEnablingDataclassOnAccount:v9 forDataclass:v8 withError:&v33]);
    uint64_t v24 = (uint64_t)v33;
    uint64_t v25 = (void *)v24;
  }

  else
  {
    uint64_t v24 = objc_opt_respondsToSelector(v22, "actionsForEnablingDataclassOnAccount:forDataclass:");
    if ((v24 & 1) != 0)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 actionsForEnablingDataclassOnAccount:v9 forDataclass:v8]);
      v23 = (void *)v24;
    }

    else
    {
      v23 = 0LL;
    }

    uint64_t v25 = 0LL;
  }

  uint64_t v26 = _ACLogSystem(v24);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_100005C4C();
  }

  _ACSignpostGetNanoseconds(v13, v15);
  id v28 = sub_1000059B4();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = v29;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  v13,  "ActionsForEnabling",  (const char *)&unk_100007411,  buf,  2u);
  }

  id v31 = sub_1000059B4();
  int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_100005DD0();
  }

  v10[2](v10, v23, v25);
}

- (void)actionsForDisablingDataclass:(id)a3 onAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = sub_1000059B4();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  os_signpost_id_t v13 = _ACSignpostCreate();
  uint64_t v15 = v14;

  id v16 = sub_1000059B4();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = v8;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "ActionsForDisabling",  " Dataclass=%{public,signpost.telemetry:string1,name=Dataclass}@ ",  buf,  0xCu);
  }

  id v19 = sub_1000059B4();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100005EF8();
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
  [v9 _setAccountStore:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _ownerForDataclass:](self, "_ownerForDataclass:", v8));
  if ((objc_opt_respondsToSelector(v22, "actionsForDisablingDataclassOnAccount:forDataclass:withError:") & 1) != 0)
  {
    id v33 = 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 actionsForDisablingDataclassOnAccount:v9 forDataclass:v8 withError:&v33]);
    uint64_t v24 = (uint64_t)v33;
    uint64_t v25 = (void *)v24;
  }

  else
  {
    uint64_t v24 = objc_opt_respondsToSelector(v22, "actionsForDisablingDataclassOnAccount:forDataclass:");
    if ((v24 & 1) != 0)
    {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 actionsForDisablingDataclassOnAccount:v9 forDataclass:v8]);
      v23 = (void *)v24;
    }

    else
    {
      v23 = 0LL;
    }

    uint64_t v25 = 0LL;
  }

  uint64_t v26 = _ACLogSystem(v24);
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_100005C4C();
  }

  _ACSignpostGetNanoseconds(v13, v15);
  id v28 = sub_1000059B4();
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = v29;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_END,  v13,  "ActionsForDisabling",  (const char *)&unk_100007411,  buf,  2u);
  }

  id v31 = sub_1000059B4();
  int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_100005E94();
  }

  v10[2](v10, v23, v25);
}

- (void)performDataclassActions:(id)a3 forAccount:(id)a4 withChildren:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v38 = a6;
  id v13 = sub_1000059B4();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = _ACSignpostCreate();
  uint64_t v37 = v16;

  id v17 = sub_1000059B4();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = v18;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v10;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "PerformActions",  "actions: %@",  buf,  0xCu);
  }

  id v20 = sub_1000059B4();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100005F58((uint64_t)v10, v15, v21);
  }
  v22 = v10;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
  [v11 _setAccountStore:v23];

  __int128 v50 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v47 = 0u;
  id v24 = v12;
  id v25 = [v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v48;
    do
    {
      id v28 = 0LL;
      do
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v28);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
        [v29 _setAccountStore:v30];

        id v28 = (char *)v28 + 1;
      }

      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }

    while (v26);
  }

  -[ACRemoteDataclassOwnersManager _incrementBusyCounterForAccount:](self, "_incrementBusyCounterForAccount:", v11);
  dataclassActionQueue = self->_dataclassActionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000468C;
  block[3] = &unk_100008250;
  int v32 = v22;
  id v40 = v22;
  id v41 = v11;
  v42 = self;
  id v43 = v24;
  uint64_t v45 = v15;
  uint64_t v46 = v37;
  id v44 = v38;
  id v33 = v38;
  id v34 = v24;
  id v35 = v11;
  id v36 = v32;
  dispatch_async((dispatch_queue_t)dataclassActionQueue, block);
}

- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(id, BOOL, void))a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _accountStore](self, "_accountStore"));
  [v12 _setAccountStore:v7];

  id v8 = self->_pendingActionBatches;
  objc_sync_enter(v8);
  pendingActionBatches = self->_pendingActionBatches;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pendingActionBatches, "objectForKey:", v10));

  objc_sync_exit(v8);
  v6[2](v6, [v11 unsignedIntegerValue] != 0, 0);
}

- (void)_incrementBusyCounterForAccount:(id)a3
{
  id v12 = a3;
  v4 = self->_pendingActionBatches;
  objc_sync_enter(v4);
  pendingActionBatches = self->_pendingActionBatches;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pendingActionBatches, "objectForKey:", v6));

  objc_sync_exit(v4);
  if (v7)
  {
    id v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v7 unsignedIntegerValue] + 1));
  }

  else
  {
    id v8 = &off_100008330;
  }

  id v9 = self->_pendingActionBatches;
  objc_sync_enter(v9);
  id v10 = self->_pendingActionBatches;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v8, v11);

  objc_sync_exit(v9);
}

- (void)_decrementBusyCounterForAccount:(id)a3
{
  id v12 = a3;
  v4 = self->_pendingActionBatches;
  objc_sync_enter(v4);
  pendingActionBatches = self->_pendingActionBatches;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](pendingActionBatches, "objectForKey:", v6));

  objc_sync_exit(v4);
  if (v7 && [v7 unsignedIntegerValue])
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v7 unsignedIntegerValue] - 1));

    uint64_t v7 = (void *)v8;
  }

  id v9 = self->_pendingActionBatches;
  objc_sync_enter(v9);
  if (v7)
  {
    id v10 = self->_pendingActionBatches;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7, v11);
  }

  objc_sync_exit(v9);
}

- (id)_ownerForDataclass:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _dataclassToOwnerMap](self, "_dataclassToOwnerMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

    if (v6 == v7) {
      id v8 = 0LL;
    }
    else {
      id v8 = v6;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    uint64_t v14 = sub_100004890;
    uint64_t v15 = sub_1000048A0;
    id v16 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100005170;
    v10[3] = &unk_100008278;
    v10[4] = &v11;
    -[ACRemoteDataclassOwnersManager _cacheDataclassOwnersLimitedToDataclass:withOwnerLoadBlock:]( self,  "_cacheDataclassOwnersLimitedToDataclass:withOwnerLoadBlock:",  v4,  v10);
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v8;
}

- (void)_cacheDataclassOwnersLimitedToDataclass:(id)a3 withOwnerLoadBlock:(id)a4
{
  v6 = (objc_class *)a3;
  uint64_t v7 = (void (**)(void, id))a4;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _dataclassOwnerBundles](self, "_dataclassOwnerBundles"));
  id v49 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v49)
  {
    char v43 = 0;
    uint64_t v48 = *(void *)v55;
    uint64_t v46 = v6;
    id v44 = v7;
    while (1)
    {
      for (i = 0LL; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v55 != v48) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        id v10 = objc_autoreleasePoolPush();
        uint64_t v11 = (objc_class *)[v9 principalClass];
        uint64_t v12 = _ACLogSystem(v11);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v11;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "\"Loading dataclasses for class %@...\"",  buf,  0xCu);
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class dataclasses](v11, "dataclasses"));
        uint64_t v15 = _ACLogSystem(v14);
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v62 = v11;
          __int16 v63 = 2112;
          v64 = v14;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "\"Loaded dataclasses for class %@: %@\"",  buf,  0x16u);
        }

        if (v6)
        {
          id v17 = [v14 containsObject:v6];
          uint64_t v18 = _ACLogSystem(v17);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v9 bundlePath]);
            *(_DWORD *)buf = 138412546;
            v62 = v6;
            __int16 v63 = 2112;
            v64 = v40;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "\"Found owner of dataclass %@ at path %@\"",  buf,  0x16u);
          }

          char v43 = 1;
        }

        else
        {
          id v20 = v7;
          v21 = v10;
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _dataclassToOwnerMap](self, "_dataclassToOwnerMap"));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v23]);

          if (v24)
          {
            id v10 = v21;
            uint64_t v7 = v20;
            v6 = v46;
            goto LABEL_33;
          }

          uint64_t v26 = _ACLogSystem(v25);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          id v10 = v21;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            sub_100006184(v59, v9, &v60, v19);
          }
        }

        uint64_t v28 = _ACLogSystem(v27);
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v11;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "\"Initializing dataclass owner class %@...\"",  buf,  0xCu);
        }

        __int128 v47 = v10;

        id v30 = objc_alloc_init(v11);
        uint64_t v31 = _ACLogSystem(v30);
        int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v11;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "\"Initialized dataclass owner class %@\"",  buf,  0xCu);
        }

        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        id v33 = v14;
        id v34 = [v33 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = *(void *)v51;
          do
          {
            for (j = 0LL; j != v35; j = (char *)j + 1)
            {
              if (*(void *)v51 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)j);
              v39 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _dataclassToOwnerMap](self, "_dataclassToOwnerMap"));
              [v39 setObject:v30 forKey:v38];
            }

            id v35 = [v33 countByEnumeratingWithState:&v50 objects:v58 count:16];
          }

          while (v35);
        }

        uint64_t v7 = v44;
        if (v44) {
          v44[2](v44, v30);
        }

        v6 = v46;
        id v10 = v47;
LABEL_33:

        objc_autoreleasePoolPop(v10);
      }

      id v49 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (!v49) {
        goto LABEL_37;
      }
    }
  }

  char v43 = 0;
LABEL_37:

  if (v6 && (v43 & 1) == 0)
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _dataclassToOwnerMap](self, "_dataclassToOwnerMap"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v41 setObject:v42 forKey:v6];
  }
}

- (void)_setDataclassOwnerBundles:(id)a3
{
}

- (id)_dataclassOwnerBundles
{
  dataclassOwnerBundles = self->_dataclassOwnerBundles;
  if (!dataclassOwnerBundles)
  {
    uint64_t v4 = _ACLogSystem(0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "\"ACRemoteDataclassOwnersManager is loading all dataclass owners!\"",  v9,  2u);
    }

    v6 = (NSSet *)objc_claimAutoreleasedReturnValue( +[ACDPluginLoader pluginBundlesAtSubpath:]( &OBJC_CLASS___ACDPluginLoader,  "pluginBundlesAtSubpath:",  @"DataclassOwners"));
    uint64_t v7 = self->_dataclassOwnerBundles;
    self->_dataclassOwnerBundles = v6;

    dataclassOwnerBundles = self->_dataclassOwnerBundles;
  }

  return dataclassOwnerBundles;
}

- (void)_setOwner:(id)a3 forDataclass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ACRemoteDataclassOwnersManager _dataclassToOwnerMap](self, "_dataclassToOwnerMap"));
  [v8 setObject:v7 forKey:v6];
}

- (id)_dataclassToOwnerMap
{
  dataclassToOwnerMap = self->_dataclassToOwnerMap;
  if (!dataclassToOwnerMap)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = self->_dataclassToOwnerMap;
    self->_dataclassToOwnerMap = v4;

    dataclassToOwnerMap = self->_dataclassToOwnerMap;
  }

  return dataclassToOwnerMap;
}

- (void).cxx_destruct
{
}

@end