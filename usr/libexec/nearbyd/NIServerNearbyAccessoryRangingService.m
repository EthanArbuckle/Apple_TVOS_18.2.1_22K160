@interface NIServerNearbyAccessoryRangingService
+ (id)sharedInstance;
- (BOOL)_buildAndRunRangingSession:(unsigned int)a3;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)addServiceClient:(id)a3 identifier:(id)a4 processName:(id)a5 configuration:(id)a6;
- (id)printableState;
- (optional<unsigned)_generateUwbSessionIdForNewServiceClientWithProcessName:(id)a3 parsedAccessoryConfigData:(const void *)a4 debugParameters:(id)a5;
- (void)_cleanupExcessiveDetachedSessions;
- (void)_prepareUwbSessionTrackingObjectsForClientTracking:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5 outShareableConfigData:(id *)a6;
- (void)_prepareUwbSessionTrackingObjectsFromDebugParameters:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5;
- (void)_relayToClientsOfUWBSessionId:(unsigned int)a3 blockToRelay:(id)a4;
- (void)_serviceRequestForUWBSessionID:(unsigned int)a3 didUpdateStatus:(ServiceRequestStatusUpdate)a4;
- (void)_updateUwbSessionState:(unsigned int)a3;
- (void)notifyServiceClientWithIdentifier:(id)a3 isRunning:(BOOL)a4;
- (void)removeServiceClientWithIdentifier:(id)a3;
@end

@implementation NIServerNearbyAccessoryRangingService

+ (id)sharedInstance
{
  if (qword_1007FBF78 != -1) {
    dispatch_once(&qword_1007FBF78, &stru_1007B8248);
  }
  return (id)qword_1007FBF70;
}

- (id)addServiceClient:(id)a3 identifier:(id)a4 processName:(id)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100248514;
  v32 = sub_100248524;
  id v33 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10024852C;
  v21[3] = &unk_1007B8270;
  id v22 = v11;
  v23 = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v10;
  v27 = &v28;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync(queue, v21);
  id v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (void)removeServiceClientWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100248F7C;
  v7[3] = &unk_1007A2248;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)notifyServiceClientWithIdentifier:(id)a3 isRunning:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100249220;
  block[3] = &unk_1007B1690;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (id)printableState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100248514;
  id v10 = sub_100248524;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100249548;
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
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100248514;
  id v19 = sub_100248524;
  v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_autoreleasePoolPush();
  double v4 = sub_100023CC4();
  v5 = (void *)v16[5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d clients",  -[NSMutableDictionary count](self->_clientTracking, "count")));
  [v5 addObject:v6];

  clientTracking = self->_clientTracking;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100249768;
  v14[3] = &unk_1007B8298;
  v14[4] = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientTracking, "enumerateKeysAndObjectsUsingBlock:", v14);
  uint64_t v8 = (void *)v16[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d UWB sessions",  -[NSMutableDictionary count](self->_uwbSessionTracking, "count")));
  [v8 addObject:v9];

  uwbSessionTracking = self->_uwbSessionTracking;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100249AE8;
  v13[3] = &unk_1007B82C0;
  v13[4] = &v15;
  *(double *)&v13[5] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( uwbSessionTracking,  "enumerateKeysAndObjectsUsingBlock:",  v13);
  objc_autoreleasePoolPop(v3);
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)_initInternal
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NIServerNearbyAccessoryRangingService;
  v2 = -[NIServerNearbyAccessoryRangingService init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    double v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nearbyd.accessory-ranging-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    clientTracking = v2->_clientTracking;
    v2->_clientTracking = v9;

    id v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uwbSessionTracking = v2->_uwbSessionTracking;
    v2->_uwbSessionTracking = v11;

    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")
      || (id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults")),
          unsigned int v14 = [v13 BOOLForKey:@"EnableStateDump"],
          v13,
          v14))
    {
      uint64_t v15 = v2->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10024A19C;
      v17[3] = &unk_1007B1E00;
      id v18 = v2;
      os_state_add_handler(v15, v17);
    }
  }

  return v2;
}

