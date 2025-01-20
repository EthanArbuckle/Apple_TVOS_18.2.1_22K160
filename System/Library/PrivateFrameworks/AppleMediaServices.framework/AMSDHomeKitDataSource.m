@interface AMSDHomeKitDataSource
- (AMSDHome)currentHome;
- (AMSDHomeKitDataSource)init;
- (AMSDHomeManagerDataSourceDelegate)delegate;
- (AMSDHomeUser)preferredMediaUser;
- (AMSDHomeUser)primaryUser;
- (AMSMutableBinaryPromise)homesUpdatedPromise;
- (AMSPromise)allHomes;
- (HMHomeManager)homeManager;
- (id)_allHomeKitHomes;
- (id)_settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5;
- (id)_settingForKeyPath:(id)a3 withSettings:(id)a4;
- (id)allUsersInHome:(id)a3;
- (id)currentDeviceIsAccessoryForHome:(id)a3;
- (id)homeWithIdentifier:(id)a3;
- (id)listeningHistoryUpdateEnabledForUser:(id)a3 home:(id)a4;
- (id)sendCloudDataRepairRequestToHomeUser:(id)a3 inContainer:(id)a4;
- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5;
- (id)settingForKeyPath:(id)a3;
- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5;
- (unint64_t)mediaProfileEnabledForUser:(id)a3 home:(id)a4;
- (void)accessoryDidUpdatePreferredMediaUser:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeDidEnableMultiUser:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateMultiUserStatus:(int64_t)a4 reason:(id)a5;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)registerToAcceptCloudSharesForContainers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomesUpdatedPromise:(id)a3;
- (void)settingsDidUpdate:(id)a3;
- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5;
- (void)teardownMultiUser;
- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5;
@end

@implementation AMSDHomeKitDataSource

- (AMSDHomeKitDataSource)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSDHomeKitDataSource;
  v2 = -[AMSDHomeKitDataSource init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
    homesUpdatedPromise = v2->_homesUpdatedPromise;
    v2->_homesUpdatedPromise = v3;

    uint64_t v14 = 0LL;
    v15 = &v14;
    uint64_t v16 = 0x2050000000LL;
    v5 = (void *)qword_1000F1FC0;
    uint64_t v17 = qword_1000F1FC0;
    if (!qword_1000F1FC0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100023038;
      v13[3] = &unk_1000D6B98;
      v13[4] = &v14;
      sub_100023038((uint64_t)v13);
      v5 = (void *)v15[3];
    }

    v6 = v5;
    _Block_object_dispose(&v14, 8);
    id v7 = objc_alloc(v6);
    uint64_t v8 = ((uint64_t (*)(id, const char *, uint64_t))[v7 methodForSelector:"initWithOptions:"])( v7,  "initWithOptions:",  56);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    homeManager = v2->_homeManager;
    v2->_homeManager = (HMHomeManager *)v9;

    -[HMHomeManager setDelegate:](v2->_homeManager, "setDelegate:", v2);
  }

  return v2;
}

- (AMSPromise)allHomes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource _allHomeKitHomes](self, "_allHomeKitHomes"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001FBC0;
  v6[3] = &unk_1000D68D0;
  objc_copyWeak(&v7, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 thenWithBlock:v6]);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return (AMSPromise *)v4;
}

- (AMSDHome)currentHome
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentHome]);

  v5 = -[AMSDHomeKitHome initWithHome:dataSource:]( objc_alloc(&OBJC_CLASS___AMSDHomeKitHome),  "initWithHome:dataSource:",  v4,  self);
  return (AMSDHome *)v5;
}

- (AMSDHomeUser)preferredMediaUser
{
  if (+[AMSDevice deviceIsAudioAccessory](&OBJC_CLASS___AMSDevice, "deviceIsAudioAccessory"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentAccessory]);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v4 preferredMediaUser]);
      if (v5) {
        v6 = -[AMSDHomeKitHomeUser initWithUser:](objc_alloc(&OBJC_CLASS___AMSDHomeKitHomeUser), "initWithUser:", v5);
      }
      else {
        v6 = 0LL;
      }
    }

    else
    {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return (AMSDHomeUser *)v6;
}

- (AMSDHomeUser)primaryUser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentHome]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentUser]);

  v5 = -[AMSDHomeKitHomeUser initWithUser:](objc_alloc(&OBJC_CLASS___AMSDHomeKitHomeUser), "initWithUser:", v4);
  return (AMSDHomeUser *)v5;
}

