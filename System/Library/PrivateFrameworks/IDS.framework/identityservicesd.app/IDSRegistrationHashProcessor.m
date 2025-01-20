@interface IDSRegistrationHashProcessor
- (IDSDAccountController)accountController;
- (IDSIDStatusQueryController)idStatusQueryController;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSPeerIDManager)peerIDManager;
- (IDSRateLimiter)negativeRegistrationUpdateCache;
- (IDSRegistrationHashProcessor)initWithAccountController:(id)a3 peerIDManager:(id)a4 negativeRegistrationUpdateCache:(id)a5 registrationKeyManager:(id)a6;
- (IDSRegistrationHashProcessorDelegate)delegate;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)devicesHashForURI:(id)a3 andService:(id)a4;
- (id)senderKeyDistributionManager;
- (void)handleRegistrationUpdateForHash:(id)a3 localURI:(id)a4 remoteURI:(id)a5 service:(id)a6 guid:(id)a7 forceUpdate:(BOOL)a8;
- (void)setAccountController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdStatusQueryController:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setNegativeRegistrationUpdateCache:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setRegistrationKeyManager:(id)a3;
@end

@implementation IDSRegistrationHashProcessor

- (IDSRegistrationHashProcessor)initWithAccountController:(id)a3 peerIDManager:(id)a4 negativeRegistrationUpdateCache:(id)a5 registrationKeyManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSRegistrationHashProcessor;
  v15 = -[IDSRegistrationHashProcessor init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountController, a3);
    objc_storeStrong((id *)&v16->_peerIDManager, a4);
    objc_storeStrong((id *)&v16->_negativeRegistrationUpdateCache, a5);
    objc_storeStrong((id *)&v16->_registrationKeyManager, a6);
  }

  return v16;
}

- (IDSKeyTransparencyVerifier)keyTransparencyVerifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance](&OBJC_CLASS___IDSKeyTransparencyVerifier, "sharedInstance");
}

- (IDSIDStatusQueryController)idStatusQueryController
{
  return +[IDSIDStatusQueryController sharedInstance](&OBJC_CLASS___IDSIDStatusQueryController, "sharedInstance");
}

- (id)senderKeyDistributionManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 senderKeyDistributionManager]);

  return v3;
}

- (id)devicesHashForURI:(id)a3 andService:(id)a4
{
  id v6 = a3;
  id v42 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationHashProcessor accountController](self, "accountController"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v7 appleIDAccountOnService:v42]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v43 lastGDRDate]);
  v41 = v8;
  v9 = v8;
  if (!v8) {
    goto LABEL_22;
  }
  [v8 timeIntervalSinceNow];
  double v11 = v10 >= 0.0 ? v10 : -v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"reg-hash-time-since-gdr"]);

  double v15 = 28800.0;
  if (v13)
  {
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v14);
    v9 = v41;
    if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
    {
      [v13 doubleValue];
      double v15 = v17;
    }
  }

  else
  {
    v9 = v41;
  }

  if (v11 < v15)
  {
    objc_super v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v43 registeredDevices]);
    id v20 = [v19 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v45;
      while (2)
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 URIs]);
          unsigned int v25 = [v24 containsObject:v6];

          if (v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v23 publicDeviceIdentity]);
            BOOL v27 = v26 == 0LL;

            if (v27)
            {
              uint64_t v34 = OSLogHandleForIDSCategory("IDSDAccount");
              v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v49 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Registered device missing public key! -- aborting hash {device: %@}",  buf,  0xCu);
              }

              if (os_log_shim_legacy_logging_enabled(v36)
                && _IDSShouldLog(0LL, @"IDSDAccount"))
              {
                _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Registered device missing public key! -- aborting hash {device: %@}");
              }

              goto LABEL_33;
            }

            v28 = (void *)objc_claimAutoreleasedReturnValue([v23 publicDeviceIdentity]);
            -[NSMutableSet addObject:](v18, "addObject:", v28);
          }
        }

        id v20 = [v19 countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationHashProcessor registrationKeyManager](self, "registrationKeyManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v29 publicMessageProtectionData]);

    if (v19)
    {
      -[NSMutableSet addObject:](v18, "addObject:", v19);
      v30 = sub_1003CCD80(v18);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 SHA256Data]);
      v33 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  &unk_100718148,  1LL);
      -[NSMutableData appendData:](v33, "appendData:", v32);
    }

    else
    {
      uint64_t v37 = OSLogHandleForIDSCategory("IDSDAccount");
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Local device missing public key! -- aborting hash",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v39)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Local device missing public key! -- aborting hash");
      }

