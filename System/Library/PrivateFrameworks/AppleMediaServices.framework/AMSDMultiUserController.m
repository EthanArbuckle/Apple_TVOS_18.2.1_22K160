@interface AMSDMultiUserController
+ (BOOL)deviceCanManageMultiUser;
+ (BOOL)deviceSupportsMultipleUsers;
+ (id)_scheduledRefreshActivityBlock;
+ (id)sharedController;
- (AMSDCloudDataContainer)cloudContainer;
- (AMSDCloudDataManager)cloudDataManager;
- (AMSDHomeManager)homeManager;
- (AMSDMultiUserController)initWithCloudDataManager:(id)a3 homeManager:(id)a4;
- (AMSThreadSafeObject)previousCloudContainerStatus;
- (BOOL)_refreshShouldUseCloudDataWithHomes:(id)a3;
- (BOOL)isDeviceOdeonConfigured;
- (BOOL)shouldEnablePushTopic;
- (NSString)pushTopic;
- (id)_isCloudDataAvailable;
- (id)_isRefreshThrottlingDisabledWithOptions:(id)a3;
- (id)_refreshThrottlingDate;
- (id)_scheduleRefreshWithOptions:(id)a3;
- (id)_sendCloudDataRepairRequestForHomeParticipant:(id)a3;
- (id)databaseForHome:(id)a3 user:(id)a4;
- (id)fetchHomeHomeUserPairForAccount:(id)a3 homeUserIdentifier:(id)a4;
- (id)performAuthenticationForHomeParticipantRecord:(id)a3;
- (id)performAuthenticationForHomeParticipantRecord:(id)a3 metricsIdentifier:(id)a4;
- (id)performAuthenticationWithExportedToken:(id)a3;
- (id)refreshWithOptions:(id)a3;
- (id)refreshWithOptions:(id)a3 metrics:(id)a4;
- (void)_setLastSuccessfulRefreshDateWithHomes:(id)a3;
- (void)_setRefreshThrottlingDateWithTimeInterval:(double)a3;
- (void)cloudDataManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4;
- (void)handlePushNotification:(id)a3;
- (void)homeManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4;
- (void)homeManagerDataSource:(id)a3 didReceiveCloudShare:(id)a4 completion:(id)a5;
- (void)setHomeManager:(id)a3;
- (void)setPreviousCloudContainerStatus:(id)a3;
- (void)teardownMultiUser;
@end

@implementation AMSDMultiUserController

- (AMSDMultiUserController)initWithCloudDataManager:(id)a3 homeManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AMSDMultiUserController;
  v9 = -[AMSDMultiUserController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudDataManager, a3);
    objc_storeStrong((id *)&v10->_homeManager, a4);
    v11 = objc_alloc_init(&OBJC_CLASS___AMSThreadSafeObject);
    previousCloudContainerStatus = v10->_previousCloudContainerStatus;
    v10->_previousCloudContainerStatus = v11;
  }

  return v10;
}

- (void)teardownMultiUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController homeManager](self, "homeManager"));
  [v3 teardownMultiUser];

  -[AMSDMultiUserController setHomeManager:](self, "setHomeManager:", 0LL);
}

+ (id)sharedController
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100025F34;
  block[3] = &unk_1000D6CC0;
  block[4] = a1;
  if (qword_1000F1FE8 != -1) {
    dispatch_once(&qword_1000F1FE8, block);
  }
  return (id)qword_1000F1FF0;
}

- (AMSDCloudDataContainer)cloudContainer
{
  v3 = objc_alloc_init(&OBJC_CLASS___AMSDCloudDataContainerOptions);
  -[AMSDCloudDataContainerOptions setRecordZoneEncryption:](v3, "setRecordZoneEncryption:", 1LL);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[AMSDefaults multiUserContainerID](&OBJC_CLASS___AMSDefaults, "multiUserContainerID"));
  v5 = (void *)v4;
  v6 = @"com.apple.applemediaservices.multiuser";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController cloudDataManager](self, "cloudDataManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 containerWithContainerIdentifier:v7 options:v3]);

  return (AMSDCloudDataContainer *)v9;
}

