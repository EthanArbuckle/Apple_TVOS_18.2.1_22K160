@interface IDSPeerIDManager_OLD
+ (BOOL)_datePassed:(id)a3;
+ (BOOL)shouldUseSelfTokens;
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSPeerIDManager_OLD)init;
- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6;
- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 standardPersistentMap:(id)a5 restrictedServicePersistentMap:(id)a6 keyTransparencyVerifier:(id)a7 userDefaults:(id)a8;
- (IDSPeerIDPushHandler)pushHandler;
- (IDSPeerIDQueryHandler)queryHandler;
- (IDSPersistentMap)restrictedServicePersistentMap;
- (IDSPersistentMap)standardPersistentMap;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)clientDataUpdateBlocks;
- (NSMutableDictionary)disasterModeTokens;
- (NSMutableDictionary)endpointQueryListeners;
- (NSMutableDictionary)purgeClientDataBlocks;
- (NSMutableSet)reportedExcessiveQueryCacheEntries;
- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6;
- (id)_disasterModeTokenForURI:(id)a3;
- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6;
- (id)_keyTransparencyVerifierResultForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
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
- (id)persistentMapForService:(id)a3;
- (id)persistentMaps;
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
- (unint64_t)excessiveQueryCacheEntriesRemovalWindow;
- (unint64_t)excessiveQueryCacheEntriesThreshold;
- (void)_asyncCleanupExpiredEntriesIfNeeded;
- (void)_asyncRemoveExcessiveQueryEntriesIfNeeded;
- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4;
- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5;
- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4;
- (void)cleanupExpiredEntriesIfNeeded;
- (void)clearCacheAndPersistImmediately:(BOOL)a3;
- (void)dealloc;
- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7;
- (void)forgetPeerTokensForService:(id)a3;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4;
- (void)forgetSessionTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6;
- (void)performCleanupTasks;
- (void)removeClientDataUpdateBlockForToken:(id)a3;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)removeEndpointQueryCompletionBlockForToken:(id)a3;
- (void)removeExcessiveQueryEntriesIfNeeded;
- (void)removePurgeClientDataBlockForToken:(id)a3;
- (void)setClientDataUpdateBlocks:(id)a3;
- (void)setDisasterModeTokens:(id)a3;
- (void)setEndpointQueryListeners:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setPurgeClientDataBlocks:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueryHandler:(id)a3;
- (void)setReportedExcessiveQueryCacheEntries:(id)a3;
- (void)setRestrictedServicePersistentMap:(id)a3;
- (void)setStandardPersistentMap:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateCachedVerifierResultsWithResults:(id)a3;
@end

@implementation IDSPeerIDManager_OLD

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

- (IDSPeerIDManager_OLD)init
{
  v3 = objc_alloc(&OBJC_CLASS___IDSPersistentMap);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSEndpoint, v4);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___IDSPeerIDKey, v6);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___IDSPeerIDValue, v8);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___IDSQueryKeyTransparencyContext, v10);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSUUID, v12);
  v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v7,  v9,  v11,  v13,  objc_opt_class(&OBJC_CLASS___NSArray, v14),  0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPersistentMapMergePolicy prioritizeMemoryPolicy]( &OBJC_CLASS___IDSPersistentMapMergePolicy,  "prioritizeMemoryPolicy"));
  v18 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:]( v3,  "initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:",  @"personal-session-token-cache-v4",  4LL,  v16,  0LL,  v17,  &stru_100900328);

  id v19 = 0LL;
  if (IDSShouldUseRestrictedLoggingForService(0LL)) {
    id v19 = -[IDSPersistentMap initMemoryOnlyWithIdentifier:]( objc_alloc(&OBJC_CLASS___IDSPersistentMap),  "initMemoryOnlyWithIdentifier:",  @"personal-session-token-cache-memory");
  }
  v20 = -[IDSPeerIDQueryDataSource initWithPeerIDManager:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryDataSource),  "initWithPeerIDManager:",  self);
  v21 = -[IDSPeerIDQueryHandler initWithDelegate:dataSource:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryHandler),  "initWithDelegate:dataSource:",  self,  v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v25 = -[IDSPeerIDManager_OLD initWithPushHandler:queryHandler:standardPersistentMap:restrictedServicePersistentMap:keyTransparencyVerifier:userDefaults:]( self,  "initWithPushHandler:queryHandler:standardPersistentMap:restrictedServicePersistentMap:keyTransparencyVerifier:userDefaults:",  v22,  v21,  v18,  v19,  v23,  v24);

  return v25;
}

- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6
{
  id v32 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = objc_alloc(&OBJC_CLASS___IDSPersistentMap);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___IDSEndpoint, v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___IDSPeerIDKey, v15);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___IDSPeerIDValue, v17);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___IDSQueryKeyTransparencyContext, v19);
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSUUID, v21);
  v24 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v16,  v18,  v20,  v22,  objc_opt_class(&OBJC_CLASS___NSArray, v23),  0LL);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPersistentMapMergePolicy prioritizeMemoryPolicy]( &OBJC_CLASS___IDSPersistentMapMergePolicy,  "prioritizeMemoryPolicy"));
  v27 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:]( v12,  "initWithIdentifier:versionNumber:decodableClasses:dataProtectionClass:mergePolicy:migrationBlock:",  @"personal-session-token-cache-v4",  4LL,  v25,  0LL,  v26,  &stru_100900348);

  id v28 = 0LL;
  if (IDSShouldUseRestrictedLoggingForService(0LL)) {
    id v28 = -[IDSPersistentMap initMemoryOnlyWithIdentifier:]( objc_alloc(&OBJC_CLASS___IDSPersistentMap),  "initMemoryOnlyWithIdentifier:",  @"personal-session-token-cache-memory");
  }
  v29 = -[IDSPeerIDManager_OLD initWithPushHandler:queryHandler:standardPersistentMap:restrictedServicePersistentMap:keyTransparencyVerifier:userDefaults:]( self,  "initWithPushHandler:queryHandler:standardPersistentMap:restrictedServicePersistentMap:keyTransparencyVerifier:userDefaults:",  v32,  v9,  v27,  v28,  v10,  v11);

  return v29;
}

- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 standardPersistentMap:(id)a5 restrictedServicePersistentMap:(id)a6 keyTransparencyVerifier:(id)a7 userDefaults:(id)a8
{
  id v26 = a3;
  id v25 = a4;
  id v15 = a5;
  id v16 = a6;
  id v24 = a7;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___IDSPeerIDManager_OLD;
  uint64_t v18 = -[IDSPeerIDManager_OLD init](&v31, "init");
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pushHandler, a3);
    objc_storeStrong((id *)&v19->_queryHandler, a4);
    objc_storeStrong((id *)&v19->_standardPersistentMap, a5);
    objc_storeStrong((id *)&v19->_restrictedServicePersistentMap, a6);
    objc_msgSend(v15, "setDelegate:", v19, v24, v25, v26);
    [v16 setDelegate:v19];
    objc_storeStrong((id *)&v19->_keyTransparencyVerifier, a7);
    objc_storeStrong((id *)&v19->_userDefaults, a8);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1002E19A0;
    v27[3] = &unk_1008F6058;
    objc_copyWeak(&v29, &location);
    id v28 = v19;
    uint64_t v21 = im_primary_queue(v28, v20);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
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
  v4.super_class = (Class)&OBJC_CLASS___IDSPeerIDManager_OLD;
  -[IDSPeerIDManager_OLD dealloc](&v4, "dealloc");
}

- (id)_disasterModeTokenForURI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);
  id v6 = [v5 length];

  if (v6)
  {
    disasterModeTokens = self->_disasterModeTokens;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 prefixedURI]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](disasterModeTokens, "objectForKey:", v8));

    uint64_t v10 = OSLogHandleForIDSCategory("PeerLookup_OLD");
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
      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"   Using disaster mode token for URI: %@   token: %@");
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_disasterModeTokens, "allKeys"));
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

  uint64_t v13 = OSLogHandleForIDSCategory("PeerLookup_OLD");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "   Setting disaster mode token for URI: %@   token: %@",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v15)
    && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"   Setting disaster mode token for URI: %@   token: %@");
  }

  id v16 = v6;
  if (v16)
  {
    id v17 = self->_disasterModeTokens;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
    CFDictionarySetValue((CFMutableDictionaryRef)v17, v18, v16);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1006A77AC(v7);
  }
}

- (id)persistentMapForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_restrictedServicePersistentMap)
  {
    int v6 = IDSShouldUseRestrictedLoggingForService(v4);
    p_standardPersistentMap = &self->_standardPersistentMap;
    if (v6) {
      p_standardPersistentMap = &self->_restrictedServicePersistentMap;
    }
  }

  else
  {
    p_standardPersistentMap = &self->_standardPersistentMap;
  }

  uint64_t v8 = *p_standardPersistentMap;

  return v8;
}

