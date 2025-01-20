@interface UARPDynamicAssetPersonalization
- (BOOL)compareTssResponse:(id)a3;
- (BOOL)prepareDynamicAsset:(id)a3 error:(id *)a4;
- (BOOL)processDynamicAsset:(id *)a3;
- (BOOL)processTssResponse:(id)a3;
- (BOOL)tssRequest:(id)a3 error:(id *)a4;
- (NSDictionary)options;
- (NSURL)tatsuServerURL;
- (NSURL)url;
- (UARPAssetTag)tagIM4M;
- (UARPDynamicAssetPersonalization)init;
- (UARPDynamicAssetPersonalization)initWithEndpoint:(id)a3 url:(id)a4 tatsuServerURL:(id)a5;
- (UARPUploaderEndpoint)endpoint;
- (id)buildKey:(id)a3 forPayload:(id)a4;
- (id)buildTicketPrefixForPayload:(id)a3;
- (int64_t)assetNumber;
@end

@implementation UARPDynamicAssetPersonalization

- (UARPDynamicAssetPersonalization)init
{
  return 0LL;
}

- (UARPDynamicAssetPersonalization)initWithEndpoint:(id)a3 url:(id)a4 tatsuServerURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetPersonalization;
  v12 = -[UARPDynamicAssetPersonalization init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_tatsuServerURL, a5);
    os_log_t v14 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v13->_log;
    v13->_log = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.UARP.UARPPersonalization", 0LL);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = (char *)uarpAssetTagStructPersonalization();
    v19 = -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v18,  v18[1],  v18[2],  v18[3]);
    tagIM4M = v13->_tagIM4M;
    v13->_tagIM4M = v19;
  }

  return v13;
}

- (int64_t)assetNumber
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403906LL,  v2);
  if (v3)
  {
    [v3 valueAsNumber];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4) {
      int64_t v6 = [v4 integerValue];
    }
    else {
      int64_t v6 = -1LL;
    }
  }

  else
  {
    int64_t v6 = -1LL;
  }

  return v6;
}

