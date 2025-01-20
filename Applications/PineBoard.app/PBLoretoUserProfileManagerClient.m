@interface PBLoretoUserProfileManagerClient
- (BOOL)_canObserveProfiles;
- (BOOL)_preflightServiceAccessForPermission:(id)a3;
- (BOOL)_preflightServiceAccessForPermission:(id)a3 allowAccessDuringMigration:(BOOL)a4 logErrors:(BOOL)a5 error:(id *)a6;
- (BOOL)_preflightServiceAccessForPermission:(id)a3 error:(id *)a4;
- (BOOL)canAddNewUserWithType:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PBLoretoUserProfileManagerClient)initWithRecord:(id)a3;
- (PBLoretoUserProfileManagerClientRecord)record;
- (PBSGroupRecommendationsSession)groupRecommendationsSession;
- (PBSUserProfileManagerClientInterface)delegate;
- (PBSUserProfilesSnapshot)userProfilesSnapshot;
- (id)_service;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)beginIgnoringUserProfileAccountNotifications;
- (void)createUserProfileWithAttributes:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)effectiveUserProfileWithHomeUserIdentifier:(id)a3 completionHandler:(id)a4;
- (void)endIgnoringUserProfileAccountNotifications;
- (void)fetchGroupRecommendationsSessionWithCompletionHandler:(id)a3;
- (void)fetchUserProfilesSnapshotWithCompletionHandler:(id)a3;
- (void)handleUserProfileAccountNotification:(id)a3;
- (void)invalidate;
- (void)removeUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)selectUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateGroupRecommendationsConsent:(id)a3 forUserProfileWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateGroupRecommendationsSessionWithUserIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 completionHandler:(id)a5;
- (void)userProfileManager:(id)a3 didUpdateGroupRecommendationsSession:(id)a4;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation PBLoretoUserProfileManagerClient

- (PBLoretoUserProfileManagerClient)initWithRecord:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"PBLoretoUserProfileManagerClientRecord");
  if (!v4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100291304();
    }
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x1001EAAE8LL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBLoretoUserProfileManagerClientRecordClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100291304();
    }
    _bs_set_crash_log_message([v20 UTF8String]);
    __break(0);
    JUMPOUT(0x1001EAB4CLL);
  }

  if (([v4 isEntitled] & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[record isEntitled]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100291504();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x1001EABB0LL);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManagerClient;
  v6 = -[PBLoretoUserProfileManagerClient init](&v24, "init");
  if (v6)
  {
    v7 = (PBLoretoUserProfileManagerClientRecord *)[v4 copy];
    record = v6->_record;
    v6->_record = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 _serviceConfiguration]);
    serviceConfiguration = v6->_serviceConfiguration;
    v6->_serviceConfiguration = (PBUserProfileManagerServiceConfiguration *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileManagerServiceConfiguration service](v6->_serviceConfiguration, "service"));
    if (!v12)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_serviceConfiguration service]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1002913B4();
      }
      _bs_set_crash_log_message([v22 UTF8String]);
      __break(0);
      JUMPOUT(0x1001EAC14LL);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserProfileManagerServiceConfiguration queue](v6->_serviceConfiguration, "queue"));

    if (!v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_serviceConfiguration queue]"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10029145C();
      }
      _bs_set_crash_log_message([v23 UTF8String]);
      __break(0);
      JUMPOUT(0x1001EAC78LL);
    }

    unsigned int v14 = -[PBLoretoUserProfileManagerClient _canObserveProfiles](v6, "_canObserveProfiles");
    id v15 = sub_1001EAC80();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client is entitled to access user profiles. Adding observer. {client=%@}",  buf,  0xCu);
      }

      [v9 addObserver:v6];
    }

    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Client is not entitled to access user profiles. Will not add observer. {client=%@}",  buf,  0xCu);
      }
    }
  }

  return v6;
}

- (void)dealloc
{
  if (self->_serviceConfiguration)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_serviceConfiguration == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002915AC();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

  else
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManagerClient;
    -[PBLoretoUserProfileManagerClient dealloc](&v3, "dealloc");
  }

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)(id)objc_claimAutoreleasedReturnValue( -[PBUserProfileManagerServiceConfiguration queue]( self->_serviceConfiguration,  "queue"));
}

- (void)invalidate
{
  serviceConfiguration = self->_serviceConfiguration;
  self->_serviceConfiguration = 0LL;

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  [v4 removeObserver:self];
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClient succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClient descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClientRecord succinctDescription](self->_record, "succinctDescription"));
  id v5 = [v3 appendObject:v4 withName:@"record"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoUserProfileManagerClient descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  id v5 = [v4 appendObject:self->_record withName:@"record"];
  return v4;
}

