@interface ACCPlatformLocationManager
+ (id)sharedManager;
- (ACCPlatformLocationManager)init;
- (BOOL)bLocationStarted;
- (BOOL)bNMEAFilterListNew;
- (BOOL)isSentenceArrayValidForUUID:(id)a3;
- (BOOL)isSentenceTypeSupported:(int)a3 forUUID:(id)a4;
- (BOOL)resetLocationEndpointUUID:(id)a3;
- (BOOL)sendGPRMCDataStatus:(BOOL)a3 valueV:(BOOL)a4 valueX:(BOOL)a5 forUUID:(id)a6;
- (BOOL)setLocationEndpointUUID:(id)a3 withSupportedNMEASentences:(__CFArray *)a4;
- (BOOL)setNMEAFilterList:(id)a3 forUUID:(id)a4;
- (BOOL)startLocationUpdatesForUUID:(id)a3;
- (BOOL)stopLocationUpdatesForUUID:(id)a3;
- (NSArray)supportedNMEASentencesArray;
- (NSMutableArray)pNMEAFilterList;
- (NSRecursiveLock)accessLock;
- (NSString)endpointUUID;
- (OS_dispatch_queue)endpointFeatureHandlerQueue;
- (unsigned)minNMEAIntervalMs;
- (unsigned)sentenceTypesBitmask:(id)a3 forUUID:(id)a4;
- (unsigned)supportedNMEASentenceMask;
- (void)dealloc;
- (void)setAccessLock:(id)a3;
- (void)setBLocationStarted:(BOOL)a3;
- (void)setBNMEAFilterListNew:(BOOL)a3;
- (void)setEndpointFeatureHandlerQueue:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setMinNMEAIntervalMs:(unsigned int)a3;
- (void)setPNMEAFilterList:(id)a3;
- (void)setSupportedNMEASentenceMask:(unsigned int)a3;
- (void)setSupportedNMEASentencesArray:(id)a3;
@end

@implementation ACCPlatformLocationManager

+ (id)sharedManager
{
  if (sharedManager_once_6 != -1) {
    dispatch_once(&sharedManager_once_6, &__block_literal_global_29);
  }
  return (id)sharedManager_sharedInstance_6;
}

void __43__ACCPlatformLocationManager_sharedManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___ACCPlatformLocationManager);
  v2 = (void *)sharedManager_sharedInstance_6;
  sharedManager_sharedInstance_6 = (uint64_t)v1;
}

- (ACCPlatformLocationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACCPlatformLocationManager;
  v2 = -[ACCPlatformLocationManager init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v3;

    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = 0LL;

    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = 0LL;

    *((_WORD *)v2 + 4) = 0;
    *(void *)(v2 + 12) = 0xFA00000000LL;
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0LL;

    dispatch_queue_t v8 = dispatch_queue_create("locationPlatformEndpointFeatureHandlerQ", 0LL);
    v9 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v8;
  }

  return (ACCPlatformLocationManager *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ACCPlatformLocationManager;
  -[ACCPlatformLocationManager dealloc](&v3, "dealloc");
}

- (BOOL)setLocationEndpointUUID:(id)a3 withSupportedNMEASentences:(__CFArray *)a4
{
  id v6 = a3;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 8;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    v9 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    v29[0] = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[#Location] setLocationEndpointUUID: %@, supportedNMEASentencesArray: %@",  (uint8_t *)&v26,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v10 lock];

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  if (v11
    && (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager supportedNMEASentencesArray](self, "supportedNMEASentencesArray")),
        v13,
        v12,
        v13))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v14 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v14 = (os_log_s *)&_os_log_default;
      id v21 = &_os_log_default;
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager setLocationEndpointUUID:withSupportedNMEASentences:].cold.3();
    }
    BOOL v20 = 0;
  }

  else
  {
    id v15 = [v6 copy];
    -[ACCPlatformLocationManager setEndpointUUID:](self, "setEndpointUUID:", v15);

    id v16 = -[__CFArray copy](a4, "copy");
    -[ACCPlatformLocationManager setSupportedNMEASentencesArray:](self, "setSupportedNMEASentencesArray:", v16);

    -[ACCPlatformLocationManager setSupportedNMEASentenceMask:]( self,  "setSupportedNMEASentenceMask:",  -[ACCPlatformLocationManager sentenceTypesBitmask:forUUID:](self, "sentenceTypesBitmask:forUUID:", a4, v6));
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v14 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v14 = (os_log_s *)&_os_log_default;
      id v17 = &_os_log_default;
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
      unsigned int v19 = -[ACCPlatformLocationManager supportedNMEASentenceMask](self, "supportedNMEASentenceMask");
      int v26 = 138412546;
      id v27 = v18;
      __int16 v28 = 1024;
      LODWORD(v29[0]) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[#Location] setLocationEndpointUUID: %@, supportedNMEASentencesMask: %u",  (uint8_t *)&v26,  0x12u);
    }

    BOOL v20 = 1;
  }

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v22 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v22 = (os_log_s *)&_os_log_default;
    id v23 = &_os_log_default;
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412802;
    id v27 = v6;
    __int16 v28 = 1024;
    LODWORD(v29[0]) = v20;
    WORD2(v29[0]) = 2112;
    *(void *)((char *)v29 + 6) = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[#Location] setLocationEndpointUUID: %@, result %d, supportedNMEASentencesArray: %@",  (uint8_t *)&v26,  0x1Cu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v24 unlock];

  return v20;
}

