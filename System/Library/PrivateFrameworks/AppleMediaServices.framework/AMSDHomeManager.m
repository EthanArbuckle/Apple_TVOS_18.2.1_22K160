@interface AMSDHomeManager
+ (id)homeIdentifierForRecord:(id)a3;
+ (id)homeIdentifierForRecordZone:(id)a3 inDatabase:(id)a4;
+ (id)homeUserIdentifierForRecord:(id)a3;
+ (id)homeUserIdentifierForRecordZone:(id)a3 inDatabase:(id)a4;
+ (id)identifiersForRecord:(id)a3;
+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4;
+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4 qualityOfService:(int64_t)a5;
+ (unint64_t)multiUserStatusForHomeUser:(id)a3 inHome:(id)a4;
- (AMSDHome)currentHome;
- (AMSDHomeManager)initWithDataSource:(id)a3;
- (AMSDHomeManagerDataSource)dataSource;
- (AMSDHomeUser)preferredMediaUser;
- (AMSDHomeUser)primaryUser;
- (AMSPromise)allHomes;
- (id)homeForRecord:(id)a3;
- (id)homeForRecordZone:(id)a3 inDatabase:(id)a4;
- (id)homeWithHomeIdentifier:(id)a3;
- (id)sendCloudDataRepairRequestToHomeUser:(id)a3 inContainer:(id)a4;
- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5;
- (id)settingForKeyPath:(id)a3;
- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5;
- (void)registerToAcceptCloudSharesForContainers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)teardownMultiUser;
@end

@implementation AMSDHomeManager

- (id)homeForRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);
  unsigned __int8 v6 = [v5 isEqualToString:@"AMSHomeParticipant"];

  if ((v6 & 1) != 0)
  {
    id v8 = objc_msgSend((id)objc_opt_class(self, v7), "homeIdentifierForRecord:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (!v9)
    {
      uint64_t v13 = AMSError(2LL, @"Invalid Parameter", @"The record has a nil or invalid home identifier.", 0LL);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v14));

      goto LABEL_7;
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[AMSDHomeManager homeWithHomeIdentifier:](self, "homeWithHomeIdentifier:", v9));
  }

  else
  {
    uint64_t v11 = AMSError(2LL, @"Invalid Parameter", @"The record must be of type HomeParticipant.", 0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[AMSPromise promiseWithError:](&OBJC_CLASS___AMSPromise, "promiseWithError:", v9));
  }

  v12 = (void *)v10;
LABEL_7:

  return v12;
}

- (id)homeForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v7]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100024570;
  v11[3] = &unk_1000D6818;
  v11[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 thenWithBlock:v11]);

  return v9;
}

+ (id)homeIdentifierForRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 fieldForKey:@"AMSHomeParticipant_HomeIdentifier"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  if (v6) {
    uint64_t v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

+ (id)homeIdentifierForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v7]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000246CC;
  v11[3] = &unk_1000D6C10;
  v11[4] = a1;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 thenWithBlock:v11]);

  return v9;
}

+ (id)homeUserIdentifierForRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 fieldForKey:@"AMSHomeParticipant_HomeUserIdentifier"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  if (v6) {
    uint64_t v7 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  }
  else {
    uint64_t v7 = 0LL;
  }

  return v7;
}

+ (id)homeUserIdentifierForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v7]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000248EC;
  v11[3] = &unk_1000D6C10;
  v11[4] = a1;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 thenWithBlock:v11]);

  return v9;
}

+ (id)identifiersForRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 homeIdentifierForRecord:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 homeUserIdentifierForRecord:v4]);

  uint64_t v7 = 0LL;
  if (v5 && v6) {
    uint64_t v7 = -[AMSPair initWithFirst:second:](objc_alloc(&OBJC_CLASS___AMSPair), "initWithFirst:second:", v5, v6);
  }

  return v7;
}

+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "identifiersForRecordZone:inDatabase:qualityOfService:", v7, v6, 9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