- (id)persistentMaps
{
  restrictedServicePersistentMap = self->_restrictedServicePersistentMap;
  if (restrictedServicePersistentMap)
  {
    standardPersistentMap = self->_standardPersistentMap;
    uint64_t v8 = restrictedServicePersistentMap;
    p_standardPersistentMap = &standardPersistentMap;
    uint64_t v4 = 2LL;
  }

  else
  {
    int v6 = self->_standardPersistentMap;
    p_standardPersistentMap = &v6;
    uint64_t v4 = 1LL;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  p_standardPersistentMap,  v4,  v6,  standardPersistentMap,  v8));
}

- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v210 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v206 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v214 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v230 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v11));
  __int128 v308 = 0u;
  __int128 v307 = 0u;
  __int128 v306 = 0u;
  __int128 v305 = 0u;
  id obj = v9;
  id v207 = [obj countByEnumeratingWithState:&v305 objects:v327 count:16];
  if (v207)
  {
    uint64_t v205 = *(void *)v306;
    uint64_t v235 = IDSGameCenterContactsAssociationID;
    uint64_t v234 = IDSGameCenterContactsSharingState;
    uint64_t v240 = _IDSIdentityClientDataMessageProtectionIdentityKey;
    uint64_t v232 = IDSRegistrationPropertyShowPeerErrors;
    uint64_t v233 = IDSGameCenterContactsLastUpdatedDate;
    uint64_t v216 = _IDSIdentityClientDataDevicePublicIdentityKey;
    uint64_t v217 = _IDSIdentityClientDataGroupCryptoVersionNumberKey;
    uint64_t v222 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
    uint64_t v215 = _IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
    uint64_t v220 = _IDSIdentityClientDataMessageProtectionNGMWebPublicIdentityKey;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v306 != v205)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }

        uint64_t v208 = v12;
        uint64_t v14 = *(void **)(*((void *)&v305 + 1) + 8 * v12);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
        v212 = (void *)objc_claimAutoreleasedReturnValue([v210 objectForKey:v15]);

        v211 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"identities"]);
        id v243 = objc_alloc_init(&OBJC_CLASS___IDSEndpointURIProperties);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"sender-correlation-identifier"]);
        [v243 setSenderCorrelationIdentifier:v16];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"short-handle"]);
        [v243 setShortHandle:v17];

        v209 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v11,  v10,  v14);
        if (v212) {
          BOOL v18 = v210 != 0LL;
        }
        else {
          BOOL v18 = 0;
        }
        if (v11 != 0 && v18 && [v211 count])
        {
          v203 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _peerIDKeysForService:andFromURI:]( self,  "_peerIDKeysForService:andFromURI:",  v11,  v10));
          if ((unint64_t)[v203 count] >= 0x259)
          {
            __int128 v304 = 0u;
            __int128 v303 = 0u;
            __int128 v302 = 0u;
            __int128 v301 = 0u;
            id v19 = v203;
            id v20 = [v19 countByEnumeratingWithState:&v301 objects:v326 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v302;
              do
              {
                for (i = 0LL; i != v20; i = (char *)i + 1)
                {
                  if (*(void *)v302 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  [v230 removeObjectForKey:*(void *)(*((void *)&v301 + 1) + 8 * (void)i)];
                }

                id v20 = [v19 countByEnumeratingWithState:&v301 objects:v326 count:16];
              }

              while (v20);
            }
          }

          v219 = (void *)objc_claimAutoreleasedReturnValue([v212 _stringForKey:@"anonymized-sender-id"]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v212 _numberForKey:@"biz-trusted"]);
          unsigned __int8 v218 = [v23 BOOLValue];

          v199 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"kt-blob"]);
          v202 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"kt-status"]);
          v226 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"kt-account-key"]);
          v201 = (void *)objc_claimAutoreleasedReturnValue([v212 objectForKey:@"kt-opt-in"]);
          unsigned int v24 = [v201 BOOLValue];
          if (v202)
          {
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413314;
              uint64_t v317 = (uint64_t)v11;
              __int16 v318 = 2112;
              id v319 = v14;
              __int16 v320 = 2112;
              id v321 = v226;
              __int16 v322 = 2112;
              v323 = v202;
              __int16 v324 = 2112;
              v325 = v199;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Found KT status in query result { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }",  buf,  0x34u);
            }
          }

          if (v14)
          {
            if (!v226)
            {
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v26 _md5Hash]);
              v226 = (void *)objc_claimAutoreleasedReturnValue([v27 dataUsingEncoding:4]);

              id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v317 = (uint64_t)v226;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Per-URI KT account identifier is missing from the IDS response, which may cause KT verification failur es -- using URI hash instead { KTAccountKey: %@ }",  buf,  0xCu);
              }
            }

            v200 = -[IDSKeyTransparencyIndex initWithServiceIdentifier:accountKey:URI:]( objc_alloc(&OBJC_CLASS___IDSKeyTransparencyIndex),  "initWithServiceIdentifier:accountKey:URI:",  v11,  v226,  v14);
          }

          else
          {
            v200 = 0LL;
          }

          v224 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v231 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v300 = 0u;
          __int128 v299 = 0u;
          __int128 v298 = 0u;
          __int128 v297 = 0u;
          id v223 = v211;
          id v238 = [v223 countByEnumeratingWithState:&v297 objects:v315 count:16];
          uint64_t v197 = v24;
          if (v238)
          {
            char v250 = 0;
            uint64_t v236 = *(void *)v298;
            id v29 = @"NO";
            if (v24) {
              id v29 = @"YES";
            }
            v225 = v29;
            do
            {
              uint64_t v30 = 0LL;
              do
              {
                if (*(void *)v298 != v236)
                {
                  uint64_t v31 = v30;
                  objc_enumerationMutation(v223);
                  uint64_t v30 = v31;
                }

                uint64_t v244 = v30;
                id v32 = *(void **)(*((void *)&v297 + 1) + 8 * v30);
                id v266 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "_dataForKey:", @"push-token", v190, v193, v194, v195));
                v256 = (void *)objc_claimAutoreleasedReturnValue([v32 _dataForKey:@"session-token"]);
                uint64_t v33 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Found identity:", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled(v35)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup_OLD", @"Found identity:");
                }

                v268 = (void *)objc_claimAutoreleasedReturnValue([v32 _dictionaryForKey:@"client-data"]);
                v264 = (void *)objc_claimAutoreleasedReturnValue([v32 _stringForKey:@"device-name"]);
                v258 = (void *)objc_claimAutoreleasedReturnValue([v32 _dictionaryForKey:@"private-device-data"]);
                id v252 = 0LL;
                if (v264 && v258) {
                  id v252 = [[IDSFamilyEndpointData alloc] initWithDeviceName:v264 privateDeviceData:v258];
                }
                v260 = (void *)objc_claimAutoreleasedReturnValue([v32 _dataForKey:@"kt-loggable-data"]);
                v255 = (void *)objc_claimAutoreleasedReturnValue([v268 _dataForKey:@"device-key-signature"]);
                v36 = (void *)objc_claimAutoreleasedReturnValue([v32 _numberForKey:@"kt-mismatch-account-flag"]);
                unsigned int v245 = [v36 BOOLValue];

                v37 = (void *)objc_claimAutoreleasedReturnValue([v32 _numberForKey:@"ktbility"]);
                unsigned int v249 = [v37 BOOLValue];

                v262 = (void *)objc_claimAutoreleasedReturnValue([v268 _stringForKey:v235]);
                v259 = (void *)objc_claimAutoreleasedReturnValue([v268 _numberForKey:v234]);
                v38 = (void *)objc_claimAutoreleasedReturnValue([v268 _numberForKey:v233]);
                v257 = v38;
                if (v38)
                {
                  [v38 doubleValue];
                  id v254 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
                }

                else
                {
                  id v254 = 0LL;
                }

                uint64_t v39 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v317 = (uint64_t)v262;
                  __int16 v318 = 2112;
                  id v319 = v259;
                  __int16 v320 = 2112;
                  id v321 = v254;
                  _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@",  buf,  0x20u);
                }

                if (os_log_shim_legacy_logging_enabled(v41)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  id v193 = v259;
                  id v194 = v254;
                  v191 = v262;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@");
                }

                if (v262 || v259 || v257) {
                  v246 = -[IDSGameCenterData initWithAssociationID:sharingState:lastUpdatedDate:]( objc_alloc(&OBJC_CLASS___IDSGameCenterData),  "initWithAssociationID:sharingState:lastUpdatedDate:",  v262,  v259,  v254);
                }
                else {
                  v246 = 0LL;
                }
                if (v266)
                {
                  v42 = -[IDSKeyTransparencyEntry initWithPushToken:loggableData:signedData:]( objc_alloc(&OBJC_CLASS___IDSKeyTransparencyEntry),  "initWithPushToken:loggableData:signedData:",  v266,  v260,  v255);
                  -[IDSKeyTransparencyEntry setKtCapable:](v42, "setKtCapable:", v249);
                  -[NSMutableArray addObject:](v224, "addObject:", v42);
                }

                v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "_dataForKey:", v240, v191));
                v43 = (void *)objc_claimAutoreleasedReturnValue([v268 _numberForKey:v232]);
                unsigned int v44 = [v43 intValue];

                uint64_t v45 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v47 = IDSLoggableDescriptionForTokenOnService(v266, v11);
                  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
                  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 debugDescription]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v49;
                  _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "              device pushToken: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v50)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  uint64_t v51 = IDSLoggableDescriptionForTokenOnService(v266, v11);
                  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                  v190 = (void *)objc_claimAutoreleasedReturnValue([v52 debugDescription]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"              device pushToken: %@");
                }

                uint64_t v53 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  id v55 = (id)objc_claimAutoreleasedReturnValue([v256 debugDescription]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v55;
                  _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "                 session token: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v56)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue([v256 debugDescription]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                 session token: %@");
                }

                uint64_t v57 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v14;
                  _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "                           uri: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v59)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = v14;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                           uri: %@");
                }

                uint64_t v60 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  v62 = (void *)objc_claimAutoreleasedReturnValue([v243 senderCorrelationIdentifier]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v62;
                  _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  " sender-correlation-identifier: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v63)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue([v243 senderCorrelationIdentifier]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @" sender-correlation-identifier: %@");
                }

                uint64_t v64 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = (void *)objc_claimAutoreleasedReturnValue([v243 shortHandle]);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v66;
                  _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "                  short-handle: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v67)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue([v243 shortHandle]);
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                  short-handle: %@");
                }

                uint64_t v68 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  id v70 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v268,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v70;
                  _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "                    clientData: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v71)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v268,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                    clientData: %@");
                }

                uint64_t v72 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v264;
                  _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "                   device-name: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v74)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = v264;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                   device-name: %@");
                }

                uint64_t v75 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  id v77 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v258,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v77;
                  _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "           private-device-data: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v78)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v258,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"           private-device-data: %@");
                }

                uint64_t v79 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  id v81 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v260,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v81;
                  _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "              kt-loggable-data: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v82)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v260,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"              kt-loggable-data: %@");
                }

                uint64_t v83 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  id v85 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v226,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v85;
                  _os_log_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEFAULT,  "                kt-account-key: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v86)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v226,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                kt-account-key: %@");
                }

                uint64_t v87 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v225;
                  _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "                     kt-opt-in: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v89)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)v225;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                     kt-opt-in: %@");
                }

                uint64_t v90 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  id v92 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v255,  1LL));
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v92;
                  _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "          device-key-signature: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v93)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v255,  1LL));
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"          device-key-signature: %@");
                }

                uint64_t v94 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
                if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                {
                  v96 = @"NO";
                  if (v245) {
                    v96 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v96;
                  _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "      kt-mismatch-account-flag: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v97)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v98 = @"NO";
                  if (v245) {
                    v98 = @"YES";
                  }
                  v190 = (void *)v98;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"      kt-mismatch-account-flag: %@");
                }

                uint64_t v99 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                {
                  v101 = @"NO";
                  if (v249) {
                    v101 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v101;
                  _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "               kt-capable-flag: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v102)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v103 = @"NO";
                  if (v249) {
                    v103 = @"YES";
                  }
                  v190 = (void *)v103;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"               kt-capable-flag: %@");
                }

                uint64_t v104 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  v106 = @"NO";
                  if (v44) {
                    v106 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v106;
                  _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "                    showErrors: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v107)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v108 = @"NO";
                  if (v44) {
                    v108 = @"YES";
                  }
                  v190 = (void *)v108;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                    showErrors: %@");
                }

                if (v253) {
                  goto LABEL_162;
                }
                uint64_t v109 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
                if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v317 = (uint64_t)v266;
                  _os_log_impl( (void *)&_mh_execute_header,  v110,  OS_LOG_TYPE_DEFAULT,  "   No known public key found for token: %@",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v111)
                  && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                {
                  v190 = v266;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"   No known public key found for token: %@");
                }

                if (!objc_msgSend(v11, "isEqualToIgnoringCase:", @"com.apple.madrid", v190))
                {
LABEL_162:
                  if (v266)
                  {
                    uint64_t v115 = IMGetDomainIntForKey(@"com.apple.ids", @"IDSIDRefreshExpiry");
                    uint64_t v116 = IMGetDomainIntForKey(@"com.apple.ids", @"IDSIDHardExpiry");
                    v247 = (void *)objc_claimAutoreleasedReturnValue([v32 _numberForKey:@"session-token-refresh-seconds"]);
                    v248 = (void *)objc_claimAutoreleasedReturnValue([v32 _numberForKey:@"session-token-expires-seconds"]);
                    if (v115)
                    {
                      uint64_t v117 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                      v118 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
                      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v317 = v115;
                        _os_log_impl( (void *)&_mh_execute_header,  v118,  OS_LOG_TYPE_DEFAULT,  "                    Overwriting soft TTL with: %ld seconds",  buf,  0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled(v119)
                        && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                      {
                        v190 = (void *)v115;
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                    Overwriting soft TTL with: %ld seconds");
                      }

                      uint64_t v120 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v115, v190));

                      v247 = (void *)v120;
                    }

                    if (v116)
                    {
                      uint64_t v121 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                      v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);
                      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v317 = v116;
                        _os_log_impl( (void *)&_mh_execute_header,  v122,  OS_LOG_TYPE_DEFAULT,  "                    Overwriting hard TTL with: %ld seconds",  buf,  0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled(v123)
                        && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                      {
                        v190 = (void *)v116;
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"                    Overwriting hard TTL with: %ld seconds");
                      }

                      uint64_t v124 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v116, v190));

                      v248 = (void *)v124;
                    }

                    objc_msgSend(v247, "doubleValue", v190);
                    v242 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                    [v248 doubleValue];
                    v241 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                    uint64_t v125 = OSLogHandleForIDSCategory("PeerLookup_OLD");
                    v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);
                    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138413058;
                      uint64_t v317 = (uint64_t)v11;
                      __int16 v318 = 2112;
                      id v319 = v14;
                      __int16 v320 = 2112;
                      id v321 = v242;
                      __int16 v322 = 2112;
                      v323 = v241;
                      _os_log_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_DEFAULT,  "   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,",  buf,  0x2Au);
                    }

                    if (os_log_shim_legacy_logging_enabled(v127)
                      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
                    {
                      id v194 = v242;
                      v195 = v241;
                      v190 = v11;
                      id v193 = v14;
                      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,");
                    }

                    if (v256 && v248 && v247)
                    {
                      if ([v10 isEqualToURI:v14]) {
                        -[IDSPeerIDManager_OLD _setDisasterModeToken:forURI:]( self,  "_setDisasterModeToken:forURI:",  v256,  v10);
                      }
                      v128 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEndpointCapabilities allowedCapabilities]( &OBJC_CLASS___IDSEndpointCapabilities,  "allowedCapabilities",  v190));
                      v314[0] = v240;
                      v314[1] = v217;
                      v314[2] = v216;
                      v314[3] = v222;
                      v314[4] = v215;
                      v314[5] = v220;
                      v129 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v314,  6LL));
                      v130 = (void *)objc_claimAutoreleasedReturnValue([v128 arrayByAddingObjectsFromArray:v129]);

                      v131 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v130 count]);
                      __int128 v296 = 0u;
                      __int128 v295 = 0u;
                      __int128 v294 = 0u;
                      __int128 v293 = 0u;
                      id v132 = v130;
                      id v133 = [v132 countByEnumeratingWithState:&v293 objects:v313 count:16];
                      if (v133)
                      {
                        uint64_t v134 = *(void *)v294;
                        do
                        {
                          for (j = 0LL; j != v133; j = (char *)j + 1)
                          {
                            if (*(void *)v294 != v134) {
                              objc_enumerationMutation(v132);
                            }
                            uint64_t v136 = *(void *)(*((void *)&v293 + 1) + 8LL * (void)j);
                            v137 = (void *)objc_claimAutoreleasedReturnValue([v268 objectForKey:v136]);
                            if (v137) {
                              -[NSMutableDictionary setObject:forKey:](v131, "setObject:forKey:", v137, v136);
                            }
                          }

                          id v133 = [v132 countByEnumeratingWithState:&v293 objects:v313 count:16];
                        }

                        while (v133);
                      }

                      v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                      [v138 timeIntervalSince1970];
                      double v140 = v139;

                      v229 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v131, "_dataForKey:", v240));
                      v228 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v131, "_dataForKey:", v222));
                      v141 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDServiceController sharedInstance]( &OBJC_CLASS___IDSDServiceController,  "sharedInstance"));
                      v251 = (void *)objc_claimAutoreleasedReturnValue([v141 serviceWithIdentifier:v11]);

                      if (!v260) {
                        v260 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v131, "_dataForKey:", v220));
                      }
                      v237 = -[IDSProtoKeyTransparencyLoggableData initWithData:]( objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData),  "initWithData:",  v260);
                      v227 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData ngmPublicIdentity]( v237,  "ngmPublicIdentity"));
                      context = objc_autoreleasePoolPush();
                      if ([v251 applicationKeyIndex]
                        && -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitysCount]( v237,  "applicationPublicIdentitysCount"))
                      {
                        __int128 v292 = 0u;
                        __int128 v291 = 0u;
                        __int128 v290 = 0u;
                        __int128 v289 = 0u;
                        id v239 = (id)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitys]( v237,  "applicationPublicIdentitys"));
                        id v142 = [v239 countByEnumeratingWithState:&v289 objects:v312 count:16];
                        if (v142)
                        {
                          uint64_t v143 = *(void *)v290;
                          while (2)
                          {
                            for (k = 0LL; k != v142; k = (char *)k + 1)
                            {
                              if (*(void *)v290 != v143) {
                                objc_enumerationMutation(v239);
                              }
                              v145 = *(void **)(*((void *)&v289 + 1) + 8LL * (void)k);
                              unsigned int v146 = [v145 keyIndex];
                              if (v146 == sub_1002E08A0((int)[v251 applicationKeyIndex]))
                              {
                                id v142 = (id)objc_claimAutoreleasedReturnValue([v145 publicIdentity]);
                                goto LABEL_216;
                              }
                            }

                            id v142 = [v239 countByEnumeratingWithState:&v289 objects:v312 count:16];
                            if (v142) {
                              continue;
                            }
                            break;
                          }
                        }

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8
{
  LOBYTE(v9) = 1;
  return -[IDSPeerIDManager_OLD sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:]( self,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v78 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
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
  uint64_t v74 = v16;
  id v70 = v15;
  uint64_t v71 = v17;
  uint64_t v72 = v18;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]( self,  "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:",  v15,  v16,  v17,  v18,  v20,  a9));
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
        if (+[IDSPeerIDManager_OLD shouldUseSelfTokens](&OBJC_CLASS___IDSPeerIDManager_OLD, "shouldUseSelfTokens"))
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD _disasterModeTokenForURI:](v73, "_disasterModeTokenForURI:", v74));
          BOOL v22 = v21 != 0LL;
          if (v21)
          {
            uint64_t v23 = OSLogHandleForIDSCategory("PeerLookup_OLD");
            unsigned int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v97 = v74;
              __int16 v98 = 2112;
              uint64_t v99 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Returning disaster mode token for from URI: %@   token: %@",  buf,  0x16u);
            }

            if (os_log_shim_legacy_logging_enabled(v25)
              && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
            {
              uint64_t v68 = v74;
              v69 = v21;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Returning disaster mode token for from URI: %@   token: %@");
            }
          }
        }

        else
        {
          BOOL v22 = 0;
        }

        uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v78, "objectForKeyedSubscript:", v80, v68, v69));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"dates-expire"]);
        id v27 = [v26 mutableCopy];
        id v28 = v27;
        if (v27) {
          id v84 = v27;
        }
        else {
          id v84 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }

        id v29 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"dates-refresh"]);
        id v30 = [v29 mutableCopy];
        uint64_t v31 = v30;
        if (v30) {
          id v32 = v30;
        }
        else {
          id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        uint64_t v33 = v32;

        v34 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"push-tokens"]);
        id v35 = [v34 mutableCopy];
        v36 = v35;
        if (v35) {
          id v37 = v35;
        }
        else {
          id v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        v38 = v37;

        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"session-tokens"]);
        id v40 = [v39 mutableCopy];
        uint64_t v41 = v40;
        if (v40) {
          id v42 = v40;
        }
        else {
          id v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        v43 = v42;

        unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"anonymized-sender-ids"]);
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
                uint64_t v51 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)j);
                v52 = (void *)objc_claimAutoreleasedReturnValue([v51 refreshDate]);
                uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v51 expireDate]);
                [v84 addObject:v53];

                [v33 addObject:v52];
                v54 = (void *)objc_claimAutoreleasedReturnValue([v51 pushToken]);
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
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v62));

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
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 tokenFreeURI]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v19 pushToken]);
        objc_autoreleasePoolPop(v20);
        -[NSMutableArray addObject:](v48, "addObject:", v21);
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v21));
        id v23 = [v22 mutableCopy];
        unsigned int v24 = v23;
        if (v23) {
          uint64_t v25 = (NSMutableArray *)v23;
        }
        else {
          uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        }
        uint64_t v53 = v25;

        id v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v49,  v51,  v21,  0LL));
        if (a7 == 1 || a7 == 2 && [v21 isEqualToURI:v51])
        {
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDPushHandler pushToken](self->_pushHandler, "pushToken"));
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472LL;
          v61[2] = sub_1002E6138;
          v61[3] = &unk_1008F6110;
          id v62 = v27;
          id v28 = v27;
          uint64_t v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v61));

          id v26 = (void *)v29;
        }

        if (v54)
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472LL;
          v59[2] = sub_1002E617C;
          v59[3] = &unk_1008F6110;
          id v60 = v54;
          uint64_t v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v59));

          id v26 = (void *)v30;
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
              v38 = (void *)objc_opt_class(self, v33);
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v37 refreshDate]);
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
  int v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD publicKeyForURI:pushToken:fromURI:service:]( self,  "publicKeyForURI:pushToken:fromURI:service:",  a3,  a4,  a5,  a6));
  BOOL v7 = v6 != 0LL;

  return v7;
}

- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  a6,  a5,  a3,  1LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002E6304;
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
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD pleaseDontCopyCacheDictionaryRepresentation]( self,  "pleaseDontCopyCacheDictionaryRepresentation"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    id v26 = v6;
    id v27 = v5;
    uint64_t v24 = *(void *)v33;
    do
    {
      id v10 = 0LL;
      id v25 = v8;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)v10);
        if (objc_msgSend(v11, "hasMatchingURIs", v24))
        {
          __int128 v30 = 0u;
          __int128 v31 = 0u;
          __int128 v28 = 0u;
          __int128 v29 = 0u;
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 endpoints]);

          id v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v29;
            while (2)
            {
              for (i = 0LL; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pushToken]);
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 rawToken]);
                unsigned __int8 v21 = [v20 isEqualToData:v19];

                if ((v21 & 1) != 0)
                {
                  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v18 publicDeviceIdentityContainer]);

                  int v6 = v26;
                  uint64_t v5 = v27;
                  goto LABEL_21;
                }
              }

              id v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          int v6 = v26;
          uint64_t v5 = v27;
          uint64_t v9 = v24;
          id v8 = v25;
        }

        id v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      BOOL v22 = 0LL;
    }

    while (v8);
  }

  else
  {
    BOOL v22 = 0LL;
  }

- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  a5,  a4,  a3,  1LL));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 senderCorrelationIdentifier]);
  return v7;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  a6,  a5,  a3,  1LL));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002E66D0;
  v17[3] = &unk_1008F6110;
  id v18 = v10;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "__imArrayByFilteringWithBlock:", v17));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 senderCorrelationIdentifier]);
  return v15;
}

- (id)shortHandleForURI:(id)a3 fromURI:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  IDSServiceNameiMessage,  a4,  a3,  1LL));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (!v5) {
    goto LABEL_5;
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 shortHandle]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 shortHandle]);

    if (v7)
    {
      int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 shortHandle]);
      goto LABEL_6;
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
  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:]( self,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:",  v20,  v18,  v17,  v16,  a10,  0LL));

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary, v22);
  id v24 = v15;
  uint64_t v39 = v21;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v24]);
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
        sub_1006A7858((uint64_t)v24, v23, v27);
      }
    }

    id v26 = 0LL;
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v26 _arrayForKey:@"session-tokens"]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v26 _arrayForKey:@"push-tokens"]);
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
    v36 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndex:v33]);
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
      id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v12,  v11,  v10,  1LL));
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
  v38 = v13;
  uint64_t v39 = v15;
  if (v12)
  {
    id v37 = v16;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v16,  v15,  v13,  0LL));
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
          unsigned __int8 v21 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pushTokenObject", v34, v35, v36));
          unsigned int v23 = [v22 isEqualToPushToken:v14];

          if (v23)
          {
            double v24 = (void *)objc_claimAutoreleasedReturnValue([v21 capabilities]);
            id v17 = [v24 valueForCapability:v12];

            uint64_t v25 = OSLogHandleForIDSCategory("PeerLookup_OLD");
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
              && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
            {
              __int128 v29 = @"YES";
              if (!v17) {
                __int128 v29 = @"NO";
              }
              __int128 v35 = v29;
              v36 = v14;
              id v34 = v12;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Found %@ value: %@  for peer token: %@");
            }
          }

          else
          {
            uint64_t v30 = OSLogHandleForIDSCategory("PeerLookup_OLD");
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
              && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
            {
              id v34 = v12;
              __int128 v35 = v14;
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"** No %@ value found for peer token: %@");
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
  return -[IDSPeerIDManager_OLD _valueOfProperty:forURI:pushToken:fromURI:service:]( self,  "_valueOfProperty:forURI:pushToken:fromURI:service:",  a3,  a4,  a5,  a6,  a7) > 0;
}

- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  return -[IDSPeerIDManager_OLD hasProperty:forURI:pushToken:fromURI:service:]( self,  "hasProperty:forURI:pushToken:fromURI:service:",  IDSRegistrationPropertyShowPeerErrors,  a3,  a4,  a5,  a6);
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v10 && v9 && v11)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD endpointsForURIs:service:fromURI:ignoringTTL:]( self,  "endpointsForURIs:service:fromURI:ignoringTTL:",  v8,  v9,  v10,  0LL));
  }

  else
  {
    uint64_t v13 = OSLogHandleForIDSCategory("PeerLookup_OLD");
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
      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
    {
      id v19 = v9;
      id v20 = v10;
      id v18 = v8;
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Missing required field(s) for endpointsForURIs -- returning nil {uris: %@, service: %@, fromURI: %@}");
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
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD endpointsForURIs:service:fromURI:]( self,  "endpointsForURIs:service:fromURI:",  v15,  v12,  v14));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v11]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1002E743C;
    v24[3] = &unk_1008F6110;
    id v25 = v10;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "__imArrayByFilteringWithBlock:", v24));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
  }

  else
  {
    uint64_t v20 = OSLogHandleForIDSCategory("PeerLookup_OLD");
    unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
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
      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Missing required field(s) for endpointForPushToken -- returning nil {pushToken: %@, URI: %@, service: %@, fromURI: %@}");
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
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v11,  v12,  v18,  v6));
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
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v11,  v12,  v18,  0LL));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1002E77CC;
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
  id v60 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD endpointsForURIs:service:fromURI:ignoringTTL:]( self,  "endpointsForURIs:service:fromURI:ignoringTTL:",  v12,  v13,  v52,  1LL));
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
          uint64_t v29 = OSLogHandleForIDSCategory("PeerLookup_OLD");
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "URI %@ didn't have remote devices.",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v31)
            && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
          {
            id v48 = v16;
            _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup_OLD", @"URI %@ didn't have remote devices.");
          }

- (id)lightDescriptionForVerifierResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v5 = objc_opt_class(v3, v4);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 succeed]));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 uiStatus]));
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
  id v10 = a3;
  id v29 = a4;
  id v30 = a5;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPeerIDKey peerIDKeyWithService:fromURI:toURI:]( &OBJC_CLASS___IDSPeerIDKey,  "peerIDKeyWithService:fromURI:toURI:",  v10,  v29));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v10));
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v32]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v31 endpoints]);
  id v13 = v12;
  if (!a6)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v14 = v12;
    id v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v34;
      while (2)
      {
        id v18 = 0LL;
        do
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v18);
          uint64_t v20 = (void *)objc_opt_class(self, v15);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 expireDate]);
          LODWORD(v20) = [v20 _datePassed:v21];

          if ((_DWORD)v20)
          {
            uint64_t v23 = OSLogHandleForIDSCategory("PeerLookup_OLD");
            __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v19 URI]);
              *(_DWORD *)buf = 138412290;
              uint64_t v38 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "** At least one session token expired for: %@, need to get new ones",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v26)
              && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
            {
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v19 URI]);
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"** At least one session token expired for: %@, need to get new ones");
            }

            id v22 = 0LL;
            goto LABEL_18;
          }

          id v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }

  id v22 = v13;
LABEL_18:

  return v22;
}

- (id)_peerIDKeysForService:(id)a3 andFromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002E84AC;
  v14[3] = &unk_1008F6138;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "__imArrayByFilteringWithBlock:", v14));

  return v12;
}

- (id)_peerIDKeysForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002E85DC;
  v10[3] = &unk_1008F6160;
  id v11 = v4;
  id v7 = v4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v10));

  return v8;
}

- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  theDict = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self->_keyTransparencyVerifier, "accountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self->_keyTransparencyVerifier, "serviceController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceWithIdentifier:v9]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 accountsOnService:v12]);

  uint64_t v40 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
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
        id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * (void)i), "registration", v33));
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 uris]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imArrayByApplyingBlock:", &stru_100900388));

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
        id v22 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
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
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _keyTransparencyVerifierResultForService:fromURI:toURI:]( self,  "_keyTransparencyVerifierResultForService:fromURI:toURI:",  v9,  v30,  v24));

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
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD keyTransparencyContextForService:fromURI:toURI:]( self,  "keyTransparencyContextForService:fromURI:toURI:",  a3,  a4,  a5));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 verifierResult]);

  return v6;
}

- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPeerIDKey peerIDKeyWithService:fromURI:toURI:]( &OBJC_CLASS___IDSPeerIDKey,  "peerIDKeyWithService:fromURI:toURI:",  v8,  a4,  a5));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v8));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keyTransparencyContext]);

  return v12;
}

- (void)updateCachedVerifierResultsWithResults:(id)a3
{
  id v3 = a3;
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v69 = [v3 count];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Updating query cache with KT peer verification results { count: %lu }",  buf,  0xCu);
  }

  __int128 v49 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v44 = v3;
  id obj = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v50 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v50)
  {
    uint64_t v45 = *(void *)v65;
    do
    {
      for (i = 0LL; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v65 != v45) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
        id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD pleaseDontCopyCacheDictionaryRepresentation]( self,  "pleaseDontCopyCacheDictionaryRepresentation"));
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
        id v9 = [v8 countByEnumeratingWithState:&v60 objects:v74 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v61;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v61 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)j);
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 toURI]);
              unsigned int v15 = [v6 isEqualToURI:v14];

              if (v15) {
                -[NSMutableArray addObject:](v49, "addObject:", v13);
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v60 objects:v74 count:16];
          }

          while (v10);
        }
      }

      id v50 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
    }

    while (v50);
  }

  if (-[NSMutableArray count](v49, "count"))
  {
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v39 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMaps](self, "persistentMaps"));
    uint64_t v16 = v44;
    id v41 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
    char v17 = 0;
    if (v41)
    {
      uint64_t v40 = *(void *)v57;
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v57 != v40) {
            objc_enumerationMutation(v39);
          }
          uint64_t v42 = v18;
          id v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v48 = v49;
          id v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v52,  v72,  16LL);
          if (v51)
          {
            uint64_t v20 = *(void *)v53;
            uint64_t v46 = *(void *)v53;
            do
            {
              for (k = 0LL; k != v51; k = (char *)k + 1)
              {
                if (*(void *)v53 != v20) {
                  objc_enumerationMutation(v48);
                }
                id v22 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)k);
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v22]);
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 keyTransparencyContext]);

                id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 verifierResult]);
                id v26 = (void *)objc_claimAutoreleasedReturnValue([v22 toURI]);
                id v27 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v26]);

                if (([v25 isEqual:v27] & 1) == 0)
                {
                  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    id v29 = (void *)objc_claimAutoreleasedReturnValue([v22 toURI]);
                    *(_DWORD *)buf = 138412546;
                    id v69 = v29;
                    __int16 v70 = 2112;
                    uint64_t v71 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "URI: %@ has a new KTVerifierResult: %@",  buf,  0x16u);
                  }

                  id v30 = objc_alloc(&OBJC_CLASS___IDSQueryKeyTransparencyContext);
                  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v24 accountKey]);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v24 queryResponseTime]);
                  id v33 = -[IDSQueryKeyTransparencyContext initWithVerifierResult:ticket:accountKey:queryResponseTime:ktOptIn:]( v30,  "initWithVerifierResult:ticket:accountKey:queryResponseTime:ktOptIn:",  v27,  0,  v31,  v32,  [v24 ktOptIn]);

                  id v34 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v22]);
                  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 endpoints]);
                  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPeerIDValue peerIDValueWithEndpoints:keyTransparencyContext:]( &OBJC_CLASS___IDSPeerIDValue,  "peerIDValueWithEndpoints:keyTransparencyContext:",  v35,  v33));

                  [v19 setObject:v36 forKey:v22];
                  char v17 = 1;
                  uint64_t v16 = v44;
                  uint64_t v20 = v46;
                }
              }

              id v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v52,  v72,  16LL);
            }

            while (v51);
          }

          uint64_t v18 = v42 + 1;
        }

        while ((id)(v42 + 1) != v41);
        id v41 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
      }

      while (v41);
    }

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17 & 1));
    [v37 logMetric:v38 withName:@"IDSKTPeerVerificationResultsChanged"];
  }

  else
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    uint64_t v16 = v44;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v37, OS_LOG_TYPE_DEFAULT, "Found no keys to update.", buf, 2u);
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
  uint64_t v23 = -[IDSPeerIDQueryContext initWithSending:refresh:messaging:resultExpected:preventNewQuery:isForced:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryContext),  "initWithSending:refresh:messaging:resultExpected:preventNewQuery:isForced:",  v12,  v11,  0LL,  0LL,  0LL,  a9);
  LOBYTE(v12) = -[IDSPeerIDManager_OLD startQueryForURIs:fromIdentity:fromURI:fromService:context:reason:completionBlock:]( self,  "startQueryForURIs:fromIdentity:fromURI:fromService:context:reason:completionBlock:",  v22,  v21,  v20,  v19,  v23,  v18,  v17);

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
  id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "__imSetByApplyingBlock:", &stru_1009003A8));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD endpointsForURIs:service:fromURI:]( self,  "endpointsForURIs:service:fromURI:",  v21,  v16,  v15));

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD queryHandler](self, "queryHandler"));
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v19 allObjects]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1002E946C;
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
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v12,  v11,  v10,  0LL));
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

      uint64_t v24 = OSLogHandleForIDSCategory("PeerLookup_OLD");
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
        && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
      {
        id v42 = v10;
        id v43 = v17;
        id v41 = v9;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Checking peer token: %@ for URI: %@   (Tokens: %@)");
      }

      if ((v23 & 1) != 0)
      {
        uint64_t v27 = OSLogHandleForIDSCategory("PeerLookup_OLD");
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "  => Good to go, we have it", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled(v29)
          && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
        {
          _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup_OLD", @"  => Good to go, we have it");
        }
      }

      else
      {
        uint64_t v30 = OSLogHandleForIDSCategory("PeerLookup_OLD");
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "  => We don't have it - clearing that peer's map",  buf,  2u);
        }

        if (os_log_shim_legacy_logging_enabled(v32)
          && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
        {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"  => We don't have it - clearing that peer's map");
        }

        if (+[IDSPeerIDManager_OLD shouldUseSelfTokens]( &OBJC_CLASS___IDSPeerIDManager_OLD,  "shouldUseSelfTokens",  v41,  v42,  v43))
        {
          uint64_t v33 = OSLogHandleForIDSCategory("PeerLookup_OLD");
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Not flushing tokens, we're in debilitated mode",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v35)
            && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
          {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Not flushing tokens, we're in debilitated mode");
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

          -[IDSPeerIDManager_OLD forgetSessionTokensForURI:fromURI:service:]( self,  "forgetSessionTokensForURI:fromURI:service:",  v10,  v11,  v12);
        }
      }
    }
  }
}