- (BOOL)resetLocationEndpointUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    BOOL v7 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#Location] resetLocationEndpointUUID: %@",  (uint8_t *)&v25,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v8 lock];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  if (!v9)
  {
    id v21 = logObjectForModule_16();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager resetLocationEndpointUUID:].cold.2();
    }
    goto LABEL_38;
  }

  if (!v4)
  {
    id v22 = logObjectForModule_16();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager resetLocationEndpointUUID:].cold.3(self);
    }
    goto LABEL_38;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  unsigned __int8 v11 = [v10 isEqualToString:v4];

  if ((v11 & 1) == 0)
  {
    id v23 = logObjectForModule_16();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
      int v25 = 138412546;
      id v26 = v4;
      __int16 v27 = 2112;
      *(void *)__int16 v28 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#Location] not resetting location state. UUID passed does not match UUID that set it. endpointUUID: %@ self.endpointUUID: %@ ",  (uint8_t *)&v25,  0x16u);
    }

- (BOOL)startLocationUpdatesForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    BOOL v7 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v68 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#Location] startLocationUpdatesForUUID = %@",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v8 lock];

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v9 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v9 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = -[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted");
    unsigned int v12 = -[ACCPlatformLocationManager bNMEAFilterListNew](self, "bNMEAFilterListNew");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
    id v15 = [v14 count];
    *(_DWORD *)buf = 138413314;
    *(void *)v68 = v4;
    *(_WORD *)&v68[8] = 1024;
    *(_DWORD *)&v68[10] = v11;
    *(_WORD *)&v68[14] = 1024;
    *(_DWORD *)&v68[16] = v12;
    __int16 v69 = 2112;
    *(void *)v70 = v13;
    *(_WORD *)&v70[8] = 2048;
    *(void *)&v70[10] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[#Location] startLocationUpdatesForUUID = %@, bLocationStarted=%d bNMEAFilterListNew=%d pNMEAFilterList=%@ [count=%lu]",  buf,  0x2Cu);
  }

  if (!v4)
  {
    id v56 = logObjectForModule_16();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.2();
    }
    goto LABEL_63;
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  unsigned __int8 v17 = [v16 isEqualToString:v4];

  if ((v17 & 1) == 0)
  {
    id v57 = logObjectForModule_16();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_63;
  }

  if (-[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted")
    && !-[ACCPlatformLocationManager bNMEAFilterListNew](self, "bNMEAFilterListNew"))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v38 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v38 = (os_log_s *)&_os_log_default;
      id v44 = &_os_log_default;
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v45 = -[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted");
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v68 = v45;
      *(_WORD *)&v68[4] = 2112;
      *(void *)&v68[6] = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[#Location] Waiting for bLocationStarted(%d), or NMEAFilterList same. skipping start location update for endpoint: %@",  buf,  0x12u);
    }

    goto LABEL_63;
  }

  -[ACCPlatformLocationManager setBLocationStarted:](self, "setBLocationStarted:", 1LL);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
  id v19 = [v18 count];

  if (!v19)
  {
    id v58 = logObjectForModule_16();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.3(self);
    }
LABEL_63:

    id v43 = 0LL;
    int v36 = 0;
    goto LABEL_64;
  }

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[ACCPlatformLocationManager minNMEAIntervalMs](self, "minNMEAIntervalMs")));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v20,  v21));

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  v59 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
  id v23 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v64;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v64 != v25) {
          objc_enumerationMutation(obj);
        }
        __int16 v27 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
        unsigned int v28 = [v27 nmeaIntervalParamID];
        unsigned int v29 = [v27 nmeaIntervalMinMs];
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v27 nmeaTypeParamID]));
        [v22 setObject:v30 forKey:v31];

        if (v28) {
          BOOL v32 = v29 == 0;
        }
        else {
          BOOL v32 = 1;
        }
        if (!v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v29));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v28));
          [v22 setObject:v33 forKey:v34];
        }
      }

      id v24 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    }

    while (v24);
  }

  self = v59;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](v59, "endpointUUID"));
  int v36 = platform_power_setAccessoryPowerMode(v35, 0LL, 1LL);

  if ((v36 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v37 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v37 = (os_log_s *)&_os_log_default;
      id v39 = &_os_log_default;
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.5(v59);
    }
  }

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v40 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v40 = (os_log_s *)&_os_log_default;
    id v41 = &_os_log_default;
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v68 = v4;
    *(_WORD *)&v68[8] = 2112;
    *(void *)&v68[10] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "[#Location] startLocationUpdatesForUUID %@, startUpdates: attributes %@",  buf,  0x16u);
  }

  endpointFeatureHandlerQueue = (dispatch_queue_s *)v59->_endpointFeatureHandlerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke;
  block[3] = &unk_1001F9798;
  block[4] = v59;
  id v43 = v22;
  id v62 = v43;
  dispatch_async(endpointFeatureHandlerQueue, block);
  -[ACCPlatformLocationManager setBNMEAFilterListNew:](v59, "setBNMEAFilterListNew:", 0LL);

