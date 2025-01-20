@interface NIServerFindableDeviceProxySessionManager
+ (id)sharedInstance;
- (BOOL)_isTokenFindable:(id)a3;
- (BOOL)_shouldHoldOSTransactionWhileFindable;
- (BOOL)_shouldInteract;
- (BOOL)supportsCameraAssistance;
- (id).cxx_construct;
- (id)_enableInteractionWithPersistedTokens;
- (id)_initInternal;
- (id)_internalPrepareTokenCache;
- (id)_internalPrintableState;
- (id)_internalSetFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4 logInEventBuffer:(BOOL)a5;
- (id)_setTokenCacheForGroup:(id)a3;
- (id)_tokensFromAllGroups;
- (id)findableDiscoveryTokensForGroup:(id)a3;
- (id)getQueueForInputingData;
- (id)interactingFinderDiscoveryTokensForGroup:(id)a3;
- (id)printableState;
- (id)setFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4;
- (id)setLocalDeviceDebugParameters:(id)a3;
- (id)startBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4;
- (id)stopBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4;
- (int)_selectedTechnology;
- (void)DataCallback:(id)a3;
- (void)_activateAssertionsWhileFindable;
- (void)_activateAssertionsWhileInteracting;
- (void)_activateProvidersLazy;
- (void)_activateSensors;
- (void)_advertiseAndRangeWithPeer:(id)a3 peerAdvertisement:(id)a4;
- (void)_configureKeepAliveTimeoutForPeer:(id)a3 useCase:(int)a4 isKeepAliveBluetooth:(BOOL)a5;
- (void)_deactivateAssertionsWhileFindable;
- (void)_deactivateAssertionsWhileInteracting;
- (void)_deactivateSensors;
- (void)_disableInteractionAndKeepPersistedTokens;
- (void)_handleRangingTerminatedCallbackForPeer:(id)a3;
- (void)_kickKeepAliveForPeer:(id)a3;
- (void)_nearbydLogRange:(double)a3 token:(id)a4;
- (void)_setUpAlgorithmsContainerForToken:(id)a3;
- (void)_tearDownAlgorithmsContainerForToken:(id)a3;
- (void)_updatePeerTrackingForToken:(id)a3 newAdvertisingState:(int)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newDiscoveryState:(int)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newNbUwbAcquisitionChannelIdx:(id)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newRangingState:(int)a4;
- (void)_updatePeerTrackingForToken:(id)a3 newTrackingState:(id)a4;
- (void)_updateReceivedSignalFlags:(unsigned __int8)a3 toPeerTrackingForToken:(id)a4;
- (void)addObserver:(id)a3;
- (void)bluetoothDiscoveryBecameAvailable;
- (void)bluetoothDiscoveryBecameUnavailable;
- (void)bluetoothDiscoveryFinishedActivating;
- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4;
- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5;
- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4;
- (void)didLosePeer:(id)a3;
- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4;
- (void)didRangingAuthorizationFailForPeer:(id)a3;
- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5;
- (void)didStopAdvertisingToPeer:(id)a3;
- (void)didStopRangingWithPeer:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)notifyDeviceUnlockedSinceBoot;
- (void)processClientDiscoveryEventForToken:(id)a3 sharedConfigurationData:(id)a4;
- (void)processClientRemovePeerEventForToken:(id)a3;
- (void)processVisionInput:(id)a3;
- (void)rangingBecameAvailable;
- (void)rangingBecameUnavailable;
- (void)removeObserver:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5;
@end

@implementation NIServerFindableDeviceProxySessionManager

+ (id)sharedInstance
{
  if (qword_1007F91F8 != -1) {
    dispatch_once(&qword_1007F91F8, &stru_1007B3F40);
  }
  return (id)qword_1007F91F0;
}

- (void)notifyDeviceUnlockedSinceBoot
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,notifyDeviceUnlockedSinceBoot",  buf,  2u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100199694;
  block[3] = &unk_1007A3000;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_internalPrepareTokenCache
{
  if (MKBDeviceUnlockedSinceBoot(v3) == 1)
  {
    if (self->_preparedTokenCache) {
      return 0LL;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v7 removeObjectForKey:@"FindingLocalDeviceLastUnlockUUID"];

    memset(v43, 0, sizeof(v43));
    size_t v32 = 37LL;
    if (sysctlbyname("kern.bootsessionuuid", v43, &v32, 0LL, 0LL)) {
      v8 = 0LL;
    }
    else {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v43));
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringForKey:@"FindableDeviceProxyTokenCacheBootUUID"]);

    if (v8)
    {
      if (v10) {
        unsigned int v11 = [v10 isEqualToString:v8] ^ 1;
      }
      else {
        unsigned int v11 = 1;
      }
      v14 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Prepare token cache (once per launch). First time after reboot: %d",  buf,  8u);
      }

      if (!v11)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerKeychainManager sharedInstance]( &OBJC_CLASS___NIServerKeychainManager,  "sharedInstance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue( [v19 readAllItemsWithService:@"FindingTokens" synchronizable:0 systemKeychain:0]);

        *(void *)buf = 0LL;
        v34 = buf;
        uint64_t v35 = 0x3032000000LL;
        v36 = sub_100199D9C;
        v37 = sub_100199DAC;
        id v38 = 0LL;
        uint64_t v28 = 0LL;
        v29 = &v28;
        uint64_t v30 = 0x2020000000LL;
        int v31 = 0;
        uint64_t v24 = 0LL;
        v25 = &v24;
        uint64_t v26 = 0x2020000000LL;
        int v27 = 0;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100199DB4;
        v23[3] = &unk_1007B3F68;
        v23[4] = self;
        v23[5] = buf;
        v23[6] = &v28;
        v23[7] = &v24;
        [v12 enumerateObjectsUsingBlock:v23];
        if (*((void *)v34 + 5))
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
            sub_10039607C();
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Prepare token cache: error restoring from cache: %@",  *((void *)v34 + 5)));
          sub_100277C30(v20, &self->_tokenEventLogBuffer.__map_.__first_);

          id v18 = *((id *)v34 + 5);
        }

        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
          [v21 setObject:v8 forKey:@"FindableDeviceProxyTokenCacheBootUUID"];

          self->_preparedTokenCache = 1;
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Prepare token cache: restore success (%d groups, %d tokens)",  *((unsigned int *)v29 + 6),  *((unsigned int *)v25 + 6)));
          sub_100277C30(v22, &self->_tokenEventLogBuffer.__map_.__first_);

          id v18 = 0LL;
        }

        _Block_object_dispose(&v24, 8);
        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_32;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](&OBJC_CLASS___NIServerKeychainManager, "sharedInstance"));
      unsigned __int8 v16 = [v15 deleteAllItemsWithService:@"FindingTokens" synchronizable:0 systemKeychain:0];

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        [v17 setObject:v8 forKey:@"FindableDeviceProxyTokenCacheBootUUID"];

        self->_preparedTokenCache = 1;
        sub_100277C30(@"Prepare token cache: reset success", &self->_tokenEventLogBuffer.__map_.__first_);
        id v18 = 0LL;
        goto LABEL_33;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100396050();
      }
      sub_100277C30(@"Prepare token cache: reset failed", &self->_tokenEventLogBuffer.__map_.__first_);
      NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
      v40 = @"Prepare token cache: reset failed";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v12));
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100396024();
      }
      sub_100277C30( @"Prepare token cache: could not get current boot UUID",  &self->_tokenEventLogBuffer.__map_.__first_);
      NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
      v42 = @"Prepare token cache: could not get current boot UUID";
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v12));
    }

    id v18 = (id)v13;
LABEL_32:

LABEL_33:
    return v18;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_1003960E4();
  }
  sub_100277C30(@"Prepare token cache: not ready", &self->_tokenEventLogBuffer.__map_.__first_);
  NSErrorUserInfoKey v44 = NSLocalizedFailureReasonErrorKey;
  v45 = @"Prepare token cache: not ready";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v5));

  return v6;
}