- (void)clearCacheAndPersistImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("PeerLookup_OLD");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing peer and personal caches", buf, 2u);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMaps](self, "persistentMaps", 0LL));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        [v12 removeAllObjects];
        if (v3) {
          [v12 persistImmediately];
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v9);
  }
}

- (id)pleaseDontCopyCacheDictionaryRepresentation
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMaps](self, "persistentMaps"));
  if ([v2 count] == (id)1)
  {
    BOOL v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v2 firstObject]);
    id v4 = -[NSMutableDictionary copyDictionaryRepresentation](v3, "copyDictionaryRepresentation");
  }

  else
  {
    BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v2;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v9),  "copyDictionaryRepresentation",  (void)v13);
          -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v10);

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    id v4 = -[NSMutableDictionary copy](v3, "copy");
  }

  id v11 = v4;

  return v11;
}

- (void)forgetSessionTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[IDSPeerIDManager_OLD shouldUseSelfTokens](&OBJC_CLASS___IDSPeerIDManager_OLD, "shouldUseSelfTokens"))
  {
    uint64_t v11 = OSLogHandleForIDSCategory("PeerLookup_OLD");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v13)
      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
    id v15 = [v14 length];

    if (v15)
    {
      uint64_t v16 = OSLogHandleForIDSCategory("PeerLookup_OLD");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v29 = v8;
        __int16 v30 = 2112;
        id v31 = v9;
        __int16 v32 = 2112;
        id v33 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Forgetting session tokens for URI: %@  from URI: %@  service: %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v18)
        && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
      {
        id v26 = v9;
        id v27 = v10;
        id v25 = v8;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Forgetting session tokens for URI: %@  from URI: %@  service: %@");
      }

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "prefixedURI", v25, v26, v27));
      id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_im_normalizedURIString"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 trimmedString]);
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v21,  v10));

      char v23 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPeerIDKey peerIDKeyWithService:fromURI:toURI:]( &OBJC_CLASS___IDSPeerIDKey,  "peerIDKeyWithService:fromURI:toURI:",  v10,  v9,  v22));
      if (v23)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v10));
        [v24 removeObjectForKey:v23];
      }
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[IDSPeerIDManager_OLD forgetPeerTokensForURI:fromURI:service:]( self,  "forgetPeerTokensForURI:fromURI:service:",  v8,  v9,  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14));
        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v12);
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v7 = a3;
  id v37 = a4;
  id v8 = a5;
  id v33 = v7;
  if (+[IDSPeerIDManager_OLD shouldUseSelfTokens](&OBJC_CLASS___IDSPeerIDManager_OLD, "shouldUseSelfTokens"))
  {
    uint64_t v9 = OSLogHandleForIDSCategory("PeerLookup_OLD");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
    id v13 = [v12 length];

    if (v13)
    {
      uint64_t v14 = OSLogHandleForIDSCategory("PeerLookup_OLD");
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v49 = v7;
        __int16 v50 = 2112;
        id v51 = v37;
        __int16 v52 = 2112;
        id v53 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for URI: %@  from URI: %@  service: %@",  buf,  0x20u);
      }

      if (os_log_shim_legacy_logging_enabled(v16)
        && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
      {
        id v31 = v37;
        id v32 = v8;
        id v30 = v7;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Forgetting peer tokens for URI: %@  from URI: %@  service: %@");
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDPushHandler pushToken](self->_pushHandler, "pushToken", v30, v31, v32));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_im_normalizedURIString"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 trimmedString]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v19,  v8));

      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v8,  v37,  v7,  0LL));
      id v21 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v43;
        do
        {
          for (i = 0LL; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v42 + 1) + 8 * (void)i) pushToken]);
            if (![v20 isEqualToURI:v37]
              || ([v24 isEqualToData:v34] & 1) == 0)
            {
              __int128 v40 = 0u;
              __int128 v41 = 0u;
              __int128 v38 = 0u;
              __int128 v39 = 0u;
              id v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_purgeClientDataBlocks, "allValues"));
              id v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
              if (v26)
              {
                uint64_t v27 = *(void *)v39;
                do
                {
                  for (j = 0LL; j != v26; j = (char *)j + 1)
                  {
                    if (*(void *)v39 != v27) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)j);
                    if (v29) {
                      (*(void (**)(uint64_t, id))(v29 + 16))(v29, v8);
                    }
                  }

                  id v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
                }

                while (v26);
              }
            }
          }

          id v21 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
        }

        while (v21);
      }

      -[IDSPeerIDManager_OLD forgetSessionTokensForURI:fromURI:service:]( self,  "forgetSessionTokensForURI:fromURI:service:",  v33,  v37,  v8);
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v34 = a4;
  id v33 = v6;
  if (+[IDSPeerIDManager_OLD shouldUseSelfTokens](&OBJC_CLASS___IDSPeerIDManager_OLD, "shouldUseSelfTokens"))
  {
    uint64_t v7 = OSLogHandleForIDSCategory("PeerLookup_OLD");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not forgetting tokens, we're in debilitated mode",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Not forgetting tokens, we're in debilitated mode");
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 prefixedURI]);
    id v11 = [v10 length];

    if (v11)
    {
      uint64_t v12 = OSLogHandleForIDSCategory("PeerLookup_OLD");
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
        && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
      {
        id v31 = v6;
        id v32 = v34;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Forgetting peer tokens for URI: %@ service: %@ for all registered URIs.");
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDAccountController sharedInstance]( &OBJC_CLASS___IDSDAccountController,  "sharedInstance",  v31,  v32));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceWithIdentifier:v34]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 accountsOnService:v17]);

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
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v39 + 1) + 8 * (void)i) registration]);
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 uris]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_1009003C8));

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
      uint64_t v27 = v19;
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
            -[IDSPeerIDManager_OLD forgetPeerTokensForURI:fromURI:service:]( self,  "forgetPeerTokensForURI:fromURI:service:",  v33,  *(void *)(*((void *)&v35 + 1) + 8LL * (void)j),  v34);
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
  __int128 v38 = self;
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v35 allKeys]);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1002EB21C;
  v51[3] = &unk_1008F6160;
  id v30 = v4;
  id v52 = v30;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v51));

  uint64_t v7 = OSLogHandleForIDSCategory("PeerLookup_OLD");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v57 = v30;
    __int16 v58 = 2112;
    id v59 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Forgetting peer tokens for service {service: %@, keys: %@}",  buf,  0x16u);
  }

  if (os_log_shim_legacy_logging_enabled(v9) && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
  {
    id v28 = v30;
    uint64_t v29 = v6;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Forgetting peer tokens for service {service: %@, keys: %@}");
  }

  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDPushHandler pushToken](self->_pushHandler, "pushToken", v28, v29));
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v6;
  id v34 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v34)
  {
    uint64_t v31 = *(void *)v48;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v48 != v31)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }

        uint64_t v33 = v10;
        uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * v10);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v12]);
        id v37 = (id)objc_claimAutoreleasedReturnValue([v13 endpoints]);

        id v14 = [v37 countByEnumeratingWithState:&v43 objects:v54 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v44 != v15) {
                objc_enumerationMutation(v37);
              }
              __int128 v17 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v12 toURI]);
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 fromURI]);
              if ([v18 isEqualToURI:v19])
              {
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 pushToken]);
                unsigned __int8 v21 = [v20 isEqualToData:v36];

                if ((v21 & 1) != 0) {
                  continue;
                }
              }

              else
              {
              }

              __int128 v41 = 0u;
              __int128 v42 = 0u;
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v38->_purgeClientDataBlocks, "allValues"));
              id v23 = [v22 countByEnumeratingWithState:&v39 objects:v53 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v40;
                do
                {
                  for (j = 0LL; j != v23; j = (char *)j + 1)
                  {
                    if (*(void *)v40 != v24) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)j);
                    if (v26)
                    {
                      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
                      (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
                    }
                  }

                  id v23 = [v22 countByEnumeratingWithState:&v39 objects:v53 count:16];
                }

                while (v23);
              }
            }

            id v14 = [v37 countByEnumeratingWithState:&v43 objects:v54 count:16];
          }

          while (v14);
        }

        [v35 removeObjectForKey:v12];
        uint64_t v10 = v33 + 1;
      }

      while ((id)(v33 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    }

    while (v34);
  }
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
  id v12 = [v11 length];

  if (v12)
  {
    if (+[IDSPeerIDManager_OLD shouldUseSelfTokens](&OBJC_CLASS___IDSPeerIDManager_OLD, "shouldUseSelfTokens")
      && (id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD _disasterModeTokenForURI:](self, "_disasterModeTokenForURI:", v9)),
          v13,
          v13))
    {
      LOBYTE(v14) = 0;
    }

    else
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 pushToken]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenFreeURI]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _endpointsForService:fromURI:toURI:ignoreExpiration:]( self,  "_endpointsForService:fromURI:toURI:ignoreExpiration:",  v10,  v9,  v16,  0LL));
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
            uint64_t v24 = v16;
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
        if (!-[IDSPeerIDManager_OLD hasPeerTokensForURI:fromURI:service:]( self,  "hasPeerTokensForURI:fromURI:service:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  v9,  v10,  (void)v18))
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
  if (![v6 length])
  {

    goto LABEL_36;
  }

  id v7 = [v38 length];

  if (!v7)
  {
LABEL_36:
    uint64_t v31 = 0LL;
    goto LABEL_37;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD _peerIDKeysForService:andFromURI:]( self,  "_peerIDKeysForService:andFromURI:",  v38,  v37));
  __int128 v44 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v9 = OSLogHandleForIDSCategory("PeerIDManager");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v56 = v38;
    __int16 v57 = 2112;
    id v58 = v37;
    __int16 v59 = 2112;
    __int128 v60 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Active query for service: %@  from: %@  peers: %@",  buf,  0x20u);
  }

  if (os_log_shim_legacy_logging_enabled(v11) && _IDSShouldLog(1LL, @"PeerIDManager"))
  {
    id v35 = v37;
    __int128 v36 = v8;
    id v33 = v38;
    _IDSLogV( 1LL,  @"IDSFoundation",  @"PeerIDManager",  @"Active query for service: %@  from: %@  peers: %@");
  }

  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v38, v33, v35, v36));
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v8;
  id v42 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v50;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v50 != v40)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }

        uint64_t v43 = v12;
        uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * v12);
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", v14, v34));
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 endpoints]);

        id v18 = [v16 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v46;
          do
          {
            for (i = 0LL; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v46 != v19) {
                objc_enumerationMutation(v16);
              }
              __int128 v21 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
              uint64_t v22 = objc_opt_class(self, v17);
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 expireDate]);
              LOBYTE(v22) = [(id)v22 _datePassed:v23];

              if ((v22 & 1) != 0)
              {
                uint64_t v24 = OSLogHandleForIDSCategory("PeerIDManager");
                __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v56 = v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "  Expired session for: %@, skipping...",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v26)
                  && _IDSShouldLog(0LL, @"PeerIDManager"))
                {
                  id v34 = v21;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"  Expired session for: %@, skipping...");
                }
              }

              else
              {
                uint64_t v27 = OSLogHandleForIDSCategory("PeerIDManager");
                __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v56 = v21;
                  _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "  Active sessions for: %@, adding...",  buf,  0xCu);
                }

                if (os_log_shim_legacy_logging_enabled(v29)
                  && _IDSShouldLog(0LL, @"PeerIDManager"))
                {
                  id v34 = v21;
                  _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"  Active sessions for: %@, adding...");
                }

                id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URI", v34));
                -[NSMutableSet addObject:](v44, "addObject:", v30);
              }
            }

            id v18 = [v16 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }

          while (v18);
        }

        uint64_t v12 = v43 + 1;
      }

      while ((id)(v43 + 1) != v42);
      id v42 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }

    while (v42);
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v44, "allObjects"));
LABEL_37:

  return v31;
}

