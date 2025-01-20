@interface MSDServiceResolutionFlow
- (BOOL)_checkValidityOfService:(id)a3;
- (MSDServiceResolutionFlow)initWithBundleID:(id)a3 homeUserID:(id)a4 endpointID:(id)a5;
- (MSPublicDBInfo)publicInfo;
- (NSArray)servicesConfigured;
- (NSString)endpointID;
- (NSString)homeUserID;
- (NSString)serviceBundleID;
- (id)_getServiceAccountInfoForDefaultService:(id)a3 servicesConfigured:(id)a4;
- (void)_recordMissedRequest:(id)a3;
- (void)_resolveAccountForMemberAccountWithService:(id)a3 homeUserIDS:(id)a4 servicesConfigured:(id)a5 completion:(id)a6;
- (void)_resolveAccountForRemainingHomeUsers:(id)a3 servicesConfigured:(id)a4 completion:(id)a5;
- (void)_resolveAccountForSpecifiedService:(id)a3 servicesConfigured:(id)a4 completion:(id)a5;
- (void)_resolveAccountForUnspecifiedService:(id)a3 completion:(id)a4;
- (void)_resolveServiceForPrimaryUser:(id)a3 servicesConfigured:(id)a4 completion:(id)a5;
- (void)performUserAndServiceResolution:(id)a3;
- (void)resolveRecognizedUserServiceSpecified:(id)a3 completion:(id)a4;
- (void)resolveRecognizedUserServiceUnspecified:(id)a3 completion:(id)a4;
- (void)resolveUnrecognizedUserServiceSpecified:(id)a3 completion:(id)a4;
- (void)setPublicInfo:(id)a3;
- (void)setServicesConfigured:(id)a3;
- (void)updateServiceBundleIDForResolution:(id)a3;
@end

@implementation MSDServiceResolutionFlow

- (MSDServiceResolutionFlow)initWithBundleID:(id)a3 homeUserID:(id)a4 endpointID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v71.receiver = self;
  v71.super_class = (Class)&OBJC_CLASS___MSDServiceResolutionFlow;
  v12 = -[MSDServiceResolutionFlow init](&v71, "init");
  v13 = v12;
  if (!v12) {
    goto LABEL_25;
  }
  objc_storeStrong((id *)&v12->_serviceBundleID, a3);
  serviceBundleID = v13->_serviceBundleID;
  id v15 = sub_10003E9DC();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (serviceBundleID)
  {
    if (!v17) {
      goto LABEL_8;
    }
    v18 = v13->_serviceBundleID;
    *(_DWORD *)buf = 138477827;
    v73 = (NSUUID *)v18;
    v19 = "User specified service %{private}@";
    v20 = v16;
    uint32_t v21 = 12;
  }

  else
  {
    if (!v17) {
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v19 = "User did NOT specify service";
    v20 = v16;
    uint32_t v21 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_8:

  objc_storeStrong((id *)&v13->_homeUserID, a4);
  v22 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
  homeUserUUID = v13->_homeUserUUID;
  v13->_homeUserUUID = v22;

  v24 = v13->_homeUserUUID;
  id v25 = sub_10003E9DC();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (!v27) {
      goto LABEL_14;
    }
    v28 = v13->_homeUserUUID;
    *(_DWORD *)buf = 138477827;
    v73 = v28;
    v29 = "The user was recognized with HomeUserID %{private}@";
    v30 = v26;
    uint32_t v31 = 12;
  }

  else
  {
    if (!v27) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v29 = "The user is NOT recognized.";
    v30 = v26;
    uint32_t v31 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
LABEL_14:

  objc_storeStrong((id *)&v13->_endpointID, a5);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 userSettingsDefaults]);
  uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 objectForKey:@"AccessoryHomeIDKey"]);
  homeID = v13->_homeID;
  v13->_homeID = (NSString *)v34;

  v36 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v13->_homeID);
  homeUUID = v13->_homeUUID;
  v13->_homeUUID = v36;

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 userSettingsDefaults]);
  uint64_t v40 = objc_claimAutoreleasedReturnValue([v39 objectForKey:@"AccessoryUsersInAccessoryHome"]);
  usersInHome = v13->_usersInHome;
  v13->_usersInHome = (NSArray *)v40;

  v42 = v13->_usersInHome;
  if (!v42 || !-[NSArray count](v42, "count"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    v45 = (NSUUID *)objc_claimAutoreleasedReturnValue([v44 currentHome]);

    id v46 = sub_10003E9DC();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    v48 = v47;
    if (v45)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "No users cached for home: %@. Grabbing users from HomeKit and caching now",  buf,  0xCu);
      }

      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
      -[os_log_s updateCachedDataWithUsersInHome:](v48, "updateCachedDataWithUsersInHome:", v45);
    }

    else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      sub_10000A108(v48, v49, v50, v51, v52, v53, v54, v55);
    }
  }

  uint64_t v56 = objc_opt_new(&OBJC_CLASS___NSArray, v43);
  servicesConfigured = v13->_servicesConfigured;
  v13->_servicesConfigured = (NSArray *)v56;

  v58 = v13->_servicesConfigured;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  v60 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForDefaultWithCustomClass:@"privateDatabaseData"]);
  uint64_t v61 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v58, "arrayByAddingObjectsFromArray:", v60));
  v62 = v13->_servicesConfigured;
  v13->_servicesConfigured = (NSArray *)v61;

  v63 = v13->_servicesConfigured;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForDefaultWithCustomClass:@"sharedDatabaseData"]);
  uint64_t v66 = objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObjectsFromArray:](v63, "arrayByAddingObjectsFromArray:", v65));
  v67 = v13->_servicesConfigured;
  v13->_servicesConfigured = (NSArray *)v66;

  if (v13->_serviceBundleID)
  {
    uint64_t v68 = objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForBundleID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForBundleID:"));
    publicInfo = v13->_publicInfo;
    v13->_publicInfo = (MSPublicDBInfo *)v68;
  }

