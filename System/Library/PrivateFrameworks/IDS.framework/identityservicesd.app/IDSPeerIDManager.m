@interface IDSPeerIDManager
+ (BOOL)compareEndpoints:(id)a3 with:(id)a4;
+ (BOOL)compareInfoResult:(id)a3 with:(id)a4;
+ (IDSPeerIDManager)sharedInstance;
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11;
- (IDSPeerIDManager)init;
- (IDSPeerIDManagerProtocol)managerOLD;
- (IDSPeerIDManagerProtocol)managerSD;
- (NSMutableSet)reportedExcessiveQueryCacheEntries;
- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6;
- (id)activeURIsFromURI:(id)a3 service:(id)a4;
- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6;
- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6;
- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8;
- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
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
- (unint64_t)excessiveQueryCacheEntriesThreshold;
- (void)_triggerAutoBugCaptureWithContext:(id)a3;
- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5;
- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4;
- (void)clearCacheAndPersistImmediately:(BOOL)a3;
- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7;
- (void)forgetPeerTokensForService:(id)a3;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4;
- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4;
- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6;
- (void)performCleanupTasks;
- (void)registerSysdiagnoseBlock;
- (void)removeClientDataUpdateBlockForToken:(id)a3;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)removeEndpointQueryCompletionBlockForToken:(id)a3;
- (void)removePurgeClientDataBlockForToken:(id)a3;
- (void)setManagerOLD:(id)a3;
- (void)setManagerSD:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setReportedExcessiveQueryCacheEntries:(id)a3;
- (void)updateCachedVerifierResultsWithResults:(id)a3;
@end

@implementation IDSPeerIDManager

+ (IDSPeerIDManager)sharedInstance
{
  if (qword_1009C0B48 != -1) {
    dispatch_once(&qword_1009C0B48, &stru_1009011B8);
  }
  return (IDSPeerIDManager *)(id)qword_1009C0B50;
}