- (void)handleRegistrationUpdateForHash:(id)a3 localURI:(id)a4 remoteURI:(id)a5 service:(id)a6 guid:(id)a7 forceUpdate:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v108 = a4;
  id v15 = a5;
  id v16 = a6;
  id v106 = a7;
  v107 = v14;
  if (v14 && !v8)
  {
    id v17 = [v14 length];
    unsigned __int8 v117 = 0;
    [v14 getBytes:&v117 length:1];
    if (v117 != 1)
    {
      uint64_t v41 = OSLogHandleForIDSCategory("IDSDAccount");
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = v117;
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v107 debugDescription]);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v119 = v43;
        *(_WORD *)&v119[4] = 2112;
        *(void *)&v119[6] = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Received unsupported query update hash {version: %d, hash: %@}",  buf,  0x12u);
      }

      if (os_log_shim_legacy_logging_enabled(v45)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        v97 = (void *)objc_claimAutoreleasedReturnValue([v107 debugDescription]);
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Received unsupported query update hash {version: %d, hash: %@}");
      }

      goto LABEL_65;
    }

    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subdataWithRange:", 1, 32));
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationHashProcessor peerIDManager](self, "peerIDManager"));
    id v124 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v124, 1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 endpointsForURIs:v19 service:v20 fromURI:v108]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v15]);

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v115 = 0u;
    __int128 v116 = 0u;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    id v24 = v22;
    id v25 = [v24 countByEnumeratingWithState:&v113 objects:v123 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v114;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v114 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v113 + 1) + 8 * (void)i) serializedPublicLegacyIdentity]);
          if (v28) {
            -[NSMutableSet addObject:](v23, "addObject:", v28);
          }
        }

        id v25 = [v24 countByEnumeratingWithState:&v113 objects:v123 count:16];
      }

      while (v25);
    }

    v29 = sub_1003CCD80(v23);
    v101 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v102 = (void *)objc_claimAutoreleasedReturnValue([v101 SHA256Data]);
    unsigned __int8 v30 = [v102 isEqualToData:v104];
    if ((v30 & 1) != 0)
    {
      uint64_t v31 = OSLogHandleForIDSCategory("IDSDAccount");
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = v117;
        id v34 = (id)objc_claimAutoreleasedReturnValue([v104 debugDescription]);
        uint64_t v35 = objc_claimAutoreleasedReturnValue([v102 debugDescription]);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v119 = v33;
        *(_WORD *)&v119[4] = 2112;
        *(void *)&v119[6] = v34;
        *(_WORD *)&v119[14] = 2112;
        uint64_t v36 = (void *)v35;
        *(void *)&v119[16] = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Query update hashes match -- doing nothing {version: %d, remoteHash: %@, localHash: %@}",  buf,  0x1Cu);
      }

      if (os_log_shim_legacy_logging_enabled(v37)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        unint64_t v38 = v117;
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v104 debugDescription]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v102 debugDescription]);
        v96 = v39;
        v99 = v40;
        v94 = (void *)v38;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Query update hashes match -- doing nothing {version: %d, remoteHash: %@, localHash: %@}");
