@interface IDSRegistrationKeychainManager
+ (IDSRegistrationKeychainManager)sharedInstance;
+ (id)keychainAccessGroupForVersion:(unint64_t)a3;
+ (id)keychainAccountForVersion:(unint64_t)a3;
+ (id)keychainServiceForVersion:(unint64_t)a3;
- (BOOL)__saveToKeychain;
- (BOOL)_saveToKeychain;
- (BOOL)addRegistration:(id)a3;
- (BOOL)removeAllRegistrations;
- (BOOL)removeRegistration:(id)a3;
- (IDSRegistrationKeychainManager)init;
- (NSArray)registrations;
- (OS_dispatch_queue)saveQueue;
- (id)authenticationCertForID:(id)a3;
- (id)registrationWithServiceType:(id)a3 registrationType:(int)a4 value:(id)a5;
- (id)smsIDs;
- (id)smsSignatureForID:(id)a3;
- (id)tempPhoneCredentialForID:(id)a3;
- (void)_flush;
- (void)_loadIfNeeded;
- (void)_purgeTimerFiredOnMain;
- (void)_reloadFromDictionary:(id)a3;
- (void)_setPurgeTimer;
- (void)dealloc;
- (void)reloadFromKeychain;
- (void)setAuthenticationCert:(id)a3 forID:(id)a4;
- (void)setSMSSignature:(id)a3 mainID:(id)a4;
- (void)setSaveQueue:(id)a3;
- (void)setTempPhoneCredential:(id)a3 forID:(id)a4;
- (void)systemDidFinishMigration;
@end

@implementation IDSRegistrationKeychainManager

+ (IDSRegistrationKeychainManager)sharedInstance
{
  if (qword_1009C0600 != -1) {
    dispatch_once(&qword_1009C0600, &stru_1008FDFB8);
  }
  return (IDSRegistrationKeychainManager *)(id)qword_1009C0608;
}

- (IDSRegistrationKeychainManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___IDSRegistrationKeychainManager;
  v2 = -[IDSRegistrationKeychainManager init](&v24, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    registrationData = v2->_registrationData;
    v2->_registrationData = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
    [v5 _addEarlyListener:v2];

    v6 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.identityservicesd.registrationKeychainManager-save", v9);
    saveQueue = v2->_saveQueue;
    v2->_saveQueue = (OS_dispatch_queue *)v10;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10020758C;
    v21[3] = &unk_1008F8A78;
    objc_copyWeak(&v22, &location);
    id v12 = [v21 copy];
    id purgeCancelBlock = v2->_purgeCancelBlock;
    v2->_id purgeCancelBlock = v12;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002075CC;
    v18[3] = &unk_1008F93E0;
    objc_copyWeak(&v20, &location);
    v14 = v2;
    v19 = v14;
    id v15 = [v18 copy];
    id purgeEnqueueBlock = v14->_purgeEnqueueBlock;
    v14->_id purgeEnqueueBlock = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMSystemMonitor sharedInstance](&OBJC_CLASS___IMSystemMonitor, "sharedInstance"));
  [v3 _removeEarlyListener:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSRegistrationKeychainManager;
  -[IDSRegistrationKeychainManager dealloc](&v4, "dealloc");
}

- (void)_purgeTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100207754;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)systemDidFinishMigration
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Reloading keychain information: %@",  (uint8_t *)&v4,  0xCu);
  }

  -[IDSRegistrationKeychainManager reloadFromKeychain](self, "reloadFromKeychain");
}

+ (id)keychainServiceForVersion:(unint64_t)a3
{
  if (a3) {
    uint64_t v3 = @"com.apple.facetime";
  }
  else {
    uint64_t v3 = (__CFString *)IDSKeychainServiceNameV0;
  }
  return v3;
}

+ (id)keychainAccountForVersion:(unint64_t)a3
{
  if (a3) {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@V%d",  @"registration",  a3));
  }
  else {
    id v3 = IDSKeychainAccountNameV0;
  }
  return v3;
}

+ (id)keychainAccessGroupForVersion:(unint64_t)a3
{
  return IDSKeychainAccessGroup;
}

