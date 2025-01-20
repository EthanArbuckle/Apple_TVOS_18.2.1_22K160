@interface AMSDRefreshMultiUserDatabaseTask
- (AMSDCloudDataDatabase)database;
- (AMSDMultiUserController)controller;
- (AMSDRefreshMultiUserDatabaseTask)initWithController:(id)a3 database:(id)a4;
- (BOOL)_handleAccountChangeInChangedRecord:(id)a3 withError:(id *)a4;
- (BOOL)_reconcileiTunesAccountForChangedRecord:(id)a3 withError:(id *)a4;
- (id)_handleExpiredChangeTokensInChangedRecordsResult:(id)a3;
- (id)performTask;
- (void)_handleChangedRecordZones:(id)a3 withErrors:(id)a4;
- (void)_handleDeletedRecordZones:(id)a3 withErrors:(id)a4;
@end

@implementation AMSDRefreshMultiUserDatabaseTask

- (AMSDRefreshMultiUserDatabaseTask)initWithController:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSDRefreshMultiUserDatabaseTask;
  v9 = -[AMSDRefreshMultiUserDatabaseTask init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    objc_storeStrong((id *)&v10->_database, a4);
  }

  return v10;
}

- (id)performTask
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003B0B8;
  v3[3] = &unk_1000D6328;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserDatabaseTask performTaskWithBlock:]( self,  "performTaskWithBlock:",  v3));
}

- (BOOL)_handleAccountChangeInChangedRecord:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDHomeManager homeUserIdentifierForRecord:]( &OBJC_CLASS___AMSDHomeManager,  "homeUserIdentifierForRecord:",  v6));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_iTunesAccountWithHomeUserIdentifier:", v7));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"AMSHomeParticipant_iTunesDSID"]);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0) {
        id v13 = v10;
      }
      else {
        id v13 = 0LL;
      }

      if (v13
        && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ams_DSID")),
            unsigned __int8 v17 = [v16 isEqualToNumber:v13],
            v16,
            (v17 & 1) == 0))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
        if (!v18) {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = objc_opt_class(self, v20);
          uint64_t v22 = AMSLogKey(v42, v21);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v22);
          uint64_t v23 = AMSHashIfNeeded(v9);
          v45 = self;
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          uint64_t v25 = AMSHashIfNeeded(v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          *(_DWORD *)buf = 138544130;
          uint64_t v49 = v42;
          __int16 v50 = 2114;
          v51 = v43;
          __int16 v52 = 2114;
          uint64_t v53 = (uint64_t)v24;
          __int16 v54 = 2114;
          v55 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] A user changed a home's iTunes account. oldiTunesAccount = %{public}@ | record = %{public}@",  buf,  0x2Au);

          self = v45;
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneIdentifier]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 name]);
        objc_msgSend(v9, "amsd_removeRecordZoneName:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "amsd_saveMultiUserManagedAccount:", v9));
        id v47 = 0LL;
        unsigned __int8 v15 = [v31 resultWithError:&v47];
        id v32 = v47;

        if ((v15 & 1) == 0)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v33) {
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "OSLogObject", v42));
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            uint64_t v44 = objc_opt_class(self, v35);
            uint64_t v37 = AMSLogKey(v44, v36);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v37);
            uint64_t v38 = AMSHashIfNeeded(v32);
            uint64_t v39 = objc_claimAutoreleasedReturnValue(v38);
            *(_DWORD *)buf = 138543874;
            uint64_t v49 = v44;
            __int16 v50 = 2114;
            v51 = v46;
            __int16 v52 = 2114;
            uint64_t v53 = v39;
            v40 = (void *)v39;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to disassociate an account. error = %{public}@",  buf,  0x20u);
          }

          if (a4) {
            *a4 = v32;
          }
        }
      }

      else
      {
        unsigned __int8 v15 = 1;
      }
    }

    else
    {
      unsigned __int8 v15 = 1;
    }
  }

  else if (a4)
  {
    uint64_t v14 = AMSError( 2LL,  @"Invalid Cloud Data Record",  @"The cloud data record contains no home user identifier.",  0LL);
    unsigned __int8 v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)_handleChangedRecordZones:(id)a3 withErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class(self, v10);
      uint64_t v13 = AMSLogKey(v11, v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = AMSHashIfNeeded(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543874;
      uint64_t v49 = v11;
      __int16 v50 = 2114;
      v51 = v14;
      __int16 v52 = 2114;
      uint64_t v53 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Record zones changed. changedZoneIdentifiers = %{public}@",  buf,  0x20u);
    }

    unsigned __int8 v17 = objc_alloc(&OBJC_CLASS___AMSDCloudDataFetchChangedRecordsTask);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserDatabaseTask database](self, "database"));
    v19 = -[AMSDCloudDataFetchChangedRecordsTask initWithRecordZoneIdentifiers:inDatabase:]( v17,  "initWithRecordZoneIdentifiers:inDatabase:",  v6,  v18);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataFetchChangedRecordsTask performFetch](v19, "performFetch"));
    id v47 = 0LL;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 resultWithError:&v47]);
    id v22 = v47;

    if (v21)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDRefreshMultiUserDatabaseTask _handleExpiredChangeTokensInChangedRecordsResult:]( self,  "_handleExpiredChangeTokensInChangedRecordsResult:",  v21));

      v24 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v23 changedRecords]);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472LL;
      v42[2] = sub_10003BCF0;
      v42[3] = &unk_1000D7AB0;
      v42[4] = self;
      id v43 = v7;
      v26 = v24;
      uint64_t v44 = v26;
      [v25 enumerateKeysAndObjectsUsingBlock:v42];

      v27 = (void *)objc_claimAutoreleasedReturnValue([v23 changeTokens]);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10003C004;
      v39[3] = &unk_1000D7AD8;
      v40 = v26;
      v41 = self;
      v28 = v26;
      [v27 enumerateKeysAndObjectsUsingBlock:v39];
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v29) {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 OSLogObject]);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = objc_opt_class(self, v31);
        uint64_t v34 = AMSLogKey(v32, v33);
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        uint64_t v36 = AMSHashIfNeeded(v22);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        *(_DWORD *)buf = 138543874;
        uint64_t v49 = v32;
        __int16 v50 = 2114;
        v51 = v35;
        __int16 v52 = 2114;
        uint64_t v53 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to fetch record zone changes. error = %{public}@",  buf,  0x20u);
      }

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10003BC84;
      v45[3] = &unk_1000D7A60;
      v45[4] = self;
      id v38 = v22;
      id v46 = v38;
      [v6 enumerateObjectsUsingBlock:v45];
      objc_msgSend(v7, "ams_addNullableObject:", v38);
    }
  }
}

