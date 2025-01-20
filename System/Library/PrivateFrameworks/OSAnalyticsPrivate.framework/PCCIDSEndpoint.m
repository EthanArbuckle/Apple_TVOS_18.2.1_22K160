@interface PCCIDSEndpoint
- (BOOL)isDeviceNearby:(id)a3;
- (PCCIDSEndpoint)init;
- (id)deviceIds;
- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)send:(id)a3 message:(id)a4 error:(id *)a5;
- (id)serviceByDeviceID:(id)a3;
- (id)startService:(id)a3;
- (void)runWithDelegate:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
@end

@implementation PCCIDSEndpoint

- (PCCIDSEndpoint)init
{
  if (objc_opt_class())
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PCCIDSEndpoint;
    v3 = -[PCCIDSEndpoint init](&v7, sel_init);
    if (v3)
    {
      uint64_t v4 = objc_opt_new();
      serviceByDevice = v3->_serviceByDevice;
      v3->_serviceByDevice = (NSMutableDictionary *)v4;
    }
  }

  else
  {

    return 0LL;
  }

  return v3;
}

- (void)runWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PCCIDSEndpoint;
  -[PCCEndpoint runWithDelegate:](&v7, sel_runWithDelegate_, a3);
  -[PCCIDSEndpoint startService:](self, "startService:", @"com.apple.private.alloy.proxiedcrashcopier.icloud");
  uint64_t v4 = (IDSService *)objc_claimAutoreleasedReturnValue();
  homeDeviceService = self->_homeDeviceService;
  self->_homeDeviceService = v4;

  id v6 = -[PCCIDSEndpoint deviceIds](self, "deviceIds");
  if (*(_OWORD *)&self->_pairedWatchService == 0LL && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
    -[PCCIDSEndpoint runWithDelegate:].cold.1();
  }
}

- (id)startService:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x18960FF10]) initWithService:v4];
  [v5 accounts];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [v5 addDelegate:self queue:MEMORY[0x1895F8AE0]];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v5 accounts];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = [v8 count];
      [v5 devices];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 1024;
      int v15 = v9;
      __int16 v16 = 1024;
      int v17 = [v10 count];
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "IDS(%@) connected with %d accounts and %d devices",  (uint8_t *)&v12,  0x18u);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "IDS(%@) connected with no accounts.",  (uint8_t *)&v12,  0xCu);
    }

    v5 = 0LL;
  }

  return v5;
}