- (NSDictionary)options
{
  v2 = (void *)MEMORY[0x189603F68];
  v3 = -[NSMutableArray firstObject](self->_options, "firstObject");
  [v2 dictionaryWithDictionary:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)buildTicketPrefixForPayload:(id)a3
{
  id v3 = a3;
  [v3 tlvs];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403907LL,  v4);
  if (v5)
  {
    [v5 valueAsString];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int64_t v6 = 0LL;
  }

  [v3 tlvs];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403942LL,  v7);
  if (v8)
  {
    [v8 valueAsNumber];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = [v9 unsignedCharValue] != 0;
  }

  else
  {
    BOOL v10 = 0;
  }

  [v3 tlvs];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403941LL,  v11);
  if (v12)
  {
    [v12 valueAsNumber];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 unsignedLongValue];
  }

  else
  {
    uint64_t v14 = 1LL;
  }

  [MEMORY[0x189607940] stringWithFormat:@"%@", v6];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v16 = v15;
  if (v10) {
    objc_msgSend(v15, "appendFormat:", @"%lu", v14);
  }
  [NSString stringWithString:v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)buildKey:(id)a3 forPayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 tlvs];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403907LL,  v7);
  if (v8)
  {
    [v8 valueAsString];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  v26 = v5;
  [v6 tlvs];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403937LL,  v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v11 valueAsNumber];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = [v12 unsignedCharValue] != 0;
  }

  else
  {
    BOOL v13 = 0;
  }

  [v6 tlvs];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403938LL,  v14);
  if (v15)
  {
    [v15 valueAsNumber];
    dispatch_queue_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = [v16 unsignedCharValue] != 0;
  }

  else
  {
    BOOL v17 = 0;
  }

  [v6 tlvs];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403941LL,  v18);
  if (v19)
  {
    [v19 valueAsNumber];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 unsignedLongValue];
  }

  else
  {
    uint64_t v21 = 1LL;
  }

  [MEMORY[0x189607940] stringWithFormat:@"%@", v9];
  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v13) {
    objc_msgSend(v22, "appendFormat:", @"%lu", v21);
  }
  [v23 appendFormat:@",%@", v26];
  if (v17) {
    objc_msgSend(v23, "appendFormat:", @",%lu", v21);
  }
  [NSString stringWithString:v23];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)processDynamicAsset:(id *)a3
{
  v4 = self;
  uint64_t v117 = *MEMORY[0x1895F89C0];
  id v5 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  im4mAsset = v4->_im4mAsset;
  v4->_im4mAsset = v5;

  BOOL v7 = -[UARPSuperBinaryAsset expandHeadersAndTLVs:](v4->_im4mAsset, "expandHeadersAndTLVs:", a3);
  if (v7)
  {
    BOOL v90 = v7;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    options = v4->_options;
    v4->_options = v8;

    __int128 v111 = 0u;
    __int128 v112 = 0u;
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    -[UARPSuperBinaryAsset payloads](v4->_im4mAsset, "payloads");
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v93 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
    if (v93)
    {
      uint64_t v92 = *(void *)v110;
      v97 = v4;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v110 != v92) {
            objc_enumerationMutation(obj);
          }
          uint64_t v95 = v10;
          id v11 = *(void **)(*((void *)&v109 + 1) + 8 * v10);
          id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
          v100 = v11;
          uint64_t v13 = -[UARPDynamicAssetPersonalization buildTicketPrefixForPayload:](v4, "buildTicketPrefixForPayload:", v11);
          if (v13)
          {
            uint64_t v14 = [NSString stringWithFormat:@"%@,%@", v13, @"Ticket"];
            keyNameManifest = v4->_keyNameManifest;
            v4->_keyNameManifest = (NSString *)v14;

            uint64_t v16 = [NSString stringWithFormat:@"@%@", v4->_keyNameManifest];
            keyNameTicket = v4->_keyNameTicket;
            v4->_keyNameTicket = (NSString *)v16;

            [v12 setObject:MEMORY[0x189604A88] forKeyedSubscript:v4->_keyNameTicket];
          }

          v94 = (void *)v13;
          uint64_t v18 = -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", @"BoardID", v11);
          keyNameBoardID = v4->_keyNameBoardID;
          v4->_keyNameBoardID = (NSString *)v18;

          [v11 tlvs];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403908LL,  v20);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v4->_keyNameBoardID && v21)
          {
            [v21 valueAsNumber];
            objc_super v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 setObject:v22 forKeyedSubscript:v4->_keyNameBoardID];
          }

          uint64_t v23 = -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", @"ChipID", v100);
          keyNameChipID = v4->_keyNameChipID;
          v4->_keyNameChipID = (NSString *)v23;

          [v100 tlvs];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403909LL,  v25);
          if (v4->_keyNameChipID && v26)
          {
            [v26 valueAsNumber];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 setObject:v27 forKeyedSubscript:v4->_keyNameChipID];
          }

          uint64_t v28 = -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", @"ECID", v100);
          keyNameECID = v4->_keyNameECID;
          v4->_keyNameECID = (NSString *)v28;

          [v100 tlvs];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403910LL,  v30);
          if (v4->_keyNameECID && v31)
          {
            [v31 valueAsNumber];
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 setObject:v32 forKeyedSubscript:v4->_keyNameECID];
          }

          uint64_t v33 = -[UARPDynamicAssetPersonalization buildKey:forPayload:](v4, "buildKey:forPayload:", @"Nonce", v100);
          keyNameNonce = v4->_keyNameNonce;
          v4->_keyNameNonce = (NSString *)v33;

          [v100 tlvs];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403912LL,  v35);
          if (v4->_keyNameNonce && v36)
          {
            [v36 valueAsData];
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 setObject:v37 forKeyedSubscript:v4->_keyNameNonce];
          }

          uint64_t v38 = -[UARPDynamicAssetPersonalization buildKey:forPayload:]( v4,  "buildKey:forPayload:",  @"ProductionMode",  v100);
          keyNameProductionMode = v4->_keyNameProductionMode;
          v4->_keyNameProductionMode = (NSString *)v38;

          [v100 tlvs];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403915LL,  v40);
          if (v4->_keyNameProductionMode && v41)
          {
            [v41 valueAsNumber];
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            else {
              uint64_t v43 = MEMORY[0x189604A80];
            }
            [v12 setObject:v43 forKeyedSubscript:v4->_keyNameProductionMode];
          }

          uint64_t v44 = -[UARPDynamicAssetPersonalization buildKey:forPayload:]( v4,  "buildKey:forPayload:",  @"SecurityDomain",  v100);
          keyNameSecurityDomain = v4->_keyNameSecurityDomain;
          v4->_keyNameSecurityDomain = (NSString *)v44;

          [v100 tlvs];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403913LL,  v46);
          if (v4->_keyNameSecurityDomain && v47)
          {
            [v47 valueAsNumber];
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 setObject:v48 forKeyedSubscript:v4->_keyNameSecurityDomain];
          }

          uint64_t v49 = -[UARPDynamicAssetPersonalization buildKey:forPayload:]( v4,  "buildKey:forPayload:",  @"SecurityMode",  v100);
          keyNameSecurityMode = v4->_keyNameSecurityMode;
          v4->_keyNameSecurityMode = (NSString *)v49;

          [v100 tlvs];
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403914LL,  v51);
          if (v4->_keyNameSecurityMode && v52)
          {
            [v52 valueAsNumber];
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            else {
              uint64_t v54 = MEMORY[0x189604A80];
            }
            [v12 setObject:v54 forKeyedSubscript:v4->_keyNameSecurityMode];
          }

          uint64_t v55 = -[UARPDynamicAssetPersonalization buildKey:forPayload:]( v4,  "buildKey:forPayload:",  @"SocLiveNonce",  v100);
          keyNameSoCLiveNonce = v4->_keyNameSoCLiveNonce;
          v4->_keyNameSoCLiveNonce = (NSString *)v55;

          [v100 tlvs];
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403928LL,  v57);
          if (v4->_keyNameSoCLiveNonce && v58)
          {
            [v58 valueAsNumber];
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            else {
              uint64_t v60 = MEMORY[0x189604A80];
            }
            [v12 setObject:v60 forKeyedSubscript:v4->_keyNameSoCLiveNonce];
          }

          [v100 tlvs];
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = +[UARPSuperBinaryAssetTLV findTLVsWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVsWithType:tlvs:",  2293403920LL,  v61);
          __int128 v107 = 0u;
          __int128 v108 = 0u;
          __int128 v105 = 0u;
          __int128 v106 = 0u;
          id v96 = v62;
          uint64_t v101 = [v96 countByEnumeratingWithState:&v105 objects:v115 count:16];
          if (v101)
          {
            uint64_t v98 = *(void *)v106;
            v99 = v12;
            do
            {
              for (uint64_t i = 0LL; i != v101; ++i)
              {
                if (*(void *)v106 != v98) {
                  objc_enumerationMutation(v96);
                }
                [*(id *)(*((void *)&v105 + 1) + 8 * i) valueAsTLVs];
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                id v65 = objc_alloc_init(MEMORY[0x189603FC8]);
                v66 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403922LL,  v64);
                [v66 valueAsString];
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                [NSString stringWithFormat:@"%@", @"Digest"];
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403923LL,  v64);
                [v68 valueAsData];
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                [v65 setObject:v69 forKeyedSubscript:v67];

                [NSString stringWithFormat:@"%@", @"EPRO"];
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403926LL,  v64);
                v72 = v71;
                if (v71)
                {
                  [v71 valueAsNumber];
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  else {
                    uint64_t v74 = MEMORY[0x189604A80];
                  }
                  [v65 setObject:v74 forKeyedSubscript:v70];
                }

                [NSString stringWithFormat:@"%@", @"ESEC"];
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403925LL,  v64);
                v77 = v76;
                if (v76)
                {
                  [v76 valueAsNumber];
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  else {
                    uint64_t v79 = MEMORY[0x189604A80];
                  }
                  [v65 setObject:v79 forKeyedSubscript:v75];
                }

                [NSString stringWithFormat:@"%@", @"Trusted"];
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  2293403927LL,  v64);
                v82 = v81;
                if (v81)
                {
                  [v81 valueAsNumber];
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  else {
                    uint64_t v84 = MEMORY[0x189604A80];
                  }
                  [v65 setObject:v84 forKeyedSubscript:v80];
                }

                v4 = v97;
                v85 = -[UARPDynamicAssetPersonalization buildKey:forPayload:](v97, "buildKey:forPayload:", v102, v100);
                id v12 = v99;
                [v99 setObject:v65 forKeyedSubscript:v85];
              }

              uint64_t v101 = [v96 countByEnumeratingWithState:&v105 objects:v115 count:16];
            }

            while (v101);
          }

          log = v4->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            -[UARPDynamicAssetPersonalization processDynamicAsset:].cold.1(&v103, v104, log);
          }
          v87 = v4->_log;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v114 = v12;
            _os_log_debug_impl(&dword_187DC0000, v87, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          [MEMORY[0x189603F68] dictionaryWithDictionary:v12];
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v4->_options, "addObject:", v88);

          uint64_t v10 = v95 + 1;
        }

        while (v95 + 1 != v93);
        uint64_t v93 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
      }

      while (v93);
    }

    LOBYTE(v7) = v90;
  }

  return v7;
}