- (id)allUsersInHome:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 users]);
  id v6 = [v5 mutableCopy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentUser]);
  objc_msgSend(v6, "ams_addNullableObject:", v7);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001FEE8;
  v9[3] = &unk_1000D68F8;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  return v6;
}

- (id)currentDeviceIsAccessoryForHome:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAccessory]);

  if (!v6)
  {
    if (+[AMSDevice deviceIsAppleTV](&OBJC_CLASS___AMSDevice, "deviceIsAppleTV"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v11) {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      uint64_t v14 = objc_opt_class(self, v13);
      uint64_t v16 = AMSLogKey(v14, v15);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      int v25 = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      v28 = v17;
      v18 = v12;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
    }

    else
    {
      if (!+[AMSDevice deviceIsAudioAccessory](&OBJC_CLASS___AMSDevice, "deviceIsAudioAccessory"))
      {
LABEL_15:
        v10 = 0LL;
        goto LABEL_16;
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v11) {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v21 = objc_opt_class(self, v20);
      uint64_t v23 = AMSLogKey(v21, v22);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
      int v25 = 138543618;
      uint64_t v26 = v21;
      __int16 v27 = 2114;
      v28 = v17;
      v18 = v12;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    }

    _os_log_impl( (void *)&_mh_execute_header,  v18,  v19,  "%{public}@: [%{public}@] -[HMHomeManager currentAccessory] returned nil.",  (uint8_t *)&v25,  0x16u);

    goto LABEL_14;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 home]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 isEqual:v9]));

LABEL_16:
  return v10;
}

- (id)homeWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource _allHomeKitHomes](self, "_allHomeKitHomes"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000201F4;
  v9[3] = &unk_1000D5F28;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 thenWithBlock:v9]);

  return v7;
}

- (id)listeningHistoryUpdateEnabledForUser:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentAccessory]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 userListeningHistoryUpdateControlForHome:v6]);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessories]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000204F4;
    v20[3] = &unk_1000D6948;
    uint64_t v21 = v9;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v11, "ams_anyWithTest:", v20)));
    uint64_t v13 = v21;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class(self, v14);
      uint64_t v17 = AMSLogKey(v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v15;
      __int16 v24 = 2114;
      int v25 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] [HMUser userListeningHistoryUpdateControlForHome:] returned nil.",  buf,  0x16u);
    }

    objc_super v12 = 0LL;
  }

  return v12;
}

- (unint64_t)mediaProfileEnabledForUser:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[AMSDevice deviceIsAppleTV](&OBJC_CLASS___AMSDevice, "deviceIsAppleTV"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaContentProfileAccessControlForHome:v7]);
    if (!v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v9) {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class(self, v11);
        uint64_t v14 = AMSLogKey(v12, v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v29 = 138543618;
        uint64_t v30 = v12;
        __int16 v31 = 2114;
        v32 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] -[HMUser mediaContentProfileAccessControlForHome:] returned nil.",  (uint8_t *)&v29,  0x16u);
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 accessories]);

    if (v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 accessories]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v17, "ams_anyWithTest:", &stru_1000D6988)));
    }
  }

  else
  {
    if (!+[AMSDevice deviceIsAudioAccessory](&OBJC_CLASS___AMSDevice, "deviceIsAudioAccessory"))
    {
LABEL_26:
      unint64_t v27 = 0LL;
      goto LABEL_27;
    }

    else {
      v18 = @"root.siri.identifyVoice";
    }
    os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v19) {
      os_log_type_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class(self, v21);
      uint64_t v24 = AMSLogKey(v22, v23);
      int v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      int v29 = 138543874;
      uint64_t v30 = v22;
      __int16 v31 = 2114;
      v32 = v25;
      __int16 v33 = 2114;
      v34 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Using %{public}@ to determine if a user's media profile is enabled.",  (uint8_t *)&v29,  0x20u);
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDHomeKitDataSource _settingForKeyPath:user:home:]( self,  "_settingForKeyPath:user:home:",  v18,  v6,  v7));
    uint64_t v8 = v26;
    if (v26) {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v26 BOOLValue]));
    }
    else {
      uint64_t v16 = 0LL;
    }
  }

  if (!v16) {
    goto LABEL_26;
  }
  else {
    unint64_t v27 = 1LL;
  }