+ (BOOL)deviceCanManageMultiUser
{
  if ((+[AMSDevice deviceIsiPhone](&OBJC_CLASS___AMSDevice, "deviceIsiPhone") & 1) != 0
    || (+[AMSDevice deviceIsiPad](&OBJC_CLASS___AMSDevice, "deviceIsiPad") & 1) != 0)
  {
    return 1;
  }

  else
  {
    return +[AMSDevice deviceIsiPod](&OBJC_CLASS___AMSDevice, "deviceIsiPod");
  }

+ (BOOL)deviceSupportsMultipleUsers
{
  else {
    return +[AMSDevice deviceIsAudioAccessory](&OBJC_CLASS___AMSDevice, "deviceIsAudioAccessory");
  }
}

- (NSString)pushTopic
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController cloudDataManager](self, "cloudDataManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 pushNotificationTopic]);

  return (NSString *)v3;
}

- (id)databaseForHome:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 users]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002630C;
  v19[3] = &unk_1000D5ED8;
  id v9 = v7;
  id v20 = v9;
  unsigned int v10 = objc_msgSend(v8, "ams_anyWithTest:", v19);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 currentUser]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  unsigned int v14 = [v12 isEqual:v13];

  if (!v14)
  {
    if ([v6 isCurrentUserOwner])
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController cloudContainer](self, "cloudContainer"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 sharedDatabase]);
      goto LABEL_7;
    }

- (id)fetchHomeHomeUserPairForAccount:(id)a3 homeUserIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_homeIdentifier"));
  if (v8
    && (id v9 = (void *)v8,
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_homeUserAllIdentifiers")),
        id v11 = [v10 count],
        v10,
        v9,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_homeUserAllIdentifiers"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100026570;
    v25[3] = &unk_1000D6CE8;
    id v13 = v7;
    id v26 = v13;
    unsigned __int8 v14 = objc_msgSend(v12, "ams_anyWithTest:", v25);

    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController homeManager](self, "homeManager"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allHomes]);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10002657C;
      v22[3] = &unk_1000D6D10;
      id v23 = v6;
      id v24 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 thenWithBlock:v22]);
    }

    else
    {
      uint64_t v20 = AMSError( 7LL,  @"Invalid Home User Identifier",  @"The account isn't associated with the given home user identifier.",  0LL);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v15));
    }
  }

  else
  {
    uint64_t v18 = AMSError( 2LL,  @"Account Missing Home Identifiers",  @"The account isn't associated with a home or home users.",  0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v19));
  }

  return v17;
}

- (BOOL)isDeviceOdeonConfigured
{
  v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v3, "valueForKey:", @"persistentGroupUUID"));
  BOOL v2 = v4 != 0LL;

  return v2;
}

- (id)performAuthenticationForHomeParticipantRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[AMSDMultiUserController performAuthenticationForHomeParticipantRecord:metricsIdentifier:]( self,  "performAuthenticationForHomeParticipantRecord:metricsIdentifier:",  v4,  v6));
  return v7;
}

- (id)performAuthenticationForHomeParticipantRecord:(id)a3 metricsIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v8) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v13 = AMSLogKey(v11, v12);
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = AMSHashIfNeeded(v6);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543874;
    uint64_t v45 = v11;
    __int16 v46 = 2114;
    v47 = v14;
    __int16 v48 = 2114;
    v49 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Authenticating a HomeParticipant. homeParticipant = %{public}@",  buf,  0x20u);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v17 setAuthenticationType:1];
  [v17 setCanMakeAccountActive:0];
  if (v7) {
    [v17 setMetricsIdentifier:v7];
  }
  [v17 setDebugReason:@"AMSDMultiUserController performAuthenticationForHomeParticipantRecord"];
  id v18 = [[AMSAuthenticateTask alloc] initWithAccount:0 options:v17];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"AMSHomeParticipant_iTunesAltDSID"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
  if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0) {
    id v22 = v19;
  }
  else {
    id v22 = 0LL;
  }

  [v18 setAltDSID:v22];
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"AMSHomeParticipant_iTunesDSID"]);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSNumber, v24);
  if ((objc_opt_isKindOfClass(v23, v25) & 1) != 0) {
    id v26 = v23;
  }
  else {
    id v26 = 0LL;
  }

  [v18 setDSID:v26];
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDHomeManager homeIdentifierForRecord:]( &OBJC_CLASS___AMSDHomeManager,  "homeIdentifierForRecord:",  v6));
  [v18 setHomeIdentifier:v27];

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDHomeManager homeUserIdentifierForRecord:]( &OBJC_CLASS___AMSDHomeManager,  "homeUserIdentifierForRecord:",  v6));
  [v18 setHomeUserIdentifier:v28];

  v29 = (void *)objc_claimAutoreleasedReturnValue([v6 fieldForKey:@"AMSHomeParticipant_MultiUserToken"]);
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSString, v30);
  if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0) {
    id v32 = v29;
  }
  else {
    id v32 = 0LL;
  }

  [v18 setMultiUserToken:v32];
  v33 = (void *)objc_claimAutoreleasedReturnValue([v18 performAuthentication]);
  objc_initWeak((id *)buf, self);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100026CF0;
  v41[3] = &unk_1000D6D38;
  objc_copyWeak(&v43, (id *)buf);
  v41[4] = self;
  id v34 = v6;
  id v42 = v34;
  [v33 addErrorBlock:v41];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100026E6C;
  v37[3] = &unk_1000D6D88;
  objc_copyWeak(&v40, (id *)buf);
  id v35 = v34;
  id v38 = v35;
  v39 = self;
  [v33 addSuccessBlock:v37];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);

  return v33;
}