- (BOOL)__saveToKeychain
{
  if (self->_loaded)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    byte_1009C0610 = 0;
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "** Saving registration data to keychain: Begin **",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v4)) {
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"** Saving registration data to keychain: Begin **");
    }
    v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v77 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    v74 = self;
    obj = self->_registrationData;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v85,  v93,  16LL);
    v6 = &IMInsertBoolsToXPCDictionary_ptr;
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v86;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v86 != v8) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v10 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictionaryRepresentation]);
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6[440] keychainManager]);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceType]);
            v14 = (void *)objc_claimAutoreleasedReturnValue([v10 mainID]);
            *(_DWORD *)buf = 138412546;
            id v90 = v13;
            __int16 v91 = 2112;
            v92 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "  => Adding registration for service: %@  ID: %@  to keychain dictionary",  buf,  0x16u);

            v6 = &IMInsertBoolsToXPCDictionary_ptr;
          }

          if (os_log_shim_legacy_logging_enabled(v15))
          {
            id v69 = (id)objc_claimAutoreleasedReturnValue([v10 serviceType]);
            v73 = (void *)objc_claimAutoreleasedReturnValue([v10 mainID]);
            MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"  => Adding registration for service: %@  ID: %@  to keychain dictionary");

            v6 = &IMInsertBoolsToXPCDictionary_ptr;
          }

          v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[440], "keychainManager", v69, v73));
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
            *(_DWORD *)buf = 138412290;
            id v90 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "     => Registration %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v18))
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
            MarcoLogRegistration(@"KeychainManager", @"FTServices", @"     => Registration %@");
          }

          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[440], "keychainManager", v70));
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v11)
          {
            if (v20)
            {
              id v21 = [v11 count];
              *(_DWORD *)buf = 134217984;
              id v90 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "    => Dictionary has %lu key-value pairs",  buf,  0xCu);
            }

            -[NSMutableArray addObject:](v77, "addObject:", v11);
          }

          else
          {
            if (v20)
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "    => Not saving, got a nil dictionary representation",  buf,  2u);
            }

            if (os_log_shim_legacy_logging_enabled(v22)) {
              MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"    => Not saving, got a nil dictionary representation");
            }
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v85,  v93,  16LL);
      }

      while (v7);
    }

    objc_super v24 = (void *)objc_opt_class(v74, v23);
    uint64_t v25 = IDSKeychainBlobCurrentVersion;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 keychainServiceForVersion:IDSKeychainBlobCurrentVersion]);
    id v28 = objc_msgSend((id)objc_opt_class(v74, v27), "keychainAccountForVersion:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6[440] keychainManager]);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = -[NSMutableArray count](v77, "count");
      *(_DWORD *)buf = 134217984;
      id v90 = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Final keychain data array count: %lu",  buf,  0xCu);
    }

    v32 = v75;
    if (-[NSMutableArray count](v77, "count")) {
      -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v77, @"data");
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v25));
    -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v33, @"version");

    if (-[NSMutableDictionary count](v74->_authenticationCerts, "count"))
    {
      -[NSMutableDictionary setObject:forKey:](v75, "setObject:forKey:", v74->_authenticationCerts, @"auth-certs");
      v34 = &IMInsertBoolsToXPCDictionary_ptr;
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = -[NSMutableDictionary count](v74->_authenticationCerts, "count");
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v74->_authenticationCerts, "allKeys"));
        *(_DWORD *)buf = 134218242;
        id v90 = v36;
        v34 = &IMInsertBoolsToXPCDictionary_ptr;
        __int16 v91 = 2112;
        v92 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "  => Adding %lu auth certs for users %@",  buf,  0x16u);

        v32 = v75;
      }

      if (os_log_shim_legacy_logging_enabled(v38))
      {
        id v69 = -[NSMutableDictionary count](v74->_authenticationCerts, "count");
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v74->_authenticationCerts, "allKeys"));
        MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"  => Adding %lu auth certs for users %@");

        v34 = &IMInsertBoolsToXPCDictionary_ptr;
      }
    }

    else
    {
      v34 = &IMInsertBoolsToXPCDictionary_ptr;
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "  => We don't have any auth certs to save",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v43)) {
        MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"  => We don't have any auth certs to save");
      }
    }

    if (-[NSMutableDictionary count](v74->_smsSignatures, "count", v69, v73))
    {
      -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v74->_smsSignatures, @"sms-signatures");
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34[440] keychainManager]);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = -[NSMutableDictionary count](v74->_smsSignatures, "count");
        *(_DWORD *)buf = 134217984;
        id v90 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "  => Adding %lu SMS signatures", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v46))
      {
        id v71 = -[NSMutableDictionary count](v74->_smsSignatures, "count");
        v47 = @"  => Adding %lu SMS signatures";
LABEL_56:
        MarcoLogRegistration(@"KeychainManager", @"FTServices", v47);
      }
    }

    else
    {
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34[440] keychainManager]);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "  => We don't have any SMS signatures to save",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v49))
      {
        v47 = @"  => We don't have any SMS signatures to save";
        goto LABEL_56;
      }
    }

    if (-[NSMutableDictionary count](v74->_tempPhoneCredentials, "count", v71))
    {
      -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  v74->_tempPhoneCredentials,  @"temp-phone-creds");
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34[440] keychainManager]);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        id v51 = -[NSMutableDictionary count](v74->_tempPhoneCredentials, "count");
        *(_DWORD *)buf = 134217984;
        id v90 = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "  => Adding %lu temp phone credentials",  buf,  0xCu);
      }

      id v72 = -[NSMutableDictionary count](v74->_tempPhoneCredentials, "count");
      v53 = @"  => Adding %lu temp phone credentials";
    }

    else
    {
      v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34[440] keychainManager]);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "  => We don't have any temp phone credentials to save",  buf,  2u);
      }

      v53 = @"  => We don't have any temp phone credentials to save";
    }

    MarcoLogRegistration(@"KeychainManager", @"FTServices", v53);