LABEL_64:
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v47 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v47 = (os_log_s *)&_os_log_default;
    id v48 = &_os_log_default;
  }

  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v49 = -[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted");
    unsigned int v50 = -[ACCPlatformLocationManager bNMEAFilterListNew](self, "bNMEAFilterListNew");
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
    id v53 = [v52 count];
    *(_DWORD *)buf = 138413570;
    *(void *)v68 = v4;
    *(_WORD *)&v68[8] = 1024;
    *(_DWORD *)&v68[10] = v36;
    *(_WORD *)&v68[14] = 1024;
    *(_DWORD *)&v68[16] = v49;
    __int16 v69 = 1024;
    *(_DWORD *)v70 = v50;
    *(_WORD *)&v70[4] = 2112;
    *(void *)&v70[6] = v51;
    *(_WORD *)&v70[14] = 2048;
    *(void *)&v70[16] = v53;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "[#Location] startLocationUpdatesForUUID = %@, result %d, bLocationStarted=%d bNMEAFilterListNew=%d pNMEAFilterList=%@ [count=%lu]",  buf,  0x32u);
  }

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v54 unlock];

  return v36;
}

void __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpointUUID]);
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412546;
    unsigned int v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Location] startLocationUpdatesForUUID %@, invoke startUpdates: attributes %@",  (uint8_t *)&v13,  0x16u);
  }

  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 32;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 endpointUUID]);
  char v10 = accFeatureHandlers_invokeHandler(v9, 35, *(void *)(v7 + 8));

  if ((v10 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned int v11 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v11 = (os_log_s *)&_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1((id *)v7);
    }
  }