- (void)updateServiceBundleIDForResolution:(id)a3
{
}

- (void)performUserAndServiceResolution:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_signpost_id_t v5 = MSDGenerateSignpostID();
    id v6 = MSDSignpostFacility();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v5,  "ResolveService",  (const char *)&unk_10004C5A3,  (uint8_t *)&v26,  2u);
    }

    serviceBundleID = self->_serviceBundleID;
    servicesConfigured = self->_servicesConfigured;
    if (self->_homeUserUUID)
    {
      if (serviceBundleID) {
        -[MSDServiceResolutionFlow resolveRecognizedUserServiceSpecified:completion:]( self,  "resolveRecognizedUserServiceSpecified:completion:",  servicesConfigured,  v4);
      }
      else {
        -[MSDServiceResolutionFlow resolveRecognizedUserServiceUnspecified:completion:]( self,  "resolveRecognizedUserServiceUnspecified:completion:",  servicesConfigured,  v4);
      }
    }

    else if (serviceBundleID)
    {
      -[MSDServiceResolutionFlow resolveUnrecognizedUserServiceSpecified:completion:]( self,  "resolveUnrecognizedUserServiceSpecified:completion:",  servicesConfigured,  v4);
    }

    else
    {
      -[MSDServiceResolutionFlow resolveUnrecognizedUserServiceUnspecified:completion:]( self,  "resolveUnrecognizedUserServiceUnspecified:completion:",  servicesConfigured,  v4);
    }

    id v20 = MSDSignpostFacility();
    uint32_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    v12 = v21;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      uint64_t v22 = NSStringFromBOOL(self->_homeUserUUID != 0LL);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      uint64_t v24 = NSStringFromBOOL(self->_serviceBundleID != 0LL);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      int v26 = 138543618;
      BOOL v27 = v23;
      __int16 v28 = 2114;
      v29 = v25;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  v5,  "ResolveService",  "KnownUser=%{signpost.description:attribute,public}@ SpecifiedService=%{signpost.description:attribute,public}@",  (uint8_t *)&v26,  0x16u);
    }
  }

  else
  {
    id v11 = sub_10003E9DC();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000A13C(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)resolveRecognizedUserServiceSpecified:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, NSString *, NSString *, uint64_t, void))a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000081F8;
  v29[3] = &unk_100060A48;
  v29[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ms_objectsPassingTest:", v29));
  if ([v7 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", &stru_100060C90));
    unsigned int v9 = [v8 containsObject:self->_homeUserUUID];
    id v10 = sub_10003E9DC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        serviceBundleID = self->_serviceBundleID;
        homeUserID = self->_homeUserID;
        *(_DWORD *)buf = 138412546;
        uint32_t v31 = homeUserID;
        __int16 v32 = 2112;
        v33 = serviceBundleID;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Specified User has Service (%@, %@)",  buf,  0x16u);
      }

      if (v6) {
        v6[2](v6, self->_serviceBundleID, self->_homeUserID, 1LL, 0LL);
      }
    }

    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Specified user does not have this service, checking with others",  buf,  2u);
      }

      -[MSDServiceResolutionFlow _resolveAccountForSpecifiedService:servicesConfigured:completion:]( self,  "_resolveAccountForSpecifiedService:servicesConfigured:completion:",  v8,  v7,  v6);
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find %@ configured with any of the members",  self->_serviceBundleID));
    id v15 = sub_10003E9DC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000A170((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
    }

    publicInfo = self->_publicInfo;
    if (publicInfo)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceID](publicInfo, "serviceID"));
      -[MSDServiceResolutionFlow _recordMissedRequest:](self, "_recordMissedRequest:", v24);
    }

    if (v6)
    {
      id v25 = self->_serviceBundleID;
      uint64_t v26 = MSErrorDomain;
      uint64_t v34 = MSUserInfoErrorStringKey;
      v35 = v8;
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  5LL,  v27));
      ((void (**)(id, NSString *, NSString *, uint64_t, void *))v6)[2](v6, v25, 0LL, 0LL, v28);
    }
  }
}