LABEL_67:
    uint64_t v56 = arc4random();
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v56));
    -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v57, @"save-identifier");

    id v84 = 0LL;
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v32,  200LL,  0LL,  &v84));
    id v60 = v84;
    BOOL v41 = v58 != 0LL;
    if (v58)
    {
      id v61 = objc_msgSend((id)objc_opt_class(v74, v59), "keychainAccessGroupForVersion:", v25);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      saveQueue = (dispatch_queue_s *)v74->_saveQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1002083A4;
      block[3] = &unk_1008FDFE0;
      id v79 = v58;
      id v80 = v26;
      id v81 = v29;
      id v82 = v62;
      int v83 = v56;
      id v64 = v62;
      dispatch_async(saveQueue, block);

      v65 = v77;
    }

    else
    {
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v90 = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "Unable to build property list data: %@",  buf,  0xCu);
      }

      v65 = v77;
      if (os_log_shim_legacy_logging_enabled(v67))
      {
        id v72 = v60;
        MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Unable to build property list data: %@");
      }
    }

    -[NSRecursiveLock unlock](v74->_lock, "unlock", v72);

    return v41;
  }

  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "** We haven't loaded anything, ignoring save to keychain **",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v40)) {
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"** We haven't loaded anything, ignoring save to keychain **");
  }
  return 0;
}

- (BOOL)_saveToKeychain
{
  if ((byte_1009C0610 & 1) == 0)
  {
    byte_1009C0610 = 1;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1002086C8;
    v5[3] = &unk_1008F6010;
    v5[4] = self;
    im_dispatch_after_primary_queue(v5, 0.5);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions( DarwinNotifyCenter,  IDSRegistrationKeychainChangedNotification,  0LL,  0LL,  0LL);
  return 1;
}

- (void)_flush
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, self->_purgeCancelBlock);

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (self->_loaded)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = -[NSMutableArray count](self->_registrationData, "count");
      unsigned int v7 = -[NSMutableDictionary count](self->_authenticationCerts, "count");
      *(_DWORD *)buf = 67109376;
      unsigned int v18 = v6;
      __int16 v19 = 1024;
      unsigned int v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Forcing save of registration objects from keychain dictionary, %d entries  %d auth certs",  buf,  0xEu);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      id v13 = -[NSMutableArray count](self->_registrationData, "count");
      id v15 = -[NSMutableDictionary count](self->_authenticationCerts, "count");
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Forcing save of registration objects from keychain dictionary, %d entries  %d auth certs");
    }

    -[IDSRegistrationKeychainManager __saveToKeychain](self, "__saveToKeychain", v13, v15);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = -[NSMutableArray count](self->_registrationData, "count");
      unsigned int v11 = -[NSMutableDictionary count](self->_authenticationCerts, "count");
      *(_DWORD *)buf = 67109376;
      unsigned int v18 = v10;
      __int16 v19 = 1024;
      unsigned int v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Flushing registration objects from keychain dictionary, %d entries  %d auth certs",  buf,  0xEu);
    }

    if (os_log_shim_legacy_logging_enabled(v12))
    {
      id v14 = -[NSMutableArray count](self->_registrationData, "count");
      id v16 = -[NSMutableDictionary count](self->_authenticationCerts, "count");
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Flushing registration objects from keychain dictionary, %d entries  %d auth certs");
    }

    -[NSMutableArray removeAllObjects](self->_registrationData, "removeAllObjects", v14, v16);
    -[NSMutableDictionary removeAllObjects](self->_authenticationCerts, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_smsSignatures, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_tempPhoneCredentials, "removeAllObjects");
    self->_loaded = 0;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_setPurgeTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, self->_purgeEnqueueBlock);
}