- (id)performAuthenticationWithExportedToken:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v10 = AMSLogKey(v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = AMSHashIfNeeded(v4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543874;
    uint64_t v49 = v8;
    __int16 v50 = 2114;
    v51 = v11;
    __int16 v52 = 2114;
    v53 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Authenticating with an exported token. exportedTokenInfo = %{public}@",  buf,  0x20u);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v14 setAuthenticationType:1];
  [v14 setCanMakeAccountActive:0];
  [v14 setDebugReason:@"AMSDMultiUserController performAuthenticationWithExportedToken"];
  [v14 setIgnoreAccountConversion:1];
  id v15 = [[AMSAuthenticateTask alloc] initWithAccount:0 options:v14];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AMSHomeParticipant_iTunesAltDSID"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSString, v17);
  if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
    id v19 = v16;
  }
  else {
    id v19 = 0LL;
  }

  [v15 setAltDSID:v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AMSHomeParticipant_iTunesDSID"]);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber, v21);
  if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0) {
    id v23 = v20;
  }
  else {
    id v23 = 0LL;
  }

  [v15 setDSID:v23];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AMSHomeParticipant_iTunesUsername"]);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v25);
  if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0) {
    id v27 = v24;
  }
  else {
    id v27 = 0LL;
  }

  [v15 setUsername:v27];
  v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AMSHomeParticipant_HomeIdentifier"]);
  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString, v29);
  if ((objc_opt_isKindOfClass(v28, v30) & 1) != 0) {
    id v31 = v28;
  }
  else {
    id v31 = 0LL;
  }

  if (v31)
  {
    id v32 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v31);
    [v15 setHomeIdentifier:v32];
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AMSHomeParticipant_HomeUserIdentifier"]);
  uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString, v34);
  if ((objc_opt_isKindOfClass(v33, v35) & 1) != 0) {
    id v36 = v33;
  }
  else {
    id v36 = 0LL;
  }

  if (v36)
  {
    v37 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v36);
    [v15 setHomeUserIdentifier:v37];
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"AMSHomeParticipant_MultiUserToken"]);
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSString, v39);
  if ((objc_opt_isKindOfClass(v38, v40) & 1) != 0) {
    id v41 = v38;
  }
  else {
    id v41 = 0LL;
  }

  [v15 setMultiUserToken:v41];
  id v42 = (void *)objc_claimAutoreleasedReturnValue([v15 performAuthentication]);
  objc_initWeak((id *)buf, self);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000277F8;
  v46[3] = &unk_1000D6D60;
  objc_copyWeak(&v47, (id *)buf);
  [v42 addErrorBlock:v46];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100027940;
  v44[3] = &unk_1000D6DB0;
  objc_copyWeak(&v45, (id *)buf);
  [v42 addSuccessBlock:v44];
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);

  return v42;
}