- (void)_handleDeletedRecordZones:(id)a3 withErrors:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003C0F0;
  v6[3] = &unk_1000D7A60;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  [a3 enumerateObjectsUsingBlock:v6];
}

- (id)_handleExpiredChangeTokensInChangedRecordsResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 errors]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_filterUsingTest:", &stru_1000D7B40));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);

  if ([v7 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class(self, v10);
      uint64_t v13 = AMSLogKey(v11, v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v15 = AMSHashIfNeeded(v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543874;
      uint64_t v64 = v11;
      __int16 v65 = 2114;
      v66 = v14;
      __int16 v67 = 2114;
      v68 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Encountered expired change tokens. recordZones = %{public}@",  buf,  0x20u);
    }

    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472LL;
    v62[2] = sub_10003CACC;
    v62[3] = &unk_1000D7B68;
    v62[4] = self;
    [v7 enumerateObjectsUsingBlock:v62];
    unsigned __int8 v17 = objc_alloc(&OBJC_CLASS___AMSDCloudDataFetchChangedRecordsTask);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserDatabaseTask database](self, "database"));
    v19 = -[AMSDCloudDataFetchChangedRecordsTask initWithRecordZoneIdentifiers:inDatabase:]( v17,  "initWithRecordZoneIdentifiers:inDatabase:",  v7,  v18);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataFetchChangedRecordsTask performFetch](v19, "performFetch"));
    id v61 = 0LL;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 resultWithError:&v61]);
    id v22 = v61;

    if (v21)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 changedRecords]);
      id v24 = [v23 mutableCopy];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 changedRecords]);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_10003CB1C;
      v59[3] = &unk_1000D7B90;
      id v60 = v24;
      id v26 = v24;
      [v25 enumerateKeysAndObjectsUsingBlock:v59];

      v27 = (void *)objc_claimAutoreleasedReturnValue([v4 deletedRecords]);
      id v28 = [v27 mutableCopy];

      v29 = (void *)objc_claimAutoreleasedReturnValue([v21 deletedRecords]);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_10003CB28;
      v57[3] = &unk_1000D7B90;
      id v58 = v28;
      id v30 = v28;
      [v29 enumerateKeysAndObjectsUsingBlock:v57];

      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 errors]);
      id v32 = [v31 mutableCopy];

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_10003CB34;
      v55[3] = &unk_1000D7B68;
      id v33 = v32;
      id v56 = v33;
      [v7 enumerateObjectsUsingBlock:v55];
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v21 errors]);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_10003CB44;
      v53[3] = &unk_1000D7BB8;
      id v54 = v33;
      id v35 = v33;
      [v34 enumerateKeysAndObjectsUsingBlock:v53];

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v4 changeTokens]);
      id v37 = [v36 mutableCopy];

      id v38 = (void *)objc_claimAutoreleasedReturnValue([v21 changeTokens]);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_10003CB50;
      v51[3] = &unk_1000D7BE0;
      id v52 = v37;
      id v39 = v37;
      [v38 enumerateKeysAndObjectsUsingBlock:v51];

      v40 = -[AMSDCloudDataChangedRecordsResult initWithChangedRecords:deletedRecords:errors:changeTokens:]( objc_alloc(&OBJC_CLASS___AMSDCloudDataChangedRecordsResult),  "initWithChangedRecords:deletedRecords:errors:changeTokens:",  v26,  v30,  v35,  v39);
    }

    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v41) {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 OSLogObject]);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = objc_opt_class(self, v43);
        uint64_t v46 = AMSLogKey(v44, v45);
        id v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        uint64_t v48 = AMSHashIfNeeded(v22);
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
        *(_DWORD *)buf = 138543874;
        uint64_t v64 = v44;
        __int16 v65 = 2114;
        v66 = v47;
        __int16 v67 = 2114;
        v68 = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to fetch changed records after clearing expired change tokens. error = %{public}@",  buf,  0x20u);
      }

      v40 = (AMSDCloudDataChangedRecordsResult *)v4;
    }
  }

  else
  {
    v40 = (AMSDCloudDataChangedRecordsResult *)v4;
  }

  return v40;
}

