@interface IDSPeerIDManager_SwiftData
+ (BOOL)_datePassed:(id)a3;
+ (BOOL)shouldUseSelfTokens;
+ (unint64_t)dbCacheCostLimit;
+ (unint64_t)dbCacheCountLimit;
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6;
- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 restrictedPersistenceManager:(id)a5 keyTransparencyVerifier:(id)a6 userDefaults:(id)a7 dbCache:(id)a8;
- (IDSPeerIDPushHandler)pushHandler;
- (IDSPeerIDQueryHandler)queryHandler;
- (IDSQuerySDPersistenceManager)restrictedPersistenceManager;
- (IDSQuerySDPersistenceManager)swiftDataManager;
- (IMUserDefaults)userDefaults;
- (NSCache)dbCache;
- (NSMutableDictionary)clientDataUpdateBlocks;
- (NSMutableDictionary)disasterModeTokens;
- (NSMutableDictionary)endpointQueryListeners;
- (NSMutableDictionary)purgeClientDataBlocks;
- (NSMutableSet)reportedExcessiveQueryCacheEntries;
- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6;
- (id)_disasterModeTokenForURI:(id)a3;
- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6;
- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6 ignoreCache:(BOOL)a7 hitCache:(BOOL *)a8;
- (id)_keyTransparencyVerifierResultForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (id)_loadCachedPeerIDValueForKey:(id)a3 ignoreExpiration:(BOOL)a4;
- (id)_peerIDKeysForService:(id)a3;
- (id)_peerIDKeysForService:(id)a3 andFromURI:(id)a4;
- (id)activeURIsFromURI:(id)a3 service:(id)a4;
- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6;
- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6;
- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8;
- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (id)lightDescriptionForVerifierResult:(id)a3;
- (id)peerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (id)persistenceManagerForService:(id)a3;
- (id)persistenceManagers;
- (id)pleaseDontCopyCacheDictionaryRepresentation;
- (id)publicDeviceIdentityContainerForPushToken:(id)a3;
- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)sessionTokenForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6 expirationDate:(id *)a7 refreshDate:(id *)a8 fromIdentity:(id)a9 includeSelfDevice:(BOOL)a10;
- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8;
- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9;
- (id)shortHandleForURI:(id)a3 fromURI:(id)a4;
- (id)uriForShortHandle:(id)a3;
- (id)urisMatchingPushToken:(id)a3 service:(id)a4;
- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5;
- (int64_t)_valueOfProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4;
- (void)_updateKTContext:(id)a3 forURI:(id)a4;
- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5;
- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)clearCacheAndPersistImmediately:(BOOL)a3;
- (void)dealloc;
- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7;
- (void)forgetPeerTokensForService:(id)a3;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4;
- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4;
- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6;
- (void)performCleanupTasks;
- (void)removeClientDataUpdateBlockForToken:(id)a3;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)removeEndpointQueryCompletionBlockForToken:(id)a3;
- (void)removePurgeClientDataBlockForToken:(id)a3;
- (void)setClientDataUpdateBlocks:(id)a3;
- (void)setDbCache:(id)a3;
- (void)setDisasterModeTokens:(id)a3;
- (void)setEndpointQueryListeners:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPurgeClientDataBlocks:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueryHandler:(id)a3;
- (void)setReportedExcessiveQueryCacheEntries:(id)a3;
- (void)setRestrictedPersistenceManager:(id)a3;
- (void)setSwiftDataManager:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateCachedVerifierResultsWithResults:(id)a3;
@end

@implementation IDSPeerIDManager_SwiftData

+ (BOOL)shouldUseSelfTokens
{
  if (IMGetDomainBoolForKey(@"com.apple.ids", @"ForceSelfTokens"))
  {
    _IMWarn(@"***** Forcing self tokens mode *****");
    return 1;
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"vc-disaster-sender-self-tokens"]);
    BOOL v2 = (int)[v4 intValue] > 0;
  }

  return v2;
}

+ (unint64_t)dbCacheCostLimit
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-sd-dbcache-endpoint-limit"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unint64_t v6 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v6 = 10000LL;
  }

  return v6;
}

+ (unint64_t)dbCacheCountLimit
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ids-sd-dbcache-entry-limit"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unint64_t v6 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v6 = 3000LL;
  }

  return v6;
}

- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = -[IDSQuerySDPersistenceManager initWithFilePath:]( objc_alloc(&OBJC_CLASS___IDSQuerySDPersistenceManager),  "initWithFilePath:",  0LL);
  v15 = objc_alloc_init(&OBJC_CLASS___NSCache);
  -[NSCache setTotalCostLimit:]( v15,  "setTotalCostLimit:",  +[IDSPeerIDManager_SwiftData dbCacheCountLimit](&OBJC_CLASS___IDSPeerIDManager_SwiftData, "dbCacheCountLimit"));
  -[NSCache setCountLimit:]( v15,  "setCountLimit:",  +[IDSPeerIDManager_SwiftData dbCacheCountLimit](&OBJC_CLASS___IDSPeerIDManager_SwiftData, "dbCacheCountLimit"));
  v16 = -[IDSPeerIDManager_SwiftData initWithPushHandler:queryHandler:restrictedPersistenceManager:keyTransparencyVerifier:userDefaults:dbCache:]( self,  "initWithPushHandler:queryHandler:restrictedPersistenceManager:keyTransparencyVerifier:userDefaults:dbCache:",  v13,  v12,  v14,  v11,  v10,  v15);

  return v16;
}

- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 restrictedPersistenceManager:(id)a5 keyTransparencyVerifier:(id)a6 userDefaults:(id)a7 dbCache:(id)a8
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___IDSPeerIDManager_SwiftData;
  v18 = -[IDSPeerIDManager_SwiftData init](&v31, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pushHandler, a3);
    objc_storeStrong((id *)&v19->_queryHandler, a4);
    objc_storeStrong((id *)&v19->_restrictedPersistenceManager, a5);
    objc_storeStrong((id *)&v19->_keyTransparencyVerifier, a6);
    objc_storeStrong((id *)&v19->_userDefaults, a7);
    objc_storeStrong((id *)&v19->_dbCache, a8);
    -[NSCache setDelegate:](v19->_dbCache, "setDelegate:", v19, v24, v25, v26);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10000ADF0;
    v27[3] = &unk_1008F6058;
    objc_copyWeak(&v29, &location);
    v28 = v19;
    uint64_t v21 = im_primary_queue(v28, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    sub_100301AD8(v27, (uint64_t)@"IDS-list", (uint64_t)v22);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:0 object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSPeerIDManager_SwiftData;
  -[IDSPeerIDManager_SwiftData dealloc](&v4, "dealloc");
}

- (void)setPersistenceManager:(id)a3
{
  objc_super v4 = (IDSQuerySDPersistenceManager *)a3;
  if (!v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Trying to set a nil persistenceManager on the class. Something is seriously wrong",  v9,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v7)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Trying to set a nil persistenceManager on the class. Something is seriously wrong");
    }
  }

  swiftDataManager = self->_swiftDataManager;
  self->_swiftDataManager = v4;
}

- (id)_disasterModeTokenForURI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);
  id v6 = [v5 length];

  if (v6)
  {
    disasterModeTokens = self->_disasterModeTokens;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](disasterModeTokens, "objectForKey:", v8));

    uint64_t v10 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "   Using disaster mode token for URI: %@   token: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"   Using disaster mode token for URI: %@   token: %@");
    }
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_disasterModeTokens, "allKeys"));
  if ((unint64_t)[v8 count] >= 5)
  {
    disasterModeTokens = self->_disasterModeTokens;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__imFirstObject"));
    -[NSMutableDictionary removeObjectForKey:](disasterModeTokens, "removeObjectForKey:", v10);
  }

  if (!self->_disasterModeTokens)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v12 = self->_disasterModeTokens;
    self->_disasterModeTokens = Mutable;
  }

  uint64_t v13 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "   Setting disaster mode token for URI: %@   token: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"   Setting disaster mode token for URI: %@   token: %@");
  }

  id v16 = v6;
  if (v16)
  {
    id v17 = self->_disasterModeTokens;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
    CFDictionarySetValue((CFMutableDictionaryRef)v17, v18, v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100693E20(v7);
  }
}

- (id)persistenceManagerForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_restrictedPersistenceManager)
  {
    int v6 = IDSShouldUseRestrictedLoggingForService(v4);
    p_swiftDataManager = &self->_swiftDataManager;
    if (v6) {
      p_swiftDataManager = &self->_restrictedPersistenceManager;
    }
  }

  else
  {
    p_swiftDataManager = &self->_swiftDataManager;
  }

  v8 = *p_swiftDataManager;

  return v8;
}

