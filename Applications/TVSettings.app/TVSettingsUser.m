@interface TVSettingsUser
+ (id)keyPathsForValuesAffectingIsPrimaryiCloudAccount;
+ (id)keyPathsForValuesAffectingName;
- (ACAccountStore)accountStore;
- (AMSBag)amsBag;
- (BOOL)canBeRemoved;
- (BOOL)canSignOutOfiCloud;
- (BOOL)canSignOutOfiTunes;
- (BOOL)hasAllAccounts;
- (BOOL)hasGameCenterAccount;
- (BOOL)hasiCloudAccount;
- (BOOL)hasiTunesAccount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (BOOL)isPrimaryiCloudAccount;
- (NSSet)accountIdentifiers;
- (NSString)gameCenterUsername;
- (NSString)iCloudUsername;
- (NSString)iTunesUsername;
- (NSString)identifier;
- (NSString)name;
- (NSString)shortName;
- (PBSUserProfile)userProfile;
- (TVSettingsAccountsFacadePasswordSetting)passwordSetting;
- (TVSettingsUser)initWithUserProfile:(id)a3 amsBag:(id)a4;
- (id)description;
- (int64_t)_groupRecommendationsConsentFromPBSConsent:(int64_t)a3;
- (int64_t)badgeCount;
- (int64_t)groupRecommendationsConsent;
- (int64_t)profileType;
- (unint64_t)hash;
- (void)_refreshGroupRecommendationsConsent;
- (void)_updateWithUserProfile:(id)a3 postKVONotifications:(BOOL)a4;
- (void)setAccountStore:(id)a3;
- (void)setAmsBag:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
- (void)setGroupRecommendationsConsent:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsUpdatingGroupRecommendationsConsent:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProfileType:(int64_t)a3;
- (void)updateWithUserProfile:(id)a3;
@end

@implementation TVSettingsUser

- (TVSettingsUser)initWithUserProfile:(id)a3 amsBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsUser;
  v9 = -[TVSettingsUser init](&v15, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v9->_accountStore;
    v9->_accountStore = (ACAccountStore *)v10;

    objc_storeStrong((id *)&v9->_amsBag, a4);
    objc_storeStrong((id *)&v9->_userProfile, a3);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v7 identifier]);
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;

    v9->_profileType = (int64_t)[v7 type];
    v9->_isPrimary = [v7 type] == 0;
    *(_WORD *)&v9->_canSignOutOfiCloud = 256;
    -[TVSettingsUser _updateWithUserProfile:postKVONotifications:]( v9,  "_updateWithUserProfile:postKVONotifications:",  v7,  0LL);
  }

  return v9;
}

- (void)updateWithUserProfile:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if ([v5 isEqualToString:self->_identifier])
  {
    id v6 = [v4 type];
    int64_t profileType = self->_profileType;

    if (v6 == (id)profileType)
    {
      -[TVSettingsUser _updateWithUserProfile:postKVONotifications:]( self,  "_updateWithUserProfile:postKVONotifications:",  v4,  1LL);
      goto LABEL_9;
    }
  }

  else
  {
  }

  if (qword_1001E1948 != -1) {
    dispatch_once(&qword_1001E1948, &stru_1001925A8);
  }
  id v8 = (void *)qword_1001E1940;
  if (os_log_type_enabled((os_log_t)qword_1001E1940, OS_LOG_TYPE_ERROR))
  {
    identifier = self->_identifier;
    uint64_t v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    int64_t v12 = self->_profileType;
    int v13 = 138544130;
    v14 = identifier;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    int64_t v18 = v12;
    __int16 v19 = 2048;
    id v20 = [v4 type];
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Cannot update a user's profile to another user's profile. {currentIdentifier=%{public}@, newIdentifier=%{public}@, currentType=%ld, newType=%ld}",  (uint8_t *)&v13,  0x2Au);
  }

- (void)setIsUpdatingGroupRecommendationsConsent:(BOOL)a3
{
  if (a3) {
    -[TVSettingsUser setGroupRecommendationsConsent:](self, "setGroupRecommendationsConsent:");
  }
  else {
    -[TVSettingsUser _refreshGroupRecommendationsConsent](self, "_refreshGroupRecommendationsConsent");
  }
}

+ (id)keyPathsForValuesAffectingName
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"badgeCount");
}

