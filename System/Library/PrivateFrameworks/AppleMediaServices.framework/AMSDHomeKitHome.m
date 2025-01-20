@interface AMSDHomeKitHome
- (AMSDHomeKitDataSource)dataSource;
- (AMSDHomeKitHome)initWithHome:(id)a3 dataSource:(id)a4;
- (AMSDHomeUser)currentUser;
- (AMSDHomeUser)owner;
- (BOOL)isCurrentDeviceAccessory;
- (BOOL)isCurrentUserOwner;
- (BOOL)isCurrentUserRestrictedGuest;
- (BOOL)isMultiUserEnabled;
- (BOOL)isPrimary;
- (BOOL)isRestrictedGuestUserIdentifier:(id)a3;
- (HMHome)home;
- (NSArray)users;
- (NSString)hashedDescription;
- (NSString)name;
- (NSUUID)identifier;
- (id)listeningHistoryUpdateEnabledForUser:(id)a3;
- (id)userWithIdentifier:(id)a3;
- (unint64_t)mediaProfileEnabledForUser:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation AMSDHomeKitHome

- (AMSDHomeKitHome)initWithHome:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSDHomeKitHome;
  v9 = -[AMSDHomeKitHome init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a4);
    objc_storeStrong((id *)&v10->_home, a3);
  }

  return v10;
}

- (NSString)hashedDescription
{
  uint64_t v21 = objc_opt_class(self, a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome name](self, "name"));
  uint64_t v3 = AMSHashIfNeeded(v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome identifier](self, "identifier"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[AMSDHomeKitHome isPrimary](self, "isPrimary")) {
    id v7 = @"true";
  }
  else {
    id v7 = @"false";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome owner](self, "owner"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v10 = AMSHashIfNeeded(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome currentUser](self, "currentUser"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
  uint64_t v14 = AMSHashIfNeeded(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unsigned int v16 = -[AMSDHomeKitHome isCurrentUserOwner](self, "isCurrentUserOwner");
  v17 = @"true";
  if (!v16) {
    v17 = @"false";
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p name = %@ | homeIdentifier = %@ | isPrimary = %@ | owner = %@ | currentUser = %@ | isCurrentUserOwner = %@>",  v21,  self,  v20,  v6,  v7,  v11,  v15,  v17));

  return (NSString *)v18;
}

- (BOOL)isCurrentDeviceAccessory
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDeviceIsAccessoryForHome:v4]);
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isCurrentUserOwner
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome currentUser](self, "currentUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome owner](self, "owner"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned __int8 v7 = [v4 isEqual:v6];

  return v7;
}

- (AMSDHomeUser)currentUser
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___AMSDHomeKitHomeUser);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentUser]);
  unsigned __int8 v6 = -[AMSDHomeKitHomeUser initWithUser:](v3, "initWithUser:", v5);

  return (AMSDHomeUser *)v6;
}

- (NSUUID)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);

  return (NSUUID *)v3;
}

- (BOOL)isPrimary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  unsigned __int8 v3 = [v2 isPrimary];

  return v3;
}

- (BOOL)isMultiUserEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  unsigned __int8 v3 = [v2 isMultiUserEnabled];

  return v3;
}

- (NSString)name
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);

  return (NSString *)v3;
}

- (AMSDHomeUser)owner
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 owner]);

  if (v3) {
    v4 = -[AMSDHomeKitHomeUser initWithUser:](objc_alloc(&OBJC_CLASS___AMSDHomeKitHomeUser), "initWithUser:", v3);
  }
  else {
    v4 = 0LL;
  }

  return (AMSDHomeUser *)v4;
}

- (NSArray)users
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 allUsersInHome:v4]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_mapWithTransform:", &stru_1000D6BF0));

  return (NSArray *)v6;
}

- (BOOL)isRestrictedGuestUserIdentifier:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome userWithIdentifier:](self, "userWithIdentifier:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome home](self, "home"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 user]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 homeAccessControlForUser:v6]);

  LOBYTE(v5) = [v7 isRestrictedGuest];
  return (char)v5;
}

- (BOOL)isCurrentUserRestrictedGuest
{
  v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome currentUser](self, "currentUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  LOBYTE(v2) = -[AMSDHomeKitHome isRestrictedGuestUserIdentifier:](v2, "isRestrictedGuestUserIdentifier:", v4);

  return (char)v2;
}

- (unint64_t)mediaProfileEnabledForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome identifier](self, "identifier"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 homeWithIdentifier:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resultWithError:0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allUsersInHome:v8]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100023A3C;
  v23[3] = &unk_1000D6AA8;
  id v11 = v4;
  id v24 = v11;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_firstObjectPassingTest:", v23));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  id v14 = [v13 mediaProfileEnabledForUser:v12 home:v8];

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v15) {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class(self, v17);
      uint64_t v20 = AMSLogKey(v18, v19);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v18;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to determine if a user's media profile is enabled.",  buf,  0x16u);
    }
  }

  return (unint64_t)v14;
}

- (id)userWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome users](self, "users"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100023B40;
  v9[3] = &unk_1000D5ED8;
  id v10 = v4;
  id v6 = v4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_firstObjectPassingTest:", v9));

  return v7;
}

- (id)listeningHistoryUpdateEnabledForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome identifier](self, "identifier"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 homeWithIdentifier:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 resultWithError:0]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allUsersInHome:v8]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100023CC0;
  v16[3] = &unk_1000D6AA8;
  id v17 = v4;
  id v11 = v4;
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_firstObjectPassingTest:", v16));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDHomeKitHome dataSource](self, "dataSource"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 listeningHistoryUpdateEnabledForUser:v12 home:v8]);

  return v14;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (AMSDHomeKitDataSource)dataSource
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