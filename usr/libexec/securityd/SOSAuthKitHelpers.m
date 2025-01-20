@interface SOSAuthKitHelpers
+ (BOOL)accountIsCDPCapable;
+ (BOOL)peerinfoHasMID:(id)a3;
+ (BOOL)updateMIDInPeerInfo:(id)a3;
+ (id)machineID;
+ (void)activeMIDs:(id)a3;
- (BOOL)isUseful;
- (BOOL)midIsValidInList:(id)a3;
- (BOOL)serialIsValidInList:(id)a3;
- (NSSet)machineIDs;
- (NSSet)midList;
- (NSSet)serialNumbers;
- (SOSAuthKitHelpers)initWithActiveMIDS:(id)a3;
- (void)setMachineIDs:(id)a3;
- (void)setMidList:(id)a3;
- (void)setSerialNumbers:(id)a3;
@end

@implementation SOSAuthKitHelpers

- (SOSAuthKitHelpers)initWithActiveMIDS:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SOSAuthKitHelpers;
  v6 = -[SOSAuthKitHelpers init](&v32, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v9 = objc_alloc_init(&OBJC_CLASS___NSSet);
    machineIDs = v6->_machineIDs;
    v6->_machineIDs = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSSet);
    serialNumbers = v6->_serialNumbers;
    v6->_serialNumbers = v11;

    if (!v5)
    {

      v26 = 0LL;
      goto LABEL_17;
    }

    objc_storeStrong((id *)&v6->_midList, a3);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    v13 = v6->_midList;
    id v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "machineID", (void)v28));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v18 machineID]);
            -[NSMutableSet addObject:](v7, "addObject:", v20);
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue([v18 serialNumber]);

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue([v18 serialNumber]);
            -[NSMutableSet addObject:](v8, "addObject:", v22);
          }
        }

        id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
      }

      while (v15);
    }

    v23 = v6->_machineIDs;
    v6->_machineIDs = &v7->super;
    v24 = v7;

    v25 = v6->_serialNumbers;
    v6->_serialNumbers = &v8->super;
  }

  v26 = v6;
LABEL_17:

  return v26;
}

- (BOOL)midIsValidInList:(id)a3
{
  if (a3) {
    return -[NSSet containsObject:](self->_machineIDs, "containsObject:");
  }
  else {
    return 1;
  }
}

- (BOOL)serialIsValidInList:(id)a3
{
  if (a3) {
    return -[NSSet containsObject:](self->_serialNumbers, "containsObject:");
  }
  else {
    return 1;
  }
}

- (BOOL)isUseful
{
  return -[NSSet count](self->_machineIDs, "count") != 0;
}

- (NSSet)midList
{
  return self->_midList;
}

- (void)setMidList:(id)a3
{
}

- (NSSet)machineIDs
{
  return self->_machineIDs;
}

- (void)setMachineIDs:(id)a3
{
}

- (NSSet)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)machineID
{
  v2 = sub_10001267C("sosauthkit");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering machineID", buf, 2u);
  }

  if (objc_opt_class(&OBJC_CLASS___AKAnisetteProvisioningController) && objc_opt_class(&OBJC_CLASS___AKAnisetteData))
  {
    v4 = (void *)objc_opt_new(&OBJC_CLASS___AKAnisetteProvisioningController);
    id v5 = v4;
    if (!v4)
    {
      id v15 = sub_10001267C("sosauthkit");
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "can't get controller", buf, 2u);
      }

      v7 = 0LL;
      v9 = 0LL;
      goto LABEL_23;
    }

    id v21 = 0LL;
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 anisetteDataWithError:&v21]);
    v7 = (os_log_s *)v21;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s machineID](v6, "machineID"));
      v9 = (os_log_s *)[v8 copy];

      v10 = sub_10001267C("sosauthkit");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v12)
        {
          *(_DWORD *)buf = 138412290;
          v23 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "machineID is %@", buf, 0xCu);
        }

        goto LABEL_22;
      }

      if (v12)
      {
        *(_WORD *)buf = 0;
        v17 = "Failed to get machineID";
        v18 = v11;
        uint32_t v19 = 2;
        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v16 = sub_10001267C("sosauthkit");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        v17 = "can't get mID: %@";
        v18 = v11;
        uint32_t v19 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }

    v9 = 0LL;
LABEL_22:

LABEL_23:
    id v14 = v9;

    goto LABEL_24;
  }

  v13 = sub_10001267C("sosauthkit");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AKAnisette not available", buf, 2u);
  }

  id v14 = 0LL;
LABEL_24:

  return v14;
}