- (BOOL)sendGPRMCDataStatus:(BOOL)a3 valueV:(BOOL)a4 valueX:(BOOL)a5 forUUID:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v11 lock];

  if (!v10)
  {
    id v25 = logObjectForModule_16();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.2();
    }
    goto LABEL_20;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  unsigned __int8 v13 = [v12 isEqualToString:v10];

  if ((v13 & 1) == 0)
  {
    id v26 = logObjectForModule_16();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_20;
  }

  if (!-[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted"))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      id v18 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v18 = (os_log_s *)&_os_log_default;
      id v22 = &_os_log_default;
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager sendGPRMCDataStatus:valueV:valueX:forUUID:].cold.2(self);
    }
LABEL_20:
    BOOL v19 = 0;
    goto LABEL_21;
  }

  unsigned int v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int16 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v8)
  {
    if (!v7) {
      goto LABEL_6;
    }
LABEL_13:
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableArray addObject:](v15, "addObject:", v21);

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
  -[NSMutableArray addObject:](v15, "addObject:", v20);

  if (v7) {
    goto LABEL_13;
  }
LABEL_6:
  if (v6)
  {
LABEL_7:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
    -[NSMutableArray addObject:](v15, "addObject:", v16);
  }

void __72__ACCPlatformLocationManager_sendGPRMCDataStatus_valueV_valueX_forUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpointUUID]);
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412546;
    unsigned int v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Location] sendGPRMCDataStatus %@, invoke sendGPRMCDataStatus: attributes %@",  (uint8_t *)&v13,  0x16u);
  }

  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 32;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 endpointUUID]);
  char v10 = accFeatureHandlers_invokeHandler(v9, 37, *(void *)(v7 + 8));

  if ((v10 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned int v11 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v11 = (os_log_s *)&_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1((id *)v7);
    }
  }

- (BOOL)stopLocationUpdatesForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    uint64_t v7 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#Location] stopLocationUpdatesForUUID = %@",  buf,  0xCu);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v8 lock];

  if (!v4)
  {
    id v25 = logObjectForModule_16();
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.2();
    }
    goto LABEL_27;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  unsigned __int8 v10 = [v9 isEqualToString:v4];

  if ((v10 & 1) == 0)
  {
    id v26 = logObjectForModule_16();
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_27;
  }

  if (!-[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted"))
  {
    id v27 = logObjectForModule_16();
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  if (!-[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted"))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned __int8 v17 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned __int8 v17 = (os_log_s *)&_os_log_default;
      id v18 = &_os_log_default;
    }

    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
LABEL_26:
    -[ACCPlatformLocationManager sendGPRMCDataStatus:valueV:valueX:forUUID:].cold.2(self);
LABEL_27:

    int v15 = 0;
    int v13 = 0LL;
    goto LABEL_35;
  }

  unsigned int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  endpointFeatureHandlerQueue = (dispatch_queue_s *)self->_endpointFeatureHandlerQueue;
  unsigned int v28 = _NSConcreteStackBlock;
  uint64_t v29 = 3221225472LL;
  v30 = __57__ACCPlatformLocationManager_stopLocationUpdatesForUUID___block_invoke;
  v31 = &unk_1001F9798;
  BOOL v32 = self;
  int v13 = v11;
  v33 = v13;
  dispatch_async(endpointFeatureHandlerQueue, &v28);
  -[ACCPlatformLocationManager setBLocationStarted:](self, "setBLocationStarted:", 0LL, v28, v29, v30, v31, v32);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  int v15 = platform_power_setAccessoryPowerMode(v14, 0LL, 0LL);

  if ((v15 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      uint64_t v16 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v16 = (os_log_s *)&_os_log_default;
      id v19 = &_os_log_default;
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.5(self);
    }
  }

LABEL_35:
  if (gLogObjects && gNumLogObjects >= 8)
  {
    BOOL v20 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v20 = (os_log_s *)&_os_log_default;
    id v21 = &_os_log_default;
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v22 = -[ACCPlatformLocationManager bLocationStarted](self, "bLocationStarted");
    *(_DWORD *)buf = 138412802;
    id v35 = v4;
    __int16 v36 = 1024;
    int v37 = v15;
    __int16 v38 = 1024;
    unsigned int v39 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[#Location] stopLocationUpdatesForUUID = %@, result %d, bLocationStarted=%d",  buf,  0x18u);
  }

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v23 unlock];

  return v15;
}

void __57__ACCPlatformLocationManager_stopLocationUpdatesForUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 8;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpointUUID]);
    uint64_t v6 = *(void *)(a1 + 40);
    int v13 = 138412546;
    unsigned int v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Location] stopLocationUpdatesForUUID %@, invoke stopUpdates: attributes %@",  (uint8_t *)&v13,  0x16u);
  }

  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v7 = a1 + 32;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 endpointUUID]);
  char v10 = accFeatureHandlers_invokeHandler(v9, 36, *(void *)(v7 + 8));

  if ((v10 & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      unsigned int v11 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v11 = (os_log_s *)&_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1((id *)v7);
    }
  }