- (void)_loadIfNeeded
{
  if (!self->_loaded)
  {
    self->_loaded = 1;
    -[IDSRegistrationKeychainManager reloadFromKeychain](self, "reloadFromKeychain");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  -[IDSRegistrationKeychainManager _setPurgeTimer](self, "_setPurgeTimer");
}

- (void)_reloadFromDictionary:(id)a3
{
  id v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"data"]);
  -[NSMutableArray removeAllObjects](self->_registrationData, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_authenticationCerts, "removeAllObjects");
  id v64 = self;
  authenticationCerts = self->_authenticationCerts;
  if (!authenticationCerts)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v8 = v64->_authenticationCerts;
    v64->_authenticationCerts = (NSMutableDictionary *)Mutable;

    authenticationCerts = v64->_authenticationCerts;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"auth-certs"]);
  -[NSMutableDictionary addEntriesFromDictionary:](authenticationCerts, "addEntriesFromDictionary:", v9);

  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = -[NSMutableDictionary count](v64->_authenticationCerts, "count");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v64->_authenticationCerts, "allKeys"));
    *(_DWORD *)buf = 67109378;
    unsigned int v76 = v11;
    __int16 v77 = 2112;
    v78 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Loaded %d auth certs for users %@", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled(v13))
  {
    id v56 = -[NSMutableDictionary count](v64->_authenticationCerts, "count");
    id v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v64->_authenticationCerts, "allKeys"));
    MarcoLogRegistration(@"KeychainManager", @"FTServices", @"Loaded %d auth certs for users %@");
  }

  -[NSMutableDictionary removeAllObjects](v64->_smsSignatures, "removeAllObjects", v56, v60);
  smsSignatures = v64->_smsSignatures;
  if (!smsSignatures)
  {
    CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v16 = v64->_smsSignatures;
    v64->_smsSignatures = (NSMutableDictionary *)v15;

    smsSignatures = v64->_smsSignatures;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"sms-signatures"]);
  -[NSMutableDictionary addEntriesFromDictionary:](smsSignatures, "addEntriesFromDictionary:", v17);

  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = -[NSMutableDictionary count](v64->_smsSignatures, "count");
    *(_DWORD *)buf = 67109120;
    unsigned int v76 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Loaded %d sms signatures", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v20))
  {
    id v57 = -[NSMutableDictionary count](v64->_smsSignatures, "count");
    MarcoLogRegistration(@"KeychainManager", @"FTServices", @"Loaded %d sms signatures");
  }

  -[NSMutableDictionary removeAllObjects](v64->_tempPhoneCredentials, "removeAllObjects", v57);
  tempPhoneCredentials = v64->_tempPhoneCredentials;
  if (!tempPhoneCredentials)
  {
    CFMutableDictionaryRef v22 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v23 = v64->_tempPhoneCredentials;
    v64->_tempPhoneCredentials = (NSMutableDictionary *)v22;

    tempPhoneCredentials = v64->_tempPhoneCredentials;
  }

  objc_super v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"temp-phone-creds"]);
  -[NSMutableDictionary addEntriesFromDictionary:](tempPhoneCredentials, "addEntriesFromDictionary:", v24);

  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v26 = -[NSMutableDictionary count](v64->_tempPhoneCredentials, "count");
    *(_DWORD *)buf = 67109120;
    unsigned int v76 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Loaded %d temp phone credentials", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v27))
  {
    id v58 = -[NSMutableDictionary count](v64->_tempPhoneCredentials, "count");
    MarcoLogRegistration(@"KeychainManager", @"FTServices", @"Loaded %d temp phone credentials");
  }

  id v28 = objc_msgSend(v5, "count", v58);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v76 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Reloading registration objects from keychain dictionary, %d entries",  buf,  8u);
  }

  v63 = v4;

  if (os_log_shim_legacy_logging_enabled(v30))
  {
    id v59 = v28;
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Reloading registration objects from keychain dictionary, %d entries");
  }

  id v62 = v28;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v31 = v5;
  id v32 = [v31 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v70;
    do
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v70 != v34) {
          objc_enumerationMutation(v31);
        }
        id v36 = *(void **)(*((void *)&v69 + 1) + 8LL * (void)i);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", @"service", v59));
        if ([v37 isEqualToString:@"iMessage"])
        {
        }

        else
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"service"]);
          unsigned int v39 = [v38 isEqualToString:@"FaceTime"];

          if (!v39) {
            continue;
          }
        }

        uint64_t v40 = -[IDSRegistration initWithDictionary:]( objc_alloc(&OBJC_CLASS___IDSRegistration),  "initWithDictionary:",  v36);
        if (v40)
        {
          BOOL v41 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"migrated-v0-dictionary"]);
          -[IDSRegistration setMigrationContext:](v40, "setMigrationContext:", v41);
          -[NSMutableArray addObject:](v64->_registrationData, "addObject:", v40);
        }
      }

      id v33 = [v31 countByEnumeratingWithState:&v69 objects:v74 count:16];
    }

    while (v33);
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v42 = v31;
  id v43 = [v42 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (!v43) {
    goto LABEL_48;
  }
  id v44 = v43;
  uint64_t v45 = *(void *)v66;
  do
  {
    for (j = 0LL; j != v44; j = (char *)j + 1)
    {
      if (*(void *)v66 != v45) {
        objc_enumerationMutation(v42);
      }
      v47 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)j);
      v48 = (IDSRegistration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKey:", @"service", v59));
      if ((-[IDSRegistration isEqualToString:](v48, "isEqualToString:", @"iMessage") & 1) == 0)
      {
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:@"service"]);
        unsigned __int8 v50 = [v49 isEqualToString:@"FaceTime"];

        if ((v50 & 1) != 0) {
          continue;
        }
        v48 = -[IDSRegistration initWithDictionary:]( objc_alloc(&OBJC_CLASS___IDSRegistration),  "initWithDictionary:",  v47);
        if (v48)
        {
          id v51 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:@"migrated-v0-dictionary"]);
          -[IDSRegistration setMigrationContext:](v48, "setMigrationContext:", v51);
          -[NSMutableArray addObject:](v64->_registrationData, "addObject:", v48);
        }
      }
    }

    id v44 = [v42 countByEnumeratingWithState:&v65 objects:v73 count:16];
  }

  while (v44);