- (id)_internalSetFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4 logInEventBuffer:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v48 = a4;
  v45 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v56 = 0LL;
  v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000LL;
  v59 = sub_100199D9C;
  v60 = sub_100199DAC;
  id v61 = 0LL;
  -[NIServerFindableDeviceProxySessionManager _activateProvidersLazy](self, "_activateProvidersLazy");
  NSErrorUserInfoKey v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v48));
  BOOL v46 = v5;
  v42 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_10019A65C;
  v53[3] = &unk_1007B3F90;
  id v10 = v44;
  id v54 = v10;
  unsigned int v11 = v42;
  v55 = v11;
  [v43 enumerateObjectsUsingBlock:v53];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10019A6BC;
  v50[3] = &unk_1007B3F90;
  id v47 = v43;
  id v51 = v47;
  v12 = v9;
  v52 = v12;
  [v10 enumerateObjectsUsingBlock:v50];
  uint64_t v13 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);
    id v15 = sub_10027801C(v14, 10, 0);
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138478083;
    id v63 = v48;
    __int16 v64 = 2113;
    v65 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,_internalSetFindableDiscoveryTokens. Group: %{private}@. New tokens: %{private}@",  buf,  0x16u);
  }

  v17 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v47 allObjects]);
    id v19 = sub_10027801C(v18, 10, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 138477827;
    id v63 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Old tokens: %{private}@.",  buf,  0xCu);
  }

  v21 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v12, "allObjects"));
    id v23 = sub_10027801C(v22, 10, 0);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    *(_DWORD *)buf = 138477827;
    id v63 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Tokens added: %{private}@.",  buf,  0xCu);
  }

  v25 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v11, "allObjects"));
    id v27 = sub_10027801C(v26, 10, 0);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138477827;
    id v63 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Tokens removed: %{private}@.",  buf,  0xCu);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10019A71C;
  v49[3] = &unk_1007B3FB8;
  v49[4] = self;
  v49[5] = &v56;
  -[NSMutableSet enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v49);
  id v29 = [v10 count];
  groupedFindableTokens = self->_groupedFindableTokens;
  if (v29)
  {
    id v31 = [v10 mutableCopy];
    -[NSMutableDictionary setObject:forKey:](groupedFindableTokens, "setObject:forKey:", v31, v48);
  }

  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_groupedFindableTokens, "removeObjectForKey:", v48);
  }

  size_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindableDeviceProxySessionManager _setTokenCacheForGroup:]( self,  "_setTokenCacheForGroup:",  v48));
  if (v32)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100396170();
    }
    objc_storeStrong(v57 + 5, v32);
  }

  if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindableDeviceProxySessionManager _enableInteractionWithPersistedTokens]( self,  "_enableInteractionWithPersistedTokens"));
    if (v33)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100396110();
      }
      objc_storeStrong(v57 + 5, v33);
    }
  }

  if (-[NIServerFindableDeviceProxySessionManager _shouldHoldOSTransactionWhileFindable]( self,  "_shouldHoldOSTransactionWhileFindable"))
  {
    if (-[NSMutableDictionary count](self->_groupedFindableTokens, "count")) {
      -[NIServerFindableDeviceProxySessionManager _activateAssertionsWhileFindable]( self,  "_activateAssertionsWhileFindable");
    }
    else {
      -[NIServerFindableDeviceProxySessionManager _deactivateAssertionsWhileFindable]( self,  "_deactivateAssertionsWhileFindable");
    }
  }

  if (v46)
  {
    id v34 = -[NSMutableSet count](v12, "count");
    if ((char *)-[NSMutableSet count](v11, "count") + (void)v34)
    {
      id v35 = [v10 count];
      id v36 = [v47 count];
      id v37 = -[NSMutableSet count](v12, "count");
      id v38 = -[NSMutableSet count](v11, "count");
      NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Set tokens. Group: %@. New: %d. Old: %d. Added: %d. Removed: %d. Error: %@",  v48,  v35,  v36,  v37,  v38,  v57[5]));
      sub_100277C30(v39, &self->_tokenEventLogBuffer.__map_.__first_);
    }
  }

  id v40 = v57[5];

  _Block_object_dispose(&v56, 8);
  return v40;
}

- (id)setFindableDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v6 count];
    LOWORD(v19) = 2113;
    *(void *)((char *)&v19 + 2) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,setFindableDiscoveryTokens (%d tokens). Group: %{private}@",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v19 = buf;
  *((void *)&v19 + 1) = 0x3032000000LL;
  v20 = sub_100199D9C;
  v21 = sub_100199DAC;
  id v22 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10019AA3C;
  v14[3] = &unk_1007B3FE0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v17 = buf;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, v14);
  id v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)startBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v6 count];
    LOWORD(v19) = 2113;
    *(void *)((char *)&v19 + 2) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,startBeingFindableWithDiscoveryTokens (%d tokens to add). Group: %{private}@",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v19 = buf;
  *((void *)&v19 + 1) = 0x3032000000LL;
  v20 = sub_100199D9C;
  v21 = sub_100199DAC;
  id v22 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10019AC90;
  v14[3] = &unk_1007B3FE0;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  v17 = buf;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(queue, v14);
  id v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)stopBeingFindableWithDiscoveryTokens:(id)a3 tokenGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109379;
    *(_DWORD *)&uint8_t buf[4] = [v6 count];
    LOWORD(v19) = 2113;
    *(void *)((char *)&v19 + 2) = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,stopBeingFindableWithDiscoveryTokens (%d tokens to remove). Group: %{private}@",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v19 = buf;
  *((void *)&v19 + 1) = 0x3032000000LL;
  v20 = sub_100199D9C;
  v21 = sub_100199DAC;
  id v22 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10019AF84;
  v14[3] = &unk_1007B3FE0;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  v17 = buf;
  id v10 = v6;
  id v11 = v7;
  dispatch_sync(queue, v14);
  id v12 = *(id *)(v19 + 40);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)setLocalDeviceDebugParameters:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,setLocalDeviceDebugParameters",  buf,  2u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10019B1B0;
  v9[3] = &unk_1007A2248;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_sync(queue, v9);

  return 0LL;
}

- (void)processClientDiscoveryEventForToken:(id)a3 sharedConfigurationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019B288;
  block[3] = &unk_1007B14B8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