- (void)resolveUnrecognizedUserServiceSpecified:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000084EC;
  v24[3] = &unk_100060A48;
  v24[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ms_objectsPassingTest:", v24));
  if ([v7 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", &stru_100060CB0));
    -[MSDServiceResolutionFlow _resolveAccountForSpecifiedService:servicesConfigured:completion:]( self,  "_resolveAccountForSpecifiedService:servicesConfigured:completion:",  v8,  v7,  v6);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find %@ configured on device",  self->_serviceBundleID));
    id v9 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000A170((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
    }

    publicInfo = self->_publicInfo;
    if (publicInfo)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSPublicDBInfo serviceID](publicInfo, "serviceID"));
      -[MSDServiceResolutionFlow _recordMissedRequest:](self, "_recordMissedRequest:", v18);
    }

    if (v6)
    {
      serviceBundleID = self->_serviceBundleID;
      uint64_t v20 = MSErrorDomain;
      uint64_t v25 = MSUserInfoErrorStringKey;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find %@ service configured with any of the members",  serviceBundleID));
      uint64_t v26 = v21;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  5LL,  v22));
      (*((void (**)(id, NSString *, void, void, void *))v6 + 2))(v6, serviceBundleID, 0LL, 0LL, v23);
    }
  }
}

- (void)_resolveAccountForSpecifiedService:(id)a3 servicesConfigured:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, NSString *, void *, uint64_t, void))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getPrimaryUserIDForAccessoryID:self->_endpointID]);

  id v13 = sub_10003E9DC();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v15)
    {
      int v23 = 138477827;
      uint64_t v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "The selected primary user is %{private}@",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v16 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v12);
  }

  else
  {
    if (v15)
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "The PrimaryUser selection maybe HomePod Account",  (uint8_t *)&v23,  2u);
    }

    uint64_t v16 = 0LL;
  }

  unsigned int v17 = objc_msgSend(v8, "na_safeContainsObject:", v16);
  id v18 = sub_10003E9DC();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v20)
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Primary User has this service",  (uint8_t *)&v23,  2u);
    }

    if (v10)
    {
      serviceBundleID = self->_serviceBundleID;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v16, "UUIDString"));
      v10[2](v10, serviceBundleID, v22, 2LL, 0LL);
    }
  }

  else
  {
    if (v20)
    {
      LOWORD(v23) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Primary User does not have this service",  (uint8_t *)&v23,  2u);
    }

    -[MSDServiceResolutionFlow _resolveAccountForMemberAccountWithService:homeUserIDS:servicesConfigured:completion:]( self,  "_resolveAccountForMemberAccountWithService:homeUserIDS:servicesConfigured:completion:",  v16,  v8,  v9,  v10);
  }
}