LABEL_48:

  id v52 = -[NSMutableArray count](v64->_registrationData, "count");
  if (v52 != v62)
  {
    id v53 = v52;
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v76 = v62;
      __int16 v77 = 1024;
      LODWORD(v78) = (_DWORD)v53;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Expected to load %d registration objects, but only loaded %d",  buf,  0xEu);
    }

    if (os_log_shim_legacy_logging_enabled(v55))
    {
      id v59 = v62;
      id v61 = v53;
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Expected to load %d registration objects, but only loaded %d");
    }
  }

  -[NSRecursiveLock unlock](v64->_lock, "unlock", v59, v61);
}

- (void)reloadFromKeychain
{
  unint64_t v4 = 0LL;
  id v5 = 0LL;
  unsigned int v62 = 0;
  unsigned int v6 = (char *)IDSKeychainBlobCurrentVersion;
  unint64_t v59 = IDSKeychainBlobCurrentVersion;
  while (1)
  {
    unsigned int v7 = v5;
    id v8 = objc_msgSend((id)objc_opt_class(self, v3), "keychainServiceForVersion:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v11 = objc_msgSend((id)objc_opt_class(self, v10), "keychainAccountForVersion:", v6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v14 = objc_msgSend((id)objc_opt_class(self, v13), "keychainAccessGroupForVersion:", v6);
    CFMutableDictionaryRef v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v64 = (_DWORD)v6;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v9;
      __int16 v65 = 2112;
      __int128 v66 = v12;
      __int16 v67 = 2112;
      __int128 v68 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Attempting to load V%d keychain blob from service: %@   account: %@   accessGroup: %@",  buf,  0x26u);
    }

    if (os_log_shim_legacy_logging_enabled(v17))
    {
      id v57 = v12;
      id v58 = v15;
      uint64_t v54 = (uint64_t)v6;
      id v56 = v9;
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Attempting to load V%d keychain blob from service: %@   account: %@   accessGroup: %@");
    }

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDependencyProvider keychainAdapter]( &OBJC_CLASS___IDSDependencyProvider,  "keychainAdapter",  v54,  v56,  v57,  v58));
    id v61 = v7;
    unsigned int v19 = [v18 getKeychainData:&v61 service:v9 account:v12 accessGroup:v15 error:&v62];
    id v5 = v61;

    if (v19)
    {
      if (v5)
      {
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)id v64 = (_DWORD)v6;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "  => Found V%d keychain blob", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled(v27))
        {
          uint64_t v54 = (uint64_t)v6;
          MarcoLogRegistration(@"KeychainManager", @"FTServices", @"  => Found V%d keychain blob");
        }

        goto LABEL_28;
      }

      goto LABEL_21;
    }

    if (v62 == -25300)
    {
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "  => No blob found in keychain", buf, 2u);
      }

      CFMutableDictionaryRef v22 = @"  => No blob found in keychain";