- (void)processClientRemovePeerEventForToken:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019B648;
  block[3] = &unk_1007A2248;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)findableDiscoveryTokensForGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,findableDiscoveryTokensForGroup: %{private}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100199D9C;
  id v16 = sub_100199DAC;
  id v17 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019B8F0;
  block[3] = &unk_1007B21F8;
  id v11 = v4;
  p___int128 buf = &buf;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40LL);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (id)interactingFinderDiscoveryTokensForGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,interactingFinderDiscoveryTokensForGroup: %{private}@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100199D9C;
  id v16 = sub_100199DAC;
  id v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019BAE0;
  block[3] = &unk_1007B4058;
  block[4] = self;
  id v11 = v4;
  p___int128 buf = &buf;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = *(id *)(*((void *)&buf + 1) + 40LL);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019BC9C;
  block[3] = &unk_1007A2248;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019BF5C;
  block[3] = &unk_1007A2248;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (id)printableState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100199D9C;
  id v10 = sub_100199DAC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10019C09C;
  v5[3] = &unk_1007B1E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v87 = 0LL;
  v88 = &v87;
  uint64_t v89 = 0x3032000000LL;
  v90 = sub_100199D9C;
  v91 = sub_100199DAC;
  v92 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_autoreleasePoolPush();
  id v4 = (void *)v88[5];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v6 = sub_100277B78(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_100277B78(self->_initDate);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSDate timeIntervalSinceNow](self->_initDate, "timeIntervalSinceNow");
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Now: %@. Init: %@. Runtime: %.0f s. Cache: %d. Observers: %d",  v7,  v9,  -v10,  self->_preparedTokenCache,  -[NSHashTable count](self->_observers, "count")));
  [v4 addObject:v11];

  id v12 = (void *)v88[5];
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sensors: %d. Assertions: OST-interacting %d, PA-interacting %d, OST-findable %d.",  self->_sensorsOn,  self->_osTransactionWhileInteracting != 0LL,  self->_powerAssertionWhileInteracting != 0,  self->_osTransactionWhileFindable != 0LL));
  [v12 addObject:v13];

  uint64_t v14 = (void *)v88[5];
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BT available: %d. Ranging available: %d. Should interact: %d.",  self->_bluetoothDiscoveryAvailable,  self->_rangingAvailable,  -[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract")));
  [v14 addObject:v15];

  id v16 = (void *)v88[5];
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Findable tokens (%d groups)",  -[NSMutableDictionary count](self->_groupedFindableTokens, "count")));
  [v16 addObject:v17];

  groupedFindableTokens = self->_groupedFindableTokens;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_10019CA6C;
  v86[3] = &unk_1007B40A8;
  v86[4] = &v87;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( groupedFindableTokens,  "enumerateKeysAndObjectsUsingBlock:",  v86);
  __int128 v19 = (void *)v88[5];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingDiscoveryProvider printableState](self->_discoveryProvider, "printableState"));
  [v19 addObjectsFromArray:v20];

  v21 = (void *)v88[5];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindingRangingProvider printableState](self->_rangingProvider, "printableState"));
  [v21 addObjectsFromArray:v22];

  id v23 = (void *)v88[5];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Tracking state for %d peers",  -[NSMutableDictionary count](self->_peerTracking, "count")));
  [v23 addObject:v24];

  peerTracking = self->_peerTracking;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_10019CB80;
  v85[3] = &unk_1007B40D0;
  v85[4] = &v87;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](peerTracking, "enumerateKeysAndObjectsUsingBlock:", v85);
  uint64_t v26 = (void *)v88[5];
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Algorithm containers for %d peers",  -[NSMutableDictionary count](self->_peerAlgorithmContainers, "count")));
  [v26 addObject:v27];

  uint64_t v28 = (void *)v88[5];
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_peerAlgorithmContainers, "allKeys"));
  id v30 = sub_10027801C(v29, 10, 1);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  [v28 addObjectsFromArray:v31];

  size_t v32 = (void *)v88[5];
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Keep-alives for %d peers",  -[NSMutableDictionary count](self->_keepAliveTimeoutsSeconds, "count")));
  [v32 addObject:v33];

  keepAliveTimeoutsSeconds = self->_keepAliveTimeoutsSeconds;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_10019CC5C;
  v84[3] = &unk_1007B40F8;
  v84[4] = &v87;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( keepAliveTimeoutsSeconds,  "enumerateKeysAndObjectsUsingBlock:",  v84);
  id v35 = (void *)v88[5];
  id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Last discovery event: %@",  self->_lastDiscoveryEvent));
  [v35 addObject:v36];

  id v37 = (void *)v88[5];
  id v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Last range measurement: %@",  self->_lastRangingMeasurement));
  [v37 addObject:v38];

  NSErrorUserInfoKey v39 = (void *)v88[5];
  id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Last range poll: %@",  self->_lastRangingPoll));
  [v39 addObject:v40];

  NSErrorUserInfoKey v41 = (void *)v88[5];
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Token events (max %d)",  self->_tokenEventLogBuffer.__size_.__value_));
  [v41 addObject:v42];

  begin = self->_tokenEventLogBuffer.__map_.__begin_;
  if (self->_tokenEventLogBuffer.__map_.__end_ != begin)
  {
    unint64_t start = self->_tokenEventLogBuffer.__start_;
    unint64_t v45 = (unint64_t)begin[start / 0xAA] + 24 * (start % 0xAA);
    unint64_t v46 = (unint64_t)begin[(self->_tokenEventLogBuffer.__size_.__value_ + start) / 0xAA]
        + 24 * ((self->_tokenEventLogBuffer.__size_.__value_ + start) % 0xAA);
    if (v45 != v46)
    {
      id v47 = &begin[start / 0xAA];
      do
      {
        if (*(char *)(v45 + 23) < 0)
        {
          sub_1000063A8(__p, *(void **)v45, *(void *)(v45 + 8));
        }

        else
        {
          __int128 v48 = *(_OWORD *)v45;
          uint64_t v83 = *(void *)(v45 + 16);
          *(_OWORD *)__p = v48;
        }

        if (SHIBYTE(v83) < 0)
        {
          if (!__p[1]) {
            goto LABEL_13;
          }
          v50 = v88;
          v49 = (void **)__p[0];
        }

        else
        {
          if (!HIBYTE(v83)) {
            goto LABEL_14;
          }
          v49 = __p;
          v50 = v88;
        }

        id v51 = (void *)v50[5];
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"    %s", v49));
        [v51 addObject:v52];

        if (SHIBYTE(v83) < 0) {
LABEL_13:
        }
          operator delete(__p[0]);
LABEL_14:
        v45 += 24LL;
        if (v45 - (void)*v47 == 4080)
        {
          unint64_t v53 = (unint64_t)v47[1];
          ++v47;
          unint64_t v45 = v53;
        }
      }

      while (v45 != v46);
    }
  }

  id v54 = (void *)v88[5];
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Session events (max %d)",  self->_sessionEventLogBuffer.__size_.__value_));
  [v54 addObject:v55];

  uint64_t v56 = self->_sessionEventLogBuffer.__map_.__begin_;
  if (self->_sessionEventLogBuffer.__map_.__end_ != v56)
  {
    unint64_t v57 = self->_sessionEventLogBuffer.__start_;
    unint64_t v58 = (unint64_t)v56[v57 / 0xAA] + 24 * (v57 % 0xAA);
    unint64_t v59 = (unint64_t)v56[(self->_sessionEventLogBuffer.__size_.__value_ + v57) / 0xAA]
        + 24 * ((self->_sessionEventLogBuffer.__size_.__value_ + v57) % 0xAA);
    if (v58 != v59)
    {
      v60 = &v56[v57 / 0xAA];
      do
      {
        if (*(char *)(v58 + 23) < 0)
        {
          sub_1000063A8(__p, *(void **)v58, *(void *)(v58 + 8));
        }

        else
        {
          __int128 v61 = *(_OWORD *)v58;
          uint64_t v83 = *(void *)(v58 + 16);
          *(_OWORD *)__p = v61;
        }

        if (SHIBYTE(v83) < 0)
        {
          if (!__p[1]) {
            goto LABEL_29;
          }
          id v63 = v88;
          v62 = (void **)__p[0];
        }

        else
        {
          if (!HIBYTE(v83)) {
            goto LABEL_30;
          }
          v62 = __p;
          id v63 = v88;
        }

        __int16 v64 = (void *)v63[5];
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"    %s", v62));
        [v64 addObject:v65];

        if (SHIBYTE(v83) < 0) {
LABEL_29:
        }
          operator delete(__p[0]);
LABEL_30:
        v58 += 24LL;
        if (v58 - (void)*v60 == 4080)
        {
          unint64_t v66 = (unint64_t)v60[1];
          ++v60;
          unint64_t v58 = v66;
        }
      }

      while (v58 != v59);
    }
  }

  v67 = (void *)v88[5];
  v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Misc events (max %d)",  self->_miscEventLogBuffer.__size_.__value_));
  [v67 addObject:v68];

  v69 = self->_miscEventLogBuffer.__map_.__begin_;
  if (self->_miscEventLogBuffer.__map_.__end_ != v69)
  {
    unint64_t v70 = self->_miscEventLogBuffer.__start_;
    unint64_t v71 = (unint64_t)v69[v70 / 0xAA] + 24 * (v70 % 0xAA);
    unint64_t v72 = (unint64_t)v69[(self->_miscEventLogBuffer.__size_.__value_ + v70) / 0xAA]
        + 24 * ((self->_miscEventLogBuffer.__size_.__value_ + v70) % 0xAA);
    if (v71 != v72)
    {
      v73 = &v69[v70 / 0xAA];
      do
      {
        if (*(char *)(v71 + 23) < 0)
        {
          sub_1000063A8(__p, *(void **)v71, *(void *)(v71 + 8));
        }

        else
        {
          __int128 v74 = *(_OWORD *)v71;
          uint64_t v83 = *(void *)(v71 + 16);
          *(_OWORD *)__p = v74;
        }

        if (SHIBYTE(v83) < 0)
        {
          if (!__p[1]) {
            goto LABEL_45;
          }
          v76 = v88;
          v75 = (void **)__p[0];
        }

        else
        {
          if (!HIBYTE(v83)) {
            goto LABEL_46;
          }
          v75 = __p;
          v76 = v88;
        }

        v77 = (void *)v76[5];
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"    %s", v75));
        [v77 addObject:v78];

        if (SHIBYTE(v83) < 0) {
LABEL_45:
        }
          operator delete(__p[0]);
LABEL_46:
        v71 += 24LL;
        if (v71 - (void)*v73 == 4080)
        {
          unint64_t v79 = (unint64_t)v73[1];
          ++v73;
          unint64_t v71 = v79;
        }
      }

      while (v71 != v72);
    }
  }

  objc_autoreleasePoolPop(v3);
  id v80 = (id)v88[5];
  _Block_object_dispose(&v87, 8);

  return v80;
}

- (id)_initInternal
{
  id v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,_initInternal", buf, 2u);
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NIServerFindableDeviceProxySessionManager;
  id v4 = -[NIServerFindableDeviceProxySessionManager init](&v13, "init");
  if (v4)
  {
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, -1);
    id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nearbyd.finding.proxy-session", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    id v9 = (dispatch_queue_s *)v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019CE38;
    block[3] = &unk_1007A3000;
    id v12 = v4;
    dispatch_sync(v9, block);
  }

  return v4;
}