- (BOOL)tssRequest:(id)a3 error:(id *)a4
{
  options = self->_options;
  id v6 = a3;
  -[NSMutableArray firstObject](options, "firstObject");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  UARPPersonalizationTSSRequestWithSigningServer(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    BOOL v9 = -[UARPDynamicAssetPersonalization processTssResponse:](self, "processTssResponse:", v8);
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)processTssResponse:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v35 = a3;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_im4mAsset, "payloads");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v34 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v8 = -[UARPDynamicAssetPersonalization buildTicketPrefixForPayload:](self, "buildTicketPrefixForPayload:", v7);
        [NSString stringWithFormat:@"%@,%@", v8, @"Ticket"];
        BOOL v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
          __int16 v42 = 2112;
          uint64_t v43 = v9;
          _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: rebuilt ticket name is %@", buf, 0x16u);
        }

        id v11 = self->_log;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          keyNameManifest = self->_keyNameManifest;
          *(_DWORD *)buf = 136315394;
          v41 = "-[UARPDynamicAssetPersonalization processTssResponse:]";
          __int16 v42 = 2112;
          uint64_t v43 = keyNameManifest;
          _os_log_impl(&dword_187DC0000, v11, OS_LOG_TYPE_INFO, "%s: composed ticket name is %@", buf, 0x16u);
        }

        [v35 objectForKeyedSubscript:v9];
        uint64_t v13 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = self->_log;
        if (!v13)
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetPersonalization processTssResponse:].cold.1(v14, v17, v18, v19, v20, v21, v22, v23);
          }
          goto LABEL_24;
        }

        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_187DC0000, v14, OS_LOG_TYPE_INFO, "IM4M: TSS Response Bundle is ", buf, 2u);
        }

        v15 = self->_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v13;
          _os_log_impl(&dword_187DC0000, v15, OS_LOG_TYPE_INFO, "IM4M: %@", buf, 0xCu);
        }

        if (([v7 setPayloadToData:v13] & 1) == 0)
        {
          v24 = self->_log;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetPersonalization processTssResponse:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
          }