- (PBSUserProfilesSnapshot)userProfilesSnapshot
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001EAC80();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received user profiles snapshot request. {client=%@}",  (uint8_t *)&v9,  0xCu);
  }

  if (-[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:]( self,  "_preflightServiceAccessForPermission:",  &stru_1003D9F48))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    v7 = (PBSUserProfilesSnapshot *)objc_claimAutoreleasedReturnValue([v6 userProfilesSnapshot]);
  }

  else
  {
    v7 = -[PBSUserProfilesSnapshot initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:]( objc_alloc(&OBJC_CLASS___PBSUserProfilesSnapshot),  "initWithUserProfiles:primaryProfileIdentifier:selectedProfileIdentifier:",  &__NSDictionary0__struct,  0LL,  0LL);
  }

  return v7;
}

- (void)fetchUserProfilesSnapshotWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001EAC80();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received fetch user profiles snapshot request. {client=%@}",  buf,  0xCu);
  }

  id v12 = 0LL;
  unsigned int v8 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F48,  &v12);
  id v9 = v12;
  uint64_t v10 = 0LL;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 userProfilesSnapshot]);
  }

  if (v4) {
    v4[2](v4, v10, v9);
  }
}

- (PBSGroupRecommendationsSession)groupRecommendationsSession
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001EAC80();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received group recommendations session request. {client=%@}",  (uint8_t *)&v9,  0xCu);
  }

  if (-[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:]( self,  "_preflightServiceAccessForPermission:",  &stru_1003D9F48))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 groupRecommendationsSession]);
  }

  else
  {
    v7 = 0LL;
  }

  return (PBSGroupRecommendationsSession *)v7;
}

- (void)fetchGroupRecommendationsSessionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001EAC80();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v14 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received fetch group recommendations session request. {client=%@}",  buf,  0xCu);
  }

  id v12 = 0LL;
  unsigned int v8 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F48,  &v12);
  id v9 = v12;
  uint64_t v10 = 0LL;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 groupRecommendationsSession]);
  }

  if (v4) {
    v4[2](v4, v10, v9);
  }
}

- (void)selectUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001EAC80();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Received select user profile request. {client=%@, userProfileIdentifier=%{public}@}",  buf,  0x16u);
  }

  id v14 = 0LL;
  unsigned int v11 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003DA010,  &v14);
  id v12 = v14;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v13 selectUserProfileWithIdentifier:v6 completionHandler:v7];
  }

  else if (v7)
  {
    v7[2](v7, &__kCFBooleanFalse, v12);
  }
}

- (BOOL)canAddNewUserWithType:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001EAC80();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2048;
    id v14 = [v4 integerValue];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received can add new user request. {client=%@, userProfileType=%ld}",  (uint8_t *)&v11,  0x16u);
  }

  if (-[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:]( self,  "_preflightServiceAccessForPermission:",  &stru_1003D9F48))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    unsigned __int8 v9 = [v8 canAddNewUserWithType:v4];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)createUserProfileWithAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  unsigned int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001EAC80();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Received create user profile request. {client=%@, attributes=%@}",  buf,  0x16u);
  }

  id v14 = 0LL;
  unsigned int v11 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F70,  &v14);
  id v12 = v14;
  if (v11)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v13 createUserProfileWithAttributes:v6 completionHandler:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v12);
  }
}

- (void)updateUserProfileWithIdentifier:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001EAC80();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Received update user profile request. {client=%@, userProfileIdentifier=%{public}@, attributes=%@}",  buf,  0x20u);
  }

  id v17 = 0LL;
  unsigned int v14 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F70,  &v17);
  id v15 = v17;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v16 updateUserProfileWithIdentifier:v8 attributes:v9 completionHandler:v10];
  }

  else if (v10)
  {
    v10[2](v10, 0LL, v15);
  }
}

- (void)removeUserProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001EAC80();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Received remove user profile request. {client=%@, userProfileIdentifier=%{public}@}",  buf,  0x16u);
  }

  id v14 = 0LL;
  unsigned int v11 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F70,  &v14);
  id v12 = v14;
  if (v11)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v13 removeUserProfileWithIdentifier:v6 completionHandler:v7];
  }

  else if (v7)
  {
    v7[2](v7, &__kCFBooleanFalse, v12);
  }
}

- (void)effectiveUserProfileWithHomeUserIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001EAC80();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Received effective user profile for home user identifier request. {client=%@, homeUserIdentifier=%{public}@}",  buf,  0x16u);
  }

  id v14 = 0LL;
  unsigned int v11 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F48,  &v14);
  id v12 = v14;
  if (v11)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v13 effectiveUserProfileWithHomeUserIdentifier:v6 completionHandler:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v12);
  }
}

- (void)updateGroupRecommendationsConsent:(id)a3 forUserProfileWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  id v12 = sub_1001EAC80();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2048;
    id v23 = [v8 integerValue];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Received update group recommendations consent for user. {client=%@, identifier=%{public}@, consent=%ld}",  buf,  0x20u);
  }

  id v17 = 0LL;
  unsigned int v14 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9F98,  &v17);
  id v15 = v17;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v16 updateGroupRecommendationsConsent:v8 forUserProfileWithIdentifier:v9 completionHandler:v10];
  }

  else if (v10)
  {
    v10[2](v10, 0LL, v15);
  }
}