- (BOOL)_reconcileiTunesAccountForChangedRecord:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserDatabaseTask controller](self, "controller"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 homeManager]);
  unint64_t v9 = +[AMSDCloudDataManager multiUserStatusForRecord:withHomeManager:]( &OBJC_CLASS___AMSDCloudDataManager,  "multiUserStatusForRecord:withHomeManager:",  v6,  v8);

  if (v9)
  {
    if (v9 == 2)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v10) {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class(self, v12);
        uint64_t v15 = AMSLogKey(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_DWORD *)buf = 138543874;
        uint64_t v71 = v13;
        __int16 v72 = 2114;
        v73 = v16;
        __int16 v74 = 2048;
        uint64_t v75 = 2LL;
        unsigned __int8 v17 = "%{public}@: [%{public}@] AMSDMultiUserStatus = enabled (%lu)";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v17, buf, 0x20u);
      }
    }

    else
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsMultiUserConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsMultiUserConfig"));
      uint64_t v10 = (void *)v27;
      if (v9 == 1)
      {
        if (!v27) {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = objc_opt_class(self, v28);
          uint64_t v31 = AMSLogKey(v29, v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v31);
          *(_DWORD *)buf = 138543874;
          uint64_t v71 = v29;
          __int16 v72 = 2114;
          v73 = v16;
          __int16 v74 = 2048;
          uint64_t v75 = 1LL;
          unsigned __int8 v17 = "%{public}@: [%{public}@] AMSDMultiUserStatus = disabled (%lu)";
          goto LABEL_22;
        }
      }

      else
      {
        if (!v27) {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = objc_opt_class(self, v32);
          uint64_t v35 = AMSLogKey(v33, v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v35);
          *(_DWORD *)buf = 138543874;
          uint64_t v71 = v33;
          __int16 v72 = 2114;
          v73 = v16;
          __int16 v74 = 2048;
          uint64_t v75 = v9;
          unsigned __int8 v17 = "%{public}@: [%{public}@] AMSDMultiUserStatus = unknown (%lu)";
          goto LABEL_22;
        }
      }
    }

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDHomeManager homeUserIdentifierForRecord:]( &OBJC_CLASS___AMSDHomeManager,  "homeUserIdentifierForRecord:",  v6));
    if (!v36)
    {
      if (a4)
      {
        uint64_t v41 = AMSError( 2LL,  @"Invalid Cloud Data Record",  @"The cloud data record contains no home user identifier.",  0LL);
        unsigned __int8 v26 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v41);
      }

      else
      {
        unsigned __int8 v26 = 0;
      }

      goto LABEL_49;
    }

    if (v9 == 2)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"AMSHomeParticipant_MultiUserToken"]);
      uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSString, v38);
      if ((objc_opt_isKindOfClass(v37, v39) & 1) != 0) {
        id v40 = v37;
      }
      else {
        id v40 = 0LL;
      }

      if (v40)
      {
        id v58 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDRefreshMultiUserDatabaseTask controller](self, "controller"));
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 performAuthenticationForHomeParticipantRecord:v6]);
        id v69 = 0LL;
        id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 resultWithError:&v69]);
        id v48 = v69;
        unsigned __int8 v26 = v60 != 0LL;

        if (!v60)
        {
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v49) {
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          __int16 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 OSLogObject]);
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            goto LABEL_44;
          }
          uint64_t v67 = objc_opt_class(self, v61);
          uint64_t v63 = AMSLogKey(v67, v62);
          id v54 = (void *)objc_claimAutoreleasedReturnValue(v63);
          uint64_t v64 = AMSHashIfNeeded(v48);
          id v56 = (void *)objc_claimAutoreleasedReturnValue(v64);
          *(_DWORD *)buf = 138543874;
          uint64_t v71 = v67;
          __int16 v72 = 2114;
          v73 = v54;
          __int16 v74 = 2114;
          uint64_t v75 = (uint64_t)v56;
          v57 = "%{public}@: [%{public}@] Failed to authenticate an account. error = %{public}@";