- (BOOL)setNMEAFilterList:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
  id v9 = [v8 copy];

  unsigned int v10 = -[ACCPlatformLocationManager minNMEAIntervalMs](self, "minNMEAIntervalMs");
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 8;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v13 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  else
  {
    int v13 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v80 = (uint64_t)v7;
    __int16 v81 = 2112;
    *(void *)v82 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[#Location] setNMEAFilterList: %@, pFilterList %@",  buf,  0x16u);
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager accessLock](self, "accessLock"));
  [v14 lock];

  if (!v6)
  {
    id v68 = logObjectForModule_16();
    __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager setNMEAFilterList:forUUID:].cold.2();
    }
    goto LABEL_121;
  }

  if (!v7)
  {
    id v70 = logObjectForModule_16();
    __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.2();
    }
    goto LABEL_121;
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  unsigned __int8 v16 = [v15 isEqualToString:v7];

  if ((v16 & 1) == 0)
  {
    id v71 = logObjectForModule_16();
    __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
LABEL_121:

    BOOL v60 = 0;
    goto LABEL_106;
  }

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[ACCPlatformLocationManager setPNMEAFilterList:](self, "setPNMEAFilterList:", v17);

  -[ACCPlatformLocationManager setMinNMEAIntervalMs:](self, "setMinNMEAIntervalMs:", 250LL);
  unsigned int v18 = -[ACCPlatformLocationManager isSentenceArrayValidForUUID:](self, "isSentenceArrayValidForUUID:", v7);
  if (gLogObjects) {
    BOOL v19 = gNumLogObjects <= 7;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  if (v18)
  {
    if (v20)
    {
      id v21 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v21 = (os_log_s *)&_os_log_default;
      id v23 = &_os_log_default;
    }

    unsigned int v73 = v10;
    id v74 = v9;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v80 = (uint64_t)v7;
      __int16 v81 = 2112;
      *(void *)v82 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[#Location] SentenceArrayValid: %@, pFilterList %@",  buf,  0x16u);
    }

    id v24 = v7;

    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    id v25 = v6;
    id v26 = [v25 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (v26)
    {
      id v28 = v26;
      uint64_t v29 = *(void *)v76;
      *(void *)&__int128 v27 = 134218240LL;
      __int128 v72 = v27;
      do
      {
        v30 = 0LL;
        do
        {
          if (*(void *)v76 != v29) {
            objc_enumerationMutation(v25);
          }
          id v31 = *(id *)(*((void *)&v75 + 1) + 8LL * (void)v30);
          BOOL v32 = (const char *)[v31 UTF8String];
          if (!strcmp("GPGGA", v32))
          {
            uint64_t v36 = 250LL;
            uint64_t v37 = 32769LL;
            uint64_t v38 = 1LL;
            uint64_t v39 = 17LL;
          }

          else if (!strcmp("GPRMC", v32))
          {
            uint64_t v36 = 250LL;
            uint64_t v37 = 32770LL;
            uint64_t v38 = 2LL;
            uint64_t v39 = 18LL;
          }

          else if (!strcmp("GPGSV", v32))
          {
            uint64_t v36 = 83LL;
            uint64_t v37 = 32771LL;
            uint64_t v38 = 3LL;
            uint64_t v39 = 19LL;
          }

          else if (!strcmp("PASCD", v32))
          {
            uint64_t v37 = 32772LL;
            uint64_t v38 = 4LL;
            uint64_t v39 = 20LL;
            uint64_t v36 = 20LL;
          }

          else if (!strcmp("PAGCD", v32))
          {
            uint64_t v36 = 20LL;
            uint64_t v37 = 32773LL;
            uint64_t v38 = 5LL;
            uint64_t v39 = 21LL;
          }

          else if (!strcmp("PAACD", v32))
          {
            uint64_t v36 = 20LL;
            uint64_t v37 = 32774LL;
            uint64_t v38 = 6LL;
            uint64_t v39 = 22LL;
          }

          else
          {
            if (strcmp("GPHDT", v32))
            {
              uint64_t v33 = gLogObjects;
              int v34 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 8)
              {
                id v35 = (os_log_s *)*(id *)(gLogObjects + 56);
              }

              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v72;
                  uint64_t v80 = v33;
                  __int16 v81 = 1024;
                  *(_DWORD *)v82 = v34;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
                }

                id v35 = (os_log_s *)&_os_log_default;
                id v41 = &_os_log_default;
              }

              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v80 = (uint64_t)v31;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[#Location] huh? unknown NMEAString=%@",  buf,  0xCu);
              }

              goto LABEL_56;
            }

            uint64_t v36 = 250LL;
            uint64_t v37 = 32775LL;
            uint64_t v38 = 7LL;
            uint64_t v39 = 23LL;
          }

          if (-[ACCPlatformLocationManager isSentenceTypeSupported:forUUID:]( self,  "isSentenceTypeSupported:forUUID:",  v39,  v24,  v72))
          {
            id v35 = -[iAP2NMEAFilterParam initWithTypeParamID:andIntervalParamID:andIntervalMinMs:]( objc_alloc(&OBJC_CLASS___iAP2NMEAFilterParam),  "initWithTypeParamID:andIntervalParamID:andIntervalMinMs:",  v38,  v37,  v36);
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager pNMEAFilterList](self, "pNMEAFilterList"));
            [v40 addObject:v35];
          }

          else
          {
            id v35 = 0LL;
          }

- (BOOL)isSentenceTypeSupported:(int)a3 forUUID:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
    unsigned __int8 v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) != 0)
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager supportedNMEASentencesArray](self, "supportedNMEASentencesArray", 0LL));
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) intValue] == a3)
            {
              BOOL v14 = 1;
              goto LABEL_13;
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
      id v17 = logObjectForModule_16();
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
      }
    }
  }

  else
  {
    id v16 = logObjectForModule_16();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.2();
    }
  }

  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)isSentenceArrayValidForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager supportedNMEASentencesArray](self, "supportedNMEASentencesArray"));
  if (v5
    && (id v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager supportedNMEASentencesArray](self, "supportedNMEASentencesArray")),
        id v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    BOOL v9 = 1;
  }

  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 8;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v12 = (os_log_s *)&_os_log_default;
      id v11 = &_os_log_default;
    }

    else
    {
      uint64_t v12 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#Location] no supportedNMEASentences for UUID %@, result = false",  (uint8_t *)&v14,  0xCu);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (unsigned)sentenceTypesBitmask:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v18 = logObjectForModule_16();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.2();
    }
    goto LABEL_18;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformLocationManager endpointUUID](self, "endpointUUID"));
  unsigned __int8 v9 = [v8 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v19 = logObjectForModule_16();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformLocationManager startLocationUpdatesForUUID:].cold.8();
    }
    goto LABEL_18;
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  BOOL v10 = (os_log_s *)v6;
  id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (!v11)
  {
LABEL_18:
    unsigned int v13 = 0;
    goto LABEL_19;
  }

  id v12 = v11;
  unsigned int v13 = 0;
  uint64_t v14 = *(void *)v22;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = (int)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)i), "shortValue", (void)v21) - 17;
      else {
        int v17 = dword_10019E9B0[v16];
      }
      v13 |= v17;
    }

    id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  }

  while (v12);