- (id)refreshWithOptions:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[AMSDevice deviceIsAppleWatch](&OBJC_CLASS___AMSDevice, "deviceIsAppleWatch"))
  {
    uint64_t v8 = AMSError(5LL, @"watchOS Not Supported", @"Multi-User refreshes aren't supported on watchOS.", 0LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v9));
  }

  else
  {
    [v6 schedulingInterval];
    if (v11 == 0.0)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
      if (!v12) {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_opt_class(self, v14);
        uint64_t v17 = AMSLogKey(v15, v16);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        uint64_t v19 = AMSHashIfNeeded(v6);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2114;
        id v36 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Queuing a new Multi-User refresh. options = %{public}@",  buf,  0x20u);
      }

      uint64_t v21 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
      if (qword_1000F1FF8 != -1) {
        dispatch_once(&qword_1000F1FF8, &stru_1000D6DD0);
      }
      uint64_t v22 = (dispatch_queue_s *)(id)qword_1000F2000;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100027E04;
      v31[3] = &unk_1000D5F98;
      v31[4] = self;
      id v32 = v6;
      id v33 = v7;
      uint64_t v34 = v21;
      id v23 = v31;
      uint64_t v24 = v21;
      uint64_t v26 = AMSLogKey(v24, v25);
      id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_10002A66C;
      id v36 = &unk_1000D6208;
      id v37 = v27;
      id v38 = v23;
      id v28 = v27;
      dispatch_async(v22, buf);

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_100028500;
      v30[3] = &unk_1000D6E68;
      v30[4] = self;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSMutablePromise continueWithBlock:](v24, "continueWithBlock:", v30));
    }

    else
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController _scheduleRefreshWithOptions:](self, "_scheduleRefreshWithOptions:", v6));
    }
  }

  return v10;
}

- (id)refreshWithOptions:(id)a3
{
  return -[AMSDMultiUserController refreshWithOptions:metrics:](self, "refreshWithOptions:metrics:", a3, 0LL);
}

- (void)cloudDataManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig",  a3));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v11 = AMSLogKey(v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    uint64_t v24 = v12;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Cloud data manager changed. changeType = %lu",  buf,  0x20u);
  }

  if (a4)
  {
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___AMSDMultiUserMetrics);
    id v14 = -[AMSDMultiUserMetrics enqueueCloudKitSaveReceivedEvent](v13, "enqueueCloudKitSaveReceivedEvent");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cloud data manager changed. changeType = %lu",  a4));
    uint64_t v16 = -[AMSDRefreshMultiUserOptions initWithReason:]( objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserOptions),  "initWithReason:",  v15);
    -[AMSDRefreshMultiUserOptions setShouldUseCloudData:](v16, "setShouldUseCloudData:", 1LL);
    id v17 = -[AMSDMultiUserController refreshWithOptions:metrics:](self, "refreshWithOptions:metrics:", v16, v13);
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController cloudContainer](self, "cloudContainer"));
    uint64_t v13 = (AMSDMultiUserMetrics *)objc_claimAutoreleasedReturnValue([v18 status]);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100028BC4;
    v20[3] = &unk_1000D5AD8;
    v20[4] = self;
    -[AMSDMultiUserMetrics addErrorBlock:](v13, "addErrorBlock:", v20);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100028CF4;
    v19[3] = &unk_1000D6EB8;
    void v19[4] = self;
    v19[5] = 0LL;
    -[AMSDMultiUserMetrics addSuccessBlock:](v13, "addSuccessBlock:", v19);
  }
}

- (void)homeManagerDataSource:(id)a3 didChangeWithType:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig",  a3));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class(self, v8);
    uint64_t v11 = AMSLogKey(v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Home manager changed. changeType = %lu",  buf,  0x20u);
  }

  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___AMSDMultiUserMetrics);
  id v14 = -[AMSDMultiUserMetrics enqueueHomeKitChangedReceivedEvent](v13, "enqueueHomeKitChangedReceivedEvent");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Home manager changed (changeType = %lu)",  a4));
  uint64_t v16 = -[AMSDRefreshMultiUserOptions initWithReason:]( objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserOptions),  "initWithReason:",  v15);
  -[AMSDRefreshMultiUserOptions setShouldUseCloudData:](v16, "setShouldUseCloudData:", 0LL);
  if (a4 == 2)
  {
    uint64_t v17 = 0LL;
    goto LABEL_9;
  }

  if (a4 == 3)
  {
    uint64_t v17 = 1LL;
LABEL_9:
    -[AMSDRefreshMultiUserOptions setShouldUseCloudData:](v16, "setShouldUseCloudData:", 1LL);
    -[AMSDRefreshMultiUserOptions setReasonType:](v16, "setReasonType:", v17);
  }

  id v18 = -[AMSDMultiUserController refreshWithOptions:metrics:](self, "refreshWithOptions:metrics:", v16, v13);
}

- (void)homeManagerDataSource:(id)a3 didReceiveCloudShare:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v9) {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = AMSLogKey(v12, v13);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = AMSHashIfNeeded(v7);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138543874;
    uint64_t v24 = v12;
    __int16 v25 = 2114;
    unint64_t v26 = v15;
    __int16 v27 = 2114;
    id v28 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Data source received a cloud share. share = %{public}@",  buf,  0x20u);
  }

  id v18 = -[AMSDAcceptHomeCloudShareTask initWithController:cloudShare:]( objc_alloc(&OBJC_CLASS___AMSDAcceptHomeCloudShareTask),  "initWithController:cloudShare:",  self,  v7);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDAcceptHomeCloudShareTask performTask](v18, "performTask"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100029304;
  v21[3] = &unk_1000D6AD0;
  id v22 = v8;
  id v20 = v8;
  [v19 addFinishBlock:v21];
}