- (IDSPeerIDManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushHandler sharedInstanceWithPortName:]( &OBJC_CLASS___IDSPushHandler,  "sharedInstanceWithPortName:",  @"com.apple.identityservicesd.aps"));
  v4 = -[IDSPeerIDQueryDataSource initWithPeerIDManager:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryDataSource),  "initWithPeerIDManager:",  self);
  v5 = -[IDSPeerIDQueryHandler initWithDelegate:dataSource:]( objc_alloc(&OBJC_CLASS___IDSPeerIDQueryHandler),  "initWithDelegate:dataSource:",  self,  v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSKeyTransparencyVerifier sharedInstance]( &OBJC_CLASS___IDSKeyTransparencyVerifier,  "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    v8 = -[IDSPeerIDManager_SwiftData initWithPushHandler:queryHandler:keyTransparencyVerifier:userDefaults:]( objc_alloc(&OBJC_CLASS___IDSPeerIDManager_SwiftData),  "initWithPushHandler:queryHandler:keyTransparencyVerifier:userDefaults:",  v3,  v5,  v6,  v7);
    managerSD = self->_managerSD;
    self->_managerSD = (IDSPeerIDManagerProtocol *)v8;
  }

  else
  {
    v10 = -[IDSPeerIDManager_OLD initWithPushHandler:queryHandler:keyTransparencyVerifier:userDefaults:]( objc_alloc(&OBJC_CLASS___IDSPeerIDManager_OLD),  "initWithPushHandler:queryHandler:keyTransparencyVerifier:userDefaults:",  v3,  v5,  v6,  v7);
    managerSD = self->_managerOLD;
    self->_managerOLD = (IDSPeerIDManagerProtocol *)v10;
  }

  -[IDSPeerIDManager registerSysdiagnoseBlock](self, "registerSysdiagnoseBlock");
  return self;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void)registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10031AD9C;
  v6[3] = &unk_1008F97C8;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = im_primary_queue(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  IMLogRegisterStateToSysdiagnoseBlock(v6, @"IDS-PeerIDManager", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v231 = v10;
  v223 = v11;
  if (_os_feature_enabled_impl("IDS", "SwiftDataForQueryCache"))
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol finishedQueryWithInfo:forURIs:fromURI:service:]( self->_managerSD,  "finishedQueryWithInfo:forURIs:fromURI:service:",  v10,  v11,  v12,  v13));
  }

  else
  {
    v227 = self;
    v216 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    v225 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v235 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    p_managerOLD = &self->_managerOLD;
    v251 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol persistentMapForService:]( self->_managerOLD,  "persistentMapForService:",  v13));
    p_managerSD = &self->_managerSD;
    v214 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol persistenceManagerForService:]( self->_managerSD,  "persistenceManagerForService:",  v13));
    __int128 v333 = 0u;
    __int128 v332 = 0u;
    __int128 v331 = 0u;
    __int128 v330 = 0u;
    id obj = v11;
    id v226 = [obj countByEnumeratingWithState:&v330 objects:v352 count:16];
    if (v226)
    {
      uint64_t v224 = *(void *)v331;
      uint64_t v256 = IDSGameCenterContactsAssociationID;
      uint64_t v255 = IDSGameCenterContactsSharingState;
      uint64_t v254 = IDSGameCenterContactsLastUpdatedDate;
      uint64_t v261 = _IDSIdentityClientDataMessageProtectionIdentityKey;
      uint64_t v253 = IDSRegistrationPropertyShowPeerErrors;
      uint64_t v238 = _IDSIdentityClientDataGroupCryptoVersionNumberKey;
      uint64_t v237 = _IDSIdentityClientDataDevicePublicIdentityKey;
      uint64_t v243 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
      uint64_t v236 = _IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
      uint64_t v241 = _IDSIdentityClientDataMessageProtectionNGMWebPublicIdentityKey;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v331 != v224)
          {
            uint64_t v16 = v15;
            objc_enumerationMutation(obj);
            uint64_t v15 = v16;
          }

          uint64_t v228 = v15;
          v17 = *(void **)(*((void *)&v330 + 1) + 8 * v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 prefixedURI]);
          v232 = (void *)objc_claimAutoreleasedReturnValue([v231 objectForKey:v18]);

          v230 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"identities"]);
          id v264 = objc_alloc_init(&OBJC_CLASS___IDSEndpointURIProperties);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"sender-correlation-identifier"]);
          [v264 setSenderCorrelationIdentifier:v19];

          v20 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"short-handle"]);
          [v264 setShortHandle:v20];

          v229 = -[IDSPeerIDKey initWithService:fromURI:toURI:]( objc_alloc(&OBJC_CLASS___IDSPeerIDKey),  "initWithService:fromURI:toURI:",  v13,  v12,  v17);
          if (v232) {
            BOOL v21 = v231 != 0LL;
          }
          else {
            BOOL v21 = 0;
          }
          if (v13 != 0 && v21 && [v230 count])
          {
            v222 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol _peerIDKeysForService:andFromURI:]( *p_managerOLD,  "_peerIDKeysForService:andFromURI:",  v13,  v12));
            if ((unint64_t)[v222 count] >= 0x259)
            {
              __int128 v329 = 0u;
              __int128 v328 = 0u;
              __int128 v327 = 0u;
              __int128 v326 = 0u;
              id v22 = v222;
              id v23 = [v22 countByEnumeratingWithState:&v326 objects:v351 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v327;
                do
                {
                  for (i = 0LL; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v327 != v24) {
                      objc_enumerationMutation(v22);
                    }
                    [v251 removeObjectForKey:*(void *)(*((void *)&v326 + 1) + 8 * (void)i)];
                  }

                  id v23 = [v22 countByEnumeratingWithState:&v326 objects:v351 count:16];
                }

                while (v23);
              }
            }

            v240 = (void *)objc_claimAutoreleasedReturnValue([v232 _stringForKey:@"anonymized-sender-id"]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v232 _numberForKey:@"biz-trusted"]);
            unsigned __int8 v239 = [v26 BOOLValue];

            v217 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"kt-blob"]);
            v220 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"kt-status"]);
            v247 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"kt-account-key"]);
            v219 = (void *)objc_claimAutoreleasedReturnValue([v232 objectForKey:@"kt-opt-in"]);
            unsigned int v27 = [v219 BOOLValue];
            if (v220)
            {
              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413314;
                uint64_t v342 = (uint64_t)v13;
                __int16 v343 = 2112;
                id v344 = v17;
                __int16 v345 = 2112;
                id v346 = v247;
                __int16 v347 = 2112;
                v348 = v220;
                __int16 v349 = 2112;
                v350 = v217;
                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Found KT status in query result { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }",  buf,  0x34u);
              }
            }

            if (v17)
            {
              if (!v247)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue([v17 prefixedURI]);
                v30 = (void *)objc_claimAutoreleasedReturnValue([v29 _md5Hash]);
                v247 = (void *)objc_claimAutoreleasedReturnValue([v30 dataUsingEncoding:4]);

                v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v342 = (uint64_t)v247;
                  _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Per-URI KT account identifier is missing from the IDS response, which may cause KT verification fail ures -- using URI hash instead { KTAccountKey: %@ }",  buf,  0xCu);
                }
              }

              v218 = -[IDSKeyTransparencyIndex initWithServiceIdentifier:accountKey:URI:]( objc_alloc(&OBJC_CLASS___IDSKeyTransparencyIndex),  "initWithServiceIdentifier:accountKey:URI:",  v13,  v247,  v17);
            }

            else
            {
              v218 = 0LL;
            }

            v245 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            v252 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            __int128 v325 = 0u;
            __int128 v324 = 0u;
            __int128 v323 = 0u;
            __int128 v322 = 0u;
            id v244 = v230;
            id v259 = [v244 countByEnumeratingWithState:&v322 objects:v340 count:16];
            uint64_t v215 = v27;
            if (v259)
            {
              char v271 = 0;
              uint64_t v257 = *(void *)v323;
              v32 = @"NO";
              if (v27) {
                v32 = @"YES";
              }
              v246 = v32;
              do
              {
                uint64_t v33 = 0LL;
                do
                {
                  if (*(void *)v323 != v257)
                  {
                    uint64_t v34 = v33;
                    objc_enumerationMutation(v244);
                    uint64_t v33 = v34;
                  }

                  uint64_t v265 = v33;
                  v35 = *(void **)(*((void *)&v322 + 1) + 8 * v33);
                  id v287 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_dataForKey:", @"push-token", v207, v210, v211, v212));
                  v278 = (void *)objc_claimAutoreleasedReturnValue([v35 _dataForKey:@"session-token"]);
                  uint64_t v36 = OSLogHandleForIDSCategory("PeerLookup");
                  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Found identity:", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v38)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    _IDSLogV(0LL, @"IDSFoundation", @"PeerLookup", @"Found identity:");
                  }

                  v289 = (void *)objc_claimAutoreleasedReturnValue([v35 _dictionaryForKey:@"client-data"]);
                  v285 = (void *)objc_claimAutoreleasedReturnValue([v35 _stringForKey:@"device-name"]);
                  v279 = (void *)objc_claimAutoreleasedReturnValue([v35 _dictionaryForKey:@"private-device-data"]);
                  id v273 = 0LL;
                  if (v285 && v279) {
                    id v273 = [[IDSFamilyEndpointData alloc] initWithDeviceName:v285 privateDeviceData:v279];
                  }
                  v281 = (void *)objc_claimAutoreleasedReturnValue([v35 _dataForKey:@"kt-loggable-data"]);
                  v276 = (void *)objc_claimAutoreleasedReturnValue([v289 _dataForKey:@"device-key-signature"]);
                  v39 = (void *)objc_claimAutoreleasedReturnValue([v35 _numberForKey:@"kt-mismatch-account-flag"]);
                  unsigned int v266 = [v39 BOOLValue];

                  v40 = (void *)objc_claimAutoreleasedReturnValue([v35 _numberForKey:@"ktbility"]);
                  unsigned int v270 = [v40 BOOLValue];

                  v283 = (void *)objc_claimAutoreleasedReturnValue([v289 _stringForKey:v256]);
                  v280 = (void *)objc_claimAutoreleasedReturnValue([v289 _numberForKey:v255]);
                  v41 = (void *)objc_claimAutoreleasedReturnValue([v289 _numberForKey:v254]);
                  v277 = v41;
                  if (v41)
                  {
                    [v41 doubleValue];
                    id v275 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
                  }

                  else
                  {
                    id v275 = 0LL;
                  }

                  uint64_t v42 = OSLogHandleForIDSCategory("PeerLookup");
                  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v342 = (uint64_t)v283;
                    __int16 v343 = 2112;
                    id v344 = v280;
                    __int16 v345 = 2112;
                    id v346 = v275;
                    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@",  buf,  0x20u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v44)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    id v210 = v280;
                    id v211 = v275;
                    v208 = v283;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@");
                  }

                  if (v283 || v280 || v277) {
                    v267 = -[IDSGameCenterData initWithAssociationID:sharingState:lastUpdatedDate:]( objc_alloc(&OBJC_CLASS___IDSGameCenterData),  "initWithAssociationID:sharingState:lastUpdatedDate:",  v283,  v280,  v275);
                  }
                  else {
                    v267 = 0LL;
                  }
                  if (v287)
                  {
                    v45 = -[IDSKeyTransparencyEntry initWithPushToken:loggableData:signedData:]( objc_alloc(&OBJC_CLASS___IDSKeyTransparencyEntry),  "initWithPushToken:loggableData:signedData:",  v287,  v281,  v276);
                    -[IDSKeyTransparencyEntry setKtCapable:](v45, "setKtCapable:", v270);
                    -[NSMutableArray addObject:](v245, "addObject:", v45);
                  }

                  v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v289, "_dataForKey:", v261, v208));
                  v46 = (void *)objc_claimAutoreleasedReturnValue([v289 _numberForKey:v253]);
                  unsigned int v47 = [v46 intValue];

                  uint64_t v48 = OSLogHandleForIDSCategory("PeerLookup");
                  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v50 = IDSLoggableDescriptionForTokenOnService(v287, v13);
                    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 debugDescription]);
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v52;
                    _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "              device pushToken: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v53)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    uint64_t v54 = IDSLoggableDescriptionForTokenOnService(v287, v13);
                    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
                    v207 = (void *)objc_claimAutoreleasedReturnValue([v55 debugDescription]);
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"              device pushToken: %@");
                  }

                  uint64_t v56 = OSLogHandleForIDSCategory("PeerLookup");
                  v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                  {
                    id v58 = (id)objc_claimAutoreleasedReturnValue([v278 debugDescription]);
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v58;
                    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "                 session token: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v59)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue([v278 debugDescription]);
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                 session token: %@");
                  }

                  uint64_t v60 = OSLogHandleForIDSCategory("PeerLookup");
                  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v17;
                    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "                           uri: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v62)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = v17;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                           uri: %@");
                  }

                  uint64_t v63 = OSLogHandleForIDSCategory("PeerLookup");
                  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    v65 = (void *)objc_claimAutoreleasedReturnValue([v264 senderCorrelationIdentifier]);
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v65;
                    _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  " sender-correlation-identifier: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v66)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue([v264 senderCorrelationIdentifier]);
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @" sender-correlation-identifier: %@");
                  }

                  uint64_t v67 = OSLogHandleForIDSCategory("PeerLookup");
                  v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    v69 = (void *)objc_claimAutoreleasedReturnValue([v264 shortHandle]);
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v69;
                    _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "                  short-handle: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v70)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue([v264 shortHandle]);
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                  short-handle: %@");
                  }

                  uint64_t v71 = OSLogHandleForIDSCategory("PeerLookup");
                  v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    id v73 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v289,  1LL));
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v73;
                    _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "                    clientData: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v74)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v289,  1LL));
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                    clientData: %@");
                  }

                  uint64_t v75 = OSLogHandleForIDSCategory("PeerLookup");
                  v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v285;
                    _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "                   device-name: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v77)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = v285;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                   device-name: %@");
                  }

                  uint64_t v78 = OSLogHandleForIDSCategory("PeerLookup");
                  v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                  {
                    id v80 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v279,  1LL));
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v80;
                    _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "           private-device-data: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v81)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForDictionary:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForDictionary:options:",  v279,  1LL));
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"           private-device-data: %@");
                  }

                  uint64_t v82 = OSLogHandleForIDSCategory("PeerLookup");
                  v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    id v84 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v281,  1LL));
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v84;
                    _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "              kt-loggable-data: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v85)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v281,  1LL));
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"              kt-loggable-data: %@");
                  }

                  uint64_t v86 = OSLogHandleForIDSCategory("PeerLookup");
                  v87 = (os_log_s *)objc_claimAutoreleasedReturnValue(v86);
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    id v88 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v247,  1LL));
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v88;
                    _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEFAULT,  "                kt-account-key: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v89)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v247,  1LL));
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                kt-account-key: %@");
                  }

                  uint64_t v90 = OSLogHandleForIDSCategory("PeerLookup");
                  v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v246;
                    _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "                     kt-opt-in: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v92)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)v246;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                     kt-opt-in: %@");
                  }

                  uint64_t v93 = OSLogHandleForIDSCategory("PeerLookup");
                  v94 = (os_log_s *)objc_claimAutoreleasedReturnValue(v93);
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                  {
                    id v95 = (id)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v276,  1LL));
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v95;
                    _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "          device-key-signature: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v96)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = (void *)objc_claimAutoreleasedReturnValue( +[IDSLogFormatter descriptionForData:options:]( &OBJC_CLASS___IDSLogFormatter,  "descriptionForData:options:",  v276,  1LL));
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"          device-key-signature: %@");
                  }

                  uint64_t v97 = OSLogHandleForIDSCategory("PeerLookup");
                  v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                  {
                    v99 = @"NO";
                    if (v266) {
                      v99 = @"YES";
                    }
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v99;
                    _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "      kt-mismatch-account-flag: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v100)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v101 = @"NO";
                    if (v266) {
                      v101 = @"YES";
                    }
                    v207 = (void *)v101;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"      kt-mismatch-account-flag: %@");
                  }

                  uint64_t v102 = OSLogHandleForIDSCategory("PeerLookup");
                  v103 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                  {
                    v104 = @"NO";
                    if (v270) {
                      v104 = @"YES";
                    }
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v104;
                    _os_log_impl( (void *)&_mh_execute_header,  v103,  OS_LOG_TYPE_DEFAULT,  "               kt-capable-flag: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v105)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v106 = @"NO";
                    if (v270) {
                      v106 = @"YES";
                    }
                    v207 = (void *)v106;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"               kt-capable-flag: %@");
                  }

                  uint64_t v107 = OSLogHandleForIDSCategory("PeerLookup");
                  v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
                  {
                    v109 = @"NO";
                    if (v47) {
                      v109 = @"YES";
                    }
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v109;
                    _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "                    showErrors: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v110)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v111 = @"NO";
                    if (v47) {
                      v111 = @"YES";
                    }
                    v207 = (void *)v111;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                    showErrors: %@");
                  }

                  if (v274) {
                    goto LABEL_164;
                  }
                  uint64_t v112 = OSLogHandleForIDSCategory("PeerLookup");
                  v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v342 = (uint64_t)v287;
                    _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_DEFAULT,  "   No known public key found for token: %@",  buf,  0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled(v114)
                    && _IDSShouldLog(0LL, @"PeerLookup"))
                  {
                    v207 = v287;
                    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"   No known public key found for token: %@");
                  }

                  if (!objc_msgSend(v13, "isEqualToIgnoringCase:", @"com.apple.madrid", v207))
                  {
LABEL_164:
                    if (v287)
                    {
                      uint64_t v118 = IMGetDomainIntForKey(@"com.apple.ids", @"IDSIDRefreshExpiry");
                      uint64_t v119 = IMGetDomainIntForKey(@"com.apple.ids", @"IDSIDHardExpiry");
                      v268 = (void *)objc_claimAutoreleasedReturnValue([v35 _numberForKey:@"session-token-refresh-seconds"]);
                      v269 = (void *)objc_claimAutoreleasedReturnValue([v35 _numberForKey:@"session-token-expires-seconds"]);
                      if (v118)
                      {
                        uint64_t v120 = OSLogHandleForIDSCategory("PeerLookup");
                        v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);
                        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134217984;
                          uint64_t v342 = v118;
                          _os_log_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEFAULT,  "                    Overwriting soft TTL with: %ld seconds",  buf,  0xCu);
                        }

                        if (os_log_shim_legacy_logging_enabled(v122)
                          && _IDSShouldLog(0LL, @"PeerLookup"))
                        {
                          v207 = (void *)v118;
                          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                    Overwriting soft TTL with: %ld seconds");
                        }

                        uint64_t v123 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v118,  v207));

                        v268 = (void *)v123;
                      }

                      if (v119)
                      {
                        uint64_t v124 = OSLogHandleForIDSCategory("PeerLookup");
                        v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
                        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134217984;
                          uint64_t v342 = v119;
                          _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "                    Overwriting hard TTL with: %ld seconds",  buf,  0xCu);
                        }

                        if (os_log_shim_legacy_logging_enabled(v126)
                          && _IDSShouldLog(0LL, @"PeerLookup"))
                        {
                          v207 = (void *)v119;
                          _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"                    Overwriting hard TTL with: %ld seconds");
                        }

                        uint64_t v127 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  v119,  v207));

                        v269 = (void *)v127;
                      }

                      objc_msgSend(v268, "doubleValue", v207);
                      v263 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                      [v269 doubleValue];
                      v262 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                      uint64_t v128 = OSLogHandleForIDSCategory("PeerLookup");
                      v129 = (os_log_s *)objc_claimAutoreleasedReturnValue(v128);
                      if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138413058;
                        uint64_t v342 = (uint64_t)v13;
                        __int16 v343 = 2112;
                        id v344 = v17;
                        __int16 v345 = 2112;
                        id v346 = v263;
                        __int16 v347 = 2112;
                        v348 = v262;
                        _os_log_impl( (void *)&_mh_execute_header,  v129,  OS_LOG_TYPE_DEFAULT,  "   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,",  buf,  0x2Au);
                      }

                      if (os_log_shim_legacy_logging_enabled(v130)
                        && _IDSShouldLog(0LL, @"PeerLookup"))
                      {
                        id v211 = v263;
                        v212 = v262;
                        v207 = v13;
                        id v210 = v17;
                        _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,");
                      }

                      if (v278 && v269 && v268)
                      {
                        if ([v12 isEqualToURI:v17])
                        {
                          -[IDSPeerIDManagerProtocol _setDisasterModeToken:forURI:]( *p_managerOLD,  "_setDisasterModeToken:forURI:",  v278,  v12);
                          -[IDSPeerIDManagerProtocol _setDisasterModeToken:forURI:]( *p_managerSD,  "_setDisasterModeToken:forURI:",  v278,  v12);
                        }

                        v131 = (void *)objc_claimAutoreleasedReturnValue( +[IDSEndpointCapabilities allowedCapabilities]( &OBJC_CLASS___IDSEndpointCapabilities,  "allowedCapabilities",  v207));
                        v339[0] = v261;
                        v339[1] = v238;
                        v339[2] = v237;
                        v339[3] = v243;
                        v339[4] = v236;
                        v339[5] = v241;
                        v132 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v339,  6LL));
                        v133 = (void *)objc_claimAutoreleasedReturnValue([v131 arrayByAddingObjectsFromArray:v132]);

                        v134 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v133 count]);
                        __int128 v321 = 0u;
                        __int128 v320 = 0u;
                        __int128 v319 = 0u;
                        __int128 v318 = 0u;
                        id v135 = v133;
                        id v136 = [v135 countByEnumeratingWithState:&v318 objects:v338 count:16];
                        if (v136)
                        {
                          uint64_t v137 = *(void *)v319;
                          do
                          {
                            for (j = 0LL; j != v136; j = (char *)j + 1)
                            {
                              if (*(void *)v319 != v137) {
                                objc_enumerationMutation(v135);
                              }
                              uint64_t v139 = *(void *)(*((void *)&v318 + 1) + 8LL * (void)j);
                              v140 = (void *)objc_claimAutoreleasedReturnValue([v289 objectForKey:v139]);
                              if (v140) {
                                -[NSMutableDictionary setObject:forKey:](v134, "setObject:forKey:", v140, v139);
                              }
                            }

                            id v136 = [v135 countByEnumeratingWithState:&v318 objects:v338 count:16];
                          }

                          while (v136);
                        }

                        v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                        [v141 timeIntervalSince1970];
                        double v143 = v142;

                        v250 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v134, "_dataForKey:", v261));
                        v249 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v134, "_dataForKey:", v243));
                        v144 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDServiceController sharedInstance]( &OBJC_CLASS___IDSDServiceController,  "sharedInstance"));
                        v272 = (void *)objc_claimAutoreleasedReturnValue([v144 serviceWithIdentifier:v13]);

                        if (!v281) {
                          v281 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary _dataForKey:](v134, "_dataForKey:", v241));
                        }
                        v258 = -[IDSProtoKeyTransparencyLoggableData initWithData:]( objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData),  "initWithData:",  v281);
                        v248 = (void *)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData ngmPublicIdentity]( v258,  "ngmPublicIdentity"));
                        context = objc_autoreleasePoolPush();
                        if ([v272 applicationKeyIndex]
                          && -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitysCount]( v258,  "applicationPublicIdentitysCount"))
                        {
                          __int128 v317 = 0u;
                          __int128 v316 = 0u;
                          __int128 v315 = 0u;
                          __int128 v314 = 0u;
                          id v260 = (id)objc_claimAutoreleasedReturnValue( -[IDSProtoKeyTransparencyLoggableData applicationPublicIdentitys]( v258,  "applicationPublicIdentitys"));
                          id v145 = [v260 countByEnumeratingWithState:&v314 objects:v337 count:16];
                          if (v145)
                          {
                            uint64_t v146 = *(void *)v315;
                            while (2)
                            {
                              for (k = 0LL; k != v145; k = (char *)k + 1)
                              {
                                if (*(void *)v315 != v146) {
                                  objc_enumerationMutation(v260);
                                }
                                v148 = *(void **)(*((void *)&v314 + 1) + 8LL * (void)k);
                                unsigned int v149 = [v148 keyIndex];
                                if (v149 == sub_1002E08A0((int)[v272 applicationKeyIndex]))
                                {
                                  id v145 = (id)objc_claimAutoreleasedReturnValue([v148 publicIdentity]);
                                  goto LABEL_218;
                                }
                              }

                              id v145 = [v260 countByEnumeratingWithState:&v314 objects:v337 count:16];
                              if (v145) {
                                continue;
                              }
                              break;
                            }
                          }

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  managerOLD = self->_managerOLD;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:]( managerOLD,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:",  v18,  v17,  v16,  v15,  v9,  v8));
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:]( self->_managerSD,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:",  v18,  v17,  v16,  v15,  v9,  v8));

  else {
    BOOL v21 = v19;
  }
  id v22 = v21;

  return v22;
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  managerOLD = self->_managerOLD;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v25) = a9;
  v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:]( managerOLD,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:",  v19,  v18,  v17,  v16,  v10,  v9,  v25));
  LOBYTE(v26) = a9;
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:]( self->_managerSD,  "sessionTokensForURIs:fromURI:service:fromIdentity:includeSelfDevice:fullyRemoveSelfDevice:allowRefresh:",  v19,  v18,  v17,  v16,  v10,  v9,  v26));

  else {
    id v22 = v20;
  }
  id v23 = v22;

  return v23;
}