LABEL_20:
      MarcoLogRegistration(@"KeychainManager", @"FTServices", v22);
      goto LABEL_21;
    }

    if (v62) {
      break;
    }
LABEL_21:

    ++v4;
    --v6;
    if (v4 > v59)
    {
      unsigned int v6 = 0LL;
LABEL_28:
      if (objc_msgSend(v5, "length", v54))
      {
        id v60 = 0LL;
        v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v60));
        id v29 = v60;
        if (v9)
        {
          uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSDictionary, v28);
          if ((objc_opt_isKindOfClass(v9, v30) & 1) != 0 && !v29) {
            goto LABEL_46;
          }
        }

        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v64 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Unable to parse property list: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v32))
        {
          unint64_t v55 = (unint64_t)v29;
          MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Unable to parse property list: %@");
        }

        id v34 = objc_msgSend((id)objc_opt_class(self, v33), "keychainServiceForVersion:", v6);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        id v37 = objc_msgSend((id)objc_opt_class(self, v36), "keychainAccountForVersion:", v6);
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        unsigned int v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)id v64 = (_DWORD)v6;
          *(_WORD *)&v64[4] = 2112;
          *(void *)&v64[6] = v35;
          __int16 v65 = 2112;
          __int128 v66 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Removing invalid keychain data (V%d) for service: %@   account: %@",  buf,  0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled(v40))
        {
          id v56 = v35;
          id v57 = v38;
          unint64_t v55 = (unint64_t)v6;
          MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Removing invalid keychain data (V%d) for service: %@   account: %@");
        }

        unsigned int v62 = 0;
        BOOL v41 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDependencyProvider keychainAdapter]( &OBJC_CLASS___IDSDependencyProvider,  "keychainAdapter",  v55,  v56,  v57));
        unsigned __int8 v42 = [v41 removeKeychainDataOnService:v35 account:v38 error:&v62];

        if ((v42 & 1) == 0)
        {
          id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)id v64 = v62;
            _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "  => Unable to remove invalid keychain blob (error: %d)",  buf,  8u);
          }

          if (os_log_shim_legacy_logging_enabled(v44))
          {
            unint64_t v55 = v62;
            MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"  => Unable to remove invalid keychain blob (error: %d)");
          }
        }

        if (v9)
        {
LABEL_46:
          uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", @"version", v55));
          uint64_t v46 = v45;
          if (v45) {
            id v47 = [v45 unsignedIntegerValue];
          }
          else {
            id v47 = 0LL;
          }
          if ((unint64_t)v47 < v59)
          {
            v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)id v64 = (_DWORD)v47;
              _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Keychain dictionary V%d needs upgrade",  buf,  8u);
            }

            if (os_log_shim_legacy_logging_enabled(v49))
            {
              unint64_t v55 = (unint64_t)v47;
              MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Keychain dictionary V%d needs upgrade");
            }

            id v50 = sub_1002098C8(v9);
            uint64_t v51 = objc_claimAutoreleasedReturnValue(v50);

            v9 = (void *)v51;
          }
        }
      }

      else
      {
        v9 = 0LL;
      }

      -[IDSRegistrationKeychainManager _reloadFromDictionary:](self, "_reloadFromDictionary:", v9, v55);
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      goto LABEL_58;
    }
  }

  if (v62 != -34019)
  {
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)id v64 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "  => Failed to get keychain blob (error: %d)",  buf,  8u);
    }

    uint64_t v54 = v62;
    CFMutableDictionaryRef v22 = @"  => Failed to get keychain blob (error: %d)";
    goto LABEL_20;
  }

  id v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "  => Keychain upgrade pending, waiting to load registrations...",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v53)) {
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"  => Keychain upgrade pending, waiting to load registrations...");
  }
  self->_loaded = 0;