- (id)persistenceManagers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = v3;
  if (self->_swiftDataManager) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_restrictedPersistenceManager) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v218 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v215 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v222 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v206 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData persistenceManagerForService:]( self,  "persistenceManagerForService:",  v11));
  __int128 v316 = 0u;
  __int128 v315 = 0u;
  __int128 v314 = 0u;
  __int128 v313 = 0u;
  id obj = v9;
  id v216 = [obj countByEnumeratingWithState:&v313 objects:v335 count:16];
  if (v216)
  {
    uint64_t v214 = *(void *)v314;
    uint64_t v241 = IDSGameCenterContactsAssociationID;
    uint64_t v246 = IDSGameCenterContactsSharingState;
    uint64_t v240 = IDSGameCenterContactsLastUpdatedDate;
    uint64_t v247 = _IDSIdentityClientDataMessageProtectionIdentityKey;
    uint64_t v239 = IDSRegistrationPropertyShowPeerErrors;
    uint64_t v225 = _IDSIdentityClientDataGroupCryptoVersionNumberKey;
    uint64_t v224 = _IDSIdentityClientDataDevicePublicIdentityKey;
    uint64_t v230 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
    uint64_t v223 = _IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
    uint64_t v228 = _IDSIdentityClientDataMessageProtectionNGMWebPublicIdentityKey;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v314 != v214)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }

        uint64_t v217 = v12;
        v14 = *(void **)(*((void *)&v313 + 1) + 8 * v12);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
        v220 = (void *)objc_claimAutoreleasedReturnValue([v218 objectForKey:v15]);

        v219 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"identities"]);
        id v250 = objc_alloc_init(&OBJC_CLASS___IDSEndpointURIProperties);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"sender-correlation-identifier"]);
        [v250 setSenderCorrelationIdentifier:v16];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"short-handle"]);
        [v250 setShortHandle:v17];

        if (v220) {
          BOOL v18 = v218 != 0LL;
        }
        else {
          BOOL v18 = 0;
        }
        if (v11 != 0 && v18 && [v219 count])
        {
          v227 = (void *)objc_claimAutoreleasedReturnValue([v220 _stringForKey:@"anonymized-sender-id"]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v220 _numberForKey:@"biz-trusted"]);
          unsigned __int8 v226 = [v19 BOOLValue];

          v209 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"kt-blob"]);
          v212 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"kt-status"]);
          v234 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"kt-account-key"]);
          v211 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:@"kt-opt-in"]);
          unsigned int v20 = [v211 BOOLValue];
          if (v212)
          {
            __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413314;
              uint64_t v326 = (uint64_t)v11;
              __int16 v327 = 2112;
              v328 = (_UNKNOWN **)v14;
              __int16 v329 = 2112;
              id v330 = v234;
              __int16 v331 = 2112;
              id v332 = v212;
              __int16 v333 = 2112;
              v334 = v209;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Found KT status in query result { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }",  buf,  0x34u);
            }
          }

          if (v14)
          {
            if (!v234)
            {
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
              v23 = (void *)objc_claimAutoreleasedReturnValue([v22 _md5Hash]);
              v234 = (void *)objc_claimAutoreleasedReturnValue([v23 dataUsingEncoding:4]);

              id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v326 = (uint64_t)v234;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Per-URI KT account identifier is missing from the IDS response, which may cause KT verification failur es -- using URI hash instead { KTAccountKey: %@ }",  buf,  0xCu);
              }
            }

            v210 = -[IDSKeyTransparencyIndex initWithServiceIdentifier:accountKey:URI:]( objc_alloc(&OBJC_CLASS___IDSKeyTransparencyIndex),  "initWithServiceIdentifier:accountKey:URI:",  v11,  v234,  v14);
          }

          else
          {
            v210 = 0LL;
          }

          v232 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v238 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v312 = 0u;
          __int128 v311 = 0u;
          __int128 v310 = 0u;
          __int128 v309 = 0u;
          id v231 = v219;
          id v244 = [v231 countByEnumeratingWithState:&v309 objects:v324 count:16];
          uint64_t v207 = v20;
          if (v244)
          {
            char v257 = 0;
            uint64_t v242 = *(void *)v310;
            id v25 = @"NO";
            if (v20) {
              id v25 = @"YES";
            }
            v233 = v25;
            do
            {
              uint64_t v26 = 0LL;
              do
              {
                if (*(void *)v310 != v242)
                {
                  uint64_t v27 = v26;
                  objc_enumerationMutation(v231);
                  uint64_t v26 = v27;
                }

                uint64_t v251 = v26;
                v28 = *(void **)(*((void *)&v309 + 1) + 8 * v26);
                id v272 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_dataForKey:", @"push-token", v199, v202, v203, v204));
                v263 = (void *)objc_claimAutoreleasedReturnValue([v28 _dataForKey:@"session-token"]);
                uint64_t v29 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Found identity:", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled(v31)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup_SwiftData", @"Found identity:");
                }

                v274 = (void *)objc_claimAutoreleasedReturnValue([v28 _dictionaryForKey:@"client-data"]);
                v268 = (void *)objc_claimAutoreleasedReturnValue([v28 _stringForKey:@"device-name"]);
                v265 = (void *)objc_claimAutoreleasedReturnValue([v28 _dictionaryForKey:@"private-device-data"]);
                id v259 = 0LL;
                if (v268 && v265) {
                  id v259 = [[IDSFamilyEndpointData alloc] initWithDeviceName:v268 privateDeviceData:v265];
                }
                v266 = (void *)objc_claimAutoreleasedReturnValue([v28 _dataForKey:@"kt-loggable-data"]);
                v262 = (void *)objc_claimAutoreleasedReturnValue([v274 _dataForKey:@"device-key-signature"]);
                v32 = (void *)objc_claimAutoreleasedReturnValue([v28 _numberForKey:@"kt-mismatch-account-flag"]);
                unsigned int v252 = [v32 BOOLValue];

                v33 = (void *)objc_claimAutoreleasedReturnValue([v28 _numberForKey:@"ktbility"]);
                unsigned int v256 = [v33 BOOLValue];

                v267 = (void *)objc_claimAutoreleasedReturnValue([v274 _stringForKey:v241]);
                v34 = (void *)objc_claimAutoreleasedReturnValue([v274 _numberForKey:v246]);
                v270 = &off_100946768;
                if (([v34 isEqualToNumber:&off_100946750] & 1) == 0)
                {
                  v270 = (_UNKNOWN **)(id)objc_claimAutoreleasedReturnValue([v274 _numberForKey:v246]);
                }

                v35 = (void *)objc_claimAutoreleasedReturnValue([v274 _numberForKey:v240]);
                v264 = v35;
                if (v35)
                {
                  [v35 doubleValue];
                  id v261 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
                }

                else
                {
                  id v261 = 0LL;
                }

                uint64_t v36 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v326 = (uint64_t)v267;
                  __int16 v327 = 2112;
                  v328 = v270;
                  __int16 v329 = 2112;
                  id v330 = v261;
                  _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@",  buf,  0x20u);
                }

                if (os_log_shim_legacy_logging_enabled(v38)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v202 = v270;
                  id v203 = v261;
                  v200 = v267;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@");
                }

                if (v267 || v270 || v264) {
                  v253 = -[IDSGameCenterData initWithAssociationID:sharingState:lastUpdatedDate:]( objc_alloc(&OBJC_CLASS___IDSGameCenterData),  "initWithAssociationID:sharingState:lastUpdatedDate:",  v267,  v270,  v261);
                }
                else {
                  v253 = 0LL;
                }
                if (v272)
                {
                  v39 = -[IDSKeyTransparencyEntry initWithPushToken:loggableData:signedData:]( objc_alloc(&OBJC_CLASS___IDSKeyTransparencyEntry),  "initWithPushToken:loggableData:signedData:",  v272,  v266,  v262);
                  -[IDSKeyTransparencyEntry setKtCapable:](v39, "setKtCapable:", v256);
                  -[NSMutableArray addObject:](v232, "addObject:", v39);
                }

                v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v274, "_dataForKey:", v247, v200));
                v40 = (void *)objc_claimAutoreleasedReturnValue([v274 _numberForKey:v239]);
                unsigned int v41 = [v40 intValue];

                uint64_t v42 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v44 = IDSLoggableDescriptionForTokenOnService(v272, v11);
                  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
                  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 debugDescription]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v46;
                  _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "              device pushToken: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v47)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  uint64_t v48 = IDSLoggableDescriptionForTokenOnService(v272, v11);
                  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                  v199 = (void *)objc_claimAutoreleasedReturnValue([v49 debugDescription]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"              device pushToken: %@");
                }

                uint64_t v50 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  id v52 = (id)objc_claimAutoreleasedReturnValue([v263 debugDescription]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v52;
                  _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "                 session token: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v53)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue([v263 debugDescription]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                 session token: %@");
                }

                uint64_t v54 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "                           uri: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v56)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = v14;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                           uri: %@");
                }

                uint64_t v57 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue([v250 senderCorrelationIdentifier]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v59;
                  _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  " sender-correlation-identifier: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v60)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue([v250 senderCorrelationIdentifier]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @" sender-correlation-identifier: %@");
                }

                uint64_t v61 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                {
                  v63 = (void *)objc_claimAutoreleasedReturnValue([v250 shortHandle]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v63;
                  _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "                  short-handle: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v64)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue([v250 shortHandle]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                  short-handle: %@");
                }

                uint64_t v65 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                {
                  id v67 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v274,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v67;
                  _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "                    clientData: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v68)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v274,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                    clientData: %@");
                }

                uint64_t v69 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v268;
                  _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "                   device-name: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v71)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = v268;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                   device-name: %@");
                }

                uint64_t v72 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  id v74 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v265,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v74;
                  _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "           private-device-data: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v75)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v265,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"           private-device-data: %@");
                }

                uint64_t v76 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                {
                  id v78 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v266,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v78;
                  _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "              kt-loggable-data: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v79)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v266,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"              kt-loggable-data: %@");
                }

                uint64_t v80 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  id v82 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v234,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v82;
                  _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "                kt-account-key: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v83)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v234,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                kt-account-key: %@");
                }

                uint64_t v84 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v233;
                  _os_log_impl( (void *)&_mh_execute_header,  v85,  OS_LOG_TYPE_DEFAULT,  "                     kt-opt-in: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v86)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)v233;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                     kt-opt-in: %@");
                }

                uint64_t v87 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  id v89 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v262,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v89;
                  _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "          device-key-signature: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v90)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v262,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"          device-key-signature: %@");
                }

                uint64_t v91 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  v93 = @"NO";
                  if (v252) {
                    v93 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v93;
                  _os_log_impl( (void *)&_mh_execute_header,  v92,  OS_LOG_TYPE_DEFAULT,  "      kt-mismatch-account-flag: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v94)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v95 = @"NO";
                  if (v252) {
                    v95 = @"YES";
                  }
                  v199 = (void *)v95;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"      kt-mismatch-account-flag: %@");
                }

                uint64_t v96 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  v98 = @"NO";
                  if (v256) {
                    v98 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v98;
                  _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "               kt-capable-flag: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v99)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v100 = @"NO";
                  if (v256) {
                    v100 = @"YES";
                  }
                  v199 = (void *)v100;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"               kt-capable-flag: %@");
                }

                uint64_t v101 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
                if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                {
                  v103 = @"NO";
                  if (v41) {
                    v103 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v103;
                  _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEFAULT,  "                    showErrors: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v104)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v105 = @"NO";
                  if (v41) {
                    v105 = @"YES";
                  }
                  v199 = (void *)v105;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                    showErrors: %@");
                }

                if (v260) {
                  goto LABEL_155;
                }
                uint64_t v106 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                v107 = (os_log_s *)objc_claimAutoreleasedReturnValue(v106);
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v326 = (uint64_t)v272;
                  _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "   No known public key found for token: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v108)
                  && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                {
                  v199 = v272;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"   No known public key found for token: %@");
                }

                if (!objc_msgSend(v11, "isEqualToIgnoringCase:", @"com.apple.madrid", v199))
                {
LABEL_155:
                  if (v272)
                  {
                    uint64_t v112 = IMGetDomainIntForKey(@"com.apple.ids", @"IDSIDRefreshExpiry");
                    uint64_t v113 = IMGetDomainIntForKey(@"com.apple.ids", @"IDSIDHardExpiry");
                    v254 = (void *)objc_claimAutoreleasedReturnValue([v28 _numberForKey:@"session-token-refresh-seconds"]);
                    v255 = (void *)objc_claimAutoreleasedReturnValue([v28 _numberForKey:@"session-token-expires-seconds"]);
                    if (v112)
                    {
                      uint64_t v114 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                      v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
                      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v326 = v112;
                        _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "                    Overwriting soft TTL with: %ld seconds",  buf,  0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled(v116)
                        && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                      {
                        v199 = (void *)v112;
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                    Overwriting soft TTL with: %ld seconds");
                      }

                      uint64_t v117 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v112, v199));

                      v254 = (void *)v117;
                    }

                    if (v113)
                    {
                      uint64_t v118 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                      v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);
                      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v326 = v113;
                        _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEFAULT,  "                    Overwriting hard TTL with: %ld seconds",  buf,  0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled(v120)
                        && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                      {
                        v199 = (void *)v113;
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"                    Overwriting hard TTL with: %ld seconds");
                      }

                      uint64_t v121 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v113, v199));

                      v255 = (void *)v121;
                    }

                    objc_msgSend(v254, "doubleValue", v199);
                    v249 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                    [v255 doubleValue];
                    v248 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                    uint64_t v122 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
                    v123 = (os_log_s *)objc_claimAutoreleasedReturnValue(v122);
                    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138413058;
                      uint64_t v326 = (uint64_t)v11;
                      __int16 v327 = 2112;
                      v328 = (_UNKNOWN **)v14;
                      __int16 v329 = 2112;
                      id v330 = v249;
                      __int16 v331 = 2112;
                      id v332 = v248;
                      _os_log_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEFAULT,  "   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,",  buf,  0x2Au);
                    }

                    if (os_log_shim_legacy_logging_enabled(v124)
                      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
                    {
                      id v203 = v249;
                      id v204 = v248;
                      v199 = v11;
                      v202 = (_UNKNOWN **)v14;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,");
                    }

                    if (v263 && v255 && v254)
                    {
                      if ([v10 isEqualToURI:v14]) {
                        -[IDSPeerIDManager_SwiftData _setDisasterModeToken:forURI:]( self,  "_setDisasterModeToken:forURI:",  v263,  v10);
                      }
                      v125 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEndpointCapabilities allowedCapabilities]( &OBJC_CLASS___IDSEndpointCapabilities,  "allowedCapabilities",  v199));
                      v323[0] = v247;
                      v323[1] = v225;
                      v323[2] = v224;
                      v323[3] = v230;
                      v323[4] = v223;
                      v323[5] = v228;
                      v126 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v323,  6LL));
                      v127 = (void *)objc_claimAutoreleasedReturnValue([v125 arrayByAddingObjectsFromArray:v126]);

                      v128 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v127 count]);
                      __int128 v308 = 0u;
                      __int128 v307 = 0u;
                      __int128 v306 = 0u;
                      __int128 v305 = 0u;
                      id v129 = v127;
                      id v130 = [v129 countByEnumeratingWithState:&v305 objects:v322 count:16];
                      if (v130)
                      {
                        uint64_t v131 = *(void *)v306;
                        do
                        {
                          for (i = 0LL; i != v130; i = (char *)i + 1)
                          {
                            if (*(void *)v306 != v131) {
                              objc_enumerationMutation(v129);
                            }
                            uint64_t v133 = *(void *)(*((void *)&v305 + 1) + 8LL * (void)i);
                            v134 = (void *)objc_claimAutoreleasedReturnValue([v274 objectForKey:v133]);
                            if (v134) {
                              -[NSMutableDictionary setObject:forKey:](v128, "setObject:forKey:", v134, v133);
                            }
                          }

                          id v130 = [v129 countByEnumeratingWithState:&v305 objects:v322 count:16];
                        }

                        while (v130);
                      }

                      v135 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                      [v135 timeIntervalSince1970];
                      double v137 = v136;

                      v237 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v128, "_dataForKey:", v247));
                      v236 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v128, "_dataForKey:", v230));
                      v138 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDServiceController sharedInstance]( &OBJC_CLASS___IDSDServiceController,  "sharedInstance"));
                      v258 = (void *)objc_claimAutoreleasedReturnValue([v138 serviceWithIdentifier:v11]);

                      if (!v266) {
                        v266 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v128, "_dataForKey:", v228));
                      }
                      v243 = -[IDSProtoKeyTransparencyLoggableData initWithData:]( objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData),  "initWithData:",  v266);
                      v235 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData ngmPublicIdentity]( v243,  "ngmPublicIdentity"));
                      context = objc_autoreleasePoolPush();
                      if ([v258 applicationKeyIndex]
                        && -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitysCount]( v243,  "applicationPublicIdentitysCount"))
                      {
                        __int128 v304 = 0u;
                        __int128 v303 = 0u;
                        __int128 v302 = 0u;
                        __int128 v301 = 0u;
                        id v245 = (id)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitys]( v243,  "applicationPublicIdentitys"));
                        id v139 = [v245 countByEnumeratingWithState:&v301 objects:v321 count:16];
                        if (v139)
                        {
                          uint64_t v140 = *(void *)v302;
                          while (2)
                          {
                            for (j = 0LL; j != v139; j = (char *)j + 1)
                            {
                              if (*(void *)v302 != v140) {
                                objc_enumerationMutation(v245);
                              }
                              v142 = *(void **)(*((void *)&v301 + 1) + 8LL * (void)j);
                              unsigned int v143 = [v142 keyIndex];
                              if (v143 == sub_1002E08A0((int)[v258 applicationKeyIndex]))
                              {
                                id v139 = (id)objc_claimAutoreleasedReturnValue([v142 publicIdentity]);
                                goto LABEL_209;
                              }
                            }

                            id v139 = [v245 countByEnumeratingWithState:&v301 objects:v321 count:16];
                            if (v139) {
                              continue;
                            }
                            break;
                          }
                        }

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8
{
  LOBYTE(v9) = 1;
  return -[IDSPeerIDManager_SwiftData sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:]( self,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v78 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v19 = 1LL;
  if (!v9) {
    uint64_t v19 = 2LL;
  }
  if (v10) {
    uint64_t v20 = 0LL;
  }
  else {
    uint64_t v20 = v19;
  }
  v73 = self;
  id v74 = v16;
  v70 = v15;
  uint64_t v71 = v17;
  uint64_t v72 = v18;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]( self,  "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:",  v15,  v16,  v17,  v18,  v20,  a9));
  id v76 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (v76)
  {
    uint64_t v75 = *(void *)v90;
    do
    {
      for (i = 0LL; i != v76; i = (char *)i + 1)
      {
        if (*(void *)v90 != v75) {
          objc_enumerationMutation(obj);
        }
        uint64_t v80 = *(void *)(*((void *)&v89 + 1) + 8LL * (void)i);
        uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:"));
        if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens"))
        {
          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData _disasterModeTokenForURI:](v73, "_disasterModeTokenForURI:", v74));
          BOOL v22 = v21 != 0LL;
          if (v21)
          {
            uint64_t v23 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v97 = v74;
              __int16 v98 = 2112;
              uint64_t v99 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Returning disaster mode token for from URI: %@   token: %@",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v25)
              && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
            {
              uint64_t v68 = v74;
              uint64_t v69 = v21;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Returning disaster mode token for from URI: %@   token: %@");
            }
          }
        }

        else
        {
          BOOL v22 = 0;
        }

        id v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v78, "objectForKeyedSubscript:", v80, v68, v69));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"dates-expire"]);
        id v27 = [v26 mutableCopy];
        v28 = v27;
        if (v27) {
          id v84 = v27;
        }
        else {
          id v84 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"dates-refresh"]);
        id v30 = [v29 mutableCopy];
        uint64_t v31 = v30;
        if (v30) {
          id v32 = v30;
        }
        else {
          id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        v33 = v32;

        v34 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"push-tokens"]);
        id v35 = [v34 mutableCopy];
        uint64_t v36 = v35;
        if (v35) {
          id v37 = v35;
        }
        else {
          id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        uint64_t v38 = v37;

        v39 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"session-tokens"]);
        id v40 = [v39 mutableCopy];
        unsigned int v41 = v40;
        if (v40) {
          id v42 = v40;
        }
        else {
          id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        v43 = v42;

        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"anonymized-sender-ids"]);
        id v45 = [v44 mutableCopy];
        v46 = v45;
        if (v45) {
          id v83 = v45;
        }
        else {
          id v83 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }

        if (!v22)
        {
          __int128 v87 = 0u;
          __int128 v88 = 0u;
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          id v47 = v79;
          id v48 = [v47 countByEnumeratingWithState:&v85 objects:v95 count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v86;
            do
            {
              for (j = 0LL; j != v48; j = (char *)j + 1)
              {
                if (*(void *)v86 != v49) {
                  objc_enumerationMutation(v47);
                }
                v51 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)j);
                id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 refreshDate]);
                uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v51 expireDate]);
                [v84 addObject:v53];

                [v33 addObject:v52];
                uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v51 pushToken]);
                [v38 addObject:v54];

                uint64_t v55 = objc_claimAutoreleasedReturnValue([v51 sessionToken]);
                [v43 addObject:v55];

                uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v51 anonymizedSenderID]);
                LOBYTE(v55) = v56 == 0LL;

                if ((v55 & 1) == 0)
                {
                  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v51 anonymizedSenderID]);
                  [v83 addObject:v57];
                }
              }

              id v48 = [v47 countByEnumeratingWithState:&v85 objects:v95 count:16];
            }

            while (v48);
          }
        }

        v93[0] = @"dates-expire";
        id v58 = [v84 copy];
        v94[0] = v58;
        v93[1] = @"dates-refresh";
        id v59 = [v33 copy];
        v94[1] = v59;
        v93[2] = @"push-tokens";
        id v60 = [v38 copy];
        v94[2] = v60;
        v93[3] = @"session-tokens";
        id v61 = [v43 copy];
        v94[3] = v61;
        v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v94,  v93,  4LL));
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v62));

        if ([v83 count])
        {
          id v64 = [v83 copy];
          [v63 setValue:v64 forKey:@"anonymized-sender-ids"];
        }

        id v65 = [v63 copy];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v65, v80);
      }

      id v76 = [obj countByEnumeratingWithState:&v89 objects:v100 count:16];
    }

    while (v76);
  }

  id v66 = -[NSMutableDictionary copy](v78, "copy");
  return v66;
}

- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v51 = a4;
  id v49 = a5;
  id v14 = a6;
  id v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id v16 = v13;
  id v50 = [v16 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v50)
  {
    BOOL v43 = v8;
    id v44 = v14;
    unsigned int v17 = 0;
    uint64_t v46 = *(void *)v64;
    id v47 = v15;
    id obj = v16;
    do
    {
      for (i = 0LL; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v64 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
        uint64_t v20 = objc_autoreleasePoolPush();
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 tokenFreeURI]);
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v19 pushToken]);
        objc_autoreleasePoolPop(v20);
        -[NSMutableArray addObject:](v48, "addObject:", v21);
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v21));
        id v23 = [v22 mutableCopy];
        id v24 = v23;
        if (v23) {
          uint64_t v25 = (NSMutableArray *)v23;
        }
        else {
          uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        }
        uint64_t v53 = v25;

        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v49,  v51,  v21,  0LL));
        if (a7 == 1 || a7 == 2 && [v21 isEqualToURI:v51])
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDPushHandler pushToken](self->_pushHandler, "pushToken"));
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472LL;
          v61[2] = sub_10001012C;
          v61[3] = &unk_1008F6110;
          id v62 = v27;
          id v28 = v27;
          uint64_t v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v61));

          uint64_t v26 = (void *)v29;
        }

        if (v54)
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_100010170;
          v59[3] = &unk_1008F6110;
          id v60 = v54;
          uint64_t v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v59));

          uint64_t v26 = (void *)v30;
        }

        __int128 v57 = 0u;
        __int128 v58 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        id v31 = v26;
        id v32 = [v31 countByEnumeratingWithState:&v55 objects:v67 count:16];
        if (v32)
        {
          id v34 = v32;
          uint64_t v35 = *(void *)v56;
          while (2)
          {
            for (j = 0LL; j != v34; j = (char *)j + 1)
            {
              if (*(void *)v56 != v35) {
                objc_enumerationMutation(v31);
              }
              if ((v17 & 1) != 0)
              {
                unsigned int v17 = 1;
                goto LABEL_25;
              }

              id v37 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)j);
              uint64_t v38 = (void *)objc_opt_class(self, v33);
              v39 = (void *)objc_claimAutoreleasedReturnValue([v37 refreshDate]);
              unsigned int v17 = [v38 _datePassed:v39];
            }

            id v34 = [v31 countByEnumeratingWithState:&v55 objects:v67 count:16];
            if (v34) {
              continue;
            }
            break;
          }
        }

- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData publicKeyForURI:pushToken:fromURI:service:]( self,  "publicKeyForURI:pushToken:fromURI:service:",  a3,  a4,  a5,  a6));
  BOOL v7 = v6 != 0LL;

  return v7;
}

- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  a6,  a5,  a3,  1LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000102F8;
  v17[3] = &unk_1008F6110;
  id v18 = v10;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "__imArrayByFilteringWithBlock:", v17));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serializedPublicLegacyIdentity]);
  return v15;
}

- (id)publicDeviceIdentityContainerForPushToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache mapTableRepresentation](self->_dbCache, "mapTableRepresentation"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyEnumerator]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    uint64_t v26 = *(void *)v35;
    id v27 = self;
    id v29 = v8;
    do
    {
      id v12 = 0LL;
      id v28 = v10;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v12);
        if (objc_msgSend(v13, "hasMatchingURIs", v26, v27))
        {
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_dbCache, "objectForKey:", v13));
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 endpoints]);

          id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v31;
            while (2)
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
                __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pushToken]);
                BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v4 rawToken]);
                unsigned __int8 v23 = [v22 isEqualToData:v21];

                if ((v23 & 1) != 0)
                {
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v20 publicDeviceIdentityContainer]);

                  id v8 = v29;
                  goto LABEL_21;
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v26;
          self = v27;
          id v10 = v28;
          id v8 = v29;
        }

        id v12 = (char *)v12 + 1;
      }

      while (v12 != v10);
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      id v24 = 0LL;
    }

    while (v10);
  }

  else
  {
    id v24 = 0LL;
  }

- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  a5,  a4,  a3,  1LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 senderCorrelationIdentifier]);
  return v7;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  a6,  a5,  a3,  1LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000106E0;
  v17[3] = &unk_1008F6110;
  id v18 = v10;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "__imArrayByFilteringWithBlock:", v17));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 senderCorrelationIdentifier]);
  return v15;
}

- (id)sessionTokenForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6 expirationDate:(id *)a7 refreshDate:(id *)a8 fromIdentity:(id)a9 includeSelfDevice:(BOOL)a10
{
  id v15 = a3;
  id v40 = v15;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v40, 1LL));
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:]( self,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:",  v20,  v18,  v17,  v16,  a10,  0LL));

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary, v22);
  id v24 = v15;
  v39 = v21;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v24]);
  if ((objc_opt_isKindOfClass(v25, v23) & 1) != 0)
  {
    id v26 = v25;
  }

  else
  {
    if (v25)
    {
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_100693ECC((uint64_t)v24, v23, v27);
      }
    }

    id v26 = 0LL;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 _arrayForKey:@"session-tokens"]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 _arrayForKey:@"push-tokens"]);
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v26 _arrayForKey:@"dates-refresh"]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v26 _arrayForKey:@"dates-expire"]);
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v19 rawToken]);

  id v33 = [v29 indexOfObject:v32];
  if (v33 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    __int128 v34 = 0LL;
  }

  else
  {
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:v33]);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndex:v33]);
    if (a7) {
      *a7 = v35;
    }
    if (a8) {
      *a8 = v36;
    }
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndex:", v33, a8));
  }

  return v34;
}

- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if ((_DWORD)v6 == 1)
  {
    id v14 = 0LL;
    if (v10 && v11 && v12)
    {
      id v28 = v10;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v12,  v11,  v10,  1LL));
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        id v14 = 0LL;
        uint64_t v18 = *(void *)v30;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
            if (v14)
            {
              id v22 = [v21 compare:v14];

              if (v22 != (id)-1LL) {
                continue;
              }
            }

            uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 expireDate]);

            id v14 = (void *)v23;
          }

          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }

        while (v17);
      }

      else
      {
        id v14 = 0LL;
      }

      id v10 = v28;
    }

    [v14 timeIntervalSinceNow];
    double v25 = v26;
  }

  else
  {
    +[IDSBagUtilities timeToCacheResultsForIDStatus:forService:]( &OBJC_CLASS___IDSBagUtilities,  "timeToCacheResultsForIDStatus:forService:",  v6,  v12);
    double v25 = v24;
  }

  return v25;
}

- (int64_t)_valueOfProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v38 = v13;
  v39 = v15;
  if (v12)
  {
    id v37 = v16;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v16,  v15,  v13,  0LL));
    id v17 = 0LL;
    id v18 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v42;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(obj);
          }
          __int16 v21 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushTokenObject", v34, v35, v36));
          unsigned int v23 = [v22 isEqualToPushToken:v14];

          if (v23)
          {
            double v24 = (void *)objc_claimAutoreleasedReturnValue([v21 capabilities]);
            id v17 = [v24 valueForCapability:v12];

            uint64_t v25 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
            double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v27 = @"YES";
              if (!v17) {
                id v27 = @"NO";
              }
              id v46 = v12;
              __int16 v47 = 2112;
              id v48 = v27;
              __int16 v49 = 2112;
              id v50 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Found %@ value: %@  for peer token: %@",  buf,  0x20u);
            }

            if (os_log_shim_legacy_logging_enabled(v28)
              && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
            {
              __int128 v29 = @"YES";
              if (!v17) {
                __int128 v29 = @"NO";
              }
              __int128 v35 = v29;
              __int128 v36 = v14;
              id v34 = v12;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Found %@ value: %@  for peer token: %@");
            }
          }

          else
          {
            uint64_t v30 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
            __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v46 = v12;
              __int16 v47 = 2112;
              id v48 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "** No %@ value found for peer token: %@",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v32)
              && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
            {
              id v34 = v12;
              __int128 v35 = v14;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"** No %@ value found for peer token: %@");
            }
          }
        }

        id v18 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
      }

      while (v18);
    }

    id v16 = v37;
  }

  else
  {
    id v17 = 0LL;
  }

  return (int64_t)v17;
}

- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7
{
  return -[IDSPeerIDManager_SwiftData _valueOfProperty:forURI:pushToken:fromURI:service:]( self,  "_valueOfProperty:forURI:pushToken:fromURI:service:",  a3,  a4,  a5,  a6,  a7) > 0;
}

- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  return -[IDSPeerIDManager_SwiftData hasProperty:forURI:pushToken:fromURI:service:]( self,  "hasProperty:forURI:pushToken:fromURI:service:",  IDSRegistrationPropertyShowPeerErrors,  a3,  a4,  a5,  a6);
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v10 && v9 && v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData endpointsForURIs:service:fromURI:ignoringTTL:]( self,  "endpointsForURIs:service:fromURI:ignoringTTL:",  v8,  v9,  v10,  0LL));
  }

  else
  {
    uint64_t v13 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Missing required field(s) for endpointsForURIs -- returning nil {uris: %@, service: %@, fromURI: %@}",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v15)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      id v19 = v9;
      id v20 = v10;
      id v18 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Missing required field(s) for endpointsForURIs -- returning nil {uris: %@, service: %@, fromURI: %@}");
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary", v18, v19, v20));
  }

  id v16 = (void *)v12;

  return v16;
}

- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v10 && v11 && v12 && v13)
  {
    id v26 = v11;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData endpointsForURIs:service:fromURI:]( self,  "endpointsForURIs:service:fromURI:",  v15,  v12,  v14));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v11]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000113A8;
    v24[3] = &unk_1008F6110;
    id v25 = v10;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "__imArrayByFilteringWithBlock:", v24));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
  }

  else
  {
    uint64_t v20 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Missing required field(s) for endpointForPushToken -- returning nil {pushToken: %@, URI: %@, service: %@, fromURI: %@}",  buf,  0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled(v22)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Missing required field(s) for endpointForPushToken -- returning nil {pushToken: %@, URI: %@, service: %@, fromURI: %@}");
    }

    id v19 = 0LL;
  }

  return v19;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(const void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v11,  v12,  v18,  v6));
        if (v19) {
          CFDictionarySetValue((CFMutableDictionaryRef)theDict, v18, v19);
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v15);
  }

  return theDict;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  theDict = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(const void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v11,  v12,  v18,  0LL));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100011738;
        v24[3] = &unk_1008F6110;
        id v25 = v13;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imArrayByFilteringWithBlock:", v24));
        if (v20) {
          CFDictionarySetValue(theDict, v18, v20);
        }
      }

      id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v15);
  }

  return theDict;
}

- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8
{
  char v62 = a6;
  id v12 = a3;
  id v13 = a4;
  id v52 = a5;
  id v50 = a7;
  id v14 = a8;
  uint64_t v53 = v13;
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v51 = v14;
  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);
  id v60 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData endpointsForURIs:service:fromURI:ignoringTTL:]( self,  "endpointsForURIs:service:fromURI:ignoringTTL:",  v12,  v13,  v52,  1LL));
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id obj = v12;
  id v59 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v59)
  {
    uint64_t v56 = *(void *)v68;
    do
    {
      for (i = 0LL; i != v59; i = (char *)i + 1)
      {
        if (*(void *)v68 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
        if ((v62 & 1) == 0) {
          goto LABEL_7;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:*(void *)(*((void *)&v67 + 1) + 8 * (void)i)]);

        if (!v17)
        {
          uint64_t v29 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "URI %@ didn't have remote devices.",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v31)
            && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
          {
            id v48 = v16;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"URI %@ didn't have remote devices.");
          }

- (id)lightDescriptionForVerifierResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v5 = objc_opt_class(v3, v4);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 succeed]));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 uiStatus]));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 staticAccountKeyStatus]));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 publicID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 failure]);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p; KTResult: %@, UIStatus: %@, StaticKeyResult: %@, AccountKey: %@, Error: %@>",
                            v5,
                            v3,
                            v6,
                            v7,
                            v8,
                            v9,
                            v10));
  }

  else
  {
    id v11 = &stru_100912B50;
  }

  return v11;
}

+ (BOOL)_datePassed:(id)a3
{
  return v3 <= 0.0;
}

- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6
{
  return -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:ignoreCache:hitCache:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:ignoreCache:hitCache:",  a3,  a4,  a5,  a6,  0LL,  0LL);
}

- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6 ignoreCache:(BOOL)a7 hitCache:(BOOL *)a8
{
  BOOL v10 = a6;
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  id v14 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v35,  v36,  v37);
  if (a7)
  {
LABEL_21:
    if (a8) {
      *a8 = 0;
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _loadCachedPeerIDValueForKey:ignoreExpiration:]( self,  "_loadCachedPeerIDValueForKey:ignoreExpiration:",  v14,  v10));
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v16 endpoints]);
    goto LABEL_24;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_dbCache, "objectForKey:", v14));
  uint64_t v16 = v15;
  if (!v15)
  {
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog PeerLookup_DBCache](&OBJC_CLASS___IDSFoundationLog, "PeerLookup_DBCache"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v43 = v35;
      __int16 v44 = 2112;
      id v45 = v36;
      __int16 v46 = 2112;
      id v47 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "DB Cache Miss { service: %@, fromURI: %@, toURI: %@ }",  buf,  0x20u);
    }

    goto LABEL_21;
  }

  if (a8) {
    *a8 = 1;
  }
  if (!v10)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 endpoints]);
    id v19 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v39;
      while (2)
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          __int128 v22 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          uint64_t v23 = (void *)objc_opt_class(self, v18);
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 expireDate]);
          LODWORD(v23) = [v23 _datePassed:v24];

          if ((_DWORD)v23)
          {
            uint64_t v30 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v22 URI]);
              *(_DWORD *)buf = 138412290;
              id v43 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "** At least one session token expired for: %@, need to get new ones",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v33)
              && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
            {
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v22 URI]);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"** At least one session token expired for: %@, need to get new ones");
            }

            __int128 v28 = 0LL;
            goto LABEL_25;
          }
        }

        id v19 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }

  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog PeerLookup_DBCache](&OBJC_CLASS___IDSFoundationLog, "PeerLookup_DBCache"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v43 = v35;
    __int16 v44 = 2112;
    id v45 = v36;
    __int16 v46 = 2112;
    id v47 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "DB Cache Hit { service: %@, fromURI: %@, toURI: %@ }",  buf,  0x20u);
  }

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v16 endpoints]);
LABEL_24:
  __int128 v28 = (void *)v26;
LABEL_25:

  return v28;
}

- (id)_peerIDKeysForService:(id)a3 andFromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache mapTableRepresentation](self->_dbCache, "mapTableRepresentation"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyEnumerator]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001254C;
  v15[3] = &unk_1008F6138;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__imArrayByFilteringWithBlock:", v15));

  return v13;
}

- (id)_peerIDKeysForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache mapTableRepresentation](self->_dbCache, "mapTableRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyEnumerator]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100012688;
  v11[3] = &unk_1008F6160;
  id v12 = v4;
  id v8 = v4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v11));

  return v9;
}

- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self->_keyTransparencyVerifier, "accountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self->_keyTransparencyVerifier, "serviceController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceWithIdentifier:v9]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 accountsOnService:v12]);

  __int128 v40 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * (void)i), "registration", v33));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uris]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imArrayByApplyingBlock:", &stru_1008F61A0));

        -[NSMutableSet addObjectsFromArray:](v40, "addObjectsFromArray:", v20);
      }

      id v15 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }

    while (v15);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v34 = v8;
  id v38 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v34);
        }
        __int128 v22 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
        uint64_t v23 = objc_autoreleasePoolPush();
        key = v22;
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 tokenFreeURI]);
        objc_autoreleasePoolPop(v23);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v25 = v40;
        id v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v41,  v53,  16LL);
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v42;
          while (2)
          {
            for (k = 0LL; k != v27; k = (char *)k + 1)
            {
              if (*(void *)v42 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _keyTransparencyVerifierResultForService:fromURI:toURI:]( self,  "_keyTransparencyVerifierResultForService:fromURI:toURI:",  v9,  v30,  v24));

              if (v31)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)theDict, key, v31);

                goto LABEL_23;
              }
            }

            id v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v41,  v53,  16LL);
            if (v27) {
              continue;
            }
            break;
          }
        }

- (id)_keyTransparencyVerifierResultForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData keyTransparencyContextForService:fromURI:toURI:]( self,  "keyTransparencyContextForService:fromURI:toURI:",  a3,  a4,  a5));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 verifierResult]);

  return v6;
}

- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v10,  v9,  v8);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_dbCache, "objectForKey:", v11));
  if (!v12) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _loadCachedPeerIDValueForKey:ignoreExpiration:]( self,  "_loadCachedPeerIDValueForKey:ignoreExpiration:",  v11,  0LL));
  }
  id v13 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 keyTransparencyContext]);

  return v14;
}