- (void)setName:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:self->_name] & 1) == 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___PBSUpdateUserProfileAttributes);
    if ([v4 length])
    {
      [v5 setOverrideName:v4];
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      [v5 setOverrideName:v6];
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSUserProfile identifier](self->_userProfile, "identifier"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10008DBE8;
    v9[3] = &unk_10018F9F8;
    v9[4] = self;
    [v7 updateUserProfileWithIdentifier:v8 attributes:v5 completionHandler:v9];
  }
}

+ (id)keyPathsForValuesAffectingIsPrimaryiCloudAccount
{
  v5[0] = @"isPrimary";
  v5[1] = @"hasiCloudAccount";
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (BOOL)isPrimaryiCloudAccount
{
  BOOL v3 = -[TVSettingsUser isPrimary](self, "isPrimary");
  if (v3) {
    LOBYTE(v3) = -[TVSettingsUser hasiCloudAccount](self, "hasiCloudAccount");
  }
  return v3;
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@>",  v5,  self->_identifier));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TVSettingsUser *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsUser identifier](v4, "identifier"));
      unsigned __int8 v7 = [v6 isEqual:self->_identifier];
    }

    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)_updateWithUserProfile:(id)a3 postKVONotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned __int8 v10 = [v9 isEqualToString:self->_identifier];

  if ((v10 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[[userProfile identifier] isEqualToString:_identifier]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F9880(a2);
    }
LABEL_12:
    _bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
    JUMPOUT(0x10008E1C0LL);
  }

  if ([v8 type] != (id)self->_profileType)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[userProfile type] == _profileType"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000F97C4(a2);
    }
    goto LABEL_12;
  }

  objc_storeStrong((id *)&self->_userProfile, a3);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008E228;
  v15[3] = &unk_10018E468;
  v15[4] = self;
  id v16 = v8;
  id v11 = v8;
  int64_t v12 = objc_retainBlock(v15);
  int v13 = (void (**)(void))v12;
  if (v4)
  {
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"name");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"shortName");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"iCloudUsername");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"iTunesUsername");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"gameCenterUsername");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"canBeRemoved");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"passwordSetting");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"hasiCloudAccount");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"hasiTunesAccount");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"hasGameCenterAccount");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"canSignOutOfiTunes");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"accountIdentifiers");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"groupRecommendationsConsent");
    -[TVSettingsUser willChangeValueForKey:](self, "willChangeValueForKey:", @"hasAllAccounts");
    v13[2](v13);
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"name");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"shortName");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"iCloudUsername");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"iTunesUsername");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"gameCenterUsername");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"canBeRemoved");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"passwordSetting");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"hasiCloudAccount");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"hasiTunesAccount");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"hasGameCenterAccount");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"canSignOutOfiTunes");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"accountIdentifiers");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"groupRecommendationsConsent");
    -[TVSettingsUser didChangeValueForKey:](self, "didChangeValueForKey:", @"hasAllAccounts");
  }

  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (int64_t)_groupRecommendationsConsentFromPBSConsent:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 1LL;
  }
  else {
    return 2LL;
  }
}

- (void)_refreshGroupRecommendationsConsent
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (NSString)iCloudUsername
{
  return self->_iCloudUsername;
}

- (BOOL)hasiTunesAccount
{
  return self->_hasiTunesAccount;
}

- (NSString)iTunesUsername
{
  return self->_iTunesUsername;
}

- (BOOL)hasGameCenterAccount
{
  return self->_hasGameCenterAccount;
}

- (NSString)gameCenterUsername
{
  return self->_gameCenterUsername;
}

- (NSSet)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (BOOL)hasAllAccounts
{
  return self->_hasAllAccounts;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (BOOL)canBeRemoved
{
  return self->_canBeRemoved;
}

- (BOOL)canSignOutOfiCloud
{
  return self->_canSignOutOfiCloud;
}

- (BOOL)canSignOutOfiTunes
{
  return self->_canSignOutOfiTunes;
}

- (TVSettingsAccountsFacadePasswordSetting)passwordSetting
{
  return self->_passwordSetting;
}

- (int64_t)groupRecommendationsConsent
{
  return self->_groupRecommendationsConsent;
}

- (void)setGroupRecommendationsConsent:(int64_t)a3
{
  self->_groupRecommendationsConsent = a3;
}

- (AMSBag)amsBag
{
  return self->_amsBag;
}

- (void)setAmsBag:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (int64_t)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(int64_t)a3
{
  self->_int64_t profileType = a3;
}

- (PBSUserProfile)userProfile
{
  return self->_userProfile;
}

- (void).cxx_destruct
{
}

@end