- (void)_resolveAccountForMemberAccountWithService:(id)a3 homeUserIDS:(id)a4 servicesConfigured:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, NSString *, void *, uint64_t, void))a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 homeOwnerUniqueIdentifier]);

  if (([v9 isEqual:v13] & 1) != 0
    || ![v10 containsObject:v13])
  {
    id v18 = sub_10003E9DC();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Owner does not have this service", buf, 2u);
    }

    id v17 = [v10 mutableCopy];
    [v17 removeObject:v13];
    if (v9) {
      [v17 removeObject:v9];
    }
    if ([v17 count])
    {
      while (1)
      {
        if (![v17 count])
        {
          id v24 = sub_10003E9DC();
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_10000A23C((uint64_t)self, v25, v26, v27, v28, v29, v30, v31);
          }

          if (v11)
          {
            serviceBundleID = self->_serviceBundleID;
            uint64_t v33 = MSErrorDomain;
            uint64_t v50 = MSUserInfoErrorStringKey;
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find %@ service configured with any of the members",  serviceBundleID));
            uint64_t v51 = v21;
            uint64_t v34 = &v51;
            v35 = &v50;
            goto LABEL_23;
          }

          goto LABEL_26;
        }

        id v20 = objc_msgSend(v17, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v17, "count"));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        usersInHome = self->_usersInHome;
        int v23 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
        LODWORD(usersInHome) = -[NSArray containsObject:](usersInHome, "containsObject:", v23);

        if ((_DWORD)usersInHome) {
          break;
        }
        [v17 removeObject:v21];
      }

      id v46 = sub_10003E9DC();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = self->_serviceBundleID;
        *(_DWORD *)buf = 138478083;
        uint64_t v53 = v48;
        __int16 v54 = 2113;
        uint64_t v55 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Using service (%{private}@) from %{private}@",  buf,  0x16u);
      }

      if (v11)
      {
        uint64_t v49 = self->_serviceBundleID;
        v44 = (void *)objc_claimAutoreleasedReturnValue([v21 UUIDString]);
        v11[2](v11, v49, v44, 4LL, 0LL);
        goto LABEL_24;
      }
    }

    else
    {
      id v36 = sub_10003E9DC();
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10000A1D4((uint64_t)self, v37, v38, v39, v40, v41, v42, v43);
      }

      if (!v11) {
        goto LABEL_26;
      }
      serviceBundleID = self->_serviceBundleID;
      uint64_t v33 = MSErrorDomain;
      uint64_t v56 = MSUserInfoErrorStringKey;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to find %@ service configured with any of the members",  serviceBundleID));
      v57 = v21;
      uint64_t v34 = &v57;
      v35 = &v56;
LABEL_23:
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v35,  1LL));
      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v33,  5LL,  v44));
      ((void (**)(id, NSString *, void *, uint64_t, void *))v11)[2](v11, serviceBundleID, 0LL, 0LL, v45);

LABEL_24:
    }

LABEL_26:
    goto LABEL_27;
  }

  id v14 = sub_10003E9DC();
  BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Owner has service", buf, 2u);
  }

  if (v11)
  {
    uint64_t v16 = self->_serviceBundleID;
    id v17 = (id)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    v11[2](v11, v16, v17, 3LL, 0LL);
    goto LABEL_26;
  }

- (void)resolveRecognizedUserServiceUnspecified:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, NSString *, uint64_t, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSDServiceResolutionFlow _getServiceAccountInfoForDefaultService:servicesConfigured:]( self,  "_getServiceAccountInfoForDefaultService:servicesConfigured:",  self->_homeUserUUID,  v6));
  if (!v8)
  {
LABEL_11:
    -[MSDServiceResolutionFlow _resolveAccountForUnspecifiedService:completion:]( self,  "_resolveAccountForUnspecifiedService:completion:",  v6,  v7);
    goto LABEL_12;
  }

  if (!-[MSDServiceResolutionFlow _checkValidityOfService:](self, "_checkValidityOfService:", v8))
  {
    id v17 = sub_10003E9DC();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "User does not have valid Apple Music subscription/Valid Service, Checking others..",  (uint8_t *)&v19,  2u);
    }

    goto LABEL_11;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceID]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIDS]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  id v15 = sub_10003E9DC();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138477827;
    id v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "User has valid service (%{private}@)",  (uint8_t *)&v19,  0xCu);
  }

  if (v7) {
    v7[2](v7, v14, self->_homeUserID, 2LL, 0LL);
  }

LABEL_12:
}

- (void)_resolveAccountForUnspecifiedService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
  id v9 = [v8 getPrimaryUserSelectionType:self->_endpointID];

  id v10 = sub_10003E9DC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Preferred user selection type: %lu",  (uint8_t *)&v18,  0xCu);
  }

  if (v9 == (id)1)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 getPrimaryUserIDForAccessoryID:self->_endpointID]);

    id v14 = sub_10003E9DC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        int v18 = 138477827;
        id v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "The selected primary user is %{private}@",  (uint8_t *)&v18,  0xCu);
      }

      id v17 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v13);
      -[MSDServiceResolutionFlow _resolveServiceForPrimaryUser:servicesConfigured:completion:]( self,  "_resolveServiceForPrimaryUser:servicesConfigured:completion:",  v17,  v6,  v7);
    }

    else
    {
      if (v16)
      {
        LOWORD(v18) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "The PrimaryUser on the device is nil",  (uint8_t *)&v18,  2u);
      }

      -[MSDServiceResolutionFlow _resolveAccountForRemainingHomeUsers:servicesConfigured:completion:]( self,  "_resolveAccountForRemainingHomeUsers:servicesConfigured:completion:",  0LL,  v6,  v7);
    }
  }

  else if (!v9 && v7)
  {
    (*((void (**)(id, void, void, uint64_t, void))v7 + 2))( v7,  kAppleMusicBundleIdentifier,  0LL,  2LL,  0LL);
  }
}