- (id)deviceIds
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary removeAllObjects](self->_serviceByDevice, "removeAllObjects");
  if (*(_OWORD *)&self->_pairedWatchService == 0LL) {
    return 0LL;
  }
  [MEMORY[0x189603FA8] array];
  id v57 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[IDSService devices](self->_pairedWatchService, "devices");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  " # Name/DeviceID        Model                Build      Near Pair Cntd Actv iCld",  buf,  2u);
  }

  v56 = self;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v70 = @"com.apple.private.alloy.proxiedcrashcopier";
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@:", buf, 0xCu);
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  obuint64_t j = v3;
  id v4 = v57;
  uint64_t v54 = [obj countByEnumeratingWithState:&v62 objects:v87 count:16];
  if (v54)
  {
    uint64_t v51 = *(void *)v63;
    uint64_t v44 = 138412290LL;
    do
    {
      for (uint64_t i = 0LL; i != v54; ++i)
      {
        if (*(void *)v63 != v51) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v7 = (void *)IDSCopyIDForDevice();
        int v8 = [v4 count];
        v86[0] = v7;
        v85[0] = @"id";
        v85[1] = @"name";
        [v6 name];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v9;
        v85[2] = @"model";
        [v6 modelIdentifier];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v86[2] = v10;
        v85[3] = @"build";
        [v6 productBuildVersion];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v86[3] = v11;
        v85[4] = @"nearby";
        objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v6, "isNearby"));
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        v85[5] = @"service";
        v86[4] = v12;
        v86[5] = @"com.apple.private.alloy.proxiedcrashcopier";
        [MEMORY[0x189603F68] dictionaryWithObjects:v86 forKeys:v85 count:6];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v13];

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v56->_serviceByDevice,  "setObject:forKeyedSubscript:",  v56->_pairedWatchService,  v7);
        __int16 v14 = (os_log_s *)MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          [v6 name];
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          [v6 modelIdentifier];
          id v46 = (id)objc_claimAutoreleasedReturnValue();
          [v6 productBuildVersion];
          int v15 = (void *)objc_claimAutoreleasedReturnValue();
          else {
            __int16 v16 = @" NO";
          }
          else {
            int v17 = @" NO";
          }
          else {
            uint64_t v18 = @" NO";
          }
          else {
            v19 = @" NO";
          }
          int v20 = [v6 isCloudConnected];
          *(_DWORD *)buf = 67111170;
          if (v20) {
            v21 = @"YES";
          }
          else {
            v21 = @" NO";
          }
          *(_DWORD *)v70 = v8 + 1;
          *(_WORD *)&v70[4] = 2112;
          *(void *)&v70[6] = v48;
          __int16 v71 = 2112;
          id v72 = v46;
          __int16 v73 = 2112;
          v74 = v15;
          __int16 v75 = 2112;
          v76 = v16;
          __int16 v77 = 2112;
          v78 = v17;
          __int16 v79 = 2112;
          v80 = v18;
          id v4 = v57;
          __int16 v81 = 2112;
          v82 = v19;
          __int16 v14 = (os_log_s *)MEMORY[0x1895F8DA0];
          __int16 v83 = 2112;
          v84 = v21;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%2d %-20@ %-20@ %-10@ %@  %@  %@  %@  %@",  buf,  0x58u);
        }

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v44;
          *(void *)v70 = v7;
          _os_log_impl(&dword_187E6F000, v14, OS_LOG_TYPE_DEFAULT, "   %@", buf, 0xCu);
        }
      }

      uint64_t v54 = [obj countByEnumeratingWithState:&v62 objects:v87 count:16];
    }

    while (v54);
  }

  v22 = v56;
  v23 = -[IDSService devices](v56->_homeDeviceService, "devices");
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v70 = @"com.apple.private.alloy.proxiedcrashcopier.icloud";
    _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@:", buf, 0xCu);
  }

  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id v47 = v23;
  uint64_t v53 = [v47 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v59;
    v24 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      for (uint64_t j = 0LL; j != v53; ++j)
      {
        if (*(void *)v59 != v52) {
          objc_enumerationMutation(v47);
        }
        v26 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        v27 = (void *)IDSCopyIDForDevice();
        int v28 = [v57 count];
        v29 = -[NSMutableDictionary objectForKeyedSubscript:](v22->_serviceByDevice, "objectForKeyedSubscript:", v27);
        if (v29)
        {
          int v55 = -1;
        }

        else
        {
          int v55 = v28 + 1;
          v67[0] = v27;
          v66[0] = @"id";
          v66[1] = @"name";
          [v26 name];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = v30;
          v66[2] = @"model";
          [v26 modelIdentifier];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v67[2] = v31;
          v66[3] = @"build";
          [v26 productBuildVersion];
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v67[3] = v32;
          v66[4] = @"nearby";
          objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v26, "isNearby"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v66[5] = @"service";
          v67[4] = v33;
          v67[5] = @"com.apple.private.alloy.proxiedcrashcopier.icloud";
          [MEMORY[0x189603F68] dictionaryWithObjects:v67 forKeys:v66 count:6];
          v34 = v22;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v57 addObject:v35];

          v22 = v34;
          v24 = (os_log_s *)MEMORY[0x1895F8DA0];

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v22->_serviceByDevice,  "setObject:forKeyedSubscript:",  v22->_homeDeviceService,  v27);
        }

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          [v26 name];
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 modelIdentifier];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 productBuildVersion];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          else {
            v37 = @" NO";
          }
          else {
            v38 = @" NO";
          }
          else {
            v39 = @" NO";
          }
          else {
            v40 = @" NO";
          }
          int v41 = [v26 isCloudConnected];
          *(_DWORD *)buf = 67111170;
          if (v41) {
            v42 = @"YES";
          }
          else {
            v42 = @" NO";
          }
          *(_DWORD *)v70 = v55;
          *(_WORD *)&v70[4] = 2112;
          *(void *)&v70[6] = v50;
          __int16 v71 = 2112;
          id v72 = v49;
          __int16 v73 = 2112;
          v74 = v36;
          __int16 v75 = 2112;
          v76 = v37;
          __int16 v77 = 2112;
          v78 = v38;
          __int16 v79 = 2112;
          v80 = v39;
          __int16 v81 = 2112;
          v82 = v40;
          v24 = (os_log_s *)MEMORY[0x1895F8DA0];
          v22 = v56;
          __int16 v83 = 2112;
          v84 = v42;
          _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%2d %-20@ %-20@ %-10@ %@  %@  %@  %@  %@",  buf,  0x58u);
        }

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v70 = v27;
          _os_log_impl(&dword_187E6F000, v24, OS_LOG_TYPE_DEFAULT, "   %@", buf, 0xCu);
        }
      }

      uint64_t v53 = [v47 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }

    while (v53);
  }

  return v57;
}