LABEL_58:
}

- (id)registrationWithServiceType:(id)a3 registrationType:(int)a4 value:(id)a5
{
  id v8 = a3;
  id v36 = a5;
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _StringForIDSRegistrationServiceType(v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = _StringForIDSRegistrationType(a4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138412802;
    id v43 = v11;
    __int16 v44 = 2112;
    uint64_t v45 = v13;
    __int16 v46 = 2112;
    id v47 = v36;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Looking up registration with service type: %@  registration type: %@   value: %@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v14))
  {
    uint64_t v15 = _StringForIDSRegistrationServiceType(v8);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = _StringForIDSRegistrationType(a4);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v34 = v36;
    uint64_t v32 = v16;
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Looking up registration with service type: %@  registration type: %@   value: %@");
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  unsigned int v18 = self->_registrationData;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v37,  v41,  16LL);
  if (!v19)
  {
    id v30 = 0LL;
    goto LABEL_22;
  }

  id v20 = v19;
  v35 = self;
  uint64_t v21 = *(void *)v38;
  while (2)
  {
    for (i = 0LL; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v38 != v21) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
      if (objc_msgSend(v23, "registrationType", v32, v33, v34) == a4)
      {
        uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 serviceType]);
        if ((id)v24 == v8)
        {
        }

        else
        {
          uint64_t v25 = (void *)v24;
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceType]);
          unsigned int v27 = [v26 isEqualToString:v8];

          if (!v27) {
            continue;
          }
        }

        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_keychain_comparisonValue"));
        unsigned int v29 = [v28 isEqualToString:v36];

        if (v29)
        {
          id v30 = v23;
          goto LABEL_20;
        }
      }
    }

    id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v37,  v41,  16LL);
    if (v20) {
      continue;
    }
    break;
  }

  id v30 = 0LL;
LABEL_20:
  self = v35;
LABEL_22:

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v30;
}

- (NSArray)registrations
{
  registrationData = self->_registrationData;
  if (registrationData) {
    unint64_t v4 = (NSArray *)-[NSMutableArray copy](registrationData, "copy");
  }
  else {
    unint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSArray);
  }
  id v5 = v4;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (BOOL)addRegistration:(id)a3
{
  id v4 = a3;
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (v4)
  {
    if ((unint64_t)-[NSMutableArray count](self->_registrationData, "count") >= 0x29)
    {
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v13 = 40;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  " => Removing first keychain entry, we're over max of %d entries",  buf,  8u);
      }

      if (os_log_shim_legacy_logging_enabled(v6))
      {
        uint64_t v11 = 40LL;
        MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @" => Removing first keychain entry, we're over max of %d entries");
      }

      -[NSMutableArray removeObjectAtIndex:](self->_registrationData, "removeObjectAtIndex:", 0LL, v11);
    }

    if (-[NSMutableArray count](self->_registrationData, "count"))
    {
      uint64_t v7 = 0LL;
      while (1)
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_registrationData, "objectAtIndex:", v7));
      }

      if (v8)
      {
        -[NSMutableArray removeObjectIdenticalTo:](self->_registrationData, "removeObjectIdenticalTo:", v8);
      }
    }

- (BOOL)removeRegistration:(id)a3
{
  id v4 = a3;
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing registration : %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6))
  {
    id v13 = v4;
    MarcoLogRegistration(@"KeychainManager", @"FTServices", @"Removing registration : %@");
  }

  if (!v4) {
    goto LABEL_14;
  }
  if (!-[NSMutableArray count](self->_registrationData, "count"))
  {
LABEL_10:
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager", v13));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "  => No matching registration found to remove",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v10)) {
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"  => No matching registration found to remove");
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }

  uint64_t v7 = 0LL;
  while (1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_registrationData, "objectAtIndex:", v7, v13));
  }

  -[NSMutableArray removeObjectAtIndex:](self->_registrationData, "removeObjectAtIndex:", v7);

  BOOL v11 = -[IDSRegistrationKeychainManager _saveToKeychain](self, "_saveToKeychain");