- (optional<unsigned)_generateUwbSessionIdForNewServiceClientWithProcessName:(id)a3 parsedAccessoryConfigData:(const void *)a4 debugParameters:(id)a5
{
  id v40 = a3;
  id v39 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKey:@"UWBSessionIdOverride"]);
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        id v11 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = [v9 unsignedIntValue];
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Generate UWB session ID - process %@ will use UWB session ID %u in overrides",  buf,  0x12u);
        }

        LODWORD(v12) = [v9 unsignedIntValue];
        unint64_t v13 = 0LL;
        int v14 = v12 & 0xFFFFFF00;
        uint64_t v15 = (uint64_t)&_mh_execute_header;
        goto LABEL_28;
      }
    }
  }

  if (*((_BYTE *)a4 + 39))
  {
    v38 = a4;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3812000000LL;
    v60 = sub_10024A794;
    v61 = nullsub_109;
    uint64_t v62 = 0LL;
    char v63 = 0;
    char v64 = 0;
    do
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v17 = [v16 BOOLForKey:@"AccessoryUse32BitUwbSessionId"];

      if (v17)
      {
        uint64_t v18 = NSRandomData(4LL, 0LL);
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        [v19 getBytes:&v50 length:4];
        int v20 = v50;
      }

      else
      {
        uint64_t v21 = NSRandomData(2LL, 0LL);
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
        [v19 getBytes:&v50 length:2];
        int v20 = (unsigned __int16)v50;
      }

      uint64_t v22 = *(void *)&buf[8];
      *(_DWORD *)(*(void *)&buf[8] + 48LL) = v20;
      *(_BYTE *)(v22 + 52) = 1;
      uwbSessionTracking = self->_uwbSessionTracking;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_10024A7AC;
      v54[3] = &unk_1007B82E8;
      v54[4] = buf;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( uwbSessionTracking,  "enumerateKeysAndObjectsUsingBlock:",  v54);
    }

    while (!*(_BYTE *)(*(void *)&buf[8] + 52LL));
    uint64_t v50 = 0LL;
    v51 = &v50;
    uint64_t v52 = 0x2020000000LL;
    char v53 = 0;
    __int16 v49 = 0;
    if (!*((_BYTE *)a4 + 39)) {
      sub_100006080();
    }
    sub_10024A888((uint64_t)a4, (_BYTE *)&v49 + 1, &v49);
    char v24 = HIBYTE(v49);
    char v25 = v49;
    BOOL v26 = v49 != 0;
    v27 = self->_uwbSessionTracking;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10024A92C;
    v41[3] = &unk_1007B8310;
    id v28 = v40;
    BOOL v46 = v26;
    char v47 = v24;
    char v48 = v25;
    id v42 = v28;
    v43 = buf;
    v44 = &v50;
    v45 = v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v41);
    if (!*(_BYTE *)(*(void *)&buf[8] + 52LL)) {
      __assert_rtn( "-[NIServerNearbyAccessoryRangingService _generateUwbSessionIdForNewServiceClientWithProcessName:parsedAccessoryC onfigData:debugParameters:]",  "NIServerNearbyAccessoryRangingService.mm",  813,  "uwbSessionId.has_value()");
    }
    int v29 = *((unsigned __int8 *)v51 + 24);
    uint64_t v30 = (os_log_s *)(id)qword_1008000A0;
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        if (!*(_BYTE *)(*(void *)&buf[8] + 52LL)) {
          sub_100006080();
        }
        int v32 = *(_DWORD *)(*(void *)&buf[8] + 48LL);
        *(_DWORD *)v55 = 138412546;
        id v56 = v28;
        __int16 v57 = 1024;
        int v58 = v32;
        id v33 = "#accessory-service,Generate UWB session ID - process %@ will use existing UWB session ID %u";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v33, v55, 0x12u);
      }
    }

    else if (v31)
    {
      if (!*(_BYTE *)(*(void *)&buf[8] + 52LL)) {
        sub_100006080();
      }
      int v36 = *(_DWORD *)(*(void *)&buf[8] + 48LL);
      *(_DWORD *)v55 = 138412546;
      id v56 = v28;
      __int16 v57 = 1024;
      int v58 = v36;
      id v33 = "#accessory-service,Generate UWB session ID - process %@ will use new UWB session ID %u";
      goto LABEL_26;
    }

    uint64_t v12 = *(void *)(*(void *)&buf[8] + 48LL);
    int v14 = v12 & 0xFFFFFF00;
    unint64_t v13 = v12 & 0xFFFFFF0000000000LL;
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(buf, 8);
    uint64_t v15 = v12 & 0xFF00000000LL;
    goto LABEL_28;
  }

  v34 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003A1280((uint64_t)v40, v34, v35);
  }
  uint64_t v15 = 0LL;
  unint64_t v13 = 0LL;
  LOBYTE(v12) = 0;
  int v14 = 0;