- (void)updateCachedVerifierResultsWithResults:(id)a3
{
  id v4 = a3;
  __int128 v48 = self;
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData persistenceManagerForService:]( self,  "persistenceManagerForService:",  @"com.apple.madrid"));
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v67 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Updating query cache with KT peer verification results { count: %lu }",  buf,  0xCu);
  }

  __int128 v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v42 = v4;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  __int128 v46 = (char *)[obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v63;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(obj);
        }
        __int128 v49 = v6;
        id v7 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache mapTableRepresentation](v48->_dbCache, "mapTableRepresentation"));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyEnumerator]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);

        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v59;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v59 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
              id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 service]);
              if ([v17 isEqualToString:@"com.apple.madrid"])
              {
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 toURI]);
                unsigned int v19 = [v7 isEqualToURI:v18];

                if (v19) {
                  -[NSMutableArray addObject:](v51, "addObject:", v16);
                }
              }

              else
              {
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v58 objects:v71 count:16];
          }

          while (v13);
        }

        id v6 = v49 + 1;
      }

      while (v49 + 1 != v46);
      __int128 v46 = (char *)[obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    }

    while (v46);
  }

  uint64_t v20 = v51;
  if (-[NSMutableArray count](v51, "count"))
  {
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v50 = v51;
    id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v54,  v70,  16LL);
    __int128 v22 = v42;
    if (v21)
    {
      id v23 = v21;
      char v24 = 0;
      uint64_t v25 = *(void *)v55;
      do
      {
        id v26 = 0LL;
        id v47 = v23;
        do
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v50);
          }
          id v27 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v26);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 toURI]);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](v48->_dbCache, "objectForKey:", v27));
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 keyTransparencyContext]);

          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 verifierResult]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v28]);
          if (([v31 isEqual:v32] & 1) == 0)
          {
            id v33 = v22;
            uint64_t v34 = v25;
            id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v67 = v28;
              __int16 v68 = 2112;
              __int128 v69 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "URI: %@ has a new KTVerifierResult: %@",  buf,  0x16u);
            }

            id v36 = objc_alloc(&OBJC_CLASS___IDSQueryKeyTransparencyContext);
            uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v30 accountKey]);
            id v38 = (void *)objc_claimAutoreleasedReturnValue([v30 queryResponseTime]);
            __int128 v39 = -[IDSQueryKeyTransparencyContext initWithVerifierResult:ticket:accountKey:queryResponseTime:ktOptIn:]( v36,  "initWithVerifierResult:ticket:accountKey:queryResponseTime:ktOptIn:",  v32,  0,  v37,  v38,  [v30 ktOptIn]);

            -[IDSPeerIDManager_SwiftData _updateKTContext:forURI:](v48, "_updateKTContext:forURI:", v39, v28);
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472LL;
            v52[2] = sub_1000131B8;
            v52[3] = &unk_1008F61C8;
            id v53 = v28;
            [v43 updateKeyTransparencyContext:v39 uri:v53 service:@"com.apple.madrid" completion:v52];

            char v24 = 1;
            uint64_t v25 = v34;
            __int128 v22 = v33;
            id v23 = v47;
          }

          id v26 = (char *)v26 + 1;
        }

        while (v23 != v26);
        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v50,  "countByEnumeratingWithState:objects:count:",  &v54,  v70,  16LL);
      }

      while (v23);
    }

    else
    {
      char v24 = 0;
    }

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v24 & 1));
    [v40 logMetric:v41 withName:@"IDSKTPeerVerificationResultsChanged"];

    uint64_t v20 = v51;
  }

  else
  {
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    __int128 v22 = v42;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v40, OS_LOG_TYPE_DEFAULT, "Found no keys to update.", buf, 2u);
    }
  }
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v17 = a11;
  id v18 = a10;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = -[IDSPeerIDQueryContext initWithSending:refresh:messaging:resultExpected:preventNewQuery:isForced:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryContext),  "initWithSending:refresh:messaging:resultExpected:preventNewQuery:isForced:",  v12,  v11,  0LL,  0LL,  0LL,  a9);
  LOBYTE(v12) = -[IDSPeerIDManager_SwiftData startQueryForURIs:fromIdentity:fromURI:fromService:context:reason:completionBlock:]( self,  "startQueryForURIs:fromIdentity:fromURI:fromService:context:reason:completionBlock:",  v22,  v21,  v20,  v19,  v23,  v18,  v17);

  return v12;
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v33 = a8;
  id v32 = a7;
  id v18 = a4;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", a3));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imSetByApplyingBlock:", &stru_1008F6208));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData endpointsForURIs:service:fromURI:]( self,  "endpointsForURIs:service:fromURI:",  v21,  v16,  v15));

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData queryHandler](self, "queryHandler"));
  char v24 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100013710;
  v34[3] = &unk_1008F6230;
  v34[4] = self;
  id v35 = v20;
  id v36 = v16;
  id v37 = v15;
  id v38 = v19;
  id v39 = v22;
  id v40 = v17;
  id v31 = v17;
  id v30 = v22;
  id v25 = v19;
  id v26 = v15;
  id v27 = v16;
  id v28 = v20;
  LOBYTE(v20) = [v23 startQueryForURIs:v24 fromIdentity:v18 fromURI:v26 fromService:v27 context:v32 reason:v33 completionBlock:v34];

  return (char)v20;
}

- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 prefixedURI]);
  id v14 = [v13 length];

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 rawToken]);
    id v16 = [v15 length];

    if (v16)
    {
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v12,  v11,  v10,  0LL));
      id v18 = [v17 countByEnumeratingWithState:&v49 objects:v60 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v50;
        while (2)
        {
          id v20 = 0LL;
          do
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v17);
            }
            unsigned __int8 v22 = [v21 isEqualToPushToken:v9];

            if ((v22 & 1) != 0)
            {
              char v23 = 1;
              goto LABEL_13;
            }

            id v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v17 countByEnumeratingWithState:&v49 objects:v60 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      char v23 = 0;
LABEL_13:

      uint64_t v24 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v55 = v9;
        __int16 v56 = 2112;
        id v57 = v10;
        __int16 v58 = 2112;
        id v59 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Checking peer token: %@ for URI: %@   (Tokens: %@)",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v26)
        && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
      {
        id v42 = v10;
        id v43 = v17;
        id v41 = v9;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Checking peer token: %@ for URI: %@   (Tokens: %@)");
      }

      if ((v23 & 1) != 0)
      {
        uint64_t v27 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "  => Good to go, we have it", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled(v29)
          && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup_SwiftData", @"  => Good to go, we have it");
        }
      }

      else
      {
        uint64_t v30 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "  => We don't have it - clearing that peer's map",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v32)
          && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"  => We don't have it - clearing that peer's map");
        }

        if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens",  v41,  v42,  v43))
        {
          uint64_t v33 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Not flushing tokens, we're in debilitated mode",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v35)
            && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Not flushing tokens, we're in debilitated mode");
          }
        }

        else
        {
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          id v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_purgeClientDataBlocks, "allValues"));
          id v37 = [v36 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v37)
          {
            uint64_t v38 = *(void *)v46;
            do
            {
              id v39 = 0LL;
              do
              {
                if (*(void *)v46 != v38) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v40 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)v39);
                if (v40) {
                  (*(void (**)(uint64_t, id))(v40 + 16))(v40, v12);
                }
                id v39 = (char *)v39 + 1;
              }

              while (v37 != v39);
              id v37 = [v36 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }

            while (v37);
          }

          -[IDSPeerIDManager_SwiftData forgetPeerTokensForURI:fromURI:service:]( self,  "forgetPeerTokensForURI:fromURI:service:",  v10,  v11,  v12);
        }
      }
    }
  }
}

- (void)clearCacheAndPersistImmediately:(BOOL)a3
{
  uint64_t v4 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing peer and personal caches", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v6)
    && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup_SwiftData", @"Clearing peer and personal caches");
  }

  -[NSCache removeAllObjects](self->_dbCache, "removeAllObjects");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) deleteAllWithCompletion:&stru_1008F6270];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v8);
  }
}

- (id)pleaseDontCopyCacheDictionaryRepresentation
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers"));
  if ([v3 count] == (id)1)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary peerMapRepresentation](v4, "peerMapRepresentation"));
  }

  else
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) peerMapRepresentation]);
          -[NSMutableDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v11);

          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }

    id v5 = -[NSMutableDictionary copy](v4, "copy");
  }

  __int128 v12 = v5;

  return v12;
}

- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4
{
  id v21 = a3;
  id v20 = a4;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens"))
  {
    uint64_t v6 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v21;
      __int16 v32 = 2112;
      id v33 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for URIs: %@  services: %@",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      id v18 = v21;
      id v19 = v20;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Forgetting peer tokens for URIs: %@  services: %@");
    }

    -[NSCache removeAllObjects](self->_dbCache, "removeAllObjects", v18, v19);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers"));
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v26;
      do
      {
        __int128 v15 = 0LL;
        do
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v12);
          }
          __int128 v16 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v15);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_10001475C;
          v22[3] = &unk_1008F6298;
          id v17 = v21;
          id v23 = v17;
          id v24 = v20;
          [v16 deleteEndpointsWithServices:v24 toURIs:v17 completion:v22];

          __int128 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v13);
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v36 = a5;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens"))
  {
    uint64_t v9 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
    id v13 = [v12 length];

    if (v13)
    {
      uint64_t v14 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v52 = v8;
        __int16 v53 = 2112;
        id v54 = v35;
        __int16 v55 = 2112;
        id v56 = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for URI: %@  from URI: %@  service: %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v16)
        && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
      {
        id v31 = v35;
        id v32 = v36;
        id v30 = v8;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Forgetting peer tokens for URI: %@  from URI: %@  service: %@");
      }

      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v46 = 0u;
      __int128 v45 = 0u;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_purgeClientDataBlocks, "allValues", v30, v31, v32));
      id v18 = [v17 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v46;
        do
        {
          id v20 = 0LL;
          do
          {
            if (*(void *)v46 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)v20);
            if (v21) {
              (*(void (**)(uint64_t, id))(v21 + 16))(v21, v36);
            }
            id v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v17 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }

        while (v18);
      }

      id v33 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v36,  v35,  v8);
      -[NSCache removeObjectForKey:](self->_dbCache, "removeObjectForKey:", v33);
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers"));
      id v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v42;
        do
        {
          id v24 = 0LL;
          do
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(obj);
            }
            __int128 v25 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v24);
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472LL;
            v37[2] = sub_100014CF8;
            v37[3] = &unk_1008F6080;
            id v26 = v8;
            id v27 = v8;
            id v38 = v27;
            id v28 = v35;
            id v39 = v28;
            id v40 = v36;
            id v29 = v27;
            id v8 = v26;
            [v25 deleteEndpointsWithService:v40 fromURI:v28 toURI:v29 completion:v37];

            id v24 = (char *)v24 + 1;
          }

          while (v22 != v24);
          id v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        }

        while (v22);
      }
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v36 = a5;
  id v40 = v8;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens"))
  {
    uint64_t v9 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
    if ([v12 length])
    {
      id v13 = [v36 count];

      if (v13)
      {
        uint64_t v14 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v61 = v8;
          __int16 v62 = 2112;
          id v63 = v39;
          __int16 v64 = 2112;
          id v65 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for URI: %@  from URI: %@  services: %@",  buf,  0x20u);
        }

        if (os_log_shim_legacy_logging_enabled(v16)
          && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
        {
          id v34 = v39;
          id v35 = v36;
          id v33 = v8;
          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Forgetting peer tokens for URI: %@  from URI: %@  services: %@");
        }

        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        id v17 = v36;
        id v18 = [v17 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v18)
        {
          id obj = *(id *)v54;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(id *)v54 != obj) {
                objc_enumerationMutation(v17);
              }
              uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)i);
              __int128 v49 = 0u;
              __int128 v50 = 0u;
              __int128 v51 = 0u;
              __int128 v52 = 0u;
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_purgeClientDataBlocks, "allValues", v33, v34, v35));
              id v22 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
              if (v22)
              {
                uint64_t v23 = *(void *)v50;
                do
                {
                  for (j = 0LL; j != v22; j = (char *)j + 1)
                  {
                    if (*(void *)v50 != v23) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)j);
                    if (v25) {
                      (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, v20);
                    }
                  }

                  id v22 = [v21 countByEnumeratingWithState:&v49 objects:v58 count:16];
                }

                while (v22);
              }

              id v26 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v20,  v39,  v40);
              -[NSCache removeObjectForKey:](self->_dbCache, "removeObjectForKey:", v26);
            }

            id v18 = [v17 countByEnumeratingWithState:&v53 objects:v59 count:16];
          }

          while (v18);
        }

        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers"));
        id v27 = [obja countByEnumeratingWithState:&v45 objects:v57 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v46;
          do
          {
            for (k = 0LL; k != v27; k = (char *)k + 1)
            {
              if (*(void *)v46 != v28) {
                objc_enumerationMutation(obja);
              }
              id v30 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)k);
              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472LL;
              v41[2] = sub_100015348;
              v41[3] = &unk_1008F6080;
              id v31 = v40;
              id v42 = v31;
              id v32 = v39;
              id v43 = v32;
              id v44 = v17;
              [v30 deleteEndpointsWithServices:v44 fromURI:v32 toURI:v31 completion:v41];
            }

            id v27 = [obja countByEnumeratingWithState:&v45 objects:v57 count:16];
          }

          while (v27);
        }
      }
    }

    else
    {
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  id v33 = v6;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens"))
  {
    uint64_t v7 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 prefixedURI]);
    id v11 = [v10 length];

    if (v11)
    {
      uint64_t v12 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v6;
        __int16 v47 = 2112;
        id v48 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for URI: %@ service: %@ for all registered URIs.",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v14)
        && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
      {
        id v31 = v6;
        id v32 = v34;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Forgetting peer tokens for URI: %@ service: %@ for all registered URIs.");
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountController sharedInstance]( &OBJC_CLASS___IDSDAccountController,  "sharedInstance",  v31,  v32));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceWithIdentifier:v34]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 accountsOnService:v17]);

      uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v20 = v18;
      id v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v40;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v40 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)i) registration]);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 uris]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_1008F62B8));

            -[NSMutableSet addObjectsFromArray:](v19, "addObjectsFromArray:", v26);
          }

          id v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }

        while (v21);
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v27 = v19;
      id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
      if (v28)
      {
        uint64_t v29 = *(void *)v36;
        do
        {
          for (j = 0LL; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v27);
            }
            -[IDSPeerIDManager_SwiftData forgetPeerTokensForURI:fromURI:service:]( self,  "forgetPeerTokensForURI:fromURI:service:",  v33,  *(void *)(*((void *)&v35 + 1) + 8LL * (void)j),  v34);
          }

          id v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
        }

        while (v28);
      }
    }
  }
}