LABEL_19:

  return v13;
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSMutableArray)pNMEAFilterList
{
  return self->_pNMEAFilterList;
}

- (void)setPNMEAFilterList:(id)a3
{
}

- (BOOL)bLocationStarted
{
  return self->_bLocationStarted;
}

- (void)setBLocationStarted:(BOOL)a3
{
  self->_bLocationStarted = a3;
}

- (unsigned)supportedNMEASentenceMask
{
  return self->_supportedNMEASentenceMask;
}

- (void)setSupportedNMEASentenceMask:(unsigned int)a3
{
  self->_supportedNMEASentenceMask = a3;
}

- (unsigned)minNMEAIntervalMs
{
  return self->_minNMEAIntervalMs;
}

- (void)setMinNMEAIntervalMs:(unsigned int)a3
{
  self->_minNMEAIntervalMs = a3;
}

- (BOOL)bNMEAFilterListNew
{
  return self->_bNMEAFilterListNew;
}

- (void)setBNMEAFilterListNew:(BOOL)a3
{
  self->_bNMEAFilterListNew = a3;
}

- (NSArray)supportedNMEASentencesArray
{
  return self->_supportedNMEASentencesArray;
}

- (void)setSupportedNMEASentencesArray:(id)a3
{
}

- (NSRecursiveLock)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(id)a3
{
}

