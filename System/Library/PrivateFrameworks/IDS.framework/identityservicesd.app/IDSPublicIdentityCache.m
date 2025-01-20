@interface IDSPublicIdentityCache
+ (id)sharedInstance;
- (BOOL)addIdentity:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7;
- (BOOL)addIdentityData:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7;
- (BOOL)cleanupWithError:(id *)a3;
- (IDSPublicIdentityCache)init;
- (IDSPublicIdentityCache)initWithPath:(id)a3 withPersistenceManager:(id)a4;
- (id)identityDataForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6;
- (id)identityForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6;
- (id)keyForToken:(id)a3 uri:(id)a4 service:(id)a5;
- (id)recentURIsWithinTimeInterval:(double)a3 forService:(id)a4 error:(id *)a5;
- (void)deleteCache;
@end

@implementation IDSPublicIdentityCache

+ (id)sharedInstance
{
  if (qword_1009BE5A0 != -1) {
    dispatch_once(&qword_1009BE5A0, &stru_1008F6488);
  }
  return (id)qword_1009BE5A8;
}

- (IDSPublicIdentityCache)init
{
  uint64_t v3 = CSDBGetMobileUserDirectory(self, a2);
  if (v3) {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  }
  else {
    v4 = @"~";
  }
  v11[0] = v4;
  v11[1] = @"/Library/IdentityServices/ids-pub-id.db";
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v5));

  if (v3) {
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistenceManager]);
  v9 = -[IDSPublicIdentityCache initWithPath:withPersistenceManager:]( self,  "initWithPath:withPersistenceManager:",  v6,  v8);

  return v9;
}

- (IDSPublicIdentityCache)initWithPath:(id)a3 withPersistenceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSPublicIdentityCache;
  v8 = -[IDSPublicIdentityCache init](&v12, "init");
  if (v8)
  {
    v9 = -[IDSKVStore initWithPath:storeName:dataProtectionClass:]( objc_alloc(&OBJC_CLASS___IDSKVStore),  "initWithPath:storeName:dataProtectionClass:",  v6,  @"PublicIdentityCache",  0LL);
    kvStore = v8->_kvStore;
    v8->_kvStore = v9;

    objc_storeStrong((id *)&v8->_persistenceManager, a4);
  }

  return v8;
}

- (id)keyForToken:(id)a3 uri:(id)a4 service:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "__imHexString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@-%@",  v9,  v8,  v7));

  return v10;
}

- (BOOL)addIdentityData:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    -[IDSQuerySDPersistenceManager savePublicIdentityData:token:uri:service:completion:]( self->_persistenceManager,  "savePublicIdentityData:token:uri:service:completion:",  v12,  v13,  v15,  v14,  &stru_1008F64A8);
    unsigned __int8 v16 = 1;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 prefixedURI]);

    id v15 = (id)objc_claimAutoreleasedReturnValue(-[IDSPublicIdentityCache keyForToken:uri:service:](self, "keyForToken:uri:service:", v13, v17, v14));
    unsigned __int8 v16 = -[IDSKVStore persistData:forKey:error:]( self->_kvStore,  "persistData:forKey:error:",  v12,  v15,  a7);
  }

  return v16;
}

- (id)identityDataForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[IDSQuerySDPersistenceManager publicIdentityDataFor:uri:service:]( self->_persistenceManager,  "publicIdentityDataFor:uri:service:",  v10,  v12,  v11));
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 prefixedURI]);

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[IDSPublicIdentityCache keyForToken:uri:service:](self, "keyForToken:uri:service:", v10, v14, v11));
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[IDSKVStore dataForKey:error:](self->_kvStore, "dataForKey:error:", v12, a6));
  }

  id v15 = (void *)v13;

  return v15;
}