- (void)_activateSensors
{
  if (!self->_sensorsOn)
  {
    id v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,turning on sensors for findee algorithms.",  buf,  2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NILocalDeviceActivatingSensors", 0LL, 0LL, 1u);
    if (-[NIServerFindableDeviceProxySessionManager supportsCameraAssistance](self, "supportsCameraAssistance"))
    {
      dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerVisionDataDistributor sharedProvider]( &OBJC_CLASS___NIServerVisionDataDistributor,  "sharedProvider"));
      [v5 registerForVisionInput:self];
    }

    id v6 = -[CLLocationManager initWithEffectiveBundlePath:delegate:onQueue:]( objc_alloc(&OBJC_CLASS___CLLocationManager),  "initWithEffectiveBundlePath:delegate:onQueue:",  @"/System/Library/PrivateFrameworks/FMF.framework",  self,  self->_queue);
    locationManager = self->_locationManager;
    self->_locationManager = v6;

    id v8 = self->_locationManager;
    if (v8)
    {
      -[CLLocationManager setActivityType:](v8, "setActivityType:", 3LL);
      -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:", kCLDistanceFilterNone);
      -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyBest);
      -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
      id v9 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)objc_super v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-proxy,startUpdatingLocation", v13, 2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
    {
      sub_100396290();
    }

    double v10 = -[NSBundle initWithPath:]( objc_alloc(&OBJC_CLASS___NSBundle),  "initWithPath:",  @"/System/Library/PrivateFrameworks/FMF.framework");
    if (!self->_gnssExtensionsManager)
    {
      id v11 = -[NIGnssExtensionsManager initWithQueue:bundle:reason:]( objc_alloc(&OBJC_CLASS___NIGnssExtensionsManager),  "initWithQueue:bundle:reason:",  self->_queue,  v10,  @"NIServerFindableDeviceProxySessionManager");
      gnssExtensionsManager = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = v11;

      -[NIGnssExtensionsManager setDelegate:](self->_gnssExtensionsManager, "setDelegate:", self);
    }

    self->_sensorsOn = 1;
  }

- (void)_deactivateSensors
{
  if (self->_sensorsOn)
  {
    id v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,turning off sensors for findee algorithms.  ",  v9,  2u);
    }

    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0LL);
    locationManager = self->_locationManager;
    self->_locationManager = 0LL;

    gnssExtensionsManager = self->_gnssExtensionsManager;
    if (gnssExtensionsManager)
    {
      -[NIGnssExtensionsManager invalidate](gnssExtensionsManager, "invalidate");
      id v6 = self->_gnssExtensionsManager;
      self->_gnssExtensionsManager = 0LL;
    }

    if (-[NIServerFindableDeviceProxySessionManager supportsCameraAssistance](self, "supportsCameraAssistance"))
    {
      dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerVisionDataDistributor sharedProvider]( &OBJC_CLASS___NIServerVisionDataDistributor,  "sharedProvider"));
      [v7 unregisterForVisionInput:self];
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NILocalDeviceDeactivatingSensors", 0LL, 0LL, 1u);
    self->_sensorsOn = 0;
  }

- (void)_activateAssertionsWhileFindable
{
  if (!self->_osTransactionWhileFindable)
  {
    id v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Activate OS transaction while findable",  v6,  2u);
    }

    id v4 = (OS_os_transaction *)os_transaction_create("com.apple.nearbyd.finding.proxy-session.while-findable");
    osTransactionWhileFindable = self->_osTransactionWhileFindable;
    self->_osTransactionWhileFindable = v4;

    if (!self->_osTransactionWhileFindable && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003962BC();
    }
  }

- (void)_deactivateAssertionsWhileFindable
{
  if (self->_osTransactionWhileFindable)
  {
    id v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_attr_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Deactivate OS transaction (no longer findable)",  v5,  2u);
    }

    osTransactionWhileFindable = self->_osTransactionWhileFindable;
    self->_osTransactionWhileFindable = 0LL;
  }

- (void)_activateAssertionsWhileInteracting
{
  if (!self->_osTransactionWhileInteracting)
  {
    id v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Activate OS transaction while interacting",  buf,  2u);
    }

    id v4 = (OS_os_transaction *)os_transaction_create("com.apple.nearbyd.finding.proxy-session.while-interacting");
    osTransactionWhileInteracting = self->_osTransactionWhileInteracting;
    self->_osTransactionWhileInteracting = v4;

    if (!self->_osTransactionWhileInteracting && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_10039634C();
    }
  }

  unsigned int powerAssertionWhileInteracting = self->_powerAssertionWhileInteracting;
  p_unsigned int powerAssertionWhileInteracting = &self->_powerAssertionWhileInteracting;
  if (!powerAssertionWhileInteracting)
  {
    id v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Activate power assertion while interacting",  v17,  2u);
    }

    uint64_t v9 = IOPMAssertionCreateWithName( @"PreventUserIdleSystemSleep",  0xFFu,  @"com.apple.nearbyd.finding.proxy-session.while-interacting",  p_powerAssertionWhileInteracting);
    if ((_DWORD)v9 || !*p_powerAssertionWhileInteracting)
    {
      double v10 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003962E8(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      unsigned int *p_powerAssertionWhileInteracting = 0;
    }
  }

- (void)_deactivateAssertionsWhileInteracting
{
  if (self->_osTransactionWhileInteracting)
  {
    id v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Deactivate OS transaction (no longer interacting)",  buf,  2u);
    }

    osTransactionWhileInteracting = self->_osTransactionWhileInteracting;
    self->_osTransactionWhileInteracting = 0LL;
  }

  if (self->_powerAssertionWhileInteracting)
  {
    dispatch_queue_attr_t v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Deactivate power assertion while interacting",  v15,  2u);
    }

    uint64_t v6 = IOPMAssertionRelease(self->_powerAssertionWhileInteracting);
    self->_unsigned int powerAssertionWhileInteracting = 0;
    if ((_DWORD)v6)
    {
      uint64_t v7 = v6;
      id v8 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_100396378(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }

- (void)_activateProvidersLazy
{
}

- (void)_updatePeerTrackingForToken:(id)a3 newDiscoveryState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    id v8 = [v7 copy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
  }

  [v8 setDiscoveryState:v4];
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:]( self,  "_updatePeerTrackingForToken:newTrackingState:",  v9,  v8);
}

- (void)_updatePeerTrackingForToken:(id)a3 newAdvertisingState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    id v8 = [v7 copy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
  }

  [v8 setAdvertisingState:v4];
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:]( self,  "_updatePeerTrackingForToken:newTrackingState:",  v9,  v8);
}

- (void)_updatePeerTrackingForToken:(id)a3 newRangingState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    id v8 = [v7 copy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
  }

  [v8 setRangingState:v4];
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:]( self,  "_updatePeerTrackingForToken:newTrackingState:",  v9,  v8);
}

- (void)_updateReceivedSignalFlags:(unsigned __int8)a3 toPeerTrackingForToken:(id)a4
{
  uint64_t v4 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v9));
    id v8 = [v7 copy];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
  }

  [v8 setReceivedSignalFlags:v4];
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:]( self,  "_updatePeerTrackingForToken:newTrackingState:",  v9,  v8);
}

- (void)_updatePeerTrackingForToken:(id)a3 newNbUwbAcquisitionChannelIdx:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v10));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v10));
    id v9 = [v8 copy];
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
  }

  [v9 setNbUwbAcquisitionChannelIdx:v6];
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newTrackingState:]( self,  "_updatePeerTrackingForToken:newTrackingState:",  v10,  v9);
}