- (void)updateGroupRecommendationsSessionWithUserIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  id v9 = sub_1001EAC80();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Received update group recommendations session. {client=%@, userIdentifiers=%{public}@}",  buf,  0x16u);
  }

  id v14 = 0LL;
  unsigned int v11 = -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  &stru_1003D9FC0,  &v14);
  id v12 = v14;
  if (v11)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v13 updateGroupRecommendationsSessionWithUserIdentifiers:v6 completionHandler:v7];
  }

  else if (v7)
  {
    v7[2](v7, 0LL, v12);
  }
}

- (void)beginIgnoringUserProfileAccountNotifications
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001EAC80();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received begin ignoring user profile account notifications request. {client=%@}",  (uint8_t *)&v7,  0xCu);
  }

  if (-[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:]( self,  "_preflightServiceAccessForPermission:",  &stru_1003D9F70))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v6 beginIgnoringUserProfileAccountNotifications];
  }

- (void)endIgnoringUserProfileAccountNotifications
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = sub_1001EAC80();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Received end ignoring user profile account notifications request. {client=%@}",  (uint8_t *)&v7,  0xCu);
  }

  if (-[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:]( self,  "_preflightServiceAccessForPermission:",  &stru_1003D9F70))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v6 endIgnoringUserProfileAccountNotifications];
  }

- (void)handleUserProfileAccountNotification:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001EAC80();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Received handle user profile account notification request. {client=%@, notification=%@}",  (uint8_t *)&v9,  0x16u);
  }

  if (-[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:]( self,  "_preflightServiceAccessForPermission:",  &stru_1003D9FE8))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient _service](self, "_service"));
    [v8 handleUserProfileAccountNotification:v4];
  }
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  id v4 = sub_1001EAC80();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100291654((uint64_t)self, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient delegate](self, "delegate"));
  [v12 userProfileManagerDidUpdate];
}

- (void)userProfileManager:(id)a3 didUpdateGroupRecommendationsSession:(id)a4
{
  id v5 = a4;
  id v6 = sub_1001EAC80();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1002916BC((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoUserProfileManagerClient delegate](self, "delegate"));
  [v14 userProfileManagerDidUpdateGroupRecommendationsSession:v5];
}

- (id)_service
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBUserProfileManagerServiceConfiguration service]( self->_serviceConfiguration,  "service"));
}

- (BOOL)_preflightServiceAccessForPermission:(id)a3
{
  return -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:error:]( self,  "_preflightServiceAccessForPermission:error:",  a3,  0LL);
}

- (BOOL)_preflightServiceAccessForPermission:(id)a3 error:(id *)a4
{
  return -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:allowAccessDuringMigration:logErrors:error:]( self,  "_preflightServiceAccessForPermission:allowAccessDuringMigration:logErrors:error:",  a3,  0LL,  1LL,  a4);
}

- (BOOL)_canObserveProfiles
{
  return -[PBLoretoUserProfileManagerClient _preflightServiceAccessForPermission:allowAccessDuringMigration:logErrors:error:]( self,  "_preflightServiceAccessForPermission:allowAccessDuringMigration:logErrors:error:",  &stru_1003D9F48,  1LL,  0LL,  0LL);
}

- (BOOL)_preflightServiceAccessForPermission:(id)a3 allowAccessDuringMigration:(BOOL)a4 logErrors:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  p_record = &self->_record;
  uint64_t v12 = self->_record;
  uint64_t v13 = (*((uint64_t (**)(id, PBLoretoUserProfileManagerClientRecord *))a3 + 2))(a3, v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if ([v14 isAllowed])
  {
    if (a4
      || !-[PBUserProfileManagerServiceConfiguration isMigratingProfiles]( self->_serviceConfiguration,  "isMigratingProfiles"))
    {
      id v18 = 0LL;
      BOOL v24 = 1;
      if (!a6) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }

    if (v7)
    {
      id v15 = sub_100084680();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100291724(v16);
      }
    }

    uint64_t v17 = PBSUserProfileServiceMigratingProfilesError();
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  else
  {
    if (v7)
    {
      id v19 = sub_1001EAC80();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100291764((id *)p_record, v14, v20);
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 entitlement]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"User profile manager client is missing required entitlement. {entitlement=%@}",  v21));

    uint64_t v23 = PBSUserProfileServiceErrorForCodeWithDebugDescription(102LL, v22);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v23);
  }

  BOOL v24 = 0;
  if (a6) {
LABEL_15:
  }
    *a6 = v18;
LABEL_16:

  return v24;
}

- (PBSUserProfileManagerClientInterface)delegate
{
  return (PBSUserProfileManagerClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBLoretoUserProfileManagerClientRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
}

@end