- (void)handlePushNotification:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController cloudDataManager](self, "cloudDataManager"));
  [v5 handlePushNotification:v4];
}

- (BOOL)shouldEnablePushTopic
{
  return objc_msgSend((id)objc_opt_class(self, a2), "deviceSupportsMultipleUsers");
}

- (id)_isCloudDataAvailable
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController cloudContainer](self, "cloudContainer"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 status]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100029410;
  v8[3] = &unk_1000D6F08;
  v8[4] = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 continueWithBlock:v8]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 binaryPromiseAdapter]);

  return v6;
}

- (id)_isRefreshThrottlingDisabledWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController _refreshThrottlingDate](self, "_refreshThrottlingDate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = [v6 compare:v5];

  if (v7 == (id)-1LL)
  {
    if (![v4 ignoreThrottling])
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Refresh throttling is active. nextRefresh = %@",  v5));
      uint64_t v18 = AMSError(11LL, @"Refresh Throttling", v17, 0LL);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithError:](&OBJC_CLASS___AMSBinaryPromise, "promiseWithError:", v19));

      goto LABEL_9;
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v8) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class(self, v10);
      uint64_t v13 = AMSLogKey(v11, v12);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      __int16 v23 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Ignoring active refresh throttling.",  buf,  0x16u);
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithSuccess](&OBJC_CLASS___AMSBinaryPromise, "promiseWithSuccess"));
LABEL_9:

  return v15;
}

- (BOOL)_refreshShouldUseCloudDataWithHomes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSStorage _valueForKey:]( &OBJC_CLASS___AMSStorage,  "_valueForKey:",  @"AMSDLastMultiUserRefresh"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dateByAddingTimeInterval:86400.0]);
  id v13 = [v11 compare:v12];

  if (v13 == (id)-1LL)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSStorage _valueForKey:]( &OBJC_CLASS___AMSStorage,  "_valueForKey:",  @"AMSDLastMultiUserRefreshHomes"));
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSArray, v16);
    if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0) {
      id v18 = v15;
    }
    else {
      id v18 = 0LL;
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_mapWithTransform:", &stru_1000D6F48));
    id v20 = (void *)v19;
    LOBYTE(v14) = 1;
    if (v18 && v19)
    {
      uint64_t v21 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v18);
      __int16 v22 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v20);
      unsigned int v14 = !-[NSSet isEqualToSet:](v21, "isEqualToSet:", v22);
    }
  }

  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (id)_refreshThrottlingDate
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSStorage _valueForKey:](&OBJC_CLASS___AMSStorage, "_valueForKey:", @"AMSDNextRefresh"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0) {
    id v5 = v2;
  }
  else {
    id v5 = 0LL;
  }

  [v5 doubleValue];
  double v7 = v6;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v7);
}

- (id)_sendCloudDataRepairRequestForHomeParticipant:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"AMSHomeParticipant_HomeIdentifier"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    id v8 = v5;
  }
  else {
    id v8 = 0LL;
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 fieldForKey:@"AMSHomeParticipant_HomeUserIdentifier"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    id v12 = v9;
  }
  else {
    id v12 = 0LL;
  }

  id v13 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
  unsigned int v14 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v12);
  uint64_t v15 = v14;
  if (!v13)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v20) {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v23 = objc_opt_class(self, v22);
    uint64_t v25 = AMSLogKey(v23, v24);
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v23;
    __int16 v42 = 2114;
    id v43 = v26;
    __int16 v27 = "%{public}@: [%{public}@] Could not find home identifier for home participant.";
    goto LABEL_18;
  }

  if (!v14)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v20) {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 OSLogObject]);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v29 = objc_opt_class(self, v28);
    uint64_t v31 = AMSLogKey(v29, v30);
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v31);
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v29;
    __int16 v42 = 2114;
    id v43 = v26;
    __int16 v27 = "%{public}@: [%{public}@] Could not find home user identifier for home participant.";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);