- (id)sessionTokenForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6 expirationDate:(id *)a7 refreshDate:(id *)a8 fromIdentity:(id)a9 includeSelfDevice:(BOOL)a10
{
  managerOLD = self->_managerOLD;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v27) = a10;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol sessionTokenForURI:pushToken:fromURI:service:expirationDate:refreshDate:fromIdentity:includeSelfDevice:]( managerOLD,  "sessionTokenForURI:pushToken:fromURI:service:expirationDate:refreshDate:fromIdentity:includeSelfDevice:",  v21,  v20,  v19,  v18,  a7,  a8,  v17,  v27));
  LOBYTE(v28) = a10;
  id v23 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol sessionTokenForURI:pushToken:fromURI:service:expirationDate:refreshDate:fromIdentity:includeSelfDevice:]( self->_managerSD,  "sessionTokenForURI:pushToken:fromURI:service:expirationDate:refreshDate:fromIdentity:includeSelfDevice:",  v21,  v20,  v19,  v18,  a7,  a8,  v17,  v28));

  else {
    uint64_t v24 = v22;
  }
  id v25 = v24;

  return v25;
}

- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v40 = a6;
  v41 = v14;
  uint64_t v38 = v15;
  v39 = v16;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]( self->_managerOLD,  "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:",  v14,  v15,  v16));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]( self->_managerSD,  "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:",  v14,  v38,  v16,  v40,  a7,  v8));
  if (+[IMUserDefaults abcOnQueryCacheDifference](&OBJC_CLASS___IMUserDefaults, "abcOnQueryCacheDifference"))
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v19 = v41;
    id v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v43 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v23]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v23]);
          if ((objc_msgSend((id)objc_opt_class(self, v26), "compareEndpoints:with:", v24, v25) & 1) == 0)
          {
            uint64_t v27 = OSLogHandleForIDSCategory("Sysdiagnose-Oversized");
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              unsigned int v47 = v24;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "endpoints: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v29)
              && _IDSShouldLog(0LL, @"Sysdiagnose-Oversized"))
            {
              v37 = v24;
              _IDSLogV(0LL, @"IDSFoundation", @"Sysdiagnose-Oversized", @"endpoints: %@");
            }

            uint64_t v30 = OSLogHandleForIDSCategory("Sysdiagnose-Oversized");
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              unsigned int v47 = v25;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "sdEndpoints: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v32)
              && _IDSShouldLog(0LL, @"Sysdiagnose-Oversized"))
            {
              v37 = v25;
              _IDSLogV(0LL, @"IDSFoundation", @"Sysdiagnose-Oversized", @"sdEndpoints: %@");
            }

            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[IDSPeerIDManager endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]",  v37));
            -[IDSPeerIDManager _triggerAutoBugCaptureWithContext:](self, "_triggerAutoBugCaptureWithContext:", v33);
          }
        }

        id v20 = [v19 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v20);
    }
  }

  else {
    uint64_t v34 = v17;
  }
  id v35 = v34;

  return v35;
}

- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol publicKeyForURI:pushToken:fromURI:service:]( managerOLD,  "publicKeyForURI:pushToken:fromURI:service:",  v14,  v13,  v12,  v11));

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol publicKeyForURI:pushToken:fromURI:service:]( self->_managerSD,  "publicKeyForURI:pushToken:fromURI:service:",  v14,  v13,  v12,  v11));
  else {
    id v17 = v15;
  }
  return v17 != 0LL;
}

- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol publicKeyForURI:pushToken:fromURI:service:]( managerOLD,  "publicKeyForURI:pushToken:fromURI:service:",  v14,  v13,  v12,  v11));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol publicKeyForURI:pushToken:fromURI:service:]( self->_managerSD,  "publicKeyForURI:pushToken:fromURI:service:",  v14,  v13,  v12,  v11));

  else {
    id v17 = v15;
  }
  id v18 = v17;

  return v18;
}

- (id)publicDeviceIdentityContainerForPushToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol publicDeviceIdentityContainerForPushToken:]( managerOLD,  "publicDeviceIdentityContainerForPushToken:",  v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol publicDeviceIdentityContainerForPushToken:]( self->_managerSD,  "publicDeviceIdentityContainerForPushToken:",  v5));

  else {
    BOOL v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol senderCorrelationIdentifierForURI:fromURI:service:]( managerOLD,  "senderCorrelationIdentifierForURI:fromURI:service:",  v11,  v10,  v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol senderCorrelationIdentifierForURI:fromURI:service:]( self->_managerSD,  "senderCorrelationIdentifierForURI:fromURI:service:",  v11,  v10,  v9));

  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol senderCorrelationIdentifierForURI:pushToken:fromURI:service:]( managerOLD,  "senderCorrelationIdentifierForURI:pushToken:fromURI:service:",  v14,  v13,  v12,  v11));
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol senderCorrelationIdentifierForURI:pushToken:fromURI:service:]( self->_managerSD,  "senderCorrelationIdentifierForURI:pushToken:fromURI:service:",  v14,  v13,  v12,  v11));

  else {
    id v17 = v15;
  }
  id v18 = v17;

  return v18;
}