- (void)forgetPeerTokensForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("PeerLookup_SwiftData");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for service {service: %@}",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"PeerLookup_SwiftData"))
  {
    id v14 = v4;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_SwiftData",  @"Forgetting peer tokens for service {service: %@}");
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_purgeClientDataBlocks, "allValues", v14));
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11);
        if (v12) {
          (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);
        }
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  -[NSCache removeAllObjects](self->_dbCache, "removeAllObjects");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagerForService:](self, "persistenceManagerForService:", v4));
  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100015B48;
    v15[3] = &unk_1008F61C8;
    id v16 = v4;
    [v13 deleteEndpointsWithService:v16 completion:v15];
  }
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
  id v12 = [v11 length];

  if (v12)
  {
    if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_SwiftData,  "shouldUseSelfTokens")
      && (id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData _disasterModeTokenForURI:](self, "_disasterModeTokenForURI:", v9)),
          v13,
          v13))
    {
      LOBYTE(v14) = 0;
    }

    else
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 pushToken]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenFreeURI]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v10,  v9,  v16,  0LL));
      __int128 v18 = v17;
      if (v17 && [v17 count])
      {
        if (v15)
        {
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          id v19 = v18;
          id v14 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14)
          {
            id v24 = v16;
            uint64_t v20 = *(void *)v26;
            while (2)
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v19);
                }
                if (v22 && ([v15 isEqualToPushToken:v22] & 1) != 0)
                {

                  LOBYTE(v14) = 1;
                  goto LABEL_22;
                }
              }

              id v14 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
              if (v14) {
                continue;
              }
              break;
            }

- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (!-[IDSPeerIDManager_SwiftData hasPeerTokensForURI:fromURI:service:]( self,  "hasPeerTokensForURI:fromURI:service:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  v9,  v10,  (void)v18))
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (id)activeURIsFromURI:(id)a3 service:(id)a4
{
  id v37 = a3;
  id v38 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v37 prefixedURI]);
  if ([v6 length])
  {
    uint64_t v7 = v38;
    id v8 = [v38 length];

    if (!v8)
    {
      id v32 = 0LL;
      goto LABEL_38;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _peerIDKeysForService:andFromURI:]( self,  "_peerIDKeysForService:andFromURI:",  v38,  v37));
    id v43 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v10 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v55 = v38;
      __int16 v56 = 2112;
      id v57 = v37;
      __int16 v58 = 2112;
      id v59 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Active query for service: %@  from: %@  peers: %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v12)
      && _IDSShouldLog(1LL, @"PeerIDManager_SwiftData"))
    {
      id v35 = v37;
      __int128 v36 = v9;
      id v34 = v38;
      _IDSLogV( 1LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Active query for service: %@  from: %@  peers: %@");
    }

    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id obj = v9;
    id v41 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v49;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v49 != v40)
          {
            uint64_t v14 = v13;
            objc_enumerationMutation(obj);
            uint64_t v13 = v14;
          }

          uint64_t v42 = v13;
          uint64_t v15 = *(void *)(*((void *)&v48 + 1) + 8 * v13);
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_dbCache, "objectForKey:", v15, v34, v35, v36));
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 endpoints]);

          id v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v45;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v45 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
                uint64_t v23 = objc_opt_class(self, v18);
                id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 expireDate]);
                LOBYTE(v23) = [(id)v23 _datePassed:v24];

                if ((v23 & 1) != 0)
                {
                  uint64_t v25 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
                  __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v55 = v22;
                    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "  Expired session for: %@, skipping...",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v27)
                    && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
                  {
                    id v34 = v22;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"  Expired session for: %@, skipping...");
                  }
                }

                else
                {
                  uint64_t v28 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
                  uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v55 = v22;
                    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "  Active sessions for: %@, adding...",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v30)
                    && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
                  {
                    id v34 = v22;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"  Active sessions for: %@, adding...");
                  }

                  id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URI", v34));
                  -[NSMutableSet addObject:](v43, "addObject:", v31);
                }
              }

              id v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }

            while (v19);
          }

          uint64_t v13 = v42 + 1;
        }

        while ((id)(v42 + 1) != v41);
        id v41 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      }

      while (v41);
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v43, "allObjects"));
  }

  else
  {

    id v32 = 0LL;
  }

  uint64_t v7 = v38;
LABEL_38:

  return v32;
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v34 = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache mapTableRepresentation](self->_dbCache, "mapTableRepresentation"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 keyEnumerator]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    uint64_t v32 = *(void *)v44;
    id v33 = v7;
    do
    {
      uint64_t v15 = 0LL;
      id v35 = v13;
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        BOOL v16 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v15);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 service]);
        unsigned int v18 = [v17 isEqualToString:v7];

        if (v18)
        {
          id v38 = v15;
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](v34->_dbCache, "objectForKey:", v16));
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          id v37 = v19;
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 endpoints]);
          id v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 pushToken]);
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 rawToken]);
                unsigned int v28 = [v26 isEqualToData:v27];

                if (v28)
                {
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 URI]);
                  [v8 addObject:v29];
                }
              }

              id v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }

            while (v22);
          }

          uint64_t v14 = v32;
          id v7 = v33;
          id v13 = v35;
          uint64_t v15 = v38;
        }

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v13);
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);
  return v30;
}

- (id)peerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v10,  v9,  v8,  0LL));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      BOOL v16 = 0LL;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) pushTokenObject]);
        if (v17) {
          [v11 addObject:v17];
        }

        BOOL v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  return v11;
}

- (id)uriForShortHandle:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = IDSServiceNameiMessage;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _peerIDKeysForService:]( self,  "_peerIDKeysForService:",  IDSServiceNameiMessage));
    id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v25) {
      goto LABEL_19;
    }
    uint64_t v21 = v5;
    id v6 = 0LL;
    uint64_t v23 = *(void *)v31;
    id v24 = self;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSCache objectForKey:]( self->_dbCache,  "objectForKey:",  *(void *)(*((void *)&v30 + 1) + 8LL * (void)i)));
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 endpoints]);

        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)j);
              BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 shortHandle]);
              unsigned int v17 = [v16 isEqualToString:v4];

              if (v17)
              {
                uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 URI]);

                id v6 = (void *)v18;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }

          while (v12);
        }

        self = v24;
      }

      id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v25);
    uint64_t v5 = v21;
    if (!v6)
    {
LABEL_19:
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData persistenceManagerForService:]( self,  "persistenceManagerForService:",  v5));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v19 uriForShortHandle:v4]);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)shortHandleForURI:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 prefixedURI]);
  id v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = IDSServiceNameiMessage;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  IDSServiceNameiMessage,  v7,  v6,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

    if (!v12
      || (uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 shortHandle])) == 0
      || (id v14 = (void *)v13,
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 shortHandle]),
          v15,
          v14,
          !v15)
      || (BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v12 shortHandle])) == 0)
    {
      unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData persistenceManagerForService:]( self,  "persistenceManagerForService:",  v10));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v17 shortHandleForUri:v6]);
    }
  }

  else
  {
    BOOL v16 = 0LL;
  }

  return v16;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100016DF8;
    v11[3] = &unk_1008F62E0;
    id v12 = v6;
    id v8 = a4;
    id v9 = objc_retainBlock(v11);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData queryHandler](self, "queryHandler"));
    [v10 addCompletionBlock:v9 forToken:v8];
  }
}