LABEL_24:

          BOOL v16 = 0;
          goto LABEL_25;
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      BOOL v16 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v16 = 1;
  }

- (BOOL)prepareDynamicAsset:(id)a3 error:(id *)a4
{
  im4mAsset = self->_im4mAsset;
  if (im4mAsset) {
    LOBYTE(im4mAsset) = -[UARPSuperBinaryAsset writeToURL:error:](im4mAsset, "writeToURL:error:", a3, a4);
  }
  return (char)im4mAsset;
}

- (BOOL)compareTssResponse:(id)a3
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (NSString *)a3;
  uint64_t v5 = (void *)MEMORY[0x189603F68];
  -[NSMutableArray firstObject](self->_options, "firstObject");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dictionaryWithDictionary:v6];
  BOOL v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = v7;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s TSS Options %@", buf, 0x16u);
  }

  BOOL v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = v4;
    _os_log_impl(&dword_187DC0000, v9, OS_LOG_TYPE_INFO, "%s TSS Response %@", buf, 0x16u);
  }

  -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameBoardID);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameBoardID);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    keyNameBoardID = self->_keyNameBoardID;
    *(_DWORD *)buf = 136315906;
    v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
    __int16 v71 = 2112;
    v72 = keyNameBoardID;
    __int16 v73 = 2112;
    uint64_t v74 = v10;
    __int16 v75 = 2112;
    v76 = v11;
    _os_log_impl(&dword_187DC0000, v12, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
  }

  if (v10 && !v11)
  {
    uint64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = self->_keyNameBoardID;
      *(_DWORD *)buf = 136315650;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = v15;
      __int16 v73 = 2112;
      uint64_t v74 = v10;
      BOOL v16 = "%s %@; %@, missing in TSS response";
      uint64_t v17 = v14;
      uint32_t v18 = 32;
LABEL_20:
      _os_log_impl(&dword_187DC0000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      goto LABEL_21;
    }

    goto LABEL_21;
  }

  if ([v10 isEqualToNumber:v11])
  {
    -[NSString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", self->_keyNameChipID);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", self->_keyNameChipID);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      keyNameChipID = self->_keyNameChipID;
      *(_DWORD *)buf = 136315906;
      v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
      __int16 v71 = 2112;
      v72 = keyNameChipID;
      __int16 v73 = 2112;
      uint64_t v74 = v19;
      __int16 v75 = 2112;
      v76 = v20;
      _os_log_impl(&dword_187DC0000, v21, OS_LOG_TYPE_INFO, "%s compare %@; %@ vs %@", buf, 0x2Au);
    }

    if (v19 && !v20)
    {
      uint64_t v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = self->_keyNameBoardID;
        *(_DWORD *)buf = 136315650;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v24;
        __int16 v73 = 2112;
        uint64_t v74 = v19;
        uint64_t v25 = "%s %@; %@, missing in TSS response";
        uint64_t v26 = v23;
        uint32_t v27 = 32;
LABEL_31:
        _os_log_impl(&dword_187DC0000, v26, OS_LOG_TYPE_INFO, v25, buf, v27);
        goto LABEL_32;
      }

      goto LABEL_32;
    }

    if (([v19 isEqualToNumber:v20] & 1) == 0)
    {
      v40 = self->_log;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = self->_keyNameChipID;
        *(_DWORD *)buf = 136315906;
        v70 = "-[UARPDynamicAssetPersonalization compareTssResponse:]";
        __int16 v71 = 2112;
        v72 = v41;
        __int16 v73 = 2112;
        uint64_t v74 = v19;
        __int16 v75 = 2112;
        v76 = v20;
        uint64_t v25 = "%s %@; NOT EQUAL %@ vs %@";
        uint64_t v26 = v40;
        uint32_t v27 = 42;
        goto LABEL_31;
      }

- (UARPUploaderEndpoint)endpoint
{
  return (UARPUploaderEndpoint *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSURL)tatsuServerURL
{
  return (NSURL *)objc_getProperty(self, a2, 136LL, 1);
}

- (UARPAssetTag)tagIM4M
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 144LL, 1);
}

- (void).cxx_destruct
{
}

- (void)processDynamicAsset:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_187DC0000, log, OS_LOG_TYPE_DEBUG, "Personalization Options", buf, 2u);
}

- (void)processTssResponse:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)processTssResponse:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end