- (id)serviceByDeviceID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ![v4 isEqualToString:*MEMORY[0x18960FEE8]])
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceByDevice, "objectForKeyedSubscript:", v5);
    homeDeviceService = (IDSService *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    homeDeviceService = self->_pairedWatchService;
  }

  uint64_t v7 = homeDeviceService;
  if (!homeDeviceService) {
    homeDeviceService = self->_homeDeviceService;
  }
  int v8 = homeDeviceService;

  return v8;
}

- (BOOL)isDeviceNearby:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = -[PCCIDSEndpoint serviceByDeviceID:](self, "serviceByDeviceID:", v4);
  id v6 = v5;
  if (v5)
  {
    [v5 devices];
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (v4)
          {
            [v11 uniqueID];
            int v12 = (void *)objc_claimAutoreleasedReturnValue();
            char v13 = [v4 isEqualToString:v12];

            if ((v13 & 1) != 0) {
              goto LABEL_14;
            }
          }

          else if (objc_msgSend(v11, "isDefaultPairedDevice", (void)v15))
          {
LABEL_14:
            LOBYTE(v8) = objc_msgSend(v11, "isNearby", (void)v15);
            goto LABEL_15;
          }
        }

        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  v30[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  -[PCCIDSEndpoint serviceByDeviceID:](self, "serviceByDeviceID:", v8);
  v10 = (IDSService *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8) {
      id v11 = v8;
    }
    else {
      id v11 = (id)*MEMORY[0x18960FEE8];
    }
    [MEMORY[0x189604010] setWithObject:v11];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    pairedWatchService = self->_pairedWatchService;
    if (v10 == pairedWatchService) {
      uint64_t v14 = 200LL;
    }
    else {
      uint64_t v14 = 300LL;
    }
    if (v10 == pairedWatchService)
    {
      uint64_t v17 = *MEMORY[0x18960FEF0];
      v29[0] = *MEMORY[0x18960FEF8];
      v29[1] = v17;
      v30[0] = MEMORY[0x189604A88];
      v30[1] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:v29 count:2];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __int128 v15 = (void *)MEMORY[0x189604A60];
    }

    id v23 = 0LL;
    id v24 = 0LL;
    int v18 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:]( v10,  "sendMessage:toDestinations:priority:options:identifier:error:",  v9,  v12,  v14,  v15,  &v24,  &v23);
    id v16 = v24;
    id v19 = v23;
    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        [v9 objectForKeyedSubscript:@"messageType"];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "sent %@, tracking: %@", buf, 0x16u);
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        [v9 objectForKeyedSubscript:@"messageType"];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v21;
        __int16 v27 = 2112;
        id v28 = v19;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "sendMessage FAILED for %@: %@",  buf,  0x16u);
      }

      if (a5) {
        *a5 = v19;
      }
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Attempted to send message before connecting",  buf,  2u);
    }

    id v16 = 0LL;
  }

  return v16;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[PCCIDSEndpoint serviceByDeviceID:](self, "serviceByDeviceID:", v10);
  char v13 = (IDSService *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v10) {
      id v14 = v10;
    }
    else {
      id v14 = (id)*MEMORY[0x18960FEE8];
    }
    [MEMORY[0x189604010] setWithObject:v14];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == self->_pairedWatchService) {
      uint64_t v16 = 200LL;
    }
    else {
      uint64_t v16 = 300LL;
    }
    uint64_t v32 = *MEMORY[0x18960FF08];
    v33[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = (void *)[v17 mutableCopy];

    if (v13 == self->_pairedWatchService)
    {
      uint64_t v19 = MEMORY[0x189604A88];
      [v18 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960FEF8]];
      [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x18960FEF0]];
      if (-[PCCEndpoint fileTimeout](self, "fileTimeout"))
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[PCCEndpoint fileTimeout](self, "fileTimeout"));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x18960FF00]];
      }
    }

    id v26 = 0LL;
    id v27 = 0LL;
    int v21 = -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:]( v13,  "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:",  v11,  v12,  v15,  v16,  v18,  &v27,  &v26);
    id v22 = v27;
    id v23 = v26;
    BOOL v24 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        id v29 = v11;
        __int16 v30 = 2114;
        id v31 = v22;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "sent %{public}@, tracking: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      if (v24)
      {
        *(_DWORD *)buf = 138543618;
        id v29 = v11;
        __int16 v30 = 2114;
        id v31 = v23;
        _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "sendFile FAILED for %{public}@: %{public}@",  buf,  0x16u);
      }

      if (a6) {
        *a6 = v23;
      }
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Attempted to send file before connecting",  buf,  2u);
    }

    id v22 = 0LL;
  }

  return v22;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:incomingResourceAtURL:metadata:fromID:context:].cold.1(v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained handleFile:v11 from:v13 metadata:v12];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:identifier:hasBeenDeliveredWithContext:].cold.1( (uint64_t)v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained ack:v7 result:1 error:0];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serviceByDevice, "objectForKeyedSubscript:", v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_serviceByDevice,  "setObject:forKeyedSubscript:",  v10,  v13);
    }
  }

  [v12 objectForKeyedSubscript:@"messageType"];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:incomingMessage:fromID:].cold.1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained handleMessage:v12 from:v13];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = (__CFString *)a7;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[PCCIDSEndpoint service:account:identifier:didSendWithSuccess:error:].cold.1(v8, (uint64_t)v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  [WeakRetained ack:v10 result:v8 error:v11];
}

- (void).cxx_destruct
{
}

- (void)runWithDelegate:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "FAIL: no IDS accounts. Ensure the service plist is in place and try restarting identityservicesd.",  v0,  2u);
}

- (void)service:(void *)a1 account:incomingResourceAtURL:metadata:fromID:context:.cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 lastPathComponent];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_187E6F000, MEMORY[0x1895F8DA0], v3, "received file '%@'", v4, v5, v6, v7, 2u);
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 identifier:(uint64_t)a5 hasBeenDeliveredWithContext:(uint64_t)a6 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingMessage:(uint64_t)a5 fromID:(uint64_t)a6 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)service:(const __CFString *)a3 account:identifier:didSendWithSuccess:error:.cold.1( char a1,  uint64_t a2,  const __CFString *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = "OK";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "FAILED";
  }
  uint64_t v4 = &stru_18A161700;
  int v5 = 136315650;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  if (a3) {
    uint64_t v4 = a3;
  }
  __int16 v9 = 2112;
  id v10 = v4;
  _os_log_debug_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "msg callback %s tracked %@ %@",  (uint8_t *)&v5,  0x20u);
}

@end