LABEL_28:

  return (optional<unsigned int>)(v13 | v15 | v14 | v12);
}

- (void)_prepareUwbSessionTrackingObjectsForClientTracking:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5 outShareableConfigData:(id *)a6
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (*((_BYTE *)a4 + 504)) {
    *((_BYTE *)a4 + 504) = 0;
  }
  if (*((_BYTE *)a5 + 112)) {
    *((_BYTE *)a5 + 112) = 0;
  }
  *a6 = 0LL;
  if (v10)
  {
    v147 = a6;
    v149 = (void *)objc_claimAutoreleasedReturnValue([v10 niConfiguration]);
    id v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 processName]);
      unsigned int v13 = [v10 uwbSessionId];
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v149 debugParameters]);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Prep session objects: process %@, UWB session ID %u. Configuration debug parameters: %@",  buf,  0x1Cu);
    }

    if (!+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v149 debugParameters]);
      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v149 debugParameters]);
        BOOL v17 = [v16 count] == 0;

        if (!v17) {
          goto LABEL_237;
        }
      }
    }

    if ([v149 dataExchangeDisabledAndUsingParameterOverrides])
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v149 debugParameters]);
      -[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:]( self,  "_prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:",  v18,  a4,  a5);

LABEL_237:
      goto LABEL_238;
    }

    if (!*((_BYTE *)[v10 parsedAccessoryConfigData] + 39))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A1314();
      }
      goto LABEL_237;
    }

    objc_super v19 = (unsigned __int8 *)[v10 parsedAccessoryConfigData];
    if (!v19[39]) {
      sub_100006080();
    }
    int v146 = v19[32];
    int v20 = *(unsigned __int16 *)(v19 + 33);
    int v21 = v19[4];
    __int16 v172 = 0;
    v145 = v19;
    sub_10024A888((uint64_t)v19, (_BYTE *)&v172 + 1, &v172);
    LODWORD(v144) = v172;
    HIDWORD(v144) = HIBYTE(v172);
    BOOL v148 = (HIBYTE(v172) | v172) != 0;
    uint64_t v22 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "Multicast SS-TWR";
      if (!(_DWORD)v144) {
        v23 = "Unicast";
      }
      if (HIDWORD(v144)) {
        v23 = "Multicast aDS-TWR";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Prep session objects: %s ranging mode",  buf,  0xCu);
    }

    if (v148 && v146 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A13C4();
      }
      goto LABEL_237;
    }

    v135 = v145 + 8;
    BOOL v24 = v145[8] && (v145[8] != 1 || v145[9]);
    BOOL v25 = *(unsigned __int16 *)((char *)v145 + 35) > 0x64u && v24;
    do
    {
      uint64_t v26 = NSRandomData(2LL, 0LL);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      [v27 getBytes:buf length:2];
      int v28 = *(unsigned __int16 *)buf;
    }

    while (v28 == v20);
    int v29 = (void *)objc_claimAutoreleasedReturnValue([v149 debugParameters]);
    v140 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"LocalAddressOverride"]);

    if (v140)
    {
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber, v30);
      if ((objc_opt_isKindOfClass(v140, v31) & 1) != 0) {
        LOWORD(v28) = (unsigned __int16)[v140 intValue];
      }
    }

    uint64_t v32 = NSRandomData(6LL, 0LL);
    id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    [v33 getBytes:buf length:6];

    __int16 v171 = *(_WORD *)&buf[4];
    int v170 = *(_DWORD *)buf;
    v34 = (void *)objc_claimAutoreleasedReturnValue([v149 debugParameters]);
    v143 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"STSInitVectorOverride"]);

    if (v143)
    {
      uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSData, v35);
      if ((objc_opt_isKindOfClass(v143, v36) & 1) != 0 && [v143 length] == (id)6) {
        [v143 getBytes:&v170 length:6];
      }
    }

    if ((_DWORD)v144) {
      char v37 = 10;
    }
    else {
      char v37 = 0;
    }
    if ((_DWORD)v144) {
      int v38 = 12;
    }
    else {
      int v38 = 6;
    }
    if (HIDWORD(v144)) {
      char v39 = 30;
    }
    else {
      char v39 = v37;
    }
    if (HIDWORD(v144)) {
      int v40 = 31;
    }
    else {
      int v40 = v38;
    }
    if (v144) {
      int v41 = 2400;
    }
    else {
      int v41 = 3600;
    }
    unsigned int v136 = v41;
    unsigned int v137 = v40;
    char v42 = sub_10024C008(v146 != 1, v148);
    if ([v149 backgroundMode])
    {
      if (!v21)
      {
        if (v148)
        {
          int v134 = 0;
          unsigned __int16 v44 = 2160;
        }

        else
        {
          if (v146 == 1)
          {
            if ((v42 & 1) != 0)
            {
              int v134 = 0;
              unsigned __int16 v44 = 1944;
              goto LABEL_91;
            }

- (void)_prepareUwbSessionTrackingObjectsFromDebugParameters:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8) {
    __assert_rtn( "-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:]",  "NIServerNearbyAccessoryRangingService.mm",  1266,  "debugParameters");
  }
  if (*((_BYTE *)a4 + 504)) {
    *((_BYTE *)a4 + 504) = 0;
  }
  if (*((_BYTE *)a5 + 112)) {
    *((_BYTE *)a5 + 112) = 0;
  }
  uint64_t v94 = 0LL;
  uint64_t v95 = &v94;
  uint64_t v96 = 0x2020000000LL;
  char v97 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472LL;
  v91[2] = sub_10024D590;
  v91[3] = &unk_1007B8338;
  id v9 = v8;
  id v92 = v9;
  int v93 = &v94;
  [&off_1007D2268 enumerateObjectsUsingBlock:v91];
  if (!*((_BYTE *)v95 + 24))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"InitiatorRoleOverride"]);
    char v64 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"UWBChannelOverride"]);
    unint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"UWBSessionIdOverride"]);
    v70 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"NumRSTUsPerSlotOverride"]);
    v69 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"NumSlotsPerRoundOverride"]);
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"NumRoundsPerBlockOverride"]);
    v72 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"STSInitVectorOverride"]);
    v67 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"LocalAddressOverride"]);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"PeerAddressOverride"]);
    v65 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"UseDedicatedAntennaOverride"]);
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"RangingModeOverride"]);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MulticastCapSizeMaxOverride"]);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"MulticastCapSizeMinOverride"]);
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"SBREnabledLocallyOverride"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"SBREnabledRemotelyOverride"]);
    double v58 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"StartTimeOffsetUsecOverride"]);
    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"StartTimeUncertaintyUsecOverride"]);
    double v59 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"InitiatorCrossSessionOffsetMsecOverride"]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"AOPSubratingEnabledOverride"]);
    unsigned int v60 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config0_Subrate"]);
    char v53 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config0_DistanceThresholdMeters"]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config0_HysteresisMeters"]);
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config1_Subrate"]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config1_DistanceThresholdMeters"]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config1_HysteresisMeters"]);
    unsigned int v14 = [v10 BOOLValue];
    [v72 getBytes:&v89 length:6];
    __int16 v73 = 0;
    char v74 = 0;
    unsigned int v75 = [v71 unsignedIntValue];
    unsigned __int16 v76 = (unsigned __int16)[v70 unsignedShortValue];
    unsigned __int16 v77 = (unsigned __int16)[v69 unsignedShortValue];
    unsigned __int16 v78 = (unsigned __int16)[v68 unsignedShortValue];
    int v79 = v89;
    __int16 v80 = v90;
    id v81 = [v67 unsignedLongLongValue];
    id v82 = [v66 unsignedLongLongValue];
    uint64_t v83 = 0x400000003LL;
    unsigned __int8 v84 = [v65 BOOLValue];
    __int16 v85 = 257;
    unsigned __int8 v86 = [v11 BOOLValue];
    int v87 = 50528256;
    int v88 = 6;
    unsigned __int16 v15 = sub_10032BDE8((unsigned __int16)[v64 unsignedIntValue] | 0x10000u);
    if (v15 < 0x100u)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A1534();
      }
