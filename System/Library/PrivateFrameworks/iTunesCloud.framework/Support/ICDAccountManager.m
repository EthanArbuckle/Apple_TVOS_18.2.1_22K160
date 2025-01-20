@interface ICDAccountManager
- (ACAccountStore)accountStore;
- (ICConnectionConfiguration)activeConfiguration;
- (ICDAccountManager)initWithLibraryManagementPolicy:(int64_t)a3;
- (ICDAccountManagerState)state;
- (ICDAccountManagerStateChange)stateChange;
- (NSArray)supportedConfigurations;
- (OS_dispatch_queue)serialQueue;
- (id)_buildStateChange;
- (int64_t)libraryManagementPolicy;
- (void)_updateStateWithChange:(id)a3;
- (void)changeLibraryManagementPolicy:(int64_t)a3;
- (void)setLibraryManagementPolicy:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setStateChange:(id)a3;
- (void)updateState;
@end

@implementation ICDAccountManager

- (ICDAccountManager)initWithLibraryManagementPolicy:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ICDAccountManager;
  v4 = -[ICDAccountManager init](&v20, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunescloudd.ICDAccountManager.serial.queue", v6);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[ICMonitoredAccountStore sharedAccountStore]( &OBJC_CLASS___ICMonitoredAccountStore,  "sharedAccountStore"));
    id v19 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allStoreAccountsWithError:&v19]);
    v11 = (ICDAccountManagerState *)v19;

    if (v11)
    {
      v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v22 = v4;
        __int16 v23 = 2114;
        v24 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManager %p - init - Unable to retrieve accounts [empty accounts for restoration fallback] - error=%{public}@",  buf,  0x16u);
      }
    }

    if (v10) {
      v13 = v10;
    }
    else {
      v13 = &__NSArray0__struct;
    }
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[ICDAccountManagerState restoredStatedWithFallbackAccounts:]( &OBJC_CLASS___ICDAccountManagerState,  "restoredStatedWithFallbackAccounts:",  v13));
    state = v4->_state;
    v4->_state = (ICDAccountManagerState *)v14;

    v4->_libraryManagementPolicy = a3;
    v16 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v4->_state;
      *(_DWORD *)buf = 134218242;
      v22 = v4;
      __int16 v23 = 2112;
      v24 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManager %p - init - _state=%@",  buf,  0x16u);
    }

    -[ICDAccountManagerState save](v4->_state, "save");
  }

  return v4;
}

- (void)updateState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager stateChange](self, "stateChange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager _buildStateChange](self, "_buildStateChange"));
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    if (([v4 activeConfigurationChanged] & 1) == 0
      && ([v5 supportedConfigurationsChanged] & 1) == 0)
    {
      v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218242;
        v13 = self;
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManager %p - No account changes detected - %@",  (uint8_t *)&v12,  0x16u);
      }
    }

    if (![v3 isEqual:v5])
    {
      -[ICDAccountManager _updateStateWithChange:](self, "_updateStateWithChange:", v5);
      goto LABEL_15;
    }

    dispatch_queue_t v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      v13 = self;
      __int16 v14 = 2112;
      v15 = v5;
      v8 = "ICDAccountManager %p - No state changes detected - %@";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }

  else
  {
    dispatch_queue_t v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      v13 = self;
      v8 = "ICDAccountManager %p - Unable to update state [No state change built]";
      v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_12;
    }
  }

LABEL_15:
}

- (void)changeLibraryManagementPolicy:(int64_t)a3
{
  int64_t libraryManagementPolicy = self->_libraryManagementPolicy;
  v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (libraryManagementPolicy == a3)
  {
    if (v7)
    {
      int64_t v8 = self->_libraryManagementPolicy;
      int v10 = 134218240;
      uint32_t v11 = self;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManager %p - policy type is unchanged currentValue=%d",  (uint8_t *)&v10,  0x12u);
    }
  }

  else
  {
    if (v7)
    {
      int64_t v9 = self->_libraryManagementPolicy;
      int v10 = 134218496;
      uint32_t v11 = self;
      __int16 v12 = 1024;
      int v13 = v9;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDAccountManager %p - Changing policy type currentValue=%d, newValue=%d",  (uint8_t *)&v10,  0x18u);
    }

    self->_int64_t libraryManagementPolicy = a3;
    -[ICDAccountManager updateState](self, "updateState");
  }

- (NSArray)supportedConfigurations
{
  uint64_t v7 = 0LL;
  int64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = sub_1000FEA4C;
  uint32_t v11 = sub_1000FEA5C;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FEC58;
  v6[3] = &unk_1001A65D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (ICConnectionConfiguration)activeConfiguration
{
  uint64_t v7 = 0LL;
  int64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = sub_1000FEA4C;
  uint32_t v11 = sub_1000FEA5C;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FEC04;
  v6[3] = &unk_1001A65D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICConnectionConfiguration *)v4;
}

- (ICDAccountManagerState)state
{
  uint64_t v7 = 0LL;
  int64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = sub_1000FEA4C;
  uint32_t v11 = sub_1000FEA5C;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FEBCC;
  v6[3] = &unk_1001A65D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICDAccountManagerState *)v4;
}

- (ICDAccountManagerStateChange)stateChange
{
  uint64_t v7 = 0LL;
  int64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  int v10 = sub_1000FEA4C;
  uint32_t v11 = sub_1000FEA5C;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FEB94;
  v6[3] = &unk_1001A65D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICDAccountManagerStateChange *)v4;
}

- (int64_t)libraryManagementPolicy
{
  uint64_t v7 = 0LL;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000FEB80;
  v6[3] = &unk_1001A65D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_buildStateChange
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1000FEA4C;
  id v19 = sub_1000FEA5C;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = sub_1000FEA4C;
  int v13 = sub_1000FEA5C;
  id v14 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FEA64;
  block[3] = &unk_1001A6600;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v3, block);

  if (v10[5])
  {
    int64_t v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v10[5];
      *(_DWORD *)buf = 134218242;
      v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "ICDAccountManager %p - Unable to compute state change [Error retrieving store accounts] - error=%{public}@",  buf,  0x16u);
    }

    id v6 = 0LL;
  }

  else
  {
    id v6 = (id)v16[5];
  }

  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (void)_updateStateWithChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDAccountManager serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FE9E8;
  block[3] = &unk_1001A6C30;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setState:(id)a3
{
}

- (void)setStateChange:(id)a3
{
}

- (void)setLibraryManagementPolicy:(int64_t)a3
{
  self->_int64_t libraryManagementPolicy = a3;
}

- (void).cxx_destruct
{
}

@end