- (void)_updatePeerTrackingForToken:(id)a3 newTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v7 copy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  if (v9)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
    id v11 = [v10 copy];
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NIServerFindingPeerTracking peerTrackingInitialState]( &OBJC_CLASS___NIServerFindingPeerTracking,  "peerTrackingInitialState"));
    id v11 = v10;
  }

  if ([v11 rangingState] == 3
    && ([v8 rangingState] == 1 || objc_msgSend(v8, "rangingState") == 2))
  {
    objc_msgSend(v8, "setRangingState:", objc_msgSend(v11, "rangingState"));
  }

  if ([v11 discoveryState] == 3
    && ([v8 discoveryState] == 1 || objc_msgSend(v8, "discoveryState") == 2))
  {
    objc_msgSend(v8, "setDiscoveryState:", objc_msgSend(v11, "discoveryState"));
  }

  if (([v11 isDoingAnything] & 1) == 0
    && ([v8 isDoingAnything] & 1) == 0)
  {
    id v12 = [v11 copy];

    id v8 = v12;
  }

  if ([v11 discoveryState] == 1 && objc_msgSend(v8, "discoveryState") == 2
    || [v11 discoveryState] == 2 && objc_msgSend(v8, "discoveryState") == 1)
  {
    [v8 setDiscoveryState:3];
  }

  if ([v8 hasReceivedRangingData]
    && ([v8 receivedSignalFlags] & 1) != 0)
  {
    [v8 setTellClientAboutPeer:1];
  }

  if (![v8 isDoingAnything]
    || ([v8 receivedSignalFlags] & 1) == 0)
  {
    [v8 setTellClientAboutPeer:0];
  }

  if (([v11 isEqual:v8] & 1) == 0)
  {
    unsigned int v13 = [v8 isDoingAnything];
    peerTracking = self->_peerTracking;
    if (v13) {
      -[NSMutableDictionary setObject:forKey:](peerTracking, "setObject:forKey:", v8, v6);
    }
    else {
      -[NSMutableDictionary removeObjectForKey:](peerTracking, "removeObjectForKey:", v6);
    }
    if (([v11 isDoingAnything] & 1) == 0
      && [v8 isDoingAnything])
    {
      uint64_t v15 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = sub_100277A70((uint64_t)"SessionStarted", 0, v6, 0LL);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v16);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&buf, 0xCu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionInternal]);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionStarted",  v18));
      sub_100277C30(v19, &self->_sessionEventLogBuffer.__map_.__first_);
    }

    v20 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Change: %@ -> %@",  v11,  v8));
      id v22 = sub_100277A70((uint64_t)"StateChange", 0, v6, v21);
      id v23 = (id)objc_claimAutoreleasedReturnValue(v22);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionInternal]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v24, v8));
    p_sessionEventLogBuffer = &self->_sessionEventLogBuffer;
    sub_100277C30(v25, &self->_sessionEventLogBuffer.__map_.__first_);

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v58 = 0x2020000000LL;
    char v59 = 0;
    uint64_t v51 = 0LL;
    v52 = &v51;
    uint64_t v53 = 0x2020000000LL;
    char v54 = 0;
    id v27 = self->_peerTracking;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_10019E9E0;
    v50[3] = &unk_1007B4120;
    void v50[4] = &buf;
    v50[5] = &v51;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v50);
    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
      -[NIServerFindableDeviceProxySessionManager _activateAssertionsWhileInteracting]( self,  "_activateAssertionsWhileInteracting");
    }
    if (*((_BYTE *)v52 + 24)) {
      -[NIServerFindableDeviceProxySessionManager _activateSensors](self, "_activateSensors");
    }
    else {
      -[NIServerFindableDeviceProxySessionManager _deactivateSensors](self, "_deactivateSensors");
    }
    if (!*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
      -[NIServerFindableDeviceProxySessionManager _deactivateAssertionsWhileInteracting]( self,  "_deactivateAssertionsWhileInteracting");
    }
    if (([v11 isDoingAnything] & 1) == 0
      && [v8 isDoingAnything])
    {
      -[NIServerFindableDeviceProxySessionManager _setUpAlgorithmsContainerForToken:]( self,  "_setUpAlgorithmsContainerForToken:",  v6);
    }

    if ([v11 isDoingAnything]
      && ([v8 isDoingAnything] & 1) == 0)
    {
      -[NIServerFindableDeviceProxySessionManager _tearDownAlgorithmsContainerForToken:]( self,  "_tearDownAlgorithmsContainerForToken:",  v6);
    }

    if (([v11 hasReceivedRangingData] & 1) == 0
      && [v8 hasReceivedRangingData])
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 updatesEngine]);
      [v29 acceptDiscoveryEventForPeer:v6];

      id v30 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 analyticsManager]);
      size_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[_FindableDeviceAlgorithmsContainer configurationForContainerObjects]( &OBJC_CLASS____FindableDeviceAlgorithmsContainer,  "configurationForContainerObjects"));
      [v31 sessionSuccessfullyRanWithConfig:v32 withTimestamp:sub_100023CC4()];
    }

    if ([v11 isAttemptingToRange]
      && ([v8 isAttemptingToRange] & 1) == 0)
    {
      -[NIServerFindableDeviceProxySessionManager _tearDownAlgorithmsContainerForToken:]( self,  "_tearDownAlgorithmsContainerForToken:",  v6);
      -[NIServerFindableDeviceProxySessionManager _setUpAlgorithmsContainerForToken:]( self,  "_setUpAlgorithmsContainerForToken:",  v6);
    }

    if ([v8 discoveryState] == 2)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 analyticsManager]);
      [v34 updateWithAcquisitionReason:1];
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 analyticsManager]);
      [v34 updateWithAcquisitionReason:3];
    }

LABEL_66:
    if (([v11 tellClientAboutPeer] & 1) == 0
      && [v8 tellClientAboutPeer])
    {
      id v35 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sent: %@",  @"NILocalDeviceStartedInteractingWithTokenNotification"));
        id v37 = sub_100277A70((uint64_t)"NotifiedClient", 0, v6, v36);
        id v38 = (id)objc_claimAutoreleasedReturnValue(v37);
        *(_DWORD *)v55 = 138412290;
        id v56 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v55, 0xCu);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"NILocalDeviceStartedInteractingWithTokenNotification",  0LL,  0LL,  1u);
    }

    if ([v11 tellClientAboutPeer]
      && ([v8 tellClientAboutPeer] & 1) == 0)
    {
      id v40 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Sent: %@",  @"NILocalDeviceStoppedInteractingWithTokenNotification"));
        id v42 = sub_100277A70((uint64_t)"NotifiedClient", 0, v6, v41);
        id v43 = (id)objc_claimAutoreleasedReturnValue(v42);
        *(_DWORD *)v55 = 138412290;
        id v56 = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v55, 0xCu);
      }

      NSErrorUserInfoKey v44 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( v44,  @"NILocalDeviceStoppedInteractingWithTokenNotification",  0LL,  0LL,  1u);
    }

    if ([v11 isDoingAnything]
      && ([v8 isDoingAnything] & 1) == 0)
    {
      unint64_t v45 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = sub_100277A70((uint64_t)"SessionStopped", 0, v6, 0LL);
        id v47 = (id)objc_claimAutoreleasedReturnValue(v46);
        *(_DWORD *)v55 = 138412290;
        id v56 = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", v55, 0xCu);
      }

      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionInternal]);
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: SessionStopped",  v48));
      sub_100277C30(v49, p_sessionEventLogBuffer);
    }

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_advertiseAndRangeWithPeer:(id)a3 peerAdvertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NIServerFindableDeviceProxySessionManager _selectedTechnology](self, "_selectedTechnology");
  BOOL v9 = -[NIServerFindingRangingProvider canRangeWithPeer:technology:]( self->_rangingProvider,  "canRangeWithPeer:technology:",  v6,  v8);
  unsigned int v55 = [v7 canRange];
  if (v7) {
    [v7 supportedTechnologies];
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  BOOL v54 = sub_100278484(__p, v8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  id v10 = objc_alloc(&OBJC_CLASS___NIServerFindingAdvertisement);
  uint64_t v11 = (uint64_t)-[NIServerFindingDiscoveryProvider advertisingAddress](self->_discoveryProvider, "advertisingAddress");
  LODWORD(__p[0]) = v11;
  WORD2(__p[0]) = WORD2(v11);
  id v12 = -[NIServerFindingAdvertisement initForFinder:address:](v10, "initForFinder:address:", 0LL, __p);
  [v12 setCanRange:v9];
  objc_msgSend(v12, "setUseCase:", objc_msgSend(v7, "useCase"));
  unsigned int v13 = operator new(4uLL);
  v60 = v13;
  *unsigned int v13 = v8;
  __int128 v61 = v13 + 1;
  v62 = v13 + 1;
  [v12 setSupportedTechnologies:&v60];
  if (v60)
  {
    __int128 v61 = v60;
    operator delete(v60);
  }

  [v12 setProtocolVersion:1];
  uint64_t v14 = sub_100288340();
  uint64_t v15 = (void *)*((void *)v14 + 406);
  id v16 = (std::__shared_weak_count *)*((void *)v14 + 407);
  __p[0] = v15;
  __p[1] = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }

  sub_100267408((uint64_t)v15);
  int v19 = sub_10032B934((unsigned __int8 **)v59);
  if (v59[0])
  {
    v59[1] = v59[0];
    operator delete(v59[0]);
  }

  if (v16)
  {
    v20 = (unint64_t *)&v16->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  BOOL v53 = v9;
  if ([v7 narrowBandMask])
  {
    unsigned int v22 = [v7 narrowBandMask];
  }

  else
  {
    id v23 = operator new(1uLL);
    id v56 = v23;
    *id v23 = 1;
    unint64_t v57 = v23 + 1;
    uint64_t v58 = v23 + 1;
    unsigned int v22 = sub_10032B934((unsigned __int8 **)&v56);
    if (v56)
    {
      unint64_t v57 = v56;
      operator delete(v56);
    }
  }

  int v24 = v22 & v19;
  [v12 setNarrowBandMask:v22 & v19];
  v25 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v26 = [v7 narrowBandMask];
    LODWORD(__p[0]) = 67109632;
    HIDWORD(__p[0]) = v26;
    LOWORD(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 2) = v19;
    HIWORD(__p[1]) = 1024;
    LODWORD(__p[2]) = v22 & v19;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Finder nb_mask %hu, findee nb_mask %hu, shared nb_mask %hu",  (uint8_t *)__p,  0x14u);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 nbUwbAcquisitionChannelIdx]);
  BOOL v29 = v28 == 0LL;

  if (v29)
  {
    id v52 = v6;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"FindingNapChannel"]);

    if (v31 && (uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNumber, v32), (objc_opt_isKindOfClass(v31, v33) & 1) != 0))
    {
      unsigned __int8 v34 = [v31 intValue];
      id v35 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p[0]) = 67109120;
        HIDWORD(__p[0]) = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Using NAP channel %d from defaults writes",  (uint8_t *)__p,  8u);
      }
    }

    else
    {
      id v36 = (void *)objc_claimAutoreleasedReturnValue([v52 getIRK]);
      if (!v36) {
        __assert_rtn( "_pickRandomNbUwbAcquisitionChannelInGivenRange",  "NIServerFindableDeviceProxySessionManager.mm",  2554,  "IRK != nil");
      }
      id v37 = v36;
      unint64_t v38 = SipHash([v37 bytes], &unk_100425BE0, 8);

      unsigned __int8 v34 = v38 % 7 + 5;
    }

    NSErrorUserInfoKey v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v34));
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:]( self,  "_updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:",  v52,  v39);
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  NSErrorUserInfoKey v41 = (void *)objc_claimAutoreleasedReturnValue([v40 nbUwbAcquisitionChannelIdx]);
  if (!v41) {
    __assert_rtn( "-[NIServerFindableDeviceProxySessionManager _advertiseAndRangeWithPeer:peerAdvertisement:]",  "NIServerFindableDeviceProxySessionManager.mm",  1435,  "[_peerTracking objectForKey:token].nbUwbAcquisitionChannelIdx != nil");
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 nbUwbAcquisitionChannelIdx]);
  [v12 setNbUwbAcquisitionChannelIdx:v43];

  double v44 = sub_1002777EC(@"FindingBTAdvertisingTimeoutSecondsOverride", 120.0);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:]( self,  "_updatePeerTrackingForToken:newAdvertisingState:",  v6,  1LL);
  unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider startAdvertisingToPeer:advertisement:timeout:]( self->_discoveryProvider,  "startAdvertisingToPeer:advertisement:timeout:",  v6,  v12,  v44));
  if (v45 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_10039643C();
  }
  if (v24) {
    BOOL v46 = v54;
  }
  else {
    BOOL v46 = 0;
  }
  if ((v53 & v55) == 1 && v46)
  {
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:]( self,  "_updatePeerTrackingForToken:newRangingState:",  v6,  1LL);
    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_peerTracking, "objectForKey:", v6));
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 nbUwbAcquisitionChannelIdx]);
    LOBYTE(__p[0]) = [v48 intValue];
    BYTE1(__p[0]) = v24;

    v49 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:]( self->_rangingProvider,  "startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:",  v6,  v8,  v7,  __p));
    if (v49)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003963DC();
      }
      -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:]( self,  "_updatePeerTrackingForToken:newRangingState:",  v6,  4LL);
    }
  }

  else
  {
    v50 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = sub_100278458(v8);
      LODWORD(__p[0]) = 136316162;
      *(void **)((char *)__p + 4) = (void *)v51;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v53;
      WORD1(__p[2]) = 1024;
      HIDWORD(__p[2]) = v55;
      __int16 v64 = 1024;
      BOOL v65 = v54;
      __int16 v66 = 1024;
      int v67 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Not attempting to range (selectedTech: %s). localDeviceCanRange: %d. peerDeviceCanRange: %d. peerDev iceSupportsTech: %d. sharedNBMask: %d",  (uint8_t *)__p,  0x24u);
    }
  }
}