LABEL_43:
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v57, buf, 0x20u);

LABEL_44:
          if (a4) {
            *a4 = v48;
          }
          goto LABEL_46;
        }

        goto LABEL_46;
      }
    }

    else
    {
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      id v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "ams_iTunesAccountWithHomeUserIdentifier:", v36));

      if (v40)
      {
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v43 zoneIdentifier]);
        uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v44 name]);
        objc_msgSend(v40, "amsd_markRecordZoneNameHidden:", v45);

        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        id v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "amsd_saveMultiUserManagedAccount:", v40));
        id v68 = 0LL;
        unsigned __int8 v26 = [v47 resultWithError:&v68];
        id v48 = v68;

        if ((v26 & 1) == 0)
        {
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
          if (!v49) {
            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
          }
          __int16 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 OSLogObject]);
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            goto LABEL_44;
          }
          uint64_t v66 = objc_opt_class(self, v51);
          uint64_t v53 = AMSLogKey(v66, v52);
          id v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
          uint64_t v55 = AMSHashIfNeeded(v48);
          id v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          *(_DWORD *)buf = 138543874;
          uint64_t v71 = v66;
          __int16 v72 = 2114;
          v73 = v54;
          __int16 v74 = 2114;
          uint64_t v75 = (uint64_t)v56;
          v57 = "%{public}@: [%{public}@] Failed to disassociate an account. error = %{public}@";
          goto LABEL_43;
        }

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (AMSDCloudDataDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
}

@end