+ (id)identifiersForRecordZone:(id)a3 inDatabase:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v8 fetchRecordWithName:@"AMSHomeParticipant" zoneIdentifier:v9 qualityOfService:a5]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100024B7C;
  v13[3] = &unk_1000D6C10;
  v13[4] = a1;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 thenWithBlock:v13]);

  return v11;
}

+ (unint64_t)multiUserStatusForHomeUser:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isMultiUserEnabled] & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v13) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    uint64_t v16 = objc_opt_class(a1, v15);
    uint64_t v18 = AMSLogKey(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = AMSHashIfNeeded(v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = AMSHashIfNeeded(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    int v32 = 138544130;
    uint64_t v33 = v16;
    __int16 v34 = 2114;
    v35 = v19;
    __int16 v36 = 2114;
    v37 = v21;
    __int16 v38 = 2114;
    v39 = v23;
    v24 = "%{public}@: [%{public}@] Multi-user isn't enabled. home = %{public}@ | user = %{public}@";
    goto LABEL_17;
  }

  if (([v7 isCurrentDeviceAccessory] & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
    if (!v13) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    uint64_t v26 = objc_opt_class(a1, v25);
    uint64_t v28 = AMSLogKey(v26, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v28);
    uint64_t v29 = AMSHashIfNeeded(v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v30 = AMSHashIfNeeded(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v30);
    int v32 = 138544130;
    uint64_t v33 = v26;
    __int16 v34 = 2114;
    v35 = v19;
    __int16 v36 = 2114;
    v37 = v21;
    __int16 v38 = 2114;
    v39 = v23;
    v24 = "%{public}@: [%{public}@] Multi-user is disabled. The current device isn't an accessory of the home. home = %{p"
          "ublic}@ | user = %{public}@";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v32, 0x2Au);

LABEL_18:
    goto LABEL_19;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned __int8 v9 = [v7 isRestrictedGuestUserIdentifier:v8];

  if ((v9 & 1) != 0)
  {
LABEL_19:
    unint64_t v12 = 1LL;
    goto LABEL_20;
  }

  id v10 = [v7 mediaProfileEnabledForUser:v6];
  uint64_t v11 = 1LL;
  if (v10 == (id)2) {
    uint64_t v11 = 2LL;
  }
  if (v10) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = 0LL;
  }
LABEL_20:

  return v12;
}

- (AMSDHomeManager)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSDHomeManager;
  id v6 = -[AMSDHomeManager init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (void)teardownMultiUser
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___AMSDHomeKitDataSource, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
    [v7 teardownMultiUser];
  }

  -[AMSDHomeManager setDataSource:](self, "setDataSource:", 0LL);
}

- (AMSPromise)allHomes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allHomes]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 thenWithBlock:&stru_1000D6C50]);

  return (AMSPromise *)v4;
}

- (AMSDHome)currentHome
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentHome]);

  return (AMSDHome *)v3;
}

- (AMSDHomeUser)preferredMediaUser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredMediaUser]);

  return (AMSDHomeUser *)v3;
}

- (AMSDHomeUser)primaryUser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 primaryUser]);

  return (AMSDHomeUser *)v3;
}

- (id)homeWithHomeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager allHomes](self, "allHomes"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002516C;
  v9[3] = &unk_1000D5F28;
  id v10 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 thenWithBlock:v9]);

  return v7;
}

- (void)registerToAcceptCloudSharesForContainers:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  [v5 registerToAcceptCloudSharesForContainers:v4];
}

- (id)sendCloudDataRepairRequestToHomeUser:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 sendCloudDataRepairRequestToHomeUser:v7 inContainer:v6]);

  return v9;
}

- (id)sendCloudShare:(id)a3 inContainer:(id)a4 toOwnerOfHome:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sendCloudShare:v10 inContainer:v9 toOwnerOfHome:v8]);

  return v12;
}

- (id)settingForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 settingForKeyPath:v4]);

  return v6;
}

- (id)settingForKeyPath:(id)a3 user:(id)a4 home:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeManager dataSource](self, "dataSource"));
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 settingForKeyPath:v10 user:v9 home:v8]);

  return v12;
}

- (AMSDHomeManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end