LABEL_72:

      goto LABEL_73;
    }

    LOBYTE(v73) = v15;
    if ([v63 isEqualToString:@"Multicast aDS-TWR"])
    {
      id v16 = sub_100005150();
      if (!sub_100355260((uint64_t)v16))
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_1003A15B8();
        }
        goto LABEL_72;
      }

      LOBYTE(v87) = 1;
    }

    else
    {
      BYTE1(v87) = 1;
    }

    HIBYTE(v87) = [v56 unsignedIntValue];
    BYTE2(v87) = [v55 unsignedIntValue];
LABEL_18:
    BOOL v17 = v10;
    if (v14) {
      sub_1001418EC((char *)&v73, (uint64_t)__src);
    }
    else {
      sub_100141C3C((char *)&v73, (uint64_t)__src);
    }
    int v18 = *((unsigned __int8 *)a4 + 504);
    memcpy(a4, __src, 0x1F8uLL);
    if (!v18) {
      *((_BYTE *)a4 + 504) = 1;
    }
    id v10 = v17;
    if ([v62 BOOLValue])
    {
      if (!*((_BYTE *)a4 + 504)) {
        goto LABEL_77;
      }
      *((_DWORD *)a4 + 17) |= 8u;
    }

    if ([v61 BOOLValue] && (int)objc_msgSend(v60, "intValue") >= 1)
    {
      if (!*((_BYTE *)a4 + 504)) {
        goto LABEL_77;
      }
      unsigned __int8 v19 = [v60 intValue];
      [v53 doubleValue];
      double v21 = v20;
      [v54 doubleValue];
      unint64_t v23 = vcvtd_n_u64_f64(v21, 2uLL);
      if (v23 >= 0x7F) {
        LOBYTE(v23) = 127;
      }
      if (v21 <= 0.0) {
        unsigned __int8 v24 = 0;
      }
      else {
        unsigned __int8 v24 = v23;
      }
      unint64_t v25 = vcvtd_n_u64_f64(v22, 2uLL);
      if (v25 >= 0xF) {
        LOWORD(v25) = 15;
      }
      if (!v19 || !v24) {
        goto LABEL_70;
      }
      unsigned __int8 v26 = v19;
      uint64_t v27 = 0LL;
      int v28 = (char *)a4 + 68;
      char v29 = 1;
      while (1)
      {
        char v30 = v29;
        uint64_t v31 = (char *)a4 + 2 * v27;
        __int16 v33 = *(_WORD *)(v31 + 87);
        uint64_t v32 = v31 + 87;
        if ((v33 & 1) == 0) {
          break;
        }
        char v29 = 0;
        uint64_t v27 = 1LL;
        if ((v30 & 1) == 0) {
          goto LABEL_70;
        }
      }

      if ((v29 & 1) == 0)
      {
        unsigned int v51 = *(unsigned __int16 *)((char *)a4 + 87);
        if (((v51 >> 1) & 0xF) >= v26 || ((v51 >> 5) & 0x7F) >= v24)
        {
LABEL_70:
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_1003A1560();
          }
          goto LABEL_72;
        }
      }

      __int16 v34 = (_WORD)v25 << 12;
      if (v22 <= 0.0) {
        __int16 v34 = 0;
      }
      *uint64_t v32 = v34 & 0xF001 | (2 * (v26 & 0xF)) & 0x1F | (32 * (v24 & 0x7F)) | 1;
      if ((int)[v52 intValue] >= 1)
      {
        if (*((_BYTE *)a4 + 504))
        {
          unsigned __int8 v35 = [v52 intValue];
          [v12 doubleValue];
          double v37 = v36;
          [v13 doubleValue];
          unint64_t v39 = vcvtd_n_u64_f64(v37, 2uLL);
          if (v39 >= 0x7F) {
            LODWORD(v39) = 127;
          }
          unint64_t v40 = vcvtd_n_u64_f64(v38, 2uLL);
          if (v37 <= 0.0) {
            unsigned int v41 = 0;
          }
          else {
            unsigned int v41 = v39;
          }
          __int16 v42 = 15;
          if (v40 < 0xF) {
            __int16 v42 = v40;
          }
          if (v38 <= 0.0) {
            __int16 v43 = 0;
          }
          else {
            __int16 v43 = v42;
          }
          if ((sub_10024C544((uint64_t)v28, v35, v41, v43) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_1003A158C();
            }
            goto LABEL_72;
          }

          goto LABEL_60;
        }

- (BOOL)_buildAndRunRangingSession:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uwbSessionTracking = self->_uwbSessionTracking;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](uwbSessionTracking, "objectForKey:", v6));

  if (!v7)
  {
    BOOL v24 = 0;
    goto LABEL_56;
  }

  id v8 = self;
  std::to_string(&v40, v3);
  id v9 = [v7 serviceRequest];
  id v10 = sub_100288340();
  uint64_t v11 = v10[20];
  uint64_t v12 = (std::__shared_weak_count *)v10[21];
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }

  unsigned __int16 v15 = (std::__shared_weak_count *)operator new(0x5D8uLL);
  v15->__shared_owners_ = 0LL;
  v15->__shared_weak_owners_ = 0LL;
  v15->__vftable = (std::__shared_weak_count_vtbl *)off_1007B8488;
  id v16 = v8;
  v55[0] = off_1007B84D8;
  v55[1] = v16;
  int v56 = v3;
  __int16 v57 = v55;
  BOOL v17 = v16;
  v52[0] = off_1007B8580;
  v52[1] = v17;
  int v53 = v3;
  v54 = v52;
  int v18 = v17;
  v49[0] = off_1007B8620;
  v49[1] = v18;
  int v50 = v3;
  unsigned int v51 = v49;
  unsigned int v48 = 0LL;
  unsigned __int8 v46 = 0LL;
  uint64_t v43 = v11;
  unsigned int v44 = v12;
  sub_100275D84( &v15[1].__vftable,  (__int128 *)&v40,  v9,  (uint64_t)v55,  (uint64_t)v52,  (uint64_t)v49,  (uint64_t)v47,  (uint64_t)v45,  &v43);
  unsigned __int8 v19 = v44;
  if (v44)
  {
    double v20 = (unint64_t *)&v44->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  double v22 = v46;
  if (v46 == v45)
  {
    uint64_t v23 = 4LL;
    double v22 = v45;
  }

  else
  {
    if (!v46) {
      goto LABEL_16;
    }
    uint64_t v23 = 5LL;
  }

  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_16:
  unint64_t v25 = v48;
  if (v48 == v47)
  {
    uint64_t v26 = 4LL;
    unint64_t v25 = v47;
  }

  else
  {
    if (!v48) {
      goto LABEL_21;
    }
    uint64_t v26 = 5LL;
  }

  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_21:
  uint64_t v27 = v51;
  if (v51 == v49)
  {
    uint64_t v28 = 4LL;
    uint64_t v27 = v49;
  }

  else
  {
    if (!v51) {
      goto LABEL_26;
    }
    uint64_t v28 = 5LL;
  }

  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_26:
  char v29 = v54;
  if (v54 == v52)
  {
    uint64_t v30 = 4LL;
    char v29 = v52;
  }

  else
  {
    if (!v54) {
      goto LABEL_31;
    }
    uint64_t v30 = 5LL;
  }

  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_31:
  uint64_t v31 = v57;
  if (v57 == v55)
  {
    uint64_t v32 = 4LL;
    uint64_t v31 = v55;
  }

  else
  {
    if (!v57) {
      goto LABEL_36;
    }
    uint64_t v32 = 5LL;
  }

  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_36:
  unsigned int v41 = &v15[1].__vftable;
  __int16 v42 = v15;
  sub_100012538((uint64_t)&v41, &v15[1].__shared_weak_owners_, (uint64_t)&v15[1]);
  if (!v41)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A1678();
    }
    goto LABEL_49;
  }

  int v33 = sub_10026FF14((uint64_t)v41);
  if (v33)
  {
    __int16 v34 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v33, v55);
      sub_1003A16F0();
    }