LABEL_15:
  -[NSRecursiveLock unlock](self->_lock, "unlock", v13);

  return v11;
}

- (BOOL)removeAllRegistrations
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all registrations", v7, 2u);
  }

  -[NSMutableArray removeAllObjects](self->_registrationData, "removeAllObjects");
  BOOL v5 = -[IDSRegistrationKeychainManager __saveToKeychain](self, "__saveToKeychain");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v5;
}

- (id)authenticationCertForID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_authenticationCerts, "objectForKey:", v4));
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return v5;
}

- (void)setAuthenticationCert:(id)a3 forID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting IDS auth cert: %p   for ID: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v9))
    {
      id v13 = v6;
      id v14 = v7;
      MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Setting IDS auth cert: %p   for ID: %@");
    }

    -[NSRecursiveLock lock](self->_lock, "lock", v13, v14);
    -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
    if (!self->_authenticationCerts)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      authenticationCerts = self->_authenticationCerts;
      self->_authenticationCerts = Mutable;
    }

    uint64_t v12 = self->_authenticationCerts;
    if (v6) {
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v6, v7);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v7);
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[IDSRegistrationKeychainManager _saveToKeychain](self, "_saveToKeychain");
  }
}

- (id)smsSignatureForID:(id)a3
{
  id v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  if (v4) {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_smsSignatures, "objectForKey:", v4));
  }
  else {
    BOOL v5 = 0LL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    uint64_t v8 = IMTruncatedLoggingStringForString();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Returning SMS sig for ID: %@   signature: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v10))
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
    uint64_t v12 = IMTruncatedLoggingStringForString();
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v12);
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Returning SMS sig for ID: %@   signature: %@");
  }

  return v5;
}

- (id)smsIDs
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_smsSignatures, "allKeys"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Returning SMS IDs: %@", buf, 0xCu);
  }

  return v3;
}

- (void)setSMSSignature:(id)a3 mainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    uint64_t v10 = IMTruncatedLoggingStringForString();
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    CFMutableDictionaryRef v22 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting SMS main ID: %@   signature: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v12))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    uint64_t v14 = IMTruncatedLoggingStringForString();
    id v17 = v7;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v14);
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Setting SMS main ID: %@   signature: %@");
  }

  -[NSRecursiveLock lock](self->_lock, "lock", v17, v18);
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  if (!self->_smsSignatures)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    smsSignatures = self->_smsSignatures;
    self->_smsSignatures = Mutable;
  }

  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    -[NSMutableDictionary setObject:forKey:](self->_smsSignatures, "setObject:forKey:", v6, v7);
  }

  else if (v7)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_smsSignatures, "removeObjectForKey:", v7);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  -[IDSRegistrationKeychainManager _saveToKeychain](self, "_saveToKeychain");
}

- (id)tempPhoneCredentialForID:(id)a3
{
  id v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  if (v4) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_tempPhoneCredentials,  "objectForKeyedSubscript:",  v4));
  }
  else {
    uint64_t v5 = 0LL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Returning temp phone credential for ID: %@ cert: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)) {
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Returning temp phone credential for ID: %@ cert: %@");
  }

  return v5;
}

- (void)setTempPhoneCredential:(id)a3 forID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog keychainManager](&OBJC_CLASS___IMRGLog, "keychainManager"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Returning temp phone credential for ID: %@ tempCredential: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v9))
  {
    id v14 = v7;
    id v15 = v6;
    MarcoLogRegistration( @"KeychainManager",  @"FTServices",  @"Returning temp phone credential for ID: %@ tempCredential: %@");
  }

  -[NSRecursiveLock lock](self->_lock, "lock", v14, v15);
  -[IDSRegistrationKeychainManager _loadIfNeeded](self, "_loadIfNeeded");
  if (!self->_tempPhoneCredentials)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    tempPhoneCredentials = self->_tempPhoneCredentials;
    self->_tempPhoneCredentials = Mutable;
  }

  if ([v7 length])
  {
    uint64_t v12 = self->_tempPhoneCredentials;
    id v13 = v6;
LABEL_11:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, v7);
    goto LABEL_12;
  }

  if (v7)
  {
    uint64_t v12 = self->_tempPhoneCredentials;
    id v13 = 0LL;
    goto LABEL_11;
  }

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (void)setSaveQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end