- (OS_dispatch_queue)endpointFeatureHandlerQueue
{
  return self->_endpointFeatureHandlerQueue;
}

- (void)setEndpointFeatureHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setLocationEndpointUUID:withSupportedNMEASentences:.cold.3()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_11_4(v0, v1), "endpointUUID");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_3_12( (void *)&_mh_execute_header,  v4,  v5,  "[#Location] did not set location endpointUUID(%@) - self.endpointUUID(%@) already set for this feature",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_4_9();
}

- (void)resetLocationEndpointUUID:.cold.2()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_11_4(v0, v1), "endpointUUID");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_3_12( (void *)&_mh_execute_header,  v4,  v5,  "[#Location] did not reset endpoint(%@) - self.endpointUUID(%@) already reset for this feature",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_4_9();
}

- (void)resetLocationEndpointUUID:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 endpointUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_12( (void *)&_mh_execute_header,  v2,  v3,  "[#Location] did not reset self.endpointUUID(%@) - endpointUUID param(%@) is nil",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

- (void)startLocationUpdatesForUUID:.cold.2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "[#Location] endpointUUID == nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

- (void)startLocationUpdatesForUUID:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 endpointUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v2,  v3,  "[#Location] empty filter list for endpointUUID: %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

- (void)startLocationUpdatesForUUID:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 endpointUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v2,  v3,  "[#Location] Error setting AccessoryPowerMode for endpoint: %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

- (void)startLocationUpdatesForUUID:.cold.8()
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_11_4(v0, v1), "endpointUUID");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_3_12( (void *)&_mh_execute_header,  v4,  v5,  "[#Location] endpointUUID(%@) != self.endpointUUID(%@)",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_4_9();
}

void __58__ACCPlatformLocationManager_startLocationUpdatesForUUID___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 endpointUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v2,  v3,  "[#Location] accFeatureHandlers_invokeHandler returned false for endpoint: %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

- (void)sendGPRMCDataStatus:(void *)a1 valueV:valueX:forUUID:.cold.2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 endpointUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v2,  v3,  "[#Location] feature not started for endpointUUID: %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

- (void)setNMEAFilterList:forUUID:.cold.2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "[#Location] pFilterList == nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

@end