- (void)removeCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData queryHandler](self, "queryHandler"));
  [v5 removeCompletionBlockForToken:v4];
}

- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (!self->_clientDataUpdateBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        clientDataUpdateBlocks = self->_clientDataUpdateBlocks;
        self->_clientDataUpdateBlocks = Mutable;
      }

      id v10 = [v6 copy];
      id v11 = v10;
      if (v10)
      {
        id v12 = self->_clientDataUpdateBlocks;
        id v13 = objc_retainBlock(v10);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v7);
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Empty client data update block for token: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Empty client data update block for token: %@");
      }
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Empty token for client data update block",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Empty token for client data update block");
    }
  }
}

- (void)removeClientDataUpdateBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_clientDataUpdateBlocks, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_clientDataUpdateBlocks, "count"))
    {
      clientDataUpdateBlocks = self->_clientDataUpdateBlocks;
      self->_clientDataUpdateBlocks = 0LL;
    }
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Empty token for removing client data update block",  v9,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Empty token for removing client data update block");
    }
  }
}

- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (!self->_purgeClientDataBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        purgeClientDataBlocks = self->_purgeClientDataBlocks;
        self->_purgeClientDataBlocks = Mutable;
      }

      id v10 = [v6 copy];
      id v11 = v10;
      if (v10)
      {
        id v12 = self->_purgeClientDataBlocks;
        id v13 = objc_retainBlock(v10);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v7);
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Empty purge client data block for token: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Empty purge client data block for token: %@");
      }
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Empty token for purge client data block",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Empty token for purge client data block");
    }
  }
}

- (void)removePurgeClientDataBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_purgeClientDataBlocks, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_purgeClientDataBlocks, "count"))
    {
      purgeClientDataBlocks = self->_purgeClientDataBlocks;
      self->_purgeClientDataBlocks = 0LL;
    }
  }

  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Empty token for removing purge client data block",  v9,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Empty token for removing purge client data block");
    }
  }
}

- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = v10;
  if (v8 && v9 && v10)
  {
    uint64_t v13 = im_primary_queue(v10, v11);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017700;
    block[3] = &unk_1008F6308;
    block[4] = self;
    id v23 = v8;
    id v21 = v12;
    id v22 = v9;
    dispatch_async(v14, block);
  }

  else
  {
    uint64_t v15 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_retainBlock(v8);
      *(_DWORD *)buf = 138412802;
      id v25 = v17;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      __int128 v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Missing context for adding endpoint query completion block -- ignoring request {block: %@, token: %@, queue: %@}",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v18)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      id v19 = objc_retainBlock(v8);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Missing context for adding endpoint query completion block -- ignoring request {block: %@, token: %@, queue: %@}");
    }
  }
}

- (void)removeEndpointQueryCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  if (v4)
  {
    uint64_t v7 = im_primary_queue(v4, v5);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017910;
    block[3] = &unk_1008F5F80;
    block[4] = self;
    id v13 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Missing context for removing endpoint query completion block -- ignoring request {token: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Missing context for removing endpoint query completion block -- ignoring request {token: %@}");
    }
  }
}

- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (dispatch_queue_s *)a7;
  uint64_t v18 = v16;
  id v19 = &off_100717000;
  if (!v12 || !v13 || !v14 || !v15 || !v16)
  {
    uint64_t v20 = OSLogHandleForIDSCategory("PeerIDManager_SwiftData");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_retainBlock(v15);
      *(_DWORD *)buf = 138413314;
      id v41 = v12;
      __int16 v42 = 2112;
      id v43 = v13;
      __int16 v44 = 2112;
      id v45 = v14;
      __int16 v46 = 2112;
      id v47 = v22;
      __int16 v48 = 2112;
      __int128 v49 = v18;
      id v19 = &off_100717000;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Missing context for endpoint request -- returning nil {URIs: %@, serviceIdentifier: %@, localURI: %@, completion : %@, queue: %@}",  buf,  0x34u);
    }

    if (os_log_shim_legacy_logging_enabled(v23)
      && _IDSShouldLog(0LL, @"PeerIDManager_SwiftData"))
    {
      id v31 = objc_retainBlock(v15);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager_SwiftData",  @"Missing context for endpoint request -- returning nil {URIs: %@, serviceIdentifier: %@, localURI: %@, completion: %@, queue: %@}");
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = *((void *)v19 + 49);
    block[2] = sub_100017C34;
    block[3] = &unk_1008F6330;
    id v39 = v15;
    dispatch_async(v18, block);
  }

  uint64_t v24 = im_primary_queue(v16, v17);
  id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = *((void *)v19 + 49);
  v32[2] = sub_100017C44;
  v32[3] = &unk_1008F6380;
  v32[4] = self;
  id v33 = v12;
  id v34 = v13;
  id v35 = v14;
  __int128 v36 = v18;
  id v37 = v15;
  id v26 = v15;
  id v27 = v18;
  id v28 = v14;
  id v29 = v13;
  id v30 = v12;
  dispatch_async(v25, v32);
}

- (void)performCleanupTasks
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_SwiftData persistenceManagers](self, "persistenceManagers", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) performDBCleanupTasks];
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  -[NSCache removeAllObjects](self->_dbCache, "removeAllObjects");
}

- (id)_loadCachedPeerIDValueForKey:(id)a3 ignoreExpiration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 service]);
    if (v8)
    {
      __int128 v9 = (void *)v8;
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 fromURI]);
      if (v10)
      {
        __int128 v11 = (void *)v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 toURI]);

        if (v12) {
          goto LABEL_10;
        }
      }

      else
      {
      }
    }
  }

  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog PeerLookup_DBCache](&OBJC_CLASS___IDSFoundationLog, "PeerLookup_DBCache"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412290;
    id v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Cannot load key, missing data. { peerIDKey: %@ }",  (uint8_t *)&v26,  0xCu);
  }

LABEL_10:
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_SwiftData persistenceManagerForService:]( self,  "persistenceManagerForService:",  v14));

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 fromURI]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 toURI]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 fetchEndpointsWithService:v16 fromURI:v17 toURI:v18 ignoreExpiration:v4]);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v7 toURI]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 service]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 fetchKeyTransparencyContextFor:v20 service:v21]);

  uint64_t v23 = -[IDSPeerIDValue initWithEndpoints:keyTransparencyContext:]( objc_alloc(&OBJC_CLASS___IDSPeerIDValue),  "initWithEndpoints:keyTransparencyContext:",  v19,  v22);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog PeerLookup_DBCache](&OBJC_CLASS___IDSFoundationLog, "PeerLookup_DBCache"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412546;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "DB Cache Load { peerIDKey: %@, peerIDValue: %@ }",  (uint8_t *)&v26,  0x16u);
  }

  -[NSCache setObject:forKey:cost:](self->_dbCache, "setObject:forKey:cost:", v23, v7, [v19 count]);
  return v23;
}

- (void)_updateKTContext:(id)a3 forURI:(id)a4
{
  id v31 = a3;
  id v32 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self->_keyTransparencyVerifier, "accountController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self->_keyTransparencyVerifier, "serviceController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithIdentifier:@"com.apple.madrid"]);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountsOnService:v8]);

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v37 + 1) + 8 * (void)v14) registration]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 uris]);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__imArrayByApplyingBlock:", &stru_1008F63A0));

        -[NSMutableSet addObjectsFromArray:](v10, "addObjectsFromArray:", v17);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v12);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v29 = v10;
  id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      id v21 = 0LL;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v29);
        }
        id v22 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  @"com.apple.madrid",  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v21),  v32);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_dbCache, "objectForKey:", v22));
        if (v23)
        {
          uint64_t v24 = objc_alloc(&OBJC_CLASS___IDSPeerIDValue);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 endpoints]);
          int v26 = -[IDSPeerIDValue initWithEndpoints:keyTransparencyContext:]( v24,  "initWithEndpoints:keyTransparencyContext:",  v25,  v31);

          dbCache = self->_dbCache;
          __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v23 endpoints]);
          -[NSCache setObject:forKey:cost:](dbCache, "setObject:forKey:cost:", v26, v22, [v28 count]);
        }

        id v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v33,  v41,  16LL);
    }

    while (v19);
  }
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v4 = a4;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog PeerLookup_DBCache](&OBJC_CLASS___IDSFoundationLog, "PeerLookup_DBCache"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DB Cache Eviction { peerIDValue: %@ }",  (uint8_t *)&v6,  0xCu);
  }
}

- (NSMutableDictionary)clientDataUpdateBlocks
{
  return self->_clientDataUpdateBlocks;
}

- (void)setClientDataUpdateBlocks:(id)a3
{
}

- (NSMutableDictionary)purgeClientDataBlocks
{
  return self->_purgeClientDataBlocks;
}

- (void)setPurgeClientDataBlocks:(id)a3
{
}

- (NSMutableDictionary)endpointQueryListeners
{
  return self->_endpointQueryListeners;
}

- (void)setEndpointQueryListeners:(id)a3
{
}

- (NSMutableDictionary)disasterModeTokens
{
  return self->_disasterModeTokens;
}

- (void)setDisasterModeTokens:(id)a3
{
}

- (IDSPeerIDQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (void)setQueryHandler:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSMutableSet)reportedExcessiveQueryCacheEntries
{
  return self->_reportedExcessiveQueryCacheEntries;
}

- (void)setReportedExcessiveQueryCacheEntries:(id)a3
{
}

- (NSCache)dbCache
{
  return self->_dbCache;
}

- (void)setDbCache:(id)a3
{
}

- (IDSPeerIDPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSKeyTransparencyVerifier)keyTransparencyVerifier
{
  return self->_keyTransparencyVerifier;
}

- (void)setKeyTransparencyVerifier:(id)a3
{
}

- (IDSQuerySDPersistenceManager)swiftDataManager
{
  return self->_swiftDataManager;
}

- (void)setSwiftDataManager:(id)a3
{
}

- (IDSQuerySDPersistenceManager)restrictedPersistenceManager
{
  return self->_restrictedPersistenceManager;
}

- (void)setRestrictedPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end