+ (void)activeMIDs:(id)a3
{
  id v3 = a3;
  if (objc_opt_class(&OBJC_CLASS___ACAccount) && objc_opt_class(&OBJC_CLASS___AKDeviceListRequestContext))
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___AKAppleIDAuthenticationController);
    uint64_t v5 = AKServiceNameiCloud;
    if (v4 && AKServiceNameiCloud != 0LL)
    {
      id v11 = sub_1001B48A4();
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
      v9 = (void *)v12;
      if (v12)
      {
        uint64_t v13 = objc_opt_new(&OBJC_CLASS___AKDeviceListRequestContext);
        if (v13)
        {
          v10 = (void *)v13;
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_altDSID"));
          [v10 setAltDSID:v14];

          uint64_t v29 = v5;
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v29,  1LL));
          [v10 setServices:v15];

          uint64_t v16 = (void *)objc_opt_new(&OBJC_CLASS___AKAppleIDAuthenticationController);
          if (v16)
          {
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472LL;
            v24[2] = sub_1001B4AA0;
            v24[3] = &unk_100292C38;
            id v25 = v3;
            [v16 deviceListWithContext:v10 completion:v24];
            v17 = v25;
          }

          else
          {
            NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
            __int128 v28 = @"can't get authController";
            v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
            v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainOSStatus,  -50LL,  v17));
            (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v23);
          }

          goto LABEL_23;
        }

        CFErrorDomain v20 = kCFErrorDomainOSStatus;
        NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
        __int128 v31 = @"can't get AKDeviceListRequestContextClass";
        id v21 = &v31;
        v22 = &v30;
      }

      else
      {
        v18 = sub_10001267C("sosauthkit");
        uint32_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "can't get account", buf, 2u);
        }

        CFErrorDomain v20 = kCFErrorDomainOSStatus;
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        v33 = @"no primary account";
        id v21 = &v33;
        v22 = &v32;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v22,  1LL));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  -50LL,  v10));
      (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v16);
LABEL_23:

      goto LABEL_11;
    }
  }

  v7 = sub_10001267C("sosauthkit");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ACAccount not available", buf, 2u);
  }

  NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
  v35 = @"AuthKit/AppleAccount not available";
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainOSStatus,  -50LL,  v9));
  (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v10);
LABEL_11:
}

+ (BOOL)peerinfoHasMID:(id)a3
{
  uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo([a3 fullPeerInfo]);
  if (PeerInfo) {
    return SOSPeerInfoV2DictionaryHasString(PeerInfo, sMachineIDKey);
  }
  else {
    return 1;
  }
}

+ (BOOL)updateMIDInPeerInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAuthKitHelpers machineID](&OBJC_CLASS___SOSAuthKitHelpers, "machineID"));
  if (v4)
  {
    CFTypeRef cf = 0LL;
    sub_1001A93D0(v3, sMachineIDKey, (uint64_t)v4, &cf);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001B49B0;
    v10[3] = &unk_100292C60;
    id v11 = v4;
    char v5 = sub_10019BC50(v3, (uint64_t)@"Add Machine ID", (uint64_t)&cf, v10);
    if ((v5 & 1) == 0)
    {
      v6 = sub_10001267C("sosauthkit");
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v14 = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to record MID in PeerInfo: %@",  buf,  0xCu);
      }
    }

    CFTypeRef v8 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v8);
    }
  }

  else
  {
    char v5 = 1;
  }

  return v5;
}

+ (BOOL)accountIsCDPCapable
{
  if (objc_opt_class(&OBJC_CLASS___ACAccount) && objc_opt_class(&OBJC_CLASS___AKAccountManager))
  {
    id v2 = sub_1001B48A4();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    char v5 = v4;
    if (v4) {
      BOOL v6 = v3 == 0LL;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      v7 = sub_10001267C("sosauthkit");
      CFTypeRef v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get manager", buf, 2u);
      }

      LOBYTE(v9) = 0;
      goto LABEL_32;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSIDForAccount:v3]);
    id v26 = 0LL;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 authKitAccountWithAltDSID:v11 error:&v26]);
    uint64_t v13 = (os_log_s *)v26;
    CFTypeRef v8 = v13;
    if (v12)
    {
      unint64_t v14 = (unint64_t)[v5 securityLevelForAccount:v12];
      if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        BOOL v9 = 1;
        goto LABEL_23;
      }
    }

    else
    {
      id v15 = sub_10001267C("sosauthkit");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v28 = (unint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "failed to get ak account: %@", buf, 0xCu);
      }

      unint64_t v14 = 0LL;
    }

    v17 = sub_10001267C("sosauthkit");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Security level is %lu", buf, 0xCu);
    }

    BOOL v9 = 0;
    if (v14 > 5)
    {
      uint32_t v19 = @"oh no please file a radar to Security | iCloud Keychain security level";
      goto LABEL_25;
    }

@end