- (id)uriForShortHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IDSServiceNameiMessage;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD persistentMapForService:]( self,  "persistentMapForService:",  IDSServiceNameiMessage));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD _peerIDKeysForService:](self, "_peerIDKeysForService:", v5));
  id v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v8 = *(void *)v30;
    uint64_t v24 = v6;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v7);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * (void)i)]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 endpoints]);

        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v26;
          while (2)
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)j);
              id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 shortHandle]);
              unsigned __int8 v19 = [v18 isEqualToString:v4];

              if ((v19 & 1) != 0)
              {
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 URI]);

                id v6 = v24;
                goto LABEL_19;
              }
            }

            id v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v6 = v24;
        uint64_t v8 = v22;
      }

      __int128 v20 = 0LL;
      id v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v23);
  }

  else
  {
    __int128 v20 = 0LL;
  }

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManager_OLD pleaseDontCopyCacheDictionaryRepresentation]( self,  "pleaseDontCopyCacheDictionaryRepresentation"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    __int128 v31 = v9;
    id v32 = v7;
    uint64_t v30 = *(void *)v41;
    do
    {
      uint64_t v13 = 0LL;
      id v33 = v11;
      do
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v35 = v13;
        id v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "service", v30, v31, v32));
        unsigned int v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
          __int128 v36 = 0u;
          __int128 v37 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v34 = v17;
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 endpoints]);
          id v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v37;
            do
            {
              for (i = 0LL; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 pushToken]);
                __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 rawToken]);
                unsigned int v26 = [v24 isEqualToData:v25];

                if (v26)
                {
                  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v23 URI]);
                  [v8 addObject:v27];
                }
              }

              id v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }

            while (v20);
          }

          uint64_t v9 = v31;
          id v7 = v32;
          uint64_t v12 = v30;
          id v11 = v33;
        }

        uint64_t v13 = v35 + 1;
      }

      while ((id)(v35 + 1) != v11);
      id v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v11);
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);

  return v28;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_1002EC058;
    id v14 = &unk_1009003F0;
    uint64_t v15 = self;
    id v16 = v6;
    id v8 = a4;
    uint64_t v9 = objc_retainBlock(&v11);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD queryHandler](self, "queryHandler", v11, v12, v13, v14, v15));
    [v10 addCompletionBlock:v9 forToken:v8];
  }
}

- (void)removeCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD queryHandler](self, "queryHandler"));
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
        uint64_t v12 = self->_clientDataUpdateBlocks;
        id v13 = objc_retainBlock(v10);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v7);
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("PeerIDManager");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Empty client data update block for token: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"PeerIDManager"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Empty client data update block for token: %@");
      }
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("PeerIDManager");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Empty token for client data update block",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"PeerIDManager", @"Empty token for client data update block");
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
    uint64_t v6 = OSLogHandleForIDSCategory("PeerIDManager");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Empty token for removing client data update block",  v9,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Empty token for removing client data update block");
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
        uint64_t v12 = self->_purgeClientDataBlocks;
        id v13 = objc_retainBlock(v10);
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v7);
      }
    }

    else
    {
      uint64_t v17 = OSLogHandleForIDSCategory("PeerIDManager");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Empty purge client data block for token: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v19)
        && _IDSShouldLog(0LL, @"PeerIDManager"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Empty purge client data block for token: %@");
      }
    }
  }

  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory("PeerIDManager");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Empty token for purge client data block",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"PeerIDManager", @"Empty token for purge client data block");
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
    uint64_t v6 = OSLogHandleForIDSCategory("PeerIDManager");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Empty token for removing purge client data block",  v9,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Empty token for removing purge client data block");
    }
  }
}

- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = v10;
  if (v8 && v9 && v10)
  {
    uint64_t v13 = im_primary_queue(v10, v11);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002ECB64;
    block[3] = &unk_1008F6308;
    block[4] = self;
    id v23 = v8;
    id v21 = v12;
    id v22 = v9;
    dispatch_async(v14, block);
  }

  else
  {
    uint64_t v15 = OSLogHandleForIDSCategory("PeerIDManager");
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
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      id v19 = objc_retainBlock(v8);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Missing context for adding endpoint query completion block -- ignoring request {block: %@, token: %@, queue: %@}");
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
    block[2] = sub_1002ECD74;
    block[3] = &unk_1008F5F80;
    block[4] = self;
    id v13 = v6;
    dispatch_async(v8, block);
  }

  else
  {
    uint64_t v9 = OSLogHandleForIDSCategory("PeerIDManager");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Missing context for removing endpoint query completion block -- ignoring request {token: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v11)
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Missing context for removing endpoint query completion block -- ignoring request {token: %@}");
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
    uint64_t v20 = OSLogHandleForIDSCategory("PeerIDManager");
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
      && _IDSShouldLog(0LL, @"PeerIDManager"))
    {
      id v31 = objc_retainBlock(v15);
      _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerIDManager",  @"Missing context for endpoint request -- returning nil {URIs: %@, serviceIdentifier: %@, localURI: %@, completion: %@, queue: %@}");
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = *((void *)v19 + 49);
    block[2] = sub_1002ED098;
    block[3] = &unk_1008F6330;
    id v39 = v15;
    dispatch_async(v18, block);
  }

  uint64_t v24 = im_primary_queue(v16, v17);
  id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = *((void *)v19 + 49);
  v32[2] = sub_1002ED0A8;
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
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enqueueing cleanup tasks if needed", v4, 2u);
  }

  -[IDSPeerIDManager_OLD _asyncCleanupExpiredEntriesIfNeeded](self, "_asyncCleanupExpiredEntriesIfNeeded");
  -[IDSPeerIDManager_OLD _asyncRemoveExcessiveQueryEntriesIfNeeded](self, "_asyncRemoveExcessiveQueryEntriesIfNeeded");
}

- (void)_asyncCleanupExpiredEntriesIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002ED230;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  im_dispatch_background_after(v2, a2, 2.0);
}

- (void)_asyncRemoveExcessiveQueryEntriesIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002ED28C;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  im_dispatch_background_after(v2, a2, 2.0);
}

- (void)cleanupExpiredEntriesIfNeeded
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue( -[IMUserDefaults appValueForKey:]( self->_userDefaults,  "appValueForKey:",  @"peer-id-manager-cleanup-interval"));
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v4 = v3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
    *(_DWORD *)buf = 138412546;
    id v43 = v6;
    __int16 v44 = 2112;
    id v45 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking to cleanup expired entries if needed {now: %@, val: %@}",  buf,  0x16u);
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
  if ((objc_opt_isKindOfClass(v2, v8) & 1) == 0 || ([v2 doubleValue], v9 + 86400.0 <= v4))
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMaps](self, "persistentMaps", v2));
    id v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v10;
          uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
          id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v33;
            do
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v33 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v17]);
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 endpoints]);
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

                id v22 = (void *)objc_opt_class(self, v21);
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v20 expireDate]);
                LODWORD(v22) = [v22 _datePassed:v23];

                if ((_DWORD)v22) {
                  [v11 removeObjectForKey:v17];
                }
              }

              id v14 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }

            while (v14);
          }

          uint64_t v10 = v30 + 1;
        }

        while ((id)(v30 + 1) != v29);
        id v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v29);
    }

    userDefaults = self->_userDefaults;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
    -[IMUserDefaults setAppValue:forKey:]( userDefaults,  "setAppValue:forKey:",  v25,  @"peer-id-manager-cleanup-interval");

    BOOL v2 = v26;
  }
}

- (void)removeExcessiveQueryEntriesIfNeeded
{
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManager_OLD persistentMaps](self, "persistentMaps"));
  id v48 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v48; i = (char *)i + 1)
      {
        if (*(void *)v60 != v47) {
          objc_enumerationMutation(obj);
        }
        BOOL v2 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        uint64_t v3 = OSLogHandleForIDSCategory("PeerLookup_OLD");
        double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v5 = -[IDSPeerIDManager_OLD excessiveQueryCacheEntriesThreshold](self, "excessiveQueryCacheEntriesThreshold");
          *(_DWORD *)buf = 134217984;
          unint64_t v66 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Checking to see if we've hit query cache threshold... {current threshold: %ld}",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v6)
          && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
        {
          id v45 = -[IDSPeerIDManager_OLD excessiveQueryCacheEntriesThreshold](self, "excessiveQueryCacheEntriesThreshold");
          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"Checking to see if we've hit query cache threshold... {current threshold: %ld}");
        }

        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys", v45));
        id v8 = [v7 count];
        BOOL v9 = v8 > (id)-[IDSPeerIDManager_OLD excessiveQueryCacheEntriesThreshold]( self,  "excessiveQueryCacheEntriesThreshold");

        if (v9)
        {
          uint64_t v10 = OSLogHandleForIDSCategory("PeerLookup_OLD");
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
            id v13 = [v12 count];
            *(_DWORD *)buf = 134217984;
            unint64_t v66 = (unint64_t)v13;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We are over {current count: %ld} -- removing older entries",  buf,  0xCu);
          }

          if (os_log_shim_legacy_logging_enabled(v14)
            && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
            id v45 = [v15 count];
            _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"We are over {current count: %ld} -- removing older entries");
          }

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", v45));
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "dateByAddingTimeInterval:",  -(double)-[IDSPeerIDManager_OLD excessiveQueryCacheEntriesRemovalWindow]( self,  "excessiveQueryCacheEntriesRemovalWindow")));

          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
          id v19 = [v18 countByEnumeratingWithState:&v55 objects:v64 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v56;
            do
            {
              for (j = 0LL; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v56 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v22 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)j);
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:v22]);
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 keyTransparencyContext]);

                id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 queryResponseTime]);
                BOOL v26 = [v25 compare:v17] == (id)-1;

                if (v26) {
                  [v2 removeObjectForKey:v22];
                }
              }

              id v19 = [v18 countByEnumeratingWithState:&v55 objects:v64 count:16];
            }

            while (v19);
          }

          id v27 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
          id v28 = [v27 count];
          BOOL v29 = v28 > (id)-[IDSPeerIDManager_OLD excessiveQueryCacheEntriesThreshold]( self,  "excessiveQueryCacheEntriesThreshold");

          if (v29)
          {
            uint64_t v30 = OSLogHandleForIDSCategory("PeerLookup_OLD");
            id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
              id v33 = [v32 count];
              *(_DWORD *)buf = 134217984;
              unint64_t v66 = (unint64_t)v33;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "We are still over {current count: %ld} -- removing everything",  buf,  0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v34)
              && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
            {
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
              id v45 = [v35 count];
              _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"We are still over {current count: %ld} -- removing everything");
            }

            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys", v45));
            id v37 = [v36 countByEnumeratingWithState:&v51 objects:v63 count:16];
            if (v37)
            {
              uint64_t v38 = *(void *)v52;
              do
              {
                for (k = 0LL; k != v37; k = (char *)k + 1)
                {
                  if (*(void *)v52 != v38) {
                    objc_enumerationMutation(v36);
                  }
                  [v2 removeObjectForKey:*(void *)(*((void *)&v51 + 1) + 8 * (void)k)];
                }

                id v37 = [v36 countByEnumeratingWithState:&v51 objects:v63 count:16];
              }

              while (v37);
            }
          }

          goto LABEL_45;
        }

        uint64_t v40 = OSLogHandleForIDSCategory("PeerLookup_OLD");
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v42 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
          id v43 = [v42 count];
          *(_DWORD *)buf = 134217984;
          unint64_t v66 = (unint64_t)v43;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "We are at %ld entries -- no need to remove",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v44)
          && _IDSShouldLog(0LL, @"PeerLookup_OLD"))
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
          id v45 = [v17 count];
          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup_OLD",  @"We are at %ld entries -- no need to remove");
LABEL_45:

          continue;
        }
      }

      id v48 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }

    while (v48);
  }
}

- (unint64_t)excessiveQueryCacheEntriesThreshold
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"excessive-query-threshold"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unint64_t v6 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 600LL;
  }
  if (+[IMUserDefaults excessiveQueryCacheEntriesThreshold]( &OBJC_CLASS___IMUserDefaults,  "excessiveQueryCacheEntriesThreshold") >= 1) {
    unint64_t v6 = +[IMUserDefaults excessiveQueryCacheEntriesThreshold]( &OBJC_CLASS___IMUserDefaults,  "excessiveQueryCacheEntriesThreshold");
  }

  return v6;
}

- (unint64_t)excessiveQueryCacheEntriesRemovalWindow
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"excessive-query-removal-window"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    unint64_t v6 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = 86400LL;
  }

  return v6;
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

- (IDSPersistentMap)standardPersistentMap
{
  return self->_standardPersistentMap;
}

- (void)setStandardPersistentMap:(id)a3
{
}

- (IDSPersistentMap)restrictedServicePersistentMap
{
  return self->_restrictedServicePersistentMap;
}

- (void)setRestrictedServicePersistentMap:(id)a3
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

- (void).cxx_destruct
{
}

@end