- (void)_resolveServiceForPrimaryUser:(id)a3 servicesConfigured:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *, uint64_t, void))a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MSDServiceResolutionFlow _getServiceAccountInfoForDefaultService:servicesConfigured:]( self,  "_getServiceAccountInfoForDefaultService:servicesConfigured:",  v8,  v9));
  id v12 = sub_10003E9DC();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000A2A4((uint64_t)v8, v14, v24, v25, v26, v27, v28, v29);
    }

    goto LABEL_13;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138477827;
    id v31 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Checking validity of default service for primary user %{private}@",  (uint8_t *)&v30,  0xCu);
  }

  if (!-[MSDServiceResolutionFlow _checkValidityOfService:](self, "_checkValidityOfService:", v11))
  {
LABEL_13:
    -[MSDServiceResolutionFlow _resolveAccountForRemainingHomeUsers:servicesConfigured:completion:]( self,  "_resolveAccountForRemainingHomeUsers:servicesConfigured:completion:",  v8,  v9,  v10);
    goto LABEL_14;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 service]);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceID]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfoForServiceID:]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfoForServiceID:",  v17));

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIDS]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

  id v21 = sub_10003E9DC();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138477827;
    id v31 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "User has valid service (%{private}@)",  (uint8_t *)&v30,  0xCu);
  }

  if (v10)
  {
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v10[2](v10, v20, v23, 2LL, 0LL);
  }

LABEL_14:
}

- (void)_resolveAccountForRemainingHomeUsers:(id)a3 servicesConfigured:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 homeOwnerUniqueIdentifier]);

  unsigned __int8 v13 = [v8 isEqual:v12];
  id v14 = sub_10003E9DC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) != 0)
  {
    id v57 = v10;
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Primary User's belongs to owner", buf, 2u);
    }

- (id)_getServiceAccountInfoForDefaultService:(id)a3 servicesConfigured:(id)a4
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100009BA0;
  v14[3] = &unk_100060D00;
  id v5 = a3;
  id v15 = v5;
  id v6 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100009C20;
  v11[3] = &unk_100060D28;
  id v12 = v5;
  id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v14));
  id v7 = v13;
  id v8 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_firstObjectPassingTest:", v11));

  return v9;
}

- (BOOL)_checkValidityOfService:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 service]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  unsigned int v7 = [v6 isEqualToString:kAppleMusicServiceIdentifier];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 homeUserID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForDefault:kOverrideAppleMusicSubscriptionStatus]);

    if (v10
      && (([v10 containsObject:kOverrideAppleMusicSubscriptionStatusAllUsers] & 1) != 0
       || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]),
           unsigned __int8 v12 = [v10 containsObject:v11],
           v11,
           (v12 & 1) != 0)))
    {
      LOBYTE(v13) = 0;
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
      unsigned int v13 = [v14 getAllowiTunesAccountSetting:v8];

      id v15 = sub_10003E9DC();
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = @"NO";
        if (v13) {
          id v17 = @"YES";
        }
        int v20 = 138412546;
        id v21 = v17;
        __int16 v22 = 2112;
        int v23 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "UseInHome Setting value: %@ for User: %@",  (uint8_t *)&v20,  0x16u);
      }

      if (v13)
      {
        int v18 = -[MSDAccount initWithHomeUserIdentifier:]( objc_alloc(&OBJC_CLASS___MSDAccount),  "initWithHomeUserIdentifier:",  v8);
        LOBYTE(v13) = -[MSDAccount hasValidSubscription](v18, "hasValidSubscription");
      }
    }
  }

  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)_recordMissedRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = mach_absolute_time();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v10[0] = v3;
  v9[0] = kMissedServiceRequestServiceKey;
  v9[1] = kMissedServiceRequestTimeLastRequestedKey;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v4));
  v9[2] = kMissedServiceRequestDateLastRequestedKey;
  v10[1] = v6;
  v10[2] = v5;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  [v8 setObject:v7 forDefault:kMissedServiceRequestKey];
}

- (NSString)serviceBundleID
{
  return self->_serviceBundleID;
}

- (NSString)homeUserID
{
  return self->_homeUserID;
}

- (NSString)endpointID
{
  return self->_endpointID;
}

- (NSArray)servicesConfigured
{
  return self->_servicesConfigured;
}

- (void)setServicesConfigured:(id)a3
{
}

- (MSPublicDBInfo)publicInfo
{
  return self->_publicInfo;
}

- (void)setPublicInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end