LABEL_19:
    uint64_t v32 = AMSError(0LL, 0LL, 0LL, 0LL);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v32);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBinaryPromise promiseWithError:](&OBJC_CLASS___AMSBinaryPromise, "promiseWithError:", v16));
    goto LABEL_20;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController homeManager](self, "homeManager"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 homeWithHomeIdentifier:v13]);
  uint64_t v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472LL;
  id v36 = sub_100029EEC;
  id v37 = &unk_1000D6F70;
  id v38 = v15;
  uint64_t v39 = self;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 thenWithBlock:&v34]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "binaryPromiseAdapter", v34, v35, v36, v37));

LABEL_20:
  return v19;
}

- (void)_setLastSuccessfulRefreshDateWithHomes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSinceReferenceDate];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  +[AMSStorage _setValue:forKey:](&OBJC_CLASS___AMSStorage, "_setValue:forKey:", v5, @"AMSDLastMultiUserRefresh");

  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_mapWithTransform:", &stru_1000D6F90));
  +[AMSStorage _setValue:forKey:]( &OBJC_CLASS___AMSStorage,  "_setValue:forKey:",  v6,  @"AMSDLastMultiUserRefreshHomes");
}

- (void)_setRefreshThrottlingDateWithTimeInterval:(double)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:a3]);

  [v6 timeIntervalSinceReferenceDate];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  +[AMSStorage _setValue:forKey:](&OBJC_CLASS___AMSStorage, "_setValue:forKey:", v5, @"AMSDNextRefresh");
}

+ (id)_scheduledRefreshActivityBlock
{
  return &stru_1000D6FD0;
}

- (id)_scheduleRefreshWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class(self, v7);
    uint64_t v10 = AMSLogKey(v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = AMSHashIfNeeded(v4);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v8;
    __int16 v29 = 2114;
    uint64_t v30 = v11;
    __int16 v31 = 2114;
    uint64_t v32 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Scheduling a refresh. options = %{public}@",  buf,  0x20u);
  }

  [v4 schedulingInterval];
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDMultiUserController _refreshThrottlingDate](self, "_refreshThrottlingDate"));
  if ([v14 compare:v15] == (id)1)
  {
    [v4 throttlingInterval];
    double v17 = v16;
    if (v16 != 0.0)
    {
      [v4 throttlingInterval];
      -[AMSDMultiUserController _setRefreshThrottlingDateWithTimeInterval:]( self,  "_setRefreshThrottlingDateWithTimeInterval:");
    }

    id v18 = -[AMSDBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___AMSDBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.amsaccountsd.refresh");
    id v20 = objc_msgSend((id)objc_opt_class(self, v19), "_scheduledRefreshActivityBlock");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[AMSDBackgroundActivityScheduler setActivityBlock:](v18, "setActivityBlock:", v21);

    -[AMSDBackgroundActivityScheduler setAllowBattery:](v18, "setAllowBattery:", 1LL);
    [v4 schedulingInterval];
    -[AMSDBackgroundActivityScheduler setInterval:](v18, "setInterval:");
    -[AMSDBackgroundActivityScheduler setQualityOfService:](v18, "setQualityOfService:", 17LL);
    -[AMSDBackgroundActivityScheduler setRequireNetworkConnection:](v18, "setRequireNetworkConnection:", 1LL);
    -[AMSDBackgroundActivityScheduler schedule](v18, "schedule");
    uint64_t v22 = -[AMSDRefreshMultiUserResult initWithHomes:options:]( objc_alloc(&OBJC_CLASS___AMSDRefreshMultiUserResult),  "initWithHomes:options:",  0LL,  v4);
    -[AMSDRefreshMultiUserResult setEnabledThrottling:](v22, "setEnabledThrottling:", v17 != 0.0);
    -[AMSDRefreshMultiUserResult setScheduled:](v22, "setScheduled:", 1LL);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithResult:](&OBJC_CLASS___AMSPromise, "promiseWithResult:", v22));
  }

  else
  {
    id v18 = (AMSDBackgroundActivityScheduler *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Refresh throttling is active. nextRefresh = %@",  v15));
    uint64_t v24 = AMSError(11LL, @"Refresh Throttling", v18, 0LL);
    uint64_t v22 = (AMSDRefreshMultiUserResult *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v22));
  }

  uint64_t v25 = (void *)v23;

  return v25;
}

- (AMSDCloudDataManager)cloudDataManager
{
  return self->_cloudDataManager;
}

- (AMSDHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (AMSThreadSafeObject)previousCloudContainerStatus
{
  return self->_previousCloudContainerStatus;
}

- (void)setPreviousCloudContainerStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end