- (id)shortHandleForURI:(id)a3 fromURI:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol shortHandleForURI:fromURI:]( managerOLD,  "shortHandleForURI:fromURI:",  v8,  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol shortHandleForURI:fromURI:]( self->_managerSD,  "shortHandleForURI:fromURI:",  v8,  v7));

  else {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  managerOLD = self->_managerOLD;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  -[IDSPeerIDManagerProtocol timeToCacheURI:fromURI:service:forStatus:]( managerOLD,  "timeToCacheURI:fromURI:service:forStatus:",  v13,  v12,  v11,  v6);
  double v15 = v14;
  -[IDSPeerIDManagerProtocol timeToCacheURI:fromURI:service:forStatus:]( self->_managerSD,  "timeToCacheURI:fromURI:service:forStatus:",  v13,  v12,  v11,  v6);
  double v17 = v16;

  else {
    return v15;
  }
}

- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7
{
  managerOLD = self->_managerOLD;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  unsigned __int8 v18 = -[IDSPeerIDManagerProtocol hasProperty:forURI:pushToken:fromURI:service:]( managerOLD,  "hasProperty:forURI:pushToken:fromURI:service:",  v17,  v16,  v15,  v14,  v13);
  unsigned __int8 v19 = -[IDSPeerIDManagerProtocol hasProperty:forURI:pushToken:fromURI:service:]( self->_managerSD,  "hasProperty:forURI:pushToken:fromURI:service:",  v17,  v16,  v15,  v14,  v13);

  else {
    return v18;
  }
}

- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  unsigned __int8 v15 = -[IDSPeerIDManagerProtocol shouldShowPeerErrorsFor:pushToken:fromURI:service:]( managerOLD,  "shouldShowPeerErrorsFor:pushToken:fromURI:service:",  v14,  v13,  v12,  v11);
  unsigned __int8 v16 = -[IDSPeerIDManagerProtocol shouldShowPeerErrorsFor:pushToken:fromURI:service:]( self->_managerSD,  "shouldShowPeerErrorsFor:pushToken:fromURI:service:",  v14,  v13,  v12,  v11);

  else {
    return v15;
  }
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:service:fromURI:]( managerOLD,  "endpointsForURIs:service:fromURI:",  v11,  v10,  v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:service:fromURI:]( self->_managerSD,  "endpointsForURIs:service:fromURI:",  v11,  v10,  v9));

  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointForPushToken:URI:service:fromURI:]( self->_managerOLD,  "endpointForPushToken:URI:service:fromURI:",  v10,  v11,  v12,  v13));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointForPushToken:URI:service:fromURI:]( self->_managerSD,  "endpointForPushToken:URI:service:fromURI:",  v10,  v11,  v12,  v13));
  if (+[IMUserDefaults abcOnQueryCacheDifference](&OBJC_CLASS___IMUserDefaults, "abcOnQueryCacheDifference")
    && ([v15 isEqualToEndpoint:v14 withDateTolerance:10.0] & 1) == 0)
  {
    uint64_t v16 = OSLogHandleForIDSCategory("Sysdiagnose-Oversized");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "endpoint: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v18)
      && _IDSShouldLog(0LL, @"Sysdiagnose-Oversized"))
    {
      uint64_t v26 = v14;
      _IDSLogV(0LL, @"IDSFoundation", @"Sysdiagnose-Oversized", @"endpoint: %@");
    }

    uint64_t v19 = OSLogHandleForIDSCategory("Sysdiagnose-Oversized");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sdEndpoint: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v21)
      && _IDSShouldLog(0LL, @"Sysdiagnose-Oversized"))
    {
      uint64_t v26 = v15;
      _IDSLogV(0LL, @"IDSFoundation", @"Sysdiagnose-Oversized", @"sdEndpoint: %@");
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[IDSPeerIDManager endpointForPushToken:URI:service:fromURI:]",  v26));
    -[IDSPeerIDManager _triggerAutoBugCaptureWithContext:](self, "_triggerAutoBugCaptureWithContext:", v22);
  }

  else {
    uint64_t v23 = v14;
  }
  id v24 = v23;

  return v24;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6
{
  BOOL v6 = a6;
  managerOLD = self->_managerOLD;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:service:fromURI:ignoringTTL:]( managerOLD,  "endpointsForURIs:service:fromURI:ignoringTTL:",  v13,  v12,  v11,  v6));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:service:fromURI:ignoringTTL:]( self->_managerSD,  "endpointsForURIs:service:fromURI:ignoringTTL:",  v13,  v12,  v11,  v6));

  else {
    uint64_t v16 = v14;
  }
  id v17 = v16;

  return v17;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:service:fromURI:withCapabilities:]( managerOLD,  "endpointsForURIs:service:fromURI:withCapabilities:",  v14,  v13,  v12,  v11));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol endpointsForURIs:service:fromURI:withCapabilities:]( self->_managerSD,  "endpointsForURIs:service:fromURI:withCapabilities:",  v14,  v13,  v12,  v11));

  else {
    id v17 = v15;
  }
  id v18 = v17;

  return v18;
}

- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v42 = a8;
  __int128 v43 = v14;
  v39 = v15;
  id v40 = v16;
  v41 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:]( self->_managerOLD,  "idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:",  v14,  v15,  v16,  a6,  v17));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:]( self->_managerSD,  "idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:",  v43,  v15,  v16,  a6,  v17,  v42));
  if (+[IMUserDefaults abcOnQueryCacheDifference](&OBJC_CLASS___IMUserDefaults, "abcOnQueryCacheDifference"))
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v20 = v43;
    id v21 = [v20 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v24]);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v24]);
          if ((objc_msgSend((id)objc_opt_class(self, v27), "compareInfoResult:with:", v26, v25) & 1) == 0)
          {
            uint64_t v28 = OSLogHandleForIDSCategory("Sysdiagnose-Oversized");
            uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v25;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "infoResult: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v30)
              && _IDSShouldLog(0LL, @"Sysdiagnose-Oversized"))
            {
              uint64_t v38 = v25;
              _IDSLogV(0LL, @"IDSFoundation", @"Sysdiagnose-Oversized", @"infoResult: %@");
            }

            uint64_t v31 = OSLogHandleForIDSCategory("Sysdiagnose-Oversized");
            uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v26;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "sdInfoResult: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled(v33)
              && _IDSShouldLog(0LL, @"Sysdiagnose-Oversized"))
            {
              uint64_t v38 = v26;
              _IDSLogV(0LL, @"IDSFoundation", @"Sysdiagnose-Oversized", @"sdInfoResult: %@");
            }

            uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[IDSPeerIDManager idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:]",  v38));
            -[IDSPeerIDManager _triggerAutoBugCaptureWithContext:](self, "_triggerAutoBugCaptureWithContext:", v34);
          }
        }

        id v21 = [v20 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }

      while (v21);
    }
  }

  else {
    id v35 = v18;
  }
  id v36 = v35;

  return v36;
}

- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol verifierResultsForURIs:service:fromURI:]( managerOLD,  "verifierResultsForURIs:service:fromURI:",  v11,  v10,  v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol verifierResultsForURIs:service:fromURI:]( self->_managerSD,  "verifierResultsForURIs:service:fromURI:",  v11,  v10,  v9));

  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (void)updateCachedVerifierResultsWithResults:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  -[IDSPeerIDManagerProtocol updateCachedVerifierResultsWithResults:]( managerOLD,  "updateCachedVerifierResultsWithResults:",  v5);
  -[IDSPeerIDManagerProtocol updateCachedVerifierResultsWithResults:]( self->_managerSD,  "updateCachedVerifierResultsWithResults:",  v5);
}

- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol keyTransparencyContextForService:fromURI:toURI:]( managerOLD,  "keyTransparencyContextForService:fromURI:toURI:",  v11,  v10,  v9));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol keyTransparencyContextForService:fromURI:toURI:]( self->_managerSD,  "keyTransparencyContextForService:fromURI:toURI:",  v11,  v10,  v9));

  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11
{
  BOOL v32 = a7;
  BOOL v33 = a8;
  id v15 = (Block_layout *)a11;
  id v16 = a10;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  else {
    id v21 = v15;
  }
  uint64_t v22 = objc_retainBlock(v21);
  else {
    uint64_t v23 = &stru_100901238;
  }
  uint64_t v24 = objc_retainBlock(v23);

  int v25 = _os_feature_enabled_impl("IDS", "SwiftDataForQueryCache");
  uint64_t v26 = 2LL;
  if (v25)
  {
    uint64_t v26 = 3LL;
    uint64_t v27 = v24;
  }

  else
  {
    uint64_t v27 = v22;
  }

  LOBYTE(v30) = a9;
  unsigned __int8 v28 = -[objc_class startQueryForURIs:fromIdentity:fromURI:fromService:forSending:forRefresh:isForced:reason:completionBlock:]( (&self->super.isa)[v26],  "startQueryForURIs:fromIdentity:fromURI:fromService:forSending:forRefresh:isForced:reason:completionBlock:",  v20,  v19,  v18,  v17,  v32,  v33,  v30,  v16,  v27);

  return v28;
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9
{
  id v15 = (Block_layout *)a9;
  id v30 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  else {
    id v21 = v15;
  }
  uint64_t v22 = objc_retainBlock(v21);
  else {
    uint64_t v23 = &stru_100901278;
  }
  uint64_t v24 = objc_retainBlock(v23);

  int v25 = _os_feature_enabled_impl("IDS", "SwiftDataForQueryCache");
  uint64_t v26 = 2LL;
  if (v25)
  {
    uint64_t v26 = 3LL;
    uint64_t v27 = v24;
  }

  else
  {
    uint64_t v27 = v22;
  }

  unsigned __int8 v28 = -[objc_class startQueryForURIs:fromIdentity:fromURI:fromService:context:reason:completionBlock:]( (&self->super.isa)[v26],  "startQueryForURIs:fromIdentity:fromURI:fromService:context:reason:completionBlock:",  v20,  v19,  v18,  v17,  v16,  v30,  v27);

  return v28;
}

- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  -[IDSPeerIDManagerProtocol notePeerToken:forURI:fromURI:service:]( managerOLD,  "notePeerToken:forURI:fromURI:service:",  v14,  v13,  v12,  v11);
  -[IDSPeerIDManagerProtocol notePeerToken:forURI:fromURI:service:]( self->_managerSD,  "notePeerToken:forURI:fromURI:service:",  v14,  v13,  v12,  v11);
}