LABEL_27:
  return v27;
}

- (void)teardownMultiUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userCloudShareManager]);
  [v4 setDelegate:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  [v5 setDelegate:0];

  -[AMSDHomeKitDataSource setHomeManager:](self, "setHomeManager:", 0LL);
  -[AMSDHomeKitDataSource setDelegate:](self, "setDelegate:", 0LL);
}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userCloudShareManager]);
  [v6 setDelegate:self];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_mapWithTransform:", &stru_1000D69C8));
  uint64_t v9 = AMSLogKey(v7, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_initWeak(&location, self);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userCloudShareManager]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100020A4C;
  v14[3] = &unk_1000D69F0;
  id v13 = v10;
  id v15 = v13;
  objc_copyWeak(&v16, &location);
  [v12 registerForContainerIDs:v7 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)sendCloudDataRepairRequestToHomeUser:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___AMSDHomeKitHomeUser, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0) {
    id v11 = v8;
  }
  else {
    id v11 = 0LL;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 user]);
  id v13 = v7;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___CKContainer, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
    id v35 = v13;
  }
  else {
    id v35 = 0LL;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v16) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig", v35));
  }
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "OSLogObject", v35));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_opt_class(self, v18);
    uint64_t v21 = AMSLogKey(v19, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = AMSHashIfNeeded(v8);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = AMSHashIfNeeded(v13);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2114;
    v46 = v24;
    LOWORD(v47[0]) = 2114;
    *(void *)((char *)v47 + 2) = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Sending a cloud share repair request. user = %{public}@ | container = %{public}@",  buf,  0x2Au);
  }

  unint64_t v27 = objc_alloc_init(&OBJC_CLASS___AMSMutableBinaryPromise);
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2050000000LL;
  v28 = (void *)qword_1000F1FD8;
  uint64_t v44 = qword_1000F1FD8;
  if (!qword_1000F1FD8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_10002313C;
    v46 = &unk_1000D6B98;
    v47[0] = &v41;
    sub_10002313C((uint64_t)buf);
    v28 = (void *)v42[3];
  }

  int v29 = v28;
  _Block_object_dispose(&v41, 8);
  id v30 = objc_alloc_init(v29);
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100021050;
  v39[3] = &unk_1000D5AD8;
  v32 = v27;
  v40 = v32;
  [v12 sendClientShareRepairRequest:v30 containerID:v31 completion:v39];

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100021064;
  v38[3] = &unk_1000D5AB0;
  v38[4] = self;
  -[AMSMutableBinaryPromise addSuccessBlock:](v32, "addSuccessBlock:", v38);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100021164;
  v37[3] = &unk_1000D5AD8;
  v37[4] = self;
  -[AMSMutableBinaryPromise addErrorBlock:](v32, "addErrorBlock:", v37);
  __int16 v33 = v32;

  return v33;
}

- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___CKShare, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
    id v37 = v11;
  }
  else {
    id v37 = 0LL;
  }

  id v14 = v9;
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___CKContainer, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
    id v17 = v14;
  }
  else {
    id v17 = 0LL;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v18) {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v36 = self;
    uint64_t v21 = objc_opt_class(self, v20);
    uint64_t v23 = AMSLogKey(v21, v22);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    uint64_t v25 = AMSHashIfNeeded(v11);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    uint64_t v27 = AMSHashIfNeeded(v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138544130;
    uint64_t v42 = v21;
    self = v36;
    __int16 v43 = 2114;
    uint64_t v44 = v24;
    __int16 v45 = 2114;
    v46 = v26;
    __int16 v47 = 2114;
    v48 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Sending a cloud share to a home owner. share = %{public}@ | home = %{public}@",  buf,  0x2Au);
  }

  int v29 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeWithIdentifier:](self, "homeWithIdentifier:", v29));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100021544;
  v38[3] = &unk_1000D6A40;
  id v39 = v11;
  id v40 = v14;
  id v31 = v14;
  id v32 = v11;
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v30 thenWithBlock:v38]);

  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 thenWithBlock:&stru_1000D6A80]);
  return v34;
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentAccessory]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);
    if (v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDHomeKitDataSource _settingForKeyPath:withSettings:]( self,  "_settingForKeyPath:withSettings:",  v4,  v7));
    }
    else {
      id v8 = 0LL;
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v9) {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class(self, v11);
      uint64_t v14 = AMSLogKey(v12, v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] -[HMHomeManager currentAccessory] returned nil.",  (uint8_t *)&v17,  0x16u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeWithIdentifier:](self, "homeWithIdentifier:", v11));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 resultWithError:0]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource allUsersInHome:](self, "allUsersInHome:", v13));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100021B7C;
  v31[3] = &unk_1000D6AA8;
  id v15 = v9;
  id v32 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_firstObjectPassingTest:", v31));

  if (v13 && v16)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDHomeKitDataSource _settingForKeyPath:user:home:]( self,  "_settingForKeyPath:user:home:",  v8,  v16,  v13));
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v18) {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class(self, v20);
      uint64_t v23 = AMSLogKey(v21, v22);
      id v30 = v8;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      uint64_t v25 = AMSHashIfNeeded(v10);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      uint64_t v27 = AMSHashIfNeeded(v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = v21;
      __int16 v35 = 2114;
      v36 = v24;
      __int16 v37 = 2114;
      v38 = v26;
      __int16 v39 = 2114;
      id v40 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to fetch a HMHome/HMHomeUser. home = %{public}@ | homeUser = %{public}@",  buf,  0x2Au);

      id v8 = v30;
    }

    int v17 = 0LL;
  }

  return v17;
}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  id v4 = a3;
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v11 = AMSLogKey(v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AMSHashIfNeeded(v4);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v16 = 138543874;
    uint64_t v17 = v9;
    __int16 v18 = 2114;
    __int16 v19 = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Preferred media user for current accessory updated. Accessory = %{public}@",  (uint8_t *)&v16,  0x20u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v15 homeManagerDataSource:self didChangeWithType:7];
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v6 homeManagerDataSource:self didChangeWithType:0];
}

- (void)homeDidEnableMultiUser:(id)a3
{
  id v4 = (id)AMSSetLogKey(0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v5 homeManagerDataSource:self didChangeWithType:6];
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v6 homeManagerDataSource:self didChangeWithType:10];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v6 homeManagerDataSource:self didChangeWithType:1];
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v6 homeManagerDataSource:self didChangeWithType:11];
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v6 homeManagerDataSource:self didChangeWithType:2];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v6 homeManagerDataSource:self didChangeWithType:3];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  id v5 = (id)AMSSetLogKey(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentAccessory]);

  [v6 setDelegate:self];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homesUpdatedPromise](self, "homesUpdatedPromise"));
  [v7 finishWithSuccess];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v8 homeManagerDataSource:self didChangeWithType:4];
}

- (void)homeManager:(id)a3 didUpdateMultiUserStatus:(int64_t)a4 reason:(id)a5
{
  id v7 = a5;
  id v8 = (id)AMSSetLogKey(0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = AMSLogKey(v12, v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v17 = 138544130;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    __int16 v20 = v15;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] HomeKit's multi-user status changed. status = %ld | reason = %{public}@",  (uint8_t *)&v17,  0x2Au);
  }

  int v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v16 homeManagerDataSource:self didChangeWithType:9];
}

- (void)settingsDidUpdate:(id)a3
{
  id v4 = (id)AMSSetLogKey(0LL);
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v5 homeManagerDataSource:self didChangeWithType:8];
}

- (void)shareManager:(id)a3 didReceiveShareInvitation:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)AMSSetLogKey(0LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  uint64_t v11 = -[AMSDHomeKitHomeCloudShare initWithShareInvitation:]( objc_alloc(&OBJC_CLASS___AMSDHomeKitHomeCloudShare),  "initWithShareInvitation:",  v8);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000222CC;
  v13[3] = &unk_1000D6AD0;
  id v14 = v7;
  id v12 = v7;
  [v10 homeManagerDataSource:self didReceiveCloudShare:v11 completion:v13];
}

- (void)user:(id)a3 didUpdateMediaContentProfileAccessControl:(id)a4 forHome:(id)a5
{
  id v6 = (id)AMSSetLogKey(0LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource delegate](self, "delegate"));
  [v7 homeManagerDataSource:self didChangeWithType:5];
}