- (int)_selectedTechnology
{
  rangingProvider = self->_rangingProvider;
  if (rangingProvider)
  {
    -[NIServerFindingRangingProvider supportedTechnologies](rangingProvider, "supportedTechnologies");
  }

  else
  {
    __p = 0LL;
    id v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  if (sub_100278484(&__p, 1))
  {
    int v3 = 1;
  }

  else if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild") && sub_100278484(&__p, 2))
  {
    int v3 = 2;
  }

  else
  {
    int v3 = 0;
  }

  if (__p)
  {
    id v6 = __p;
    operator delete(__p);
  }

  return v3;
}

- (id)_setTokenCacheForGroup:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v4));
  id v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NIServerKeychainItem);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_groupedFindableTokens, "objectForKey:", v4));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[NIDiscoveryToken serialize:](&OBJC_CLASS___NIDiscoveryToken, "serialize:", v8));
    id v10 = -[NIServerKeychainItem initWithService:account:data:]( v7,  "initWithService:account:data:",  @"FindingTokens",  v4,  v9);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](&OBJC_CLASS___NIServerKeychainManager, "sharedInstance"));
    LOBYTE(v7) = [v11 writeItem:v10 synchronizable:0 systemKeychain:0];

    if ((v7 & 1) != 0)
    {
      id v12 = 0LL;
    }

    else
    {
      NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
      unint64_t v18 = @"Tokens not fully cached";
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v15));
    }

    goto LABEL_8;
  }

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerKeychainManager sharedInstance](&OBJC_CLASS___NIServerKeychainManager, "sharedInstance"));
  uint64_t v14 = [v13 deleteItemWithService:@"FindingTokens" account:v4 synchronizable:0 systemKeychain:0];

  if ((v14 & 1) == 0)
  {
    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    v20 = @"Tokens not fully deleted";
    id v10 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v10));
LABEL_8:

    goto LABEL_9;
  }

  id v12 = 0LL;
LABEL_9:

  return v12;
}

- (id)_tokensFromAllGroups
{
  int v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  groupedFindableTokens = self->_groupedFindableTokens;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10019F6F8;
  v7[3] = &unk_1007B4148;
  dispatch_queue_attr_t v5 = v3;
  uint64_t v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( groupedFindableTokens,  "enumerateKeysAndObjectsUsingBlock:",  v7);

  return v5;
}

- (BOOL)_isTokenFindable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  groupedFindableTokens = self->_groupedFindableTokens;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10019F7D0;
  v8[3] = &unk_1007B4170;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( groupedFindableTokens,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  LOBYTE(groupedFindableTokens) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)groupedFindableTokens;
}

- (BOOL)_shouldHoldOSTransactionWhileFindable
{
  BOOL v2 = 1;
  int v3 = sub_100277758(1);
  if (v3 != 19)
  {
    if (v3 != 26) {
      sub_10039649C();
    }
    return 0;
  }

  return v2;
}

- (void)_setUpAlgorithmsContainerForToken:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v7));

  if (!v4)
  {
    peerAlgorithmContainers = self->_peerAlgorithmContainers;
    id v6 = -[_FindableDeviceAlgorithmsContainer initWithToken:queue:delegate:]( objc_alloc(&OBJC_CLASS____FindableDeviceAlgorithmsContainer),  "initWithToken:queue:delegate:",  v7,  self->_queue,  self);
    -[NSMutableDictionary setObject:forKey:](peerAlgorithmContainers, "setObject:forKey:", v6, v7);
  }
}

- (void)_tearDownAlgorithmsContainerForToken:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v7));

  if (v4)
  {
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v7));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 updatesEngine]);
    [v6 invalidate];

    -[NSMutableDictionary removeObjectForKey:](self->_peerAlgorithmContainers, "removeObjectForKey:", v7);
  }
}

- (void)_kickKeepAliveForPeer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keepAliveTimeoutsSeconds,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_keepAliveTimeoutTimers, "objectForKey:", v4));
    id v7 = v6;
    if (v6)
    {
      dispatch_source_cancel(v6);
      -[NSMutableDictionary removeObjectForKey:](self->_keepAliveTimeoutTimers, "removeObjectForKey:", v4);
    }

    else
    {
      uint64_t v8 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = sub_100277A70((uint64_t)"KeepAlive", 0, v4, @"Started");
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        *(_DWORD *)__int128 buf = 138412290;
        unsigned int v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
      }
    }

    uint64_t v11 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);

    [v5 doubleValue];
    dispatch_time_t v13 = dispatch_time(0LL, (unint64_t)(v12 * 1000000000.0));
    dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak((id *)buf, self);
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    NSErrorUserInfoKey v17 = sub_10019FC6C;
    unint64_t v18 = &unk_1007A2060;
    objc_copyWeak(&v20, (id *)buf);
    id v14 = v4;
    id v19 = v14;
    dispatch_source_set_event_handler(v11, &v15);
    dispatch_resume(v11);
    -[NSMutableDictionary setObject:forKey:]( self->_keepAliveTimeoutTimers,  "setObject:forKey:",  v11,  v14,  v15,  v16,  v17,  v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_configureKeepAliveTimeoutForPeer:(id)a3 useCase:(int)a4 isKeepAliveBluetooth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v9 = sub_1002778A8(a4, v5);
  if (v9 > 0.0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keepAliveTimeoutsSeconds,  "objectForKeyedSubscript:",  v8));

    if (!v10)
    {
      id v14 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Configure. BT: %d. Timeout: %0.1f s",  v5,  *(void *)&v9));
        id v21 = sub_100277A70((uint64_t)"KeepAlive", 0, v8, v20);
        unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)__int128 buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
      }

      goto LABEL_9;
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keepAliveTimeoutsSeconds,  "objectForKeyedSubscript:",  v8));
    [v11 doubleValue];
    double v13 = v12;

    if (v9 < v13)
    {
      id v14 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keepAliveTimeoutsSeconds,  "objectForKeyedSubscript:",  v8));
        [v15 doubleValue];
        NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Reconfigure. BT: %d. Timeout: %0.1f s -> %0.1f s",  v5,  v16,  *(void *)&v9));
        id v18 = sub_100277A70((uint64_t)"KeepAlive", 0, v8, v17);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)__int128 buf = 138412290;
        v25 = v19;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
      }