- (void)clearCacheAndPersistImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  -[IDSPeerIDManagerProtocol clearCacheAndPersistImmediately:](self->_managerOLD, "clearCacheAndPersistImmediately:");
  -[IDSPeerIDManagerProtocol clearCacheAndPersistImmediately:](self->_managerSD, "clearCacheAndPersistImmediately:", v3);
}

- (id)pleaseDontCopyCacheDictionaryRepresentation
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol pleaseDontCopyCacheDictionaryRepresentation]( self->_managerOLD,  "pleaseDontCopyCacheDictionaryRepresentation"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol pleaseDontCopyCacheDictionaryRepresentation]( self->_managerSD,  "pleaseDontCopyCacheDictionaryRepresentation"));
  else {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4
{
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  -[IDSPeerIDManagerProtocol forgetPeerTokensForURI:fromURI:service:]( managerOLD,  "forgetPeerTokensForURI:fromURI:service:",  v11,  v10,  v9);
  -[IDSPeerIDManagerProtocol forgetPeerTokensForURI:fromURI:service:]( self->_managerSD,  "forgetPeerTokensForURI:fromURI:service:",  v11,  v10,  v9);
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  -[IDSPeerIDManagerProtocol forgetPeerTokensForURI:fromURI:services:]( managerOLD,  "forgetPeerTokensForURI:fromURI:services:",  v11,  v10,  v9);
  -[IDSPeerIDManagerProtocol forgetPeerTokensForURI:fromURI:services:]( self->_managerSD,  "forgetPeerTokensForURI:fromURI:services:",  v11,  v10,  v9);
}

- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  -[IDSPeerIDManagerProtocol forgetPeerTokensForURI:service:](managerOLD, "forgetPeerTokensForURI:service:", v8, v7);
  -[IDSPeerIDManagerProtocol forgetPeerTokensForURI:service:]( self->_managerSD,  "forgetPeerTokensForURI:service:",  v8,  v7);
}

- (void)forgetPeerTokensForService:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  -[IDSPeerIDManagerProtocol forgetPeerTokensForService:](managerOLD, "forgetPeerTokensForService:", v5);
  -[IDSPeerIDManagerProtocol forgetPeerTokensForService:](self->_managerSD, "forgetPeerTokensForService:", v5);
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  unsigned __int8 v12 = -[IDSPeerIDManagerProtocol hasPeerTokensForURI:fromURI:service:]( managerOLD,  "hasPeerTokensForURI:fromURI:service:",  v11,  v10,  v9);
  unsigned __int8 v13 = -[IDSPeerIDManagerProtocol hasPeerTokensForURI:fromURI:service:]( self->_managerSD,  "hasPeerTokensForURI:fromURI:service:",  v11,  v10,  v9);

  else {
    return v12;
  }
}

- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    int v14 = 1;
    int v15 = 1;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        v14 &= -[IDSPeerIDManagerProtocol hasPeerTokensForURI:fromURI:service:]( self->_managerOLD,  "hasPeerTokensForURI:fromURI:service:",  v17,  v9,  v10);
        v15 &= -[IDSPeerIDManagerProtocol hasPeerTokensForURI:fromURI:service:]( self->_managerSD,  "hasPeerTokensForURI:fromURI:service:",  v17,  v9,  v10);
      }

      id v12 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  else
  {
    LOBYTE(v14) = 1;
    LOBYTE(v15) = 1;
  }

  else {
    BOOL v18 = v14;
  }

  return v18;
}

- (id)activeURIsFromURI:(id)a3 service:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol activeURIsFromURI:service:]( managerOLD,  "activeURIsFromURI:service:",  v8,  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol activeURIsFromURI:service:]( self->_managerSD,  "activeURIsFromURI:service:",  v8,  v7));

  else {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (id)uriForShortHandle:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManagerProtocol uriForShortHandle:](managerOLD, "uriForShortHandle:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPeerIDManagerProtocol uriForShortHandle:](self->_managerSD, "uriForShortHandle:", v5));

  else {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol urisMatchingPushToken:service:]( managerOLD,  "urisMatchingPushToken:service:",  v8,  v7));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSPeerIDManagerProtocol urisMatchingPushToken:service:]( self->_managerSD,  "urisMatchingPushToken:service:",  v8,  v7));

  else {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = (Block_layout *)a3;
  else {
    id v8 = v7;
  }
  id v11 = objc_retainBlock(v8);
  else {
    id v9 = &stru_1009012D8;
  }
  id v10 = objc_retainBlock(v9);

  -[IDSPeerIDManagerProtocol addCompletionBlock:forToken:](self->_managerOLD, "addCompletionBlock:forToken:", v11, v6);
  -[IDSPeerIDManagerProtocol addCompletionBlock:forToken:](self->_managerSD, "addCompletionBlock:forToken:", v10, v6);
}

- (void)removeCompletionBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  -[IDSPeerIDManagerProtocol removeCompletionBlockForToken:](managerOLD, "removeCompletionBlockForToken:", v5);
  -[IDSPeerIDManagerProtocol removeCompletionBlockForToken:](self->_managerSD, "removeCompletionBlockForToken:", v5);
}

- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = (Block_layout *)a3;
  else {
    id v8 = v7;
  }
  id v11 = objc_retainBlock(v8);
  else {
    id v9 = &stru_100901338;
  }
  id v10 = objc_retainBlock(v9);

  -[IDSPeerIDManagerProtocol addClientDataUpdateBlock:forToken:]( self->_managerOLD,  "addClientDataUpdateBlock:forToken:",  v11,  v6);
  -[IDSPeerIDManagerProtocol addClientDataUpdateBlock:forToken:]( self->_managerSD,  "addClientDataUpdateBlock:forToken:",  v10,  v6);
}

- (void)removeClientDataUpdateBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  -[IDSPeerIDManagerProtocol removeClientDataUpdateBlockForToken:]( managerOLD,  "removeClientDataUpdateBlockForToken:",  v5);
  -[IDSPeerIDManagerProtocol removeClientDataUpdateBlockForToken:]( self->_managerSD,  "removeClientDataUpdateBlockForToken:",  v5);
}

- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = (Block_layout *)a3;
  else {
    id v8 = v7;
  }
  id v11 = objc_retainBlock(v8);
  else {
    id v9 = &stru_100901398;
  }
  id v10 = objc_retainBlock(v9);

  -[IDSPeerIDManagerProtocol addPurgeClientDataBlock:forToken:]( self->_managerOLD,  "addPurgeClientDataBlock:forToken:",  v11,  v6);
  -[IDSPeerIDManagerProtocol addPurgeClientDataBlock:forToken:]( self->_managerSD,  "addPurgeClientDataBlock:forToken:",  v10,  v6);
}

- (void)removePurgeClientDataBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  -[IDSPeerIDManagerProtocol removePurgeClientDataBlockForToken:](managerOLD, "removePurgeClientDataBlockForToken:", v5);
  -[IDSPeerIDManagerProtocol removeClientDataUpdateBlockForToken:]( self->_managerSD,  "removeClientDataUpdateBlockForToken:",  v5);
}

- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (Block_layout *)a3;
  else {
    id v11 = v10;
  }
  int v14 = objc_retainBlock(v11);
  else {
    id v12 = &stru_1009013F8;
  }
  uint64_t v13 = objc_retainBlock(v12);

  -[IDSPeerIDManagerProtocol addEndpointQueryCompletionBlock:forToken:queue:]( self->_managerOLD,  "addEndpointQueryCompletionBlock:forToken:queue:",  v14,  v9,  v8);
  -[IDSPeerIDManagerProtocol addEndpointQueryCompletionBlock:forToken:queue:]( self->_managerSD,  "addEndpointQueryCompletionBlock:forToken:queue:",  v13,  v9,  v8);
}

- (void)removeEndpointQueryCompletionBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  -[IDSPeerIDManagerProtocol removeEndpointQueryCompletionBlockForToken:]( managerOLD,  "removeEndpointQueryCompletionBlockForToken:",  v5);
  -[IDSPeerIDManagerProtocol removeEndpointQueryCompletionBlockForToken:]( self->_managerSD,  "removeEndpointQueryCompletionBlockForToken:",  v5);
}

- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7
{
  id v12 = a7;
  uint64_t v13 = (Block_layout *)a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  else {
    uint64_t v17 = v13;
  }
  __int128 v20 = objc_retainBlock(v17);
  else {
    BOOL v18 = &stru_100901438;
  }
  id v19 = objc_retainBlock(v18);

  -[IDSPeerIDManagerProtocol endpointsForURIs:serviceIdentifier:localURI:completion:queue:]( self->_managerOLD,  "endpointsForURIs:serviceIdentifier:localURI:completion:queue:",  v16,  v15,  v14,  v20,  v12);
  -[IDSPeerIDManagerProtocol endpointsForURIs:serviceIdentifier:localURI:completion:queue:]( self->_managerSD,  "endpointsForURIs:serviceIdentifier:localURI:completion:queue:",  v16,  v15,  v14,  v19,  v12);
}

+ (BOOL)compareEndpoints:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count] || v6 && objc_msgSend(v6, "count"))
  {
    id v7 = [v5 count];
    if (v7 == [v6 count])
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id obj = v5;
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v26;
        while (1)
        {
          uint64_t v11 = 0LL;
LABEL_9:
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          id v13 = v6;
          id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (!v14) {
            break;
          }
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
LABEL_13:
          uint64_t v17 = 0LL;
          while (1)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([v12 isEqualToEndpoint:*(void *)(*((void *)&v21 + 1) + 8 * v17) withDateTolerance:10.0]) {
              break;
            }
            if (v15 == (id)++v17)
            {
              id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v15) {
                goto LABEL_13;
              }
              goto LABEL_25;
            }
          }

          if ((id)++v11 != v9) {
            goto LABEL_9;
          }
          id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
          BOOL v18 = 1;
          if (!v9) {
            goto LABEL_27;
          }
        }

+ (BOOL)compareInfoResult:(id)a3 with:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 uri]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 uri]);
    if (![v8 isEqualToString:v9])
    {
      BOOL v17 = 0;
LABEL_21:

      goto LABEL_22;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)v6 status]));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [(id)v7 status]));
    if (![v10 isEqualToNumber:v11])
    {
      BOOL v17 = 0;
LABEL_20:

      goto LABEL_21;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 endpoints]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 endpoints]);
    if (![a1 compareEndpoints:v12 with:v13])
    {
      BOOL v17 = 0;
LABEL_19:

      goto LABEL_20;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 ktData]);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 ktData]);
    unsigned __int8 v27 = objc_msgSend(v14, "isEqual:");
    uint64_t v29 = v14;
    if ((v27 & 1) == 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 ktData]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 ktData]);
      if (v15 != v16)
      {
        BOOL v17 = 0;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }

      __int128 v23 = v15;
    }

    __int128 v25 = v12;
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "gameCenterData", v23));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 gameCenterData]);
    __int128 v26 = v18;
    if ([v18 isEqual:v19])
    {

      BOOL v17 = 1;
    }

    else
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([(id)v6 gameCenterData]);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([(id)v7 gameCenterData]);
      BOOL v17 = v20 == v21;
    }

    uint64_t v16 = v24;
    id v12 = v25;
    id v15 = v24;
    if ((v27 & 1) != 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (void)_triggerAutoBugCaptureWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = OSLogHandleForIDSCategory("PeerLookup");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Triggering AutoBugCapture for differed query cache results due to %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v6) && _IDSShouldLog(0LL, @"PeerLookup"))
  {
    id v7 = v3;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"PeerLookup",  @"Triggering AutoBugCapture for differed query cache results due to %@");
  }

  if (+[IDSAutoBugCapture isSupported](&OBJC_CLASS___IDSAutoBugCapture, "isSupported", v7))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100320E3C;
    v8[3] = &unk_1008F8320;
    id v9 = v3;
    +[IDSAutoBugCapture triggerCaptureWithEvent:context:completion:]( &OBJC_CLASS___IDSAutoBugCapture,  "triggerCaptureWithEvent:context:completion:",  106LL,  v9,  v8);
  }
}

- (unint64_t)excessiveQueryCacheEntriesThreshold
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"excessive-query-threshold"]);

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

- (void)performCleanupTasks
{
  int v3 = _os_feature_enabled_impl("IDS", "SwiftDataForQueryCache");
  uint64_t v4 = 2LL;
  if (v3) {
    uint64_t v4 = 3LL;
  }
  -[objc_class performCleanupTasks]((&self->super.isa)[v4], "performCleanupTasks");
}

- (NSMutableSet)reportedExcessiveQueryCacheEntries
{
  return self->_reportedExcessiveQueryCacheEntries;
}

- (void)setReportedExcessiveQueryCacheEntries:(id)a3
{
}

- (IDSPeerIDManagerProtocol)managerOLD
{
  return self->_managerOLD;
}

- (void)setManagerOLD:(id)a3
{
}

- (IDSPeerIDManagerProtocol)managerSD
{
  return self->_managerSD;
}

- (void)setManagerSD:(id)a3
{
}

- (void).cxx_destruct
{
}

@end