- (void)_updateUwbSessionState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uwbSessionTracking = self->_uwbSessionTracking;
  unsigned int v20 = v3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](uwbSessionTracking, "objectForKey:", v6));

  if (v7) {
    BOOL v8 = *(void *)[v7 rangingSession] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 interestedClients]);
  if ([v9 count]) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = [v7 persistWhileDetached];
  }

  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 interestedClients]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10024DFF0;
  v21[3] = &unk_1007B8360;
  void v21[4] = self;
  v21[5] = &v22;
  [v11 enumerateObjectsUsingBlock:v21];

  uint64_t v12 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *((unsigned __int8 *)v23 + 24);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 interestedClients]);
    unsigned int v15 = [v14 count];
    unsigned int v16 = [v7 persistWhileDetached];
    *(_DWORD *)buf = 67110656;
    unsigned int v27 = v20;
    __int16 v28 = 1024;
    BOOL v29 = v7 != 0LL;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    __int16 v32 = 1024;
    unsigned int v33 = v10;
    __int16 v34 = 1024;
    int v35 = v13;
    __int16 v36 = 1024;
    unsigned int v37 = v15;
    __int16 v38 = 1024;
    unsigned int v39 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Update session state for UWB session ID %u. Currently: tracking %d, ranging %d. Should be: trac king %d, ranging %d. Clients: %d. Persist-detached: %d.",  buf,  0x2Cu);
  }

  if ((v7 != 0LL) | (v10 ^ 1) & 1)
  {
    if (v7) {
      char v17 = v10;
    }
    else {
      char v17 = 1;
    }
    if ((v17 & 1) != 0)
    {
      if (v7)
      {
        if (v8)
        {
          if (!*((_BYTE *)v23 + 24)) {
            [v7 stopRanging];
          }
        }

        else if (*((_BYTE *)v23 + 24))
        {
          if (*(void *)[v7 rangingSession]) {
            __assert_rtn( "-[NIServerNearbyAccessoryRangingService _updateUwbSessionState:]",  "NIServerNearbyAccessoryRangingService.mm",  1541,  "uwbSessionTracking.rangingSession == nullptr");
          }
          if (!-[NIServerNearbyAccessoryRangingService _buildAndRunRangingSession:]( self,  "_buildAndRunRangingSession:",  v20)) {
            -[NIServerNearbyAccessoryRangingService _relayToClientsOfUWBSessionId:blockToRelay:]( self,  "_relayToClientsOfUWBSessionId:blockToRelay:",  v20,  &stru_1007B83A0);
          }
        }
      }
    }

    else
    {
      [v7 stopRanging];
      int v18 = self->_uwbSessionTracking;
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v20));
      -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
  {
    sub_1003A173C();
  }

  _Block_object_dispose(&v22, 8);
}