- (BOOL)_shouldInteract
{
  return self->_rangingAvailable;
}

- (id)_enableInteractionWithPersistedTokens
{
  int v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Enable interaction with persisted tokens",  buf,  2u);
  }

  if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _tokensFromAllGroups](self, "_tokensFromAllGroups"));
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:]( self->_discoveryProvider,  "setPeersEligibleForDiscovery:requestScan:",  v4,  1LL));
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100396584();
      }
      id v6 = v5;
    }

    unsigned int v7 = -[NIServerFindingRangingProvider rangingTriggerType](self->_rangingProvider, "rangingTriggerType");
    id v8 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = v7 ? "TriggerRequired" : "NoTriggerRequired";
      sub_1000065CC(buf, v9);
      id v10 = v14 >= 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,ranging trigger type = %s",  v15,  0xCu);
      if (v14 < 0) {
        operator delete(*(void **)buf);
      }
    }

    if (!v7)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1001A0400;
      v12[3] = &unk_1007B4198;
      v12[4] = self;
      [v4 enumerateObjectsUsingBlock:v12];
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003965E4();
    }
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  0LL));
  }

  return v5;
}

- (void)_disableInteractionAndKeepPersistedTokens
{
  int v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-proxy,Disable all interaction. Keep persisted tokens.",  buf,  2u);
  }

  if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract"))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100396610();
    }
  }

  else
  {
    *(void *)__int128 buf = 0LL;
    unsigned int v7 = buf;
    uint64_t v8 = 0x3032000000LL;
    double v9 = sub_100199D9C;
    id v10 = sub_100199DAC;
    id v11 = (id)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider setPeersEligibleForDiscovery:requestScan:]( self->_discoveryProvider,  "setPeersEligibleForDiscovery:requestScan:",  0LL,  0LL));
    if (*((void *)v7 + 5) && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039663C();
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerFindableDeviceProxySessionManager _tokensFromAllGroups](self, "_tokensFromAllGroups"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1001A0808;
    v5[3] = &unk_1007B41C0;
    v5[4] = self;
    v5[5] = buf;
    [v4 enumerateObjectsUsingBlock:v5];

    _Block_object_dispose(buf, 8);
  }

- (void)didDiscoverPeer:(id)a3 advertisement:(id)a4 overBluetooth:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BT: %d. PeerAdv: %@",  v5,  v9));
    id v12 = sub_100277A70((uint64_t)"DiscoveredPeer", 0, v8, v11);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)__int128 buf = 138412290;
    unsigned int v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v15 = sub_100277B78(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  NSErrorUserInfoKey v17 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptionInternal]);
  id v18 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Peer: %@. BT: %d. Adv: %@",  v16,  v17,  v5,  v9));
  lastDiscoveryEvent = self->_lastDiscoveryEvent;
  self->_lastDiscoveryEvent = v18;

  if (v5) {
    uint64_t v20 = 2LL;
  }
  else {
    uint64_t v20 = 1LL;
  }
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newDiscoveryState:]( self,  "_updatePeerTrackingForToken:newDiscoveryState:",  v8,  v20);
  -[NIServerFindableDeviceProxySessionManager _advertiseAndRangeWithPeer:peerAdvertisement:]( self,  "_advertiseAndRangeWithPeer:peerAdvertisement:",  v8,  v9);
  -[NIServerFindableDeviceProxySessionManager _configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:]( self,  "_configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:",  v8,  [v9 useCase],  v5);
  -[NIServerFindableDeviceProxySessionManager _kickKeepAliveForPeer:](self, "_kickKeepAliveForPeer:", v8);
}

- (void)didLosePeer:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A70((uint64_t)"LostPeer", 0, v4, 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v9, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:]( self->_discoveryProvider,  "stopAdvertisingToPeer:",  v4));
  if (v8 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_100396524();
  }
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:]( self,  "_updatePeerTrackingForToken:newAdvertisingState:",  v4,  2LL);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newDiscoveryState:]( self,  "_updatePeerTrackingForToken:newDiscoveryState:",  v4,  4LL);
}

- (void)didStopAdvertisingToPeer:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A70((uint64_t)"NotifyStopAdv", 0, v4, 0LL);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:]( self,  "_updatePeerTrackingForToken:newAdvertisingState:",  v4,  2LL);
}

- (void)didGenerateAdvertisement:(id)a3 toSendOOBToPeer:(id)a4
{
  id v17 = a3;
  id v18 = a4;
  id v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"SelfAdv: %@", v17));
    id v8 = sub_100277A70((uint64_t)"GeneratedAdv", 0, v18, v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v17 byteRepresentation]);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = self->_observers;
  id v12 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      char v14 = 0LL;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v14);
        if (v15)
        {
          uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v22 + 1) + 8 * (void)v14) getQueueForInputingData]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1001A10F4;
          block[3] = &unk_1007B14B8;
          void block[4] = v15;
          id v20 = v10;
          id v21 = v18;
          dispatch_async(v16, block);
        }

        char v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    }

    while (v12);
  }
}

- (void)bluetoothDiscoveryFinishedActivating
{
  int v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = sub_100277A70((uint64_t)"DiscActivated", 0, 0LL, 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 138412290;
    unsigned int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)bluetoothDiscoveryBecameUnavailable
{
  int v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Previous: %d",  self->_bluetoothDiscoveryAvailable));
    id v5 = sub_100277A70((uint64_t)"DiscUnavailable", 0, 0LL, v4);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)__int128 buf = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_bluetoothDiscoveryAvailable)
  {
    self->_bluetoothDiscoveryAvailable = 0;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BT available: %d",  0LL));
    sub_100277C30(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (!-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract")) {
      -[NIServerFindableDeviceProxySessionManager _disableInteractionAndKeepPersistedTokens]( self,  "_disableInteractionAndKeepPersistedTokens");
    }
  }

- (void)bluetoothDiscoveryBecameAvailable
{
  int v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Previous: %d",  self->_bluetoothDiscoveryAvailable));
    id v5 = sub_100277A70((uint64_t)"DiscAvailable", 0, 0LL, v4);
    int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)__int128 buf = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_bluetoothDiscoveryAvailable)
  {
    self->_bluetoothDiscoveryAvailable = 1;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BT available: %d",  1LL));
    sub_100277C30(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract")) {
      id v8 =  -[NIServerFindableDeviceProxySessionManager _enableInteractionWithPersistedTokens]( self,  "_enableInteractionWithPersistedTokens");
    }
  }

- (void)didRangeWithPeer:(id)a3 newSolution:(const void *)a4
{
  id v6 = a3;
  if (*((_DWORD *)a4 + 8) != 1)
  {
    id v18 = "solution.type == rose::RoseSolutionType::RoseRawOnly";
    int v19 = 1992;
    goto LABEL_12;
  }

  if (!*((_BYTE *)a4 + 600))
  {
    id v18 = "solution.raw_rose_measurement.has_value()";
    int v19 = 1993;
LABEL_12:
    __assert_rtn( "-[NIServerFindableDeviceProxySessionManager didRangeWithPeer:newSolution:]",  "NIServerFindableDeviceProxySessionManager.mm",  v19,  v18);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v8 = sub_100277B78(v7);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 descriptionInternal]);
    id v11 = (void *)v10;
    if (!*((_BYTE *)a4 + 600)) {
      sub_100006080();
    }
    id v12 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Peer: %@. Range: %0.2f m",  v9,  v10,  *((void *)a4 + 44)));
    lastRangingMeasurement = self->_lastRangingMeasurement;
    self->_lastRangingMeasurement = v12;

    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:]( self,  "_updatePeerTrackingForToken:newRangingState:",  v6,  3LL);
    if (!*((_BYTE *)a4 + 600)) {
      sub_100006080();
    }
    -[NIServerFindableDeviceProxySessionManager _nearbydLogRange:token:]( self,  "_nearbydLogRange:token:",  v6,  *((double *)a4 + 44));
    uint64_t v14 = *((void *)a4 + 5);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
    [v15 setCurrentSolutionMacAddress:v14];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 updatesEngine]);
    [v17 acceptRoseSolution:a4];

    -[NIServerFindableDeviceProxySessionManager _kickKeepAliveForPeer:](self, "_kickKeepAliveForPeer:", v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100396764();
  }
}