- (id)_allHomeKitHomes
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homeManager](self, "homeManager"));
  id v4 = [v3 multiUserStatus];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v10 = AMSLogKey(v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543874;
    uint64_t v49 = v8;
    __int16 v50 = 2114;
    v51 = v11;
    __int16 v52 = 2048;
    id v53 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [%{public}@] HMHomeManagerMultiUserStatus = %ld",  buf,  0x20u);
  }

  unsigned int v12 = +[AMSDevice deviceIsAppleTV](&OBJC_CLASS___AMSDevice, "deviceIsAppleTV");
  if (v4 == (id)1) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = v12;
  }
  if (v13 == 1)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ams_activeiCloudAccount"));
    BOOL v16 = v15 == 0LL;

    if (v16)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v17) {
        int v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = objc_opt_class(self, v19);
        uint64_t v22 = AMSLogKey(v20, v21);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v20;
        __int16 v50 = 2114;
        v51 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [%{public}@] HomeKit reported that it isn't ready, but there's no iCloud account. Proceeding to clean things up.",  buf,  0x16u);
      }

      goto LABEL_16;
    }
  }

  else if (v4 == (id)1)
  {
LABEL_16:
    id v24 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
    objc_initWeak((id *)buf, self);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homesUpdatedPromise](self, "homesUpdatedPromise"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100022900;
    v45[3] = &unk_1000D6AF8;
    objc_copyWeak(&v47, (id *)buf);
    uint64_t v26 = v24;
    v46 = v26;
    [v25 addErrorBlock:v45];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitDataSource homesUpdatedPromise](self, "homesUpdatedPromise"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100022A50;
    v42[3] = &unk_1000D6B48;
    objc_copyWeak(&v44, (id *)buf);
    v28 = v26;
    __int16 v43 = v28;
    [v27 addSuccessBlock:v42];

    int v29 = v43;
    id v30 = v28;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);
    return v30;
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v32) {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    uint64_t v35 = objc_opt_class(self, v34);
    uint64_t v37 = AMSLogKey(v35, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    *(_DWORD *)buf = 138543874;
    uint64_t v49 = v35;
    __int16 v50 = 2114;
    v51 = v38;
    __int16 v52 = 2048;
    id v53 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@ [%{public}@] Failed to fetch the device's homes. HomeKit isn't ready. status = %ld",  buf,  0x20u);
  }

  uint64_t v39 = AMSError(13LL, @"HomeKit Setup In Progress", @"HomeKit setup is still in progress.", 0LL);
  id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v40));

  return v41;
}

- (id)_settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a4 userSettingsForHome:a5]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 settings]);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDHomeKitDataSource _settingForKeyPath:withSettings:]( self,  "_settingForKeyPath:withSettings:",  v8,  v10));
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v12) {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class(self, v14);
      uint64_t v17 = AMSLogKey(v15, v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      int v20 = 138544130;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      __int16 v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to fetch the necessary HomeKit settings objects. settingsContainer = %@ | settings = %@",  (uint8_t *)&v20,  0x2Au);
    }

    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)_settingForKeyPath:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setDelegate:self];
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 rootGroup]);
  -[NSMutableArray ams_addNullableObject:](v8, "ams_addNullableObject:", v9);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 rootGroup]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 groups]);
  -[NSMutableArray ams_addObjectsFromNullableArray:](v8, "ams_addObjectsFromNullableArray:", v11);

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  unsigned int v12 = v8;
  unsigned int v13 = (AMSDHomeKitHomeSetting *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v42,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v13; i = (AMSDHomeKitHomeSetting *)((char *)i + 1))
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v30 + 1) + 8 * (void)i) settings]);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_100022F74;
        v28[3] = &unk_1000D6B70;
        id v29 = v6;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_firstObjectPassingTest:", v28));

        if (v17)
        {
          unsigned int v13 = -[AMSDHomeKitHomeSetting initWithSetting:]( objc_alloc(&OBJC_CLASS___AMSDHomeKitHomeSetting),  "initWithSetting:",  v17);

          goto LABEL_11;
        }
      }

      unsigned int v13 = (AMSDHomeKitHomeSetting *)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v30,  v42,  16LL);
      if (v13) {
        continue;
      }
      break;
    }
  }

- (AMSDHomeManagerDataSourceDelegate)delegate
{
  return (AMSDHomeManagerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (AMSMutableBinaryPromise)homesUpdatedPromise
{
  return self->_homesUpdatedPromise;
}

- (void)setHomesUpdatedPromise:(id)a3
{
}

- (void).cxx_destruct
{
}

@end