- (BOOL)addIdentity:(id)a3 forToken:(id)a4 uri:(id)a5 service:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 dataRepresentationWithError:a7]);
  if (v15)
  {
    uint64_t v16 = OSLogHandleForIDSCategory("IDSPublicIdentityCache");
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = IDSLoggableDescriptionForTokenOnService(v12, v14);
      id v19 = (id)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v13 prefixedURI]);
      uint64_t v21 = IDSLoggableDescriptionForHandleOnService(v20, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138413058;
      id v36 = v11;
      __int16 v37 = 2112;
      id v38 = v19;
      __int16 v39 = 2112;
      v40 = v22;
      __int16 v41 = 2112;
      id v42 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Adding identity to last resort DB { identity: %@, token: %@, uri: %@, service: %@ }",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v23)
      && _IDSShouldLog(0LL, @"IDSPublicIdentityCache"))
    {
      uint64_t v24 = IDSLoggableDescriptionForTokenOnService(v12, v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v13 prefixedURI]);
      uint64_t v27 = IDSLoggableDescriptionForHandleOnService(v26, v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v27);
      id v33 = v14;
      id v30 = v11;
      v31 = v25;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPublicIdentityCache",  @"Adding identity to last resort DB { identity: %@, token: %@, uri: %@, service: %@ }");
    }

    BOOL v28 = -[IDSPublicIdentityCache addIdentityData:forToken:uri:service:error:]( self,  "addIdentityData:forToken:uri:service:error:",  v15,  v12,  v13,  v14,  a7,  v30,  v31,  v32,  v33);
  }

  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (id)identityForToken:(id)a3 uri:(id)a4 service:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = OSLogHandleForIDSCategory("IDSPublicIdentityCache");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = IDSLoggableDescriptionForTokenOnService(v10, v12);
    id v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v17 = IDSLoggableDescriptionForTokenOnService(v10, v12);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412802;
    id v41 = v16;
    __int16 v42 = 2112;
    id v43 = v18;
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Checking last resort DB for identity { token: %@, uri: %@, service: %@ }",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v19)
    && _IDSShouldLog(0LL, @"IDSPublicIdentityCache"))
  {
    uint64_t v20 = IDSLoggableDescriptionForTokenOnService(v10, v12);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t v22 = IDSLoggableDescriptionForTokenOnService(v10, v12);
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(v22);
    id v38 = v12;
    id v36 = v21;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPublicIdentityCache",  @"Checking last resort DB for identity { token: %@, uri: %@, service: %@ }");
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPublicIdentityCache identityDataForToken:uri:service:error:]( self,  "identityDataForToken:uri:service:error:",  v10,  v11,  v12,  a6,  v36,  v37,  v38));
  if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[IDSMPPublicDeviceIdentityContainer identityWithDataRepresentation:error:]( &OBJC_CLASS___IDSMPPublicDeviceIdentityContainer,  "identityWithDataRepresentation:error:",  v23,  a6));
    if (v24)
    {
      uint64_t v25 = OSLogHandleForIDSCategory("IDSPublicIdentityCache");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = IDSLoggableDescriptionForTokenOnService(v10, v12);
        id v28 = (id)objc_claimAutoreleasedReturnValue(v27);
        uint64_t v29 = IDSLoggableDescriptionForTokenOnService(v10, v12);
        id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138413058;
        id v41 = v24;
        __int16 v42 = 2112;
        id v43 = v28;
        __int16 v44 = 2112;
        id v45 = v30;
        __int16 v46 = 2112;
        id v47 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Found identity in last resort DB { identity: %@, token: %@, uri: %@, service: %@ }",  buf,  0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled(v31)
        && _IDSShouldLog(0LL, @"IDSPublicIdentityCache"))
      {
        uint64_t v32 = IDSLoggableDescriptionForTokenOnService(v10, v12);
        id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        uint64_t v34 = IDSLoggableDescriptionForTokenOnService(v10, v12);
        __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(v34);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPublicIdentityCache",  @"Found identity in last resort DB { identity: %@, token: %@, uri: %@, service: %@ }");
      }
    }
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  return v24;
}

- (BOOL)cleanupWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"public-identity-clear-time-seconds"]);

  if (v6 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7), (objc_opt_isKindOfClass(v6, v8) & 1) != 0)) {
    v9 = v6;
  }
  else {
    v9 = &off_100946780;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"public-identity-future-clear-time-seconds"]);

  if (v11 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12), (objc_opt_isKindOfClass(v11, v13) & 1) != 0)) {
    id v14 = v11;
  }
  else {
    id v14 = &off_100946780;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( NSDate,  "dateWithTimeIntervalSinceNow:",  (double)-(uint64_t)[v9 integerValue]));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( NSDate,  "dateWithTimeIntervalSinceNow:",  (double)(uint64_t)[v14 integerValue]));
  uint64_t v17 = OSLogHandleForIDSCategory("IDSPublicIdentityCache");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    uint64_t v29 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Cleaning last resort DB with date range %@ to %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v19)
    && _IDSShouldLog(0LL, @"IDSPublicIdentityCache"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPublicIdentityCache",  @"Cleaning last resort DB with date range %@ to %@");
  }

  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    persistenceManager = self->_persistenceManager;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001CC24;
    v23[3] = &unk_1008F6298;
    id v24 = v15;
    id v25 = v16;
    -[IDSQuerySDPersistenceManager deletePublicIdentitiesBeforeDate:afterDate:completion:]( persistenceManager,  "deletePublicIdentitiesBeforeDate:afterDate:completion:",  v24,  v25,  v23);

    unsigned __int8 v21 = 1;
  }

  else
  {
    unsigned __int8 v21 = -[IDSKVStore deleteEntriesBeforeDate:afterDate:error:]( self->_kvStore,  "deleteEntriesBeforeDate:afterDate:error:",  v15,  v16,  a3);
  }

  return v21;
}

- (id)recentURIsWithinTimeInterval:(double)a3 forService:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSQuerySDPersistenceManager recentURIsSinceDate:service:]( self->_persistenceManager,  "recentURIsSinceDate:service:",  v9,  v8));
    id v11 = v10;
    if (!v10 || ![v10 count])
    {
      uint64_t v12 = OSLogHandleForIDSCategory("IDSPublicIdentityCache");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v8;
        __int16 v35 = 2112;
        id v36 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Found no recent URIs for service: %@ in last resort cache since date %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v14)
        && _IDSShouldLog(0LL, @"IDSPublicIdentityCache"))
      {
        id v29 = v8;
        id v30 = v9;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSPublicIdentityCache",  @"Found no recent URIs for service: %@ in last resort cache since date %@");
      }

- (void)deleteCache
{
}

- (void).cxx_destruct
{
}

@end