- (void)didAttemptRangingWithPeer:(id)a3 unsuccessfulSolution:(const void *)a4
{
  id v6 = a3;
  if (!*((_BYTE *)a4 + 600)) {
    __assert_rtn( "-[NIServerFindableDeviceProxySessionManager didAttemptRangingWithPeer:unsuccessfulSolution:]",  "NIServerFindableDeviceProxySessionManager.mm",  2019,  "solution.raw_rose_measurement.has_value()");
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    unsigned int v7 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = sub_100277A70((uint64_t)"RangeFailure", 0, v6, 0LL);
      int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      sub_1003967BC(v9, (uint64_t)v20, v7);
    }

    if (*((_BYTE *)a4 + 600) && *((_WORD *)a4 + 72) == 96)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v11 = sub_100277B78(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionInternal]);
      uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Peer: %@",  v12,  v13));
      lastRangingPoll = self->_lastRangingPoll;
      self->_lastRangingPoll = v14;

      -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:]( self,  "_updatePeerTrackingForToken:newRangingState:",  v6,  2LL);
      -[NIServerFindableDeviceProxySessionManager _kickKeepAliveForPeer:](self, "_kickKeepAliveForPeer:", v6);
    }

    uint64_t v16 = *((void *)a4 + 5);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
    [v17 setCurrentSolutionMacAddress:v16];

    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v6));
    int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 updatesEngine]);
    [v19 acceptUnsuccessfulRoseSolution:a4];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100396790();
  }
}

- (void)_nearbydLogRange:(double)a3 token:(id)a4
{
  id v6 = a4;
  double v7 = sub_100023CC4();
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Range: %0.2f m",  *(void *)&a3));
  id v9 = sub_100277A70((uint64_t)"RangeSuccess", 0, v6, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  id v11 = (os_log_s *)qword_1008000A0;
  if (v7 - self->_lastLogMachContTime <= 5.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_100396808();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
    }

    self->_lastLogMachContTime = v7;
  }
}

- (void)didStopRangingWithPeer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A70((uint64_t)"NotifyStopRange", 0, v4, 0LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindableDeviceProxySessionManager _handleRangingTerminatedCallbackForPeer:]( self,  "_handleRangingTerminatedCallbackForPeer:",  v4);
}

- (void)didRangingAuthorizationFailForPeer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A70((uint64_t)"NotifyAuthFail", 0, v4, 0LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NIServerFindableDeviceProxySessionManager _handleRangingTerminatedCallbackForPeer:]( self,  "_handleRangingTerminatedCallbackForPeer:",  v4);
}

- (void)_handleRangingTerminatedCallbackForPeer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingDiscoveryProvider stopAdvertisingToPeer:]( self->_discoveryProvider,  "stopAdvertisingToPeer:",  v4));
    if (v5 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100396524();
    }
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newAdvertisingState:]( self,  "_updatePeerTrackingForToken:newAdvertisingState:",  v4,  2LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider stopRangingWithPeer:]( self->_rangingProvider,  "stopRangingWithPeer:",  v4));
    if (v6 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003964C4();
    }
    -[NIServerFindableDeviceProxySessionManager _updatePeerTrackingForToken:newRangingState:]( self,  "_updatePeerTrackingForToken:newRangingState:",  v4,  4LL);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039686C();
  }
}

- (void)didReceiveRangingDataForPeer:(id)a3 algorithmAidingData:(const void *)a4 signallingData:(const void *)a5
{
  id v10 = a3;
  if (*((_BYTE *)a5 + 7)) {
    -[NIServerFindableDeviceProxySessionManager _updateReceivedSignalFlags:toPeerTrackingForToken:]( self,  "_updateReceivedSignalFlags:toPeerTrackingForToken:",  *((unsigned __int8 *)a5 + 6),  v10);
  }
  int v7 = *((unsigned __int8 *)a5 + 8);
  int v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_peerAlgorithmContainers,  "objectForKeyedSubscript:",  v10));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 updatesEngine]);
  [v9 acceptPeerDeviceType:v7 != 0];
}

- (void)rangingBecameUnavailable
{
  int v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Previous: %d",  self->_rangingAvailable));
    id v5 = sub_100277A70((uint64_t)"RangeUnavailable", 0, 0LL, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)__int128 buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_rangingAvailable)
  {
    self->_rangingAvailable = 0;
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ranging available: %d",  0LL));
    sub_100277C30(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (!-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract")) {
      -[NIServerFindableDeviceProxySessionManager _disableInteractionAndKeepPersistedTokens]( self,  "_disableInteractionAndKeepPersistedTokens");
    }
  }

- (void)rangingBecameAvailable
{
  int v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Previous: %d",  self->_rangingAvailable));
    id v5 = sub_100277A70((uint64_t)"RangeAvailable", 0, 0LL, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)__int128 buf = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-proxy,%@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_rangingAvailable)
  {
    self->_rangingAvailable = 1;
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Ranging available: %d",  1LL));
    sub_100277C30(v7, &self->_miscEventLogBuffer.__map_.__first_);

    if (-[NIServerFindableDeviceProxySessionManager _shouldInteract](self, "_shouldInteract")) {
      id v8 =  -[NIServerFindableDeviceProxySessionManager _enableInteractionWithPersistedTokens]( self,  "_enableInteractionWithPersistedTokens");
    }
  }

- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5
{
  id v7 = a5;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_100396898();
  }
  -[NIServerFindingRangingProvider setAlgorithmAidingData:forPeer:]( self->_rangingProvider,  "setAlgorithmAidingData:forPeer:",  a4,  v7);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#find-proxy,didUpdateLocations", buf, 2u);
  }

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 lastObject]);
    id v8 = v7;
    if (v7)
    {
      [v7 coordinate];
      uint64_t v36 = v9;
      [v8 coordinate];
      uint64_t v35 = v10;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 timestamp]);
      [v11 timeIntervalSinceReferenceDate];
      uint64_t v34 = v12;
      [v8 course];
      uint64_t v14 = v13;
      [v8 courseAccuracy];
      uint64_t v16 = v15;
      [v8 speed];
      uint64_t v18 = v17;
      [v8 speedAccuracy];
      uint64_t v20 = v19;
      [v8 horizontalAccuracy];
      uint64_t v22 = v21;
      [v8 verticalAccuracy];
      uint64_t v24 = v23;
      [v8 altitude];
      uint64_t v26 = v25;
      [v8 ellipsoidalAltitude];
      uint64_t v28 = v27;
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v8 floor]);
      unsigned int v30 = [v29 level];
      unsigned int v31 = [v8 type];
      unsigned int v32 = [v8 signalEnvironmentType];

      peerAlgorithmContainers = self->_peerAlgorithmContainers;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1001A2554;
      v37[3] = &unk_1007B41E0;
      v37[4] = v36;
      v37[5] = v35;
      v37[6] = v34;
      v37[7] = v14;
      v37[8] = v16;
      v37[9] = v18;
      v37[10] = v20;
      v37[11] = v22;
      v37[12] = v24;
      v37[13] = v26;
      v37[14] = v28;
      unsigned int v38 = v30;
      unsigned int v39 = v31;
      unsigned int v40 = v32;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( peerAlgorithmContainers,  "enumerateKeysAndObjectsUsingBlock:",  v37);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003968F0();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003968C4();
  }
}

- (void)DataCallback:(id)a3
{
  id v4 = a3;
  peerAlgorithmContainers = self->_peerAlgorithmContainers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001A2640;
  v7[3] = &unk_1007B4208;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( peerAlgorithmContainers,  "enumerateKeysAndObjectsUsingBlock:",  v7);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [v5 code];
  if (v6)
  {
    if (v6 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_10039697C();
      }
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10039691C();
      }
      -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
      -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    }
  }

  else
  {
    id v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-proxy,location is unknown", v8, 2u);
    }
  }
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture");
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  peerAlgorithmContainers = self->_peerAlgorithmContainers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001A2884;
  v7[3] = &unk_1007B4208;
  id v6 = v4;
  id v8 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( peerAlgorithmContainers,  "enumerateKeysAndObjectsUsingBlock:",  v7);
}

- (id)getQueueForInputingData
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  return self;
}

@end