LABEL_33:
      }
    }

    else
    {
      uint64_t v46 = OSLogHandleForIDSCategory("IDSDAccount");
      __int128 v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = (id)objc_claimAutoreleasedReturnValue([v104 debugDescription]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v102 debugDescription]);
        *(_DWORD *)buf = 138412546;
        *(void *)v119 = v48;
        *(_WORD *)&v119[8] = 2112;
        *(void *)&v119[10] = v49;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Query update hash does not match, we should clear {remoteHash: %@, localHash: %@}",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v50)
        && _IDSShouldLog(0LL, @"IDSDAccount"))
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v104 debugDescription]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v102 debugDescription]);
        v94 = v39;
        v96 = v40;
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDAccount",  @"Query update hash does not match, we should clear {remoteHash: %@, localHash: %@}");
        goto LABEL_33;
      }
    }

    if ((v30 & 1) != 0) {
      goto LABEL_65;
    }
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationHashProcessor negativeRegistrationUpdateCache]( self,  "negativeRegistrationUpdateCache",  v94,  v96,  v99));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v15 prefixedURI]);
  unsigned int v53 = [v51 underLimitForItem:v52];

  if (v53 | v8)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationHashProcessor negativeRegistrationUpdateCache]( self,  "negativeRegistrationUpdateCache"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v15 prefixedURI]);
    [v54 noteItem:v55];

    uint64_t v56 = OSLogHandleForIDSCategory("IDSDaemon");
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v119 = v15;
      *(_WORD *)&v119[8] = 2112;
      *(void *)&v119[10] = v108;
      *(_WORD *)&v119[18] = 2112;
      *(void *)&v119[20] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  " => Purging Peer ID Cache for: %@   caller URI: %@   service: %@",  buf,  0x20u);
    }

    if (os_log_shim_legacy_logging_enabled(v58) && _IDSShouldLog(0LL, @"IDSDaemon"))
    {
      id v98 = v108;
      id v100 = v16;
      id v95 = v15;
      *(void *)&double v59 = _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDaemon",  @" => Purging Peer ID Cache for: %@   caller URI: %@   service: %@").n128_u64[0];
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDServiceController sharedInstance]( &OBJC_CLASS___IDSDServiceController,  "sharedInstance",  v59,  v95,  v98,  v100));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    v103 = (void *)objc_claimAutoreleasedReturnValue([v60 adHocServicesForIdentifier:v61]);

    uint64_t v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "__imArrayByApplyingBlock:", &stru_100904258));
    v63 = (void *)v62;
    v64 = &__NSArray0__struct;
    if (v62) {
      v64 = (void *)v62;
    }
    id v105 = v64;

    v65 = (void *)objc_claimAutoreleasedReturnValue( +[IDSServerBag sharedInstanceForBagType:]( &OBJC_CLASS___IDSServerBag,  "sharedInstanceForBagType:",  0LL));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKey:@"should-clear-id-status-on-130"]);

    if (v66 && (uint64_t v68 = objc_opt_class(&OBJC_CLASS___NSNumber, v67), (objc_opt_isKindOfClass(v66, v68) & 1) != 0))
    {
      unsigned int v69 = [v66 BOOLValue];

      if (!v69)
      {
LABEL_62:
        v83 = objc_alloc(&OBJC_CLASS___NSMutableArray);
        v84 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        v85 = -[NSMutableArray initWithObjects:](v83, "initWithObjects:", v84, 0LL);

        -[NSMutableArray addObjectsFromArray:](v85, "addObjectsFromArray:", v105);
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationHashProcessor peerIDManager](self, "peerIDManager"));
        [v86 forgetPeerTokensForURI:v15 fromURI:v108 services:v85];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v88 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        v89 = (void *)objc_claimAutoreleasedReturnValue([v15 prefixedURI]);
        v90 = (void *)objc_claimAutoreleasedReturnValue([v108 prefixedURI]);
        [WeakRetained registrationHashProcessor:self didFlushCacheForService:v88 remoteURI:v89 localURI:v90 guid:v106];

        v91 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
        unsigned int v92 = [v91 isEqualToString:IDSServiceNameiMessage];

        if (v92)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationHashProcessor senderKeyDistributionManager]( self,  "senderKeyDistributionManager"));
          [v93 handleRemoteDeviceUpdateWithRemoteURI:v15 localURI:v108];
        }

        goto LABEL_65;
      }
    }

    else
    {
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
    unsigned int v74 = [v73 isEqualToString:@"com.apple.madrid"];

    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationHashProcessor idStatusQueryController](self, "idStatusQueryController"));
      v76 = (void *)objc_claimAutoreleasedReturnValue([v16 identifier]);
      [v75 removeCachedIDStatusForURI:v15 service:v76];

      __int128 v111 = 0u;
      __int128 v112 = 0u;
      __int128 v109 = 0u;
      __int128 v110 = 0u;
      id v77 = v105;
      id v78 = [v77 countByEnumeratingWithState:&v109 objects:v122 count:16];
      if (v78)
      {
        uint64_t v79 = *(void *)v110;
        do
        {
          for (j = 0LL; j != v78; j = (char *)j + 1)
          {
            if (*(void *)v110 != v79) {
              objc_enumerationMutation(v77);
            }
            uint64_t v81 = *(void *)(*((void *)&v109 + 1) + 8LL * (void)j);
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRegistrationHashProcessor idStatusQueryController](self, "idStatusQueryController"));
            [v82 removeCachedIDStatusForURI:v15 service:v81];
          }

          id v78 = [v77 countByEnumeratingWithState:&v109 objects:v122 count:16];
        }

        while (v78);
      }
    }

    goto LABEL_62;
  }

  uint64_t v70 = OSLogHandleForIDSCategory("IDSDaemon");
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)v119 = v15;
    *(_WORD *)&v119[8] = 2112;
    *(void *)&v119[10] = v16;
    *(_WORD *)&v119[18] = 2112;
    *(void *)&v119[20] = v108;
    __int16 v120 = 2112;
    id v121 = v106;
    _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "Received too many registration updates, ignoring {remoteURI: %@, service: %@, localURI: %@, guid: %@}",  buf,  0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled(v72) && _IDSShouldLog(0LL, @"IDSDaemon")) {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDaemon",  @"Received too many registration updates, ignoring {remoteURI: %@, service: %@, localURI: %@, guid: %@}");
  }
LABEL_65:
}

- (IDSRateLimiter)negativeRegistrationUpdateCache
{
  return self->_negativeRegistrationUpdateCache;
}

- (void)setNegativeRegistrationUpdateCache:(id)a3
{
}

- (IDSRegistrationHashProcessorDelegate)delegate
{
  return (IDSRegistrationHashProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void)setRegistrationKeyManager:(id)a3
{
}

- (void)setKeyTransparencyVerifier:(id)a3
{
}

- (void)setIdStatusQueryController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end