- (void)_cleanupExcessiveDetachedSessions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"NIAccessoryMaxDetachedSessionsOverride"]);

  if (v4 && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)) {
    unsigned int v7 = [v4 unsignedIntValue];
  }
  else {
    unsigned int v7 = 12;
  }
  BOOL v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uwbSessionTracking = self->_uwbSessionTracking;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10024E27C;
  v13[3] = &unk_1007B83C8;
  unsigned int v10 = v8;
  unint64_t v14 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( uwbSessionTracking,  "enumerateKeysAndObjectsUsingBlock:",  v13);
  if ((unint64_t)-[NSMutableArray count](v10, "count") > v7)
  {
    uint64_t v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = -[NSMutableArray count](v10, "count");
      *(_DWORD *)buf = 67109376;
      unsigned int v16 = v12;
      __int16 v17 = 1024;
      unsigned int v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Cleaning up detached sessions. %d found, exceeds max of %d",  buf,  0xEu);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_uwbSessionTracking, "removeObjectsForKeys:", v10);
  }
}

- (void)_serviceRequestForUWBSessionID:(unsigned int)a3 didUpdateStatus:(ServiceRequestStatusUpdate)a4
{
  int var2 = a4.var2;
  uint64_t v5 = *(void *)&a4.var0;
  uint64_t v6 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000065CC(v36, off_1007B87D8[v5 >> 32]);
    int v9 = v37;
    unsigned int v10 = (void **)v36[0];
    sub_1000065CC(__p, off_1007B8850[var2]);
    uint64_t v11 = v36;
    if (v9 < 0) {
      uint64_t v11 = v10;
    }
    if (v35 >= 0) {
      unsigned int v12 = __p;
    }
    else {
      unsigned int v12 = (void **)__p[0];
    }
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v6;
    __int16 v39 = 2080;
    std::string v40 = v11;
    __int16 v41 = 2080;
    __int16 v42 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Service request status update for UWB session ID %u. Event type: %s. Reason: %s",  (uint8_t *)&buf,  0x1Cu);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    if (v37 < 0) {
      operator delete(v36[0]);
    }
  }

  uwbSessionTracking = self->_uwbSessionTracking;
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](uwbSessionTracking, "objectForKey:", v14));

  if ([v15 rangingRetryCount] > 7)
  {
    uint64_t v26 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      id buf = (id)0x804000100LL;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#accessory-service,Max # of retries (%d) reached. Stop tracking peer.",  (uint8_t *)&buf,  8u);
    }

- (void)_relayToClientsOfUWBSessionId:(unsigned int)a3 blockToRelay:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientTracking = self->_clientTracking;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10024EA94;
  v12[3] = &unk_1007B8430;
  unsigned int v13 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysOfEntriesPassingTest:](clientTracking, "keysOfEntriesPassingTest:", v12));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10024EAC4;
  v10[3] = &unk_1007B8458;
  id v9 = v6;
  v10[4] = self;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (void).cxx_destruct
{
}

@end