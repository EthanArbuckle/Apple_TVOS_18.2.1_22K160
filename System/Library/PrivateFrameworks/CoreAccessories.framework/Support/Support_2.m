void platform_notifications_propertiesDidChangeForConnectionUUID(uint64_t a1, void *a2, void *a3)
{
  BOOL v6;
  id v7;
  os_log_s *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  if (gLogObjects) {
    v6 = gNumLogObjects < 7;
  }
  else {
    v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v8 = (os_log_s *)&_os_log_default;
    v7 = &_os_log_default;
  }

  else
  {
    v8 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[#Notifications] Informing transport clients/plugins that properties have changed for connection %@...",  buf,  0xCu);
  }

  if (a1)
  {
    v17 = a1;
    v14 = ACCTransportPlugin_PropertiesDidChangeNotification_ConnectionUUID;
    v15 = ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesOld;
    v9 = a2;
    if (!a2) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v14, v15));
    }
    v18 = v9;
    v16 = ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesNew;
    v10 = a3;
    if (!a3) {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v19 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v14,  3LL));
    if (a3)
    {
      if (a2)
      {
LABEL_18:
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  v14,  v15,  v16,  v17,  v18));
        [v12 postNotificationName:ACCTransportPlugin_ConnectionPropertiesDidChangeNotification object:0 userInfo:v11];

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportServer sharedServer](&OBJC_CLASS___ACCTransportServer, "sharedServer"));
        [v13 propertiesDidChange:a3 forConnectionWithUUID:a1 previousProperties:a2];

        return;
      }
    }

    else
    {

      if (a2) {
        goto LABEL_18;
      }
    }

    goto LABEL_18;
  }

void platform_notifications_propertiesDidChangeForEndpointUUID(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 7;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    v10 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = a1;
    __int16 v23 = 2112;
    uint64_t v24 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[#Notifications] Informing transport clients/plugins that properties have changed for endpoint %@ (connection %@)...",  buf,  0x16u);
  }

  if (a1 && a2)
  {
    v20[0] = a1;
    uint64_t v16 = ACCTransportPlugin_EndpointPropertiesDidChangeNotification_EndpointUUID;
    uint64_t v17 = ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesOld;
    v11 = a3;
    if (!a3) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null", v16, v17));
    }
    v20[1] = v11;
    uint64_t v18 = ACCTransportPlugin_PropertiesDidChangeNotification_PropertiesNew;
    v12 = a4;
    if (!a4) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    uint64_t v19 = ACCTransportPlugin_PropertiesDidChangeNotification_ConnectionUUID;
    v20[2] = v12;
    v20[3] = a2;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  &v16,  4LL));
    if (a4)
    {
      if (a3)
      {
LABEL_19:
        v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  v16,  v17,  v18));
        [v14 postNotificationName:ACCTransportPlugin_EndpointPropertiesDidChangeNotification object:0 userInfo:v13];

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportServer sharedServer](&OBJC_CLASS___ACCTransportServer, "sharedServer"));
        [v15 propertiesDidChange:a4 forEndpointWithUUID:a1 previousProperties:a3 connectionUUID:a2];

        return;
      }
    }

    else
    {

      if (a3) {
        goto LABEL_19;
      }
    }

    goto LABEL_19;
  }

void *ea_endpoint_create(pthread_mutex_t *a1)
{
  if (a1)
  {
    v2 = calloc(1uLL, 8uLL);
    v3 = v2;
    if (v2)
    {
      void *v2 = a1;
      acc_endpoint_setProperty(a1, kCFACCProperties_Endpoint_EA_SessionOpen, kCFBooleanFalse);
    }
  }

  else
  {
    v5 = (os_log_s *)logObjectForModule_31();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      accSNTPTimeSync_endpoint_create_cold_1(v5);
    }
    return 0LL;
  }

  return v3;
}

void *logObjectForModule_31()
{
  uint64_t v0 = gLogObjects;
  int v1 = gNumLogObjects;
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 19;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2) {
    return *(void **)(gLogObjects + 144);
  }
  v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    acc_nvmInfo_getPairingStatus_cold_1(v0, v1);
  }
  return v3;
}

void *ea_endpoint_publish(void *result)
{
  if (result) {
    return (void *)(*result != 0LL);
  }
  return result;
}

uint64_t ea_endpoint_destroy(uint64_t result)
{
  if (result)
  {
    int v1 = (void *)result;
    result = *(void *)result;
    if (result)
    {
      free((void *)result);
      *int v1 = 0LL;
      return 1LL;
    }
  }

  return result;
}

BOOL mfi4Auth_protocol_initSessionCommon( uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5, const void *a6, unsigned int a7)
{
  if (a5 >= 5)
  {
    if (gLogObjects && gNumLogObjects >= 56)
    {
      v14 = *(os_log_s **)(gLogObjects + 440);
    }

    else
    {
      v14 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      mfi4Auth_protocol_initSessionCommon_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  else
  {
    *(void *)(a1 + 8) = calloc(1uLL, 0x1001FuLL);
    *(_WORD *)(a1 + 112) = 770;
    *(void *)(a1 + 120) = a5;
    memcpy((void *)(a1 + 114), a4, a5);
    if (a6 && a7)
    {
      *(void *)(a1 + 136) = a7;
      memcpy((void *)(a1 + 128), a6, a7);
    }

    else
    {
      *(void *)(a1 + 136) = 0LL;
    }

    *(_DWORD *)(a1 + 652) = 13;
    *(_DWORD *)(a1 + 24) = a3;
    *(void *)(a1 + 16) = calloc(1uLL, a3);
    *(void *)a1 = a2;
    *(_BYTE *)(a1 + 30) = 0;
    *(void *)(a1 + 72) = 0LL;
    *(void *)(a1 + 80) = 0LL;
  }

  return a5 < 5;
}

uint64_t mfi4Auth_protocol_cleanupSessionCommon(void *a1)
{
  if (a1)
  {
    mfi4Auth_relay_cleanup((uint64_t)a1);
    BOOL v2 = (void *)a1[55];
    if (v2)
    {
      free(v2);
      a1[55] = 0LL;
    }

    v3 = (void *)a1[57];
    if (v3)
    {
      free(v3);
      a1[57] = 0LL;
    }

    v4 = (void *)a1[59];
    if (v4)
    {
      free(v4);
      a1[59] = 0LL;
    }

    v5 = (void *)a1[43];
    if (v5)
    {
      free(v5);
      a1[43] = 0LL;
    }

    v6 = (void *)a1[45];
    if (v6)
    {
      free(v6);
      a1[45] = 0LL;
    }

    v7 = (void *)a1[47];
    if (v7)
    {
      free(v7);
      a1[47] = 0LL;
    }

    BOOL v8 = (void *)a1[2];
    if (v8)
    {
      free(v8);
      a1[2] = 0LL;
    }

    id v9 = (void *)a1[12];
    if (v9)
    {
      free(v9);
      a1[12] = 0LL;
    }

    platform_sleepAssertion_createForApplePencil(a1[1]);
    v10 = (void *)a1[1];
    if (v10)
    {
      free(v10);
      a1[1] = 0LL;
    }
  }

  if (gLogObjects && gNumLogObjects >= 56)
  {
    v11 = *(os_log_s **)(gLogObjects + 440);
  }

  else
  {
    v11 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "mfi4Auth_protocol_cleanupSessionCommon";
    __int16 v15 = 1024;
    int v16 = 87;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v13, 0x12u);
  }

  return 1LL;
}

LABEL_57:
  a3->var21 = self->_local;
  a3->var0 |= 0x2000000u;
  if ((validMask & 0x8000000) == 0) {
    return;
  }
LABEL_23:
  a3->var22 = self->_chapterCount;
  a3->var0 |= 0x8000000u;
}

void init_logging()
{
  uint64_t v0 = (os_log_s **)gLogObjects;
  int v1 = gNumLogObjects;
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134218240;
      *(void *)int v16 = v0;
      *(_WORD *)&v16[8] = 1024;
      int v17 = v1;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  (uint8_t *)&v15,  0x12u);
      uint64_t v0 = (os_log_s **)gLogObjects;
      int v1 = gNumLogObjects;
    }
  }

  else
  {
    v3 = *(os_log_s **)gLogObjects;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v0 && v1 >= 1)
    {
      v4 = *v0;
    }

    else
    {
      v4 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134218240;
        *(void *)int v16 = v0;
        *(_WORD *)&v16[8] = 1024;
        int v17 = v1;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  (uint8_t *)&v15,  0x12u);
        uint64_t v0 = (os_log_s **)gLogObjects;
        int v1 = gNumLogObjects;
      }
    }

    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v0 && v1 >= 1)
    {
      v6 = *v0;
    }

    else
    {
      v6 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    int v15 = 67109376;
    *(_DWORD *)int v16 = v5;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "[Daemon] Info enabled: %d, [Daemon] Debug enabled: %d",  (uint8_t *)&v15,  0xEu);
    uint64_t v0 = (os_log_s **)gLogObjects;
    int v1 = gNumLogObjects;
  }

  if (v0 && v1 >= 1)
  {
    BOOL v8 = *v0;
  }

  else
  {
    BOOL v8 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = gLogObjects;
    int v10 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 20)
    {
      v11 = *(os_log_s **)(gLogObjects + 152);
    }

    else
    {
      v11 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134218240;
        *(void *)int v16 = v9;
        *(_WORD *)&v16[8] = 1024;
        int v17 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  (uint8_t *)&v15,  0x12u);
        uint64_t v9 = gLogObjects;
        int v10 = gNumLogObjects;
      }
    }

    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v9 && v10 >= 20)
    {
      int v13 = *(os_log_s **)(v9 + 152);
    }

    else
    {
      int v13 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    int v15 = 67109376;
    *(_DWORD *)int v16 = v12;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[iAP2: Link Layer] Info enabled: %d, [iAP2: Link Layer] Debug enabled: %d",  (uint8_t *)&v15,  0xEu);
  }

  init_logging_signposts();
}

void platform_assistiveTouch_accessoryAttached(uint64_t a1)
{
  if (gLogObjects && gNumLogObjects >= 35)
  {
    BOOL v2 = (os_log_s *)*(id *)(gLogObjects + 272);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v2 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "assistiveTouch accessoryAttached: %@",  (uint8_t *)&v5,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  [v4 accessoryAssistiveTouchAttached:a1];
}

void platform_assistiveTouch_accessoryDetached(uint64_t a1)
{
  if (gLogObjects && gNumLogObjects >= 35)
  {
    BOOL v2 = (os_log_s *)*(id *)(gLogObjects + 272);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v2 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "assistiveTouch accessoryDetached: %@",  (uint8_t *)&v5,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  [v4 accessoryAssistiveTouchDetached:a1];
}

void platform_assistiveTouch_setState(void *a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 35)
  {
    v4 = (os_log_s *)*(id *)(gLogObjects + 272);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    BOOL v8 = a1;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "assistiveTouch setState: %@ enabled=%d",  (uint8_t *)&v7,  0x12u);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  [v6 setEnabled:a1 flag:a2];
}

void platform_assistiveTouch_requestStatus(void *a1)
{
  if (gLogObjects && gNumLogObjects >= 35)
  {
    BOOL v2 = (os_log_s *)*(id *)(gLogObjects + 272);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v2 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "assistiveTouch requestState: %@",  (uint8_t *)&v5,  0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  [v4 requestState:a1];
}

void platform_assistiveTouch_notifyStateHandler(void *a1, unsigned int a2)
{
  id v3 = a1;
  if (gLogObjects && gNumLogObjects >= 35)
  {
    v4 = (os_log_s *)*(id *)(gLogObjects + 272);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 1024;
    unsigned int v9 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "assistiveTouch notifyState %@ enabled=%d",  (uint8_t *)&v6,  0x12u);
  }

  accFeatureHandlers_invokeHandler(v3, 17, a2);
}

void platform_assistiveTouch_incrementUserCount()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  [v0 incrementUserCount];

  int v1 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  unsigned int v2 = [v1 featureUserCount];

  if (v2 == 1)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[ACCFeaturePluginManager sharedManager](&OBJC_CLASS___ACCFeaturePluginManager, "sharedManager"));
    [v3 startPlugInsWithClasses:&off_100206B30];
  }

void platform_assistiveTouch_decrementUserCount()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue(+[ACCAssistiveTouchServer sharedServer](&OBJC_CLASS___ACCAssistiveTouchServer, "sharedServer"));
  [v0 decrementUserCount];
}

uint64_t iap2_deviceAuthentication_RequestDeviceCertificate(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t result = iap2_feature_getFeature(a1, 7u);
    if (result)
    {
      v4 = *(dispatch_queue_s **)(a1 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000LL;
      block[2] = __iap2_deviceAuthentication_RequestDeviceCertificate_block_invoke;
      block[3] = &__block_descriptor_tmp_21;
      block[4] = a1;
      dispatch_async(v4, block);
      return 1LL;
    }
  }

  return result;
}

uint64_t iap2_deviceAuthentication_RequestDeviceChallengeResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v33 = 0x2000000000LL;
  uint64_t v34 = 0LL;
  uint64_t v29 = 0x2000000000LL;
  uint64_t v30 = 0LL;
  if (a1 && a2)
  {
    if (iap2_feature_getFeature(a1, 7u))
    {
      uint64_t v25 = a1;
      unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
      if (FirstParam)
      {
        NextParam = (unsigned __int16 *)FirstParam;
        while (1)
        {
          if (v32[3]) {
            goto LABEL_27;
          }
          int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
          if (ParamID) {
            break;
          }
          ParamValueData = (const UInt8 *)iAP2MsgGetParamValueData((uint64_t)NextParam);
          unsigned int ParamValueLen = iAP2MsgGetParamValueLen(NextParam);
          unsigned int v14 = ParamValueLen;
          if (!ParamValueData || !ParamValueLen)
          {
            uint64_t v19 = gLogObjects;
            int v20 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 49)
            {
              uint64_t v21 = *(os_log_s **)(gLogObjects + 384);
            }

            else
            {
              uint64_t v21 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v36 = v19;
                *(_WORD *)&v36[8] = 1024;
                int v37 = v20;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
                uint64_t v21 = (os_log_s *)&_os_log_default;
              }
            }

            if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_26;
            }
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v36 = (unsigned __int16)ParamValueData;
            *(_WORD *)&v36[4] = 1024;
            *(_DWORD *)&v36[6] = v14;
            int v17 = v21;
            uint64_t v18 = "Auth challenge param malformed pChallengeBytes:%04X, challengeLength:%02X\n";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xEu);
            goto LABEL_26;
          }

          CFDataRef v15 = CFDataCreate(0LL, ParamValueData, ParamValueLen);
          v32[3] = (uint64_t)v15;
LABEL_26:
          NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
          if (!NextParam) {
            goto LABEL_27;
          }
        }

        int v8 = ParamID;
        uint64_t v9 = gLogObjects;
        int v10 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 49)
        {
          v11 = *(os_log_s **)(gLogObjects + 384);
        }

        else
        {
          v11 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v36 = v9;
            *(_WORD *)&v36[8] = 1024;
            int v37 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
            v11 = (os_log_s *)&_os_log_default;
          }
        }

        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        int MsgID = iAP2MsgGetMsgID(a2);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v36 = v8;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = MsgID;
        int v17 = v11;
        uint64_t v18 = "Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param";
        goto LABEL_25;
      }

uint64_t iap2_deviceAuthentication_DeviceAuthenticationFailed(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    if (iap2_feature_getFeature(a1, 7u))
    {
      uint64_t v2 = 1LL;
      _setDeviceAuthState(a1, 1);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

void _setDeviceAuthState(uint64_t a1, int a2)
{
  if (a1)
  {
    Feature = (int *)iap2_feature_getFeature(a1, 7u);
    if (Feature)
    {
      v4 = Feature;
      int *Feature = a2;
      if (gLogObjects && gNumLogObjects >= 49)
      {
        id v5 = *(os_log_s **)(gLogObjects + 384);
      }

      else
      {
        id v5 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = *v4;
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "authState: %d", (uint8_t *)v7, 8u);
      }
    }
  }

uint64_t iap2_deviceAuthentication_DeviceAuthenticationSucceeded(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t result = iap2_feature_getFeature(a1, 7u);
    if (result)
    {
      _setDeviceAuthState(a1, 2);
      return 1LL;
    }
  }

  return result;
}

void *_createFeature_24(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = calloc(1uLL, 4uLL);
  if (v2) {
    _setDeviceAuthState(a1, 0);
  }
  return v2;
}

uint64_t _destroyFeature_24(uint64_t result)
{
  if (result)
  {
    int v1 = (void *)result;
    uint64_t result = *(void *)result;
    if (result)
    {
      free((void *)result);
      *int v1 = 0LL;
      return 1LL;
    }
  }

  return result;
}

uint64_t _startFeatureFromDevice_15(uint64_t a1)
{
  if (gLogObjects && gNumLogObjects >= 49)
  {
    uint64_t v2 = *(os_log_s **)(gLogObjects + 384);
  }

  else
  {
    uint64_t v2 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Enabling Device Authentication Support...", v4, 2u);
  }

  _setDeviceAuthState(a1, 0);
  return 1LL;
}

uint64_t _checkIdentificationInfo_21(uint64_t a1)
{
  char v6 = 0;
  uint64_t v2 = iap2_identification_checkIdentificationMsgIDs( a1,  (uint64_t)&_checkIdentificationInfo__kMsgDeviceAuthList,  6u,  &v6);
  uint64_t v3 = v2;
  if (v6) {
    BOOL v4 = (_DWORD)v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    iap2_features_createFeature(a1, 7u);
    iap2_identification_setIdentifiedForFeature(a1, 7u);
  }

  return v3;
}

double iAP2LinkDeviceActionAttach(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionAttach_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionAttach_cold_2();
  }
  *a2 = 29;
  return iAP2LinkSetDefaultSYNParam(*(void *)(a1 + 16) + 410LL);
}

uint64_t *iAP2LinkDeviceActionSendResetSYNACK(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendResetSYNACK_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendResetSYNACK_cold_2();
  }
  __int16 v21 = -21846;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v19 = v3;
  __int128 v20 = v3;
  __int128 v18 = v3;
  *a2 = 29;
  uint64_t v4 = *(void *)(a1 + 16);
  char NewSeqNum = iAP2LinkGetNewSeqNum(v4);
  iAP2LinkConnectedCB(v4, 0);
  uint64_t v6 = *(void *)(v4 + 280);
  if (v6)
  {
    iAP2LinkSetDefaultSYNParam(v4 + 410);
    iAP2LinkResetSeqAck(v4, 1, 0);
    id v7 = *(__int128 **)(v4 + 352);
    __int128 v9 = v7[1];
    __int128 v8 = v7[2];
    __int128 v10 = *v7;
    *(_WORD *)(v4 + 408) = *((_WORD *)v7 + 24);
    *(_OWORD *)(v4 + 376) = v9;
    *(_OWORD *)(v4 + 392) = v8;
    *(_OWORD *)(v4 + 360) = v10;
    v11 = *(unsigned __int8 **)(v6 + 72);
    unsigned int PayloadLen = iAP2PacketGetPayloadLen(v6);
  }

  else
  {
    __int16 v21 = *(_WORD *)(v4 + 408);
    __int128 v13 = *(_OWORD *)(v4 + 376);
    __int128 v18 = *(_OWORD *)(v4 + 360);
    __int128 v19 = v13;
    __int128 v20 = *(_OWORD *)(v4 + 392);
  }

  iAP2LinkResetSend(v4);
  char v14 = *(_BYTE *)(v4 + 212);
  if ((v14 & 4) == 0)
  {
    *(_BYTE *)(v4 + 190) = NewSeqNum;
    *(_BYTE *)(v4 + 212) = v14 | 4;
  }

  SYNPacket = (uint64_t *)iAP2PacketCreateSYNPacket(v4);
  unsigned int v16 = *(_DWORD *)(v4 + 464) + 1;
  *(_DWORD *)(v4 + 464) = v16;
  ++*(_DWORD *)(v4 + 496);
  ++*(_DWORD *)(v4 + 504);
  if ((*(_BYTE *)(v4 + 212) & 0x20) == 0 && v16 >= 0xB) {
    *a2 = 20;
  }
  iAP2LinkSendPacket(v4, (uint64_t)SYNPacket, 0);
  return iAP2PacketRelease(SYNPacket);
}

void iAP2LinkDeviceActionSendDetect(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendDetect_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendDetect_cold_2();
  }
  *a2 = 29;
  uint64_t v2 = *(void *)(a1 + 16);
  iAP2LinkResetSeqAck(v2, 0, 1);
  __int128 v3 = *(__int128 **)(v2 + 352);
  __int128 v5 = v3[1];
  __int128 v4 = v3[2];
  __int128 v6 = *v3;
  *(_WORD *)(v2 + 408) = *((_WORD *)v3 + 24);
  *(_OWORD *)(v2 + 376) = v5;
  *(_OWORD *)(v2 + 392) = v4;
  *(_OWORD *)(v2 + 360) = v6;
  iAP2LinkConnectedCB(v2, 0);
  iAP2LinkSendDetectCB(v2, 0, v7, v8, v9, v10, v11, v12);
}

void iAP2LinkDeviceActionSendRST(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendRST_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendRST_cold_2();
  }
  if ((_iAP2LogEnableMask & 1) != 0)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 20;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      __int128 v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      __int128 v5 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(a1 + 10);
      v13[0] = 67109120;
      v13[1] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ERROR: iAP2LinkDeviceActionSendRST: iAP2 Link Layer reset triggered! (state: %d)",  (uint8_t *)v13,  8u);
    }
  }

  *a2 = 29;
  uint64_t v7 = *(void *)(a1 + 16);
  iAP2LinkResetSeqAck(v7, 0, 0);
  iAP2LinkSetDefaultSYNParam(v7 + 410);
  uint64_t v8 = *(__int128 **)(v7 + 352);
  __int128 v10 = v8[1];
  __int128 v9 = v8[2];
  __int128 v11 = *v8;
  *(_WORD *)(v7 + 408) = *((_WORD *)v8 + 24);
  *(_OWORD *)(v7 + 376) = v10;
  *(_OWORD *)(v7 + 392) = v9;
  *(_OWORD *)(v7 + 360) = v11;
  if ((*(_BYTE *)(v7 + 212) & 0x20) != 0 || *(_DWORD *)(v7 + 464) < 0xBu)
  {
    RSTPacket = (uint64_t *)iAP2PacketCreateRSTPacket(v7, *(_BYTE *)(v7 + 190));
    ++*(_DWORD *)(v7 + 584);
    iAP2LinkSendPacket(v7, (uint64_t)RSTPacket, 0);
    iAP2PacketRelease(RSTPacket);
  }

  else
  {
    *a2 = 20;
  }

uint64_t *iAP2LinkDeviceActionSendSYNACK(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendSYNACK_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendSYNACK_cold_2();
  }
  __int16 v17 = -21846;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v15 = v3;
  __int128 v16 = v3;
  __int128 v14 = v3;
  *a2 = 29;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(v4 + 280);
  if (v5)
  {
    int v6 = *(unsigned __int8 **)(v5 + 72);
    unsigned int PayloadLen = iAP2PacketGetPayloadLen(v5);
  }

  else
  {
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        uint64_t v8 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        uint64_t v8 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ERROR: Expected recvPck, just use previous negotiatedParam for now.",  v13,  2u);
      }
    }

    __int16 v17 = *(_WORD *)(v4 + 408);
    __int128 v9 = *(_OWORD *)(v4 + 376);
    __int128 v14 = *(_OWORD *)(v4 + 360);
    __int128 v15 = v9;
    __int128 v16 = *(_OWORD *)(v4 + 392);
  }

  if ((*(_BYTE *)(v4 + 212) & 4) == 0)
  {
    *(_BYTE *)(v4 + 190) = iAP2LinkGetNewSeqNum(v4);
    *(_BYTE *)(v4 + 212) |= 4u;
  }

  SYNPacket = (uint64_t *)iAP2PacketCreateSYNPacket(v4);
  unsigned int v11 = *(_DWORD *)(v4 + 464) + 1;
  *(_DWORD *)(v4 + 464) = v11;
  ++*(_DWORD *)(v4 + 496);
  ++*(_DWORD *)(v4 + 504);
  if ((*(_BYTE *)(v4 + 212) & 0x20) == 0 && v11 >= 0xB) {
    *a2 = 20;
  }
  iAP2LinkSendPacket(v4, (uint64_t)SYNPacket, 0);
  return iAP2PacketRelease(SYNPacket);
}

uint64_t *iAP2LinkDeviceActionResendSYNACK(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionResendSYNACK_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionResendSYNACK_cold_2();
  }
  *a2 = 29;
  uint64_t v3 = *(void *)(a1 + 16);
  if ((*(_BYTE *)(v3 + 212) & 4) == 0)
  {
    *(_BYTE *)(v3 + 190) = iAP2LinkGetNewSeqNum(*(void *)(a1 + 16));
    *(_BYTE *)(v3 + 212) |= 4u;
  }

  uint64_t SYNPacket = iAP2PacketCreateSYNPacket(v3);
  uint64_t v5 = (uint64_t *)SYNPacket;
  unsigned int v6 = *(_DWORD *)(v3 + 472);
  if ((*(_BYTE *)(v3 + 212) & 0x20) != 0 || v6 < *(unsigned __int8 *)(v3 + 412))
  {
    unsigned int v7 = v6 + 1;
    *(_DWORD *)(v3 + 472) = v7;
    ++*(_DWORD *)(v3 + 512);
    ++*(_DWORD *)(v3 + 548);
    *(_BYTE *)(SYNPacket + 58) = v7;
    iAP2LinkSendPacket(v3, SYNPacket, 0);
  }

  else
  {
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        uint64_t v8 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        uint64_t v8 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(unsigned __int8 *)(v3 + 412);
        int v11 = 136315394;
        uint64_t v12 = "Device:ResendSYNACK";
        __int16 v13 = 1024;
        int v14 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s Resend too many times! max=%d",  (uint8_t *)&v11,  0x12u);
      }
    }

    *a2 = 20;
  }

  return iAP2PacketRelease(v5);
}

void iAP2LinkDeviceActionHandleMaxRetries(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionHandleMaxRetries_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionHandleMaxRetries_cold_2();
  }
  *a2 = 29;
  iAP2LinkEventNotify(*(void *)(a1 + 16), 6LL, 0LL);
}

void iAP2LinkDeviceActionNotifyConnection(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionNotifyConnection_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionNotifyConnection_cold_2();
  }
  *a2 = 29;
  uint64_t v2 = *(void *)(a1 + 16);
  *(_WORD *)(v2 + 458) = *(_WORD *)(v2 + 408);
  __int128 v3 = *(_OWORD *)(v2 + 376);
  *(_OWORD *)(v2 + 410) = *(_OWORD *)(v2 + 360);
  *(_OWORD *)(v2 + 426) = v3;
  *(_OWORD *)(v2 + 442) = *(_OWORD *)(v2 + 392);
  *(_BYTE *)(v2 + 214) = *(_BYTE *)(v2 + 213);
  *(_BYTE *)(v2 + 213) = *(_BYTE *)(v2 + 410);
  iAP2LinkEventNotify(v2, 2LL, v2 + 360);
  iAP2LinkConnectedCB(v2, 1);
}

void iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled_cold_2();
  }
  *a2 = 29;
  uint64_t v3 = *(void *)(a1 + 16);
  *(_BYTE *)(v3 + 214) = *(_BYTE *)(v3 + 213);
  *(_BYTE *)(v3 + 213) = *(_BYTE *)(v3 + 410);
  iAP2LinkResetSeqAck(v3, 0, 0);
  iAP2LinkSetDefaultSYNParam(v3 + 410);
  uint64_t v4 = *(__int128 **)(v3 + 352);
  __int128 v6 = v4[1];
  __int128 v5 = v4[2];
  __int128 v7 = *v4;
  *(_WORD *)(v3 + 408) = *((_WORD *)v4 + 24);
  *(_OWORD *)(v3 + 376) = v6;
  *(_OWORD *)(v3 + 392) = v5;
  *(_OWORD *)(v3 + 360) = v7;
  if ((*(_BYTE *)(v3 + 212) & 0x20) != 0 || *(_DWORD *)(v3 + 464) < 0xBu)
  {
    RSTPacket = (uint64_t *)iAP2PacketCreateRSTPacket(v3, *(_BYTE *)(v3 + 190));
    ++*(_DWORD *)(v3 + 584);
    iAP2LinkSendPacket(v3, (uint64_t)RSTPacket, 0);
    iAP2PacketRelease(RSTPacket);
  }

  else
  {
    *a2 = 20;
  }

uint64_t *iAP2LinkDeviceActionSendSuspend(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendSuspend_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendSuspend_cold_2();
  }
  *a2 = 29;
  uint64_t v2 = *(void *)(a1 + 16);
  iAP2LinkEventNotify(v2, 7LL, v2 + 360);
  SUSPacket = (uint64_t *)iAP2PacketCreateSUSPacket(v2, *(_BYTE *)(v2 + 190));
  iAP2LinkSendPacketWaitSend(v2, (uint64_t)SUSPacket, 0);
  return iAP2PacketRelease(SUSPacket);
}

uint64_t *iAP2LinkDeviceActionSendResume(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkDeviceActionSendResume_cold_1();
  }
  if (!a2) {
    iAP2LinkDeviceActionSendResume_cold_2();
  }
  *a2 = 29;
  uint64_t v2 = *(void *)(a1 + 16);
  iAP2LinkEventNotify(v2, 8LL, v2 + 360);
  ACKPacket = (uint64_t *)iAP2PacketCreateACKPacket(v2, *(_BYTE *)(v2 + 190), *(_BYTE *)(v2 + 188), 0LL, 0, 0);
  iAP2LinkSendPacket(v2, (uint64_t)ACKPacket, 0);
  return iAP2PacketRelease(ACKPacket);
}

uint64_t iap2_voiceOver_moveCursorHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 21;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      __int128 v6 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      __int128 v6 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "moveCursorHandler %@", buf, 0xCu);
    }

    unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
    int v20 = 0;
    if (FirstParam)
    {
      NextParam = (unsigned __int16 *)FirstParam;
      char v10 = 0;
      uint64_t v11 = 0LL;
      while (1)
      {
        int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
        if (ParamID)
        {
          int v13 = ParamID;
          int MsgID = iAP2MsgGetMsgID(a2);
          printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v13, MsgID);
        }

        else
        {
          unsigned int DataAsU8 = iAP2MsgGetDataAsU8(NextParam, &v20);
          if (v20)
          {
            int v19 = iAP2MsgGetMsgID(a2);
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, v19);
            return 0LL;
          }

          if (DataAsU8) {
            unsigned int v16 = -1;
          }
          else {
            unsigned int v16 = 4;
          }
          if (DataAsU8 == 1) {
            unsigned int v16 = 5;
          }
          if (DataAsU8 == 2) {
            unsigned int v16 = 24;
          }
          if (DataAsU8 <= 2) {
            uint64_t v11 = v16;
          }
          else {
            uint64_t v11 = v11;
          }
          if (DataAsU8 <= 2) {
            char v10 = 1;
          }
        }

        NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
        if (!NextParam) {
          goto LABEL_32;
        }
      }
    }

    uint64_t v11 = 0LL;
    char v10 = 0;
LABEL_32:
    if (gLogObjects && gNumLogObjects >= 21)
    {
      __int16 v17 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      __int16 v17 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v18;
      __int16 v23 = 1024;
      int v24 = v11;
      __int16 v25 = 1024;
      int v26 = v10 & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "moveCursotHandler: %@ action=%d (valid=%d)",  buf,  0x18u);
    }

    if ((v10 & 1) != 0)
    {
      uint64_t result = iap2_feature_getFeature(a1, 0x15u);
      if (result)
      {
        platform_voiceOver_performAction(*(void *)(a1 + 8), v11, 0LL);
        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_selectCursorHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "selectCursorHandler %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t result = iap2_feature_getFeature(a1, 0x15u);
    if (result)
    {
      platform_voiceOver_performAction(*(void *)(a1 + 8), 16LL, 0LL);
      return 1LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_scrollPageHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 21;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      uint64_t v6 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "scrollPageHandler %@", buf, 0xCu);
    }

    unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
    int v19 = 0;
    if (FirstParam)
    {
      NextParam = (unsigned __int16 *)FirstParam;
      char v10 = 0;
      uint64_t v11 = 0LL;
      while (1)
      {
        int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
        if (ParamID)
        {
          int v13 = ParamID;
          int MsgID = iAP2MsgGetMsgID(a2);
          printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v13, MsgID);
        }

        else
        {
          unsigned int DataAsU8 = iAP2MsgGetDataAsU8(NextParam, &v19);
          if (v19)
          {
            int v18 = iAP2MsgGetMsgID(a2);
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, v18);
            return 0LL;
          }

          if (DataAsU8 <= 3)
          {
            switch(DataAsU8)
            {
              case 0u:
                char v10 = 1;
                uint64_t v11 = 6LL;
                break;
              case 1u:
                char v10 = 1;
                uint64_t v11 = 7LL;
                break;
              case 2u:
                char v10 = 1;
                uint64_t v11 = 8LL;
                break;
              case 3u:
                char v10 = 1;
                uint64_t v11 = 9LL;
                break;
              default:
                char v10 = 1;
                uint64_t v11 = 0xFFFFFFFFLL;
                break;
            }
          }
        }

        NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
        if (!NextParam) {
          goto LABEL_27;
        }
      }
    }

    uint64_t v11 = 0LL;
    char v10 = 0;
LABEL_27:
    if (gLogObjects && gNumLogObjects >= 21)
    {
      unsigned int v16 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      unsigned int v16 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v17;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v10 & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "scrollPageHandler: %@ action=%d (valid=%d)",  buf,  0x18u);
    }

    if ((v10 & 1) != 0)
    {
      uint64_t result = iap2_feature_getFeature(a1, 0x15u);
      if (result)
      {
        platform_voiceOver_performAction(*(void *)(a1 + 8), v11, 0LL);
        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_speakTextHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 21;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      uint64_t v6 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "speakTextHandler %@", buf, 0xCu);
    }

    unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
    BOOL v20 = 0;
    if (FirstParam)
    {
      NextParam = (unsigned __int16 *)FirstParam;
      char v10 = 0;
      uint64_t v11 = 0LL;
      while (1)
      {
        int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
        if (ParamID)
        {
          int v13 = ParamID;
          int MsgID = iAP2MsgGetMsgID(a2);
          printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v13, MsgID);
        }

        else
        {
          DataAsString = iAP2MsgGetDataAsString(NextParam, &v20);
          if (v20)
          {
            int v19 = iAP2MsgGetMsgID(a2);
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, v19);
            return 0LL;
          }

          if (DataAsString) {
            uint64_t v11 = DataAsString;
          }
          v10 |= DataAsString != 0LL;
        }

        NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
        if (!NextParam) {
          goto LABEL_23;
        }
      }
    }

    uint64_t v11 = 0LL;
    char v10 = 0;
LABEL_23:
    if (gLogObjects && gNumLogObjects >= 21)
    {
      unsigned int v16 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      unsigned int v16 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 8);
      int v18 = "";
      if ((v10 & 1) != 0) {
        int v18 = (const char *)v11;
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      int v25 = v18;
      __int16 v26 = 1024;
      int v27 = v10 & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "speakTextHandler: %@ text=%s (valid=%d)",  buf,  0x1Cu);
    }

    if ((v10 & 1) != 0)
    {
      uint64_t result = iap2_feature_getFeature(a1, 0x15u);
      if (result)
      {
        v21[1] = v11;
        v21[2] = 0xAAAAAAAAAAAAAAAALL;
        v21[0] = 0xAAAAAAAA00000017LL;
        platform_voiceOver_performAction(*(void *)(a1 + 8), 23LL, (uint64_t)v21);
        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_pauseSpeakingHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "pauseSpeakingHandler %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t result = iap2_feature_getFeature(a1, 0x15u);
    if (result)
    {
      platform_voiceOver_performAction(*(void *)(a1 + 8), 19LL, 0LL);
      return 1LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_resumeSpeakingHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "resumeSpeakingHandler %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t result = iap2_feature_getFeature(a1, 0x15u);
    if (result)
    {
      platform_voiceOver_performAction(*(void *)(a1 + 8), 20LL, 0LL);
      return 1LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_startInformationHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (!a1 || !a2) {
    return result;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 21;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v6 = *(os_log_s **)(gLogObjects + 160);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 8);
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "startInformationHandler %@", buf, 0xCu);
  }

  unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
  if (FirstParam)
  {
    NextParam = (unsigned __int16 *)FirstParam;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    while (1)
    {
      int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
      if (ParamID == 2)
      {
        if (!iAP2MsgIsDataVoid(NextParam))
        {
          int MsgID = iAP2MsgGetMsgID(a2);
          int v26 = 2;
          goto LABEL_54;
        }

        int v10 = 1;
      }

      else
      {
        int v14 = ParamID;
        if (ParamID == 1)
        {
          if (!iAP2MsgIsDataVoid(NextParam))
          {
            int MsgID = iAP2MsgGetMsgID(a2);
            int v26 = 1;
LABEL_54:
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v26, MsgID);
            return 0LL;
          }

          int v11 = 1;
        }

        else if (ParamID)
        {
          int v15 = iAP2MsgGetMsgID(a2);
          printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v14, v15);
        }

        else
        {
          if (!iAP2MsgIsDataVoid(NextParam))
          {
            int v27 = iAP2MsgGetMsgID(a2);
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, v27);
            return 0LL;
          }

          int v12 = 1;
        }
      }

      NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
      if (!NextParam) {
        goto LABEL_27;
      }
    }
  }

  int v12 = 0;
  int v11 = 0;
  int v10 = 0;
LABEL_27:
  if (gLogObjects && gNumLogObjects >= 21)
  {
    unsigned int v16 = *(os_log_s **)(gLogObjects + 160);
  }

  else
  {
    unsigned int v16 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void *)(a1 + 8);
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v17;
    __int16 v30 = 1024;
    int v31 = v12 & 1;
    __int16 v32 = 1024;
    int v33 = v11 & 1;
    __int16 v34 = 1024;
    int v35 = v10 & 1;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "startInformationHandler: %@ volumeValid=%d rateValid=%d enabledValid=%d",  buf,  0x1Eu);
  }

  if (((v12 | v11 | v10) & 1) == 0) {
    return 0LL;
  }
  uint64_t result = iap2_feature_getFeature(a1, 0x15u);
  if (result)
  {
    int v18 = (int *)result;
    if ((v11 & 1) != 0) {
      int v19 = 2;
    }
    else {
      int v19 = 0;
    }
    unsigned int v20 = v19 & 0xFFFFFFFE | v12 & 1;
    if ((v10 & 1) != 0) {
      int v21 = 4;
    }
    else {
      int v21 = 0;
    }
    *(_DWORD *)uint64_t result = v20 | v21;
    if (gLogObjects && gNumLogObjects >= 21)
    {
      __int16 v22 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      __int16 v22 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 8);
      int v24 = *v18;
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v23;
      __int16 v30 = 1024;
      int v31 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "startInformationHandler: %@ infoRequestedMask=%xh, call requestInformationUpdate",  buf,  0x12u);
    }

    platform_voiceOver_startInformationUpdate(*(void *)(a1 + 8));
    return 1LL;
  }

  return result;
}

uint64_t iap2_voiceOver_stopInformationHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "stopInformationHandler %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t result = iap2_feature_getFeature(a1, 0x15u);
    if (result)
    {
      *(_DWORD *)uint64_t result = 0;
      platform_voiceOver_stopInformationUpdate(*(void *)(a1 + 8));
      return 1LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_updateInformationHandler(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 21;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      uint64_t v6 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updateInformationHandler %@", buf, 0xCu);
    }

    uint64_t v25 = 0LL;
    unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
    int v24 = 0;
    if (FirstParam)
    {
      NextParam = (unsigned __int16 *)FirstParam;
      int v10 = 0;
      int v11 = 0;
      float v12 = 0.0;
      float v13 = 0.0;
      while (1)
      {
        int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
        if (ParamID)
        {
          int v15 = ParamID;
          if (ParamID == 1)
          {
            unsigned int DataAsU8 = iAP2MsgGetDataAsU8(NextParam, &v24);
            if (v24)
            {
              int MsgID = iAP2MsgGetMsgID(a2);
              printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 1, MsgID);
              return 0LL;
            }

            float v12 = (double)DataAsU8 / 255.0;
            *(float *)&uint64_t v25 = v12;
            int v10 = 1;
          }

          else
          {
            int v18 = iAP2MsgGetMsgID(a2);
            printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v15, v18);
          }
        }

        else
        {
          unsigned int v17 = iAP2MsgGetDataAsU8(NextParam, &v24);
          if (v24)
          {
            int v23 = iAP2MsgGetMsgID(a2);
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, v23);
            return 0LL;
          }

          float v13 = (double)v17 / 255.0;
          *((float *)&v25 + 1) = v13;
          int v11 = 1;
        }

        NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
        if (!NextParam) {
          goto LABEL_24;
        }
      }
    }

    int v11 = 0;
    int v10 = 0;
    float v12 = 0.0;
    float v13 = 0.0;
LABEL_24:
    if (gLogObjects && gNumLogObjects >= 21)
    {
      int v19 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      int v19 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138413314;
      uint64_t v27 = v20;
      __int16 v28 = 2048;
      double v29 = v13;
      __int16 v30 = 1024;
      int v31 = v11 & 1;
      __int16 v32 = 2048;
      double v33 = v12;
      __int16 v34 = 1024;
      int v35 = v10 & 1;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "updateInformationHandler: %@ volume=%f (valid=%d), rate=%f (valid=%d)",  buf,  0x2Cu);
    }

    if (((v10 | v11) & 1) != 0 && iap2_feature_getFeature(a1, 0x15u))
    {
      if ((v11 & 1) != 0) {
        platform_voiceOver_setConfiguration(*(void *)(a1 + 8), 0LL, (_DWORD *)&v25 + 1);
      }
      uint64_t v2 = 1LL;
      if ((v10 & 1) != 0) {
        platform_voiceOver_setConfiguration(*(void *)(a1 + 8), 1LL, &v25);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t iap2_voiceOver_startCursorInformationHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (!a1 || !a2) {
    return result;
  }
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 21;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v6 = *(os_log_s **)(gLogObjects + 160);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 8);
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "startCursorInformationHandler %@", buf, 0xCu);
  }

  unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
  if (FirstParam)
  {
    NextParam = (unsigned __int16 *)FirstParam;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    while (1)
    {
      int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
      switch(ParamID)
      {
        case 0:
          if (iAP2MsgIsDataVoid(NextParam))
          {
            int v13 = 1;
            goto LABEL_24;
          }

          int MsgID = iAP2MsgGetMsgID(a2);
          printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, MsgID);
          return 0LL;
        case 1:
          if (!iAP2MsgIsDataVoid(NextParam))
          {
            int v26 = iAP2MsgGetMsgID(a2);
            int v27 = 1;
            goto LABEL_58;
          }

          int v12 = 1;
          goto LABEL_24;
        case 2:
          if (!iAP2MsgIsDataVoid(NextParam))
          {
            int v26 = iAP2MsgGetMsgID(a2);
            int v27 = 2;
            goto LABEL_58;
          }

          int v11 = 1;
          goto LABEL_24;
        case 3:
          if (!iAP2MsgIsDataVoid(NextParam))
          {
            int v26 = iAP2MsgGetMsgID(a2);
            int v27 = 3;
LABEL_58:
            printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v27, v26);
            return 0LL;
          }

          int v10 = 1;
LABEL_24:
          NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
          if (!NextParam) {
            goto LABEL_27;
          }
          break;
        default:
          int v15 = iAP2MsgGetMsgID(a2);
          printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", ParamID, v15);
          goto LABEL_24;
      }
    }
  }

  int v13 = 0;
  int v12 = 0;
  int v11 = 0;
  int v10 = 0;
LABEL_27:
  if (gLogObjects && gNumLogObjects >= 21)
  {
    unsigned int v16 = *(os_log_s **)(gLogObjects + 160);
  }

  else
  {
    unsigned int v16 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = *(void *)(a1 + 8);
    *(_DWORD *)buf = 138413314;
    uint64_t v30 = v17;
    __int16 v31 = 1024;
    int v32 = v13 & 1;
    __int16 v33 = 1024;
    int v34 = v12 & 1;
    __int16 v35 = 1024;
    int v36 = v11 & 1;
    __int16 v37 = 1024;
    int v38 = v10 & 1;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "startCursorInformationHandler: %@ labelValid=%d valueValid=%d hintValid=%d traitsValid=%d",  buf,  0x24u);
  }

  if (((v13 | v12 | v11 | v10) & 1) == 0) {
    return 0LL;
  }
  uint64_t result = iap2_feature_getFeature(a1, 0x15u);
  if (result)
  {
    uint64_t v18 = result;
    if ((v12 & 1) != 0) {
      int v19 = 2;
    }
    else {
      int v19 = 0;
    }
    unsigned int v20 = v19 & 0xFFFFFFFE | v13 & 1;
    if ((v11 & 1) != 0) {
      int v21 = 4;
    }
    else {
      int v21 = 0;
    }
    if ((v10 & 1) != 0) {
      int v22 = 8;
    }
    else {
      int v22 = 0;
    }
    *(_DWORD *)(result + 4) = v20 | v21 | v22;
    if (gLogObjects && gNumLogObjects >= 21)
    {
      int v23 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      int v23 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = *(void *)(a1 + 8);
      int v25 = *(_DWORD *)(v18 + 4);
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v24;
      __int16 v31 = 1024;
      int v32 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "startCursorInformationHandler: %@ cursorInfoRequestedMask=%xh, call requestCursorInformationUpdate",  buf,  0x12u);
    }

    platform_voiceOver_startCursorInformationUpdate(*(void *)(a1 + 8));
    return 1LL;
  }

  return result;
}

uint64_t iap2_voiceOver_stopCursorInformationHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "stopCursorInformationHandler %@",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t result = iap2_feature_getFeature(a1, 0x15u);
    if (result)
    {
      *(_DWORD *)(result + 4) = 0;
      platform_voiceOver_stopCursorInformationUpdate(*(void *)(a1 + 8));
      return 1LL;
    }
  }

  return result;
}

uint64_t iap2_VoiceOver_startVoiceOverHandler(uint64_t a1, uint64_t a2)
{
  uint64_t Feature = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "startVoiceOverHandler %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t Feature = iap2_feature_getFeature(a1, 0x15u);
    if (gLogObjects && gNumLogObjects >= 21)
    {
      int v7 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      int v7 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = "exists";
      uint64_t v9 = *(void *)(a1 + 8);
      if (!Feature) {
        uint64_t v8 = "missing!!";
      }
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      int v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "startVoiceOverHandler %@ voiceOver=%s",  (uint8_t *)&v11,  0x16u);
    }

    if (Feature)
    {
      uint64_t Feature = 1LL;
      platform_VoiceOver_setEnabled(*(void *)(a1 + 8), 1LL);
    }
  }

  return Feature;
}

uint64_t iap2_VoiceOver_stopVoiceOverHandler(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 21;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      BOOL v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v5 = *(os_log_s **)(gLogObjects + 160);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 8);
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "stopVoiceOverHandler %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t Feature = iap2_feature_getFeature(a1, 0x15u);
    if (gLogObjects && gNumLogObjects >= 21)
    {
      uint64_t v8 = *(os_log_s **)(gLogObjects + 160);
    }

    else
    {
      uint64_t v8 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = "exists";
      uint64_t v10 = *(void *)(a1 + 8);
      if (!Feature) {
        uint64_t v9 = "missing!!";
      }
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      int v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "stopVoiceOverHandler %@ voiceOver=%s",  (uint8_t *)&v11,  0x16u);
    }

    if (Feature)
    {
      platform_VoiceOver_setEnabled(*(void *)(a1 + 8), 0LL);
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t iap2_voiceOver_informationHandler(uint64_t *a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 36)
  {
    BOOL v4 = *(os_log_s **)(gLogObjects + 280);
  }

  else
  {
    BOOL v4 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (!a1 || (uint64_t v5 = a1[1]) == 0) {
      uint64_t v5 = 0LL;
    }
    int v28 = 138412290;
    uint64_t v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "informationHandler  %@", (uint8_t *)&v28, 0xCu);
  }

  uint64_t Feature = (int *)iap2_feature_getFeature((uint64_t)a1, 0x15u);
  if (gLogObjects && gNumLogObjects >= 21)
  {
    int v7 = *(os_log_s **)(gLogObjects + 160);
  }

  else
  {
    int v7 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (!a1 || (uint64_t v8 = a1[1]) == 0) {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = "exists";
    if (!Feature) {
      uint64_t v9 = "missing!!";
    }
    int v28 = 138412546;
    uint64_t v29 = v8;
    __int16 v30 = 2080;
    *(void *)__int16 v31 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "informationHandler %@ voiceOver %s",  (uint8_t *)&v28,  0x16u);
  }

  uint64_t result = 0LL;
  if (a2 && Feature)
  {
    if (gLogObjects && gNumLogObjects >= 36)
    {
      int v11 = *(os_log_s **)(gLogObjects + 280);
    }

    else
    {
      int v11 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      iap2_voiceOver_informationHandler_cold_4();
    }
    if (*(_DWORD *)a2) {
      return 0LL;
    }
    if (gLogObjects && gNumLogObjects >= 36)
    {
      uint64_t v12 = *(os_log_s **)(gLogObjects + 280);
    }

    else
    {
      uint64_t v12 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (!a1 || (uint64_t v22 = a1[1]) == 0) {
        uint64_t v22 = 0LL;
      }
      int v23 = *Feature;
      int v24 = *(_DWORD *)(a2 + 8);
      double v25 = *(float *)(a2 + 12);
      double v26 = *(float *)(a2 + 16);
      int v27 = *(unsigned __int8 *)(a2 + 20);
      int v28 = 138413570;
      uint64_t v29 = v22;
      __int16 v30 = 1024;
      *(_DWORD *)__int16 v31 = v23;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v24;
      __int16 v32 = 2048;
      double v33 = v25;
      __int16 v34 = 2048;
      double v35 = v26;
      __int16 v36 = 1024;
      int v37 = v27;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "informationHandler %@, infoRequestedMask=%xh, p (validMask=%xh volume=%f rate=%f enabled=%d)",  (uint8_t *)&v28,  0x32u);
    }

    if (!*Feature) {
      return 0LL;
    }
    if (gLogObjects && gNumLogObjects >= 36)
    {
      __int16 v13 = *(os_log_s **)(gLogObjects + 280);
    }

    else
    {
      __int16 v13 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (!a1 || (uint64_t v14 = a1[1]) == 0) {
        uint64_t v14 = 0LL;
      }
      int v28 = 138412290;
      uint64_t v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "informationHandler %@, create msg",  (uint8_t *)&v28,  0xCu);
    }

    uint64_t v15 = iAP2MsgInit((uint64_t)(a1 + 15), 22028, a1[24], 0xFFFF, 0LL, 0LL);
    uint64_t v16 = v15;
    int v17 = *(_DWORD *)(a2 + 8);
    if ((v17 & 1) != 0)
    {
      int v18 = iAP2MsgAddU8Param(v15, 0LL, 0, vcvts_n_s32_f32(*(float *)(a2 + 12), 8uLL)) != 0LL;
      int v17 = *(_DWORD *)(a2 + 8);
      if ((v17 & 2) == 0) {
        goto LABEL_57;
      }
    }

    else
    {
      int v18 = 0;
      if ((v17 & 2) == 0) {
        goto LABEL_57;
      }
    }

    int v17 = *(_DWORD *)(a2 + 8);
LABEL_57:
    if ((v17 & 4) != 0 && iAP2MsgAddU8Param(v16, 0LL, 2, *(_BYTE *)(a2 + 20)) || v18)
    {
      if (gLogObjects && gNumLogObjects >= 36)
      {
        int v19 = *(os_log_s **)(gLogObjects + 280);
      }

      else
      {
        int v19 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = a1[1];
        int MsgID = iAP2MsgGetMsgID(v16);
        int v28 = 138412546;
        uint64_t v29 = v20;
        __int16 v30 = 1024;
        *(_DWORD *)__int16 v31 = MsgID;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "informationHandler %@ send message %xh",  (uint8_t *)&v28,  0x12u);
      }

      iap2_sessionControl_sendOutgoingMessage(a1, v16);
      platform_voiceOver_deleteParams((void *)a2);
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t iap2_voiceOver_cursorInformationHandler(uint64_t *a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 36)
  {
    BOOL v4 = *(os_log_s **)(gLogObjects + 280);
  }

  else
  {
    BOOL v4 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (!a1 || (uint64_t v5 = a1[1]) == 0) {
      uint64_t v5 = 0LL;
    }
    *(_DWORD *)v49 = 138412290;
    *(void *)&v49[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "cursorInformationHandler %@", v49, 0xCu);
  }

  uint64_t Feature = iap2_feature_getFeature((uint64_t)a1, 0x15u);
  if (gLogObjects && gNumLogObjects >= 21)
  {
    int v7 = *(os_log_s **)(gLogObjects + 160);
  }

  else
  {
    int v7 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (!a1 || (uint64_t v8 = a1[1]) == 0) {
      uint64_t v8 = 0LL;
    }
    uint64_t v9 = "exists";
    if (!Feature) {
      uint64_t v9 = "missing!!";
    }
    *(_DWORD *)v49 = 138412546;
    *(void *)&v49[4] = v8;
    *(_WORD *)&v49[12] = 2080;
    *(void *)&v49[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "cursorInformationHandler %@ voiceOver %s",  v49,  0x16u);
  }

  uint64_t result = 0LL;
  if (a2 && Feature)
  {
    if (gLogObjects && gNumLogObjects >= 36)
    {
      int v11 = *(os_log_s **)(gLogObjects + 280);
    }

    else
    {
      int v11 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      iap2_voiceOver_informationHandler_cold_4();
    }
    if (*(_DWORD *)a2 != 1) {
      return 0LL;
    }
    if (gLogObjects && gNumLogObjects >= 36)
    {
      uint64_t v12 = *(os_log_s **)(gLogObjects + 280);
    }

    else
    {
      uint64_t v12 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (!a1 || (uint64_t v36 = a1[1]) == 0) {
        uint64_t v36 = 0LL;
      }
      int v37 = *(_DWORD *)(Feature + 4);
      int v38 = *(_DWORD *)(a2 + 8);
      uint64_t v39 = *(void *)(a2 + 16);
      uint64_t v40 = *(void *)(a2 + 24);
      uint64_t v41 = *(void *)(a2 + 32);
      uint64_t v42 = *(void *)(a2 + 40);
      *(_DWORD *)v49 = 138413826;
      *(void *)&v49[4] = v36;
      *(_WORD *)&v49[12] = 1024;
      *(_DWORD *)&v49[14] = v37;
      *(_WORD *)&v49[18] = 1024;
      *(_DWORD *)&v49[20] = v38;
      *(_WORD *)&v49[24] = 2112;
      *(void *)&v49[26] = v39;
      __int16 v50 = 2112;
      uint64_t v51 = v40;
      __int16 v52 = 2112;
      uint64_t v53 = v41;
      __int16 v54 = 2048;
      uint64_t v55 = v42;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "informationHandler %@, cursorInfoRequestedMask=%xh, p (validMask=%xh label=%@ value=%@ hint=%@ traitsMask=%llxh)",  v49,  0x40u);
    }

    if (!*(_DWORD *)(Feature + 4)) {
      return 0LL;
    }
    if (gLogObjects && gNumLogObjects >= 36)
    {
      __int16 v13 = *(os_log_s **)(gLogObjects + 280);
    }

    else
    {
      __int16 v13 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (!a1 || (uint64_t v14 = a1[1]) == 0) {
        uint64_t v14 = 0LL;
      }
      *(_DWORD *)v49 = 138412290;
      *(void *)&v49[4] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "cursorInformationHandler %@, create msg",  v49,  0xCu);
    }

    uint64_t v15 = (char *)malloc(0x400uLL);
    uint64_t v16 = iAP2MsgInit((uint64_t)(a1 + 15), 22032, a1[24], 0xFFFF, 0LL, 0LL);
    if ((*(_BYTE *)(a2 + 8) & 1) == 0) {
      goto LABEL_51;
    }
    CStringPtr = (char *)CFStringGetCStringPtr(*(CFStringRef *)(a2 + 16), 0x8000100u);
    if (CStringPtr
      || (int CString = CFStringGetCString(*(CFStringRef *)(a2 + 16), v15, 1024LL, 0x8000100u), v15)
      && (CStringPtr = v15, CString))
    {
      int v17 = iAP2MsgAddStringParam(v16, 0LL, 0, CStringPtr) != 0LL;
    }

    else
    {
      if (gLogObjects && gNumLogObjects >= 36)
      {
        double v33 = *(os_log_s **)(gLogObjects + 280);
      }

      else
      {
        double v33 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      int v17 = 0;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = a1[1];
        uint64_t v44 = *(void *)(a2 + 16);
        *(_DWORD *)v49 = 138412546;
        *(void *)&v49[4] = v43;
        *(_WORD *)&v49[12] = 2112;
        *(void *)&v49[14] = v44;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "cursorInformationHandler %@, failed to get label from p->label (%@)",  v49,  0x16u);
LABEL_51:
        int v17 = 0;
      }
    }

    if ((*(_BYTE *)(a2 + 8) & 2) != 0)
    {
      uint64_t v20 = (char *)CFStringGetCStringPtr(*(CFStringRef *)(a2 + 24), 0x8000100u);
      if (v20
        || (v21 = CFStringGetCString(*(CFStringRef *)(a2 + 24), v15, 1024LL, 0x8000100u), v15) && (uint64_t v20 = v15, v21))
      {
        if (iAP2MsgAddStringParam(v16, 0LL, 1, v20)) {
          ++v17;
        }
      }

      else
      {
        if (gLogObjects && gNumLogObjects >= 36)
        {
          __int16 v34 = *(os_log_s **)(gLogObjects + 280);
        }

        else
        {
          __int16 v34 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = a1[1];
          uint64_t v46 = *(void *)(a2 + 24);
          *(_DWORD *)v49 = 138412546;
          *(void *)&v49[4] = v45;
          *(_WORD *)&v49[12] = 2112;
          *(void *)&v49[14] = v46;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "cursorInformationHandler %@, failed to get value from p->value (%@)",  v49,  0x16u);
        }
      }
    }

    if ((*(_BYTE *)(a2 + 8) & 4) != 0)
    {
      uint64_t v22 = (char *)CFStringGetCStringPtr(*(CFStringRef *)(a2 + 32), 0x8000100u);
      if (v22
        || (v23 = CFStringGetCString(*(CFStringRef *)(a2 + 32), v15, 1024LL, 0x8000100u), v15) && (uint64_t v22 = v15, v23))
      {
        if (iAP2MsgAddStringParam(v16, 0LL, 2, v22)) {
          ++v17;
        }
      }

      else
      {
        if (gLogObjects && gNumLogObjects >= 36)
        {
          double v35 = *(os_log_s **)(gLogObjects + 280);
        }

        else
        {
          double v35 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = a1[1];
          uint64_t v48 = *(void *)(a2 + 32);
          *(_DWORD *)v49 = 138412546;
          *(void *)&v49[4] = v47;
          *(_WORD *)&v49[12] = 2112;
          *(void *)&v49[14] = v48;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "cursorInformationHandler %@, failed to get hint from p->hint (%@)",  v49,  0x16u);
        }
      }
    }

    if ((*(_BYTE *)(a2 + 8) & 8) != 0)
    {
      *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)v49 = v24;
      *(_OWORD *)&v49[16] = v24;
      unint64_t v25 = *(void *)(a2 + 40);
      if (v25)
      {
        uint64_t v26 = 0LL;
        unsigned __int16 v27 = 0;
        int v28 = v49;
        do
        {
          if ((v25 & 1) != 0)
          {
            *v28++ = bswap32(_convertACCtoiAP2CursorTraits(v26)) >> 16;
            v27 += 2;
          }

          if (v25 < 2) {
            break;
          }
          v25 >>= 1;
          BOOL v29 = v26 >= 0xF;
          uint64_t v26 = (v26 + 1);
        }

        while (!v29);
      }

      else
      {
        unsigned __int16 v27 = 0;
      }

      if (iAP2MsgAddDataParam(v16, 0LL, 3, v49, v27)) {
        ++v17;
      }
    }

    if (v15) {
      free(v15);
    }
    if (v17)
    {
      if (gLogObjects && gNumLogObjects >= 36)
      {
        __int16 v30 = *(os_log_s **)(gLogObjects + 280);
      }

      else
      {
        __int16 v30 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        if (!a1 || (uint64_t v31 = a1[1]) == 0) {
          uint64_t v31 = 0LL;
        }
        int MsgID = iAP2MsgGetMsgID(v16);
        *(_DWORD *)v49 = 138412546;
        *(void *)&v49[4] = v31;
        *(_WORD *)&v49[12] = 1024;
        *(_DWORD *)&v49[14] = MsgID;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "iap2_voiceOver_informationHandler %@ send message %xh",  v49,  0x12u);
      }

      iap2_sessionControl_sendOutgoingMessage(a1, v16);
      platform_voiceOver_deleteParams((void *)a2);
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t _convertACCtoiAP2CursorTraits(uint64_t result)
{
  else {
    return result;
  }
}

uint64_t iap2_voiceOver_isSupportedOnConnection(uint64_t a1)
{
  char v3 = 0;
  else {
    return iap2_identification_checkRequiredMsgIDs(a1, (uint64_t)&gskMsgVoiceOverCursorList, 3, &v3);
  }
}

void *_createFeature_25(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 21;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    char v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    char v3 = *(os_log_s **)(gLogObjects + 160);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "iAP2VoiceOver _createFeature", v5, 2u);
  }

  if (!a1) {
    return 0LL;
  }
  uint64_t result = calloc(1uLL, 8uLL);
  if (result) {
    *uint64_t result = 0LL;
  }
  return result;
}

uint64_t _destroyFeature_25(void **a1, uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 21;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v5 = *(os_log_s **)(gLogObjects + 160);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "iAP2VoiceOver _destroyFeature", v7, 2u);
  }

  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*a1)
    {
      platform_voiceOver_accessoryDetached(*(void *)(a2 + 8));
      if (*a1)
      {
        free(*a1);
        *a1 = 0LL;
      }

      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL _startFeatureFromDevice_16(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 21;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    char v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    char v3 = *(os_log_s **)(gLogObjects + 160);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "iAP2VoiceOver _startFeatureFromDevice", v7, 2u);
  }

  uint64_t Feature = iap2_feature_getFeature(a1, 0x15u);
  if (Feature && iap2_voiceOver_isSupportedOnConnection(a1))
  {
    if (!a1 || (uint64_t v5 = *(void *)(a1 + 8)) == 0) {
      uint64_t v5 = 0LL;
    }
    platform_voiceOver_accessoryAttached(v5);
  }

  return Feature != 0;
}

uint64_t _checkIdentificationInfo_22(uint64_t a1)
{
  __int16 v5 = 0;
  uint64_t result = iap2_identification_checkIdentificationMsgIDs(a1, (uint64_t)&gskMsgVoiceOverMainList, 0xCu, (_BYTE *)&v5 + 1);
  if (HIBYTE(v5)) {
    BOOL v3 = (_DWORD)result == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    LODWORD(result) = iap2_identification_checkIdentificationMsgIDs(a1, (uint64_t)&gskMsgVoiceOverCursorList, 3u, &v5);
    if (HIBYTE(v5)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = v5 == 0;
    }
    if (v4) {
      uint64_t result = result;
    }
    else {
      uint64_t result = 2LL;
    }
    if (HIBYTE(v5))
    {
      if (!(_DWORD)result)
      {
        iap2_features_createFeature(a1, 0x15u);
        iap2_identification_setIdentifiedForFeature(a1, 0x15u);
        return 0LL;
      }
    }
  }

  return result;
}

void *iap2_endpoint_create(void *a1)
{
  if (!a1)
  {
    int v18 = (os_log_s *)logObjectForModule_1(18);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      iap2_endpoint_create_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0LL;
  }

  BOOL v2 = calloc(1uLL, 0x1D0uLL);
  BOOL v3 = v2;
  if (!v2) {
    return v3;
  }
  void *v2 = a1;
  BOOL v4 = (const __CFString *)a1[2];
  if (v4) {
    CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, v4);
  }
  else {
    CFStringRef Copy = 0LL;
  }
  v3[1] = Copy;
  uint64_t v6 = (const __CFString *)a1[1];
  if (v6) {
    CFStringRef v7 = CFStringCreateCopy(kCFAllocatorDefault, v6);
  }
  else {
    CFStringRef v7 = 0LL;
  }
  v3[2] = v7;
  dispatch_queue_t v8 = dispatch_queue_create("iAP2Endpoint", 0LL);
  v3[3] = v8;
  if (!v8)
  {
    free(v3);
    return 0LL;
  }

  dispatch_set_context(v8, v3);
  dispatch_set_finalizer_f((dispatch_object_t)v3[3], (dispatch_function_t)_iap2_endpoint_dispatchQueueFinalizer);
  v3[4] = 0LL;
  *((_DWORD *)v3 + 23) = 0;
  *((_BYTE *)v3 + 96) = 0;
  v3[24] = 0LL;
  v3[54] = 0LL;
  v3[13] = 0LL;
  v3[14] = 0LL;
  *((CFAbsoluteTime *)v3 + 57) = CFAbsoluteTimeGetCurrent();
  if (!v3[4])
  {
    *((_DWORD *)v3 + 10) = 2132705027;
    *((_WORD *)v3 + 24) = 0x7FFF;
    *((_BYTE *)v3 + 50) = 0;
    *((_BYTE *)v3 + 58) = 1;
    *(_DWORD *)((char *)v3 + 54) = 16843266;
    *(void *)((char *)v3 + 59) = 0x5554030000000000LL;
    *((_DWORD *)v3 + 11) = -1;
    *((_WORD *)v3 + 26) = -1;
    unsigned int BuffSize = iAP2LinkRunLoopGetBuffSize(0x7Fu);
    uint64_t v10 = malloc(BuffSize);
    v3[4] = v10;
    v3[4] = iAP2LinkRunLoopCreateDevice((__int128 *)(v3 + 5), (uint64_t)v3, 1u, 0, 0x7Fu, 0xFFFF, (uint64_t)v10);
    int v11 = calloc(1uLL, 0x1001FuLL);
    v3[14] = iAP2MsgParserInit(0xFFFF, (uint64_t)v11, v3[4], 16448);
    acc_platform_packetLogging_logEvent( *v3,  "ATTACH",  (uint64_t)"iAP2 accessory attached!",  v12,  v13,  v14,  v15,  v16,  v26);
    iAP2LinkRunLoopAttached(v3[4]);
  }

  if ((acc_endpoint_isWireless(a1) & 1) == 0
    && acc_endpoint_getTransportType((uint64_t)a1) != 8)
  {
    iap2_power_registerForSleepNotification((uint64_t)v3);
  }

  return v3;
}

void _iap2_endpoint_dispatchQueueFinalizer(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 19;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    BOOL v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    BOOL v3 = *(os_log_s **)(gLogObjects + 144);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "_iap2_endpoint_dispatchQueueFinalizer";
    __int16 v10 = 2048;
    uint64_t v11 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: protocolEndpoint %p", (uint8_t *)&v8, 0x16u);
  }

  if (a1)
  {
    *(void *)(a1 + 24) = 0LL;
    iAP2PacketRelease(*(uint64_t **)(a1 + 104));
    *(void *)(a1 + 104) = 0LL;
    iAP2LinkRunLoopDelete(*(void *)(a1 + 32));
    BOOL v4 = *(void **)(a1 + 32);
    if (v4)
    {
      free(v4);
      *(void *)(a1 + 32) = 0LL;
    }

    __int16 v5 = *(void **)(a1 + 112);
    if (v5)
    {
      free(v5);
      *(void *)(a1 + 112) = 0LL;
    }

    uint64_t v6 = *(const void **)(a1 + 8);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 8) = 0LL;
    }

    CFStringRef v7 = *(const void **)(a1 + 16);
    if (v7) {
      CFRelease(v7);
    }
    free((void *)a1);
  }

uint64_t iap2_endpoint_destroy(void ***a1)
{
  if (!a1)
  {
    uint64_t v12 = (os_log_s *)logObjectForModule_1(19);
    BOOL v15 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0LL;
    if (!v15) {
      return result;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "iAP2 Endpoint Destroy. NULL ppProtocolEndpoint!";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    return 0LL;
  }

  BOOL v2 = *a1;
  if (*a1)
  {
    acc_platform_packetLogging_logEvent( (uint64_t)*v2,  "DETACH",  (uint64_t)"iAP2 accessory detached!",  v3,  v4,  v5,  v6,  v7,  v16[0]);
    int v8 = (dispatch_queue_s *)v2[3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = __iap2_endpoint_destroy_block_invoke;
    block[3] = &__block_descriptor_tmp_22;
    block[4] = v2;
    dispatch_sync(v8, block);
    uint64_t v9 = (dispatch_queue_s *)v2[3];
    v16[0] = (uint64_t)_NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = (uint64_t)__iap2_endpoint_destroy_block_invoke_4;
    v16[3] = (uint64_t)&__block_descriptor_tmp_5_2;
    v16[4] = (uint64_t)v2;
    dispatch_sync(v9, v16);
    dispatch_release((dispatch_object_t)v2[3]);
    *a1 = 0LL;
    return 1LL;
  }

  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 20;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v12 = *(os_log_s **)(gLogObjects + 152);
  }

  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v13)
  {
    *(_WORD *)buf = 0;
    uint64_t v14 = "iAP2 Endpoint Destroy. *ppProtocolEndpoint is null!";
    goto LABEL_15;
  }

  return result;
}

void __iap2_endpoint_destroy_block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 20;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    uint64_t v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v3 = *(os_log_s **)(gLogObjects + 152);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    label = dispatch_queue_get_label(0LL);
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "iAP2 Endpoint Destroy. currentDispatchQueue: %s",  (uint8_t *)&v4,  0xCu);
  }

  iAP2LinkRunLoopDetached(*(void *)(*(void *)(a1 + 32) + 32LL));
}

uint64_t __iap2_endpoint_destroy_block_invoke_4(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 20;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    uint64_t v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v3 = *(os_log_s **)(gLogObjects + 152);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    label = dispatch_queue_get_label(0LL);
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "iAP2 Endpoint Destroy. currentDispatchQueue: %s",  (uint8_t *)&v5,  0xCu);
  }

  iAP2LinkRunLoopShuttingDown(*(void *)(*(void *)(a1 + 32) + 32LL));
  return iap2_sessionControl_cleanup(*(void *)(a1 + 32));
}

uint64_t iap2_endpoint_processIncomingData(uint64_t result, CFTypeRef cf)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = 0LL;
    if (cf)
    {
      if (*(void *)(v3 + 32))
      {
        CFRetain(cf);
        int v4 = *(dispatch_queue_s **)(v3 + 24);
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 0x40000000LL;
        v5[2] = __iap2_endpoint_processIncomingData_block_invoke;
        v5[3] = &__block_descriptor_tmp_6_3;
        v5[4] = v3;
        v5[5] = cf;
        dispatch_async(v4, v5);
        return 1LL;
      }
    }
  }

  return result;
}

void __iap2_endpoint_processIncomingData_block_invoke(uint64_t a1)
{
  uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 32) + 32LL) + 24LL);
  unsigned int Length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
  kdebug_trace(731120016LL, 0LL, 0LL, 0LL, 0LL);
  unsigned int v24 = Length;
  if (Length)
  {
    int v3 = 0;
    int v4 = Length;
    do
    {
      if (!*(void *)(*(void *)(a1 + 32) + 104LL))
      {
        *(void *)(*(void *)(a1 + 32) + 104LL) = iAP2PacketCreateEmptyRecvPacket(v25);
        if (!*(void *)(*(void *)(a1 + 32) + 104LL)) {
          break;
        }
      }

      uint64_t v5 = gLogObjects;
      int v6 = gNumLogObjects;
      if (!gLogObjects || gNumLogObjects < 19)
      {
        int v8 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)uint64_t v31 = v5;
          *(_WORD *)&v31[8] = 1024;
          v32[0] = v6;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
          int v8 = (os_log_s *)&_os_log_default;
        }
      }

      else
      {
        int v8 = *(os_log_s **)(gLogObjects + 144);
      }

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)uint64_t v31 = v24;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v4;
        LOWORD(v32[0]) = 1024;
        *(_DWORD *)((char *)v32 + 2) = v3;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Calling iAP2PacketParseBuffer, dataLength: %u, numBytesRemaining: %u, byteIndex: %u",  buf,  0x14u);
      }

      uint64_t v9 = (char *)&CFDataGetBytePtr(*(CFDataRef *)(a1 + 40))[v3];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 104LL);
      unsigned int MaxRecvPacketSize = iAP2LinkGetMaxRecvPacketSize(v25);
      int v12 = iAP2PacketParseBuffer(v9, v4, v10, MaxRecvPacketSize, 0LL, 0LL, 0LL, 2);
      if (!v12) {
        break;
      }
      int v13 = v12;
      uint64_t v14 = gLogObjects;
      int v15 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 19)
      {
        uint64_t v16 = *(os_log_s **)(gLogObjects + 144);
      }

      else
      {
        uint64_t v16 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)uint64_t v31 = v14;
          *(_WORD *)&v31[8] = 1024;
          v32[0] = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
          uint64_t v16 = (os_log_s *)&_os_log_default;
        }
      }

      v4 -= v13;
      v3 += v13;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)uint64_t v31 = v13;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = v4;
        LOWORD(v32[0]) = 1024;
        *(_DWORD *)((char *)v32 + 2) = v3;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "iAP2PacketParseBuffer finished, numBytesRead: %u, numBytesRemaining: %u, byteIndex: %u",  buf,  0x14u);
      }

      BOOL IsComplete = iAP2PacketIsComplete(*(void *)(*(void *)(a1 + 32) + 104LL));
      uint64_t v18 = gLogObjects;
      int v19 = gNumLogObjects;
      BOOL v20 = !gLogObjects || gNumLogObjects <= 18;
      BOOL v21 = !v20;
      if (IsComplete)
      {
        if (v21)
        {
          uint64_t v22 = *(os_log_s **)(gLogObjects + 144);
        }

        else
        {
          uint64_t v22 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)uint64_t v31 = v18;
            *(_WORD *)&v31[8] = 1024;
            v32[0] = v19;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
            uint64_t v22 = (os_log_s *)&_os_log_default;
          }
        }

        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          __iap2_endpoint_processIncomingData_block_invoke_cold_1(&v28, v29, v22);
        }
        acc_platform_packetLogging_logiAP2Packet(*(uint64_t **)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 104LL), 1);
        kdebug_trace(731120024LL, 0LL, 0LL, 0LL, 0LL);
        iAP2LinkRunLoopHandleReadyPacket( *(void *)(*(void *)(a1 + 32) + 32LL),  *(uint64_t **)(*(void *)(a1 + 32) + 104LL));
        iAP2PacketRelease(*(uint64_t **)(*(void *)(a1 + 32) + 104LL));
        *(void *)(*(void *)(a1 + 32) + 104LL) = 0LL;
      }

      else
      {
        if (v21)
        {
          uint64_t v23 = *(os_log_s **)(gLogObjects + 144);
        }

        else
        {
          uint64_t v23 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)uint64_t v31 = v18;
            *(_WORD *)&v31[8] = 1024;
            v32[0] = v19;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
            uint64_t v23 = (os_log_s *)&_os_log_default;
          }
        }

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          __iap2_endpoint_processIncomingData_block_invoke_cold_2(&v26, v27, v23);
        }
      }
    }

    while (v4 - 1 < v24);
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t iap2_endpoint_sendOutgoingData(uint64_t *a1, const UInt8 *a2, unsigned int a3)
{
  if (a1)
  {
    kdebug_trace(731119632LL, 0LL, 0LL, 0LL, 0LL);
    int v6 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, a2, a3, kCFAllocatorNull);
    uint64_t v7 = acc_endpoint_sendOutgoingData(*a1, v6);
    if (v6) {
      CFRelease(v6);
    }
  }

  else
  {
    uint64_t v9 = (os_log_s *)logObjectForModule_1(18);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      iap2_endpoint_create_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0LL;
  }

  return v7;
}

uint64_t iap2_endpoint_setInitialized(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 440) = a2;
  BOOL v2 = *(pthread_mutex_t **)a1;
  if (!v2) {
    return 0LL;
  }
  if (a2) {
    return acc_endpoint_setProperty(v2, kCFACCProperties_Endpoint_iAP2_Initialized, 0LL);
  }
  return acc_endpoint_removeProperty(v2, kCFACCProperties_Endpoint_iAP2_Initialized);
}

BOOL iap2_endpoint_isInitialized(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 440) != 0;
  }
  return result;
}

void iap2_endpoint_linkStateChanged(uint64_t a1, int a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 20;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v5 = *(os_log_s **)(gLogObjects + 152);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Link state changed! (Connected: %d)",  (uint8_t *)v7,  8u);
  }

  int v6 = *(unsigned __int8 *)(a1 + 96);
  *(_BYTE *)(a1 + 96) = a2;
  if (v6 || !a2)
  {
    if (v6)
    {
      if ((a2 & 1) == 0)
      {
        iap2_sessionControl_cleanup(a1);
        iap2_sessionFileTransfer_cleanup(a1);
        iap2_sessionLog_cleanup(a1);
      }
    }
  }

  else
  {
    iap2_endpoint_configUSBHost((uint64_t *)a1);
    iap2_sessionControl_init((const __CFSet *)a1);
    iap2_sessionControl_start((unsigned __int8 *)a1);
    iap2_sessionFileTransfer_init(a1);
    iap2_sessionFileTransfer_start((unsigned __int8 *)a1);
    iap2_sessionLog_init();
    iap2_sessionLog_start(a1);
  }

uint64_t *iap2_endpoint_configUSBHost(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = *result;
    if (*result)
    {
      if (*(_DWORD *)(v1 + 24) == 8)
      {
        BOOL v2 = *(uint64_t **)v1;
        if (*(void *)v1)
        {
          uint64_t v3 = result[4];
          if (v3) {
            uint64_t MaxSendPacketSize = iAP2LinkGetMaxSendPacketSize(*(void *)(v3 + 24));
          }
          else {
            uint64_t MaxSendPacketSize = 0LL;
          }
          if (gLogObjects && gNumLogObjects >= 20)
          {
            uint64_t v5 = *(os_log_s **)(gLogObjects + 152);
          }

          else
          {
            uint64_t v5 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = *v2;
            int v7 = *(_DWORD *)(v1 + 24);
            int v8 = 138412802;
            uint64_t v9 = v6;
            __int16 v10 = 1024;
            int v11 = v7;
            __int16 v12 = 1024;
            int v13 = MaxSendPacketSize;
            _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ConfigUSBHost: connection:%@ type:%{coreacc:ACCEndpoint_TransportType_t}d maxOutSize:%d",  (uint8_t *)&v8,  0x18u);
          }

          return (uint64_t *)platform_usb_setNeedOutZlp(*v2, 1LL, MaxSendPacketSize);
        }
      }
    }
  }

  return result;
}

uint64_t iap2_endpoint_getMaxSendPayloadSize(uint64_t result)
{
  if (result)
  {
    if (*(_BYTE *)(result + 96) && (uint64_t v1 = *(void *)(result + 32)) != 0)
    {
      uint64_t result = *(void *)(v1 + 24);
      if (result) {
        LOWORD(result) = iAP2LinkGetMaxPayloadSize(result, 0LL);
      }
    }

    else
    {
      LOWORD(result) = 0;
    }
  }

  return (unsigned __int16)result;
}

uint64_t iap2_endpoint_getMaxSendPayloadSizeWithOverride(uint64_t a1)
{
  if (!a1)
  {
    LOWORD(v2) = 0;
    return (unsigned __int16)v2;
  }

  LOWORD(v2) = *(unsigned __int8 *)(a1 + 96);
  if (*(_BYTE *)(a1 + 96))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 24);
      if (!v3)
      {
        LOWORD(v2) = 0;
        return (unsigned __int16)v2;
      }

      unsigned __int16 MaxPayloadSize = iAP2LinkGetMaxPayloadSize(v3, 0LL);
      unint64_t v5 = (unint64_t)acc_userDefaults_copyIntegerForKey((uint64_t)@"MaxOutboundiAP2PacketSize");
      if ((v5 & 0x8000000000000000LL) != 0) {
        goto LABEL_10;
      }
      __int16 v6 = v5;
      if (v5) {
        goto LABEL_11;
      }
      if (!*(void *)a1 || (uint64_t v7 = *(unsigned int *)(*(void *)a1 + 24LL), v7 > 0xF)) {
LABEL_10:
      }
        __int16 v6 = -1;
      else {
        __int16 v6 = word_10019F3A0[v7];
      }
LABEL_11:
      __int16 v8 = iAP2LinkCurPckHdrSize(*(void *)(*(void *)(a1 + 32) + 24LL));
      LOWORD(v2) = v6 - (v8 + iAP2LinkCurPckChksumSize(*(void *)(*(void *)(a1 + 32) + 24LL)));
    }
  }

  return (unsigned __int16)v2;
}

uint64_t iap2_endpoint_getLinkMaxCumAck(uint64_t result)
{
  if (result)
  {
    if (*(_BYTE *)(result + 96) && (uint64_t v1 = *(void *)(result + 32)) != 0 && (v2 = *(void *)(v1 + 24)) != 0) {
      return *(unsigned __int8 *)(v2 + 363);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void OUTLINED_FUNCTION_3_16(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

uint64_t iap2_blePairing_accessoryStateUpdateHandler(uint64_t a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 42)
  {
    BOOL v4 = *(os_log_s **)(gLogObjects + 328);
  }

  else
  {
    BOOL v4 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "iAP2BLEPairing AccessoryStateUpdate Handler",  buf,  2u);
  }

  uint64_t result = 0LL;
  if (!a1 || !a2) {
    return result;
  }
  unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
  int v28 = 0;
  if (!FirstParam)
  {
    BOOL v12 = 0;
    int v11 = 0;
    uint64_t v10 = 0LL;
    int v9 = 0;
    int v8 = 0;
LABEL_25:
    if (gLogObjects && gNumLogObjects >= 42)
    {
      int v19 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      int v19 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138413826;
      uint64_t v30 = v20;
      __int16 v31 = 1024;
      int v32 = v11 & 1;
      __int16 v33 = 1024;
      int v34 = v12;
      __int16 v35 = 1024;
      int v36 = v9 & 1;
      __int16 v37 = 1024;
      int v38 = v10;
      __int16 v39 = 1024;
      int v40 = v8 & 1;
      __int16 v41 = 1024;
      int v42 = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "AccessoryStateUpdate: %@, btRadioOn(valid=%d) %d, pairingState(valid=%d) %d, pairingModeOn(valid=%d) %d",  buf,  0x30u);
    }

    uint64_t result = iap2_feature_getFeature(a1, 4u);
    if (result)
    {
      BOOL v21 = (uint64_t *)result;
      buf[0] = 0;
      uint64_t result = iap2_identification_checkRequiredMsgIDs(a1, (uint64_t)&gskMsgBLEPairingMainList, 8, buf);
      if ((_DWORD)result)
      {
        if (((v11 | v9 | v8) & 1) != 0)
        {
          if ((v9 & 1) != 0) {
            int v22 = 2;
          }
          else {
            int v22 = 0;
          }
          unsigned int v23 = v22 & 0xFFFFFFFE | v11 & 1;
          if ((v8 & 1) != 0) {
            int v24 = 4;
          }
          else {
            int v24 = 0;
          }
          platform_blePairing_accessoryStateUpdate(*(void *)(a1 + 8), *v21, v23 | v24, v12, v10, v8 & 1);
        }

        return 1LL;
      }
    }

    return result;
  }

  NextParam = (unsigned __int16 *)FirstParam;
  int v8 = 0;
  int v9 = 0;
  uint64_t v10 = 0LL;
  int v11 = 0;
  BOOL v12 = 0;
  while (1)
  {
    int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
    int v14 = ParamID;
    if (ParamID == 2)
    {
      BOOL IsDataVoid = iAP2MsgIsDataVoid(NextParam);
      int v28 = !IsDataVoid;
      if (!IsDataVoid)
      {
        int MsgID = iAP2MsgGetMsgID(a2);
        int v26 = 2;
        goto LABEL_47;
      }

      int v8 = 1;
LABEL_19:
      int v17 = iAP2MsgGetMsgID(a2);
      printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v14, v17);
      goto LABEL_22;
    }

    if (ParamID == 1) {
      break;
    }
    if (ParamID) {
      goto LABEL_19;
    }
    BOOL DataAsBool = iAP2MsgGetDataAsBool(NextParam, (BOOL *)&v28);
    if (v28)
    {
      int v27 = iAP2MsgGetMsgID(a2);
      printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, v27);
      return 0LL;
    }

    BOOL v12 = DataAsBool;
    int v11 = 1;
LABEL_22:
    NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
    if (!NextParam) {
      goto LABEL_25;
    }
  }

  uint64_t DataAsU8 = iAP2MsgGetDataAsU8(NextParam, &v28);
  if (!v28)
  {
    uint64_t v10 = DataAsU8;
    int v9 = 1;
    goto LABEL_22;
  }

  int MsgID = iAP2MsgGetMsgID(a2);
  int v26 = 1;
LABEL_47:
  printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", v26, MsgID);
  return 0LL;
}

uint64_t iap2_blePairing_accessoryPairingInfoHandler(uint64_t a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 42)
  {
    BOOL v4 = *(os_log_s **)(gLogObjects + 328);
  }

  else
  {
    BOOL v4 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "iAP2BLEPairing AccessoryPairingInfo Handler",  buf,  2u);
  }

  uint64_t v5 = 0LL;
  if (a1 && a2)
  {
    unint64_t FirstParam = (unsigned __int16 *)iAP2MsgGetFirstParam(a2, 0LL);
    int v28 = 0;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (FirstParam)
    {
      int v8 = 0;
      int v9 = 0;
      while (1)
      {
        int ParamID = iAP2MsgGetParamID((uint64_t)FirstParam);
        int v11 = ParamID;
        if (ParamID == 1) {
          break;
        }
        if (ParamID) {
          goto LABEL_20;
        }
        int DataAsU8 = iAP2MsgGetDataAsU8(FirstParam, &v28);
        if (v28)
        {
          int MsgID = iAP2MsgGetMsgID(a2);
          printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, MsgID);
          goto LABEL_48;
        }

        int v9 = DataAsU8;
        int v8 = 1;
LABEL_21:
        unint64_t FirstParam = iAP2MsgGetNextParam(a2, 0LL, FirstParam);
        if (!FirstParam) {
          goto LABEL_24;
        }
      }

      uint64_t DataAsData = iAP2MsgGetDataAsData((uint64_t)FirstParam, &v28);
      if (v28)
      {
        int v27 = iAP2MsgGetMsgID(a2);
        printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 1, v27);
        goto LABEL_48;
      }

      int v14 = (const UInt8 *)DataAsData;
      if (iAP2MsgGetParamValueLen(FirstParam))
      {
        unsigned int ParamValueLen = iAP2MsgGetParamValueLen(FirstParam);
        CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, v14, ParamValueLen);
        CFArrayAppendValue(Mutable, v16);
        if (v16) {
          CFRelease(v16);
        }
      }

uint64_t iap2_blePairing_accessoryPairingDataHandler(uint64_t a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 42)
  {
    BOOL v4 = *(os_log_s **)(gLogObjects + 328);
  }

  else
  {
    BOOL v4 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "iAP2BLEPairing AccessoryPairingData Handler",  buf,  2u);
  }

  uint64_t result = 0LL;
  if (!a1 || !a2) {
    return result;
  }
  unint64_t FirstParam = iAP2MsgGetFirstParam(a2, 0LL);
  int v23 = 0;
  if (!FirstParam)
  {
    int v12 = 0;
    int v11 = 0;
    uint64_t v10 = 0LL;
    unsigned __int16 ParamValueLen = 0;
    int v8 = 0;
LABEL_22:
    if (gLogObjects && gNumLogObjects >= 42)
    {
      uint64_t v18 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      uint64_t v18 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "AccessoryPairingData: %@", buf, 0xCu);
    }

    uint64_t result = iap2_feature_getFeature(a1, 4u);
    if (result)
    {
      uint64_t v20 = (uint64_t *)result;
      buf[0] = 0;
      uint64_t result = iap2_identification_checkRequiredMsgIDs(a1, (uint64_t)&gskMsgBLEPairingMainList, 8, buf);
      if ((_DWORD)result)
      {
        if ((v11 & v8 & 1) != 0) {
          platform_blePairing_accessoryPairingData(*(void *)(a1 + 8), *v20, v12, v10, ParamValueLen);
        }
        return 1LL;
      }
    }

    return result;
  }

  NextParam = (unsigned __int16 *)FirstParam;
  int v8 = 0;
  unsigned __int16 ParamValueLen = 0;
  uint64_t v10 = 0LL;
  int v11 = 0;
  int v12 = 0;
  while (1)
  {
    int ParamID = iAP2MsgGetParamID((uint64_t)NextParam);
    int v14 = ParamID;
    if (ParamID == 1) {
      break;
    }
    if (ParamID) {
      goto LABEL_18;
    }
    int DataAsU8 = iAP2MsgGetDataAsU8(NextParam, &v23);
    if (v23)
    {
      int MsgID = iAP2MsgGetMsgID(a2);
      printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 0, MsgID);
      return 0LL;
    }

    int v12 = DataAsU8;
    int v11 = 1;
LABEL_19:
    NextParam = iAP2MsgGetNextParam(a2, 0LL, NextParam);
    if (!NextParam) {
      goto LABEL_22;
    }
  }

  uint64_t DataAsData = iAP2MsgGetDataAsData((uint64_t)NextParam, &v23);
  if (!v23)
  {
    uint64_t v10 = DataAsData;
    unsigned __int16 ParamValueLen = iAP2MsgGetParamValueLen(NextParam);
    int v8 = 1;
LABEL_18:
    int v17 = iAP2MsgGetMsgID(a2);
    printf("Unknown Param ID: %d for Msg ID: 0x%04X - ignoring param", v14, v17);
    goto LABEL_19;
  }

  int v22 = iAP2MsgGetMsgID(a2);
  printf("Param ID: %d parse error for Msg ID: 0x%04X - ignoring message", 1, v22);
  return 0LL;
}

uint64_t iap2_blePairing_startBLEUpdatesHandler(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    uint64_t Feature = iap2_feature_getFeature(result, 4u);
    if (gLogObjects && gNumLogObjects >= 42)
    {
      uint64_t v5 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      uint64_t v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = "exists";
      uint64_t v7 = v3[1];
      if (!Feature) {
        __int16 v6 = "missing!!";
      }
      int v22 = 138412546;
      uint64_t v23 = v7;
      __int16 v24 = 2080;
      uint64_t v25 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "startBLEUpdatesHandler %@ blePairing %s",  (uint8_t *)&v22,  0x16u);
    }

    uint64_t result = 0LL;
    if (a2)
    {
      if (Feature)
      {
        if (*(_DWORD *)a2) {
          return 0LL;
        }
        if (gLogObjects) {
          BOOL v8 = gNumLogObjects <= 41;
        }
        else {
          BOOL v8 = 1;
        }
        int v9 = !v8;
        if (*(_DWORD *)(a2 + 16) <= 1u)
        {
          if (v9)
          {
            uint64_t v10 = *(os_log_s **)(gLogObjects + 328);
          }

          else
          {
            uint64_t v10 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = v3[1];
            int v22 = 138412290;
            uint64_t v23 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "startBLEUpdatesHandler %@, create msg",  (uint8_t *)&v22,  0xCu);
          }

          uint64_t v13 = iAP2MsgInit((uint64_t)(v3 + 15), 45312, v3[24], 0xFFFF, 0LL, 0LL);
          *(_BYTE *)(Feature + 8) = 1;
          int v14 = iAP2MsgAddU8Param(v13, 0LL, 0, *(_BYTE *)(a2 + 16));
          uint64_t v15 = iAP2MsgAddU8Param(v13, 0LL, 1, *(_BYTE *)(a2 + 21));
          if (iAP2MsgAddU8Param(v13, 0LL, 2, *(_BYTE *)(a2 + 20)) || v15 || (uint64_t result = 0LL, v14))
          {
            if (gLogObjects && gNumLogObjects >= 42)
            {
              CFDataRef v16 = *(os_log_s **)(gLogObjects + 328);
            }

            else
            {
              CFDataRef v16 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
            }

            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v20 = v3[1];
              int MsgID = iAP2MsgGetMsgID(v13);
              int v22 = 138412546;
              uint64_t v23 = v20;
              __int16 v24 = 1024;
              LODWORD(v25) = MsgID;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "startBLEUpdatesHandler %@ send message %xh",  (uint8_t *)&v22,  0x12u);
            }

            iap2_sessionControl_sendOutgoingMessage(v3, v13);
            platform_blePairing_deleteParams((void *)a2);
            return 1LL;
          }

          return result;
        }

        if (v9)
        {
          int v11 = *(os_log_s **)(gLogObjects + 328);
        }

        else
        {
          int v11 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0LL;
        if (v17)
        {
          uint64_t v18 = v3[1];
          int v19 = *(_DWORD *)(a2 + 16);
          int v22 = 138412546;
          uint64_t v23 = v18;
          __int16 v24 = 1024;
          LODWORD(v25) = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "startBLEUpdatesHandler %@, Invalid pairType:%d, updates not started",  (uint8_t *)&v22,  0x12u);
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t iap2_blePairing_deviceStateUpdateHandler(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    uint64_t Feature = iap2_feature_getFeature(result, 4u);
    if (gLogObjects && gNumLogObjects >= 42)
    {
      uint64_t v5 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      uint64_t v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = "exists";
      uint64_t v7 = v3[1];
      if (!Feature) {
        __int16 v6 = "missing!!";
      }
      int v21 = 138412546;
      uint64_t v22 = v7;
      __int16 v23 = 2080;
      __int16 v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "deviceStateUpdateHandler %@ blePairing %s",  (uint8_t *)&v21,  0x16u);
    }

    uint64_t result = 0LL;
    if (a2)
    {
      if (Feature)
      {
        if (*(_DWORD *)a2 == 1)
        {
          if (gLogObjects) {
            BOOL v8 = gNumLogObjects <= 41;
          }
          else {
            BOOL v8 = 1;
          }
          int v9 = !v8;
          if (*(_BYTE *)(Feature + 8))
          {
            if (v9)
            {
              uint64_t v10 = *(os_log_s **)(gLogObjects + 328);
            }

            else
            {
              uint64_t v10 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
            }

            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              uint64_t v12 = v3[1];
              int v21 = 138412290;
              uint64_t v22 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "deviceStateUpdateHandler %@, create msg",  (uint8_t *)&v21,  0xCu);
            }

            uint64_t v13 = iAP2MsgInit((uint64_t)(v3 + 15), 45313, v3[24], 0xFFFF, 0LL, 0LL);
            int v14 = iAP2MsgAddU8Param(v13, 0LL, 0, *(_BYTE *)(a2 + 16));
            uint64_t v15 = iAP2MsgAddU8Param(v13, 0LL, 1, *(_BYTE *)(a2 + 20));
            if (iAP2MsgAddU8Param(v13, 0LL, 2, *(_BYTE *)(a2 + 24)) || v15 || v14)
            {
              if (gLogObjects && gNumLogObjects >= 42)
              {
                CFDataRef v16 = *(os_log_s **)(gLogObjects + 328);
              }

              else
              {
                CFDataRef v16 = (os_log_s *)&_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  platform_connectionInfo_configStreamCategoryListReady_cold_1();
                }
              }

              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                uint64_t v19 = v3[1];
                int MsgID = iAP2MsgGetMsgID(v13);
                int v21 = 138412546;
                uint64_t v22 = v19;
                __int16 v23 = 1024;
                LODWORD(v24) = MsgID;
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "deviceStateUpdateHandler %@ send message %xh",  (uint8_t *)&v21,  0x12u);
              }

              iap2_sessionControl_sendOutgoingMessage(v3, v13);
              if (*(_DWORD *)(a2 + 20)) {
                platform_blePairing_finishedNegotiation(v3[1], *(void *)Feature);
              }
              platform_blePairing_deleteParams((void *)a2);
              return 1LL;
            }
          }

          else
          {
            if (v9)
            {
              int v11 = *(os_log_s **)(gLogObjects + 328);
            }

            else
            {
              int v11 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
            }

            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = v3[1];
              int v18 = *(unsigned __int8 *)(Feature + 8);
              int v21 = 138412546;
              uint64_t v22 = v17;
              __int16 v23 = 1024;
              LODWORD(v24) = v18;
              _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "deviceStateUpdateHandler %@, Updates not started bUpdateStarted:%d",  (uint8_t *)&v21,  0x12u);
            }
          }

          if (*(_DWORD *)(a2 + 20)) {
            platform_blePairing_finishedNegotiation(v3[1], *(void *)Feature);
          }
        }

        return 0LL;
      }
    }
  }

  return result;
}

uint64_t iap2_blePairing_devicePairingDataHandler(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    uint64_t Feature = iap2_feature_getFeature(result, 4u);
    if (gLogObjects && gNumLogObjects >= 42)
    {
      uint64_t v5 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      uint64_t v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = "exists";
      uint64_t v7 = v3[1];
      if (!Feature) {
        __int16 v6 = "missing!!";
      }
      int v24 = 138412546;
      uint64_t v25 = v7;
      __int16 v26 = 2080;
      int v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "devicePairingDataHandler %@ blePairing %s",  (uint8_t *)&v24,  0x16u);
    }

    uint64_t result = 0LL;
    if (a2)
    {
      if (Feature)
      {
        if (*(_DWORD *)a2 != 2) {
          return 0LL;
        }
        if (gLogObjects) {
          BOOL v8 = gNumLogObjects <= 41;
        }
        else {
          BOOL v8 = 1;
        }
        int v9 = !v8;
        if (*(_BYTE *)(Feature + 8))
        {
          if (v9)
          {
            uint64_t v10 = *(os_log_s **)(gLogObjects + 328);
          }

          else
          {
            uint64_t v10 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = v3[1];
            int v24 = 138412290;
            uint64_t v25 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "devicePairingDataHandler %@, create msg",  (uint8_t *)&v24,  0xCu);
          }

          uint64_t v13 = iAP2MsgInit((uint64_t)(v3 + 15), 45316, v3[24], 0xFFFF, 0LL, 0LL);
          unint64_t v14 = (unint64_t)iAP2MsgAddU8Param(v13, 0LL, 0, *(_BYTE *)(a2 + 16));
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a2 + 24));
          unsigned __int16 Length = CFDataGetLength(*(CFDataRef *)(a2 + 24));
          unint64_t v17 = (unint64_t)iAP2MsgAddDataParam(v13, 0LL, 1, BytePtr, Length);
          uint64_t result = 0LL;
          if (v17 | v14)
          {
            if (gLogObjects && gNumLogObjects >= 42)
            {
              int v18 = *(os_log_s **)(gLogObjects + 328);
            }

            else
            {
              int v18 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
            }

            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = v3[1];
              int MsgID = iAP2MsgGetMsgID(v13);
              int v24 = 138412546;
              uint64_t v25 = v22;
              __int16 v26 = 1024;
              LODWORD(v27) = MsgID;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "devicePairingDataHandler %@ send message %xh",  (uint8_t *)&v24,  0x12u);
            }

            iap2_sessionControl_sendOutgoingMessage(v3, v13);
            platform_blePairing_deleteParams((void *)a2);
            return 1LL;
          }

          return result;
        }

        if (v9)
        {
          int v11 = *(os_log_s **)(gLogObjects + 328);
        }

        else
        {
          int v11 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0LL;
        if (v19)
        {
          uint64_t v20 = v3[1];
          int v21 = *(unsigned __int8 *)(Feature + 8);
          int v24 = 138412546;
          uint64_t v25 = v20;
          __int16 v26 = 1024;
          LODWORD(v27) = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "devicePairingDataHandler %@, Updates not started bUpdateStarted:%d",  (uint8_t *)&v24,  0x12u);
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t iap2_blePairing_deviceUpdatePairingInfoHandler(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    uint64_t Feature = iap2_feature_getFeature(result, 4u);
    if (gLogObjects && gNumLogObjects >= 42)
    {
      uint64_t v5 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      uint64_t v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = "exists";
      uint64_t v7 = v3[1];
      if (!Feature) {
        __int16 v6 = "missing!!";
      }
      int v24 = 138412546;
      uint64_t v25 = v7;
      __int16 v26 = 2080;
      int v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "deviceUpdatePairingInfoHandler %@ blePairing %s",  (uint8_t *)&v24,  0x16u);
    }

    uint64_t result = 0LL;
    if (a2)
    {
      if (Feature)
      {
        if (*(_DWORD *)a2 != 3) {
          return 0LL;
        }
        if (gLogObjects) {
          BOOL v8 = gNumLogObjects <= 41;
        }
        else {
          BOOL v8 = 1;
        }
        int v9 = !v8;
        if (*(_BYTE *)(Feature + 8))
        {
          if (v9)
          {
            uint64_t v10 = *(os_log_s **)(gLogObjects + 328);
          }

          else
          {
            uint64_t v10 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = v3[1];
            int v24 = 138412290;
            uint64_t v25 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "deviceUpdatePairingInfoHandler %@, create msg",  (uint8_t *)&v24,  0xCu);
          }

          uint64_t v13 = iAP2MsgInit((uint64_t)(v3 + 15), 45318, v3[24], 0xFFFF, 0LL, 0LL);
          unint64_t v14 = (unint64_t)iAP2MsgAddU8Param(v13, 0LL, 0, *(_BYTE *)(a2 + 16));
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a2 + 24));
          unsigned __int16 Length = CFDataGetLength(*(CFDataRef *)(a2 + 24));
          unint64_t v17 = (unint64_t)iAP2MsgAddDataParam(v13, 0LL, 1, BytePtr, Length);
          uint64_t result = 0LL;
          if (v17 | v14)
          {
            if (gLogObjects && gNumLogObjects >= 42)
            {
              int v18 = *(os_log_s **)(gLogObjects + 328);
            }

            else
            {
              int v18 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                platform_connectionInfo_configStreamCategoryListReady_cold_1();
              }
            }

            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = v3[1];
              int MsgID = iAP2MsgGetMsgID(v13);
              int v24 = 138412546;
              uint64_t v25 = v22;
              __int16 v26 = 1024;
              LODWORD(v27) = MsgID;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "deviceUpdatePairingInfoHandler %@ send message %xh",  (uint8_t *)&v24,  0x12u);
            }

            iap2_sessionControl_sendOutgoingMessage(v3, v13);
            platform_blePairing_deleteParams((void *)a2);
            return 1LL;
          }

          return result;
        }

        if (v9)
        {
          int v11 = *(os_log_s **)(gLogObjects + 328);
        }

        else
        {
          int v11 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0LL;
        if (v19)
        {
          uint64_t v20 = v3[1];
          int v21 = *(unsigned __int8 *)(Feature + 8);
          int v24 = 138412546;
          uint64_t v25 = v20;
          __int16 v26 = 1024;
          LODWORD(v27) = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "deviceUpdatePairingInfoHandler %@, Updates not started bUpdateStarted:%d",  (uint8_t *)&v24,  0x12u);
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t iap2_blePairing_stopBLEUpdatesHandler(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    uint64_t Feature = iap2_feature_getFeature(result, 4u);
    if (gLogObjects && gNumLogObjects >= 42)
    {
      uint64_t v5 = *(os_log_s **)(gLogObjects + 328);
    }

    else
    {
      uint64_t v5 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v6 = "exists";
      uint64_t v7 = v3[1];
      if (!Feature) {
        __int16 v6 = "missing!!";
      }
      int v20 = 138412546;
      uint64_t v21 = v7;
      __int16 v22 = 2080;
      __int16 v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "deviceUpdatePairingInfoHandler %@ blePairing %s",  (uint8_t *)&v20,  0x16u);
    }

    uint64_t result = 0LL;
    if (a2)
    {
      if (Feature)
      {
        if (*(_DWORD *)a2 != 4) {
          return 0LL;
        }
        if (gLogObjects) {
          BOOL v8 = gNumLogObjects <= 41;
        }
        else {
          BOOL v8 = 1;
        }
        int v9 = !v8;
        if (*(_BYTE *)(Feature + 8))
        {
          if (v9)
          {
            uint64_t v10 = *(os_log_s **)(gLogObjects + 328);
          }

          else
          {
            uint64_t v10 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = v3[1];
            int v20 = 138412290;
            uint64_t v21 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "deviceUpdatePairingInfoHandler %@, create msg",  (uint8_t *)&v20,  0xCu);
          }

          uint64_t v13 = iAP2MsgInit((uint64_t)(v3 + 15), 45319, v3[24], 0xFFFF, 0LL, 0LL);
          *(_BYTE *)(Feature + 8) = 0;
          if (gLogObjects && gNumLogObjects >= 42)
          {
            unint64_t v14 = *(os_log_s **)(gLogObjects + 328);
          }

          else
          {
            unint64_t v14 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = v3[1];
            int MsgID = iAP2MsgGetMsgID(v13);
            int v20 = 138412546;
            uint64_t v21 = v15;
            __int16 v22 = 1024;
            LODWORD(v23) = MsgID;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "deviceUpdatePairingInfoHandler %@ send message %xh",  (uint8_t *)&v20,  0x12u);
          }

          iap2_sessionControl_sendOutgoingMessage(v3, v13);
          platform_blePairing_deleteParams(a2);
          return 1LL;
        }

        if (v9)
        {
          int v11 = *(os_log_s **)(gLogObjects + 328);
        }

        else
        {
          int v11 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        BOOL v17 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        uint64_t result = 0LL;
        if (v17)
        {
          uint64_t v18 = v3[1];
          int v19 = *(unsigned __int8 *)(Feature + 8);
          int v20 = 138412546;
          uint64_t v21 = v18;
          __int16 v22 = 1024;
          LODWORD(v23) = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "deviceUpdatePairingInfoHandler %@, Updates not started bUpdateStarted:%d",  (uint8_t *)&v20,  0x12u);
          return 0LL;
        }
      }
    }
  }

  return result;
}

_BYTE *_createFeature_26(uint64_t a1)
{
  if (gLogObjects && gNumLogObjects >= 42)
  {
    uint64_t v2 = *(os_log_s **)(gLogObjects + 328);
  }

  else
  {
    uint64_t v2 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "iAP2BLEPairing _createFeature", v4, 2u);
  }

  if (!a1) {
    return 0LL;
  }
  uint64_t result = calloc(1uLL, 0x10uLL);
  if (result)
  {
    *(void *)uint64_t result = 0LL;
    result[8] = 0;
  }

  return result;
}

uint64_t _destroyFeature_26(uint64_t **a1, uint64_t a2)
{
  if (gLogObjects && gNumLogObjects >= 42)
  {
    BOOL v4 = *(os_log_s **)(gLogObjects + 328);
  }

  else
  {
    BOOL v4 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "iAP2BLEPairing _destroyFeature", v6, 2u);
  }

  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (*a1)
    {
      platform_blePairing_accessoryDetached(*(void *)(a2 + 8), **a1);
      platform_blePairing_decrementUserCount();
      if (*a1)
      {
        free(*a1);
        *a1 = 0LL;
      }

      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL _startFeatureFromDevice_17(uint64_t a1)
{
  if (gLogObjects && gNumLogObjects >= 42)
  {
    uint64_t v2 = *(os_log_s **)(gLogObjects + 328);
  }

  else
  {
    uint64_t v2 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "iAP2BLEPairing _startFeatureFromDevice",  (uint8_t *)&v17,  2u);
  }

  uint64_t Feature = (uint64_t *)iap2_feature_getFeature(a1, 4u);
  if (Feature)
  {
    LOBYTE(v17) = 0;
    if (iap2_identification_checkRequiredMsgIDs(a1, (uint64_t)&gskMsgBLEPairingMainList, 8, &v17))
    {
      uint64_t v4 = iap2_feature_getFeature(a1, 0);
      uint64_t *Feature = (uint64_t)CFDataCreateCopy(kCFAllocatorDefault, *(CFDataRef *)(v4 + 24));
      uint64_t v5 = iap2_feature_getFeature(a1, 1u);
      __int16 v6 = *(const void ***)(v5 + 8);
      AccInfoMutableDict = platform_blePairing_createAccInfoMutableDict(v6[2], v6[3], v6[1], v6[4], v6[5], v6[6]);
      BOOL v8 = _copySupportedPairTypesData(a1);
      platform_blePairing_incrementUserCount();
      if (gLogObjects && gNumLogObjects >= 42)
      {
        int v9 = *(os_log_s **)(gLogObjects + 328);
      }

      else
      {
        int v9 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(v5 + 8) + 16LL);
        BOOL isApplePencilGen1Supported = platform_systemInfo_isApplePencilGen1Supported();
        int v17 = 136315906;
        uint64_t v18 = "_startFeatureFromDevice";
        __int16 v19 = 1024;
        int v20 = 864;
        __int16 v21 = 2112;
        uint64_t v22 = v10;
        __int16 v23 = 1024;
        BOOL v24 = isApplePencilGen1Supported;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s:%d model %@, isApplePencilGen1Supported %d",  (uint8_t *)&v17,  0x22u);
      }

      if (CFStringCompare(*(CFStringRef *)(*(void *)(v5 + 8) + 16LL), @"A1603", 0LL)
        || platform_systemInfo_isApplePencilGen1Supported())
      {
        if (!a1 || (uint64_t v12 = *(void *)(a1 + 8)) == 0) {
          uint64_t v12 = 0LL;
        }
        platform_blePairing_accessoryAttached(v12, *Feature, (uint64_t)AccInfoMutableDict, (uint64_t)v8);
      }

      else if (platform_systemInfo_isIPad())
      {
        AccessoryNotSupportedCF = (void *)acc_userNotifications_createAccessoryNotSupportedCF();
        CFStringRef Identifier = acc_userNotifications_createIdentifier( (uint64_t)@"iap2_pairing_not_supported",  *(void *)(a1 + 8));
        ACCUNSetIdentifier(AccessoryNotSupportedCF, (uint64_t)Identifier);
        if (Identifier) {
          CFRelease(Identifier);
        }
        if (*(void *)a1)
        {
          if (**(void **)a1)
          {
            uint64_t v16 = *(void *)(a1 + 16);
            if (v16) {
              ACCUNSetGroupIdentifier(AccessoryNotSupportedCF, v16);
            }
          }
        }

        ACCUNManagerPresentNotification(AccessoryNotSupportedCF, 0LL);
        if (AccessoryNotSupportedCF) {
          CFRelease(AccessoryNotSupportedCF);
        }
      }

      if (AccInfoMutableDict) {
        CFRelease(AccInfoMutableDict);
      }
      if (v8) {
        CFRelease(v8);
      }
    }
  }

  return Feature != 0LL;
}

uint64_t _checkIdentificationInfo_23(uint64_t a1)
{
  unsigned __int8 v10 = 0;
  uint64_t v2 = iap2_identification_checkIdentificationMsgIDs(a1, (uint64_t)&gskMsgBLEPairingMainList, 8u, &v10);
  uint64_t v3 = v2;
  int v4 = v10;
  if (v10) {
    BOOL v5 = (_DWORD)v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v10) {
      BOOL v6 = (_DWORD)v2 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      uint64_t v7 = _copySupportedPairTypesData(a1);
      if (!v7) {
        return 2LL;
      }
      BOOL v8 = v7;
      uint64_t v3 = 2 * (CFDataGetLength(v7) < 1);
      CFRelease(v8);
      int v4 = v10;
    }

    if (v4 && !(_DWORD)v3)
    {
      iap2_features_createFeature(a1, 4u);
      iap2_identification_setIdentifiedForFeature(a1, 4u);
    }
  }

  return v3;
}

CFDictionaryRef _copySupportedPairTypesData(uint64_t a1)
{
  uint64_t result = (const __CFDictionary *)iap2_identification_transportComponents(a1);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t result = (const __CFDictionary *)CFDictionaryGetCount(result);
    if (result)
    {
      uint64_t v3 = (uint64_t)result;
      __chkstk_darwin(result);
      BOOL v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      memset(v5, 170, v4);
      CFDictionaryGetKeysAndValues(v2, 0LL, (const void **)v5);
      if (v3 >= 1)
      {
        *(void *)&__int128 v6 = 134218240LL;
        __int128 v11 = v6;
        do
        {
          uint64_t v7 = *v5;
          if (*v5)
          {
            if (*(_DWORD *)(v7 + 20) == 5) {
              return CFDataCreate(kCFAllocatorDefault, *(const UInt8 **)(v7 + 32), *(unsigned __int8 *)(v7 + 40));
            }
          }

          else
          {
            uint64_t v8 = gLogObjects;
            int v9 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 42)
            {
              unsigned __int8 v10 = *(os_log_s **)(gLogObjects + 328);
            }

            else
            {
              unsigned __int8 v10 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v11;
                uint64_t v15 = v8;
                __int16 v16 = 1024;
                int v17 = v9;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
                unsigned __int8 v10 = (os_log_s *)&_os_log_default;
              }
            }

            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
              _checkIdentificationInfo_cold_5(&v12, v13, v10);
            }
          }

          ++v5;
          --v3;
        }

        while (v3);
      }

      return 0LL;
    }
  }

  return result;
}

id _platform_vehicle_checkForLowDistanceRangeStatus(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  BOOL v5 = v4;
  if (v4 && (__int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3])) != 0)
  {
    uint64_t v7 = v6;
    id v8 = [v6 BOOLValue];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

id platform_vehicle_vehicleStatusChanged(uint64_t a1, void *a2)
{
  if ((_platform_vehicle_checkForLowDistanceRangeStatus(a2, kACCVehicleInfoHasLowDistanceRangeKey) & 1) != 0
    || (_platform_vehicle_checkForLowDistanceRangeStatus( a2,  kACCVehicleInfoHasLowDistanceRangeGasolineKey) & 1) != 0 || (_platform_vehicle_checkForLowDistanceRangeStatus( a2,  kACCVehicleInfoHasLowDistanceRangeDieselKey) & 1) != 0 || (_platform_vehicle_checkForLowDistanceRangeStatus( a2,  kACCVehicleInfoHasLowDistanceRangeElectricKey) & 1) != 0 || _platform_vehicle_checkForLowDistanceRangeStatus(a2, kACCVehicleInfoHasLowDistanceRangeCNGKey))
  {
    uint64_t v4 = gLogObjects;
    int v5 = gNumLogObjects;
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 7;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        acc_nvmInfo_getPairingStatus_cold_1(v4, v5);
      }
      id v8 = (os_log_s *)&_os_log_default;
      id v7 = &_os_log_default;
    }

    else
    {
      id v8 = (os_log_s *)*(id *)(gLogObjects + 48);
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Have low fuel update...launch maps application",  v13,  2u);
    }

    platform_system_launchApplicationToBackground(@"com.apple.Maps");
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACCExternalAccessoryServer sharedServer](&OBJC_CLASS___ACCExternalAccessoryServer, "sharedServer"));
  unsigned __int8 v10 = v9;
  if (v9) {
    id v11 = [v9 vehicleStatusDidChange:a2 forAccessoryUUID:a1];
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

uint64_t iAP2LinkActionNone(uint64_t result, _BYTE *a2)
{
  if (!result) {
    iAP2LinkActionNone_cold_1();
  }
  if (!a2) {
    iAP2LinkActionNone_cold_2();
  }
  *a2 = 29;
  return result;
}

uint64_t iAP2LinkActionHandleACK(uint64_t result, _BYTE *a2)
{
  if (!result) {
    iAP2LinkActionHandleACK_cold_1();
  }
  if (!a2) {
    iAP2LinkActionHandleACK_cold_2();
  }
  *a2 = 29;
  return result;
}

void iAP2LinkActionSendData(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionSendData_cold_1();
  }
  if (!a2) {
    iAP2LinkActionSendData_cold_2();
  }
  *a2 = 29;
  iAP2LinkProcessOutQueue(*(void *)(a1 + 16));
}

void iAP2LinkProcessOutQueue(uint64_t a1)
{
  if (!a1) {
    iAP2LinkProcessOutQueue_cold_1();
  }
  uint64_t v2 = (unsigned __int8 *)(a1 + 440);
  int v3 = 5;
  while (v3 && iAP2LinkSendWindowAvailable(a1))
  {
    int v4 = 0;
    char v5 = 0;
    --v3;
    while (iAP2LinkSendWindowAvailable(a1) && iAP2ListArrayGetAvailSpace(*(_BYTE **)(a1 + 296)))
    {
      uint64_t v6 = a1 + 8LL * *(unsigned __int8 *)(a1 + 344);
      if (iAP2ListArrayGetCount(*(unsigned __int8 **)(v6 + 304)))
      {
        id v7 = (unsigned __int8 **)(v6 + 304);
        unsigned int FirstItemIndex = iAP2ListArrayGetFirstItemIndex(*(void *)(v6 + 304));
        int v9 = (uint64_t *)iAP2ListArrayItemForIndex(*(void *)(v6 + 304), FirstItemIndex);
        if (v9)
        {
          uint64_t v10 = *v9;
          if (*v9)
          {
            iAP2PacketRetain(*v9);
            id v11 = *(_BYTE **)(v10 + 64);
            uint64_t v12 = *(unsigned __int8 *)(a1 + 420);
            if (!*(_BYTE *)(a1 + 420)) {
              goto LABEL_19;
            }
            uint64_t v13 = 0LL;
            unint64_t v14 = v2;
            uint64_t v15 = v2;
            do
            {
              int v16 = *v15;
              v15 += 4;
              unint64_t v14 = v15;
              --v12;
            }

            while (v12);
            if (v13 && v13[3]) {
              char v17 = 0;
            }
            else {
LABEL_19:
            }
              char v17 = 1;
            v11[5] = *(_BYTE *)(a1 + 190) + v17;
            v11[6] = *(_BYTE *)(a1 + 188);
            *(_DWORD *)(a1 + 532) += iAP2PacketGetPayloadLen(v10);
            ++*(_DWORD *)(a1 + 540);
            iAP2ListArrayDeleteItem(*v7, FirstItemIndex, (uint64_t (*)(unsigned __int8 *))_DeletePckCB);
            uint64_t v18 = *(void (**)(uint64_t, void))(v10 + 24);
            if (v18) {
              v18(a1, *(void *)(v10 + 8));
            }
            __int16 v19 = *(void (**)(uint64_t, void))(v10 + 16);
            if (v19 && (*(_WORD *)(v10 + 61) & 0x800) == 0) {
              v19(a1, *(void *)(v10 + 8));
            }
            iAP2PacketRelease((uint64_t *)v10);
          }
        }
      }

      unsigned int v20 = *(unsigned __int8 *)(a1 + 344);
      if (v20 < 4) {
        char v21 = v20 + 1;
      }
      else {
        char v21 = 0;
      }
      *(_BYTE *)(a1 + 344) = v21;
      if (++v4 == 5) {
        break;
      }
    }

    if ((v5 & 1) == 0)
    {
      int v22 = 0;
      goto LABEL_36;
    }
  }

  int v22 = 1;
LABEL_36:
  if (!iAP2LinkSendWindowAvailable(a1)) {
    iAP2LinkEventNotify(a1, 4LL, 0LL);
  }
  if (v22) {
    iAP2LinkSignalSendBuffCB(a1);
  }
}

void iAP2LinkActionDetach(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionDetach_cold_1();
  }
  if (!a2) {
    iAP2LinkActionDetach_cold_2();
  }
  *a2 = 29;
  iAP2LinkConnectedCB(*(void *)(a1 + 16), 0);
}

uint64_t *iAP2LinkActionSendACK(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionSendACK_cold_1();
  }
  if (!a2) {
    iAP2LinkActionSendACK_cold_2();
  }
  *a2 = 29;
  uint64_t v2 = *(void *)(a1 + 16);
  iAP2TimeCancelTimer(*(unsigned int **)(v2 + 200), *(_BYTE *)(v2 + 194));
  *(_BYTE *)(v2 + 194) = -1;
  int v3 = *(unsigned __int8 **)(v2 + 288);
  unsigned __int8 v22 = -86;
  unint64_t RecvPckFirstItem = _GetRecvPckFirstItem(v2, &v22);
  unsigned __int8 v5 = -1;
  if (RecvPckFirstItem)
  {
    do
    {
      if ((*(_BYTE *)(v2 + 212) & 1) != 0) {
        unsigned int v6 = iAP2PacketCalcSeqGap(*(_BYTE *)(v2 + 188), *(_BYTE *)(*(void *)(RecvPckFirstItem + 64) + 5LL));
      }
      else {
        unsigned int v6 = 128;
      }
      if (v6 < v5 && v6 != 0) {
        unsigned __int8 v5 = v6;
      }
      unint64_t RecvPckFirstItem = _GetRecvPckNextItem(v2, v22, &v22);
    }

    while (RecvPckFirstItem);
    if (v5 <= 1u) {
      goto LABEL_17;
    }
  }

  if (*(unsigned __int8 *)(v2 + 411) >= v5)
  {
    unsigned int Count = iAP2ListArrayGetCount(*(unsigned __int8 **)(v2 + 288));
    unsigned int v12 = *(unsigned __int16 *)(v2 + 422);
    if (*(_BYTE *)(v2 + 213) == 2) {
      int v13 = -12;
    }
    else {
      int v13 = -10;
    }
    unsigned int v14 = v13 + v12;
    if (v14 >= Count) {
      int v15 = Count;
    }
    else {
      int v15 = v14;
    }
    if (v14 >= Count) {
      unsigned __int8 v16 = Count;
    }
    else {
      unsigned __int8 v16 = v14;
    }
    uint64_t EAKPacket = iAP2PacketCreateEAKPacket(v2, *(_BYTE *)(v2 + 190), *(_BYTE *)(v2 + 188), 0LL, v15);
    if (!EAKPacket) {
      iAP2LinkActionSendACK_cold_5();
    }
    int v9 = (uint64_t *)EAKPacket;
    uint64_t v18 = *(_BYTE **)(EAKPacket + 72);
    unsigned __int8 v23 = -86;
    unint64_t RecvPckNextItem = _GetRecvPckFirstItem(v2, &v23);
    if (v16 && RecvPckNextItem)
    {
      int v20 = 0;
      do
      {
        *v18++ = *(_BYTE *)(*(void *)(RecvPckNextItem + 64) + 5LL);
        ++v20;
        unint64_t RecvPckNextItem = _GetRecvPckNextItem(v2, v23, &v23);
      }

      while (v20 < v16 && RecvPckNextItem != 0);
    }

    ++*(_DWORD *)(v2 + 560);
    ++*(_DWORD *)(v2 + 580);
  }

  else
  {
LABEL_17:
    uint64_t ACKPacket = iAP2PacketCreateACKPacket(v2, *(_BYTE *)(v2 + 190), *(_BYTE *)(v2 + 188), 0LL, 0, 0);
    if (!ACKPacket) {
      iAP2LinkActionSendACK_cold_3();
    }
    int v9 = (uint64_t *)ACKPacket;
    ++*(_DWORD *)(v2 + 588);
  }

  _iAP2LinkSendPacketCommon(v2, (uint64_t)v9, 0, 0);
  return iAP2PacketRelease(v9);
}

uint64_t iAP2LinkSendPacket(uint64_t a1, uint64_t a2, int a3)
{
  return _iAP2LinkSendPacketCommon(a1, a2, a3, 0);
}

void iAP2LinkActionResendMissing(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionResendMissing_cold_1();
  }
  if (!a2) {
    iAP2LinkActionResendMissing_cold_2();
  }
  *a2 = 29;
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(void **)(v3 + 280);
  unsigned int v22 = 0;
  MissingSeqFromEAK = (void **)iAP2PacketGetMissingSeqFromEAK(v4, *(unsigned __int8 *)(v3 + 421), &v22);
  unsigned int v6 = MissingSeqFromEAK;
  if (MissingSeqFromEAK) {
    BOOL v7 = v22 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = (void **)((char *)MissingSeqFromEAK + v22);
    unsigned int v21 = 1;
    int v9 = (uint64_t *)iAP2PacketCreateEmptySendPacket(v3, &v21);
    char v10 = 0;
    *int v9 = v3;
    id v11 = v6;
LABEL_8:
    char v20 = v10;
    do
    {
      *(_BYTE *)(v9[8] + 5) = *(_BYTE *)v11;
      *(void *)buf = v9;
      unsigned int Item = iAP2ListArrayFindItem( *(_BYTE **)(v3 + 296),  (uint64_t)buf,  (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t))_iAP2LinkComparePacketSeq);
      int v13 = (uint64_t *)iAP2ListArrayItemForIndex(*(void *)(v3 + 296), Item);
      if (v13)
      {
        uint64_t v14 = *v13;
        if (*v13)
        {
          if (iAP2PacketIsACKOnly(*v13))
          {
            iAP2ListArrayDeleteItem( *(_BYTE **)(v3 + 296),  Item,  (uint64_t (*)(unsigned __int8 *))_DeletePckCB);
          }

          else
          {
            unsigned int v15 = *(unsigned __int8 *)(v14 + 58);
            if (v15 < *(unsigned __int8 *)(v3 + 412))
            {
              *(_BYTE *)(v14 + 58) = v15 + 1;
              ++*(_DWORD *)(v3 + 552);
              ++*(_DWORD *)(v3 + 608);
              char v10 = 1;
              _iAP2LinkSendPacketCommon(v3, v14, 1, 0);
              id v11 = (void **)((char *)v11 + 1);
              if (v11 < v8) {
                goto LABEL_8;
              }
              iAP2PacketRelease(v9);
              goto LABEL_30;
            }

            if ((_iAP2LogEnableMask & 1) != 0)
            {
              uint64_t v16 = gLogObjects;
              int v17 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 20)
              {
                uint64_t v18 = *(os_log_s **)(gLogObjects + 152);
              }

              else
              {
                uint64_t v18 = (os_log_s *)&_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  *(void *)&uint8_t buf[4] = v16;
                  __int16 v24 = 1024;
                  int v25 = v17;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
                }
              }

              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v19 = "Device:ResendMissing";
                if (!*(_DWORD *)(v3 + 184)) {
                  __int16 v19 = "Accessory:ResendMissing";
                }
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "iAP2LinkActionResendMissing";
                __int16 v24 = 1024;
                int v25 = 2028;
                __int16 v26 = 2080;
                int v27 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d %s Resend too many times!",  buf,  0x1Cu);
              }
            }

            *a2 = 20;
          }
        }
      }

      id v11 = (void **)((char *)v11 + 1);
    }

    while (v11 < v8);
    iAP2PacketRelease(v9);
    if ((v20 & 1) != 0) {
LABEL_30:
    }
      iAP2LinkEventNotify(v3, 5LL, 0LL);
  }

  if (v6) {
    iAP2BuffPoolReturn(*(unsigned __int8 **)(v3 + 256), v6);
  }
}

void iAP2LinkEventNotify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2 > 8)
    {
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects) {
          BOOL v21 = gNumLogObjects < 20;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
          unsigned int v22 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        else
        {
          unsigned int v22 = *(os_log_s **)(gLogObjects + 152);
        }

        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v26 = "iAP2LinkEventNotify";
          __int16 v27 = 1024;
          int v28 = 6020;
          __int16 v29 = 1024;
          int v30 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d Unknown event(%d)!",  buf,  0x18u);
        }
      }
    }

    else
    {
      uint64_t v4 = a3;
      uint64_t v5 = a1;
      unint64_t v6 = 0LL;
      int v7 = 0;
      id v8 = (unsigned __int8 *)(a1 + a2 + 160);
      int v23 = (unsigned __int16)a3;
      char v9 = 1;
      uint64_t v10 = a1 + 16LL * a2;
      uint64_t v24 = v10;
      do
      {
        char v11 = v9;
        if (v6 >= *v8) {
          break;
        }
        unsigned int v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 8 * v6 + 16);
        if (v12)
        {
          if ((_iAP2LogEnableMask & 4) != 0)
          {
            int v13 = v8;
            uint64_t v14 = v5;
            uint64_t v15 = v4;
            uint64_t v16 = v3;
            uint64_t v17 = gLogObjects;
            int v18 = gNumLogObjects;
            if (gLogObjects) {
              BOOL v19 = gNumLogObjects < 20;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19)
            {
              char v20 = (os_log_s *)&_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                __int16 v26 = (const char *)v17;
                __int16 v27 = 1024;
                int v28 = v18;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
              }
            }

            else
            {
              char v20 = *(os_log_s **)(gLogObjects + 152);
            }

            uint64_t v3 = v16;
            uint64_t v4 = v15;
            uint64_t v5 = v14;
            id v8 = v13;
            uint64_t v10 = v24;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316162;
              __int16 v26 = "iAP2LinkEventNotify";
              __int16 v27 = 1024;
              int v28 = 6013;
              __int16 v29 = 1024;
              int v30 = v3;
              __int16 v31 = 1024;
              int v32 = v7;
              __int16 v33 = 1024;
              int v34 = v23;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s:%d eventNotifyCB, event=%d i=%d param=%hx!",  buf,  0x24u);
            }
          }

          v12(v5, v3, v4);
        }

        char v9 = 0;
        unint64_t v6 = 1LL;
        int v7 = 1;
      }

      while ((v11 & 1) != 0);
    }
  }

void iAP2LinkActionResendData(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionResendData_cold_1();
  }
  if (!a2) {
    iAP2LinkActionResendData_cold_2();
  }
  *a2 = 29;
  uint64_t v3 = *(void *)(a1 + 16);
  int CurTimeMs = iAP2TimeGetCurTimeMs();
  int v5 = *(unsigned __int16 *)(v3 + 416);
  char v21 = -86;
  SendPckFirstunsigned int Item = _GetSendPckFirstItem(v3, &v21);
  if (!SendPckFirstItem) {
    return;
  }
  SendPckNextunsigned int Item = SendPckFirstItem;
  char v19 = 0;
  unsigned int v8 = CurTimeMs + v5;
  char v9 = &_iAP2LogEnableMask;
  unsigned __int8 v10 = v21;
  do
  {
    while (1)
    {
      uint64_t v11 = SendPckNextItem;
      char v20 = -86;
      SendPckNextunsigned int Item = _GetSendPckNextItem(v3, v10, &v20);
      if (*(_DWORD *)(v11 + 48) > v8) {
        goto LABEL_13;
      }
      if ((*(_BYTE *)(v3 + 212) & 1) != 0)
      {
        unsigned int v12 = iAP2PacketCalcSeqGap(*(_BYTE *)(v3 + 189), *(_BYTE *)(*(void *)(v11 + 64) + 5LL));
        if (!v12) {
          goto LABEL_12;
        }
      }

      else
      {
        unsigned int v12 = 128;
      }

      if (v12 > *(unsigned __int8 *)(v3 + 411) || iAP2PacketIsACKOnly(v11))
      {
LABEL_12:
        iAP2ListArrayDeleteItem(*(_BYTE **)(v3 + 296), v10, (uint64_t (*)(unsigned __int8 *))_DeletePckCB);
        goto LABEL_13;
      }

      unsigned int v13 = *(unsigned __int8 *)(v11 + 58);
      *(_BYTE *)(v11 + 58) = v13 + 1;
      ++*(_DWORD *)(v3 + 548);
      ++*(_DWORD *)(v3 + 608);
      char v19 = 1;
      _iAP2LinkSendPacketCommon(v3, v11, 1, 0);
      unsigned __int8 v10 = v20;
      if (!SendPckNextItem) {
        goto LABEL_30;
      }
    }

    if ((*(_BYTE *)v9 & 1) != 0)
    {
      uint64_t v14 = v9;
      uint64_t v15 = gLogObjects;
      int v16 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 20)
      {
        uint64_t v17 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        uint64_t v17 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          int v23 = (const char *)v15;
          __int16 v24 = 1024;
          int v25 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }
      }

      char v9 = v14;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = "Device:ResendData";
        if (!*(_DWORD *)(v3 + 184)) {
          int v18 = "Accessory:ResendData";
        }
        *(_DWORD *)buf = 136315650;
        int v23 = "iAP2LinkActionResendData";
        __int16 v24 = 1024;
        int v25 = 2147;
        __int16 v26 = 2080;
        __int16 v27 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d %s: Resend too many times!",  buf,  0x1Cu);
      }
    }

    *a2 = 20;
LABEL_13:
    unsigned __int8 v10 = v20;
  }

  while (SendPckNextItem);
  if ((v19 & 1) == 0) {
    return;
  }
LABEL_30:
  iAP2LinkEventNotify(v3, 5LL, 0LL);
}

unint64_t _GetSendPckFirstItem(uint64_t a1, _BYTE *a2)
{
  unsigned int FirstItemIndex = iAP2ListArrayGetFirstItemIndex(*(void *)(a1 + 296));
  *a2 = FirstItemIndex;
  unint64_t result = iAP2ListArrayItemForIndex(*(void *)(a1 + 296), FirstItemIndex);
  if (result) {
    return *(void *)result;
  }
  return result;
}

unint64_t _GetSendPckNextItem(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  unsigned int NextItemIndex = iAP2ListArrayGetNextItemIndex(*(void *)(a1 + 296), a2);
  *a3 = NextItemIndex;
  unint64_t result = iAP2ListArrayItemForIndex(*(void *)(a1 + 296), NextItemIndex);
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t iAP2LinkActionHandleData(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionHandleData_cold_1();
  }
  if (!a2) {
    iAP2LinkActionHandleData_cold_2();
  }
  *a2 = 29;
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(v2 + 280);
  uint64_t v4 = *(void *)(v3 + 64);
  *(_DWORD *)(v2 + 536) += iAP2PacketGetPayloadLen(v3);
  ++*(_DWORD *)(v2 + 544);
  if (!*(_BYTE *)(v2 + 420)) {
    goto LABEL_10;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  uint64_t v7 = v2 + 440;
  do
  {
    v5 += 4LL;
  }

  while (4LL * *(unsigned __int8 *)(v2 + 420) != v5);
  if (v6)
  {
    unsigned int v8 = *(unsigned __int16 **)(v3 + 72);
    unsigned __int16 PayloadLen = iAP2PacketGetPayloadLen(v3);
    iAP2LinkDataReadyCB(v2, v8, PayloadLen, v3, *(unsigned __int8 *)(v4 + 7));
  }

  else
  {
LABEL_10:
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        unsigned __int8 v10 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        unsigned __int8 v10 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(unsigned __int8 *)(v4 + 7);
        int v13 = 136315650;
        uint64_t v14 = "iAP2LinkActionHandleData";
        __int16 v15 = 1024;
        int v16 = 2221;
        __int16 v17 = 1024;
        int v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d Invalid session(%u)!",  (uint8_t *)&v13,  0x18u);
      }
    }
  }

  uint64_t result = iAP2LinkIsNoRetransmit(v2 + 410);
  if ((result & 1) == 0 && *(unsigned __int8 *)(v2 + 194) == 255)
  {
    uint64_t result = iAP2TimeCallbackAfter(*(void *)(v2 + 200), 13, *(unsigned __int16 *)(v2 + 418));
    *(_BYTE *)(v2 + 194) = result;
  }

  return result;
}

unsigned __int8 *iAP2LinkGetSessionInfo(unsigned __int8 *result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = result[420];
    if (result[420])
    {
      uint64_t result = 0LL;
      uint64_t v4 = v2 + 440;
      uint64_t v5 = v4;
      do
      {
        int v6 = *v5;
        v5 += 4;
        if (v6 == a2) {
          uint64_t result = v4;
        }
        uint64_t v4 = v5;
        --v3;
      }

      while (v3);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL iAP2LinkIsNoRetransmit(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)(a1 + 6);
  if (!*(_WORD *)(a1 + 6) && !*(_WORD *)(a1 + 8) && !*(_BYTE *)(a1 + 2) && !*(_BYTE *)(a1 + 3)) {
    return 1LL;
  }
  if ((_iAP2LogEnableMask & 4) == 0) {
    return 0LL;
  }
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 20;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v5 = *(os_log_s **)(gLogObjects + 152);
  }

  BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    iAP2LinkIsNoRetransmit_cold_1(v2, a1, v5);
    return 0LL;
  }

  return result;
}

void iAP2LinkActionNotifyConnectionFail(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    iAP2LinkActionNotifyConnectionFail_cold_1();
  }
  if (!a2) {
    iAP2LinkActionNotifyConnectionFail_cold_2();
  }
  *a2 = 29;
  iAP2LinkConnectedCB(*(void *)(a1 + 16), 0);
}

double iAP2LinkSetDefaultSYNParam(uint64_t a1)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 4) = 65601535;
    *(_WORD *)(a1 + 8) = 10;
    *(void *)&double result = 1966337LL;
    *(_DWORD *)a1 = 1966337;
    *(_DWORD *)(a1 + 10) = -65280;
  }

  return result;
}

uint64_t iAP2LinkIsValidSynParam(unsigned __int8 *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0LL;
  if (!a1 || a2 - 1 > 2) {
    return v4;
  }
  uint64_t v5 = a1;
  unsigned int v6 = *a1;
  BOOL v7 = v6 < a2 || v6 >= 4;
  unsigned int v8 = &_iAP2LogEnableMask;
  if (v7)
  {
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        char v9 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        char v9 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        iAP2LinkIsValidSynParam_cold_11();
      }
    }

    goto LABEL_74;
  }

  if (__iAP2LinkIsValidSynParamMaxOutstandingPackets((uint64_t)a1))
  {
    if (*((unsigned __int16 *)v5 + 2) <= 0x17u)
    {
      if ((_iAP2LogEnableMask & 4) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          __int16 v29 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          __int16 v29 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          iAP2LinkIsValidSynParam_cold_9();
        }
      }

      goto LABEL_74;
    }

    if (*((unsigned __int16 *)v5 + 3) <= 0x13u)
    {
      if ((_iAP2LogEnableMask & 4) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          int v30 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          int v30 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          iAP2LinkIsValidSynParam_cold_7();
        }
      }

      goto LABEL_74;
    }

    if (__iAP2LinkIsValidSynParamCumAckTimeout((uint64_t)v5)
      && __iAP2LinkIsValidSynParamMaxRetransmissions((uint64_t)v5)
      && __iAP2LinkIsValidSynParamMaxCumAck((uint64_t)v5))
    {
LABEL_144:
      if (*v5 < 2u || !v5[24] || iAP2LinkCommandIsFeatureSetValid((uint64_t)v5))
      {
        *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int16 v65 = -21846;
        *(_OWORD *)&uint8_t buf[16] = v11;
        __int128 v64 = v11;
        *(_OWORD *)buf = v11;
        buf[10] = 0;
        if (v5[10])
        {
          unsigned __int8 v12 = 0;
          uint64_t v13 = 0LL;
          int v14 = 0;
          while (1)
          {
            __int16 v15 = &v5[4 * v13 + 30];
            if (v12)
            {
              int v16 = *v15;
              if (buf[30] == v16) {
                goto LABEL_65;
              }
              int v17 = v5[4 * v13 + 31];
              if (buf[31] == v17) {
                goto LABEL_65;
              }
              int v18 = (unsigned __int8 *)&v64 + 3;
              uint64_t v19 = 1LL;
              do
              {
                unint64_t v20 = v19;
                if (v12 == v19) {
                  break;
                }
                if (*(v18 - 1) == v16) {
                  break;
                }
                int v21 = *v18;
                v18 += 4;
                ++v19;
              }

              while (v21 != v17);
              if (v20 < v12)
              {
LABEL_65:
                uint64_t v4 = 0LL;
                int v28 = 1;
                goto LABEL_67;
              }
            }

            else
            {
              int v16 = *v15;
            }

            if (!v16) {
              goto LABEL_65;
            }
            unsigned int v22 = v8;
            int v23 = &v5[4 * v13];
            __int16 v24 = v23 + 31;
            if (v23[31] > 4u) {
              break;
            }
            int v26 = v23[33];
            int v25 = v23 + 33;
            if (v26) {
              break;
            }
            iAP2PacketCopySessionInfo(&buf[4 * v12 + 30], &v5[4 * v13 + 30]);
            unsigned __int8 v12 = ++buf[10];
            if (!*v15) {
              break;
            }
            uint64_t v27 = *v24;
            unsigned int v8 = v22;
            if (*v25
              || a3 && v5[4 * v13 + 32] > *(unsigned __int8 *)(a3 + v27)
              || a4 && v5[4 * v13 + 32] < *(unsigned __int8 *)(a4 + v27))
            {
              goto LABEL_65;
            }

            if (!(_DWORD)v27) {
              int v14 = 1;
            }
            if (++v13 >= (unint64_t)v5[10])
            {
              int v28 = 0;
              uint64_t v4 = 1LL;
              goto LABEL_67;
            }
          }

          uint64_t v4 = 0LL;
          int v28 = 1;
          unsigned int v8 = v22;
LABEL_67:
          if (v14)
          {
            if (!v28) {
              return v4;
            }
            goto LABEL_75;
          }
        }
      }
    }
  }

BOOL __iAP2LinkIsValidSynParamMaxOutstandingPackets(uint64_t a1)
{
  uint64_t v2 = (char *)(a1 + 1);
  char v1 = *(_BYTE *)(a1 + 1);
  if (!v1)
  {
    if (iAP2LinkIsNoRetransmit(a1)) {
      return 1LL;
    }
    char v1 = *v2;
  }

  if (v1 > 0) {
    return 1LL;
  }
  if ((_iAP2LogEnableMask & 4) == 0) {
    return 0LL;
  }
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 20;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v5 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v5 = *(os_log_s **)(gLogObjects + 152);
  }

  BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    __iAP2LinkIsValidSynParamMaxOutstandingPackets_cold_1();
    return 0LL;
  }

  return result;
}

BOOL __iAP2LinkIsValidSynParamCumAckTimeout(uint64_t a1)
{
  int v1 = *(__int16 *)(a1 + 8);
  if (v1 <= 9 && (_iAP2LogEnableMask & 4) != 0)
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 20;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      uint64_t v3 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      uint64_t v3 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __iAP2LinkIsValidSynParamCumAckTimeout_cold_1();
    }
  }

  return v1 > 9;
}

BOOL __iAP2LinkIsValidSynParamMaxRetransmissions(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 2) - 1;
  if (v1 >= 0x1E && (_iAP2LogEnableMask & 4) != 0)
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 20;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      uint64_t v3 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      uint64_t v3 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __iAP2LinkIsValidSynParamMaxRetransmissions_cold_1();
    }
  }

  return v1 < 0x1E;
}

BOOL __iAP2LinkIsValidSynParamMaxCumAck(uint64_t a1)
{
  if ((*(char *)(a1 + 3) & 0x80000000) == 0
    && *(unsigned __int8 *)(a1 + 3) <= *(unsigned __int8 *)(a1 + 1))
  {
    return 1LL;
  }

  if ((_iAP2LogEnableMask & 4) == 0) {
    return 0LL;
  }
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 20;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    uint64_t v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    uint64_t v3 = *(os_log_s **)(gLogObjects + 152);
  }

  BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    __iAP2LinkIsValidSynParamMaxCumAck_cold_1();
    return 0LL;
  }

  return result;
}

uint64_t iAP2LinkValidateSynParam(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = (uint64_t)a2;
  unsigned int v3 = *(unsigned __int8 *)(a1 + 215);
  if ((*(_BYTE *)(a1 + 212) & 0x40) == 0 && !*(_DWORD *)(a1 + 184)) {
    return 1LL;
  }
  if (!a2) {
    return 0LL;
  }
  *(_WORD *)&v111[32] = -21846;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v111 = v4;
  *(_OWORD *)&v111[16] = v4;
  __int128 v110 = v4;
  unsigned int v5 = *a2;
  if (v5 >= 3) {
    int v6 = 3;
  }
  else {
    int v6 = *a2;
  }
  if (v5 >= v3) {
    int v7 = v6;
  }
  else {
    int v7 = v3;
  }
  BOOL v8 = v7 == v5;
  if (v7 != v5)
  {
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        char v9 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        char v9 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *a2;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v113 = v11;
        *(_WORD *)&v113[4] = 1024;
        *(_DWORD *)&v113[6] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: linkVersion=%d->%d",  buf,  0xEu);
      }
    }

    uint64_t v2 = (uint64_t)a2;
    *a2 = v7;
  }

  int v12 = *(unsigned __int8 *)(v2 + 1);
  if (!__iAP2LinkIsValidSynParamMaxOutstandingPackets(v2))
  {
    int v13 = *(unsigned __int8 *)(v2 + 1);
    int v14 = (v13 & 0x80u) == 0 ? v12 : 127;
    int v15 = *(_BYTE *)(v2 + 1) ? v14 : 1;
    if (v15 != v13)
    {
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          int v16 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          int v16 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = a2[1];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v17;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: maxOutstandingPackets=%d->%d",  buf,  0xEu);
        }
      }

      BOOL v8 = 0;
      uint64_t v2 = (uint64_t)a2;
      a2[1] = v15;
    }
  }

  unsigned int v18 = *(unsigned __int16 *)(v2 + 4);
  if (v18 <= 0x18) {
    int v19 = 24;
  }
  else {
    int v19 = *(unsigned __int16 *)(v2 + 4);
  }
  if (v18 <= 0x17)
  {
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        unint64_t v20 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        unint64_t v20 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = *((unsigned __int16 *)a2 + 2);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v113 = v21;
        *(_WORD *)&v113[4] = 1024;
        *(_DWORD *)&v113[6] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: maxPacketSize=%d->%d",  buf,  0xEu);
      }
    }

    uint64_t v2 = (uint64_t)a2;
    *((_WORD *)a2 + 2) = v19;
  }

  BOOL v22 = v18 > 0x17 && v8;
  if (iAP2LinkIsNoRetransmit(v2))
  {
    uint64_t v23 = a1;
  }

  else
  {
    unsigned int v24 = *(unsigned __int16 *)(v2 + 6);
    if (v24 <= 0x14) {
      int v25 = 20;
    }
    else {
      int v25 = *(unsigned __int16 *)(v2 + 6);
    }
    uint64_t v23 = a1;
    if (v24 <= 0x13)
    {
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          int v26 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          int v26 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = *((unsigned __int16 *)a2 + 3);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v27;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: retransmitTimeout=%d->%d",  buf,  0xEu);
        }
      }

      BOOL v22 = 0LL;
      uint64_t v2 = (uint64_t)a2;
      *((_WORD *)a2 + 3) = v25;
    }

    unsigned int v28 = *(unsigned __int16 *)(v2 + 8);
    if (v28 >= 0x7FFF) {
      unsigned int v29 = 0x7FFF;
    }
    else {
      unsigned int v29 = *(unsigned __int16 *)(v2 + 8);
    }
    if (v29 <= 0xA) {
      int v30 = 10;
    }
    else {
      int v30 = v29;
    }
    if (v30 != v28)
    {
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          __int16 v31 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          __int16 v31 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = *((unsigned __int16 *)a2 + 4);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v32;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: cumAckTimeout=%d->%d",  buf,  0xEu);
        }
      }

      BOOL v22 = 0LL;
      uint64_t v2 = (uint64_t)a2;
      *((_WORD *)a2 + 4) = v30;
    }

    unsigned int v33 = *(unsigned __int8 *)(v2 + 2);
    if (v33 >= 0x1E) {
      int v34 = 30;
    }
    else {
      int v34 = *(unsigned __int8 *)(v2 + 2);
    }
    if (*(_BYTE *)(v2 + 2)) {
      int v35 = v34;
    }
    else {
      int v35 = 1;
    }
    if (v35 != v33)
    {
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          int v36 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          int v36 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = a2[2];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v37;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: maxRetransmissions=%d->%d",  buf,  0xEu);
        }
      }

      BOOL v22 = 0LL;
      uint64_t v2 = (uint64_t)a2;
      a2[2] = v35;
    }

    int v38 = *(char *)(v2 + 3);
    if (v38 < 0)
    {
      int v39 = 127;
    }

    else if (*(unsigned __int8 *)(v2 + 3) >= *(unsigned __int8 *)(v2 + 1))
    {
      int v39 = *(unsigned __int8 *)(v2 + 1);
    }

    else
    {
      int v39 = *(unsigned __int8 *)(v2 + 3);
    }

    if (v39 != v38)
    {
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          int v40 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          int v40 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          int v41 = a2[3];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v113 = v41;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "ERROR: Invalid SYN Params detected: maxCumAck=%d->%d",  buf,  0xEu);
        }
      }

      BOOL v22 = 0LL;
      uint64_t v2 = (uint64_t)a2;
      a2[3] = v39;
    }
  }

  *(_DWORD *)(v23 + 272) = 0;
  if (*(_BYTE *)(v2 + 24)) {
    iAP2LinkCommandValidateFeatureSets(v23, v2);
  }
  BYTE10(v110) = 0;
  unsigned int v42 = *(unsigned __int8 *)(v2 + 10);
  if (*(_BYTE *)(v2 + 10))
  {
    uint64_t v43 = 0LL;
    char v44 = 0;
    uint64_t v45 = v22;
    while (1)
    {
      uint64_t v46 = (unsigned __int8 *)(v2 + 4 * v43);
      uint64_t v48 = v46 + 30;
      int v47 = v46[30];
      int v50 = v46 + 31;
      uint64_t v49 = v46[31];
      BOOL v51 = v46[31] == 0;
      if (v46[30]) {
        BOOL v52 = v49 > 4;
      }
      else {
        BOOL v52 = 1;
      }
      if (v52) {
        goto LABEL_129;
      }
      int v54 = v46[33];
      uint64_t v53 = v46 + 33;
      if (v54) {
        break;
      }
      uint64_t v55 = v2 + 4 * v43;
      unsigned int v58 = *(unsigned __int8 *)(v55 + 32);
      int v57 = (unsigned __int8 *)(v55 + 32);
      unsigned int v56 = v58;
      uint64_t v59 = *(void *)(v23 + 352) + v49;
      if (!BYTE10(v110)) {
        goto LABEL_169;
      }
      if (v111[14] != v47 && v111[15] != (_DWORD)v49)
      {
        v79 = &v111[19];
        uint64_t v80 = 1LL;
        do
        {
          unint64_t v81 = v80;
          if (BYTE10(v110) == v80) {
            break;
          }
          if (*(v79 - 1) == v47) {
            break;
          }
          int v82 = *v79;
          v79 += 4;
          ++v80;
        }

        while (v82 != (_DWORD)v49);
        if (v81 >= BYTE10(v110))
        {
LABEL_169:
          uint64_t v94 = v45;
          iAP2PacketCopySessionInfo(&v111[4 * BYTE10(v110) + 14], v48);
          uint64_t v45 = v94;
          ++BYTE10(v110);
          goto LABEL_167;
        }
      }

      if ((_iAP2LogEnableMask & 1) != 0)
      {
        uint64_t v83 = gLogObjects;
        int v84 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v85 = gNumLogObjects < 20;
        }
        else {
          BOOL v85 = 1;
        }
        if (v85)
        {
          BOOL v86 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          v95 = (os_log_s *)&_os_log_default;
          if (v86)
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v113 = v83;
            *(_WORD *)&v113[8] = 1024;
            *(_DWORD *)v114 = v84;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
            v95 = (os_log_s *)&_os_log_default;
          }
        }

        else
        {
          v95 = *(os_log_s **)(gLogObjects + 152);
        }

        v109 = v95;
        BOOL v96 = os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
        uint64_t v45 = 0LL;
        uint64_t v2 = (uint64_t)a2;
        if (!v96) {
          goto LABEL_167;
        }
        int v97 = *(unsigned __int8 *)v48;
        int v98 = *v50;
        int v99 = *v57;
        int v100 = *v53;
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)v113 = v43;
        *(_WORD *)&v113[4] = 1024;
        *(_DWORD *)&v113[6] = v97;
        *(_WORD *)v114 = 1024;
        *(_DWORD *)&v114[2] = v98;
        __int16 v115 = 1024;
        int v116 = v99;
        __int16 v117 = 1024;
        int v118 = v100;
        v68 = v109;
        v69 = "ERROR: Duplicate session id/type detected: session %u [id=%u type=%u ver=%u unrel=%d]";
LABEL_137:
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, v69, buf, 0x20u);
      }

LABEL_129:
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      uint64_t v60 = gLogObjects;
      int v61 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 20)
      {
        v62 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        v62 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v113 = v60;
          *(_WORD *)&v113[8] = 1024;
          *(_DWORD *)v114 = v61;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
        }
      }

      BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      uint64_t v45 = 0LL;
      if (!v63) {
        goto LABEL_167;
      }
      int v64 = *(unsigned __int8 *)v48;
      int v65 = *v50;
      uint64_t v66 = v2 + 4 * v43;
      int v67 = *(unsigned __int8 *)(v66 + 32);
      LODWORD(v66) = *(unsigned __int8 *)(v66 + 33);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v113 = v43;
      *(_WORD *)&v113[4] = 1024;
      *(_DWORD *)&v113[6] = v64;
      *(_WORD *)v114 = 1024;
      *(_DWORD *)&v114[2] = v65;
      __int16 v115 = 1024;
      int v116 = v67;
      __int16 v117 = 1024;
      int v118 = v66;
      v68 = v62;
      v69 = "ERROR: Invalid SYN Params detected: session %u [id=%u type=%u ver=%u unrel=%d]";
      goto LABEL_137;
    }

    goto LABEL_138;
  }

  LOBYTE(v45) = v22;
LABEL_175:
  if (v42 <= 4)
  {
    unsigned __int8 v101 = 1;
    do
    {
      if (v42)
      {
        uint64_t v102 = 0LL;
        v103 = &v111[14];
        while (1)
        {
          int v104 = *v103;
          v103 += 4;
          if (v104 == v101) {
            break;
          }
          if (v42 == ++v102) {
            goto LABEL_185;
          }
        }

        ++v101;
      }

      else
      {
        LOBYTE(v102) = 0;
      }
    }

    while (v42 != v102);
LABEL_185:
    v105 = &v111[4 * v42 - 16];
    v105[30] = v101;
    *(_WORD *)(v105 + 31) = 256;
    v105[33] = 0;
    LOBYTE(v42) = v42 + 1;
  }

LABEL_186:
  *(_BYTE *)(v2 + 10) = v42;
  *(_OWORD *)(v2 + 30) = *(_OWORD *)&v111[14];
  *(_DWORD *)(v2 + 46) = *(_DWORD *)&v111[30];
  return v45 & 1;
}

    __break(0x5519u);
    goto LABEL_187;
  }

uint64_t iAP2LinkGetBuffSize(unsigned int a1)
{
  unsigned __int8 v2 = a1 + 2;
  int v3 = iAP2FSMGetBuffSize();
  int BuffSize = iAP2TimeGetBuffSize(v2);
  int v5 = iAP2TimeSyncGetBuffSize();
  int v6 = iAP2BuffPoolGetBuffSize(0);
  if (a1 >= 0x81) {
    iAP2LinkGetBuffSize_cold_1();
  }
  int v7 = v3 + BuffSize + v5 + v6 + iAP2BuffPoolGetBuffSize(1u);
  int v8 = iAP2BuffPoolGetBuffSize(2u);
  int v9 = v7 + v8 + iAP2ListArrayGetBuffSize(a1, 8);
  LODWORD(v10) = v9 + iAP2ListArrayGetBuffSize(a1, 8) + 616;
  int v11 = 5;
  do
  {
    uint64_t v10 = iAP2ListArrayGetBuffSize(255, 8) + v10;
    --v11;
  }

  while (v11);
  return v10;
}

BOOL iAP2LinkGetChecksumType(uint64_t a1)
{
  return *(_BYTE *)(a1 + 213) == 2;
}

char *iAP2LinkCreate( int a1, uint64_t a2, unsigned int a3, __int128 *a4, int a5, unsigned int a6, __int16 a7, char *a8)
{
  if (!a8) {
    iAP2LinkCreate_cold_1();
  }
  bzero(a8, 0x268uLL);
  *(void *)a8 = a8;
  if (!a5
    || (IsValidSynParam = iAP2LinkIsValidSynParam((unsigned __int8 *)a4, a3, 0LL, 0LL), BOOL result = 0LL, IsValidSynParam))
  {
    unsigned int v18 = a8 + 616;
    if (a1)
    {
      if (a1 != 1) {
        return 0LL;
      }
      unsigned __int8 v19 = a6 + 2;
      *((void *)a8 + 1) = iAP2FSMCreate( 8,  0,  29,  (uint64_t)&iAP2LinkDeviceStates,  (uint64_t)a8,  (uint64_t)"DeviceFSM",  0LL,  0LL,  (uint64_t)(a8 + 616));
      v18 += iAP2FSMGetBuffSize();
    }

    else
    {
      unsigned __int8 v19 = 0;
    }

    *((_DWORD *)a8 + 46) = a1;
    *((void *)a8 + 22) = a2;
    *((_WORD *)a8 + 96) = a7;
    if (a5) {
      char v20 = 64;
    }
    else {
      char v20 = 0;
    }
    a8[212] = a8[212] & 0xBF | v20;
    a8[194] = -1;
    a8[213] = 1;
    a8[215] = a3;
    *((void *)a8 + 25) = iAP2TimeCreate( (uint64_t)a8,  (uint64_t)_iAP2LinkHandleTimerExpire,  (uint64_t)_iAP2LinkHandleTimerCancel,  v19,  (uint64_t)v18);
    uint64_t v21 = (uint64_t)&v18[iAP2TimeGetBuffSize(v19)];
    iAP2ListArrayInit(v21, a6, 8u);
    *((void *)a8 + 36) = v21;
    uint64_t v22 = v21 + iAP2ListArrayGetBuffSize(a6, 8);
    iAP2ListArrayInit(v22, a6, 8u);
    *((void *)a8 + 37) = v22;
    uint64_t v23 = v22 + iAP2ListArrayGetBuffSize(a6, 8);
    for (uint64_t i = 304LL; i != 344; i += 8LL)
    {
      iAP2ListArrayInit(v23, 255, 8u);
      *(void *)&a8[i] = v23;
      v23 += iAP2ListArrayGetBuffSize(255, 8);
    }

    *((void *)a8 + 44) = a4;
    __int128 v25 = *a4;
    __int128 v26 = a4[1];
    __int128 v27 = a4[2];
    *((_WORD *)a8 + 204) = *((_WORD *)a4 + 24);
    *(_OWORD *)(a8 + 376) = v26;
    *(_OWORD *)(a8 + 392) = v27;
    *(_OWORD *)(a8 + 360) = v25;
    *(_DWORD *)(a8 + 414) = 65601535;
    *((_WORD *)a8 + 209) = 10;
    *(_DWORD *)(a8 + 410) = 1966337;
    *((_DWORD *)a8 + 105) = -65280;
    *((void *)a8 + 30) = iAP2BuffPoolInit(2u, (uint64_t)a8, 0xFFFF, a6, v23);
    uint64_t v28 = v23 + iAP2BuffPoolGetBuffSize(2u);
    if (a6 <= 0x80) {
      LOWORD(a6) = 128;
    }
    *((void *)a8 + 31) = iAP2BuffPoolInit(1u, (uint64_t)a8, *((unsigned __int16 *)a8 + 96), a6, v28);
    uint64_t v29 = v28 + iAP2BuffPoolGetBuffSize(1u);
    *((void *)a8 + 32) = iAP2BuffPoolInit(0, (uint64_t)a8, 0, 0, v29);
    unsigned int BuffSize = iAP2BuffPoolGetBuffSize(0);
    *((void *)a8 + 33) = iAP2TimeSyncInit(v29 + BuffSize);
    iAP2TimeSyncGetBuffSize();
    return a8;
  }

  return result;
}

void _iAP2LinkHandleTimerExpire(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    uint64_t Context = iAP2TimeGetContext(a1);
    if (Context)
    {
      if ((*(_BYTE *)(Context + 212) & 0x10) != 0) {
        iAP2LinkRunLoopTimeout(*(void *)(Context + 176), a2, a3);
      }
      else {
        iAP2FSMHandleEvent(*(uint64_t **)(Context + 8), a3);
      }
    }
  }

unsigned int *_iAP2LinkHandleTimerCancel(unsigned int *result, char a2)
{
  if (result)
  {
    *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v9 = v3;
    __int128 v10 = v3;
    v8[1] = v3;
    v8[2] = v3;
    v8[0] = v3;
    uint64_t Context = iAP2TimeGetContext((uint64_t)result);
    BYTE11(v9) = a2;
    int v11 = v8;
    unsigned int Item = iAP2ListArrayFindItem( *(_BYTE **)(Context + 296),  (uint64_t)&v11,  (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t))_ComparePckTimerIdCB);
    int v6 = (unsigned int **)iAP2ListArrayItemForIndex(*(void *)(Context + 296), Item);
    if (v6)
    {
      BOOL result = *v6;
      if (result) {
        return iAP2PacketRemoveTimer(result);
      }
    }

    int v11 = v8;
    unsigned int v7 = iAP2ListArrayFindItem( *(_BYTE **)(Context + 288),  (uint64_t)&v11,  (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t))_ComparePckTimerIdCB);
    BOOL result = (unsigned int *)iAP2ListArrayItemForIndex(*(void *)(Context + 288), v7);
    if (result)
    {
      BOOL result = *(unsigned int **)result;
      if (result) {
        return iAP2PacketRemoveTimer(result);
      }
    }
  }

  return result;
}

uint64_t iAP2LinkGetNewSeqNum(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 212) & 4) != 0)
  {
    char v2 = *(_BYTE *)(a1 + 190) + 71;
    LOBYTE(result) = v2 & iAP2TimeGetCurTimeMs();
  }

  else
  {
    LOBYTE(result) = iAP2TimeGetCurTimeMs();
  }

  return result;
}

void iAP2LinkResetSend(uint64_t a1)
{
  if (a1)
  {
    _CleanupSendPckList(a1);
    for (uint64_t i = 304LL; i != 344; i += 8LL)
      iAP2ListArrayCleanup(*(_BYTE **)(a1 + i), (void (*)(unsigned __int8 *))_DeletePckCB);
    *(_DWORD *)(a1 + 414) = 65601535;
    *(_WORD *)(a1 + 418) = 10;
    *(_DWORD *)(a1 + 410) = 1966337;
    *(_DWORD *)(a1 + 420) = -65280;
    iAP2LinkResetSeqAck(a1, 1, 0);
  }

  else if ((_iAP2LogEnableMask & 1) != 0)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 20;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      __int128 v4 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      __int128 v4 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      int v6 = "iAP2LinkResetSend";
      __int16 v7 = 1024;
      int v8 = 3321;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d NULL link!",  (uint8_t *)&v5,  0x12u);
    }
  }

_BYTE *_CleanupSendPckList(uint64_t a1)
{
  if ((_iAP2LogEnableMask & 2) != 0)
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 20;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      BOOL v3 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v3 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      int v6 = "_CleanupSendPckList";
      __int16 v7 = 1024;
      int v8 = 1081;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d ", (uint8_t *)&v5, 0x12u);
    }
  }

  return iAP2ListArrayCleanup(*(_BYTE **)(a1 + 296), (void (*)(unsigned __int8 *))_DeletePckCB);
}

uint64_t iAP2LinkResetSeqAck(uint64_t a1, char a2, int a3)
{
  *(_WORD *)(a1 + 190) = 0;
  *(_BYTE *)(a1 + 212) &= 0xF3u;
  iAP2TimeSyncCleanup(*(void *)(a1 + 264));
  uint64_t result = iAP2TimeSyncInit(*(void *)(a1 + 264));
  *(void *)(a1 + 264) = result;
  if (a3)
  {
    *(void *)(a1 + 464) = 0LL;
    *(_DWORD *)(a1 + 472) = 0;
    *(_WORD *)(a1 + 213) = 1;
    *(void *)(a1 + 492) = 0LL;
  }

  if ((a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)iAP2ListArrayCleanup(*(_BYTE **)(a1 + 288), (void (*)(unsigned __int8 *))_DeletePckCB);
    *(_WORD *)(a1 + 188) = 0;
    *(_BYTE *)(a1 + 212) &= 0xFCu;
    if (a3)
    {
      *(_DWORD *)(a1 + 460) = 0;
      *(void *)(a1 + 476) = 0LL;
    }
  }

  return result;
}

void iAP2LinkShuttingDown(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 200);
    if (v2)
    {
      iAP2TimeDelete(v2);
      *(void *)(a1 + 200) = 0LL;
    }
  }

void iAP2LinkDelete(uint64_t a1)
{
  if ((_iAP2LogEnableMask & 2) != 0)
  {
    if (gLogObjects) {
      BOOL v2 = gNumLogObjects < 20;
    }
    else {
      BOOL v2 = 1;
    }
    if (v2)
    {
      BOOL v3 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      BOOL v3 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      __int128 v4 = "No";
      int v12 = "iAP2LinkDelete";
      int v11 = 136315650;
      if (!a1) {
        __int128 v4 = "Yes";
      }
      __int16 v13 = 1024;
      int v14 = 3373;
      __int16 v15 = 2080;
      int v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d link null?: %s", (uint8_t *)&v11, 0x1Cu);
    }
  }

  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5)
    {
      platform_sleepAssertion_createForApplePencil(v5);
      *(void *)(a1 + 8) = 0LL;
    }

    int v6 = *(uint64_t **)(a1 + 280);
    if (v6)
    {
      iAP2PacketRelease(v6);
      *(void *)(a1 + 280) = 0LL;
    }

    iAP2ListArrayCleanup(*(_BYTE **)(a1 + 288), (void (*)(unsigned __int8 *))_DeletePckCB);
    iAP2LinkResetSend(a1);
    uint64_t v7 = *(void *)(a1 + 200);
    if (v7)
    {
      iAP2TimeDelete(v7);
      *(void *)(a1 + 200) = 0LL;
    }

    iAP2BuffPoolCleanup(*(unsigned __int8 **)(a1 + 240));
    *(void *)(a1 + 240) = 0LL;
    iAP2BuffPoolCleanup(*(unsigned __int8 **)(a1 + 248));
    *(void *)(a1 + 248) = 0LL;
    iAP2BuffPoolCleanup(*(unsigned __int8 **)(a1 + 256));
    *(void *)(a1 + 256) = 0LL;
    uint64_t v8 = *(void *)(a1 + 264);
    if (v8)
    {
      iAP2TimeSyncCleanup(v8);
      *(void *)(a1 + 264) = 0LL;
    }
  }

  else if ((_iAP2LogEnableMask & 1) != 0)
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 20;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      __int128 v10 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      __int128 v10 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      int v12 = "iAP2LinkDelete";
      __int16 v13 = 1024;
      int v14 = 3419;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d NULL link!",  (uint8_t *)&v11,  0x12u);
    }
  }

uint64_t iAP2LinkCurPckHdrSize(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 213) == 2) {
    return 10LL;
  }
  else {
    return 9LL;
  }
}

uint64_t iAP2LinkCurPckChksumSize(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 213) == 2) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

uint64_t iAP2LinkGetMaxPayloadSize(uint64_t result, uint64_t a2)
{
  if (result)
  {
    unsigned int v2 = *(unsigned __int16 *)(result + 422);
    if (a2 && *(_DWORD *)(a2 + 40) < v2) {
      unsigned int v2 = *(_DWORD *)(a2 + 40);
    }
    if (*(_BYTE *)(result + 213) == 2) {
      int v3 = -12;
    }
    else {
      int v3 = -10;
    }
    return v3 + v2;
  }

  return result;
}

uint64_t iAP2LinkGetMaxSendPacketSize(uint64_t result)
{
  if (result)
  {
    else {
      return *(unsigned __int16 *)(result + 422);
    }
  }

  return result;
}

uint64_t iAP2LinkGetMaxRecvPayloadSize(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2) {
      int v2 = *(_DWORD *)(a2 + 40);
    }
    else {
      int v2 = 0xFFFF;
    }
    if (*(_BYTE *)(result + 213) == 2) {
      int v3 = -12;
    }
    else {
      int v3 = -10;
    }
    return (v3 + v2);
  }

  return result;
}

uint64_t iAP2LinkGetMaxRecvPacketSize(uint64_t a1)
{
  if (a1) {
    return 0xFFFFLL;
  }
  else {
    return 0LL;
  }
}

void iAP2LinkStart(uint64_t a1)
{
}

uint64_t iAP2LinkProcessSendBuff(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (iAP2ListArrayGetCount(*(unsigned __int8 **)(result + 304)))
    {
LABEL_3:
      uint64_t result = iAP2LinkSendWindowAvailable(v1);
      if ((_DWORD)result)
      {
        iAP2FSMHandleEvent(*(uint64_t **)(v1 + 8), 0x12u);
        return 1LL;
      }
    }

    else
    {
      uint64_t v2 = 0LL;
      while (v2 != 4)
      {
        if (iAP2ListArrayGetCount(*(unsigned __int8 **)(v1 + 312 + 8 * v2++)))
        {
          return 0LL;
        }
      }

      return 0LL;
    }
  }

  return result;
}

BOOL iAP2LinkSendWindowAvailable(uint64_t a1)
{
  return iAP2LinkIsNoRetransmit(a1 + 410)
      || (~*(unsigned __int8 *)(a1 + 212) & 6) != 0
      || iAP2PacketCalcSeqGap(*(_BYTE *)(a1 + 189), *(_BYTE *)(a1 + 190)) < *(unsigned __int8 *)(a1 + 421);
}

void iAP2LinkAttached(uint64_t a1)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 414) = 65601535;
    *(_WORD *)(a1 + 418) = 10;
    *(_DWORD *)(a1 + 410) = 1966337;
    *(_DWORD *)(a1 + 420) = -65280;
    iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), 1u);
  }

void iAP2LinkRenegotiate(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(a1 + 352) = a2;
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)(a1 + 212) = *(_BYTE *)(a1 + 212) & 0xBF | v3;
  int v4 = *(_DWORD *)(a1 + 184);
  if (v4)
  {
    if (v4 == 1) {
      iAP2LinkSendRST(a1);
    }
  }

  else
  {
    iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), 8u);
  }

uint64_t *iAP2LinkSendRST(uint64_t a1)
{
  *(_DWORD *)(a1 + 414) = 65601535;
  *(_WORD *)(a1 + 418) = 10;
  *(_DWORD *)(a1 + 410) = 1966337;
  *(_DWORD *)(a1 + 420) = -65280;
  uint64_t v2 = *(__int128 **)(a1 + 352);
  __int128 v4 = v2[1];
  __int128 v3 = v2[2];
  __int128 v5 = *v2;
  *(_WORD *)(a1 + 408) = *((_WORD *)v2 + 24);
  *(_OWORD *)(a1 + 376) = v4;
  *(_OWORD *)(a1 + 392) = v3;
  *(_OWORD *)(a1 + 360) = v5;
  RSTPacket = (uint64_t *)iAP2PacketCreateRSTPacket(a1, *(_BYTE *)(a1 + 190));
  _iAP2LinkSendPacketCommon(a1, (uint64_t)RSTPacket, 0, 0);
  return iAP2PacketRelease(RSTPacket);
}

double iAP2LinkDetached(uint64_t a1)
{
  if (a1)
  {
    iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), 0xEu);
    *(_DWORD *)(a1 + 414) = 65601535;
    *(_WORD *)(a1 + 418) = 10;
    *(void *)&double result = 1966337LL;
    *(_DWORD *)(a1 + 410) = 1966337;
    *(_DWORD *)(a1 + 420) = -65280;
  }

  return result;
}

unsigned __int8 *iAP2LinkGetSessSendPckListCount(uint64_t a1, unsigned int a2)
{
  return iAP2ListArrayGetCount(*(unsigned __int8 **)(a1 + 8LL * a2 + 304));
}

BOOL iAP2LinkIsUnreliableSession(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(unsigned __int8 *)(a1 + 420);
  if (!*(_BYTE *)(a1 + 420)) {
    return 0LL;
  }
  __int128 v3 = 0LL;
  __int128 v4 = (unsigned __int8 *)(a1 + 440);
  __int128 v5 = (unsigned __int8 *)(a1 + 440);
  do
  {
    int v6 = *v5;
    v5 += 4;
    if (v6 == a2) {
      __int128 v3 = v4;
    }
    __int128 v4 = v5;
    --v2;
  }

  while (v2);
  return v3 && v3[3];
}

uint64_t iAP2LinkQueueSendDataPacketInternal( uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t), int a7)
{
  if (!a1 || !iAP2PacketIsDataPacket(a2))
  {
    if ((_iAP2LogEnableMask & 1) == 0) {
      goto LABEL_32;
    }
    if (!gLogObjects || gNumLogObjects < 20)
    {
      __int128 v25 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      __int128 v25 = *(os_log_s **)(gLogObjects + 152);
    }

    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)unsigned int v33 = 136315906;
    *(void *)&v33[4] = "iAP2LinkQueueSendDataPacketInternal";
    __int16 v34 = 1024;
    int v35 = 4136;
    __int16 v36 = 1024;
    unsigned int v37 = (unsigned __int16)a1;
    __int16 v38 = 1024;
    int v39 = (unsigned __int16)a2;
    __int128 v26 = "ERROR: %s:%d NULL link(%hx) or invalid packet (%hx)!";
    __int128 v27 = v25;
    uint32_t v28 = 30;
    goto LABEL_31;
  }

  uint64_t v14 = *(unsigned __int8 *)(a1 + 420);
  if (!*(_BYTE *)(a1 + 420)) {
    goto LABEL_46;
  }
  __int16 v15 = 0LL;
  int v16 = (unsigned __int8 *)(a1 + 440);
  int v17 = (unsigned __int8 *)(a1 + 440);
  do
  {
    int v18 = *v17;
    v17 += 4;
    if (v18 == a3) {
      __int16 v15 = v16;
    }
    int v16 = v17;
    --v14;
  }

  while (v14);
  if (!v15)
  {
LABEL_46:
    if ((_iAP2LogEnableMask & 1) == 0) {
      goto LABEL_32;
    }
    if (!gLogObjects || gNumLogObjects < 20)
    {
      uint64_t v29 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      uint64_t v29 = *(os_log_s **)(gLogObjects + 152);
    }

    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)unsigned int v33 = 136315650;
    *(void *)&v33[4] = "iAP2LinkQueueSendDataPacketInternal";
    __int16 v34 = 1024;
    int v35 = 4130;
    __int16 v36 = 1024;
    unsigned int v37 = a3;
    __int128 v26 = "ERROR: %s:%d Invalid session(%u)!";
    __int128 v27 = v29;
    uint32_t v28 = 24;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, v33, v28);
LABEL_32:
    if (a6) {
      a6(a1, a4);
    }
    return 0LL;
  }

  *(_BYTE *)(*(void *)(a2 + 64) + 7LL) = a3;
  *(void *)(a2 + 8) = a4;
  iAP2PacketSetCallbacks(a2, a5, (uint64_t)a6, a7);
  uint64_t v19 = v15[1];
  *(void *)unsigned int v33 = a2;
  char v20 = *(unsigned __int8 **)(a1 + 8 * v19 + 304);
  unsigned int LastItemIndex = iAP2ListArrayGetLastItemIndex((uint64_t)v20);
  if ((_iAP2LogEnableMask & 1) == 0) {
    return 0LL;
  }
  if (gLogObjects && gNumLogObjects >= 20)
  {
    int v30 = *(os_log_s **)(gLogObjects + 152);
  }

  else
  {
    int v30 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v31)
  {
    unsigned int Count = iAP2ListArrayGetCount(*(unsigned __int8 **)(a1 + 8LL * v15[1] + 304));
    *(_DWORD *)unsigned int v33 = 136315906;
    *(void *)&v33[4] = "iAP2LinkQueueSendDataPacketInternal";
    __int16 v34 = 1024;
    int v35 = 4125;
    __int16 v36 = 1024;
    unsigned int v37 = Count;
    __int16 v38 = 1024;
    int v39 = (unsigned __int16)a2;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d Could not queue packet to session send list! listCount=%u packet=%hx",  v33,  0x1Eu);
    return 0LL;
  }

  return result;
}

BOOL iAP2LinkQueueSendData( uint64_t a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t), unsigned __int8 a8)
{
  return iAP2LinkQueueSendDataWithSentCallback(a1, a2, a3, a4, a5, 0LL, a6, a7, a8);
}

BOOL iAP2LinkQueueSendDataWithSentCallback( uint64_t a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t, uint64_t), unsigned __int8 a9)
{
  unsigned int v10 = a3;
  int v11 = a2;
  if (a1 && a2 && a3)
  {
    if (!*(_BYTE *)(a1 + 420)) {
      goto LABEL_29;
    }
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = a1 + 440;
    do
    {
      v15 += 4LL;
    }

    while (4LL * *(unsigned __int8 *)(a1 + 420) != v15);
    if (!v16)
    {
LABEL_29:
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects) {
          BOOL v24 = gNumLogObjects < 20;
        }
        else {
          BOOL v24 = 1;
        }
        if (v24)
        {
          uint32_t v28 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        else
        {
          uint32_t v28 = *(os_log_s **)(gLogObjects + 152);
        }

        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          unsigned int v56 = "iAP2LinkQueueSendDataWithSentCallback";
          __int16 v57 = 1024;
          int v58 = 4410;
          __int16 v59 = 1024;
          unsigned int v60 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d ERROR: Invalid session(%u)!",  buf,  0x18u);
        }
      }

      int v29 = 0;
      int v30 = 1;
LABEL_75:
      BOOL v27 = v30 != 0;
      BOOL v26 = v29 != 0;
      if (!a8) {
        return v26;
      }
      goto LABEL_76;
    }

    unsigned int v18 = *(unsigned __int16 *)(a1 + 422);
    if (*(_BYTE *)(a1 + 213) == 2) {
      int v19 = -12;
    }
    else {
      int v19 = -10;
    }
    unsigned int v20 = v19 + v18;
    unsigned int v21 = a3;
    if (v19 + v18 <= a3)
    {
      if ((int)((a3 + v20 - 1) / v20) > (int)iAP2ListArrayGetAvailSpace(*(_BYTE **)(a1
                                                                                   + 8LL * *(unsigned __int8 *)(v16 + 1)
                                                                                   + 304)))
      {
        if ((_iAP2LogEnableMask & 1) != 0)
        {
          if (gLogObjects && gNumLogObjects >= 20)
          {
            uint64_t v22 = *(os_log_s **)(gLogObjects + 152);
          }

          else
          {
            uint64_t v22 = (os_log_s *)&_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              platform_connectionInfo_configStreamCategoryListReady_cold_1();
            }
          }

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int Count = iAP2ListArrayGetCount(*(unsigned __int8 **)(a1
            *(_DWORD *)buf = 136316930;
            unsigned int v56 = "iAP2LinkQueueSendDataWithSentCallback";
            __int16 v57 = 1024;
            int v58 = 4337;
            __int16 v59 = 1024;
            unsigned int v60 = Count;
            __int16 v61 = 1024;
            int v62 = (unsigned __int16)v11;
            __int16 v63 = 1024;
            unsigned int v64 = v10;
            __int16 v65 = 1024;
            int v66 = (unsigned __int16)v11;
            __int16 v67 = 1024;
            unsigned int v68 = v20;
            __int16 v69 = 1024;
            unsigned int v70 = a4;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d No space in session send queue! listCount=%u payload=%hx payloadLen=%u data=%hx dataLen=%u session=%u",  buf,  0x36u);
          }
        }

        int v29 = 0;
        int v30 = 1;
LABEL_74:
        iAP2LinkSignalSendBuffCB(a1);
        goto LABEL_75;
      }

      unsigned int v21 = v20;
    }

    uint64_t ACKPacket = iAP2PacketCreateACKPacket(a1, *(_BYTE *)(a1 + 190), *(_BYTE *)(a1 + 188), v11, v21, a4);
    unsigned int v53 = v10;
    unsigned __int16 v49 = (unsigned __int16)v11;
    if (ACKPacket)
    {
      int v32 = (uint64_t *)ACKPacket;
      uint64_t v50 = a7;
      BOOL v51 = a8;
      unsigned int v33 = 0;
      unsigned int v34 = v21;
      while (1)
      {
        unsigned int v35 = v34;
        unsigned int v34 = v21;
        if (v10 <= v35)
        {
          if (a6) {
            iAP2PacketSetCallbackOnSentToTransport((uint64_t)v32, a6);
          }
          uint64_t v36 = a1;
          uint64_t v37 = (uint64_t)v32;
          unsigned int v38 = a4;
          uint64_t v39 = a5;
          uint64_t v40 = v50;
          int v41 = v51;
          int v42 = a9;
        }

        else
        {
          uint64_t v36 = a1;
          uint64_t v37 = (uint64_t)v32;
          unsigned int v38 = a4;
          uint64_t v39 = a5;
          uint64_t v40 = 0LL;
          int v41 = 0LL;
          int v42 = 0;
        }

        int v29 = iAP2LinkQueueSendDataPacketInternal(v36, v37, v38, v39, v40, v41, v42);
        iAP2PacketRelease(v32);
        if (!v29) {
          break;
        }
        v33 += v21;
        unsigned int v10 = v53 - v33;
        if (v53 <= v33) {
          break;
        }
        v11 += v21;
        if (v21 >= v10) {
          unsigned int v21 = v53 - v33;
        }
        int v32 = (uint64_t *)iAP2PacketCreateACKPacket(a1, *(_BYTE *)(a1 + 190), *(_BYTE *)(a1 + 188), v11, v21, a4);
        if (!v32)
        {
          int v30 = 0;
          a8 = v51;
          goto LABEL_59;
        }
      }

      int v30 = 0;
      a8 = v51;
    }

    else
    {
      int v30 = 1;
LABEL_59:
      if ((_iAP2LogEnableMask & 1) != 0)
      {
        uint64_t v43 = gLogObjects;
        int v44 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 20)
        {
          uint64_t v45 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          uint64_t v45 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            unsigned int v56 = (const char *)v43;
            __int16 v57 = 1024;
            int v58 = v44;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
          }
        }

        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v46 = iAP2ListArrayGetCount(*(unsigned __int8 **)(a1 + 8LL * *(unsigned __int8 *)(v16 + 1) + 304));
          *(_DWORD *)buf = 136316930;
          unsigned int v56 = "iAP2LinkQueueSendDataWithSentCallback";
          __int16 v57 = 1024;
          int v58 = 4399;
          __int16 v59 = 1024;
          unsigned int v60 = v46;
          __int16 v61 = 1024;
          int v62 = v49;
          __int16 v63 = 1024;
          unsigned int v64 = v53;
          __int16 v65 = 1024;
          int v66 = (unsigned __int16)v11;
          __int16 v67 = 1024;
          unsigned int v68 = v21;
          __int16 v69 = 1024;
          unsigned int v70 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d ERROR: Ran out of Send Packets! listCount=%u payload=%hx payloadLen=%u data=%hx dataLen=%u session=%u",  buf,  0x36u);
        }
      }

      int v29 = 0;
    }

    goto LABEL_74;
  }

  if ((_iAP2LogEnableMask & 1) != 0)
  {
    if (gLogObjects) {
      BOOL v23 = gNumLogObjects < 20;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23)
    {
      __int128 v25 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    else
    {
      __int128 v25 = *(os_log_s **)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      unsigned int v56 = "iAP2LinkQueueSendDataWithSentCallback";
      __int16 v57 = 1024;
      int v58 = 4416;
      __int16 v59 = 1024;
      unsigned int v60 = (unsigned __int16)a1;
      __int16 v61 = 1024;
      int v62 = (unsigned __int16)v11;
      __int16 v63 = 1024;
      unsigned int v64 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d NULL link(%hx) or payload(%hx) or no payload (len=%u)!",  buf,  0x24u);
    }
  }

  BOOL v26 = 0LL;
  BOOL v27 = 1;
  if (a8)
  {
LABEL_76:
    if (v27) {
      a8(a1, a5);
    }
  }

  return v26;
}

uint64_t iAP2LinkQueueSendDataPacket( uint64_t a1, uint64_t *a2, unsigned int a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t), int a7)
{
  uint64_t v14 = iAP2LinkQueueSendDataPacketInternal(a1, (uint64_t)a2, a3, a4, a5, a6, a7);
  if ((_DWORD)v14) {
    iAP2LinkSignalSendBuffCB(a1);
  }
  iAP2PacketRelease(a2);
  return v14;
}

void iAP2LinkHandleReadyPacket(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 61);
  if (v3 >= 0x13)
  {
    iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), (v3 + 4));
    return;
  }

  __int128 v5 = *(_BYTE **)(a2 + 64);
  if (*(unsigned __int16 *)(a2 + 54) > *(unsigned __int16 *)(a1 + 414))
  {
    if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (!gLogObjects || gNumLogObjects < 20)
      {
        __int16 v13 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      else
      {
        __int16 v13 = *(os_log_s **)(gLogObjects + 152);
      }

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = v5[5];
        int v15 = *(unsigned __int16 *)(a2 + 54);
        int v16 = *(unsigned __int16 *)(a1 + 414);
        *(_DWORD *)buf = 67109632;
        int v34 = v14;
        __int16 v35 = 1024;
        int v36 = v15;
        __int16 v37 = 1024;
        int v38 = v16;
        uint64_t v17 = "ERROR: Packet 0x%x has length = %d bytes > maxPacketLength (%d bytes)";
        unsigned int v18 = v13;
        uint32_t v19 = 20;
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        return;
      }
    }

    return;
  }

  if (*(_BYTE *)(*(void *)(a1 + 8) + 10LL) != 6)
  {
    ++*(_DWORD *)(a1 + 528);
    iAP2PacketRetain(a2);
    uint64_t v8 = *(uint64_t **)(a1 + 280);
    if (v8) {
      iAP2PacketRelease(v8);
    }
    *(void *)(a1 + 280) = a2;
    int v9 = *(unsigned __int8 *)(a1 + 188);
    int v10 = v5[5];
    unsigned int v11 = iAP2PacketCalcSeqGap(*(_BYTE *)(a1 + 188), v5[5]);
    if ((*(_BYTE *)(a1 + 212) & 4) != 0 && (v5[4] & 0x40) != 0) {
      unsigned int v12 = iAP2PacketCalcSeqGap(v5[6], *(_BYTE *)(a1 + 190));
    }
    else {
      unsigned int v12 = 0;
    }
    if (!iAP2LinkIsNoRetransmit(a1 + 410) && v12 > *(unsigned __int8 *)(a1 + 421))
    {
      iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), 0x13u);
LABEL_48:
      ++*(_DWORD *)(a1 + 556);
LABEL_49:
      __int128 v25 = *(uint64_t **)(a1 + 280);
      if (v25) {
        iAP2PacketRelease(v25);
      }
      *(void *)(a1 + 280) = 0LL;
      buf[0] = -86;
      unint64_t RecvPckFirstItem = _GetRecvPckFirstItem(a1, buf);
      if (RecvPckFirstItem)
      {
        BOOL v27 = (uint64_t *)RecvPckFirstItem;
        uint8_t v28 = buf[0];
        do
        {
          char v32 = -86;
          unint64_t RecvPckNextItem = _GetRecvPckNextItem(a1, v28, &v32);
          if ((*(_BYTE *)(a1 + 212) & 1) != 0
            && (unint64_t v30 = RecvPckNextItem,
                unsigned int v31 = iAP2PacketCalcSeqGap(*(_BYTE *)(a1 + 188), *(_BYTE *)(v27[8] + 5)),
                (*(_BYTE *)(a1 + 212) & 1) != 0)
            && v31 != 1)
          {
            if (v31 > *(unsigned __int8 *)(a1 + 411)) {
              iAP2ListArrayDeleteItem( *(_BYTE **)(a1 + 288),  v28,  (uint64_t (*)(unsigned __int8 *))_DeletePckCB);
            }
          }

          else
          {
            iAP2PacketRetain((uint64_t)v27);
            iAP2ListArrayDeleteItem(*(_BYTE **)(a1 + 288), v28, (uint64_t (*)(unsigned __int8 *))_DeletePckCB);
            if (*(void *)(a1 + 280)) {
              iAP2LinkHandleReadyPacket_cold_3();
            }
            *(void *)(a1 + 280) = v27;
            iAP2LinkProcessInOrderPacket(a1, (uint64_t)v27);
            *(void *)(a1 + 280) = 0LL;
            iAP2PacketRelease(v27);
            unint64_t v30 = _GetRecvPckFirstItem(a1, &v32);
          }

          uint8_t v28 = v32;
          BOOL v27 = (uint64_t *)v30;
        }

        while (v30);
      }

      return;
    }

    if ((v5[4] & 4) == 0)
    {
      if ((v5[4] & 0x80) != 0 || (*(_BYTE *)(a1 + 212) & 1) == 0 || v11 == 1)
      {
        if ((v5[4] & 0xC0) != 0x80)
        {
          _AddRecvPckItem(a1, a2);
LABEL_63:
          BOOL IsACKOnly = 0;
          goto LABEL_42;
        }
      }

      else
      {
        if ((iAP2PacketIsEAK(a2) & 1) == 0
          && !iAP2PacketIsACKOnly(a2)
          && !iAP2LinkIsUnreliableSession(a1, *(unsigned __int8 *)(*(void *)(a2 + 64) + 7LL)))
        {
          if (!v11)
          {
LABEL_70:
            if (v9 != v10 || iAP2PacketIsACKOnly(a2) || iAP2LinkIsNoRetransmit(a1 + 410)) {
              goto LABEL_48;
            }
            iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), 0x10u);
            goto LABEL_63;
          }

uint64_t _AddRecvPckItem(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(unsigned __int8 **)(a1 + 288);
  unsigned int LastItemIndex = iAP2ListArrayGetLastItemIndex((uint64_t)v2);
  return iAP2LinkAddPacketAfter(v2, LastItemIndex, &v5);
}

void *_IsReceivedPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a2;
  unsigned int Item = iAP2ListArrayFindItem( *(_BYTE **)(a1 + 288),  (uint64_t)&v6,  (uint64_t (*)(unsigned __int8 *, uint64_t, uint64_t))_iAP2LinkComparePacketSeq);
  uint64_t result = (void *)iAP2ListArrayItemForIndex(*(void *)(a1 + 288), Item);
  if (result) {
    return (void *)(*result != 0LL);
  }
  return result;
}

uint64_t _CleanupAckedPackets(uint64_t a1)
{
  char v13 = -86;
  uint64_t result = _GetSendPckFirstItem(a1, &v13);
  if (result)
  {
    SendPckNextunsigned int Item = result;
    char v4 = 0;
    unsigned __int8 v5 = v13;
LABEL_3:
    unint64_t v6 = SendPckNextItem;
    do
    {
      char v12 = -86;
      SendPckNextunsigned int Item = _GetSendPckNextItem(a1, v5, &v12);
      uint64_t v7 = *(void *)(v6 + 64);
      if (*(char *)(v7 + 4) < 0)
      {
        unsigned int v9 = iAP2PacketCalcSeqGap(*(_BYTE *)(v7 + 5), *(_BYTE *)(a1 + 190));
        unsigned int v8 = *(unsigned __int8 *)(a1 + 421);
        if (v9 > v8) {
          goto LABEL_10;
        }
      }

      else
      {
        unsigned int v8 = *(unsigned __int8 *)(a1 + 421);
      }

      uint64_t result = iAP2PacketIsSeqACKd(*(_BYTE *)(v7 + 5), *(_BYTE *)(a1 + 189), v8);
      if ((result & 1) != 0)
      {
LABEL_10:
        int CurTimeMs = iAP2TimeGetCurTimeMs();
        v11.i32[1] = 1;
        v11.i32[0] = CurTimeMs - *(_DWORD *)(v6 + 48);
        *(int32x2_t *)(a1 + 596) = vadd_s32(v11, *(int32x2_t *)(a1 + 596));
        iAP2ListArrayDeleteItem(*(_BYTE **)(a1 + 296), v5, (uint64_t (*)(unsigned __int8 *))_DeletePckCB);
        unsigned __int8 v5 = v12;
        char v4 = 1;
        if (SendPckNextItem) {
          goto LABEL_3;
        }
        return iAP2LinkSignalSendBuffCB(a1);
      }

      unsigned __int8 v5 = v12;
      unint64_t v6 = SendPckNextItem;
    }

    while (SendPckNextItem);
    if ((v4 & 1) == 0) {
      return result;
    }
    return iAP2LinkSignalSendBuffCB(a1);
  }

  return result;
}

uint64_t iAP2LinkProcessInOrderPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 64);
  int v5 = *(char *)(v4 + 4);
  if (v5 < 0)
  {
    char v17 = *(_BYTE *)(a1 + 212);
    if ((v17 & 1) != 0)
    {
      int v18 = *(unsigned __int8 *)(v4 + 5);
      else {
        unsigned __int8 v19 = 2;
      }
    }

    else
    {
      LOBYTE(v18) = *(_BYTE *)(v4 + 5);
      unsigned __int8 v19 = 2;
    }

    int v23 = *(unsigned __int8 *)(a1 + 213);
    *(_BYTE *)(a1 + 188) = v18;
    *(_BYTE *)(a1 + 212) = v17 | 1;
    char v24 = *(_BYTE *)(v4 + 4);
    unsigned int v25 = *(_DWORD *)(a1 + 460) + 1;
    *(_DWORD *)(a1 + 460) = v25;
    if ((v24 & 0x40) != 0)
    {
      ++*(_DWORD *)(a1 + 480);
      ++*(_DWORD *)(a1 + 488);
      if ((v17 & 0x20) != 0) {
        goto LABEL_33;
      }
    }

    else
    {
      ++*(_DWORD *)(a1 + 476);
      ++*(_DWORD *)(a1 + 484);
      if ((v17 & 0x20) != 0) {
        goto LABEL_33;
      }
    }

    if (v25 >= 0xB)
    {
      iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), 0x14u);
      goto LABEL_42;
    }

void iAP2LinkHandleSuspend(uint64_t a1)
{
  if ((_iAP2LogEnableMask & 4) == 0) {
    goto LABEL_10;
  }
  if (!gLogObjects || gNumLogObjects < 20)
  {
    unsigned int v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    unsigned int v3 = *(os_log_s **)(gLogObjects + 152);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    iAP2LinkHandleSuspend_cold_1();
  }

  else
  {
LABEL_10:
    if (!a1) {
      return;
    }
  }

  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    if (*(_DWORD *)(a1 + 184) == 1) {
      iAP2FSMHandleEvent(v4, 0x1Bu);
    }
  }

void iAP2LinkHandleResume(uint64_t a1)
{
  if ((_iAP2LogEnableMask & 4) == 0) {
    goto LABEL_10;
  }
  if (!gLogObjects || gNumLogObjects < 20)
  {
    unsigned int v3 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    unsigned int v3 = *(os_log_s **)(gLogObjects + 152);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    iAP2LinkHandleResume_cold_1();
  }

  else
  {
LABEL_10:
    if (!a1) {
      return;
    }
  }

  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    if (*(_DWORD *)(a1 + 184) == 1) {
      iAP2FSMHandleEvent(v4, 0x1Cu);
    }
  }

uint64_t _iAP2LinkSendPacketCommon(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a1 && a2)
  {
    unsigned int v8 = *(_BYTE **)(a2 + 64);
    ++*(_DWORD *)(a1 + 524);
    *(_DWORD *)(a1 + 516) += *(unsigned __int16 *)(a2 + 54);
    if ((v8[4] & 0x40) != 0)
    {
      int v9 = v8[6];
      int v10 = *(unsigned __int8 *)(a1 + 188);
      if (v9 != v10)
      {
        v8[6] = v10;
        LOBYTE(v9) = v10;
      }

      *(_BYTE *)(a1 + 191) = v9;
      *(_BYTE *)(a1 + 212) |= 8u;
    }

    int CurTimeMs = iAP2TimeGetCurTimeMs();
    if (a3)
    {
      v12.i32[1] = 1;
      v12.i32[0] = CurTimeMs - *(_DWORD *)(a2 + 48);
      *(int32x2_t *)(a1 + 596) = vadd_s32(v12, *(int32x2_t *)(a1 + 596));
    }

    *(_DWORD *)(a2 + 48) = CurTimeMs;
    if ((v8[4] & 0x40) != 0)
    {
      iAP2TimeCancelTimer(*(unsigned int **)(a1 + 200), *(_BYTE *)(a1 + 194));
      *(_BYTE *)(a1 + 194) = -1;
    }

    if ((a4 & 1) != 0) {
      iAP2LinkSendPacketWaitCB(a1, a2);
    }
    else {
      iAP2LinkSendPacketCB(a1, a2);
    }
    BOOL IsNoRetransmit = iAP2LinkIsNoRetransmit(a1 + 410);
    if ((a3 & 1) != 0)
    {
      if (!IsNoRetransmit)
      {
        int v15 = iAP2TimeCallbackAfter(*(void *)(a1 + 200), 12, *(unsigned __int16 *)(a1 + 416));
        iAP2PacketAssignTimer((unsigned int *)a2, v15);
      }

      return 1LL;
    }

    if (!IsNoRetransmit && iAP2PacketRequireACK((uint64_t *)a2))
    {
      *(void *)unint64_t v30 = a2;
      char v17 = *(unsigned __int8 **)(a1 + 296);
      unsigned int LastItemIndex = iAP2ListArrayGetLastItemIndex((uint64_t)v17);
      if (iAP2LinkAddPacketAfter(v17, LastItemIndex, (uint64_t *)v30) == 255)
      {
        if ((_iAP2LogEnableMask & 1) != 0)
        {
          unsigned int v22 = (os_log_s *)logObjectForModule_24();
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
          uint64_t result = 0LL;
          if (!v23) {
            goto LABEL_31;
          }
          if (*(_DWORD *)(a1 + 184)) {
            char v24 = "Device";
          }
          else {
            char v24 = "Accessory";
          }
          int v25 = v8[5];
          int v26 = v8[4];
          __int128 v27 = iAP2PacketName(a2);
          int v28 = v8[6];
          int v29 = *(unsigned __int16 *)(a2 + 54);
          *(_DWORD *)unint64_t v30 = 136317186;
          *(void *)&v30[4] = v24;
          __int16 v31 = 2080;
          *(void *)char v32 = "_iAP2LinkSendPacketCommon";
          *(_WORD *)&v32[8] = 1024;
          *(_DWORD *)int v33 = 5457;
          *(_WORD *)&v33[4] = 1024;
          int v34 = v25;
          __int16 v35 = 1024;
          int v36 = v26;
          __int16 v37 = 2080;
          int v38 = v27;
          __int16 v39 = 1024;
          int v40 = v28;
          __int16 v41 = 1024;
          int v42 = v29;
          __int16 v43 = 1024;
          int v44 = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%s:%d FAILED to add packet to sendPckList, sentSeq(%u) control=%xh(%s) ack=%u len=%u bWaitSend=%d",  v30,  0x44u);
        }

        uint64_t result = 0LL;
        goto LABEL_31;
      }

      int v19 = iAP2TimeCallbackAfter(*(void *)(a1 + 200), 12, *(unsigned __int16 *)(a1 + 416));
      iAP2PacketAssignTimer((unsigned int *)a2, v19);
    }

    uint64_t result = 1LL;
LABEL_31:
    *(_BYTE *)(a1 + 190) = v8[5];
    *(_BYTE *)(a1 + 212) |= 4u;
    return result;
  }

  if ((_iAP2LogEnableMask & 1) == 0) {
    return 0LL;
  }
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 20;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    unsigned int v20 = (os_log_s *)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
  }

  else
  {
    unsigned int v20 = *(os_log_s **)(gLogObjects + 152);
  }

  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v21)
  {
    *(_DWORD *)unint64_t v30 = 136315906;
    *(void *)&v30[4] = "_iAP2LinkSendPacketCommon";
    __int16 v31 = 1024;
    *(_DWORD *)char v32 = 5510;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = (unsigned __int16)a1;
    *(_WORD *)int v33 = 1024;
    *(_DWORD *)&v33[2] = (unsigned __int16)a2;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "ERROR: %s:%d Invalid link(%hx) or packet(%hx)",  v30,  0x1Eu);
    return 0LL;
  }

  return result;
}

uint64_t iAP2LinkSendPacketWaitSend(uint64_t a1, uint64_t a2, int a3)
{
  return _iAP2LinkSendPacketCommon(a1, a2, a3, 1);
}

uint64_t iAP2LinkAddPacketAfter(unsigned __int8 *a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v6 = iAP2ListArrayAddItemAfter(a1, a2, a3);
  if ((_DWORD)v6 == 255) {
    iAP2PacketRelease((uint64_t *)*a3);
  }
  return v6;
}

void iAP2LinkHandleTimeout(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    iAP2LinkHandleTimeout_cold_1();
  }
  iAP2FSMHandleEvent(*(uint64_t **)(a1 + 8), a3);
}

uint64_t iAP2LinkGetSessionForService(uint64_t a1, int a2)
{
  if (a1 && (uint64_t v2 = *(unsigned __int8 *)(a1 + 420), *(_BYTE *)(a1 + 420)))
  {
    unsigned __int8 v3 = 0;
    uint64_t v4 = (unsigned __int8 *)(a1 + 441);
    do
    {
      if (*v4 == a2) {
        unsigned __int8 v3 = *(v4 - 1);
      }
      v4 += 4;
      --v2;
    }

    while (v2);
  }

  else
  {
    return 0;
  }

  return v3;
}

uint64_t iAP2LinkGetMainTimer(uint64_t a1)
{
  return *(void *)(a1 + 200);
}

void iAP2LinkRegisterEventCallback(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1)
  {
    if (a2 <= 8 && a3)
    {
      uint64_t v5 = a1 + a2;
      unsigned int v8 = *(unsigned __int8 *)(v5 + 160);
      uint64_t v6 = (_BYTE *)(v5 + 160);
      uint64_t v7 = v8;
      if (v8 <= 1)
      {
        *(void *)(a1 + 16LL * a2 + 8 * v7 + 16) = a3;
        _BYTE *v6 = v7 + 1;
        return;
      }

      if ((_iAP2LogEnableMask & 1) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          int v10 = *(os_log_s **)(gLogObjects + 152);
        }

        else
        {
          int v10 = (os_log_s *)&_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
        }

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315906;
          int v15 = "iAP2LinkRegisterEventCallback";
          __int16 v16 = 1024;
          int v17 = 5970;
          __int16 v18 = 1024;
          unsigned int v19 = a2;
          __int16 v20 = 1024;
          BOOL v21 = v7;
          int32x2_t v12 = "ERROR: %s%d Too many registrations for event(%d)! current %d";
          BOOL v13 = v10;
          goto LABEL_24;
        }
      }
    }

    else if ((_iAP2LogEnableMask & 1) != 0)
    {
      if (!gLogObjects || gNumLogObjects < 20)
      {
        uint64_t v11 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
      }

      else
      {
        uint64_t v11 = *(os_log_s **)(gLogObjects + 152);
      }

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        int v15 = "iAP2LinkRegisterEventCallback";
        __int16 v16 = 1024;
        int v17 = 5975;
        __int16 v18 = 1024;
        unsigned int v19 = a2;
        __int16 v20 = 1024;
        BOOL v21 = a3 != 0;
        int32x2_t v12 = "ERROR: %s%d Unknown event(%d) or no eventCB(%d)!";
        BOOL v13 = v11;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0x1Eu);
      }
    }
  }

uint64_t iAP2LinkSetUseiAP2LinkRunLoop(uint64_t result)
{
  *(_BYTE *)(result + 212) |= 0x10u;
  return result;
}

void *iAP2LinkCheckNegotiation(uint64_t a1, unsigned __int8 *a2)
{
  if (*(_DWORD *)(a1 + 184) == 1)
  {
    if ((iAP2LinkValidateSynParam(a1, a2) & 1) == 0) {
      iAP2LinkEventNotify(a1, 3LL, (uint64_t)a2);
    }
  }

  else if ((*(_BYTE *)(a1 + 212) & 0x40) != 0)
  {
    iAP2LinkValidateSynParam(a1, a2);
    if ((*(_BYTE *)(a1 + 212) & 0x40) == 0) {
      goto LABEL_29;
    }
  }

  uint64_t v4 = (_BYTE *)(a1 + 360);
  if (iAP2LinkIsNoRetransmit(a1 + 360) && !iAP2LinkIsNoRetransmit((uint64_t)a2))
  {
    *(_WORD *)(a1 + 361) = 7681;
    *(_DWORD *)(a1 + 364) = 65601535;
    *(_WORD *)(a1 + 368) = 10;
    *(_BYTE *)(a1 + 363) = 0;
  }

  unsigned int v5 = *a2;
  if (*v4 > v5)
  {
    if ((_iAP2LogEnableMask & 2) != 0)
    {
      uint64_t v6 = gLogObjects;
      int v7 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 20)
      {
        unsigned int v8 = *(os_log_s **)(gLogObjects + 152);
      }

      else
      {
        unsigned int v8 = (os_log_s *)&_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          int v16 = 134218240;
          int v17 = (const char *)v6;
          __int16 v18 = 1024;
          int v19 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  (uint8_t *)&v16,  0x12u);
          unsigned int v5 = *a2;
        }
      }

      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = *v4;
        int v16 = 136315906;
        int v17 = "iAP2LinkCheckNegotiation";
        __int16 v18 = 1024;
        int v19 = 6390;
        __int16 v20 = 1024;
        int v21 = v9;
        __int16 v22 = 1024;
        unsigned int v23 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s:%d Older protocol Version detected on the accessory (%d->%d)",  (uint8_t *)&v16,  0x1Eu);
        LOBYTE(v5) = *a2;
      }
    }

    _BYTE *v4 = v5;
  }

  unsigned int v10 = a2[2];
  unsigned int v11 = a2[3];
  unsigned int v12 = *((unsigned __int16 *)a2 + 3);
  unsigned int v13 = *((unsigned __int16 *)a2 + 4);
LABEL_29:
  *(_BYTE *)(a1 + 371) = a2[1];
  *(_WORD *)(a1 + 372) = *((_WORD *)a2 + 2);
  if (*(_DWORD *)(a1 + 184) == 1)
  {
    *(_BYTE *)(a1 + 384) = a2[24];
    if (a2[24])
    {
      unint64_t v14 = 0LL;
      do
      {
        *(_BYTE *)(a1 + 385 + v14) = a2[v14 + 25];
        ++v14;
      }

      while (v14 < a2[24]);
    }
  }

  *(_BYTE *)(a1 + 370) = a2[10];
  return memcpy((void *)(a1 + 390), a2 + 30, 4LL * a2[10]);
}

unint64_t _GetRecvPckFirstItem(uint64_t a1, _BYTE *a2)
{
  unsigned int FirstItemIndex = iAP2ListArrayGetFirstItemIndex(*(void *)(a1 + 288));
  *a2 = FirstItemIndex;
  unint64_t result = iAP2ListArrayItemForIndex(*(void *)(a1 + 288), FirstItemIndex);
  if (result) {
    return *(void *)result;
  }
  return result;
}

unint64_t _GetRecvPckNextItem(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  unsigned int NextItemIndex = iAP2ListArrayGetNextItemIndex(*(void *)(a1 + 288), a2);
  *a3 = NextItemIndex;
  unint64_t result = iAP2ListArrayItemForIndex(*(void *)(a1 + 288), NextItemIndex);
  if (result) {
    return *(void *)result;
  }
  return result;
}

unint64_t _iAP2LinkComparePacketSeq(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unsigned __int8 v3 = *(void **)a2;
  LODWORD(result) = iAP2PacketCalcSeqGap( *(_BYTE *)(*(void *)(*a1 + 64) + 5LL),  *(_BYTE *)(*(void *)(*(void *)a2 + 64LL) + 5LL));
  if (*(void *)v2 != *v3) {
    _iAP2LinkComparePacketSeq_cold_1();
  }
  if (!(_DWORD)result) {
    return 0LL;
  }
  return result | 0xFFFFFFFFFFFFFF00LL;
}

uint64_t *_DeletePckCB(uint64_t *result)
{
  if (result)
  {
    unint64_t result = (uint64_t *)*result;
    if (result) {
      return iAP2PacketRelease(result);
    }
  }

  return result;
}

unint64_t _ComparePckTimerIdCB(uint64_t a1, uint64_t *a2, int a3)
{
  if (a3 != 8 || ((uint64_t v3 = *a2, *(void *)a1) ? (v4 = v3 == 0) : (v4 = 1), v4)) {
    _ComparePckTimerIdCB_cold_1();
  }
  return *(unsigned __int8 *)(*(void *)a1 + 59LL) - (unint64_t)*(unsigned __int8 *)(v3 + 59);
}

  ;
}

void OUTLINED_FUNCTION_12_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_15_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

  ;
}

uint64_t ccder_encode_extension( const void *a1, unint64_t a2, const void *a3, unint64_t a4, int a5, uint64_t *a6)
{
  unint64_t v12 = ccder_sizeof_extension(a2, a4, a5);
  uint64_t v13 = a6[1];
  if (v13 - *a6 < v12) {
    return 0LL;
  }
  uint64_t result = ccder_blob_encode_body_tl(a6, 4uLL, a2, a1);
  if (!(_DWORD)result) {
    return 0LL;
  }
  if (!a5) {
    goto LABEL_6;
  }
  uint64_t v15 = a6[1];
  if (v15)
  {
    a6[1] = v15 - 1;
    *(_BYTE *)(v15 - 1) = -1;
    if (ccder_blob_encode_tl(a6, 1uLL, 1uLL))
    {
LABEL_6:
    }

    return 0LL;
  }

  __break(0x5513u);
  return result;
}

uint64_t ccder_sizeof_extension(unint64_t a1, unint64_t a2, int a3)
{
  uint64_t v5 = ccder_sizeof(4LL, a1);
  uint64_t v6 = ccder_sizeof(6LL, a2);
  if (a3) {
    uint64_t result = ccder_sizeof(1LL, 1uLL);
  }
  else {
    uint64_t result = 0LL;
  }
  uint64_t v8 = result + v6;
  if (!__CFADD__(result, v6) && !__CFADD__(v8, v5)) {
    return ccder_sizeof(0x2000000000000010LL, v8 + v5);
  }
  __break(0x5500u);
  return result;
}

uint64_t CTDecompressComputeBufferSize(unint64_t a1, unint64_t a2, _BYTE *a3)
{
  return CTDecompressGeneric(a1, a2, a3, 0LL, 0LL);
}

uint64_t CTDecompressGeneric( unint64_t a1, unint64_t a2, _BYTE *a3, unint64_t a4, unint64_t a5)
{
  uint64_t v6 = 393217LL;
  if (a1 && a2)
  {
    int v92 = a3;
    int v11 = *(unsigned __int8 *)a1;
    *(void *)&__int128 v94 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v94 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v91 = ~a4;
    if (~a4 < a5) {
      goto LABEL_242;
    }
    unint64_t v12 = a4 + a5;
    if (a4 + a5 < a4) {
      goto LABEL_241;
    }
    *(void *)&__int128 v94 = a4;
    *((void *)&v94 + 1) = a4 + a5;
    if (a4) {
      uint64_t v13 = (uint64_t *)&v94;
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v93 = 0LL;
    if ((v11 - 2) >= 2 && (v11 - 162) >= 2)
    {
      int v90 = v13;
      unint64_t v20 = 0LL;
    }

    else
    {
      *(void *)int v99 = 0LL;
      *(void *)&v98[0] = 0LL;
      uint64_t Signature = CTDecompressGetSignature(v11, a1, a2, (unint64_t *)v98, (unsigned __int8 **)v99);
      if ((_DWORD)Signature) {
        return Signature;
      }
      unint64_t v15 = CTNonVariableCompressedSizeForStyle(v11);
      unint64_t v16 = a2 - v15;
      if (a2 < v15 || (unint64_t v5 = v16 - *(void *)v99, v16 < *(void *)v99))
      {
        __break(0x5515u);
        goto LABEL_205;
      }

      int v90 = v13;
      if (__CFADD__(*(void *)&v98[0], *(void *)v99)) {
        goto LABEL_242;
      }
      int v17 = (const void *)(*(void *)&v98[0] + *(void *)v99);
      if (!((uint64_t)(*(void *)&v98[0] + *(void *)v99 - a1) >= 0
           ? *(void *)&v98[0] + *(void *)v99 >= a1
           : *(void *)&v98[0] + *(void *)v99 < a1))
        goto LABEL_242;
      unint64_t v19 = ccder_sizeof_extension(v5, 0xAuLL, 0);
      unint64_t v20 = v19;
      if (a4)
      {
        if (*((void *)&v94 + 1) - (void)v94 < v19) {
          return 393220LL;
        }
      }
    }

    if (v11 > 160)
    {
      if (v11 != 163 && v11 != 161) {
        goto LABEL_45;
      }
    }

    else if (v11 != 1 && v11 != 3)
    {
LABEL_45:
      unint64_t v28 = ccder_sizeof_extension(0x20uLL, 0xAuLL, 1);
      uint64_t v29 = 72LL;
      if ((~v11 & 0xA0) == 0) {
        uint64_t v29 = 70LL;
      }
      uint64_t Signature = 393217LL;
      if ((v29 | 0x20uLL) > a2) {
        return Signature;
      }
      unint64_t v5 = v28;
      if (!a4)
      {
        if (__CFADD__(a1, v29)) {
          goto LABEL_242;
        }
LABEL_95:
        BOOL v23 = __CFADD__(v20, v5);
        v20 += v5;
        if (v23) {
          goto LABEL_246;
        }
LABEL_47:
        a3 = &leaf_5280_extensions_template;
        if (v11 > 159)
        {
          if ((v11 - 160) < 4)
          {
            int v25 = 0;
            int v26 = &ca_5280_extensions_template;
            unint64_t v27 = 33LL;
            unint64_t v5 = 102LL;
            goto LABEL_65;
          }

          unsigned int v24 = v11 - 164;
        }

        else
        {
          unsigned int v24 = v11 - 4;
          if (v11 < 4)
          {
            int v25 = 0;
            int v26 = &ca_5280_extensions_template;
            unint64_t v27 = 33LL;
            unint64_t v5 = 104LL;
            goto LABEL_65;
          }
        }

        uint64_t Signature = 393218LL;
        if (v24 >= 2) {
          return Signature;
        }
        a3 = &ca_5280_extensions_template;
        int v26 = &CTOidAppleMFI4ProductPlanUID;
        int v25 = 1;
        unint64_t v27 = 97LL;
        unint64_t v5 = 78LL;
LABEL_65:
        uint64_t Signature = 393217LL;
        if (v5 + 20 > a2) {
          return Signature;
        }
        if (a4)
        {
          unint64_t v30 = v94;
          if (*((void *)&v94 + 1) - (void)v94 < v27) {
            return 393220LL;
          }
          int v87 = v25;
          v98[0] = v94;
          BOOL v23 = v26 >= a3;
          unint64_t v36 = v26 - a3;
          if (!v23 || v27 > v36) {
            goto LABEL_241;
          }
          unint64_t v81 = v27;
          unint64_t v84 = *((void *)&v94 + 1);
          if (!ccder_blob_encode_body(&v94, v27, a3)) {
            return 393226LL;
          }
          if (v87)
          {
            unint64_t v96 = 0xAAAAAAAAAAAAAAAALL;
            unint64_t v97 = 0xAAAAAAAAAAAAAAAALL;
            if (v84 >= 0xFFFFFFFFFFFFFFD1LL) {
              goto LABEL_242;
            }
            if (v84 < 0x2F || v30 > v84 - 47) {
              goto LABEL_241;
            }
            unint64_t v96 = v30;
            unint64_t v97 = v84 - 47;
            if (__CFADD__(a1, v5)) {
              goto LABEL_242;
            }
            a3 = (_BYTE *)(a1 + v5);
            if (a1 + v5 < a1 || a2 - v5 < 0x14) {
              goto LABEL_241;
            }
            if (!ccder_blob_encode_body(&v96, 0x14uLL, a3)) {
              return 393226LL;
            }
            unint64_t v5 = v30;
            memset(v99, 170, 20);
            uint64_t Signature = CTDecompressCAComputeSKID(a1, a2, (uint64_t)v99);
            if ((_DWORD)Signature) {
              return Signature;
            }
            if (v5 > v84 - 16) {
              goto LABEL_241;
            }
            v95[0] = v5;
            v95[1] = v84 - 16;
            __int16 v37 = v95;
            a3 = v99;
          }

          else
          {
            if (__CFADD__(a1, v5)) {
              goto LABEL_242;
            }
            a3 = (_BYTE *)(a1 + v5);
            if (a1 + v5 < a1 || a2 - v5 < 0x14) {
              goto LABEL_241;
            }
            __int16 v37 = v98;
          }

          if (!ccder_blob_encode_body(v37, 0x14uLL, a3)) {
            return 393226LL;
          }
          if (__CFADD__(v20, v81)) {
            goto LABEL_246;
          }
          unint64_t v33 = ccder_sizeof(0x2000000000000010LL, v20 + v81);
        }

        else
        {
          BOOL v23 = __CFADD__(v20, v27);
          unint64_t v32 = v20 + v27;
          if (v23) {
            goto LABEL_246;
          }
          unint64_t v33 = ccder_sizeof(0x2000000000000010LL, v32);
        }

        unint64_t v5 = ccder_sizeof(0xA000000000000003LL, v33);
        uint64_t v93 = v5;
        if (v11 > 159)
        {
          if ((v11 - 160) < 4)
          {
            unint64_t v35 = 37LL;
            goto LABEL_110;
          }

          unsigned int v34 = v11 - 164;
        }

        else
        {
          unsigned int v34 = v11 - 4;
          if (v11 < 4)
          {
            unint64_t v35 = 39LL;
            goto LABEL_110;
          }
        }

        uint64_t Signature = 393218LL;
        if (v34 >= 2) {
          return Signature;
        }
        unint64_t v35 = 45LL;
LABEL_110:
        uint64_t Signature = 393217LL;
        if (v35 + 33 > a2) {
          return Signature;
        }
        if (a4 && *((void *)&v94 + 1) - (void)v94 < 0x5BuLL) {
          return 393220LL;
        }
        unint64_t v38 = ~a1;
        if (v35 > ~a1) {
          goto LABEL_242;
        }
        unint64_t v39 = a1 + v35;
        if (v39 < a1) {
          goto LABEL_241;
        }
        unint64_t v88 = a1 + a2;
        if (a1 + a2 - v39 <= 0x20) {
          goto LABEL_241;
        }
        *(void *)&v98[0] = v39;
        *((void *)&v98[0] + 1) = 33LL;
        char v102 = -86;
        *(void *)&__int128 v40 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v101 = v40;
        *(_OWORD *)&v99[16] = v40;
        __int128 v100 = v40;
        *(_OWORD *)int v99 = v40;
        uint64_t Signature = decompressECPublicKey((uint64_t)v98, (int **)&CTOidSECP256r1, v99, 65LL);
        if ((_DWORD)Signature) {
          return Signature;
        }
        if (a4)
        {
          uint64_t Signature = 393226LL;
          if (!ccder_blob_encode_body(&v94, 0x41uLL, v99) || !ccder_blob_encode_body(&v94, 0x1AuLL, &spki_template)) {
            return Signature;
          }
        }

        uint64_t v93 = 91LL;
        unint64_t v41 = v5 + 91;
        uint64_t Signature = 393218LL;
        if (v5 >= 0xFFFFFFFFFFFFFFA5LL) {
          goto LABEL_246;
        }
        if (v11 > 159)
        {
          if ((v11 - 160) < 4)
          {
            a3 = &attestation_leaf_subject;
            int v42 = &attestation_ca_subject;
            uint64_t v43 = 14LL;
            uint64_t v44 = 64LL;
            unint64_t v45 = 164LL;
            unint64_t v5 = 37LL;
            uint64_t v46 = 33LL;
            goto LABEL_131;
          }

          a3 = &attestation_ca_subject;
          int v42 = &root_subject;
          uint64_t v43 = 58LL;
          unint64_t v45 = 108LL;
        }

        else
        {
          if (v11 < 4)
          {
            a3 = &mfi_leaf_subject;
            int v42 = &mfi_ca_subject;
            uint64_t v43 = 17LL;
            uint64_t v44 = 32LL;
            unint64_t v45 = 119LL;
            unint64_t v5 = 1LL;
            uint64_t v46 = 16LL;
            goto LABEL_131;
          }

          a3 = &mfi_ca_subject;
          int v42 = &attestation_leaf_subject;
          uint64_t v43 = 57LL;
          unint64_t v45 = 107LL;
        }

        unint64_t v5 = 37LL;
        uint64_t v46 = 8LL;
        uint64_t v44 = 8LL;
LABEL_131:
        uint64_t Signature = 393217LL;
        if (v5 + v46 > a2) {
          return Signature;
        }
        if (a4)
        {
          unint64_t v47 = v94;
          if (*((void *)&v94 + 1) - (void)v94 < v45) {
            return 393220LL;
          }
          uint64_t v82 = v43;
          size_t v85 = v46;
          unint64_t v80 = v44;
          unint64_t v78 = v41;
          unint64_t v79 = *((void *)&v94 + 1);
          unint64_t v77 = v45;
          if (!ccder_blob_encode_body(&v94, v45, a3)) {
            return 393226LL;
          }
          if (__CFADD__(*((void *)&v94 + 1), v82)) {
            goto LABEL_242;
          }
          uint64_t v83 = (char *)(*((void *)&v94 + 1) + v82);
          BOOL v48 = (uint64_t)&v83[-v47] >= 0 ? (unint64_t)v83 >= v47 : (unint64_t)v83 < v47;
          if (!v48 || v5 > v38) {
            goto LABEL_242;
          }
          int v49 = (const void *)(a1 + v5);
          if (a1 + v5 < a1
            || (unint64_t)v83 > v79
            || v47 > (unint64_t)v83
            || v80 > v79 - (unint64_t)v83
            || (unint64_t)v49 > v88
            || v85 > v88 - (unint64_t)v49)
          {
            goto LABEL_241;
          }

          if (v11 > 159)
          {
            if ((v11 - 160) < 4)
            {
              unint64_t v96 = a1 + v5;
              unint64_t v97 = v85;
              char v102 = -86;
              *(void *)&__int128 v53 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
              __int128 v101 = v53;
              *(_OWORD *)&v99[16] = v53;
              __int128 v100 = v53;
              *(_OWORD *)int v99 = v53;
              uint64_t Signature = decompressECPublicKey((uint64_t)&v96, (int **)&CTOidSECP256r1, v99, 65LL);
              if ((_DWORD)Signature) {
                goto LABEL_157;
              }
              int v54 = ccsha256_di();
              memset(v98, 0, sizeof(v98));
              ccdigest((uint64_t)v54, 0x41uLL, v99, (uint64_t)v98);
              BOOL v51 = v98;
              uint64_t v52 = 32LL;
LABEL_156:
              uint64_t Signature = CTConvertByteArrayToAsciiHex((unint64_t)v51, v52, v83, v80);
LABEL_157:
              unint64_t v45 = v77;
              unint64_t v41 = v78;
              if ((_DWORD)Signature) {
                return Signature;
              }
              goto LABEL_163;
            }

            unsigned int v50 = v11 - 164;
          }

          else
          {
            unsigned int v50 = v11 - 4;
            if (v11 < 4)
            {
              BOOL v51 = (_OWORD *)(a1 + v5);
              uint64_t v52 = v85;
              goto LABEL_156;
            }
          }

          uint64_t Signature = 393218LL;
          if (v50 >= 2) {
            return Signature;
          }
          if (v85 > v80) {
            goto LABEL_241;
          }
          memcpy(v83, v49, v85);
          unint64_t v45 = v77;
          unint64_t v41 = v78;
        }

LABEL_163:
        uint64_t v93 = v45;
        if (__CFADD__(v41, v45)) {
          goto LABEL_246;
        }
        unint64_t v86 = v41 + v45;
        if (v11 > 159)
        {
          if ((v11 - 160) < 4)
          {
LABEL_170:
            __int16 v59 = 0LL;
            int v58 = 0LL;
            char v56 = 1;
            unint64_t v5 = 9LL;
            unint64_t v57 = 23LL;
LABEL_171:
            if (v5 + 14 > a2) {
              return 393217LL;
            }
            uint64_t Signature = 393217LL;
            if (v57 + 14 <= a2)
            {
              if (v5 > v38) {
                goto LABEL_242;
              }
              if ((v56 & 1) != 0)
              {
                if (v57 > v38) {
                  goto LABEL_242;
                }
                unint64_t v60 = a1 + v57;
                __int16 v59 = (const char *)(a1 + a2);
                int v58 = (void *)a1;
              }

              else
              {
                unint64_t v60 = (unint64_t)v58;
              }

              *(void *)int v99 = 0LL;
              if (v60 <= (unint64_t)v59 && (unint64_t)v58 <= v60 && (uint64_t)&v59[-v60] > 13)
              {
                uint64_t Signature = CTDecompressDate(v60, v90, (unint64_t *)v99);
                if ((_DWORD)Signature) {
                  return Signature;
                }
                unint64_t v61 = a1 + v5;
                if (a1 + v5 >= a1 && (uint64_t)(v88 - v61) >= 14)
                {
                  uint64_t v62 = *(void *)v99;
                  uint64_t Signature = CTDecompressDate(v61, v90, (unint64_t *)v99);
                  if ((_DWORD)Signature) {
                    return Signature;
                  }
                  unint64_t v63 = v62 + *(void *)v99;
                  if (__CFADD__(v62, *(void *)v99)) {
                    goto LABEL_246;
                  }
                  if (a4
                    && (ccder_blob_encode_tl((uint64_t *)&v94, 0x2000000000000010uLL, v62 + *(void *)v99) & 1) == 0)
                  {
                    return 393220LL;
                  }

                  uint64_t v93 = ccder_sizeof(0x2000000000000010LL, v63);
                  unint64_t v64 = v86 + v93;
                  if (__CFADD__(v86, v93)) {
                    goto LABEL_246;
                  }
                  uint64_t Signature = CTDecompressIssuer(v11, a1, a2, (unint64_t *)v90, (unint64_t *)&v93);
                  if ((_DWORD)Signature) {
                    return Signature;
                  }
                  BOOL v23 = __CFADD__(v64, v93);
                  unint64_t v65 = v64 + v93;
                  if (v23) {
                    goto LABEL_246;
                  }
                  if (a4)
                  {
                    if (*((void *)&v94 + 1) - (void)v94 < 0xCuLL) {
                      return 393220LL;
                    }
                    if (!ccder_blob_encode_body(&v94, 0xCuLL, &signature_algorithm_template)) {
                      return 393226LL;
                    }
                  }

                  uint64_t v93 = 12LL;
                  BOOL v23 = __CFADD__(v65, 12LL);
                  unint64_t v66 = v65 + 12;
                  if (v23) {
                    goto LABEL_246;
                  }
                  uint64_t Signature = CTDecompressSerialNumber(v11, (_OWORD *)a1, a2, v90, (unint64_t *)&v93);
                  if ((_DWORD)Signature) {
                    return Signature;
                  }
                  BOOL v23 = __CFADD__(v66, v93);
                  unint64_t v5 = v66 + v93;
                  if (v23) {
                    goto LABEL_246;
                  }
                  if (a4)
                  {
                    if (*((void *)&v94 + 1) - (void)v94 < 5uLL) {
                      return 393220LL;
                    }
                    if (ccder_blob_encode_body(&v94, 5uLL, &version_template))
                    {
                      uint64_t v93 = 5LL;
                      BOOL v23 = __CFADD__(v5, 5LL);
                      unint64_t v67 = v5 + 5;
                      if (v23) {
                        goto LABEL_246;
                      }
LABEL_206:
                      size_t v68 = ccder_sizeof(0x2000000000000010LL, v67);
                      *(void *)int v99 = 0LL;
                      *(void *)&v98[0] = 0LL;
                      uint64_t Signature = CTDecompressGetSignature( v11,  a1,  a2,  (unint64_t *)v98,  (unsigned __int8 **)v99);
                      if ((_DWORD)Signature) {
                        return Signature;
                      }
                      if (*(void *)v99 == -1LL) {
                        goto LABEL_246;
                      }
                      size_t v89 = v68 + 12;
                      if (v68 >= 0xFFFFFFFFFFFFFFF4LL) {
                        goto LABEL_246;
                      }
                      uint64_t v69 = ccder_sizeof(3LL, *(void *)v99 + 1LL);
                      if (__CFADD__(v89, v69)) {
                        goto LABEL_246;
                      }
                      unint64_t v70 = ccder_sizeof_tl(0x2000000000000010LL, v89 + v69);
                      unint64_t v5 = v70;
                      if (a4)
                      {
                        unint64_t v71 = v70 + v68;
                        if (__CFADD__(v70, v68)) {
                          goto LABEL_246;
                        }
                        if (v71 > a5) {
                          return 393220LL;
                        }
                        if (v70 > v91) {
                          goto LABEL_242;
                        }
                        unsigned int v72 = (const void *)*((void *)&v94 + 1);
                        if (!((uint64_t)(*((void *)&v94 + 1) - a4) >= 0
                             ? *((void *)&v94 + 1) >= a4
                             : *((void *)&v94 + 1) < a4))
                          goto LABEL_242;
                        *(void *)&__int128 v94 = a4;
                        *((void *)&v94 + 1) = a4 + a5;
                        unint64_t v74 = a4 + v70;
                        if (a4 + v70 > v12 || v74 < a4 || v68 > v12 - v74) {
                          goto LABEL_241;
                        }
                        memmove((void *)(a4 + v70), v72, v68);
                        if (v71 >= 0xFFFFFFFFFFFFFFF4LL) {
                          goto LABEL_246;
                        }
                        if (v71 + 12 > a5) {
                          return 393220LL;
                        }
                        if (__CFADD__(v74, v68)) {
                          goto LABEL_242;
                        }
                        unint64_t v75 = v74 + v68;
                        if (v12 < v74 + v68 || v75 < a4 || v12 - (v74 + v68) < 0xC) {
                          goto LABEL_241;
                        }
                        *(_DWORD *)(v75 + 8) = 33752125;
                        *(void *)unint64_t v75 = 0xCE48862A08060A30LL;
                      }

                      uint64_t Signature = CTDecompressSignature(v11, a1, a2, v90, (unint64_t *)&v93);
                      if ((_DWORD)Signature) {
                        return Signature;
                      }
                      a3 = (_BYTE *)(v89 + v93);
                      if (__CFADD__(v89, v93)) {
                        goto LABEL_246;
                      }
                      if (!a4) {
                        goto LABEL_243;
                      }
                      uint64_t v76 = &a3[v5];
                      if (__CFADD__(v5, a3)) {
                        goto LABEL_246;
                      }
                      uint64_t Signature = 393220LL;
                      if (v5 <= v91)
                      {
                        if (a4 + v5 <= v12 && a4 + v5 >= a4)
                        {
                          *(void *)&__int128 v94 = a4;
                          *((void *)&v94 + 1) = a4 + v5;
                          goto LABEL_244;
                        }

                        goto LABEL_241;
                      }

LABEL_242:
                      __break(0x5513u);
LABEL_243:
                      uint64_t v76 = &a3[v5];
                      if (!__CFADD__(a3, v5))
                      {
LABEL_244:
                        if (v92)
                        {
                          uint64_t Signature = 0LL;
                          *int v92 = v76;
                          return Signature;
                        }

                        return 0LL;
                      }

LABEL_246:
                      __break(0x5500u);
                      return 0LL;
                    }

                    return 393226LL;
                  }

LABEL_205:
                  uint64_t v93 = 5LL;
                  BOOL v23 = __CFADD__(v5, 5LL);
                  unint64_t v67 = v5 + 5;
                  if (v23) {
                    goto LABEL_246;
                  }
                  goto LABEL_206;
                }
              }

LABEL_241:
              __break(0x5519u);
              goto LABEL_242;
            }

            return Signature;
          }

          unsigned int v55 = v11 - 164;
        }

        else
        {
          unsigned int v55 = v11 - 4;
          if (v11 < 4)
          {
            char v56 = 0;
            unint64_t v57 = 0LL;
            int v58 = &endOfTime;
            __int16 v59 = nibbleToAsciiByte;
            unint64_t v5 = 25LL;
            goto LABEL_171;
          }
        }

        uint64_t Signature = 393218LL;
        if (v55 >= 2) {
          return Signature;
        }
        goto LABEL_170;
      }

      if (*((void *)&v94 + 1) - (void)v94 >= v28)
      {
        if (__CFADD__(a1, v29)) {
          goto LABEL_242;
        }
        if (a1 + v29 < a1 || a2 - v29 < 0x20) {
          goto LABEL_241;
        }
        if (ccder_encode_extension( (const void *)(a1 + v29),  0x20uLL,  &CTOidAppleMFI4Properties,  0xAuLL,  1,  (uint64_t *)&v94)) {
          goto LABEL_95;
        }
      }

      return 393220LL;
    }

    unint64_t v21 = ccder_sizeof_extension(0x24uLL, 0xAuLL, 0);
    uint64_t v22 = 124LL;
    if ((~v11 & 0xA0) == 0) {
      uint64_t v22 = 122LL;
    }
    uint64_t Signature = 393217LL;
    if (v22 + 36 > a2) {
      return Signature;
    }
    unint64_t v5 = v21;
    if (a4)
    {
      if (*((void *)&v94 + 1) - (void)v94 < v21) {
        return 393220LL;
      }
      if (__CFADD__(a1, v22)) {
        goto LABEL_242;
      }
      if (a1 + v22 < a1 || a2 - v22 < 0x24) {
        goto LABEL_241;
      }
      if (!ccder_encode_extension( (const void *)(a1 + v22),  0x24uLL,  &CTOidAppleMFI4ProductPlanUID,  0xAuLL,  0,  (uint64_t *)&v94)) {
        return 393220LL;
      }
    }

    else if (__CFADD__(a1, v22))
    {
      goto LABEL_242;
    }

    BOOL v23 = __CFADD__(v20, v5);
    v20 += v5;
    if (v23) {
      goto LABEL_246;
    }
    goto LABEL_45;
  }

  return v6;
}

uint64_t CTDecompress(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  return CTDecompressGeneric(a1, a2, 0LL, a3, a4);
}

uint64_t CTCompressComputeBufferSize(unint64_t a1, uint64_t a2, void *a3)
{
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_16:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_16;
  }
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v30 = v6;
  __int128 v31 = v6;
  __int128 v28 = v6;
  __int128 v29 = v6;
  __int128 v26 = v6;
  __int128 v27 = v6;
  __int128 v24 = v6;
  __int128 v25 = v6;
  __int128 v22 = v6;
  __int128 v23 = v6;
  __int128 v20 = v6;
  __int128 v21 = v6;
  __int128 v18 = v6;
  __int128 v19 = v6;
  v16[3] = v6;
  __int128 v17 = v6;
  v16[1] = v6;
  v16[2] = v6;
  v16[0] = v6;
  v15[0] = a1;
  v15[1] = a1 + a2;
  uint64_t v7 = X509CertificateParse((unsigned __int8 **)v16, (uint64_t)v15);
  if ((_DWORD)v7) {
    return v7;
  }
  uint64_t v7 = 393218LL;
  int v9 = CTCompressedStyleFromCert((uint64_t)v16);
  if (v9 == 255) {
    return v7;
  }
  int v10 = v9;
  uint64_t result = CTNonVariableCompressedSizeForStyle(v9);
  if (result < 0) {
    return v7;
  }
  uint64_t v11 = result + v17;
  if (!__CFADD__(result, (void)v17))
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t result = CTParseExtensionValue(a1, a2, &CTOidAppleMFI4AccessoryData, 0xAuLL, &v13, &v14);
    if ((_DWORD)result) {
      return result;
    }
    BOOL v12 = __CFADD__(v11, v14);
    v11 += v14;
    if (!v12)
    {
LABEL_13:
      uint64_t v7 = 0LL;
      if (a3) {
        *a3 = v11;
      }
      return v7;
    }
  }

  __break(0x5500u);
  return result;
}

uint64_t CTCompressedStyleFromCert(uint64_t a1)
{
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = 0xAAAAAAAAAAAAAAAALL;
  if (*(_BYTE *)(a1 + 265))
  {
    X509PolicySetFlagsForCommonNames(a1);
    uint64_t v3 = *(void *)(a1 + 240);
    if ((v3 & 0x400000000LL) != 0)
    {
      int v4 = 0;
LABEL_12:
      else {
        return v4 | 4u;
      }
    }

    if ((v3 & 0x800000000LL) != 0)
    {
      int v4 = 160;
      goto LABEL_12;
    }

    return 255LL;
  }

  if ((~*(void *)(a1 + 240) & 0xC00000000LL) != 0) {
    return 255LL;
  }
  if (compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v11))
  {
    int v5 = 160;
  }

  else
  {
    int v5 = 0;
  }

  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  int v6 = CTParseExtensionValue(*(void *)a1, *(void *)(a1 + 8), &CTOidAppleMFI4AccessoryData, 0xAuLL, &v9, &v10);
  int v7 = CTParseExtensionValue(*(void *)a1, *(void *)(a1 + 8), &CTOidAppleMFI4ProductPlanUID, 0xAuLL, &v9, &v10);
  unsigned int v8 = v5 | 2;
  if (v6) {
    unsigned int v8 = v5;
  }
  if (!v7) {
    unsigned int v8 = v5 | 1;
  }
  if (v7 | v6) {
    return v8;
  }
  else {
    return v5 | 3u;
  }
}

uint64_t CTNonVariableCompressedSizeForStyle(int a1)
{
  uint64_t result = 124LL;
  switch(a1)
  {
    case 0:
    case 2:
      return result;
    case 1:
    case 3:
      uint64_t result = 160LL;
      break;
    case 4:
    case 5:
LABEL_6:
      uint64_t result = 98LL;
      break;
    default:
      switch(a1)
      {
        case 160:
        case 162:
          uint64_t result = 122LL;
          break;
        case 161:
        case 163:
          uint64_t result = 158LL;
          break;
        case 164:
        case 165:
          goto LABEL_6;
        default:
          uint64_t result = -1LL;
          break;
      }

      break;
  }

  return result;
}

uint64_t CTCompress(unint64_t a1, uint64_t a2, _BYTE *a3, size_t a4)
{
  size_t v33 = 0LL;
  uint64_t result = CTCompressComputeBufferSize(a1, a2, &v33);
  uint64_t v9 = result;
  if ((_DWORD)result) {
    return v9;
  }
  uint64_t v9 = 393220LL;
  if (!a4 || v33 > a4) {
    return v9;
  }
  *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v31 = v10;
  __int128 v32 = v10;
  __int128 v29 = v10;
  __int128 v30 = v10;
  __int128 v27 = v10;
  __int128 v28 = v10;
  __int128 v25 = v10;
  __int128 v26 = v10;
  v23[2] = v10;
  __int128 v24 = v10;
  v23[0] = v10;
  v23[1] = v10;
  __int128 v21 = v10;
  __int128 v22 = v10;
  *(_OWORD *)__src = v10;
  *(_OWORD *)__n = v10;
  v18[1] = v10;
  v18[2] = v10;
  v18[0] = v10;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_47;
  }
  unint64_t v16 = a1;
  unint64_t v17 = a1 + a2;
  uint64_t v11 = X509CertificateParse((unsigned __int8 **)v18, (uint64_t)&v16);
  if ((_DWORD)v11) {
    return v11;
  }
  bzero(a3, a4);
  uint64_t result = CTCompressedStyleFromCert((uint64_t)v18);
  if ((_DWORD)result == 255) {
    return 393218LL;
  }
  *a3 = result;
  if ((result & 4) == 0)
  {
    if ((~(_DWORD)result & 0xA0) != 0) {
      uint64_t result = CTCompressMFiLeaf((uint64_t)v18, (unint64_t)a3, a4);
    }
    else {
      uint64_t result = CTCompressAttestationLeaf((unint64_t *)v18, (unint64_t)a3, a4);
    }
    goto LABEL_20;
  }

  if (a3 != (_BYTE *)-1LL)
  {
    uint64_t result = CTCompressGetCommonNameSuffixPointer((uint64_t)v23 + 8);
    if (!result)
    {
      uint64_t v9 = 393224LL;
      goto LABEL_23;
    }

    if (a4 < 9)
    {
LABEL_23:
      bzero(a3, a4);
      return v9;
    }

    *(void *)(a3 + 1) = *(void *)result;
    if ((unint64_t)(a3 + 1) <= 0xFFFFFFFFFFFFFFF7LL)
    {
      memset(v35, 170, sizeof(v35));
      uint64_t result = X509CertificateParseValidity((uint64_t)v18, &v35[2], v35);
      if ((_DWORD)result) {
        goto LABEL_20;
      }
      memset(v39, 170, 14);
      uint64_t result = CTGetGeneralizedTime((uint64_t)&v35[2], (unint64_t)v39);
      if ((_DWORD)result) {
        goto LABEL_20;
      }
      if (a4 < 0x17) {
        goto LABEL_18;
      }
      *(void *)(a3 + 9) = v39[0];
      *(void *)(a3 + 15) = *(void *)((char *)v39 + 6);
      if ((unint64_t)(a3 + 9) <= 0xFFFFFFFFFFFFFFF1LL)
      {
        uint64_t result = CTGetGeneralizedTime((uint64_t)v35, (unint64_t)v39);
        if ((_DWORD)result) {
          goto LABEL_20;
        }
        if (a4 < 0x25) {
          goto LABEL_18;
        }
        *(void *)(a3 + 23) = v39[0];
        *(void *)(a3 + 29) = *(void *)((char *)v39 + 6);
        uint64_t result = CTCompressGetCommonNameSuffixPointer((uint64_t)&v22 + 8);
        if (!result)
        {
          uint64_t result = 393224LL;
          goto LABEL_20;
        }

        if (a4 < 0x2D)
        {
LABEL_18:
          uint64_t result = 393220LL;
          goto LABEL_20;
        }

        *(void *)(a3 + 37) = *(void *)result;
        char v38 = -86;
        *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __int128 v36 = v12;
        __int128 v37 = v12;
        memset(v34, 170, sizeof(v34));
        uint64_t result = X509CertificateParseSPKI((unint64_t *)&v21 + 1, 0LL, v34, &v34[2]);
        if ((_DWORD)result) {
          goto LABEL_20;
        }
        uint64_t result = compressECPublicKey(&v34[2], (int **)v34, (char *)&v36, 33LL);
        if ((_DWORD)result) {
          goto LABEL_20;
        }
        if (a4 < 0x4E) {
          goto LABEL_18;
        }
        __int128 v13 = v37;
        *(_OWORD *)(a3 + 45) = v36;
        *(_OWORD *)(a3 + 61) = v13;
        a3[77] = v38;
        if ((unint64_t)(a3 + 45) <= 0xFFFFFFFFFFFFFFDELL)
        {
          uint64_t result = 393221LL;
          if (!*((void *)&v24 + 1) || (void)v25 != 20LL) {
            goto LABEL_20;
          }
          if (a4 < 0x62) {
            goto LABEL_18;
          }
          __int128 v14 = **((_OWORD **)&v24 + 1);
          *(_DWORD *)(a3 + 94) = *(_DWORD *)(*((void *)&v24 + 1) + 16LL);
          *(_OWORD *)(a3 + 78) = v14;
          if ((unint64_t)(a3 + 78) <= 0xFFFFFFFFFFFFFFEBLL)
          {
            uint64_t result = 655619LL;
            if (__src[1])
            {
              size_t v15 = __n[0];
              if (__n[0] - 73 >= 0xFFFFFFFFFFFFFFFDLL)
              {
                uint64_t result = 393220LL;
                if (__n[0] + 98 <= a4)
                {
                  uint64_t result = (uint64_t)memcpy(a3 + 98, __src[1], __n[0]);
                  if (!__CFADD__(a3 + 98, v15))
                  {
                    uint64_t result = 0LL;
                    goto LABEL_20;
                  }

                  goto LABEL_47;
                }
              }
            }

uint64_t CTCompressAttestationLeaf(unint64_t *a1, unint64_t a2, unint64_t a3)
{
  if (a2 == -1LL) {
    goto LABEL_65;
  }
  uint64_t v6 = 393220LL;
  uint64_t result = CTCompressGetCommonNameSuffixPointer((uint64_t)(a1 + 15));
  if (!result) {
    return 393224LL;
  }
  if (a3 < 9) {
    return v6;
  }
  unint64_t v8 = a2 + 1;
  if (a2 + 1 >= a2)
  {
    unint64_t v9 = a2 + a3;
    if (v8 <= a2 + a3)
    {
      *(void *)(a2 + 1) = *(void *)result;
      if (v8 > 0xFFFFFFFFFFFFFFF7LL) {
        goto LABEL_65;
      }
      memset(v34, 170, sizeof(v34));
      uint64_t result = X509CertificateParseValidity((uint64_t)a1, &v34[2], v34);
      if ((_DWORD)result) {
        return result;
      }
      memset(v38, 170, 14);
      uint64_t result = CTGetGeneralizedTime((uint64_t)&v34[2], (unint64_t)v38);
      if ((_DWORD)result) {
        return result;
      }
      if (a3 < 0x17) {
        return 393220LL;
      }
      __int128 v10 = (void *)(a2 + 9);
      if (a2 + 9 >= a2 && (unint64_t)v10 <= v9)
      {
        void *v10 = v38[0];
        *(void *)(a2 + 15) = *(void *)((char *)v38 + 6);
        uint64_t result = CTGetGeneralizedTime((uint64_t)v34, (unint64_t)v38);
        if ((_DWORD)result) {
          return result;
        }
        if (a3 < 0x25) {
          return 393220LL;
        }
        uint64_t v11 = (void *)(a2 + 23);
        if (a2 + 23 >= a2 && (unint64_t)v11 <= v9)
        {
          void *v11 = v38[0];
          *(void *)(a2 + 29) = *(void *)((char *)v38 + 6);
          char v37 = -86;
          *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v35 = v12;
          __int128 v36 = v12;
          memset(v33, 170, sizeof(v33));
          uint64_t result = X509CertificateParseSPKI(a1 + 11, 0LL, v33, &v33[2]);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t result = compressECPublicKey(&v33[2], (int **)v33, (char *)&v35, 33LL);
          if ((_DWORD)result) {
            return result;
          }
          if (a3 < 0x46) {
            return 393220LL;
          }
          __int128 v13 = (_OWORD *)(a2 + 37);
          if (a2 + 37 >= a2 && (unint64_t)v13 <= v9)
          {
            __int128 v14 = v36;
            _OWORD *v13 = v35;
            *(_OWORD *)(a2 + 53) = v14;
            *(_BYTE *)(a2 + 69) = v37;
            size_t v15 = (_OWORD *)a1[31];
            uint64_t result = 393222LL;
            if (!v15 || a1[32] != 32) {
              return result;
            }
            if (a3 < 0x66) {
              return 393220LL;
            }
            unint64_t v16 = (_OWORD *)(a2 + 70);
            if (a2 + 70 >= a2 && (unint64_t)v16 <= v9)
            {
              __int128 v17 = v15[1];
              *unint64_t v16 = *v15;
              *(_OWORD *)(a2 + 86) = v17;
              unint64_t v18 = a1[21];
              uint64_t result = 393221LL;
              if (!v18 || a1[22] != 20) {
                return result;
              }
              if (a3 < 0x7A) {
                return 393220LL;
              }
              __int128 v19 = (_OWORD *)(a2 + 102);
              if (a2 + 102 >= a2 && (unint64_t)v19 <= v9)
              {
                __int128 v20 = *(_OWORD *)v18;
                *(_DWORD *)(a2 + 118) = *(_DWORD *)(v18 + 16);
                *__int128 v19 = v20;
                __int128 v21 = (_OWORD *)(a2 + 122);
                __src = 0LL;
                size_t __n = 0LL;
                if (CTParseExtensionValue( *a1,  a1[1],  &CTOidAppleMFI4ProductPlanUID,  0xAuLL,  &__src,  &__n))
                {
                  uint64_t v22 = 122LL;
                }

                else
                {
                  uint64_t result = 393222LL;
                  if (!__src || __n != 36) {
                    return result;
                  }
                  if (a3 < 0x9E) {
                    return 393220LL;
                  }
                  __int128 v27 = *(_OWORD *)__src;
                  __int128 v28 = *((_OWORD *)__src + 1);
                  *(_DWORD *)(a2 + 154) = *((_DWORD *)__src + 8);
                  *__int128 v21 = v27;
                  *(_OWORD *)(a2 + 138) = v28;
                  __int128 v21 = (_OWORD *)(a2 + 158);
                  uint64_t v22 = 158LL;
                }

                __int128 v23 = (const void *)a1[7];
                uint64_t result = 655619LL;
                if (!v23) {
                  return result;
                }
                size_t v24 = a1[8];
                if (v24 - 73 < 0xFFFFFFFFFFFFFFFDLL) {
                  return result;
                }
                size_t v25 = v24 + v22;
                if (v24 + v22 > a3) {
                  return 393220LL;
                }
                if ((unint64_t)v21 <= v9 && (unint64_t)v21 >= a2 && v24 <= v9 - (unint64_t)v21)
                {
                  memcpy(v21, v23, v24);
                  unint64_t v26 = a1[8];
                  if (__CFADD__(v21, v26)) {
                    goto LABEL_65;
                  }
                  if (CTParseExtensionValue( *a1,  a1[1],  &CTOidAppleMFI4AccessoryData,  0xAuLL,  &__src,  &__n)) {
                    return 0LL;
                  }
                  if (!__src) {
                    return 393222LL;
                  }
                  size_t v29 = __n;
                  uint64_t result = 393220LL;
                  if (__n + v25 > a3) {
                    return result;
                  }
                  __int128 v30 = (char *)v21 + v26;
                  if ((unint64_t)v21 + v26 <= v9
                    && (unint64_t)v30 >= a2
                    && __n <= v9 - (unint64_t)v30)
                  {
                    memcpy((char *)v21 + v26, __src, __n);
                    if (!__CFADD__(v30, v29)) {
                      return 0LL;
                    }
LABEL_65:
                    __break(0x5513u);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t CTCompressMFiLeaf(uint64_t result, unint64_t a2, unint64_t a3)
{
  if (a2 == -1LL) {
    goto LABEL_69;
  }
  uint64_t v3 = (unint64_t *)result;
  uint64_t v4 = 393220LL;
  int v5 = *(_OWORD **)(result + 136);
  if (v5) {
    BOOL v6 = *(void *)(result + 144) == 16LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    return 393223LL;
  }
  if (a3 < 0x11) {
    return v4;
  }
  unint64_t v9 = (_OWORD *)(a2 + 1);
  if (a2 + 1 >= a2)
  {
    unint64_t v10 = a2 + a3;
    if ((unint64_t)v9 <= a2 + a3)
    {
      *unint64_t v9 = *v5;
      uint64_t result = CTCompressGetCommonNameSuffixPointer(result + 120);
      if (!result) {
        return 393224LL;
      }
      if (a3 < 0x19) {
        return v4;
      }
      unint64_t v11 = a2 + 17;
      if (a2 + 17 >= a2 && v11 <= v10)
      {
        *(void *)(a2 + 17) = *(void *)result;
        if (v11 > 0xFFFFFFFFFFFFFFF7LL) {
          goto LABEL_69;
        }
        v35[0] = 0xAAAAAAAAAAAAAAAALL;
        v35[1] = 0xAAAAAAAAAAAAAAAALL;
        uint64_t result = X509CertificateParseValidity((uint64_t)v3, v35, 0LL);
        if ((_DWORD)result) {
          return result;
        }
        *(void *)((char *)v39 + 6) = 0xAAAAAAAAAAAAAAAALL;
        v39[0] = 0xAAAAAAAAAAAAAAAALL;
        uint64_t result = CTGetGeneralizedTime((uint64_t)v35, (unint64_t)v39);
        if ((_DWORD)result) {
          return result;
        }
        if (a3 < 0x27) {
          return 393220LL;
        }
        __int128 v12 = (void *)(a2 + 25);
        if (a2 + 25 >= a2 && (unint64_t)v12 <= v10)
        {
          void *v12 = v39[0];
          *(void *)(a2 + 31) = *(void *)((char *)v39 + 6);
          char v38 = -86;
          *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          __int128 v36 = v13;
          __int128 v37 = v13;
          memset(v34, 170, sizeof(v34));
          uint64_t result = X509CertificateParseSPKI(v3 + 11, 0LL, v34, &v34[2]);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t result = compressECPublicKey(&v34[2], (int **)v34, (char *)&v36, 33LL);
          if ((_DWORD)result) {
            return result;
          }
          if (a3 < 0x48) {
            return 393220LL;
          }
          __int128 v14 = (_OWORD *)(a2 + 39);
          if (a2 + 39 >= a2 && (unint64_t)v14 <= v10)
          {
            __int128 v15 = v37;
            _OWORD *v14 = v36;
            *(_OWORD *)(a2 + 55) = v15;
            *(_BYTE *)(a2 + 71) = v38;
            unint64_t v16 = (_OWORD *)v3[31];
            uint64_t result = 393222LL;
            if (!v16 || v3[32] != 32) {
              return result;
            }
            if (a3 < 0x68) {
              return 393220LL;
            }
            __int128 v17 = (_OWORD *)(a2 + 72);
            if (a2 + 72 >= a2 && (unint64_t)v17 <= v10)
            {
              __int128 v18 = v16[1];
              *__int128 v17 = *v16;
              *(_OWORD *)(a2 + 88) = v18;
              unint64_t v19 = v3[21];
              uint64_t result = 393221LL;
              if (!v19 || v3[22] != 20) {
                return result;
              }
              if (a3 < 0x7C) {
                return 393220LL;
              }
              __int128 v20 = (_OWORD *)(a2 + 104);
              if (a2 + 104 >= a2 && (unint64_t)v20 <= v10)
              {
                __int128 v21 = *(_OWORD *)v19;
                *(_DWORD *)(a2 + 120) = *(_DWORD *)(v19 + 16);
                *__int128 v20 = v21;
                uint64_t v22 = (_OWORD *)(a2 + 124);
                __src = 0LL;
                size_t __n = 0LL;
                if (CTParseExtensionValue( *v3,  v3[1],  &CTOidAppleMFI4ProductPlanUID,  0xAuLL,  &__src,  &__n))
                {
                  uint64_t v23 = 124LL;
                }

                else
                {
                  uint64_t result = 393222LL;
                  if (!__src || __n != 36) {
                    return result;
                  }
                  if (a3 < 0xA0) {
                    return 393220LL;
                  }
                  __int128 v28 = *(_OWORD *)__src;
                  __int128 v29 = *((_OWORD *)__src + 1);
                  *(_DWORD *)(a2 + 156) = *((_DWORD *)__src + 8);
                  *uint64_t v22 = v28;
                  *(_OWORD *)(a2 + 140) = v29;
                  uint64_t v22 = (_OWORD *)(a2 + 160);
                  uint64_t v23 = 160LL;
                }

                size_t v24 = (const void *)v3[7];
                uint64_t result = 655619LL;
                if (!v24) {
                  return result;
                }
                size_t v25 = v3[8];
                if (v25 - 73 < 0xFFFFFFFFFFFFFFFDLL) {
                  return result;
                }
                size_t v26 = v25 + v23;
                if (v25 + v23 > a3) {
                  return 393220LL;
                }
                if ((unint64_t)v22 <= v10 && (unint64_t)v22 >= a2 && v25 <= v10 - (unint64_t)v22)
                {
                  memcpy(v22, v24, v25);
                  unint64_t v27 = v3[8];
                  if (__CFADD__(v22, v27)) {
                    goto LABEL_69;
                  }
                  if (CTParseExtensionValue( *v3,  v3[1],  &CTOidAppleMFI4AccessoryData,  0xAuLL,  &__src,  &__n)) {
                    return 0LL;
                  }
                  if (!__src) {
                    return 393222LL;
                  }
                  size_t v30 = __n;
                  uint64_t result = 393220LL;
                  if (__n + v26 > a3) {
                    return result;
                  }
                  __int128 v31 = (char *)v22 + v27;
                  if ((unint64_t)v22 + v27 <= v10
                    && (unint64_t)v31 >= a2
                    && __n <= v10 - (unint64_t)v31)
                  {
                    memcpy((char *)v22 + v27, __src, __n);
                    if (!__CFADD__(v31, v30)) {
                      return 0LL;
                    }
LABEL_69:
                    __break(0x5513u);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t CTDecompressIssuer( int a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t result = 393218LL;
  if (a1 <= 159)
  {
    unint64_t v11 = &mfi_ca_subject;
    if (a1 < 4)
    {
      __int128 v12 = &attestation_leaf_subject;
      uint64_t v13 = 57LL;
      unint64_t v14 = 107LL;
      uint64_t v15 = 17LL;
      goto LABEL_14;
    }

    if (a1 != 4)
    {
      if (a1 != 5) {
        return result;
      }
      __int128 v12 = &attestation_leaf_subject;
      uint64_t v13 = 57LL;
      unint64_t v14 = 107LL;
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if ((a1 - 160) >= 4)
  {
    if (a1 == 164)
    {
LABEL_12:
      unint64_t v11 = &root_subject;
      __int128 v12 = &leaf_5280_extensions_template;
      uint64_t v13 = 39LL;
      unint64_t v14 = 89LL;
      goto LABEL_13;
    }

    if (a1 != 165) {
      return result;
    }
  }

  unint64_t v11 = &attestation_ca_subject;
  __int128 v12 = &root_subject;
  uint64_t v13 = 58LL;
  unint64_t v14 = 108LL;
LABEL_13:
  uint64_t v15 = 1LL;
LABEL_14:
  uint64_t result = 393217LL;
  if ((v15 | 8uLL) > a3) {
    return result;
  }
  if (!a4) {
    goto LABEL_35;
  }
  unint64_t v17 = *a4;
  unint64_t v16 = a4[1];
  if (v16 - *a4 < v14) {
    return 393220LL;
  }
  if (v17 > v16 || v11 > v12 || v14 > v12 - v11)
  {
LABEL_40:
    __break(0x5519u);
    return result;
  }

  uint64_t result = ccder_blob_encode_body(a4, v14, v11);
  if (!(_DWORD)result) {
    return 393226LL;
  }
  unint64_t v18 = a4[1];
  if (__CFADD__(v18, v13)
    || ((unint64_t v19 = (void *)(v18 + v13), (uint64_t)((uint64_t)v19 - v17) >= 0)
      ? (BOOL v20 = (unint64_t)v19 >= v17)
      : (BOOL v20 = (unint64_t)v19 < v17),
        !v20 || __CFADD__(a2, v15)))
  {
    __break(0x5513u);
    goto LABEL_40;
  }

  __int128 v21 = (void *)(a2 + v15);
  *unint64_t v19 = *v21;
LABEL_35:
  uint64_t result = 0LL;
  if (a5) {
    *a5 = v14;
  }
  return result;
}

uint64_t CTDecompressSerialNumber(int a1, _OWORD *a2, unint64_t a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t result = 393218LL;
  if (a1 <= 159)
  {
    BOOL v11 = a1 >= 4;
    unsigned int v12 = a1 - 4;
    if (!v11)
    {
      uint64_t v13 = 0LL;
      unint64_t v14 = 0LL;
      uint64_t v15 = 1LL;
      unint64_t v16 = 16LL;
      goto LABEL_10;
    }

    goto LABEL_7;
  }

  if ((a1 - 160) >= 4)
  {
    unsigned int v12 = a1 - 164;
LABEL_7:
    if (v12 >= 2) {
      return result;
    }
    unint64_t v14 = v29;
    uint64_t v13 = v31;
    uint64_t v15 = 45LL;
    goto LABEL_9;
  }

  unint64_t v14 = v29;
  uint64_t v13 = v31;
  uint64_t v15 = 37LL;
LABEL_9:
  unint64_t v16 = 20LL;
LABEL_10:
  unint64_t v17 = ccder_sizeof(2LL, v16);
  uint64_t result = 393217LL;
  if (v15 + v16 > a3) {
    return result;
  }
  char v30 = -86;
  *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[2] = v18;
  v29[3] = v18;
  v29[0] = v18;
  v29[1] = v18;
  if (!v14)
  {
    if (!__CFADD__(a2, v15))
    {
      uint64_t v13 = (char *)a2 + a3;
      unint64_t v19 = (char *)a2 + v15;
      unint64_t v14 = a2;
      if (!a4) {
        goto LABEL_37;
      }
      goto LABEL_21;
    }

unint64_t CTDecompressGetSignature( int a1, unint64_t a2, unint64_t a3, unint64_t *a4, unsigned __int8 **a5)
{
  uint64_t v9 = 393217LL;
  unint64_t result = CTNonVariableCompressedSizeForStyle(a1);
  if ((result & 0x8000000000000000LL) != 0) {
    return 393218LL;
  }
  unint64_t v11 = result;
  if (result + 70 > a3) {
    return v9;
  }
  unint64_t v14 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  if (~a2 < a3 || result > ~a2) {
    goto LABEL_20;
  }
  unint64_t v12 = a2 + result;
  if (a2 + result > a2 + a3 || v12 < a2)
  {
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }

  unint64_t v14 = (unsigned __int8 *)(a2 + result);
  unint64_t v15 = a2 + a3;
  unint64_t v16 = 0LL;
  unint64_t result = ccder_blob_decode_tl(&v14, 0x2000000000000010LL, &v16);
  if ((result & 1) == 0) {
    return 393225LL;
  }
  uint64_t v13 = &v14[v16 - v12];
  if (__CFADD__(v16, &v14[-v12])) {
    goto LABEL_21;
  }
  if (!v13) {
    return 393225LL;
  }
  if (!__CFADD__(v11, v13))
  {
    uint64_t v9 = 0LL;
    if (!a4 || !a5) {
      return v9;
    }
    if ((unint64_t)v13 <= a2 + a3 - v12)
    {
      uint64_t v9 = 0LL;
      *a4 = v12;
      *a5 = v13;
      return v9;
    }

    goto LABEL_19;
  }

uint64_t ccder_sizeof_tl(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = ccder_sizeof_tag(a1);
  uint64_t v4 = ccder_sizeof_len(a2);
  BOOL v5 = __CFADD__(v3, v4);
  uint64_t result = v3 + v4;
  if (v5) {
    __break(0x5500u);
  }
  return result;
}

uint64_t CTDecompressSignature( int a1, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t v13 = 0LL;
  unint64_t v14 = 0LL;
  if ((a3 & 0x8000000000000000LL) != 0) {
    __break(0x5519u);
  }
  uint64_t result = CTDecompressGetSignature(a1, a2, a3, (unint64_t *)&v13, &v14);
  uint64_t v8 = result;
  if ((_DWORD)result) {
    return v8;
  }
  uint64_t v9 = v14;
  if (v14 == (unsigned __int8 *)-1LL)
  {
LABEL_15:
    __break(0x5500u);
    goto LABEL_16;
  }

  unint64_t v10 = ccder_sizeof(3LL, (unint64_t)(v14 + 1));
  unint64_t v11 = v10;
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v8 = 393226LL;
  if (a4[1] - *a4 < v10) {
    return 393220LL;
  }
  uint64_t result = ccder_blob_encode_body(a4, (unint64_t)v9, v13);
  if (!(_DWORD)result) {
    return v8;
  }
  uint64_t v12 = a4[1];
  if (v12)
  {
    a4[1] = v12 - 1;
    *(_BYTE *)(v12 - 1) = 0;
    if (v14 != (unsigned __int8 *)-1LL)
    {
LABEL_12:
      uint64_t v8 = 0LL;
      if (a5) {
        *a5 = v11;
      }
      return v8;
    }

    goto LABEL_15;
  }

unint64_t CTDecompressCAComputeSKID(unint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_DWORD *)(a3 + 16) = 0;
  if (a1 > 0xFFFFFFFFFFFFFFD2LL)
  {
    __break(0x5513u);
    goto LABEL_9;
  }

  if ((unint64_t)(a2 - 78) > 0xFFFFFFFFFFFFFFDELL || a1 + 45 < a1 || a1 + 45 > a1 + a2) {
LABEL_9:
  }
    __break(0x5519u);
  v8[0] = a1 + 45;
  v8[1] = 33LL;
  char v10 = -86;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[2] = v4;
  v9[3] = v4;
  v9[0] = v4;
  v9[1] = v4;
  unint64_t v5 = decompressECPublicKey((uint64_t)v8, (int **)&CTOidSECP256r1, (char *)v9, 65LL);
  if (!(_DWORD)v5)
  {
    BOOL v6 = ccsha1_di();
    ccdigest((uint64_t)v6, 0x41uLL, (char *)v9, a3);
  }

  return v5;
}

unint64_t CTConvertByteArrayToAsciiHex(unint64_t result, uint64_t a2, char *a3, uint64_t a4)
{
  if (!__CFADD__(result, a2))
  {
    if (a4 != 2 * a2) {
      return 393220LL;
    }
    if (!__CFADD__(a3, a4))
    {
      uint64_t v4 = 0LL;
      if (result + a2 > result)
      {
        unint64_t v5 = &a3[a4];
        if (&a3[a4] > a3)
        {
          BOOL v6 = (unsigned __int8 *)result;
          while ((unint64_t)v6 >= result)
          {
            unint64_t v7 = *v6;
            uint64_t v8 = &nibbleToAsciiByte[v7 >> 4];
            BOOL v9 = v8 < "Apple iPhone Certification Authority" && v8 >= nibbleToAsciiByte;
            char v10 = &nibbleToAsciiByte[v7 & 0xF];
            BOOL v11 = !v9 || v10 >= "Apple iPhone Certification Authority";
            if (v11 || v10 < nibbleToAsciiByte) {
              break;
            }
            char v13 = *v10;
            *a3 = *v8;
            unint64_t v14 = a3 + 1;
            uint64_t v4 = 0LL;
            char *v14 = v13;
            a3 = v14 + 1;
          }

          __break(0x5519u);
          goto LABEL_26;
        }
      }

      return v4;
    }
  }

unint64_t CTDecompressDate(unint64_t result, uint64_t *a2, unint64_t *a3)
{
  unsigned int v5 = *(unsigned __int8 *)result;
  if (v5 >= 0x32)
  {
    if (v5 != 50) {
      goto LABEL_9;
    }
    if (result != -1LL)
    {
      if (*(_BYTE *)(result + 1) != 48) {
        goto LABEL_9;
      }
      if (result <= 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_9:
        uint64_t v9 = 0LL;
        unint64_t v6 = 14LL;
        unint64_t v7 = 17LL;
        unint64_t v8 = 24LL;
        if (!a2) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
    }

unint64_t CTCompressGetCommonNameSuffixPointer(uint64_t a1)
{
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t result = compare_octet_string_partial((uint64_t)&MFi4RootName, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    unint64_t v4 = v7;
    if (v7 < 0xFFFFFFFFFFFFFFE6LL)
    {
      unint64_t v5 = v8;
      unint64_t result = v7 + 26;
      goto LABEL_11;
    }

uint64_t CTGetGeneralizedTime(uint64_t result, unint64_t a2)
{
  uint64_t v2 = (uint64_t **)result;
  uint64_t v3 = *(void *)(result + 8);
  if (v3 != 13)
  {
    if (v3 != 15) {
      return 720909LL;
    }
    unint64_t result = 0LL;
    unint64_t v4 = *v2;
    uint64_t v5 = *v4;
    *(void *)(a2 + 6) = *(uint64_t *)((char *)v4 + 6);
    *(void *)a2 = v5;
    return result;
  }

  if (a2 >= 0xFFFFFFFFFFFFFFFELL)
  {
    __break(0x5513u);
    goto LABEL_12;
  }

  uint64_t v6 = **(void **)result;
  *(_DWORD *)(a2 + 10) = *(_DWORD *)(*(void *)result + 8LL);
  *(void *)(a2 + 2) = v6;
  if (!*(void *)(result + 8))
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }

  if (**(unsigned __int8 **)result > 0x34u)
  {
    unint64_t result = 0LL;
    __int16 v7 = 14641;
  }

  else
  {
    unint64_t result = 0LL;
    __int16 v7 = 12338;
  }

  *(_WORD *)a2 = v7;
  return result;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName(a1 + 104, v4);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result) {
              return result;
            }
            uint64_t v3 = 0x1000000000LL;
          }

          else
          {
            uint64_t v3 = 0x800000000LL;
          }
        }

        else
        {
          uint64_t v3 = 0x400000000LL;
        }
      }

      else
      {
        uint64_t v3 = 8LL;
      }
    }

    else
    {
      uint64_t v3 = 3840LL;
    }

    *(void *)(a1 + 240) |= v3;
  }

  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

void *ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    return 0LL;
  }

  unint64_t v4 = *a1;
  int v6 = *v4;
  int v7 = *(int *)((char *)v4 + 3);
  if (v6 != -2127887098 || v7 != 587203713) {
    return 0LL;
  }
  return ccec_cp_521();
}

unint64_t compressECPublicKey(void *a1, int **a2, char *a3, uint64_t a4)
{
  int v7 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366LL;
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t v9 = *v7;
  if ((unint64_t)*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }

  uint64_t v10 = 24 * v9;
  BOOL v11 = __CFADD__(v10, 16LL);
  unint64_t v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0LL) {
LABEL_19:
  }
    __break(0x5500u);
  unint64_t result = __chkstk_darwin(v7);
  unint64_t v16 = (uint64_t *)((char *)&v19 - v14);
  unint64_t v17 = 0LL;
  do
  {
    __int128 v18 = &v16[v17 / 8];
    *__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16LL;
  }

  while (v14 != v17);
  if (v15 < 0x10) {
    goto LABEL_21;
  }
  *unint64_t v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }

  unint64_t result = ccec_import_pub(v8, a1[1], *a1, (char *)&v19 - v14);
  if (!(_DWORD)result)
  {
    unint64_t result = ccec_compressed_x962_export_pub_size(v8);
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub(v16, a3);
      }
      goto LABEL_20;
    }

    return 393220LL;
  }

  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, char *a3, uint64_t a4)
{
  int v7 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366LL;
  }
  uint64_t v8 = *v7;
  if ((unint64_t)*v7 >> 61 || !is_mul_ok(8 * v8, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v9 = 24 * v8;
  BOOL v10 = __CFADD__(v9, 16LL);
  unint64_t v11 = v9 + 16;
  if (v10 || v11 >= 0xFFFFFFFFFFFFFFF0LL)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }

  unint64_t result = __chkstk_darwin(v7);
  unint64_t v15 = (uint64_t *)((char *)&v19 - v13);
  unint64_t v16 = 0LL;
  do
  {
    unint64_t v17 = &v15[v16 / 8];
    *unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    v17[1] = 0xAAAAAAAAAAAAAAAALL;
    v16 += 16LL;
  }

  while (v13 != v16);
  if (v14 < 0x10) {
    goto LABEL_24;
  }
  uint64_t *v15 = result;
  if (v13 >= 1)
  {
    uint64_t v18 = ccec_compressed_x962_import_pub( (unint64_t *)result,  *(void *)(a1 + 8),  *(unsigned __int8 **)a1,  (unint64_t **)((char *)&v19 - v13));
    if (!(_DWORD)v18)
    {
      unint64_t result = cczp_bitlen(*v15);
      if (result < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v18 = 0LL;
          }
          else {
            uint64_t v18 = 393220LL;
          }
          ccec_export_pub(v15, a3);
          return v18;
        }

        goto LABEL_23;
      }

      goto LABEL_21;
    }

    return v18;
  }

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unsigned __int8 **a1, void *a2)
{
  unint64_t v16 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v16);
  if ((_DWORD)result)
  {
    uint64_t v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v14 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v5 = *a1;
    if (!__CFADD__(*a1, v16))
    {
      if (v5 > &v5[v16] || &v5[v16] > a1[1]) {
        goto LABEL_28;
      }
      uint64_t v13 = *a1;
      unint64_t v14 = &v5[v16];
      uint64_t result = ccder_blob_decode_tl(&v13, 6LL, &v15);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v7 = v15;
      uint64_t v8 = v13;
      if (a2)
      {
        if (v14 < v13 || v15 > v14 - v13) {
          goto LABEL_28;
        }
        *a2 = v13;
        a2[1] = v7;
      }

      if (!__CFADD__(v8, v7))
      {
        uint64_t v9 = &v8[v7];
        if (v9 == v14)
        {
          if (v9 <= a1[1] && *a1 <= v9)
          {
            *a1 = v9;
            return 1LL;
          }

uint64_t ccder_blob_decode_Time(unsigned __int8 **a1, void *a2)
{
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0LL;
  unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = (unint64_t)a1[1];
  unint64_t v11 = *a1;
  unint64_t v12 = v2;
  uint64_t result = ccder_blob_decode_tl(&v11, 23LL, &v13);
  if ((result & 1) != 0)
  {
    unint64_t v6 = v13;
    if (v13 != 13) {
      return 0LL;
    }
LABEL_8:
    uint64_t v9 = v11;
    if (a2)
    {
      *a2 = v11;
      a2[1] = v6;
    }

    if (__CFADD__(v9, v6))
    {
      __break(0x5513u);
      return result;
    }

    BOOL v10 = &v9[v6];
    if (v10 <= a1[1] && *a1 <= v10)
    {
      *a1 = v10;
      return 1LL;
    }

uint64_t ccder_blob_check_null(unsigned __int8 **a1)
{
  unint64_t v2 = 0LL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 5LL, &v2);
  if (v2) {
    return 0LL;
  }
  else {
    return result;
  }
}

uint64_t CTParseExtensionValue( unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unsigned __int8 **)v11, (uint64_t)v10, a3, a4);
  if (!(_DWORD)result)
  {
    uint64_t result = 720914LL;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0LL;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0LL;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unsigned __int8 **a2, const void *a3, size_t a4)
{
  unint64_t v70 = 0LL;
  unint64_t v71 = 0LL;
  size_t v68 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = (unint64_t)a2[1];
  uint64_t v10 = 720915LL;
  size_t v68 = *a2;
  unint64_t v69 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl(&v68, 0x2000000000000010LL, &v71);
  if (!(_DWORD)result) {
    return v10;
  }
  unint64_t v12 = v71;
  __int128 v13 = v68;
  __int128 v14 = (unsigned __int8 *)(v71 + v68 - v4);
  if (__CFADD__(v71, v68 - v4)) {
    goto LABEL_188;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v66 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  __int128 v15 = &v13[v12];
  unint64_t v66 = v13;
  unint64_t v67 = v15;
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  if (ccder_blob_decode_tl(&v64, 0xA000000000000000LL, &v70))
  {
    unint64_t v16 = v70;
    unint64_t v17 = v64;
    if (__CFADD__(v64, v70)) {
      goto LABEL_187;
    }
    uint64_t v18 = 720916LL;
    if (ccder_blob_decode_uint64(&v64, (unint64_t *)(a1 + 32)) && v64 == &v17[v16])
    {
      if (&v17[v16] > v65) {
        goto LABEL_186;
      }
      unint64_t v66 = &v17[v16];
      unint64_t v67 = v65;
      goto LABEL_14;
    }

    return v18;
  }

LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(unsigned __int8 **a1, int a2, BOOL *a3)
{
  __int128 v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = (unint64_t)a1[1];
  __int128 v13 = *a1;
  unint64_t v14 = v3;
  unint64_t v12 = 0LL;
  uint64_t result = ccder_blob_decode_tl(&v13, 1LL, &v12);
  if ((result & 1) != 0)
  {
    if (v12 == 1)
    {
      int v8 = v13;
      if ((unint64_t)v13 < v14)
      {
        int v9 = *v13;
        if (v9 != 255 && v9 != 0) {
          return 0LL;
        }
        if (a3) {
          *a3 = v9 != 0;
        }
        if (v8 == (unsigned __int8 *)-1LL)
        {
          __break(0x5513u);
          return result;
        }

        unint64_t v11 = v8 + 1;
        if (v11 <= a1[1] && *a1 <= v11)
        {
          *a1 = v11;
          return 1LL;
        }
      }

uint64_t X509ExtensionParseKeyUsage(uint64_t a1, _BYTE *a2)
{
  unint64_t v6 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = 0LL;
  uint64_t result = ccder_blob_decode_bitstring((unsigned __int8 **)a1, (uint64_t)&v6, &v5);
  if ((_DWORD)result)
  {
    if (v7 != *(void *)(a1 + 8) || v6 == (_BYTE *)v7 || v5 > 8)
    {
      return 0LL;
    }

    else if ((unint64_t)v6 >= v7)
    {
      __break(0x5519u);
    }

    else
    {
      *a2 = *v6 & (-1 << (8 - v5));
      return 1LL;
    }
  }

  return result;
}

uint64_t X509ExtensionParseBasicConstraints(unsigned __int8 **a1, unint64_t *a2, BOOL *a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v11);
  if ((_DWORD)result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_uint64(a1, &v10);
      if ((_DWORD)result)
      {
        if (!*a3) {
          return 0LL;
        }
        unint64_t v7 = v10;
        *a2 = v10;
        BOOL v8 = __CFADD__(v7, 1LL);
        unint64_t v9 = v7 + 1;
        if (v8)
        {
          __break(0x5500u);
          return result;
        }

        *a2 = v9;
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unsigned __int8 **a1, void *a2, unint64_t *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v14);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_15;
    }
    if (&v7[v14] != a1[1]) {
      return 0LL;
    }
    unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > &v7[v14]) {
      goto LABEL_16;
    }
    unint64_t v11 = v7;
    unint64_t v12 = (unint64_t)&v7[v14];
    uint64_t result = ccder_blob_decode_tl(&v11, 0x8000000000000000LL, &v13);
    if ((_DWORD)result)
    {
      unint64_t v8 = v13;
      *a2 = v11;
      *a3 = v8;
    }

    unint64_t v9 = *a1;
    if (__CFADD__(*a1, v14))
    {
LABEL_15:
      __break(0x5513u);
    }

    else
    {
      unint64_t v10 = &v9[v14];
      if (v9 <= &v9[v14] && v10 <= a1[1])
      {
        *a1 = v10;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseSubjectKeyIdentifier( unsigned __int8 **a1, unsigned __int8 **a2, unint64_t *a3)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v17);
  if ((_DWORD)result)
  {
    unint64_t v7 = a1[1];
    unint64_t v8 = v17;
    BOOL v10 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (v10)
    {
      BOOL v10 = v17 >= v9;
      BOOL v11 = v17 == v9;
    }

    else
    {
      BOOL v10 = 1;
      BOOL v11 = 0;
    }

    if (!v11 && v10) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = v8;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v8))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v13 = &v12[v8];
    unint64_t v14 = a1[1];
    if (v12 <= v13)
    {
      BOOL v15 = v13 >= v14;
      BOOL v16 = v13 == v14;
    }

    else
    {
      BOOL v15 = 1;
      BOOL v16 = 0;
    }

    if (!v16 && v15) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v13;
  }

  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unsigned __int8 **a1, void *a2, unint64_t *a3)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v15);
  uint64_t result = 0LL;
  if (v6 && v15)
  {
    unint64_t v12 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = (unint64_t)a1[1];
    unint64_t v12 = *a1;
    unint64_t v13 = v8;
    uint64_t result = ccder_blob_decode_tl(&v12, 6LL, &v14);
    if (!(_DWORD)result) {
      return result;
    }
    unint64_t v9 = v14;
    *a2 = v12;
    *a3 = v9;
    BOOL v10 = *a1;
    if (__CFADD__(*a1, v15))
    {
      __break(0x5513u);
      return result;
    }

    BOOL v11 = &v10[v15];
    if (v10 > &v10[v15] || v11 > a1[1]) {
LABEL_12:
    }
      __break(0x5519u);
    *a1 = v11;
  }

  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unsigned __int8 **a1, unsigned __int8 **a2, unint64_t *a3)
{
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v15);
  unint64_t v7 = v15;
  if (v15) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 0LL;
  }
  if ((_DWORD)result == 1)
  {
    unint64_t v8 = a1[1];
    BOOL v9 = v8 >= *a1;
    unint64_t v10 = v8 - *a1;
    if (!v9 || v15 > v10) {
      goto LABEL_16;
    }
    *a2 = *a1;
    *a3 = v7;
    unint64_t v12 = *a1;
    if (__CFADD__(*a1, v7))
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v13 = &v12[v7];
    if (v12 > v13 || v13 > a1[1]) {
LABEL_16:
    }
      __break(0x5519u);
    *a1 = v13;
  }

  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0LL;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16LL * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16LL * v6);
    if (!(_DWORD)result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16LL * a3);
      void *v10 = *v5;
      v10[1] = v9;
      return 1LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension( uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, int a6)
{
  if (a6) {
    a5 = 0LL;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_261;
    }

LABEL_265:
          __break(0x5519u);
          return result;
        }

        goto LABEL_232;
      }

      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 0x8004000000LL;
    }

LABEL_201:
    uint64_t v24 = v54 | v55;
    goto LABEL_261;
  }

  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      unint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0LL;
      goto LABEL_201;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_203;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315) {
      return X509ExtensionParseMFISWAuth((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304) {
      return X509ExtensionParseGenericSSLMarker(result, a4, a5);
    }
    int v44 = 1;
    goto LABEL_158;
  }

  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_232;
    }
    goto LABEL_157;
  }

  if (*(void *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1) {
    return X509ExtensionParseComponentAuth((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
  }
  if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44) {
      return X509ExtensionParseCertifiedChipIntermediate((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36) {
      return X509ExtensionParseMFIAuthv3Leaf((unsigned __int8 **)result, a4, (unsigned __int8 **)a5);
    }
    if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(void *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x8000000000LL;
        goto LABEL_261;
      }

      if (*(void *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x2000000;
        }

        else
        {
          if (*(void *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(void *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3) {
              return X509ExtensionParseDeviceAttestationIdentity((unsigned __int8 **)result, a4, a5);
            }
            goto LABEL_232;
          }

          uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x4000000;
        }

LABEL_261:
        *a4 = v24;
        return 1LL;
      }

      *a4 |= 0x1000000uLL;
LABEL_232:
      uint64_t v52 = *(unsigned __int8 **)result;
      unint64_t v51 = *(void *)(result + 8);
      goto LABEL_233;
    }

    uint64_t result = ccder_blob_check_null((unsigned __int8 **)result);
    if (!(_DWORD)result) {
      return result;
    }
    unint64_t v54 = *a4;
    uint64_t v55 = 1048584LL;
    goto LABEL_201;
  }

  BOOL v56 = 0;
  uint64_t result = der_get_BOOLean((unsigned __int8 **)result, 0, &v56);
  if ((_DWORD)result)
  {
    uint64_t v53 = 0x10000080002LL;
    if (!v56) {
      uint64_t v53 = 0x20000040001LL;
    }
    *a4 |= v53;
  }

  return result;
}

uint64_t X509CertificateParseWithExtension(unsigned __int8 **a1, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939LL;
  uint64_t v9 = *(unsigned __int8 **)a2;
  unint64_t v10 = *(void *)(a2 + 8);
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v11 = *(unsigned __int8 **)a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, (unsigned __int8 **)a2, a3, a4);
  uint64_t v8 = result;
  if ((_DWORD)result) {
    return v8;
  }
  if (__CFADD__(v11, v14))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }

  uint64_t v8 = 720939LL;
  unint64_t v13 = (unsigned __int8 *)(v14 + v11 - v9);
  if (__CFADD__(v14, v11 - v9)) {
    goto LABEL_11;
  }
  if (v10 >= (unint64_t)v9 && (unint64_t)v13 <= v10 - (unint64_t)v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0LL;
  }

uint64_t X509CertificateParse(unsigned __int8 **a1, uint64_t a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0LL, 0LL);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, void *a2, unsigned __int8 **a3, void *a4)
{
  unint64_t v21 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
LABEL_38:
  }
    __break(0x5513u);
  unsigned __int8 v6 = (unsigned __int8 *)(v4 + v5);
  uint64_t v10 = 655361LL;
  unint64_t v21 = (unsigned __int8 *)*a1;
  uint64_t v22 = v6;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v18 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v19 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v21, v20)) {
    goto LABEL_38;
  }
  if (v21 > &v21[v20] || &v21[v20] > v22) {
    goto LABEL_37;
  }
  uint64_t v18 = v21;
  uint64_t v19 = &v21[v20];
  unint64_t v11 = v20;
  unint64_t v12 = v18;
  if (!a2) {
    goto LABEL_13;
  }
  if (v19 < v18 || v20 > v19 - v18)
  {
LABEL_37:
    __break(0x5519u);
    goto LABEL_38;
  }

  *a2 = v18;
  a2[1] = v11;
LABEL_13:
  if (__CFADD__(v12, v11)) {
    goto LABEL_38;
  }
  unint64_t v13 = &v12[v11];
  if (v12 > &v12[v11]) {
    goto LABEL_37;
  }
  unint64_t v14 = v19;
  if (v13 > v19) {
    goto LABEL_37;
  }
  uint64_t v18 = v13;
  if (v13 == v19)
  {
    if (a3)
    {
      *a3 = 0LL;
      a3[1] = 0LL;
    }
  }

  else if (a3)
  {
    *a3 = v13;
    a3[1] = (unsigned __int8 *)(v14 - v13);
  }

  if (v14 > v22 || v21 > v14) {
    goto LABEL_37;
  }
  unint64_t v21 = v14;
  uint64_t v19 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0LL;
  uint64_t v18 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_bitstring(&v21, (uint64_t)&v18, &v17);
  if (!(_DWORD)result) {
    return 655364LL;
  }
  if (!v17)
  {
    *a4 = 0LL;
    a4[1] = 0LL;
LABEL_33:
    if (v21 == v22) {
      return 0LL;
    }
    else {
      return 655365LL;
    }
  }

  if (v17 < 0xFFFFFFFFFFFFFFF9LL)
  {
    if (v19 >= v18)
    {
      unint64_t v16 = (v17 + 7) >> 3;
      if (v16 <= v19 - v18)
      {
        *a4 = v18;
        a4[1] = v16;
        goto LABEL_33;
      }
    }

    goto LABEL_37;
  }

  __break(0x5500u);
  return result;
}

uint64_t X509CertificateSubjectNameGetCommonName(uint64_t a1, void *a2)
{
  unint64_t v2 = *(unsigned __int8 **)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  unint64_t v25 = v3;
  uint64_t v23 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v2, v3)) {
    goto LABEL_62;
  }
  unint64_t v4 = &v2[v3];
  if (v2 > v4)
  {
LABEL_61:
    __break(0x5519u);
    goto LABEL_62;
  }

  uint64_t v6 = 720901LL;
  uint64_t v23 = v2;
  unint64_t v24 = (unint64_t)v4;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (v2 < v4)
  {
    while (1)
    {
      unint64_t v21 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      uint64_t v22 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v2 = v23;
      if (__CFADD__(v23, v25)) {
        break;
      }
      unint64_t v7 = &v23[v25];
      unint64_t v21 = v23;
      uint64_t v22 = &v23[v25];
      while (v2 < v7)
      {
        uint64_t v19 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v20 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v21, v25)) {
          goto LABEL_62;
        }
        if (v21 > &v21[v25] || &v21[v25] > v22) {
          goto LABEL_61;
        }
        uint64_t v19 = v21;
        unint64_t v20 = &v21[v25];
        uint64_t v10 = v19;
        unint64_t v2 = v20;
        if (v19 > v20 || v25 > v20 - v19) {
          goto LABEL_61;
        }
        if (__CFADD__(v19, v25)) {
          goto LABEL_62;
        }
        unint64_t v11 = &v19[v25];
        if (v19 > &v19[v25] || v11 > v20) {
          goto LABEL_61;
        }
        v19 += v25;
        if (v25 == 3)
        {
          int v12 = *(unsigned __int16 *)v10;
          int v13 = v10[2];
          if (v12 == 1109 && v13 == 3)
          {
            unint64_t v17 = v11;
            unint64_t v18 = (unint64_t)v20;
            if ((ccder_blob_decode_tl(&v17, 12LL, &v25) & 1) == 0)
            {
              if (v19 > v20) {
                goto LABEL_61;
              }
              unint64_t v17 = v19;
              unint64_t v18 = (unint64_t)v20;
              if ((ccder_blob_decode_tl(&v17, 19LL, &v25) & 1) == 0)
              {
                if (v19 > v20) {
                  goto LABEL_61;
                }
                unint64_t v17 = v19;
                unint64_t v18 = (unint64_t)v20;
              }
            }

            unint64_t v15 = v25;
            if (!v25) {
              return v6;
            }
            if (__CFADD__(v17, v25)) {
              goto LABEL_62;
            }
            unint64_t v2 = &v17[v25];
            if (v20 != &v17[v25]) {
              return 720902LL;
            }
            *a2 = v17;
            a2[1] = v15;
          }
        }

        unint64_t v7 = v22;
        if (v2 > v22 || v21 > v2) {
          goto LABEL_61;
        }
        unint64_t v21 = v2;
      }

      if (v2 != v7) {
        return 720903LL;
      }
      unint64_t v4 = (unsigned __int8 *)v24;
      uint64_t v23 = v2;
    }

uint64_t X509CertificateParseValidity(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = 720906LL;
  if (!result) {
    return v3;
  }
  unint64_t v4 = *(void *)(result + 72);
  uint64_t v5 = *(void *)(result + 80);
  if (!v4 || v5 == 0) {
    return v3;
  }
  if (__CFADD__(v4, v5))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v7 = (unsigned __int8 *)(v4 + v5);
    if (v4 <= (unint64_t)v7)
    {
      v9[0] = *(unsigned __int8 **)(result + 72);
      v9[1] = v7;
      return 720908LL;
    }
  }

  __break(0x5519u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unsigned __int8 **a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v14 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  unint64_t v14 = *a1;
  unint64_t v15 = v3;
  unint64_t v13 = v3 - (void)v4;
  if ((ccder_blob_decode_tl(&v14, 22LL, &v13) & 1) != 0) {
    goto LABEL_5;
  }
  unint64_t v8 = (unint64_t)a1[1];
  unint64_t v14 = *a1;
  unint64_t v15 = v8;
  if (ccder_blob_decode_tl(&v14, 12LL, &v13))
  {
LABEL_5:
    uint64_t v10 = v14;
    uint64_t v9 = (unsigned __int8 *)v15;
    *a1 = v14;
    a1[1] = v9;
    unint64_t v11 = v13;
  }

  else
  {
    uint64_t v10 = *a1;
    uint64_t v9 = a1[1];
    unint64_t v11 = v9 - *a1;
    unint64_t v13 = v11;
  }

  if (__CFADD__(v10, v11)) {
    goto LABEL_20;
  }
  if (v9 == &v10[v11])
  {
    if (!v11) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v10 <= v9)
      {
        *a1 = v9;
        return v9 == &v10[v11];
      }

      goto LABEL_19;
    }

    if (v10 <= v9 && v11 <= v9 - v10)
    {
      *a3 = v10;
      a3[1] = (unsigned __int8 *)v11;
      goto LABEL_15;
    }

uint64_t X509ExtensionParseCertifiedChipIntermediate( unsigned __int8 **a1, unint64_t *a2, unsigned __int8 **a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 22LL, &v16);
  if ((_DWORD)result)
  {
    unint64_t v7 = v16;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v16))
    {
      __break(0x5513u);
      goto LABEL_34;
    }

    uint64_t v9 = &v8[v16];
    if (a1[1] != &v8[v16]) {
      return 0LL;
    }
    unint64_t v10 = *a2;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v8 > v9) {
        goto LABEL_34;
      }
      *a3 = v8;
      a3[1] = (unsigned __int8 *)v7;
    }

    if (v7 == 4)
    {
      if (*(_DWORD *)v8 != 1953653621) {
        goto LABEL_30;
      }
      unint64_t v13 = 0x30001000000LL;
    }

    else
    {
      if (v7 == 17)
      {
        if (*(void *)v8 != 0x207372656B6E6F59LL || *((void *)v8 + 1) != 0x726F74636146202DLL || v8[16] != 121)
        {
LABEL_30:
          if (v8 <= v9)
          {
            *a1 = v9;
            return 1LL;
          }

uint64_t X509ExtensionParseMFIAuthv3Leaf(unsigned __int8 **a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v9);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v9))
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v8 = a1[1];
      if (v8 != &v7[v9]) {
        return 0LL;
      }
      if (v9 == 32)
      {
        if (a3)
        {
          *a3 = v7;
          a3[1] = (unsigned __int8 *)32;
        }

        *a2 |= 4uLL;
      }

      if (v7 <= v8)
      {
        *a1 = v8;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseMFISWAuth(unsigned __int8 **a1, void *a2, unsigned __int8 **a3)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 4LL, &v10);
  if ((_DWORD)result)
  {
    unint64_t v7 = v10;
    unint64_t v8 = *a1;
    if (__CFADD__(*a1, v10))
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v9 = a1[1];
      if (v9 != &v8[v10]) {
        return 0LL;
      }
      if (v10)
      {
        if (a3)
        {
          if (v9 < v8 || v10 > v9 - v8) {
            goto LABEL_15;
          }
          *a3 = v8;
          a3[1] = (unsigned __int8 *)v7;
        }

        *a2 |= 0x30000000uLL;
      }

      if (v8 <= v9)
      {
        *a1 = v9;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseGenericSSLMarker(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v17 = 0LL;
  int v6 = ccder_blob_decode_tl((unsigned __int8 **)a1, 12LL, &v17);
  uint64_t result = 0LL;
  if (v6)
  {
    unint64_t v8 = v17;
    if (v17 >= 0x19)
    {
      unint64_t v9 = *(void *)a1;
      BOOL v10 = **(void **)a1 == 0x2E3034382E322E31LL && *(void *)(*(void *)a1 + 8LL) == 0x312E353336333131LL;
      unint64_t v11 = 0x2E37322E362E3030LL;
      if (!v10 || *(void *)(*(void *)a1 + 16LL) != 0x2E37322E362E3030LL) {
        return 0LL;
      }
      if (v9 < 0xFFFFFFFFFFFFFFE8LL)
      {
        unint64_t v13 = v9 + 24;
        if (v9 >= v9 + 24) {
          goto LABEL_21;
        }
        unint64_t v11 = *(void *)(a1 + 8);
        if (v13 > v11) {
          goto LABEL_21;
        }
        unint64_t v14 = (unsigned __int8 *)(v9 + 24);
        do
        {
          BOOL v15 = v14 > v14 + 1;
          ++v14;
        }

        while (!v15);
        while (1)
        {
LABEL_21:
          __break(0x5519u);
LABEL_22:
          if (!a3) {
            goto LABEL_26;
          }
          unint64_t v16 = v8 - 24;
          if (v8 < 0x18) {
            goto LABEL_31;
          }
          if (v16 <= v11 - v13)
          {
            *a3 = v13;
            a3[1] = v16;
LABEL_26:
            unint64_t v13 = *a2 | 0x200000000LL;
            *a2 = v13;
            if (__CFADD__(v9, v8)) {
              break;
            }
            v8 += v9;
            if (v9 <= v8 && v8 <= v11)
            {
              *(void *)a1 = v8;
              return 1LL;
            }
          }
        }
      }

      __break(0x5513u);
LABEL_31:
      __break(0x5515u);
    }
  }

  return result;
}

uint64_t X509ExtensionParseServerAuthMarker( unsigned __int8 **a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null(a1);
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6LL) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1LL) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    uint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0LL;
      }
    }

    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }

    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1LL;
      }

      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }

      goto LABEL_25;
    }

    return 0LL;
  }

  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unsigned __int8 **a1, void *a2, void *a3)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = ccder_blob_decode_tl(a1, 0x2000000000000010LL, &v14);
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (__CFADD__(*a1, v14)) {
      goto LABEL_17;
    }
    if (a1[1] != &v7[v14]) {
      return 0LL;
    }
    unint64_t v11 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > &v7[v14]) {
      goto LABEL_18;
    }
    unint64_t v11 = v7;
    unint64_t v12 = (unint64_t)&v7[v14];
    uint64_t result = ccder_blob_decode_tl(&v11, 0xA000000000000002LL, &v13);
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_tl(&v11, 4LL, &v13);
      if ((_DWORD)result)
      {
        if (a3)
        {
          unint64_t v8 = v13;
          *a3 = v11;
          a3[1] = v8;
        }

        *a2 |= 0x240000800000uLL;
        unint64_t v9 = *a1;
        if (!__CFADD__(*a1, v14))
        {
          unint64_t v10 = &v9[v14];
          if (v9 <= &v9[v14] && v10 <= a1[1])
          {
            *a1 = v10;
            return 1LL;
          }

unint64_t *X509ExtensionParseMFI4Properties( unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }

    *a3 = v4;
    a3[1] = 32LL;
  }

  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0LL)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }

    goto LABEL_12;
  }

uint64_t *ccaes_ccm_decrypt_mode()
{
  unint64_t v0 = (*((void *)ccaes_ecb_encrypt_mode() + 1) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v1 = v0 + ((*(void *)ccaes_ecb_encrypt_mode() + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 8;
  unint64_t v2 = ccaes_ecb_encrypt_mode();
  ccm_decrypt_info = v1;
  qword_10021C0D0 = (uint64_t)ccmode_ccm_init;
  unk_10021C0D8 = ccmode_ccm_set_iv;
  qword_10021C0E0 = (uint64_t)ccmode_ccm_cbcmac;
  unk_10021C0E8 = ccaes_vng_ccm_decrypt_wrapper;
  unk_10021C0C0 = xmmword_10019F8F0;
  qword_10021C0F0 = (uint64_t)ccmode_ccm_finalize;
  unk_10021C0F8 = ccmode_ccm_reset;
  qword_10021C100 = (uint64_t)v2;
  unk_10021C108 = 0LL;
  return &ccm_decrypt_info;
}

uint64_t ccder_blob_decode_bitstring(unsigned __int8 **a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_range(a1, 3LL, (unsigned __int8 **)a2);
  if ((_DWORD)result)
  {
    *a3 = 0LL;
    unint64_t v6 = *(unsigned __int8 **)a2;
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7 != *(void *)a2)
    {
      unint64_t v8 = 8 * (~(unint64_t)v6 + v7);
      unint64_t v9 = *v6;
      BOOL v10 = v8 >= v9;
      unint64_t v11 = v8 - v9;
      if (v10) {
        *a3 = v11;
      }
      *(void *)a2 = v6 + 1;
    }
  }

  return result;
}

uint64_t cccmac_one_shot_generate_internal( void *a1, unint64_t a2, uint64_t a3, unint64_t a4, char *a5, size_t a6, void *a7)
{
  unint64_t v14 = &v18 - 10 * ((a1[1] + *a1 + 159LL) / 0x50uLL);
  bzero(v14, 80 * ((a1[1] + *a1 + 159LL) / 0x50uLL));
  uint64_t inited = cccmac_init_internal(a1, (uint64_t)v14, a2, a3);
  if (!(_DWORD)inited)
  {
    uint64_t inited = cccmac_update_internal(v14, a4, a5);
    if (!(_DWORD)inited) {
      uint64_t inited = cccmac_final_generate_internal((char *)v14, a6, a7);
    }
  }

  uint64_t v16 = inited;
  cc_clear(a1[1] + *a1 + 80LL, v14);
  return v16;
}

uint64_t ccaes_arm_encrypt_cbc(uint64_t result, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5)
{
  if (a3)
  {
    uint64_t v5 = *(unsigned int *)(result + 240);
    if ((_DWORD)v5 == 160 || (_DWORD)v5 == 192 || (_DWORD)v5 == 224)
    {
      do
      {
        uint64_t v6 = v5 - 16;
        a4 += 16LL;
        _Q2 = *(int8x16_t *)result;
        uint64_t v7 = (int8x16_t *)(result + 16);
        do
        {
          __asm
          {
            AESE            V0.16B, V2.16B
            AESMC           V0.16B, V0.16B
          }

          _Q2 = *v7++;
          BOOL v15 = v6 <= 16;
          v6 -= 16LL;
        }

        while (!v15);
        __asm { AESE            V0.16B, V2.16B }

        int8x16_t v17 = veorq_s8(_Q0, *v7);
        uint64_t result = (uint64_t)v7->i64 - v5;
        *a5++ = v17;
        BOOL v15 = a3-- <= 1;
      }

      while (!v15);
      uint64_t result = 0LL;
      *a2 = v17;
    }

    else
    {
      return -1LL;
    }
  }

  return result;
}

uint64_t ccentropy_rng_init(void *a1, uint64_t a2)
{
  BOOL v5 = timingsafe_enable_if_supported();
  *a1 = &entropy_rng_info;
  a1[1] = a2;
  cc_disable_dit_with_sb((unsigned int *)&v5);
  return 0LL;
}

uint64_t ccentropy_rng_get_seed(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

BOOL ccder_blob_encode_body(void *a1, unint64_t a2, const void *a3)
{
  if (!a3) {
    return a2 == 0;
  }
  __dst[0] = 0LL;
  __dst[1] = 0LL;
  BOOL v5 = ccder_blob_reserve(a1, a2, __dst);
  if (v5) {
    memmove(__dst[0], a3, a2);
  }
  return v5;
}

uint64_t aes_key_expansion(unint64_t *a1, uint64_t a2, int a3, int a4)
{
  unint64_t v4 = &Rcon;
  *(_DWORD *)(a2 + 240) = 16 * a4;
  if (a3 == 6)
  {
    unint64_t v15 = *a1;
    unint64_t v16 = a1[1];
    unint64_t v14 = (uint64_t *)(a1 + 2);
    *(void *)a2 = v15;
    *(void *)(a2 + 8) = v16;
    int8x16_t v17 = (uint64_t *)(a2 + 16);
    uint64_t v18 = *v14;
    *int8x16_t v17 = *v14;
    uint64_t v19 = (unint64_t *)(v17 + 1);
    int v20 = 4 * a4 - 2;
    do
    {
      HIDWORD(v21) = HIDWORD(v18);
      LODWORD(v21) = HIDWORD(v18);
      unsigned int v22 = *v4++;
      uint64_t result = v22;
      uint64_t v23 = (AESSubBytesWordTable[BYTE5(v18)] | (AESSubBytesWordTable[(v21 >> 8) >> 24] << 24) | (AESSubBytesWordTable[((v21 >> 8) >> 16)] << 16) | (AESSubBytesWordTable[(unsigned __int16)(HIDWORD(v18) >> 8) >> 8] << 8)) ^ v22;
      v15 ^= v23 ^ ((v15 ^ v23) << 32);
      v16 ^= HIDWORD(v15) ^ ((v16 ^ HIDWORD(v15)) << 32);
      v18 ^= HIDWORD(v16) ^ ((v18 ^ HIDWORD(v16)) << 32);
      *uint64_t v19 = v15;
      v19[1] = v16;
      unint64_t v24 = v19 + 2;
      *unint64_t v24 = v18;
      uint64_t v19 = v24 + 1;
      BOOL v13 = __OFSUB__(v20, 6);
      v20 -= 6;
    }

    while (!((v20 < 0) ^ v13 | (v20 == 0)));
  }

  else if (a3 == 8)
  {
    unint64_t v26 = *a1;
    unint64_t v27 = a1[1];
    unint64_t v25 = a1 + 2;
    *(void *)a2 = v26;
    *(void *)(a2 + 8) = v27;
    unint64_t v28 = (unint64_t *)(a2 + 16);
    unint64_t v29 = *v25;
    unint64_t v30 = v25[1];
    unint64_t *v28 = *v25;
    v28[1] = v30;
    __int128 v31 = v28 + 2;
    int v32 = 4 * a4 - 4;
    do
    {
      HIDWORD(v33) = HIDWORD(v30);
      LODWORD(v33) = HIDWORD(v30);
      unsigned int v34 = *v4++;
      uint64_t result = v34;
      uint64_t v35 = (AESSubBytesWordTable[BYTE5(v30)] | (AESSubBytesWordTable[(v33 >> 8) >> 24] << 24) | (AESSubBytesWordTable[((v33 >> 8) >> 16)] << 16) | (AESSubBytesWordTable[(unsigned __int16)(HIDWORD(v30) >> 8) >> 8] << 8)) ^ v34;
      v26 ^= v35 ^ ((v26 ^ v35) << 32);
      v27 ^= HIDWORD(v26) ^ ((v27 ^ HIDWORD(v26)) << 32);
      *__int128 v31 = v26;
      v31[1] = v27;
      unint64_t v36 = v31 + 2;
      int v37 = v32 - 4;
      if (!v37) {
        break;
      }
      uint64_t result = AESSubBytesWordTable[HIBYTE(HIDWORD(v27))];
      uint64_t v38 = AESSubBytesWordTable[BYTE4(v27)] | ((_DWORD)result << 24) | (AESSubBytesWordTable[BYTE6(v27)] << 16) | (AESSubBytesWordTable[BYTE5(v27)] << 8);
      v29 ^= v38 ^ ((v29 ^ v38) << 32);
      v30 ^= HIDWORD(v29) ^ ((v30 ^ HIDWORD(v29)) << 32);
      *unint64_t v36 = v29;
      v36[1] = v30;
      __int128 v31 = v36 + 2;
      BOOL v13 = __OFSUB__(v37, 4);
      int v32 = v37 - 4;
    }

    while (!((v32 < 0) ^ v13 | (v32 == 0)));
  }

  else
  {
    unint64_t v5 = *a1;
    unint64_t v6 = a1[1];
    *(void *)a2 = *a1;
    *(void *)(a2 + 8) = v6;
    uint64_t v7 = (unint64_t *)(a2 + 16);
    int v8 = 4 * a4;
    do
    {
      HIDWORD(v9) = HIDWORD(v6);
      LODWORD(v9) = HIDWORD(v6);
      unsigned int v11 = *v4++;
      uint64_t result = v11;
      uint64_t v12 = (AESSubBytesWordTable[BYTE5(v6)] | (AESSubBytesWordTable[(v9 >> 8) >> 24] << 24) | (AESSubBytesWordTable[((v9 >> 8) >> 16)] << 16) | (AESSubBytesWordTable[(unsigned __int16)(HIDWORD(v6) >> 8) >> 8] << 8)) ^ v11;
      v5 ^= v12 ^ ((v5 ^ v12) << 32);
      v6 ^= HIDWORD(v5) ^ ((v6 ^ HIDWORD(v5)) << 32);
      unint64_t *v7 = v5;
      v7[1] = v6;
      v7 += 2;
      BOOL v13 = __OFSUB__(v8, 4);
      v8 -= 4;
    }

    while (!((v8 < 0) ^ v13 | (v8 == 0)));
  }

  return result;
}

uint64_t ccaes_arm_encrypt_key128(unint64_t *a1, uint64_t a2)
{
  return aes_key_expansion(a1, a2, 4, 10);
}

uint64_t ccaes_arm_encrypt_key192(unint64_t *a1, uint64_t a2)
{
  return aes_key_expansion(a1, a2, 6, 12);
}

uint64_t ccaes_arm_encrypt_key256(unint64_t *a1, uint64_t a2)
{
  return aes_key_expansion(a1, a2, 8, 14);
}

__n128 aes_dkey_expansion(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  unint64_t v4 = (__n128 *)(a2 + 16);
  uint64_t v5 = a4 - 1;
  do
  {
    --v5;
    _Q0 = *v4;
    __asm { AESIMC          V0.16B, V0.16B }

    *v4++ = result;
  }

  while (!(_NF ^ _VF | _ZF));
  return result;
}

double ccaes_arm_decrypt_key128(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = aes_dkey_expansion(a1, a2, 4, 10LL).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key192(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = aes_dkey_expansion(a1, a2, 6, 12LL).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key256(unint64_t *a1, uint64_t a2)
{
  *(void *)&double result = aes_dkey_expansion(a1, a2, 8, 14LL).n128_u64[0];
  return result;
}

uint64_t ccaes_arm_encrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_encrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_encrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_encrypt_key256(a4, v6);
      break;
    default:
      return -1LL;
  }

  return 0LL;
}

uint64_t ccaes_arm_decrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a3;
  if (a3 > 32) {
    unint64_t v8 = (unint64_t)a3 >> 3;
  }
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_decrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_decrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_decrypt_key256(a4, v6);
      break;
    default:
      return -1LL;
  }

  return 0LL;
}

uint64_t *ccaes_ccm_encrypt_mode()
{
  unint64_t v0 = (*((void *)ccaes_ecb_encrypt_mode() + 1) + 7LL) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v1 = v0 + ((*(void *)ccaes_ecb_encrypt_mode() + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 8;
  unint64_t v2 = ccaes_ecb_encrypt_mode();
  ccm_encrypt_info = v1;
  unk_10021C118 = xmmword_10019F8F0;
  qword_10021C128 = (uint64_t)ccmode_ccm_init;
  unk_10021C130 = ccmode_ccm_set_iv;
  qword_10021C138 = (uint64_t)ccmode_ccm_cbcmac;
  unk_10021C140 = ccaes_vng_ccm_encrypt_wrapper;
  qword_10021C148 = (uint64_t)ccmode_ccm_finalize;
  unk_10021C150 = ccmode_ccm_reset;
  qword_10021C158 = (uint64_t)v2;
  byte_10021C160 = 1;
  *(_DWORD *)algn_10021C161 = 0;
  dword_10021C164 = 0;
  return &ccm_encrypt_info;
}

uint64_t *ccrng_prng(_DWORD *a1)
{
  BOOL v3 = timingsafe_enable_if_supported();
  pthread_once(&ccrng_prng_init_pred, (void (*)(void))init);
  if (a1) {
    *a1 = 0;
  }
  cc_disable_dit_with_sb((unsigned int *)&v3);
  return &rng_ctx;
}

uint64_t init()
{
  if (ccrng_process_init( (uint64_t)&process_rng_ctx,  get_time_nsec,  (uint64_t (**)(void, uint64_t, _OWORD *))&ccrng_getentropy)) {
    cc_abort();
  }
  uint64_t result = pthread_atfork((void (*)(void))atfork_prepare, (void (*)(void))atfork_parent, (void (*)(void))atfork_child);
  if ((_DWORD)result) {
    cc_abort();
  }
  rng_ctx = (uint64_t)generate;
  return result;
}

uint64_t *ccrng(_DWORD *a1)
{
  return &rng_ctx;
}

uint64_t get_time_nsec()
{
  v1.tv_sec = 0LL;
  v1.tv_nsec = 0LL;
  if (clock_gettime(_CLOCK_MONOTONIC, &v1)) {
    cc_abort();
  }
  return v1.tv_nsec + 1000000000 * v1.tv_sec;
}

uint64_t atfork_prepare()
{
  uint64_t result = ccrng_process_atfork_prepare((os_unfair_lock_s *)&process_rng_ctx);
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t atfork_parent()
{
  uint64_t result = ccrng_process_atfork_parent((os_unfair_lock_s *)&process_rng_ctx);
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t atfork_child()
{
  uint64_t result = ccrng_process_atfork_child((uint64_t)&process_rng_ctx);
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t generate()
{
  uint64_t result = process_rng_ctx();
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

uint64_t ccaes_arm_encrypt_key_with_length_check(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289LL;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }

  return 4294967289LL;
}

uint64_t ccec_mult_blinded_ws( uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v10 = *a2;
  unint64_t v11 = ccn_bitlen_internal(*a2, a4);
  uint64_t v17 = 1LL;
  if (a6)
  {
    uint64_t result = (*a6)(a6, 8LL, &v17);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v13 = v17 | 0x80000000LL;
  }

  else
  {
    uint64_t v13 = 2147483649LL;
  }

  uint64_t v17 = v13;
  uint64_t v14 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v10);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v10);
  ccn_mux_seed_mask(v17);
  uint64_t v17 = v17;
  uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    uint64_t v16 = 0LL;
    ccn_divmod_ws(a1, v10, a4, v10, v15, 1LL, (char *)&v16, (uint64_t)&v17);
    cczp_bitlen((uint64_t)a2);
    uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
    if (!(_DWORD)result)
    {
      uint64_t result = ccec_mult_ws(a1, (uint64_t)a2);
      if (!(_DWORD)result)
      {
        ccec_full_add_ws(a1, (uint64_t)a2);
        uint64_t result = 0LL;
      }
    }
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccaes_arm_encrypt_key_with_key_length_check( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192) {
      return 4294967289LL;
    }
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }

  return 4294967289LL;
}

uint64_t ccecdh_compute_shared_secret_ws( uint64_t a1, unint64_t **a2, unint64_t **a3, unint64_t *a4, char *a5, uint64_t (**a6)(void, uint64_t, uint64_t *))
{
  unint64_t v11 = *a2;
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v12 = 3 * **a2;
  uint64_t v13 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v15 = *a4;
  *a4 = 0LL;
  unint64_t v16 = ccn_write_uint_size_internal(*v11, v11 + 3);
  if (v15 < v16
    || *a2 != *a3
    || (unint64_t v17 = v16,
        ccec_validate_point_and_projectify_ws(a1, (uint64_t *)v11, (uint64_t)v14, (uint64_t)(a3 + 2)))
    || ccec_validate_scalar(v11, (uint64_t)&a2[3 * **a2 + 2])
    || ccec_mult_blinded_ws(a1, v11, (uint64_t)v13, (uint64_t)&a2[3 * **a2 + 2], (uint64_t)v14, a6)
    || !ccec_is_point_projective_ws(a1, v11)
    || ccec_affinify_x_only_ws(a1, (uint64_t *)v11, (uint64_t)v13, (uint64_t)v13))
  {
    uint64_t v18 = 0xFFFFFFFFLL;
  }

  else
  {
    ccn_write_uint_padded_ct_internal(*v11, v13, v17, a5);
    uint64_t v18 = 0LL;
    *a4 = v17;
  }

  cc_clear(24 * *v11, v13);
  cc_clear(24 * *v11, v14);
  *(void *)(a1 + 16) = v21;
  return v18;
}

void *ccaes_cbc_encrypt_mode()
{
  return &ccaes_arm_cbc_encrypt_mode;
}

uint64_t ccec_generate_scalar_fips_retry_ws( uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *), void *a4)
{
  unint64_t v8 = a2 + 4;
  uint64_t v9 = (uint64_t)&a2[5 * *a2 + 4];
  uint64_t v10 = cczp_n(v9);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  uint64_t v13 = (void *)cczp_prime(v9);
  ccn_set(v10, v12, v13);
  *v12 &= ~1uLL;
  uint64_t v14 = 100LL;
  while (1)
  {
    uint64_t v15 = cczp_bitlen((uint64_t)&v8[5 * *a2]);
    uint64_t result = ccn_random_bits_fips(v15, a4, a3);
    if ((_DWORD)result) {
      break;
    }
    if ((ccn_cmp_internal(v10, a4, v12) & 0x80000000) != 0)
    {
      ccn_add1_ws(a1, v10, a4, a4, 1LL);
      uint64_t result = 0LL;
      break;
    }

    if (!--v14)
    {
      uint64_t result = 4294967281LL;
      break;
    }
  }

  *(void *)(a1 + 16) = v11;
  return result;
}

uint64_t ccn_cond_swap(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555LL, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v10 = *a4 ^ *a3;
    *a3 ^= result;
    uint64_t v11 = *a4 ^ result;
    *a4 = v11;
    uint64_t v12 = *a3 ^ v10 & 0x5555555555555555LL;
    uint64_t v13 = v11 ^ v10 & 0x5555555555555555LL;
    uint64_t v14 = v10 & i;
    *a3++ = v12 ^ v14 ^ result;
    *a4++ = v13 ^ v14 ^ result;
  }

  return result;
}

uint64_t ccec_sign_internal_inner_ws( uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t a9, uint64_t (**a10)(void, uint64_t, uint64_t *))
{
  uint64_t v15 = *a2;
  uint64_t v22 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, *a2);
  unint64_t v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v15);
  uint64_t result = ccec_mult_blinded_ws(a1, a2, (uint64_t)v16, a5, a6, a10);
  if (!(_DWORD)result)
  {
    uint64_t result = ccec_affinify_x_only_ws(a1, (uint64_t *)a2, (uint64_t)v16, (uint64_t)v16);
    if (!(_DWORD)result)
    {
      uint64_t v18 = (uint64_t)&a2[5 * v15 + 4];
      uint64_t v19 = (unint64_t *)cczp_prime(v18);
      BOOL v20 = ccn_sub_ws(a1, v15, a8, v16, v19);
      uint64_t v21 = (uint64_t *)cczp_prime(v18);
      ccn_cond_add(v15, v20, a8, a8, v21);
      if (ccn_n(v15, a8))
      {
        cczp_mul_ws(a1, v18);
        cczp_mul_ws(a1, v18);
        cczp_mul_ws(a1, v18);
        cczp_mul_ws(a1, v18);
        cczp_add_ws(a1, v18);
        uint64_t result = cczp_inv_ws(a1, v18);
        if (!(_DWORD)result)
        {
          cczp_mul_ws(a1, v18);
          if (ccn_n(v15, a9)) {
            uint64_t result = 0LL;
          }
          else {
            uint64_t result = 4294967131LL;
          }
        }
      }

      else
      {
        uint64_t result = 4294967131LL;
      }
    }
  }

  *(void *)(a1 + 16) = v22;
  return result;
}

uint64_t ccec_sign_internal_ws( uint64_t a1, uint64_t **a2, unint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t (**a7)(void, unint64_t, void *))
{
  uint64_t v11 = *a2;
  uint64_t v13 = (uint64_t)(*a2 + 4);
  uint64_t v12 = **a2;
  if (a3 <= 0xF)
  {
    __int128 v31 = (os_log_s *)cc_log_default();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      ccec_sign_internal_ws_cold_1(a3, v31);
    }
  }

  uint64_t v35 = *(void *)(a1 + 16);
  uint64_t v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v39 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v12);
  uint64_t uint_internal = ccec_projectify_ws(a1, (uint64_t)v11);
  int v32 = a7;
  int v37 = (void *)v15;
  uint64_t v17 = **a2;
  uint64_t v18 = cczp_bitlen(v13 + 40 * *v11);
  uint64_t v19 = a2;
  unint64_t v20 = v18;
  unint64_t v21 = (unint64_t)(v18 + 7) >> 3 >= a3 ? a3 : (unint64_t)(v18 + 7) >> 3;
  uint64_t uint_internal = ccn_read_uint_internal(v12, v14, v21, a4);
  if ((uint_internal & 0x80000000) != 0)
  {
LABEL_20:
    uint64_t v29 = uint_internal;
    unint64_t v24 = a5;
  }

  else
  {
    uint64_t v22 = (uint64_t)&v19[3 * v17 + 2];
    if (v20 < 8 * a3) {
      ccn_shift_right(v12, v14, v14, -(int)v20 & 7LL);
    }
    uint64_t v23 = (unint64_t *)cczp_prime(v13 + 40 * v12);
    unint64_t v24 = a5;
    char v25 = ccn_sub_ws(a1, v12, a5, v14->i64, v23);
    ccn_mux(v12, v25, v14->i64, v14->i64, a5);
    uint64_t scalar_fips_retry_ws = ccec_validate_scalar(v11, v22);
    if (!(_DWORD)scalar_fips_retry_ws)
    {
      int v27 = 10;
      while (1)
      {
        uint64_t scalar_fips_retry_ws = ccec_generate_scalar_fips_retry_ws(a1, v11, v32, v39);
        if ((_DWORD)scalar_fips_retry_ws) {
          break;
        }
        uint64_t scalar_fips_retry_ws = ccec_generate_scalar_fips_retry_ws(a1, v11, v32, v37);
        if ((_DWORD)scalar_fips_retry_ws) {
          break;
        }
        uint64_t v28 = ccec_sign_internal_inner_ws( a1,  (unint64_t *)v11,  (uint64_t)v14,  v22,  (uint64_t)v39,  v36,  (uint64_t)v37,  a5,  (uint64_t)a6,  (uint64_t (**)(void, uint64_t, uint64_t *))v32);
        uint64_t v29 = v28;
        if (!(_DWORD)v28) {
          goto LABEL_18;
        }
        if ((_DWORD)v28 != -165) {
          goto LABEL_17;
        }
        if (!--v27) {
          cc_try_abort();
        }
      }
    }

    uint64_t v29 = scalar_fips_retry_ws;
  }

uint64_t cczp_inv_field_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = cczp_n(a2);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  uint64_t v11 = (unint64_t *)cczp_prime(a2);
  if (ccn_sub1(v8, v10, v11, 2uLL)) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, (uint64_t)v10);
  }
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t *ccaes_ctr_crypt_mode()
{
  unint64_t v0 = ((*(void *)ccaes_ecb_encrypt_mode() + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 48;
  timespec v1 = ccaes_ecb_encrypt_mode();
  ctr_crypt = v0;
  unk_10021CAC8 = xmmword_10019FA10;
  qword_10021CAD8 = (uint64_t)ccmode_ctr_init;
  unk_10021CAE0 = ccmode_ctr_setctr;
  qword_10021CAE8 = (uint64_t)ccaes_vng_ctr_crypt;
  unk_10021CAF0 = v1;
  return &ctr_crypt;
}

void *ccaes_ecb_encrypt_mode()
{
  return &ccaes_arm_ecb_encrypt_mode;
}

void *ccsigma_mfi_info()
{
  return &mfi_info;
}

double mfi_info_init(uint64_t a1)
{
  uint64_t v2 = ccec_cp_256();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = mfi_kex_ctx;
  *(void *)(a1 + 16) = mfi_peer_kex_ctx;
  unint64_t v3 = ((unint64_t)(cczp_bitlen(v2) + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL;
  *(void *)(a1 + 24) = v2;
  *(void *)(a1 + 32) = ccsha256_di();
  *(void *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = mfi_sign_ctx;
  *(void *)(a1 + 56) = mfi_peer_sign_ctx;
  *(void *)(a1 + 64) = 14LL;
  *(void *)(a1 + 72) = &mfi_session_keys_info;
  *(void *)(a1 + 80) = 200LL;
  *(void *)(a1 + 88) = mfi_session_keys_buffer;
  *(void *)(a1 + 96) = mfi_session_keys_derive;
  *(void *)(a1 + 104) = 16LL;
  *(void *)(a1 + 112) = mfi_mac_compute;
  *(void *)&double result = 9LL;
  *(_OWORD *)(a1 + 120) = xmmword_10019FA20;
  *(void *)(a1 + 136) = mfi_sigma_compute_mac_and_digest;
  *(void *)(a1 + 144) = 16LL;
  *(void *)(a1 + 152) = mfi_aead_seal;
  *(void *)(a1 + 160) = mfi_aead_open;
  *(void *)(a1 + 168) = mfi_aead_next_iv;
  *(void *)(a1 + 176) = mfi_clear;
  return result;
}

uint64_t mfi_kex_ctx(uint64_t a1)
{
  return a1 + 32;
}

uint64_t mfi_peer_kex_ctx(uint64_t a1)
{
  return a1 + 176;
}

uint64_t mfi_sign_ctx(uint64_t a1)
{
  return a1 + 288;
}

uint64_t mfi_peer_sign_ctx(uint64_t a1)
{
  return a1 + 432;
}

uint64_t mfi_session_keys_buffer(uint64_t a1)
{
  return a1 + 544;
}

uint64_t mfi_session_keys_derive(uint64_t **a1, unint64_t a2, char *a3, size_t a4, const void *a5)
{
  uint64_t v10 = *a1;
  unint64_t v11 = ccec_compressed_x962_export_pub_size(**a1);
  size_t v12 = a4 + 2 * v11 + v10[28];
  if (v12 > 0x100) {
    return 4294967289LL;
  }
  unint64_t v13 = v11;
  memset(v27, 0, sizeof(v27));
  v26[0] = 0LL;
  v26[1] = 0LL;
  uint64_t v14 = ccaes_cbc_encrypt_mode();
  uint64_t result = cccmac_one_shot_generate_internal(v14, v10[24], v10[23], a2, a3, 0x10uLL, v26);
  if (!(_DWORD)result)
  {
    uint64_t v16 = v10[28];
    __memcpy_chk(v27, v10[27], v16, 256LL);
    uint64_t v17 = (char *)v27 + v16;
    uint64_t inited = (uint64_t *)ccsigma_kex_init_ctx((uint64_t)a1);
    uint64_t result = ccec_compressed_x962_export_pub(inited, v17);
    if (!(_DWORD)result)
    {
      uint64_t v19 = &v17[v13];
      unint64_t v20 = (uint64_t *)ccsigma_kex_resp_ctx((uint64_t)a1);
      uint64_t result = ccec_compressed_x962_export_pub(v20, v19);
      if (!(_DWORD)result)
      {
        memcpy(&v19[v13], a5, a4);
        unint64_t v21 = ccaes_cbc_encrypt_mode();
        uint64_t v23 = (const void *)v10[25];
        size_t v22 = v10[26];
        rsize_t v24 = v10[10];
        char v25 = (char *)((uint64_t (*)(uint64_t **))v10[11])(a1);
        return ccnistkdf_ctr_cmac_internal(v21, 0x20u, 0x10uLL, (uint64_t)v26, v22, v23, v12, v27, v24, 4uLL, v25);
      }
    }
  }

  return result;
}

uint64_t mfi_mac_compute( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char *a5, void *a6)
{
  size_t v12 = ccaes_cbc_encrypt_mode();
  return cccmac_one_shot_generate_internal(v12, a2, a3, a4, a5, *(void *)(*(void *)a1 + 104LL), a6);
}

uint64_t mfi_sigma_compute_mac_and_digest(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a1;
  uint64_t v11 = *(void *)(*a1 + 32);
  size_t v12 = (*(void *)(v11 + 8) + *(void *)(v11 + 16) + 19LL) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v13, v12);
  ccdigest_init_internal(v11, v13);
  ccdigest_update_internal((unint64_t *)v11, v13, *(void *)(v10 + 240), *(char **)(v10 + 232));
  unint64_t v14 = ccec_compressed_x962_export_pub_size(*(void *)v10);
  if (v14 > 0x21) {
    return 4294967291LL;
  }
  size_t v15 = v14;
  char v21 = 0;
  memset(__src, 0, sizeof(__src));
  uint64_t inited = (uint64_t *)ccsigma_kex_init_ctx((uint64_t)a1);
  ccec_compressed_x962_export_pub(inited, (char *)__src);
  ccdigest_update_internal((unint64_t *)v11, v13, v15, (char *)__src);
  uint64_t v17 = (uint64_t *)ccsigma_kex_resp_ctx((uint64_t)a1);
  ccec_compressed_x962_export_pub(v17, (char *)__src);
  ccdigest_update_internal((unint64_t *)v11, v13, v15, (char *)__src);
  v19[0] = 0LL;
  v19[1] = 0LL;
  uint64_t result = ccsigma_compute_mac_internal(a1, *(void *)(v10 + 8LL * a2 + 120), a3, a4, (uint64_t)v19);
  if (!(_DWORD)result)
  {
    ccdigest_update_internal((unint64_t *)v11, v13, *(void *)(v10 + 104), (char *)v19);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 56))(v11, v13, a5);
    return 0LL;
  }

  return result;
}

uint64_t mfi_aead_seal( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = ccaes_ccm_encrypt_mode();
  return ccccm_one_shot_internal( (uint64_t)v18,  a2,  a3,  a4,  a5,  a8,  a9,  a10,  a6,  a7,  *(void *)(*(void *)a1 + 144LL),  a11);
}

uint64_t mfi_aead_open( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char *a11)
{
  unint64_t v11 = *(void *)(*(void *)a1 + 144LL);
  if (v11 > 0x10) {
    return 4294967291LL;
  }
  v22[0] = 0LL;
  v22[1] = 0LL;
  unint64_t v20 = ccaes_ccm_decrypt_mode();
  uint64_t result = ccccm_one_shot_internal((uint64_t)v20, a2, a3, a4, a5, a8, a9, a10, a6, a7, v11, (uint64_t)v22);
  if (!(_DWORD)result)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t mfi_aead_next_iv(unint64_t a1, uint64_t a2)
{
  return inc_uint(a2, a1);
}

uint64_t mfi_clear(void *__s)
{
  return cc_clear(0x2F0uLL, __s);
}

uint64_t ccder_blob_decode_range(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3)
{
  unint64_t v8 = 0LL;
  uint64_t result = ccder_blob_decode_tl_internal(a1, a2, &v8, 0);
  if ((_DWORD)result)
  {
    uint64_t v6 = *a1;
    uint64_t v7 = &(*a1)[v8];
    *a1 = v7;
    *a3 = v6;
    a3[1] = v7;
  }

  else
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  return result;
}

uint64_t ccder_blob_decode_len_strict(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 1);
}

uint64_t ccder_blob_decode_len_internal(unsigned __int8 **a1, unint64_t *a2, int a3)
{
  unint64_t v4 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if (*a1) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v7 = v4 + 1;
  unint64_t v8 = *v4;
  if ((char)*v4 < 0)
  {
    switch(*v4)
    {
      case 0x81u:
        if ((uint64_t)(v3 - (void)v7) >= 1)
        {
          uint64_t v7 = v4 + 2;
          int v10 = (char)v4[1];
          unint64_t v8 = v10;
          if (!a3 || v10 < 0) {
            break;
          }
        }

        goto LABEL_10;
      case 0x82u:
        if ((uint64_t)(v3 - (void)v7) >= 2)
        {
          uint64_t v7 = v4 + 3;
          unint64_t v8 = __rev16(*(unsigned __int16 *)(v4 + 1));
          if (!a3 || v8 >= 0x100) {
            break;
          }
        }

        goto LABEL_10;
      case 0x83u:
        if ((uint64_t)(v3 - (void)v7) >= 3)
        {
          uint64_t v7 = v4 + 4;
          unint64_t v8 = ((unint64_t)v4[1] << 16) | ((unint64_t)v4[2] << 8) | v4[3];
          if (!a3 || v8 >= 0x10000) {
            break;
          }
        }

        goto LABEL_10;
      case 0x84u:
        if ((uint64_t)(v3 - (void)v7) >= 4)
        {
          uint64_t v7 = v4 + 5;
          unint64_t v8 = bswap32(*(_DWORD *)(v4 + 1));
          if (!a3 || v8 >> 24) {
            break;
          }
        }

        goto LABEL_10;
      default:
        goto LABEL_10;
    }
  }

  if (v3 - (unint64_t)v7 < v8)
  {
LABEL_10:
    uint64_t result = 0LL;
    *a2 = 0LL;
  }

  else
  {
    *a2 = v8;
    *a1 = v7;
    return 1LL;
  }

  return result;
}

uint64_t ccder_blob_decode_len(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 0);
}

uint64_t ccder_blob_decode_tag(unsigned __int8 **a1, unint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (unint64_t)a1[1];
  if (*a1) {
    BOOL v4 = (unint64_t)v2 >= v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0LL;
  }
  unsigned int v8 = *v2;
  uint64_t v6 = v2 + 1;
  unint64_t v7 = v8;
  unint64_t v9 = v8 & 0x1F;
  if (v9 == 31)
  {
    unint64_t v9 = 0LL;
    while (1)
    {
      uint64_t v5 = 0LL;
      unint64_t v10 = v9;
      if (v9 >> 57) {
        break;
      }
      char v11 = *v6++;
      unint64_t v9 = v11 & 0x7F | (v9 << 7);
      if ((v11 & 0x80) == 0)
      {
        if (v10 >> 54) {
          return 0LL;
        }
        goto LABEL_13;
      }
    }
  }

  else
  {
LABEL_13:
    *a2 = v9 | (v7 >> 5 << 61);
    *a1 = v6;
    return 1LL;
  }

  return v5;
}

uint64_t ccder_blob_decode_tl_internal(unsigned __int8 **a1, uint64_t a2, unint64_t *a3, int a4)
{
  unint64_t v10 = 0LL;
  *a3 = 0LL;
  int v8 = ccder_blob_decode_tag(a1, &v10);
  uint64_t result = 0LL;
  if (v8 && v10 == a2)
  {
    if (a4) {
      return ccder_blob_decode_len_strict(a1, a3);
    }
    else {
      return ccder_blob_decode_len(a1, a3);
    }
  }

  return result;
}

uint64_t ccder_blob_decode_tl(unsigned __int8 **a1, uint64_t a2, unint64_t *a3)
{
  return ccder_blob_decode_tl_internal(a1, a2, a3, 0);
}

uint64_t ccder_blob_decode_uint64(unsigned __int8 **a1, unint64_t *a2)
{
  if (a2) {
    *a2 = 0LL;
  }
  unint64_t v7 = 0LL;
  int v8 = 0LL;
  uint64_t result = ccder_blob_decode_range(a1, 2LL, (unsigned __int8 **)&v7);
  if ((_DWORD)result)
  {
    BOOL v4 = (unsigned __int8 *)v7;
    if (*v7) {
      goto LABEL_7;
    }
    BOOL v4 = (unsigned __int8 *)(v7 + 1);
    if (v7 + 1 == (char *)v8)
    {
      BOOL v4 = v8;
    }

    else if (((char)*v4 & 0x80000000) == 0)
    {
      return 0LL;
    }

BOOL ccder_blob_reserve(void *a1, unint64_t a2, void *a3)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = v3 - *a1;
  if (v4 < a2)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  else
  {
    a1[1] = v3 - a2;
    *a3 = v3 - a2;
    a3[1] = v3;
  }

  return v4 >= a2;
}

uint64_t ccder_blob_encode_len(uint64_t *a1, unint64_t a2)
{
  if (HIDWORD(a2)) {
    return 0LL;
  }
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  if (a2 > 0x7F)
  {
    if (a2 > 0xFF)
    {
      if (a2 >> 16)
      {
        if (a2 >> 24)
        {
          if (v3 + 5 <= v2)
          {
            *(_BYTE *)(v2 - 5) = -124;
            unint64_t v4 = v2 - 5;
            *(_DWORD *)(v4 + 1) = bswap32(a2);
            goto LABEL_17;
          }
        }

        else if (v3 + 4 <= v2)
        {
          *(_BYTE *)(v2 - 4) = -125;
          unint64_t v4 = v2 - 4;
          *(_WORD *)(v4 + 2) = bswap32(a2) >> 16;
          *(_BYTE *)(v4 + 1) = BYTE2(a2);
          goto LABEL_17;
        }
      }

      else if (v3 + 3 <= v2)
      {
        *(_BYTE *)(v2 - 3) = -126;
        unint64_t v4 = v2 - 3;
        *(_WORD *)(v4 + 1) = bswap32(a2) >> 16;
        goto LABEL_17;
      }
    }

    else if (v3 + 2 <= v2)
    {
      *(_BYTE *)(v2 - 2) = -127;
      unint64_t v4 = v2 - 2;
      *(_BYTE *)(v4 + 1) = a2;
      goto LABEL_17;
    }

    return 0LL;
  }

  if (v3 + 1 > v2) {
    return 0LL;
  }
  *(_BYTE *)(v2 - 1) = a2;
  unint64_t v4 = v2 - 1;
LABEL_17:
  *a1 = v3;
  a1[1] = v4;
  return 1LL;
}

uint64_t ccder_blob_encode_tag(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = a2 & 0x1FFFFFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFFFFLL) > 0x1E)
  {
    if (v4 <= 0x7F)
    {
      *(_BYTE *)(v2 - 1) = a2;
      unsigned int v6 = (_BYTE *)(v2 - 1);
LABEL_18:
      *(v6 - 1) = HIBYTE(a2) | 0x1F;
      unint64_t v5 = v6 - 1;
      goto LABEL_19;
    }

    if (v4 >> 14)
    {
      if (v4 >> 21)
      {
        unint64_t v9 = v2 - v3;
        if (v4 >> 28)
        {
          if (v9 < 6) {
            return 0LL;
          }
          uint64x2_t v11 = (uint64x2_t)vdupq_n_s64(a2);
          int16x8_t v12 = (int16x8_t)vuzp1q_s32( (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_10019FB00),  (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_10019FAF0));
          v12.i64[0] = *(void *)&vmovn_s32((int32x4_t)v12) | 0x80008000800080LL;
          *(_DWORD *)(v2 - 5) = vmovn_s16(v12).u32[0];
          unsigned int v6 = (_BYTE *)(v2 - 5);
          v6[4] = a2 & 0x7F;
          goto LABEL_18;
        }

        if (v9 < 5) {
          return 0LL;
        }
        *(_BYTE *)(v2 - 4) = (a2 >> 21) | 0x80;
        unsigned int v6 = (_BYTE *)(v2 - 4);
        v6[3] = a2 & 0x7F;
        v6[2] = (a2 >> 7) | 0x80;
        unsigned int v8 = a2 >> 14;
      }

      else
      {
        *(_BYTE *)(v2 - 3) = (a2 >> 14) | 0x80;
        unsigned int v6 = (_BYTE *)(v2 - 3);
        v6[2] = a2 & 0x7F;
        unsigned int v8 = a2 >> 7;
      }

      char v7 = v8 | 0x80;
    }

    else
    {
      char v7 = a2 & 0x7F;
      *(_BYTE *)(v2 - 2) = (a2 >> 7) | 0x80;
      unsigned int v6 = (_BYTE *)(v2 - 2);
    }

    v6[1] = v7;
    goto LABEL_18;
  }

  if (v2 != v3)
  {
    *(_BYTE *)(v2 - 1) = HIBYTE(a2) & 0xE0 | a2;
    unint64_t v5 = (_BYTE *)(v2 - 1);
LABEL_19:
    *a1 = v3;
    a1[1] = (uint64_t)v5;
    return 1LL;
  }

  return 0LL;
}

uint64_t ccder_blob_encode_tl(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = ccder_blob_encode_len(a1, a3);
  if ((_DWORD)result) {
    return ccder_blob_encode_tag(a1, a2);
  }
  return result;
}

uint64_t ccder_sizeof(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = ccder_sizeof_tag(a1);
  return v3 + a2 + ccder_sizeof_len(a2);
}

uint64_t ccder_blob_encode_body_tl(uint64_t *a1, unint64_t a2, unint64_t a3, const void *a4)
{
  uint64_t result = ccder_blob_encode_body(a1, a3, a4);
  if ((_DWORD)result) {
    return ccder_blob_encode_tl(a1, a2, a3);
  }
  return result;
}

uint64_t ccrng_schedule_read(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8)) {
    return 3LL;
  }
  uint64_t result = (**(uint64_t (***)(uint64_t))a1)(a1);
  *(_BYTE *)(a1 + 8) = (_DWORD)result == 3;
  return result;
}

uint64_t ccrng_schedule_notify_reseed(_BYTE *a1)
{
  a1[8] = 0;
  return (*(uint64_t (**)(_BYTE *))(*(void *)a1 + 8LL))(a1);
}

uint64_t ccrng_schedule_atomic_flag_init(uint64_t result)
{
  *(void *)uint64_t result = ccrng_schedule_atomic_flag_info;
  *(_BYTE *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 1;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_set(uint64_t result)
{
  *(_DWORD *)(result + 16) = 3;
  return result;
}

uint64_t ccrng_schedule_timer_init(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  *(void *)a1 = ccrng_schedule_timer_info;
  *(_BYTE *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  uint64_t result = a2();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_init(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = ccrng_schedule_tree_info;
  *(_BYTE *)(result + 8) = 0;
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_read(uint64_t a1)
{
  timespec v1 = (unsigned int *)(a1 + 16);
  do
    uint64_t result = __ldxr(v1);
  while (__stxr(1u, v1));
  return result;
}

uint64_t ccrng_schedule_timer_read(uint64_t a1)
{
  else {
    return 3LL;
  }
}

uint64_t ccrng_schedule_timer_notify_reseed(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 16))();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_read(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v2 + 8))
  {
    unsigned int v3 = 3;
  }

  else
  {
    unsigned int v3 = (**(uint64_t (***)(void))v2)(*(void *)(a1 + 16));
    *(_BYTE *)(v2 + 8) = v3 == 3;
  }

  uint64_t v4 = *(void *)(a1 + 24);
  if (*(_BYTE *)(v4 + 8))
  {
    LODWORD(result) = 3;
  }

  else
  {
    LODWORD(result) = (**(uint64_t (***)(uint64_t))v4)(v4);
    *(_BYTE *)(v4 + 8) = (_DWORD)result == 3;
  }

  else {
    return v3;
  }
}

uint64_t ccrng_schedule_tree_notify_reseed(uint64_t a1)
{
  uint64_t v2 = *(_BYTE **)(a1 + 16);
  v2[8] = 0;
  (*(void (**)(_BYTE *))(*(void *)v2 + 8LL))(v2);
  unsigned int v3 = *(_BYTE **)(a1 + 24);
  v3[8] = 0;
  return (*(uint64_t (**)(_BYTE *))(*(void *)v3 + 8LL))(v3);
}

uint64_t ccder_sizeof_len(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1LL;
  }
  uint64_t v2 = 3LL;
  uint64_t v3 = 4LL;
  uint64_t v4 = 5LL;
  uint64_t v5 = 6LL;
  uint64_t v6 = 7LL;
  uint64_t v7 = 8LL;
  if (HIBYTE(a1)) {
    uint64_t v7 = 9LL;
  }
  if (HIWORD(a1)) {
    uint64_t v6 = v7;
  }
  if (a1 >> 40) {
    uint64_t v5 = v6;
  }
  if (HIDWORD(a1)) {
    uint64_t v4 = v5;
  }
  if (a1 >> 24) {
    uint64_t v3 = v4;
  }
  if (a1 >= 0x10000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x100) {
    return v2;
  }
  else {
    return 2LL;
  }
}

uint64_t ccn_n_asm(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0LL;
    unint64_t v3 = 0LL;
    do
    {
      uint64_t v4 = *a2++;
      ++v3;
      if (v4) {
        uint64_t result = v3;
      }
    }

    while (v3 < v2);
  }

  return result;
}

uint64_t ccaes_vng_ctr_crypt( void *a1, unint64_t a2, int8x16_t *a3, int8x16_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a1[1];
  if (a2)
  {
    unint64_t v10 = a2;
    uint64_t v11 = *a1;
    unint64_t v12 = (unint64_t)(*(void *)(*a1 + 8LL) + 7LL) >> 3;
    unint64_t v13 = a1 + 2;
    unint64_t v14 = (int8x16_t *)&a1[2 * v12 + 2];
    size_t v15 = (int8x16_t *)&a1[v12 + 2];
    uint64_t v16 = &a1[v12];
    while (1)
    {
      if (v7 == 16)
      {
        if (v10 >= 0x10)
        {
          aes_ctr_crypt(a3, a4, v10 & 0xFFFFFFFFFFFFFFF0LL, v15, v14, a6);
          a4 = (int8x16_t *)((char *)a4 + (v10 & 0xFFFFFFFFFFFFFFF0LL));
          a3 = (int8x16_t *)((char *)a3 + (v10 & 0xFFFFFFFFFFFFFFF0LL));
          v10 &= 0xFu;
        }

        (*(void (**)(int8x16_t *, uint64_t, int8x16_t *, void *))(v11 + 24))(v14, 1LL, v15, a1 + 2);
        uint64_t v17 = 31LL;
        do
        {
          __int16 v18 = (*((_BYTE *)v16 + v17--))++ + 1;
        }

        while ((v18 & 0x100) != 0);
        uint64_t v7 = 0LL;
        uint64_t v19 = 0LL;
        if (!v10) {
          break;
        }
      }

      uint64_t v20 = 0LL;
      do
      {
        uint64_t v21 = v20 + 1;
        a4->i8[v20] = *((_BYTE *)v13 + v7 + v20) ^ a3->i8[v20];
        BOOL v22 = (unint64_t)(v20 + 1 + v7) > 0xF || v10 - 1 == v20;
        ++v20;
      }

      while (!v22);
      v7 += v21;
      a3 = (int8x16_t *)((char *)a3 + v21);
      a4 = (int8x16_t *)((char *)a4 + v21);
      v10 -= v21;
      if (!v10) {
        goto LABEL_17;
      }
    }
  }

  else
  {
LABEL_17:
    uint64_t v19 = v7;
  }

  a1[1] = v19;
  return 0LL;
}

uint64_t ccder_sizeof_tag(uint64_t a1)
{
  unint64_t v1 = a1 & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v2 = 2LL;
  uint64_t v3 = 3LL;
  uint64_t v4 = 4LL;
  uint64_t v5 = 5LL;
  if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >> 28) {
    uint64_t v5 = 6LL;
  }
  if (v1 >= 0x200000) {
    uint64_t v4 = v5;
  }
  if (v1 >= 0x4000) {
    uint64_t v3 = v4;
  }
  if (v1 >= 0x80) {
    uint64_t v2 = v3;
  }
  if (v1 >= 0x1F) {
    return v2;
  }
  else {
    return 1LL;
  }
}

void *cczp_to_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);
  return ccn_set(v6, a3, a4);
}

uint64_t cczp_to_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 56LL))();
}

void cc_try_abort()
{
}

uint64_t cc_try_abort_if (uint64_t result)
{
  if ((_DWORD)result) {
    cc_abort();
  }
  return result;
}

unint64_t cczp_negate(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6 = cczp_n(a1);
  BOOL v7 = ccn_n(v6, a3) != 0;
  unsigned int v8 = (uint64_t *)cczp_prime(a1);
  return ccn_cond_rsub(v6, v7, a2, a3, v8);
}

unint64_t cczp_cond_negate(uint64_t a1, unsigned __int8 a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v8 = cczp_n(a1);
  uint64_t v9 = (ccn_n(v8, a4) != 0) & a2;
  unint64_t v10 = (uint64_t *)cczp_prime(a1);
  return ccn_cond_rsub(v8, v9, a3, a4, v10);
}

void *cczp_from_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = cczp_n(a2);
  return ccn_set(v6, a3, a4);
}

uint64_t cczp_from_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 64LL))();
}

unint64_t ccn_mul1_asm(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0LL;
  if ((a1 & 1) != 0)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4) >> 64;
    *a2++ = v5 * a4;
    --a1;
  }

  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned __int128 v8 = v6 * (unsigned __int128)a4 + __PAIR128__(v7 * a4, v4);
    unint64_t v4 = (__CFADD__(__CFADD__(v6 * a4, v4), (v6 * (unsigned __int128)a4) >> 64) | __CFADD__( v7 * a4,  *((void *)&v8 + 1)))
       + ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v8;
    a2 += 2;
    a1 -= 2LL;
  }

  while (1)
  {
    BOOL v9 = a1 < 4;
    a1 -= 4LL;
    if (v9) {
      break;
    }
    unint64_t v11 = *a3;
    unint64_t v12 = a3[1];
    unint64_t v10 = a3 + 2;
    unint64_t v14 = *v10;
    unint64_t v15 = v10[1];
    a3 = v10 + 2;
    uint64_t v16 = (v12 * (unsigned __int128)a4) >> 64;
    BOOL v17 = __CFADD__(__CFADD__(v11 * a4, v4), (v11 * (unsigned __int128)a4) >> 64);
    unsigned __int128 v13 = v11 * (unsigned __int128)a4 + __PAIR128__(v12 * a4, v4);
    *(_OWORD *)a2 = v13;
    __int16 v18 = a2 + 2;
    uint64_t v19 = (v14 * (unsigned __int128)a4) >> 64;
    uint64_t v20 = v16 + (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4;
    uint64_t v22 = __CFADD__(v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1)), v14 * a4) | __CFADD__(v16, (v17 | __CFADD__(v12 * a4, *((void *)&v13 + 1))) + v14 * a4);
    BOOL v17 = __CFADD__(v22, v19);
    uint64_t v21 = v22 + v19;
    unint64_t v4 = (v17 | __CFADD__(v15 * a4, v21)) + ((v15 * (unsigned __int128)a4) >> 64);
    *__int16 v18 = v20;
    v18[1] = v15 * a4 + v21;
    a2 = v18 + 2;
  }

  return v4;
}

uint64_t ccdigest_internal(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  size_t v8 = (*(void *)(a1 + 8) + *(void *)(a1 + 16) + 19LL) & 0xFFFFFFFFFFFFFFF8LL;
  BOOL v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v9, v8);
  ccdigest_init_internal(a1, v9);
  ccdigest_update_internal((unint64_t *)a1, v9, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v9, a4);
  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12LL, v9);
}

uint64_t ccdigest(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  BOOL v9 = timingsafe_enable_if_supported();
  ccdigest_internal(a1, a2, a3, a4);
  return cc_disable_dit_with_sb((unsigned int *)&v9);
}

int8x16_t *ccm128_decrypt( int8x16_t *a1, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100163E00[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  size_t v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  int8x16_t v19 = v8[2];
  int64x2_t v20 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask);
  int64x2_t v21 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v20, *(int64x2_t *)qword_100163E00), v7),  vbicq_s8((int8x16_t)v20, v7));
  int8x16_t v23 = *a1;
  uint64_t result = a1 + 1;
  __asm
  {
    AESE            V3.16B, V16.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V17.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V18.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V19.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V20.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V21.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V22.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V23.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V24.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V25.16B
  }

  *a2 = veorq_s8(v23, veorq_s8(_Q3, v19));
  unint64_t v47 = a2 + 1;
  int v48 = a4 - 1;
  if (v48)
  {
    do
    {
      int64x2_t v21 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v21, *(int64x2_t *)qword_100163E00), v7),  vbicq_s8((int8x16_t)v21, v7));
      int8x16_t v49 = *result++;
      __asm
      {
        AESE            V3.16B, V16.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V16.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V17.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V17.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V18.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V18.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V19.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V19.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V20.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V20.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V21.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V21.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V22.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V22.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V23.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V23.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V24.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V24.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V25.16B
        AESE            V1.16B, V25.16B
      }

      *v47++ = veorq_s8(v49, veorq_s8(_Q3, v19));
      _VF = __OFSUB__(v48--, 1);
    }

    while (!((v48 < 0) ^ _VF | (v48 == 0)));
  }

  __asm
  {
    AESE            V1.16B, V16.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V17.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V18.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V19.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V20.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V21.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V22.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V23.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V24.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V25.16B
  }

  *a6 = vqtbl1q_s8((int8x16_t)v21, *(int8x16_t *)Lbswap_mask);
  *a3 = veorq_s8(_Q1, v19);
  return result;
}

int8x16_t *ccm192_decrypt( int8x16_t *a1, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100163E00[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  size_t v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  int8x16_t v21 = v8[4];
  int64x2_t v22 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask);
  int64x2_t v23 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v22, *(int64x2_t *)qword_100163E00), v7),  vbicq_s8((int8x16_t)v22, v7));
  int8x16_t v25 = *a1;
  uint64_t result = a1 + 1;
  __asm
  {
    AESE            V3.16B, V16.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V17.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V18.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V19.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V20.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V21.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V22.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V23.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V24.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V25.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V26.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V27.16B
  }

  *a2 = veorq_s8(v25, veorq_s8(_Q3, v21));
  uint64_t v53 = a2 + 1;
  int v54 = a4 - 1;
  if (v54)
  {
    do
    {
      int64x2_t v23 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v23, *(int64x2_t *)qword_100163E00), v7),  vbicq_s8((int8x16_t)v23, v7));
      int8x16_t v55 = *result++;
      __asm
      {
        AESE            V3.16B, V16.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V16.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V17.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V17.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V18.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V18.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V19.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V19.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V20.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V20.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V21.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V21.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V22.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V22.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V23.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V23.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V24.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V24.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V25.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V25.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V26.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V26.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V27.16B
        AESE            V1.16B, V27.16B
      }

      *v53++ = veorq_s8(v55, veorq_s8(_Q3, v21));
      _VF = __OFSUB__(v54--, 1);
    }

    while (!((v54 < 0) ^ _VF | (v54 == 0)));
  }

  __asm
  {
    AESE            V1.16B, V16.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V17.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V18.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V19.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V20.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V21.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V22.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V23.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V24.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V25.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V26.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V27.16B
  }

  *a6 = vqtbl1q_s8((int8x16_t)v23, *(int8x16_t *)Lbswap_mask);
  *a3 = veorq_s8(_Q1, v21);
  return result;
}

int8x16_t *ccm256_decrypt( int8x16_t *a1, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100163E00[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  size_t v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  v8 += 4;
  _Q28 = *v8;
  _Q29 = v8[1];
  int8x16_t v23 = v8[2];
  int64x2_t v24 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask);
  int64x2_t v25 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v24, *(int64x2_t *)qword_100163E00), v7),  vbicq_s8((int8x16_t)v24, v7));
  int8x16_t v27 = *a1;
  uint64_t result = a1 + 1;
  __asm
  {
    AESE            V3.16B, V16.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V17.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V18.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V19.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V20.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V21.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V22.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V23.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V24.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V25.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V26.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V27.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V28.16B
    AESMC           V3.16B, V3.16B
    AESE            V3.16B, V29.16B
  }

  *a2 = veorq_s8(v27, veorq_s8(_Q3, v23));
  BOOL v59 = a2 + 1;
  int v60 = a4 - 1;
  if (v60)
  {
    do
    {
      int64x2_t v25 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v25, *(int64x2_t *)qword_100163E00), v7),  vbicq_s8((int8x16_t)v25, v7));
      int8x16_t v61 = *result++;
      __asm
      {
        AESE            V3.16B, V16.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V16.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V17.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V17.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V18.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V18.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V19.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V19.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V20.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V20.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V21.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V21.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V22.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V22.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V23.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V23.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V24.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V24.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V25.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V25.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V26.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V26.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V27.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V27.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V28.16B
        AESMC           V3.16B, V3.16B
        AESE            V1.16B, V28.16B
        AESMC           V1.16B, V1.16B
        AESE            V3.16B, V29.16B
        AESE            V1.16B, V29.16B
      }

      *v59++ = veorq_s8(v61, veorq_s8(_Q3, v23));
      _VF = __OFSUB__(v60--, 1);
    }

    while (!((v60 < 0) ^ _VF | (v60 == 0)));
  }

  __asm
  {
    AESE            V1.16B, V16.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V17.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V18.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V19.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V20.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V21.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V22.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V23.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V24.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V25.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V26.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V27.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V28.16B
    AESMC           V1.16B, V1.16B
    AESE            V1.16B, V29.16B
  }

  *a6 = vqtbl1q_s8((int8x16_t)v25, *(int8x16_t *)Lbswap_mask);
  *a3 = veorq_s8(_Q1, v23);
  return result;
}

uint64_t ccdigest_final_64be(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = (uint64_t)a2 + v7 + 8;
  size_t v9 = (v7 + v6 + 19) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  bzero(v10, v9);
  memcpy(v10, a2, v7 + v6 + 12);
  uint64_t v11 = (char *)v10 + v7;
  uint64_t v12 = (uint64_t)v10 + v7 + 8;
  unsigned __int128 v13 = (char *)(v12 + v6);
  uint64_t v14 = *(unsigned int *)(v12 + v6);
  *v10 += (8 * v14);
  *(_DWORD *)(v12 + v6) = v14 + 1;
  *(_BYTE *)(v12 + v14) = 0x80;
  unint64_t v15 = *(unsigned int *)(v12 + v6);
  if (v15 < 0x39)
  {
    if (v15 == 56) {
      goto LABEL_9;
    }
  }

  else
  {
    if (v15 <= 0x3F)
    {
      do
      {
        *(_DWORD *)unsigned __int128 v13 = v15 + 1;
        *(_BYTE *)(v12 + v15) = 0;
        unint64_t v15 = *(unsigned int *)v13;
      }

      while (v15 < 0x40);
    }

    (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1LL);
    unint64_t v15 = 0LL;
    uint64_t v11 = (char *)v10 + *(void *)(a1 + 8);
    uint64_t v12 = (uint64_t)(v11 + 8);
    unsigned __int128 v13 = &v11[*(void *)(a1 + 16) + 8];
    *(_DWORD *)unsigned __int128 v13 = 0;
  }

  do
  {
    *(_DWORD *)unsigned __int128 v13 = v15 + 1;
    *(_BYTE *)(v12 + v15) = 0;
    unint64_t v15 = *(unsigned int *)v13;
  }

  while (v15 < 0x38);
LABEL_9:
  *((void *)v11 + 8) = bswap64(*v10);
  (*(void (**)(void *, uint64_t))(a1 + 48))(v10 + 1, 1LL);
  if (*(void *)a1 >= 4uLL)
  {
    unsigned int v16 = 0;
    unint64_t v17 = 0LL;
    unsigned int v18 = 1;
    do
    {
      *(_DWORD *)(a3 + v16) = bswap32(*((_DWORD *)v10 + v17 + 2));
      unint64_t v17 = v18++;
      v16 += 4;
    }

    while (v17 < *(void *)a1 >> 2);
  }

  return cc_clear(*(void *)(a1 + 8) + *(void *)(a1 + 16) + 12LL, v10);
}

void *ccdigest_init_internal(uint64_t a1, void *a2)
{
  uint64_t result = memcpy(a2 + 1, *(const void **)(a1 + 40), *(void *)(a1 + 8));
  *a2 = 0LL;
  *(_DWORD *)((char *)a2 + *(void *)(a1 + 8) + *(void *)(a1 + 16) + 8) = 0;
  return result;
}

unint64_t ccec_signature_r_s_size(uint64_t *a1)
{
  return (unint64_t)(cczp_bitlen(*a1) + 7) >> 3;
}

unint64_t *ccdigest_update_internal(unint64_t *result, void *a2, size_t a3, char *__src)
{
  size_t v5 = a3;
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  uint64_t v9 = (uint64_t)a2 + result[1] + 8;
  if (a3)
  {
    unint64_t v10 = a2 + 1;
    do
    {
      size_t v11 = v7[2];
      uint64_t v12 = (char *)v10 + v7[1];
      uint64_t v13 = *(unsigned int *)&v12[v11];
      if (v5 > v11 && (_DWORD)v13 == 0)
      {
        if (v11 == 128)
        {
          size_t v22 = v5 >> 7;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFF80LL;
        }

        else if (v11 == 64)
        {
          size_t v22 = v5 >> 6;
          size_t v16 = v5 & 0xFFFFFFFFFFFFFFC0LL;
        }

        else
        {
          size_t v22 = v5 / v11;
          size_t v16 = v5 / v11 * v11;
        }

        uint64_t result = (unint64_t *)((uint64_t (*)(void *, size_t, char *))v7[6])(a2 + 1, v22, __src);
        *a2 += 8 * v16;
      }

      else
      {
        size_t v15 = v11 - v13;
        if (v15 >= v5) {
          size_t v16 = v5;
        }
        else {
          size_t v16 = v15;
        }
        uint64_t result = (unint64_t *)memcpy(&v12[v13], __src, v16);
        unint64_t v17 = v7[2];
        unsigned int v18 = (char *)v10 + v7[1];
        uint64_t v19 = (*(_DWORD *)&v18[v17] + v16);
        *(_DWORD *)&v18[v17] = v19;
        if (v17 == v19)
        {
          uint64_t result = (unint64_t *)((uint64_t (*)(void *, uint64_t))v7[6])(a2 + 1, 1LL);
          unint64_t v20 = v7[2];
          int8x16_t v21 = (char *)v10 + v7[1];
          *a2 += (8 * *(_DWORD *)&v21[v20]);
          *(_DWORD *)&v21[v20] = 0;
        }
      }

      __src += v16;
      v5 -= v16;
    }

    while (v5);
  }

  return result;
}

void *ccdrbg_factory_nistctr(void *result, uint64_t a2)
{
  *uint64_t result = 88LL;
  result[1] = init_0;
  result[2] = reseed;
  result[3] = generate_0;
  result[4] = done;
  result[5] = a2;
  result[6] = must_reseed;
  return result;
}

uint64_t init_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v13 = *(uint64_t **)(a1 + 40);
  cc_clear(0x58uLL, (void *)a2);
  uint64_t v19 = *v13;
  rsize_t v20 = v13[1];
  *(void *)(a2 + 56) = *v13;
  *(void *)(a2 + 64) = v20;
  *(_DWORD *)(a2 + 72) = *((_DWORD *)v13 + 4);
  uint64_t v21 = v13[3];
  *(void *)(a2 + 80) = v21;
  if (v20 >= 0x21 || *(void *)(v19 + 16) != 16LL) {
    cc_try_abort();
  }
  if (!v21)
  {
    if (v20 + 16 >= a7 && v20 + 16 == a3)
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 __s = 0u;
      __memcpy_chk(&__s, a4, a3, 48LL);
      for (; a7; --a7)
        *((_BYTE *)&v27 + a7 + 7) ^= *(_BYTE *)(a8 - 1 + a7);
      goto LABEL_8;
    }

    uint64_t v22 = 4294967233LL;
LABEL_16:
    cc_clear(0x20uLL, (void *)a2);
    cc_clear(0x10uLL, (void *)(a2 + 32));
    uint64_t v24 = -1LL;
    goto LABEL_9;
  }

  uint64_t v22 = 4294967233LL;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 __s = 0u;
  HIBYTE(v27) = HIBYTE(a8);
  uint64_t v23 = derive(a2, &__s, 3u, v14, v15, v16, v17, v18, a3);
  if ((_DWORD)v23)
  {
    uint64_t v22 = v23;
    goto LABEL_16;
  }

  rsize_t v20 = *(void *)(a2 + 64);
LABEL_8:
  cc_clear(v20, (void *)a2);
  cc_clear(0x10uLL, (void *)(a2 + 32));
  update(a2, (uint64_t)&__s);
  uint64_t v22 = 0LL;
  uint64_t v24 = 1LL;
LABEL_9:
  *(void *)(a2 + 48) = v24;
  cc_clear(0x30uLL, &__s);
  return v22;
}

uint64_t generate_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  v25[0] = 0LL;
  v25[1] = 0LL;
  size_t v10 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0LL;
  size_t v11 = (char *)v24 - v10;
  bzero((char *)v24 - v10, v10);
  if (a2 > 0x10000) {
    goto LABEL_22;
  }
  if (*(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL)
  {
    uint64_t v18 = 4294967234LL;
    goto LABEL_21;
  }

  if (!a4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 80))
  {
    if (a4 <= 0x10000)
    {
      uint64_t v17 = derive(a1, __s, 1u, v12, v13, v14, v15, v16, a4);
      if ((_DWORD)v17)
      {
        uint64_t v18 = v17;
        goto LABEL_21;
      }

      goto LABEL_11;
    }

uint64_t reseed( void *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a4;
  memset(__s, 0, sizeof(__s));
  if (!a1[10])
  {
    unint64_t v14 = a1[8] + 16LL;
    if (v14 < a4 || v14 != a2) {
      return 4294967233LL;
    }
    __memcpy_chk(__s, a3, a2, 48LL);
    for (; v9; --v9)
      *((_BYTE *)&v16 + v9 + 7) ^= *(_BYTE *)(a5 - 1 + v9);
    goto LABEL_6;
  }

  uint64_t v11 = 4294967233LL;
  if (a2 <= 0x10000 && a4 <= 0x10000 && *(void *)(a1[7] + 16LL) <= a2)
  {
    HIBYTE(v16) = HIBYTE(a5);
    uint64_t v12 = derive((uint64_t)a1, __s, 2u, a4, a5, a6, a7, a8, a2);
    if ((_DWORD)v12)
    {
      uint64_t v11 = v12;
      goto LABEL_7;
    }

uint64_t done(char *__s)
{
  uint64_t result = cc_clear(0x10uLL, __s + 32);
  *((void *)__s + 6) = -1LL;
  return result;
}

BOOL must_reseed(uint64_t a1)
{
  return *(_DWORD *)(a1 + 72) && *(void *)(a1 + 48) > 0x1000000000000uLL;
}

uint64_t derive( uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = &a9;
  if (a3)
  {
    uint64_t v10 = a3;
    uint64_t v11 = (uint64_t *)v16 + 1;
    uint64_t v12 = a3;
    do
    {
      uint64_t v13 = v15;
      uint64_t *v11 = *v15;
      v15 += 2;
      *(v11 - 1) = v13[1];
      v11 += 2;
      --v12;
    }

    while (v12);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return ccdrbg_df_derive_keys(*(uint64_t (***)(void))(a1 + 80), v10, (uint64_t)v16, *(void *)(a1 + 64) + 16LL, a2);
}

uint64_t update(uint64_t a1, uint64_t a2)
{
  size_t v4 = (ccctr_context_size(*(void *)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0LL;
  size_t v5 = (char *)&v8 - v4;
  bzero((char *)&v8 - v4, v4);
  inc_uint(a1 + 40, 8uLL);
  ccctr_init_internal(*(void *)(a1 + 56));
  update_with_ctr(a1, (uint64_t)v5, a2);
  rsize_t v6 = ccctr_context_size(*(void *)(a1 + 56));
  return cc_clear(v6, v5);
}

uint64_t update_with_ctr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ccctr_update_internal(*(void *)(a1 + 56), a2, 16LL, a3 + *(void *)(a1 + 64), a1 + 32);
}

uint64_t ccec_affinify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccec_affinify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 80LL))();
}

uint64_t ccec_affinify_x_only_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  cczp_sqr_ws(a1, (uint64_t)a2);
  uint64_t v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccn_sqr_ws(uint64_t a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * a2);
  uint64_t result = ccn_mul1(a2 - 1, v9 + 8, a4 + 1, *a4);
  *(void *)(v9 + 8 * a2) = result;
  __int128 v11 = *a4;
  *a3 = *a4 * *a4;
  unint64_t v12 = *(void *)(v9 + 8);
  else {
    uint64_t v13 = v12 >> 63;
  }
  a3[1] = (__PAIR128__(2LL, v11) * v11) >> 64;
  unint64_t v14 = a2 - 2;
  if (a2 >= 2)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = v9 + 8 * a2 + 8;
    uint64_t v17 = (unint64_t *)(v9 + 24);
    uint64_t v18 = a3 + 3;
    do
    {
      uint64_t result = ccn_addmul1(v14, v17, &a4[v15 + 2], a4[v15 + 1]);
      *(void *)(v16 + v15 * 8) = result;
      unint64_t v19 = a4[v15 + 1];
      uint64_t v20 = (v19 * (unsigned __int128)v19) >> 64;
      unint64_t v21 = v19 * v19;
      BOOL v22 = __CFADD__(v21, v13);
      unint64_t v23 = v21 + v13;
      if (v22) {
        ++v20;
      }
      unint64_t v24 = *(v17 - 1);
      *(v18 - 1) = v23 + 2 * v24;
      unint64_t v25 = *v17;
      v17 += 2;
      uint64_t v26 = v25 >> 63;
      BOOL v22 = __CFADD__(v20, 2 * v25);
      uint64_t v27 = v20 + 2 * v25;
      if (v22) {
        uint64_t v28 = v26 + 1;
      }
      else {
        uint64_t v28 = v26;
      }
      BOOL v22 = __CFADD__(__CFADD__(v23, 2 * v24), v27) | __CFADD__(v24 >> 63, __CFADD__(v23, 2 * v24) + v27);
      unint64_t v29 = (v24 >> 63) + __CFADD__(v23, 2 * v24) + v27;
      if (v22) {
        uint64_t v13 = v28 + 1;
      }
      else {
        uint64_t v13 = v28;
      }
      *uint64_t v18 = v29;
      v18 += 2;
      ++v15;
      --v14;
    }

    while (v14 != -1LL);
  }

  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccn_p256_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

uint64_t ccn_p384_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

void *ccec_cp_521()
{
  return &ccec_cp521;
}

uint64_t ccn_mod_521_ws(uint64_t a1, uint64_t a2, uint64_t *a3, int8x16_t *a4)
{
  uint64_t v15 = 0LL;
  memset(v14, 0, sizeof(v14));
  uint64_t v13 = 0LL;
  memset(v12, 0, sizeof(v12));
  ccn_shift_right(9LL, v12, a4 + 4, 9LL);
  v13 += a4[4].i64[0] & 0x1FF;
  uint64_t v8 = ccn_add_ws(a1, 8LL, v12, v12[0].i64, a4->i64);
  v13 += v8;
  uint64_t v9 = (unint64_t *)cczp_prime(a2);
  char v10 = ccn_sub_ws(a1, 9LL, v14, v12[0].i64, v9);
  return ccn_mux(9LL, v10, a3, v12[0].i64, (uint64_t *)v14);
}

uint64_t ccec_double_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_export_pub(uint64_t *a1, char *a2)
{
  uint64_t v3 = (unint64_t *)(a1 + 2);
  uint64_t v4 = (unint64_t *)*a1;
  unint64_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
  return ccec_export_affine_point_public_value(v4, 1, v3, &v6, a2);
}

uint64_t ccec_add_normalized_ws(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9 = *a2;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  if (a6) {
    cczp_add_ws(a1, (uint64_t)a2);
  }
  else {
    cczp_sub_ws(a1, (uint64_t)a2);
  }
  if (ccn_n(v9, v10) || ccn_n(v9, v11))
  {
    if (ccn_n(v9, v10) || !ccn_n(v9, v11))
    {
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t result = cczp_div2_ws(a1, (uint64_t)a2, (int8x16_t *)&a3[v9], &a3[v9]);
    }

    else
    {
      ccn_seti(v9, a3, 1LL);
      cczp_to_ws(a1, (uint64_t)a2);
      ccn_set(v9, &a3[v9], a3);
      uint64_t result = cc_clear(8 * v9, &a3[2 * v9]);
    }
  }

  else
  {
    uint64_t result = ccec_double_ws(a1, a2);
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_full_add_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    ccn_set(v11, &a3[8 * *a2], &a5[8 * *a2]);
    uint64_t result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }

  else
  {
    uint64_t result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 0);
  }

  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_add_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = cczp_n((uint64_t)a2);
  uint64_t v16 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccec_map_to_homogeneous_ws(a1, (uint64_t)a2);
  ccec_map_to_homogeneous_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  uint64_t v7 = cczp_n((uint64_t)a2);
  uint64_t v8 = *a2;
  uint64_t v9 = &a3[*a2];
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  ccn_set(v7, v10, v9);
  cczp_from_ws(a1, (uint64_t)a2);
  BOOL v12 = ccn_n(v7, v11) == 1 && *v11 == 1LL;
  uint64_t v13 = &a3[2 * v8];
  if (ccn_n(v7, a3)) {
    BOOL v12 = 0;
  }
  char v14 = v12 & (ccn_n(v7, v13) == 0);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  ccn_mux(v7, v14, a3, (uint64_t *)v10, a3);
  uint64_t result = ccn_mux(v7, v14, v9, (uint64_t *)v10, v9);
  *(void *)(a1 + 16) = v16;
  return result;
}

uint64_t ccec_map_to_homogeneous_ws(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = cczp_n(a2);
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  uint64_t result = cczp_mul_ws(a1, a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_full_add_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 88LL))();
}

uint64_t ccec_full_sub_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    cczp_negate((uint64_t)a2, (uint64_t *)&a3[8 * *a2], (unint64_t *)&a5[8 * *a2]);
    uint64_t result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }

  else
  {
    uint64_t result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 1);
  }

  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_sub_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v8 = *a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  ccn_set(v8, v10, a5);
  cczp_negate((uint64_t)a2, (uint64_t *)&v10[8 * *a2], (unint64_t *)&a5[8 * *a2]);
  ccn_set(v8, &v10[16 * *a2], &a5[16 * *a2]);
  uint64_t result = ccec_full_add_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v9;
  return result;
}

int8x16_t *aes_ctr_crypt(int8x16_t *a1, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6)
{
  int v6 = a5[15].i32[0];
  BOOL v8 = __OFSUB__(a3, 128LL);
  BOOL v7 = a3 - 128 < 0;
  uint64_t v9 = a3 - 128;
  if (v7 != v8) {
    return Decrypt_Main_Loop_End(a1, a2, v9, a4, a5, a6, v6);
  }
  else {
    return (int8x16_t *)Decrypt_Main_Loop(a1, a2, v9, (uint64_t)a4, a5, a6, v6);
  }
}

uint64_t Decrypt_Main_Loop( _OWORD *a1, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6, int a7)
{
  do
  {
    int64x2_t v8 = vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, v8))));
    _Q20 = *a5;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[1];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[2];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[3];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[4];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[5];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[6];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[7];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[8];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }

    _Q20 = a5[9];
    int8x16_t v167 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }

      _Q20 = a5[10];
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }

      _Q20 = a5[11];
      int8x16_t v167 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }

        _Q20 = a5[12];
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }

        _Q20 = a5[13];
        int8x16_t v167 = a5[14];
      }
    }

    int8x16_t v235 = *(int8x16_t *)a1;
    int8x16_t v236 = *((int8x16_t *)a1 + 1);
    int8x16_t v237 = *((int8x16_t *)a1 + 2);
    int8x16_t v238 = *((int8x16_t *)a1 + 3);
    v234 = a1 + 4;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESE            V23.16B, V20.16B
      AESE            V24.16B, V20.16B
      AESE            V25.16B, V20.16B
    }

    int8x16_t v243 = veorq_s8(v235, veorq_s8(_Q22, v167));
    int8x16_t v244 = veorq_s8(v236, veorq_s8(_Q23, v167));
    int8x16_t v245 = veorq_s8(v237, veorq_s8(_Q24, v167));
    int8x16_t v246 = veorq_s8(v238, veorq_s8(_Q25, v167));
    int8x16_t v247 = *(int8x16_t *)v234;
    int8x16_t v248 = *((int8x16_t *)v234 + 1);
    int8x16_t v249 = *((int8x16_t *)v234 + 2);
    int8x16_t v250 = *((int8x16_t *)v234 + 3);
    a1 = v234 + 4;
    __asm
    {
      AESE            V26.16B, V20.16B
      AESE            V27.16B, V20.16B
      AESE            V28.16B, V20.16B
      AESE            V29.16B, V20.16B
    }

    *a2 = v243;
    a2[1] = v244;
    a2[2] = v245;
    a2[3] = v246;
    v255 = a2 + 4;
    int8x16_t *v255 = veorq_s8(v247, veorq_s8(_Q26, v167));
    v255[1] = veorq_s8(v248, veorq_s8(_Q27, v167));
    v255[2] = veorq_s8(v249, veorq_s8(_Q28, v167));
    v255[3] = veorq_s8(v250, veorq_s8(_Q29, v167));
    a2 = v255 + 4;
    _VF = __OFSUB__(a3, 128LL);
    _NF = a3 - 128 < 0;
    a3 -= 128LL;
  }

  while (_NF == _VF);
  return Decrypt_Main_Loop_End();
}

int8x16_t *Decrypt_Main_Loop_End( int8x16_t *result, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6, int a7)
{
  BOOL v10 = a3 < -112;
  for (uint64_t i = a3 + 112; !v10; i -= 16LL)
  {
    _Q4 = *a5;
    _Q5 = a5[1];
    _Q6 = a5[2];
    int64x2_t v9 = vaddq_s64(v7, v9);
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }

    _Q4 = a5[3];
    _Q5 = a5[4];
    _Q6 = a5[5];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }

    _Q4 = a5[6];
    _Q5 = a5[7];
    _Q6 = a5[8];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }

    _Q20 = a5[9];
    _Q21 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V7.16B, V20.16B
        AESMC           V7.16B, V7.16B
        AESE            V7.16B, V21.16B
        AESMC           V7.16B, V7.16B
      }

      _Q20 = a5[11];
      _Q21 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V7.16B, V20.16B
          AESMC           V7.16B, V7.16B
          AESE            V7.16B, V21.16B
          AESMC           V7.16B, V7.16B
        }

        _Q20 = a5[13];
        _Q21 = a5[14];
      }
    }

    __asm { AESE            V7.16B, V20.16B }

    int8x16_t v54 = *result++;
    *a2++ = veorq_s8(v54, veorq_s8(_Q7, _Q21));
    BOOL v10 = i < 16;
  }

  *a4 = vqtbl1q_s8((int8x16_t)v9, v8);
  return result;
}

uint64_t ccec_affine_point_from_x_ws(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  if ((ccn_cmp_internal(*a2, a4, a2 + 3) & 0x80000000) != 0)
  {
    cczp_to_ws(a1, (uint64_t)a2);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_sub_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    uint64_t result = cczp_sqrt_ws(a1, (uint64_t)a2);
    if (!(_DWORD)result)
    {
      cczp_from_ws(a1, (uint64_t)a2);
      cczp_from_ws(a1, (uint64_t)a2);
      uint64_t result = 0LL;
    }
  }

  else
  {
    uint64_t result = 4294967289LL;
  }

  *(void *)(a1 + 16) = v8;
  return result;
}

uint64_t ccec_mult_default_ws( uint64_t a1, uint64_t *a2, uint64_t *a3, _BYTE *a4, unint64_t a5, uint64_t *a6)
{
  BOOL v12 = a2 + 4;
  unint64_t v51 = a3;
  __src = a4;
  int8x16_t v54 = v12;
  uint64_t v14 = *a2;
  unint64_t v15 = (a5 + 63) >> 6;
  uint64_t v53 = *(void *)(a1 + 16);
  uint64_t v16 = 3 * *a2;
  uint64_t v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v16);
  uint64_t v18 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v14);
  BOOL v55 = ccn_n(v14, a6) == 0;
  if (a5 + 63 >= 0x40) {
    ccn_set((a5 + 63) >> 6, v18, a4);
  }
  ccn_zero(v14 - v15, (char *)v18 + 8 * v15);
  v18->i64[v15 - 1] &= 0xFFFFFFFFFFFFFFFFLL >> -(char)a5;
  unint64_t v50 = (a5 + 63) >> 6;
  unint64_t v57 = v18;
  ccn_shift_right(v50, v18, v18, v55);
  ccec_double_ws(a1, a2);
  ccn_mux(3 * v14, !v55, v17, a6, v17);
  if (!ccn_n(v14, v17))
  {
LABEL_13:
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_16;
  }

  if (cczp_bitlen((uint64_t)&v54[5 * *a2]) >= a5)
  {
    uint64_t v19 = *a2;
    if (ccn_n(*a2, v17))
    {
      uint64_t v47 = v16;
      uint64_t v45 = *(void *)(a1 + 16);
      uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v49 = v19;
      unint64_t v21 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v56 = 2 * v19;
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v19);
      uint64_t v23 = *a2;
      uint64_t v42 = *(void *)(a1 + 16);
      __dst = (void *)v22;
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v23);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      uint64_t v46 = v17;
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      uint64_t v24 = a1;
      uint64_t v25 = a1;
      uint64_t v26 = (uint64_t *)v20;
      cczp_sub_ws(v24, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_add_ws(v25, (uint64_t)a2);
      cczp_sub_ws(v25, (uint64_t)a2);
      uint64_t v48 = v25;
      *(void *)(v25 + 16) = v42;
      uint64_t v27 = v18;
      unint64_t v28 = *(unint64_t *)((char *)v18->i64 + (((a5 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> (a5
                                                                                                 - 1);
      char v29 = v28 & 1;
      unsigned __int8 v30 = !(v28 & 1);
      unint64_t v31 = a5 - 2;
      if (a5 == 2)
      {
        char v43 = !(v28 & 1);
        LOBYTE(v32) = v28 & 1;
      }

      else
      {
        LOBYTE(v32) = v28 & 1;
        do
        {
          char v33 = v32;
          uint64_t v32 = (*(unint64_t *)((char *)v27->i64 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v31) & 1;
          cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
          ccn_cond_swap(v56, v32 ^ v33 | v29 ^ 1, v26, v21);
          ccec_mult_XYCZaddC_ws(v25, a2);
          ccec_mult_XYCZadd_ws(v25, a2);
          unsigned __int8 v30 = v32 & (v29 ^ 1);
          uint64_t v27 = v18;
          v29 |= v32;
          --v31;
        }

        while (v31);
        char v43 = v29 ^ 1;
      }

      cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
      ccn_cond_swap(v56, v27->i8[0] & 1 ^ v32, v26, v21);
      ccec_mult_XYCZaddC_ws(v25, a2);
      ccn_set(v56, __dst, v21);
      uint64_t v41 = v27->i64[0] & 1;
      ccn_cond_swap(v56, v27->i8[0] & 1, v26, v21);
      unsigned int v34 = v26;
      a1 = v25;
      uint64_t v35 = v51;
      uint64_t v40 = *(void *)(v25 + 16);
      cczp_sub_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      *(void *)(v25 + 16) = v40;
      ccn_cond_swap(v56, v41, v34, v21);
      ccec_mult_XYCZadd_ws(v25, a2);
      ccn_mux(v56, v41, v34, v21, v34);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      uint64_t v36 = (unint64_t *)cczp_prime((uint64_t)&v54[5 * *a2]);
      ccn_sub1(v49, __dst, v36, 1uLL);
      unsigned __int8 v37 = (ccn_cmpn_internal(v50, v57, v49, __dst) & 1) == 0;
      BOOL is_point_at_infinity = ccec_is_point_at_infinity(a2, (uint64_t)v46);
      ccn_mux(3 * v49, v43 | is_point_at_infinity | v37, v35, v46, v35);
      cczp_cond_negate((uint64_t)a2, v37, &v35[*a2], (unint64_t *)&v35[*a2]);
      char v39 = v43 & ~v57->i32[0] & 1;
      ccn_cond_clear(v49, v39, &v51[2 * *a2]);
      ccn_seti(v49, v34, 1LL);
      cczp_to_ws(v48, (uint64_t)a2);
      ccn_mux(v49, v39, v35, v34, v35);
      ccn_mux(v49, v39, &v35[*a2], v34, &v35[*a2]);
      *(void *)(v48 + 16) = v45;
      ccec_full_add_ws(v48, (uint64_t)a2);
      ccn_mux(v47, *__src & v55, v35, v46, v35);
      uint64_t result = 0LL;
      goto LABEL_16;
    }

    goto LABEL_13;
  }

  uint64_t result = 4294967289LL;
LABEL_16:
  *(void *)(a1 + 16) = v53;
  return result;
}

uint64_t ccec_mult_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 96LL))();
}

uint64_t ccec_mult_XYCZaddC_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_mult_XYCZadd_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_sub_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

unint64_t ccn_addmul1_asm( uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4 = 0LL;
  if ((a1 & 1) != 0)
  {
    unint64_t v5 = *a3++;
    unint64_t v4 = (v5 * (unsigned __int128)a4 + *a2) >> 64;
    *a2++ += v5 * a4;
    --a1;
  }

  if ((a1 & 2) != 0)
  {
    unint64_t v6 = *a3;
    unint64_t v7 = a3[1];
    a3 += 2;
    unsigned __int128 v8 = *(_OWORD *)a2 + __PAIR128__(v7 * a4, v4);
    unsigned __int128 v9 = v8 + v6 * (unsigned __int128)a4;
    unint64_t v4 = (__CFADD__(__CFADD__((void)v8, v6 * a4), *((void *)&v8 + 1)) | __CFADD__( (v6 * (unsigned __int128)a4) >> 64,  *((void *)&v9 + 1)))
    *(_OWORD *)a2 = v9;
    a2 += 2;
    a1 -= 2LL;
  }

  while (1)
  {
    BOOL v10 = a1 < 4;
    a1 -= 4LL;
    if (v10) {
      break;
    }
    unint64_t v11 = a2[2];
    unint64_t v12 = a2[3];
    unint64_t v14 = *a3;
    unint64_t v15 = a3[1];
    uint64_t v13 = a3 + 2;
    unint64_t v16 = *v13;
    unint64_t v17 = v13[1];
    a3 = v13 + 2;
    uint64_t v18 = (v15 * (unsigned __int128)a4) >> 64;
    unsigned __int128 v19 = *(_OWORD *)a2 + __PAIR128__(v15 * a4, v4);
    BOOL v20 = __CFADD__( __CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1)),  v11);
    unint64_t v21 = (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((void *)&v19 + 1))) + v11;
    v20 |= __CFADD__(v18, v21);
    v21 += v18;
    BOOL v23 = v20;
    BOOL v20 = __CFADD__(v20, v12);
    unint64_t v22 = v23 + v12;
    v20 |= __CFADD__(v17 * a4, v22);
    v22 += v17 * a4;
    uint64_t v24 = v20 + ((v17 * (unsigned __int128)a4) >> 64);
    unsigned __int128 v25 = v19 + v14 * (unsigned __int128)a4;
    *(_OWORD *)a2 = v25;
    uint64_t v26 = a2 + 2;
    uint64_t v27 = (v16 * (unsigned __int128)a4) >> 64;
    uint64_t v29 = __CFADD__(__CFADD__((void)v19, v14 * a4), *((void *)&v19 + 1)) | __CFADD__( (v14 * (unsigned __int128)a4) >> 64,  *((void *)&v25 + 1));
    BOOL v20 = __CFADD__(v29, v21);
    uint64_t v28 = v29 + v21;
    uint64_t v31 = v20 | __CFADD__(v16 * a4, v28);
    BOOL v20 = __CFADD__(v31, v22);
    uint64_t v30 = v31 + v22;
    unint64_t v4 = (v20 | __CFADD__(v27, v30)) + v24;
    *uint64_t v26 = v16 * a4 + v28;
    v26[1] = v27 + v30;
    a2 = v26 + 2;
  }

  return v4;
}

uint64_t ccec_pairwise_consistency_check_ws( uint64_t a1, unint64_t **a2, uint64_t (**a3)(void, unint64_t, void *))
{
  unint64_t v6 = **a2;
  char v13 = 0;
  uint64_t v7 = *(void *)(a1 + 16);
  unsigned __int128 v8 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v6);
  unsigned __int128 v9 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v6);
  BOOL v10 = (unint64_t *)ccsha256_di();
  uint64_t result = ccec_sign_composite_msg_ws(a1, a2, v10, 0LL, &v13, v8, v9, a3);
  if (!(_DWORD)result)
  {
    v14[0] = 0LL;
    v14[1] = 0LL;
    unint64_t v12 = (unint64_t *)ccsha256_di();
    uint64_t result = ccec_verify_composite_msg_ws(a1, (uint64_t *)a2, v12, 0LL, &v13, (uint64_t)v8, (uint64_t)v9, v14);
    if (!(_DWORD)result)
    {
      cc_cmp_safe_internal(16LL, CCEC_FAULT_CANARY, (char *)v14);
      uint64_t result = 0LL;
    }
  }

  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t (**ccec_projectify_jacobian_ws( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(void, unint64_t, uint64_t)))(void, unint64_t, uint64_t)
{
  unint64_t v5 = a5;
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5)
  {
    uint64_t v10 = cczp_bitlen((uint64_t)a2);
    unint64_t v5 = (uint64_t (**)(void, unint64_t, uint64_t))ccn_random_bits(v10 - 1, a3 + 16 * *a2, v5);
    ccn_set_bit(a3 + 16 * *a2, v10 - 2, 1LL);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
  }

  else
  {
    ccn_seti(*a2, (void *)(a3 + 16 * *a2), 1LL);
    cczp_to_ws(a1, (uint64_t)a2);
  }

  cczp_to_ws(a1, (uint64_t)a2);
  cczp_to_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v9;
  return v5;
}

uint64_t ccec_projectify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 72LL))();
}

uint64_t ccec_twin_mult_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  uint64_t v12 = *a2;
  uint64_t v24 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  char v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v25 = 3 * v12;
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 12 * v12);
  uint64_t v15 = v14 + 48 * v12;
  uint64_t v26 = v14;
  uint64_t v16 = v14 + 72 * v12;
  ccec_full_add_ws(a1, (uint64_t)a2);
  ccec_full_sub_ws(a1, a2, v16, a5, a7);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  unsigned int v23 = cczp_inv_ws(a1, (uint64_t)a2);
  if (!v23)
  {
    ccec_twin_mult_normalize_ws(a1, a2);
    ccec_twin_mult_normalize_ws(a1, a2);
    ccec_twin_mult_normalize_ws(a1, a2);
    ccec_twin_mult_normalize_ws(a1, a2);
    ccn_seti(v12, v13, 1LL);
    cczp_to_ws(a1, (uint64_t)a2);
    ccn_set(v12, (void *)(v26 + 24 * v12 + 16 * *a2), (void *)(v26 + 16 * *a2));
    ccn_set(v12, (void *)(v15 + 16 * *a2), (void *)(v26 + 16 * *a2));
    ccn_set(v12, (void *)(v16 + 16 * *a2), (void *)(v26 + 16 * *a2));
    unint64_t v17 = ccn_bitlen_internal(v12, a4);
    unint64_t v18 = ccn_bitlen_internal(v12, a6);
    v27[1] = 0LL;
    v27[2] = 0LL;
    if (v17 <= v18) {
      unint64_t v17 = v18;
    }
    v27[0] = 0LL;
    ccn_recode_jsf_init((uint64_t)v27, v17, a4, a6);
    ccn_set(v12, a3, (void *)(v26 + 16 * *a2));
    ccn_set(v12, &a3[8 * *a2], (void *)(v26 + 16 * *a2));
    cc_clear(8 * v12, &a3[16 * *a2]);
    for (; v17 != -1LL; --v17)
    {
      ccec_double_ws(a1, a2);
      uint64_t v28 = 0LL;
      ccn_recode_jsf_column((uint64_t)v27, v17, (uint64_t)&v28);
      if (v28)
      {
        unsigned __int128 v19 = (char *)(v26 + 8 * ccn_recode_jsf_index(&v28) * v25);
        else {
          ccec_full_sub_normalized_ws(a1, a2, a3, (uint64_t)a3, v19);
        }
      }
    }
  }

  *(void *)(a1 + 16) = v24;
  return v23;
}

uint64_t ccec_twin_mult_normalize_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  uint64_t result = cczp_mul_ws(a1, (uint64_t)a2);
  *(void *)(a1 + 16) = v5;
  return result;
}

unint64_t cc_cmp_safe_internal(uint64_t a1, char *a2, char *a3)
{
  if (!a1) {
    return 1LL;
  }
  unsigned __int8 v3 = 0;
  do
  {
    char v5 = *a2++;
    char v4 = v5;
    char v6 = *a3++;
    v3 |= v6 ^ v4;
    --a1;
  }

  while (a1);
  return ((unint64_t)v3 + 0xFFFFFFFF) >> 32;
}

uint64_t ccec_generate_key_fips_ws( uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = ccec_generate_key_internal_fips_ws(a1, a2, a3, a4);
  if (!(_DWORD)result)
  {
    if (ccec_pairwise_consistency_check_ws( a1,  (unint64_t **)a4,  (uint64_t (**)(void, unint64_t, void *))a3)) {
      uint64_t result = 4294967278LL;
    }
    else {
      uint64_t result = 0LL;
    }
  }

  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccec_x963_import_priv_ws( uint64_t a1, unint64_t *a2, unint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  unsigned int v5 = *a4;
  BOOL v6 = v5 > 7;
  int v7 = (1 << v5) & 0xD0;
  if (v6 || v7 == 0) {
    return 4294967289LL;
  }
  uint64_t v14 = a2 + 4;
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = cczp_bitlen((uint64_t)&v14[5 * *a2]);
  uint64_t result = ccec_x963_import_pub_ws(a1, a2, a3 - ((unint64_t)(v16 + 7) >> 3), a4, a5);
  if (!(_DWORD)result)
  {
    unint64_t v18 = *a2;
    uint64_t v19 = (uint64_t)&a5[3 * **a5 + 2];
    unint64_t v20 = (unint64_t)(cczp_bitlen((uint64_t)&v14[5 * *a2]) + 7) >> 3;
    uint64_t v21 = cczp_bitlen((uint64_t)a2);
    uint64_t result = ccn_read_uint_internal(v18, v19, v20, &a4[((unint64_t)(v21 + 7) >> 2) | 1]);
  }

  *(void *)(a1 + 16) = v15;
  return result;
}

uint64_t ccec_x963_import_pub_ws( uint64_t a1, unint64_t *a2, uint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  if (!a3) {
    return 4294967289LL;
  }
  if (a3 == 1)
  {
    int v10 = *a4;
    if (!*a4) {
      return 4294967136LL;
    }
  }

  else
  {
    int v10 = *a4;
  }

  unsigned int v12 = v10 - 2;
  if (v12 > 5 || ((0x37u >> v12) & 1) == 0) {
    return 4294967289LL;
  }
  int v13 = dword_10019FB90[(char)v12];
  uint64_t v14 = *(void *)(a1 + 16);
  *a5 = a2;
  uint64_t result = ccec_import_affine_point_ws(a1, a2, v13, a3, a4, a5 + 2);
  if (!(_DWORD)result)
  {
    ccn_seti(*a2, &a5[2 * **a5 + 2], 1LL);
    uint64_t v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * *a2);
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, (uint64_t *)a2, v15, (uint64_t)(a5 + 2));
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_x963_import_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  unsigned __int128 v8 = cc_malloc_clear(160 * *a1);
  uint64_t v9 = 20 * *a1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 0LL;
  v12[3] = cc_ws_alloc;
  int v13 = cc_ws_free;
  if (!v8) {
    return 4294967283LL;
  }
  uint64_t v10 = ccec_x963_import_pub_ws((uint64_t)v12, a1, a2, a3, a4);
  v13((uint64_t)v12);
  return v10;
}

int8x16_t *ccm128_encrypt( int8x16_t *result, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100168400[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  unsigned __int128 v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  int8x16_t v19 = v8[2];
  int64x2_t v20 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask_1);
  do
  {
    int64x2_t v20 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v20, *(int64x2_t *)qword_100168400), v7),  vbicq_s8((int8x16_t)v20, v7));
    int8x16_t v21 = *result++;
    __asm
    {
      AESE            V3.16B, V16.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V16.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V17.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V17.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V18.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V18.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V19.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V19.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V20.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V20.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V21.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V21.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V22.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V22.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V23.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V23.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V24.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V24.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V25.16B
      AESE            V1.16B, V25.16B
    }

    int8x16_t v64 = veorq_s8(_Q1, v19);
    *a2++ = veorq_s8(v21, veorq_s8(_Q3, v19));
    _VF = __OFSUB__(a4--, 1);
  }

  while (!((a4 < 0) ^ _VF | (a4 == 0)));
  *a6 = vqtbl1q_s8((int8x16_t)v20, *(int8x16_t *)Lbswap_mask_1);
  *a3 = v64;
  return result;
}

int8x16_t *ccm192_encrypt( int8x16_t *result, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100168400[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  unsigned __int128 v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  int8x16_t v21 = v8[4];
  int64x2_t v22 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask_1);
  do
  {
    int64x2_t v22 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v22, *(int64x2_t *)qword_100168400), v7),  vbicq_s8((int8x16_t)v22, v7));
    int8x16_t v23 = *result++;
    __asm
    {
      AESE            V3.16B, V16.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V16.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V17.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V17.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V18.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V18.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V19.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V19.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V20.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V20.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V21.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V21.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V22.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V22.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V23.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V23.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V24.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V24.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V25.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V25.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V26.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V26.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V27.16B
      AESE            V1.16B, V27.16B
    }

    int8x16_t v74 = veorq_s8(_Q1, v21);
    *a2++ = veorq_s8(v23, veorq_s8(_Q3, v21));
    _VF = __OFSUB__(a4--, 1);
  }

  while (!((a4 < 0) ^ _VF | (a4 == 0)));
  *a6 = vqtbl1q_s8((int8x16_t)v22, *(int8x16_t *)Lbswap_mask_1);
  *a3 = v74;
  return result;
}

int8x16_t *ccm256_encrypt( int8x16_t *result, int8x16_t *a2, int8x16_t *a3, int a4, int8x16_t *a5, int8x16_t *a6, unsigned int a7)
{
  int8x16_t v7 = *(int8x16_t *)&qword_100168400[2 * a7];
  _Q16 = *a5;
  _Q17 = a5[1];
  _Q18 = a5[2];
  _Q19 = a5[3];
  unsigned __int128 v8 = a5 + 4;
  _Q20 = *v8;
  _Q21 = v8[1];
  _Q22 = v8[2];
  _Q23 = v8[3];
  v8 += 4;
  _Q24 = *v8;
  _Q25 = v8[1];
  _Q26 = v8[2];
  _Q27 = v8[3];
  v8 += 4;
  _Q28 = *v8;
  _Q29 = v8[1];
  int8x16_t v23 = v8[2];
  int64x2_t v24 = (int64x2_t)vqtbl1q_s8(*a6, *(int8x16_t *)Lbswap_mask_1);
  do
  {
    int64x2_t v24 = (int64x2_t)vorrq_s8( vandq_s8((int8x16_t)vaddq_s64(v24, *(int64x2_t *)qword_100168400), v7),  vbicq_s8((int8x16_t)v24, v7));
    int8x16_t v25 = *result++;
    __asm
    {
      AESE            V3.16B, V16.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V16.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V17.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V17.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V18.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V18.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V19.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V19.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V20.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V20.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V21.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V21.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V22.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V22.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V23.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V23.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V24.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V24.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V25.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V25.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V26.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V26.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V27.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V27.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V28.16B
      AESMC           V3.16B, V3.16B
      AESE            V1.16B, V28.16B
      AESMC           V1.16B, V1.16B
      AESE            V3.16B, V29.16B
      AESE            V1.16B, V29.16B
    }

    int8x16_t v84 = veorq_s8(_Q1, v23);
    *a2++ = veorq_s8(v25, veorq_s8(_Q3, v23));
    _VF = __OFSUB__(a4--, 1);
  }

  while (!((a4 < 0) ^ _VF | (a4 == 0)));
  *a6 = vqtbl1q_s8((int8x16_t)v24, *(int8x16_t *)Lbswap_mask_1);
  *a3 = v84;
  return result;
}

uint64_t ccrng_crypto_generate(uint64_t a1, rsize_t a2, char *a3)
{
  if (!a2) {
    return 0LL;
  }
  rsize_t v6 = a2;
  int8x16_t v7 = a3;
  while (1)
  {
    unsigned __int128 v8 = *(os_unfair_lock_s **)(a1 + 24);
    if (v8)
    {
      os_unfair_lock_lock(v8);
      uint64_t v9 = *(os_unfair_lock_s **)(a1 + 24);
      if (v9) {
        os_unfair_lock_assert_owner(v9);
      }
    }

    memset(v29, 0, sizeof(v29));
    rsize_t v10 = *(void *)(a1 + 56);
    int v11 = ccrng_schedule_read(*(void *)(a1 + 16));
    if (v11 == 1) {
      goto LABEL_13;
    }
    int v12 = v11;
    uint64_t seed = ccentropy_get_seed(*(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 8), v10, (uint64_t)v29);
    if ((_DWORD)seed == -10) {
      break;
    }
    uint64_t v14 = seed;
    if ((_DWORD)seed) {
      goto LABEL_40;
    }
    uint64_t v15 = drbg_reseed((void *)a1, v10, (uint64_t)v29, 0LL, 0LL);
    if ((_DWORD)v15)
    {
      uint64_t v14 = v15;
LABEL_40:
      cc_clear(v10, v29);
      goto LABEL_36;
    }

    ccrng_schedule_notify_reseed(*(_BYTE **)(a1 + 16));
    cc_clear(v10, v29);
LABEL_13:
    if (v6 >= *(void *)(a1 + 48)) {
      unint64_t v16 = *(void *)(a1 + 48);
    }
    else {
      unint64_t v16 = v6;
    }
    unint64_t v17 = *(os_unfair_lock_s **)(a1 + 24);
    if (v17) {
      os_unfair_lock_assert_owner(v17);
    }
    if (a2 <= 0xB && (unint64_t v18 = *(void *)(a1 + 64), v18 >= v16))
    {
      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v22 = *(void *)(a1 + 80);
      int8x16_t v23 = (void *)(v21 + v22);
      uint64_t v24 = v21 + v18;
      unint64_t v25 = v24 - (v21 + v22);
      if (v25 >= v16) {
        size_t v26 = v16;
      }
      else {
        size_t v26 = v24 - (v21 + v22);
      }
      memcpy(v7, (const void *)(v21 + v22), v26);
      cc_clear(v26, v23);
      *(void *)(a1 + 80) += v26;
      if (v25 < v16)
      {
        uint64_t v19 = drbg_generate((void *)a1, *(void *)(a1 + 64), *(void *)(a1 + 72));
        if ((_DWORD)v19)
        {
LABEL_41:
          uint64_t v14 = v19;
          goto LABEL_36;
        }

        memcpy(&v7[v26], *(const void **)(a1 + 72), v16 - v26);
        cc_clear(v16 - v26, *(void **)(a1 + 72));
        *(void *)(a1 + 80) = v16 - v26;
      }
    }

    else
    {
      uint64_t v19 = drbg_generate((void *)a1, v16, (uint64_t)v7);
      if ((_DWORD)v19) {
        goto LABEL_41;
      }
    }

    int64x2_t v20 = *(os_unfair_lock_s **)(a1 + 24);
    if (v20) {
      os_unfair_lock_unlock(v20);
    }
    v7 += v16;
    v6 -= v16;
    if (!v6) {
      return 0LL;
    }
  }

  if (v12 == 2) {
    goto LABEL_13;
  }
  if (v12 == 3) {
    uint64_t v14 = 4294967134LL;
  }
  else {
    uint64_t v14 = 0xFFFFFFFFLL;
  }
LABEL_36:
  uint64_t v28 = *(os_unfair_lock_s **)(a1 + 24);
  if (v28) {
    os_unfair_lock_unlock(v28);
  }
  cc_clear(a2, a3);
  return v14;
}

uint64_t drbg_reseed(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  rsize_t v10 = (os_unfair_lock_s *)a1[3];
  if (v10) {
    os_unfair_lock_assert_owner(v10);
  }
  uint64_t result = ccdrbg_reseed(a1[4], a1[5], a2, a3, a4, a5);
  if (!(_DWORD)result) {
    a1[10] = a1[8];
  }
  return result;
}

uint64_t ccrng_crypto_init( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a8 > 0x40) {
    return 4294967291LL;
  }
  uint64_t result = 0LL;
  *a1 = generate_1;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = a4;
  a1[4] = a5;
  a1[5] = a6;
  a1[6] = a7;
  a1[7] = a8;
  a1[8] = a9;
  a1[9] = a10;
  a1[10] = a9;
  return result;
}

uint64_t drbg_generate(void *a1, uint64_t a2, uint64_t a3)
{
  rsize_t v6 = (os_unfair_lock_s *)a1[3];
  if (v6) {
    os_unfair_lock_assert_owner(v6);
  }
  return ccdrbg_generate(a1[4], a1[5], a2, a3, 0LL, 0LL);
}

uint64_t cczp_inv_default_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = cczp_n(a2);
  uint64_t v9 = cczp_prime(v6);
  uint64_t v46 = *(void *)(a1 + 16);
  __int128 __s = a3;
  int v11 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  int v12 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  cczp_from_ws(a1, v6);
  int v13 = (void *)cczp_prime(v6);
  ccn_set(v8, v12, v13);
  uint64_t v14 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  uint64_t v53 = v14;
  ccn_seti(v8, v14, 1LL);
  uint64_t __n = 8 * v8;
  int8x16_t v54 = v15;
  cc_clear(8 * v8, v15);
  uint64_t v52 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  unint64_t v16 = (v8 << 7) | 0x1E;
  if (v16 != 30)
  {
    uint64_t v17 = 0LL;
    unint64_t v49 = v8 - 1;
    unint64_t v50 = v16 / 0x1F;
    unint64_t v48 = v8 - 2;
    unint64_t v51 = (void *)v6;
    uint64_t v56 = v8;
    do
    {
      uint64_t v18 = v11[v49];
      uint64_t v19 = v12[v49];
      uint64_t v55 = v17;
      if (v8 >= 2)
      {
        unint64_t v20 = v48;
        do
        {
          char v21 = __clz(v19 | v18 | 1);
          uint64_t v18 = (v11[v20] >> v22) | (v18 << v21);
          uint64_t v19 = (v12[v20--] >> v22) | (v19 << v21);
        }

        while (v20 < v8);
      }

      unint64_t v23 = 0LL;
      uint64_t v24 = 0LL;
      unint64_t v25 = v18 & 0xFFFFFFFF80000000LL | *v11 & 0x7FFFFFFFLL;
      unint64_t v26 = v19 & 0xFFFFFFFF80000000LL | *v12 & 0x7FFFFFFFLL;
      uint64_t v27 = 31LL;
      uint64_t v28 = 0x80000000LL;
      unint64_t v29 = 0x80000000LL;
      do
      {
        unint64_t v30 = v25 & 1;
        unint64_t v31 = v25 >> !(v25 & 1);
        unint64_t v32 = v31 ^ v26;
        unint64_t v33 = v25 & ((((v31 - v26) ^ v31 | v31 ^ v26) ^ v31) >> 63);
        uint64_t v34 = -(uint64_t)v33;
        unint64_t v35 = v26 & -(uint64_t)v33--;
        unint64_t v36 = v33 & v31 | v35;
        unint64_t v26 = v32 ^ v36;
        unint64_t v37 = v33 & v29 | v24 & v34;
        v24 ^= v29 ^ v37;
        unint64_t v38 = v33 & v23 | v28 & v34;
        v28 ^= v23 ^ v38;
        unint64_t v25 = (v36 - (v26 & -(uint64_t)v30)) >> v30;
        unint64_t v29 = (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v37 - (v24 & -(uint64_t)v30)) >> 1);
        unint64_t v23 = (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v38 - (v28 & -(uint64_t)v30)) >> 1);
        --v27;
      }

      while (v27);
      uint64_t v39 = a1;
      unint64_t updated = cczp_inv_update_ws( a1,  v8,  v52,  v11,  (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v37 - (v24 & -(uint64_t)v30)) >> 1),  v12,  (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000LL | ((v38 - (v28 & -(uint64_t)v30)) >> 1));
      unint64_t v41 = cczp_inv_update_ws(v39, v56, v12, v11, v24, v12, v28);
      ccn_set(v56, v11, v52);
      unint64_t v42 = updated - 1;
      uint64_t v43 = -(uint64_t)updated;
      a1 = v39;
      uint64_t v44 = v42 & v23 | v43 & -(uint64_t)v23;
      uint64_t v6 = (uint64_t)v51;
      unint64_t v8 = v56;
      cczp_inv_update_redc_ws(v39, v51, v52, v53, v42 & v29 | v43 & -(uint64_t)v29, v54, v44);
      cczp_inv_update_redc_ws( v39,  v51,  v54,  v53,  (v41 - 1) & v24 | -(uint64_t)v41 & -v24,  v54,  (v41 - 1) & v28 | -(uint64_t)v41 & -v28);
      ccn_set(v56, v53, v52);
      uint64_t v17 = v55 + 1;
    }

    while (v55 + 1 != v50);
  }

  if (ccn_n(v8, v12) == 1 && *v12 == 1LL)
  {
    cczp_to_ws(a1, v6);
    uint64_t result = 0LL;
  }

  else
  {
    cc_clear(__n, __s);
    uint64_t result = 4294967289LL;
  }

  *(void *)(a1 + 16) = v46;
  return result;
}

unint64_t cczp_inv_update_ws( uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v19 = *(void *)(a1 + 16);
  uint64_t v13 = a2 + 1;
  uint64_t v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2 + 1);
  uint64_t v15 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  if (a2) {
    ccn_set(a2, v14, a4);
  }
  ccn_zero(1LL, (char *)v14 + 8 * a2);
  ccn_cond_neg(v13, a5 < 0, v14->i64, v14->i64);
  if (a2) {
    ccn_set(a2, v15, a6);
  }
  ccn_zero(1LL, &v15[8 * a2]);
  ccn_cond_neg(v13, a7 < 0, (uint64_t *)v15, (uint64_t *)v15);
  ccn_mul1(v13, v14, v14, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  ccn_addmul1(v13, v14, v15, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  unint64_t v16 = (unint64_t)v14->i64[a2] >> 63;
  ccn_cond_neg(v13, v14->i64[a2] < 0, v14->i64, v14->i64);
  ccn_shift_right(v13, v14, v14, 31LL);
  ccn_set(a2, a3, v14);
  *(void *)(a1 + 16) = v19;
  return v16;
}

uint64_t cczp_inv_update_redc_ws( uint64_t a1, void *a2, void *a3, unint64_t *a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v12 = cczp_n((uint64_t)a2);
  uint64_t v21 = *(void *)(a1 + 16);
  uint64_t v13 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v14 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  cczp_cond_negate((uint64_t)a2, a5 < 0, v13->i64, a4);
  cczp_cond_negate((uint64_t)a2, a7 < 0, v14, a6);
  v13->i64[v12] = ccn_mul1(v12, v13, v13, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  v13->i64[v12] += ccn_addmul1(v12, v13, v14, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  uint64_t v15 = cczp_prime((uint64_t)a2);
  v13->i64[v12] += ccn_addmul1(v12, v13, v15, (LODWORD(a2[*a2 + 3]) * v13->i32[0]) & 0x7FFFFFFF);
  ccn_shift_right(v12 + 1, v13, v13, 31LL);
  ccn_set(v12, a3, v13);
  unint64_t v16 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v17 = ccn_subn(v12 + 1, v13, v13->i64, v12, v16);
  uint64_t result = ccn_mux(v12, v17, (uint64_t *)a3, (uint64_t *)a3, v13->i64);
  *(void *)(a1 + 16) = v21;
  return result;
}

uint64_t cczp_inv_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 40LL))();
}

uint64_t cczp_n(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t cczp_bitlen(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccn_mul(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result *= -8LL;
    char v4 = (unint64_t *)(a2 - result);
    uint64_t v5 = a3 - result;
    uint64_t v6 = a4 - result;
    uint64_t v7 = result;
    uint64_t v8 = result;
    unint64_t v9 = 0LL;
    unint64_t v10 = *(void *)(v6 + result);
    do
    {
      unsigned __int128 v11 = *(unint64_t *)(v5 + v8) * (unsigned __int128)v10 + v9;
      *(unint64_t *)((char *)v4 + v8) = v11;
      unint64_t v9 = *((void *)&v11 + 1);
      v8 += 8LL;
    }

    while (v8);
    while (1)
    {
      unint64_t *v4 = v9;
      v7 += 8LL;
      if (!v7) {
        break;
      }
      ++v4;
      uint64_t v12 = result;
      unint64_t v9 = 0LL;
      unint64_t v13 = *(void *)(v6 + v7);
      do
      {
        unsigned __int128 v14 = *(unint64_t *)(v5 + v12) * (unsigned __int128)v13 + v9 + *(unint64_t *)((char *)v4 + v12);
        *(unint64_t *)((char *)v4 + v12) = v14;
        unint64_t v9 = *((void *)&v14 + 1);
        v12 += 8LL;
      }

      while (v12);
    }
  }

  return result;
}

uint64_t ccmode_ctr_init(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 48);
  *a2 = v8;
  uint64_t v9 = (*(uint64_t (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, void *, uint64_t))(a1 + 32))(a1, a2, a5);
  return v9;
}

uint64_t ccn_cmpn_public_value(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    unint64_t v4 = a3;
  }
  else {
    unint64_t v4 = a1;
  }
  if (a1 >= a3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a4;
  }
  if (a1 <= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a1;
  }
  if (a1 < a3) {
    unsigned int v7 = -1;
  }
  else {
    unsigned int v7 = 1;
  }
  unsigned int v8 = ccn_cmp_public_value(v4, a2, a4);
  if (ccn_n(v6 - v4, v5 + 8 * v4)) {
    return v7;
  }
  else {
    return v8;
  }
}

uint64_t cczp_sqrt_tonelli_shanks_precomp_ws( uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12 = cczp_n(a2);
  uint64_t v23 = *(void *)(a1 + 16);
  unint64_t v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unsigned __int128 v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  unint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, a6);
  uint64_t v18 = v23;
  if (!(_DWORD)result)
  {
    ccn_seti(v12, v16, 1LL);
    unint64_t v25 = v16;
    cczp_to_ws(a1, a2);
    ccn_set(v12, v15, a7);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    if (a5 >= 2)
    {
      while (1)
      {
        ccn_set(v12, v14, v13);
        if (a5 - 1 < 2) {
          break;
        }
        uint64_t v19 = 2LL;
        do
        {
          cczp_sqr_ws(a1, a2);
          ++v19;
        }

        while (a5 != v19);
        char v20 = ccn_cmp_internal(v12, v14, v25) & 1;
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, a3, (uint64_t *)v14, a3);
        cczp_sqr_ws(a1, a2);
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
        --a5;
      }

      char v21 = ccn_cmp_internal(v12, v14, v25) & 1;
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, a3, (uint64_t *)v14, a3);
      cczp_sqr_ws(a1, a2);
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
    }

    cczp_sqr_ws(a1, a2);
    else {
      uint64_t result = 0LL;
    }
    uint64_t v18 = v23;
  }

  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_sqrt_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = ~*(_DWORD *)cczp_prime(a2) & 3LL;
  uint64_t v9 = cczp_n(a2);
  uint64_t v10 = *(void *)(a1 + 16);
  unsigned __int128 v11 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  uint64_t v12 = (void *)cczp_prime(a2);
  if (v8)
  {
    ccn_set(v9, v11, v12);
    v11->i64[0] &= ~1uLL;
    unint64_t v14 = ccn_trailing_zeros(v9, (uint64_t)v11);
    ccn_shift_right_multi(v9, v11, v11, v14);
    uint64_t v15 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_sub1(v9, v15, (unint64_t *)v11, 1uLL);
    ccn_shift_right(v9, v15, v15, 1LL);
    unint64_t v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_seti(v9, v16, 1LL);
    uint64_t result = cczp_power_fast_ws(a1, a2, v16, v16, (uint64_t)v11);
    if (!(_DWORD)result) {
      uint64_t result = cczp_sqrt_tonelli_shanks_precomp_ws(a1, a2, a3, a4, v14, (uint64_t)v15, v16);
    }
  }

  else
  {
    ccn_add1_ws(a1, v9, v11, (uint64_t *)v12, 1LL);
    ccn_shift_right(v9, v11, v11, 2LL);
    uint64_t result = cczp_power_fast_ws(a1, a2, a3, a4, (uint64_t)v11);
    if (!(_DWORD)result)
    {
      cczp_sqr_ws(a1, a2);
      else {
        uint64_t result = 0LL;
      }
    }
  }

  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sqrt_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 48LL))();
}

BOOL ccec_is_point_projective_ws(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a1 + 24))(a1, *a2);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  BOOL result = ccn_cmp_internal(v4, v7, v6) == 0;
  *(void *)(a1 + 16) = v5;
  return result;
}

BOOL ccec_is_point_at_infinity(void *a1, uint64_t a2)
{
  return ccn_n(*a1, a2 + 16LL * *a1) == 0;
}

uint64_t ccentropy_get_seed(uint64_t (***a1)(void, uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  BOOL v8 = timingsafe_enable_if_supported();
  uint64_t v6 = (**a1)(a1, a2, a3);
  cc_disable_dit_with_sb((unsigned int *)&v8);
  return v6;
}

uint64_t ccec_make_pub_from_priv_ws( uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t a4, uint64_t a5, uint64_t **a6)
{
  *a6 = a2;
  uint64_t v12 = *a2;
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  if (ccec_validate_scalar(a2, a4))
  {
    uint64_t result = 4294967274LL;
    goto LABEL_10;
  }

  if (a5)
  {
    uint64_t result = ccec_validate_point_and_projectify_ws(a1, a2, v14, a5);
    if ((_DWORD)result) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
    if ((_DWORD)result) {
      goto LABEL_10;
    }
  }

  if (ccec_mult_blinded_ws(a1, (unint64_t *)a2, (uint64_t)(a6 + 2), a4, v14, a3))
  {
    uint64_t result = 4294967280LL;
  }

  else if (ccec_is_point_projective_ws(a1, a2))
  {
    if (ccec_affinify_ws(a1, (uint64_t)a2))
    {
      uint64_t result = 4294967279LL;
    }

    else
    {
      ccn_seti(v12, &a6[2 * **a6 + 2], 1LL);
      uint64_t result = 0LL;
    }
  }

  else
  {
    uint64_t result = 4294967277LL;
  }

uint64_t ccn_recode_jsf_init(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0LL;
  unint64_t v5 = (unint64_t)(a2 - 1) >> 6;
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = a4;
  char v6 = (a2 - 1) & 0x3F;
  unint64_t v7 = (unint64_t)(a2 - 2) >> 6;
  char v8 = (a2 - 2) & 0x3F;
  v16[0] = a3;
  v16[1] = a4;
  unint64_t v9 = (unint64_t)(a2 - 3) >> 6;
  char v10 = (a2 - 3) & 0x3F;
  unint64_t v11 = (unint64_t)(a2 - 4) >> 6;
  char v12 = (a2 - 4) & 0x3F;
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = v16[v4];
    *(_BYTE *)(result + v4) = (8 * ((*(void *)(v15 + 8 * v5) >> v6) & 1)) | (4
                                                                             * ((*(void *)(v15 + 8 * v7) >> v8) & 1)) | (2 * ((*(void *)(v15 + 8 * v9) >> v10) & 1)) | (*(void *)(v15 + 8 * v11) >> v12) & 1;
    uint64_t v4 = 1LL;
    char v13 = 0;
  }

  while ((v14 & 1) != 0);
  return result;
}

uint64_t ccn_recode_jsf_column(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0LL;
  __int16 v10 = 0;
  if ((*(_BYTE *)result & 0x20) != 0) {
    char v4 = *(_BYTE *)result & 0x1F ^ 0x1F;
  }
  else {
    char v4 = *(_BYTE *)result & 0x1F;
  }
  LOBYTE(v10) = v4;
  if ((*(_BYTE *)(result + 1) & 0x20) != 0) {
    char v5 = *(_BYTE *)(result + 1) & 0x1F ^ 0x1F;
  }
  else {
    char v5 = *(_BYTE *)(result + 1) & 0x1F;
  }
  HIBYTE(v10) = v5;
  __int128 v11 = *(_OWORD *)(result + 8);
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (a2 < 5) {
      LOBYTE(v8) = 0;
    }
    else {
      uint64_t v8 = (*(void *)(*((void *)&v11 + v3) + 8 * ((a2 - 5) >> 6)) >> ((a2 - 5) & 0x3F)) & 1LL;
    }
    if (*((unsigned __int8 *)&v10 + v3) >= F_2_2_11[*((unsigned __int8 *)&v10 + (v3 ^ 1))])
    {
      LOBYTE(v8) = v8 | 0x20;
      if ((*(_BYTE *)(result + v3) & 0x20) != 0) {
        int v9 = -1;
      }
      else {
        int v9 = 1;
      }
    }

    else
    {
      int v9 = 0;
    }

    char v6 = 0;
    *(_DWORD *)(a3 + 4 * v3) = v9;
    *(_BYTE *)(result + v3) = v8 ^ (2 * *(_BYTE *)(result + v3));
    uint64_t v3 = 1LL;
  }

  while ((v7 & 1) != 0);
  return result;
}

unint64_t ccn_recode_jsf_index(_DWORD *a1)
{
  return (*a1 & 1 | (2 * (a1[1] & 1u))) - (unint64_t)(*a1 + a1[1] != 0);
}

uint64_t ccn_recode_jsf_direction(unsigned int *a1)
{
  uint64_t result = *a1;
  if ((_DWORD)result != -1)
  {
    if (!(_DWORD)result && a1[1] == -1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 1LL;
    }
  }

  return result;
}

uint64_t ccec_compressed_x962_import_pub( unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  LODWORD(result) = ccec_x963_import_pub(a1, a2, a3, a4);
  if ((_DWORD)result == -7) {
    return 4294967135LL;
  }
  else {
    return result;
  }
}

BOOL ccn_add_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, uint64_t *a5)
{
  return ccn_add_asm(a2, a3, a4, a5);
}

uint64_t cc_log_default()
{
  if (cc_log_default_initp != -1) {
    _os_once(&cc_log_default_initp, &cc_log_default_log, cc_log_init);
  }
  return cc_log_default_log;
}

os_log_t cc_log_init(os_log_t *a1)
{
  os_log_t result = os_log_create("com.apple.corecrypto", "default");
  *a1 = result;
  return result;
}

BOOL ccn_add_asm(BOOL result, void *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL v4 = 0;
  if (result)
  {
    if (result)
    {
      uint64_t v6 = *a3++;
      uint64_t v5 = v6;
      uint64_t v7 = *a4++;
      BOOL v4 = __CFADD__(v5, v7);
      *a2++ = v5 + v7;
    }

    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      uint64_t v10 = *a4;
      uint64_t v11 = a4[1];
      a4 += 2;
      uint64_t v13 = v4 + v8;
      BOOL v4 = __CFADD__(v4, v8) | __CFADD__(v10, v13);
      uint64_t v12 = v10 + v13;
      uint64_t v14 = v4 + v9;
      BOOL v4 = __CFADD__(v4, v9) | __CFADD__(v11, v14);
      *a2 = v12;
      a2[1] = v11 + v14;
      a2 += 2;
    }

    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      char v17 = a3 + 2;
      uint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      char v20 = a4 + 2;
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      uint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        uint64_t v30 = v4 + v18;
        BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v30);
        uint64_t v29 = v21 + v30;
        uint64_t v32 = v4 + v19;
        BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v32);
        uint64_t v31 = v22 + v32;
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        uint64_t v35 = v4 + v24;
        BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v35);
        uint64_t v34 = v27 + v35;
        *a2 = v29;
        a2[1] = v31;
        unint64_t v36 = a2 + 2;
        uint64_t v37 = v4 + v25;
        BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v37);
        uint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        *unint64_t v36 = v34;
        v36[1] = v28 + v37;
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        uint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }

      uint64_t v40 = v4 + v18;
      BOOL v4 = __CFADD__(v4, v18) | __CFADD__(v21, v40);
      uint64_t v39 = v21 + v40;
      uint64_t v42 = v4 + v19;
      BOOL v4 = __CFADD__(v4, v19) | __CFADD__(v22, v42);
      uint64_t v41 = v22 + v42;
      uint64_t v44 = v4 + v24;
      BOOL v4 = __CFADD__(v4, v24) | __CFADD__(v27, v44);
      uint64_t v43 = v27 + v44;
      uint64_t v45 = v4 + v25;
      BOOL v4 = __CFADD__(v4, v25) | __CFADD__(v28, v45);
      *a2 = v39;
      a2[1] = v41;
      uint64_t v46 = a2 + 2;
      *uint64_t v46 = v43;
      v46[1] = v28 + v45;
    }

    return v4;
  }

  return result;
}

BOOL ccn_add1_ws(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5)
{
  if (a2) {
    return ccn_add1_asm(a2, a3, a4, a5);
  }
  else {
    return a5;
  }
}

uint64_t ccsigma_init(uint64_t a1, uint64_t a2, int a3, uint64_t (**a4)(void, uint64_t, uint64_t *))
{
  BOOL v14 = timingsafe_enable_if_supported();
  *(void *)a2 = a1;
  *(_DWORD *)(a2 + 8) = a3;
  uint64_t v8 = (uint64_t **)(*(uint64_t (**)(uint64_t))(a1 + 8))(a2);
  v12[0] = cc_malloc_clear(392LL * **(void **)a1);
  uint64_t v9 = *(uint64_t **)a1;
  v12[1] = 49LL * **(void **)a1;
  v12[2] = 0LL;
  v12[3] = cc_ws_alloc;
  uint64_t v13 = cc_ws_free;
  if (v12[0])
  {
    uint64_t key_fips_ws = ccec_generate_key_fips_ws((uint64_t)v12, v9, a4, v8);
    v13((uint64_t)v12);
  }

  else
  {
    uint64_t key_fips_ws = 4294967283LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v14);
  return key_fips_ws;
}

uint64_t ccsigma_import_signing_key(void *a1, unint64_t a2, unsigned __int8 *a3)
{
  BOOL v12 = timingsafe_enable_if_supported();
  uint64_t v6 = (unint64_t **)(*(uint64_t (**)(void *))(*a1 + 48LL))(a1);
  uint64_t v7 = 20LL * **(void **)(*a1 + 24LL);
  v10[0] = cc_malloc_clear(160LL * **(void **)(*a1 + 24LL));
  v10[1] = v7;
  void v10[2] = 0LL;
  v10[3] = cc_ws_alloc;
  uint64_t v11 = cc_ws_free;
  if (v10[0])
  {
    uint64_t v8 = ccec_x963_import_priv_ws((uint64_t)v10, *(unint64_t **)(*a1 + 24LL), a2, a3, v6);
    v11((uint64_t)v10);
    if (!(_DWORD)v8)
    {
      a1[2] = ccsigma_sign_internal;
      a1[3] = a1;
    }
  }

  else
  {
    uint64_t v8 = 4294967283LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v12);
  return v8;
}

uint64_t ccsigma_set_signing_function(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  return 0LL;
}

uint64_t ccsigma_sign_internal( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t *a4, char *a5, uint64_t (**a6)(void, unint64_t, void *))
{
  BOOL v12 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
  uint64_t v13 = (void *)*v12;
  v18[0] = cc_malloc_clear(280LL * *(void *)*v12);
  v18[1] = 35LL * *v13;
  v18[2] = 0LL;
  _OWORD v18[3] = cc_ws_alloc;
  uint64_t v19 = cc_ws_free;
  if (!v18[0]) {
    return 4294967283LL;
  }
  unint64_t v14 = *(void *)(*(void *)a1 + 40LL);
  if (*a4 < v14)
  {
    uint64_t v16 = 4294967289LL;
    cc_ws_free((uint64_t)v18);
  }

  else
  {
    *a4 = v14;
    unint64_t v15 = ccec_signature_r_s_size(v12);
    uint64_t v16 = ccec_sign_composite_ws((uint64_t)v18, (unint64_t **)v12, a2, a3, a5, &a5[v15], a6);
    v19((uint64_t)v18);
  }

  return v16;
}

uint64_t ccsigma_import_peer_verification_key(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  BOOL v9 = timingsafe_enable_if_supported();
  uint64_t v6 = (unint64_t **)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 56LL))(a1);
  uint64_t v7 = ccec_x963_import_pub(*(unint64_t **)(*(void *)a1 + 24LL), a2, a3, v6);
  cc_disable_dit_with_sb((unsigned int *)&v9);
  return v7;
}

uint64_t ccsigma_export_key_share(uint64_t **a1, rsize_t *a2, char *a3)
{
  BOOL v11 = timingsafe_enable_if_supported();
  unint64_t v6 = ccec_compressed_x962_export_pub_size(**a1);
  rsize_t v7 = *a2;
  if (*a2 < v6)
  {
    uint64_t v9 = 4294967289LL;
    goto LABEL_4;
  }

  *a2 = v6;
  uint64_t v8 = (uint64_t *)((uint64_t (*)(uint64_t **))(*a1)[1])(a1);
  uint64_t v9 = ccec_compressed_x962_export_pub(v8, a3);
  if ((_DWORD)v9)
  {
    rsize_t v7 = *a2;
LABEL_4:
    cc_clear(v7, a3);
  }

  cc_disable_dit_with_sb((unsigned int *)&v11);
  return v9;
}

uint64_t ccsigma_import_peer_key_share(unint64_t ***a1, uint64_t a2, unsigned __int8 *a3)
{
  BOOL v9 = timingsafe_enable_if_supported();
  unint64_t v6 = (unint64_t **)((uint64_t (*)(unint64_t ***))(*a1)[2])(a1);
  uint64_t v7 = ccec_compressed_x962_import_pub(**a1, a2, a3, v6);
  cc_disable_dit_with_sb((unsigned int *)&v9);
  return v7;
}

uint64_t ccsigma_kex_init_ctx(uint64_t a1)
{
  uint64_t v1 = 16LL;
  if (!*(_DWORD *)(a1 + 8)) {
    uint64_t v1 = 8LL;
  }
  return (*(uint64_t (**)(void))(*(void *)a1 + v1))();
}

uint64_t ccsigma_kex_resp_ctx(uint64_t a1)
{
  uint64_t v1 = 16LL;
  if (*(_DWORD *)(a1 + 8) == 1) {
    uint64_t v1 = 8LL;
  }
  return (*(uint64_t (**)(void))(*(void *)a1 + v1))();
}

uint64_t ccsigma_derive_session_keys( uint64_t **a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(void, uint64_t, uint64_t *))
{
  BOOL v18 = timingsafe_enable_if_supported();
  uint64_t v8 = *a1;
  uint64_t v9 = cczp_bitlen(**a1);
  unint64_t v17 = (unint64_t)(v9 + 7) >> 3;
  memset(v19, 0, sizeof(v19));
  if ((unint64_t)(v9 + 7) <= 0x107)
  {
    BOOL v11 = (unint64_t **)((uint64_t (*)(uint64_t **))v8[1])(a1);
    BOOL v12 = (unint64_t **)((uint64_t (*)(uint64_t **))(*a1)[2])(a1);
    uint64_t v13 = *v11;
    v15[0] = cc_malloc_clear(232 * **v11);
    v15[1] = 29 * *v13;
    void v15[2] = 0LL;
    v15[3] = cc_ws_alloc;
    uint64_t v16 = cc_ws_free;
    if (v15[0])
    {
      uint64_t v10 = ccecdh_compute_shared_secret_ws((uint64_t)v15, v11, v12, &v17, (char *)v19, a4);
      v16((uint64_t)v15);
      if (!(_DWORD)v10) {
        uint64_t v10 = ((uint64_t (*)(uint64_t **, unint64_t, _OWORD *, uint64_t, uint64_t))v8[12])( a1,  v17,  v19,  a2,  a3);
      }
    }

    else
    {
      uint64_t v10 = 4294967283LL;
    }
  }

  else
  {
    uint64_t v10 = 4294967291LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v18);
  return v10;
}

uint64_t ccsigma_compute_mac_internal(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  if (*(void *)(*a1 + 64) <= a2) {
    return 4294967289LL;
  }
  uint64_t v10 = 0LL;
  if (a2)
  {
    BOOL v11 = *(uint64_t **)(v5 + 72);
    unint64_t v12 = a2;
    do
    {
      uint64_t v13 = *v11++;
      v10 += v13;
      --v12;
    }

    while (v12);
  }

  uint64_t v14 = *(void *)(*(void *)(v5 + 72) + 8 * a2);
  uint64_t v15 = (*(uint64_t (**)(uint64_t *))(v5 + 88))(a1) + v10;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*a1 + 112))( a1,  v14,  v15,  a3,  a4,  a5);
}

uint64_t ccsigma_sign(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v16 = timingsafe_enable_if_supported();
  uint64_t v10 = *a1;
  unint64_t v11 = **(void **)(*a1 + 32);
  memset(v17, 0, sizeof(v17));
  if (v11 > 0x40)
  {
    uint64_t v13 = 4294967291LL;
  }

  else
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t, _OWORD *))(v10 + 136))( a1,  *((unsigned int *)a1 + 2),  a3,  a4,  v17);
    if (!(_DWORD)v12)
    {
      uint64_t v15 = *(void *)(*a1 + 40);
      uint64_t v12 = ((uint64_t (*)(uint64_t, unint64_t, _OWORD *, uint64_t *, uint64_t, uint64_t))a1[2])( a1[3],  v11,  v17,  &v15,  a2,  a5);
    }

    uint64_t v13 = v12;
  }

  cc_disable_dit_with_sb((unsigned int *)&v16);
  return v13;
}

uint64_t ccsigma_verify(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v17 = timingsafe_enable_if_supported();
  uint64_t v8 = (uint64_t *)(*(uint64_t (**)(_DWORD *))(*(void *)a1 + 56LL))(a1);
  v15[0] = cc_malloc_clear(376LL * *(void *)*v8);
  v15[1] = 47LL * *(void *)*v8;
  void v15[2] = 0LL;
  v15[3] = cc_ws_alloc;
  BOOL v16 = cc_ws_free;
  if (v15[0])
  {
    uint64_t v9 = *(void *)a1;
    unint64_t v10 = **(void **)(*(void *)a1 + 32LL);
    memset(v18, 0, sizeof(v18));
    if (v10 > 0x40)
    {
      uint64_t v13 = 4294967291LL;
    }

    else
    {
      uint64_t v11 = (*(uint64_t (**)(_DWORD *, BOOL, uint64_t, uint64_t, _OWORD *))(v9 + 136))( a1,  a1[2] == 0,  a3,  a4,  v18);
      if (!(_DWORD)v11)
      {
        unint64_t v12 = ccec_signature_r_s_size(v8);
        uint64_t v11 = ccec_verify_composite_digest_ws((uint64_t)v15, v8, v10, (uint64_t)v18, a2, a2 + v12, 0LL);
      }

      uint64_t v13 = v11;
    }

    v16((uint64_t)v15);
  }

  else
  {
    uint64_t v13 = 4294967283LL;
  }

  cc_disable_dit_with_sb((unsigned int *)&v17);
  return v13;
}

uint64_t ccsigma_seal( uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v34 = timingsafe_enable_if_supported();
  uint64_t v17 = *a1;
  if (*(void *)(*a1 + 64) <= a2) {
    goto LABEL_12;
  }
  uint64_t v18 = 0LL;
  if (a2)
  {
    uint64_t v19 = *(uint64_t **)(v17 + 72);
    unint64_t v20 = a2;
    do
    {
      uint64_t v21 = *v19++;
      v18 += v21;
      --v20;
    }

    while (v20);
  }

  uint64_t v22 = *(void *)(*(void *)(v17 + 72) + 8 * a2);
  uint64_t v23 = (*(uint64_t (**)(uint64_t *))(v17 + 88))(a1);
  uint64_t v24 = *a1;
  if (*(void *)(*a1 + 64) <= a3)
  {
LABEL_12:
    uint64_t v32 = 4294967289LL;
  }

  else
  {
    uint64_t v25 = v23 + v18;
    uint64_t v26 = 0LL;
    if (a3)
    {
      uint64_t v27 = *(uint64_t **)(v24 + 72);
      unint64_t v28 = a3;
      do
      {
        uint64_t v29 = *v27++;
        v26 += v29;
        --v28;
      }

      while (v28);
    }

    uint64_t v30 = *(void *)(*(void *)(v24 + 72) + 8 * a3);
    uint64_t v31 = (*(uint64_t (**)(uint64_t *))(v24 + 88))(a1) + v26;
    uint64_t v32 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*a1 + 152))( a1,  v22,  v25,  v30,  v31,  a4,  a5,  a6,  a7,  a8,  a9);
    if (!(_DWORD)v32) {
      (*(void (**)(uint64_t, uint64_t))(*a1 + 168))(v30, v31);
    }
  }

  cc_disable_dit_with_sb((unsigned int *)&v34);
  return v32;
}

uint64_t ccsigma_open( uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  BOOL v39 = timingsafe_enable_if_supported();
  uint64_t v17 = *a1;
  unint64_t v18 = *(void *)(*a1 + 144);
  v40[0] = 0LL;
  v40[1] = 0LL;
  if (v18 > 0x10)
  {
    uint64_t v36 = 4294967291LL;
  }

  else
  {
    if (*(void *)(v17 + 64) <= a2) {
      goto LABEL_13;
    }
    uint64_t v19 = 0LL;
    if (a2)
    {
      unint64_t v20 = *(uint64_t **)(v17 + 72);
      unint64_t v21 = a2;
      do
      {
        uint64_t v22 = *v20++;
        v19 += v22;
        --v21;
      }

      while (v21);
    }

    uint64_t v23 = *(void *)(*(void *)(v17 + 72) + 8 * a2);
    uint64_t v24 = (*(uint64_t (**)(uint64_t *))(v17 + 88))(a1);
    uint64_t v25 = *a1;
    if (*(void *)(*a1 + 64) <= a3)
    {
LABEL_13:
      uint64_t v36 = 4294967289LL;
    }

    else
    {
      uint64_t v26 = a7;
      uint64_t v27 = a8;
      uint64_t v38 = a6;
      uint64_t v28 = v24 + v19;
      uint64_t v29 = v26;
      uint64_t v30 = 0LL;
      if (a3)
      {
        uint64_t v31 = *(uint64_t **)(v25 + 72);
        unint64_t v32 = a3;
        do
        {
          uint64_t v33 = *v31++;
          v30 += v33;
          --v32;
        }

        while (v32);
      }

      uint64_t v34 = *(void *)(*(void *)(v25 + 72) + 8 * a3);
      uint64_t v35 = (*(uint64_t (**)(uint64_t *))(v25 + 88))(a1) + v30;
      __memcpy_chk(v40, a9, v18, 16LL);
      uint64_t v36 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(*a1 + 160))( a1,  v23,  v28,  v34,  v35,  a4,  a5,  v38,  v29,  v27,  v40);
      if (!(_DWORD)v36) {
        (*(void (**)(uint64_t, uint64_t))(*a1 + 168))(v34, v35);
      }
    }
  }

  cc_disable_dit_with_sb((unsigned int *)&v39);
  return v36;
}

uint64_t ccn_mux(uint64_t result, char a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t v5 = state ^ (state << 13) ^ ((state ^ (unint64_t)(state << 13)) >> 7);
  uint64_t v6 = v5 ^ (v5 << 17);
  state = v6;
  for (uint64_t i = __ROR8__(0x5555555555555555LL, a2 | (2 * v6)); result; --result)
  {
    uint64_t v9 = *a4++;
    uint64_t v8 = v9;
    uint64_t v10 = *a5++;
    *a3 = v10 ^ v6;
    *a3++ = (v10 ^ v8) & 0x5555555555555555LL ^ v10 ^ v6 ^ (v10 ^ v8) & i ^ v6;
  }

  return result;
}

uint64_t ccn_mux_next_mask()
{
  unint64_t v0 = state ^ (state << 13) ^ ((state ^ (unint64_t)(state << 13)) >> 7);
  uint64_t result = v0 ^ (v0 << 17);
  state = result;
  return result;
}

uint64_t ccn_mux_seed_mask(uint64_t result)
{
  state ^= result;
  return result;
}

uint64_t cczp_power_fast_ws(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = ccn_bitlen_internal(v10, a5);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v10);
    ccn_set(v10, v13, a4);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> (v12 - 1)) & 1LL;
    if ((v12 & 1) == 0) {
      uint64_t v14 = (*(void *)(a5 + (((unint64_t)(v12 - 2) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> (v12 - 2)) & 1LL | (2 * v14);
    }
    ccn_set(v10, a3, &v13[8 * (v14 - 1) * v10]);
    if ((v12 | 0xFFFFFFFFFFFFFFFELL) + v12)
    {
      unint64_t v15 = v12 + (v12 | 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        cczp_sqr_ws(a1, a2);
        cczp_sqr_ws(a1, a2);
        v15 -= 2LL;
      }

      while (v15 != -1LL);
    }

    *(void *)(a1 + 16) = v17;
  }

  else
  {
    ccn_seti(v10, a3, 1LL);
    cczp_to_ws(a1, a2);
  }

  return 0LL;
}

unint64_t ccn_bitlen_public_value(unint64_t result, unint64_t *a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0LL;
    uint64_t v3 = 64LL;
    do
    {
      unint64_t v4 = *a2++;
      uint64_t result = ((((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32) - 1) & result | (v3 - __clz(v4 | 1)) & -(uint64_t)(((v4 | HIDWORD(v4)) + 0xFFFFFFFF) >> 32);
      v3 += 64LL;
      --v2;
    }

    while (v2);
  }

  return result;
}

void cc_abort()
{
}

uint64_t ccn_mul_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ccn_mul(a2, a3, a4, a5);
}

uint64_t ccn_divmod_ws( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v12 = ccn_n(a6, a8);
  unint64_t v13 = a2 - v12;
  uint64_t v50 = *(void *)(a1 + 16);
  uint64_t v14 = v12 + 1;
  unint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  BOOL v16 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  uint64_t v59 = a1;
  uint64_t v17 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v15[v12] = 0LL;
  uint64_t v57 = v12 - 1;
  unint64_t v18 = __clz(*(void *)(a8 + 8 * (v12 - 1)));
  ccn_shift_left(v12, (uint64_t)v15, a8, v18, v19);
  int v20 = -(int)v18;
  unint64_t v60 = v18;
  unint64_t v21 = v18 + 0xFFFFFFFF;
  if (v12) {
    ccn_set(v12, v16, (void *)(a3 + 8 * v13));
  }
  uint64_t v53 = -(uint64_t)HIDWORD(v21);
  char v54 = v20 & 0x3F;
  ccn_zero(1LL, (char *)v16 + 8 * v12);
  ccn_shift_left(v14, (uint64_t)v16, (uint64_t)v16, v60, v22);
  unint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = v15[v57];
  uint64_t v27 = -v26;
  unint64_t v29 = (unsigned __int128)-(__int128)__PAIR128__(v28, v26) >> 64;
  uint64_t v30 = 65LL;
  unint64_t v31 = v26;
  do
  {
    unsigned __int128 v32 = __PAIR128__(v29, v27) - __PAIR128__(v31, v23);
    unint64_t v33 = (unint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63;
    uint64_t v34 = v29 & ((uint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63);
    uint64_t v27 = (v33 - 1) & v32 | v27 & (*((uint64_t *)&v32 + 1) >> 63);
    *((void *)&v35 + 1) = v25;
    *(void *)&__int128 v35 = v24;
    uint64_t v25 = v35 >> 63;
    *((void *)&v35 + 1) = v24;
    *(void *)&__int128 v35 = *((void *)&v32 + 1);
    unint64_t v29 = (v33 != 0 ? 0 : *((void *)&v32 + 1)) | v34;
    uint64_t v24 = (v35 >> 63) ^ 1;
    *((void *)&v35 + 1) = v31;
    *(void *)&__int128 v35 = v23;
    unint64_t v23 = v35 >> 1;
    v31 >>= 1;
    --v30;
  }

  while (v30);
  unint64_t v56 = (v24 + 2) | ((((HIDWORD(v15[v57]) ^ 0x80000000 | v15[v57]) + 0xFFFFFFFF) >> 32) - 1);
  size_t v52 = 8 * v12;
  uint64_t v58 = v12;
  uint64_t v36 = (void *)(a3 - 8 * v12 + 8 * a2);
  unint64_t v37 = v13;
  do
  {
    unint64_t v38 = v13;
    uint64_t v39 = *v36 << v60;
    v16->i64[0] = v39;
    if (v37) {
      v16->i64[0] = ((*(v36 - 1) & (unint64_t)v53) >> v54) | v39;
    }
    unint64_t v40 = v16->u64[v58];
    uint64_t v41 = v16->i64[v57];
    uint64_t v63 = v15[v57];
    unint64_t v42 = ((__PAIR128__(v40, v41) - (unint64_t)v63) >> 64) + ((v40 * (unsigned __int128)v56) >> 64) + 2;
    if (v42 < v40) {
      unint64_t v42 = -1LL;
    }
    unint64_t v62 = v42;
    v65[0] = 0LL;
    v65[1] = 0LL;
    ccn_mul(1LL, (uint64_t)v65, (uint64_t)&v62, (uint64_t)&v63);
    v64[0] = v41;
    v64[1] = v40;
    BOOL v43 = ccn_sub_ws(0LL, 2LL, v65, v64, (unint64_t *)v65);
    v62 -= 2 * v43;
    BOOL v44 = ccn_add1_ws(0LL, 2LL, v65, v65, v63);
    unint64_t v45 = v62 + v44;
    v17[v58] = ccn_mul1(v58, v17, v15, v62 + v44);
    BOOL v46 = ccn_sub_ws(v59, v14, v16, v16->i64, v17);
    uint64_t v47 = v46 - ccn_cond_add(v14, v46, v16->i64, v16->i64, v15);
    uint64_t result = ccn_cond_add(v14, v47, v16->i64, v16->i64, v15);
    if (a5 && v37 < a4) {
      *(void *)(a5 + 8 * v37) = v45 - (v46 + v47);
    }
    if (v37) {
      uint64_t result = (uint64_t)memmove(&v16->u64[1], v16, v52);
    }
    --v37;
    --v36;
    unint64_t v13 = v38;
  }

  while (v37 <= v38);
  if (a5 && a4 > v38 + 1) {
    uint64_t result = cc_clear(8 * (a4 - (v38 + 1)), (void *)(a5 + 8 * (v38 + 1)));
  }
  if (a7)
  {
    ccn_shift_right(v58, v16, v16, v60);
    if (v58) {
      ccn_set(v58, a7, v16);
    }
    uint64_t result = ccn_zero(a6 - v58, &a7[8 * v58]);
  }

  *(void *)(v59 + 16) = v50;
  return result;
}

uint64_t cccbc_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t cccbc_set_iv_internal(uint64_t a1, void *__dst, void *__src)
{
  if (__src) {
    memcpy(__dst, __src, *(void *)(a1 + 8));
  }
  else {
    cc_clear(*(void *)(a1 + 8), __dst);
  }
  return 0LL;
}

uint64_t cccbc_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
}

uint64_t cccbc_one_shot_explicit_internal( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(a1 + 8) != a4 || a3 && a3 != a4) {
    return 4294967289LL;
  }
  size_t v16 = (*(void *)a1 + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v17 = (char *)&v22 - v16;
  bzero((char *)&v22 - v16, v16);
  size_t v18 = (*(void *)(a1 + 8) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64x2_t v19 = (char *)&v22 - v18;
  bzero((char *)&v22 - v18, v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a1 + 16))(a1, v17, a2, a6);
  if ((_DWORD)v20) {
    return v20;
  }
  if (a7) {
    memcpy(v19, a7, *(void *)(a1 + 8));
  }
  else {
    cc_clear(*(void *)(a1 + 8), v19);
  }
  uint64_t v15 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 24))(v17, v19, a5, a8, a9);
  cc_clear(*(void *)a1, v17);
  return v15;
}

uint64_t ccmode_ctr_setctr(int a1, void *a2, void *__src)
{
  uint64_t v3 = *a2;
  a2[1] = *(void *)(*a2 + 8LL);
  memcpy((char *)a2 + ((*(void *)(v3 + 8) + 7LL) & 0xFFFFFFFFFFFFFFF8LL) + 16, __src, *(void *)(v3 + 8));
  return 0LL;
}

uint64_t ccn_random_bits( uint64_t a1, uint64_t a2, uint64_t (**a3)(void, unint64_t, uint64_t))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  uint64_t result = (*a3)(a3, 8 * v5, a2);
  if (!(_DWORD)result) {
    *(void *)(a2 + 8 * v5 - 8) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return result;
}

uint64_t ccn_random_bits_fips( uint64_t a1, void *a2, uint64_t (**a3)(void, unint64_t, void *))
{
  char v4 = a1;
  unint64_t v5 = (unint64_t)(a1 + 63) >> 6;
  if ((unint64_t)(a1 + 63) > 0x7F)
  {
    uint64_t v6 = (*a3)(a3, 8 * v5, a2);
  }

  else
  {
    int v9 = 0;
    uint64_t __src = 0LL;
    uint64_t v6 = (*a3)(a3, 12uLL, &__src);
    memcpy(a2, &__src, 8 * v5);
    cc_clear(8 * v5, &__src);
  }

  if (!(_DWORD)v6) {
    *((void *)a2 + v5 - 1) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  }
  return v6;
}

uint64_t ccn_read_uint_public_value( unint64_t a1, void *a2, unint64_t a3, unsigned __int8 *a4)
{
  unint64_t v4 = 8 * a1;
  if (a3 > 8 * a1)
  {
    int v5 = 0;
    unint64_t v6 = a3 - v4;
    uint64_t v7 = a4;
    do
    {
      int v8 = *v7++;
      v5 |= v8;
      --a3;
    }

    while (a3 > v4);
    if (v5) {
      return 4294967289LL;
    }
    a4 += v6;
    a3 = 8 * a1;
  }

  if (a3 < 8)
  {
    unint64_t v10 = 0LL;
  }

  else
  {
    unint64_t v10 = ((a3 - 8) >> 3) + 1;
    uint64_t v11 = a2;
    unint64_t v12 = v10;
    do
    {
      *v11++ = bswap64(*(void *)&a4[a3 - 8]);
      a3 -= 8LL;
      --v12;
    }

    while (v12);
  }

  if (a3)
  {
    unint64_t v13 = 0LL;
    uint64_t v14 = -(uint64_t)a3;
    do
      unint64_t v13 = a4[a3 + v14] | (v13 << 8);
    while (!__CFADD__(v14++, 1LL));
    a2[v10++] = v13;
  }

  if (v10 < a1) {
    bzero(&a2[v10], v4 - 8 * v10);
  }
  return 0LL;
}

void *ccn_set(uint64_t a1, void *__dst, void *__src)
{
  return memmove(__dst, __src, 8 * a1);
}

uint64_t ccrng_process_init( uint64_t a1, uint64_t (*a2)(void), uint64_t (**a3)(void, uint64_t, _OWORD *))
{
  uint64_t v6 = a1 + 128;
  ccrng_schedule_timer_init(a1 + 128, a2, 5000000000LL);
  ccrng_schedule_atomic_flag_init(a1 + 168);
  ccrng_schedule_tree_init(a1 + 96, v6, a1 + 168);
  uint64_t result = cc_lock_init((_DWORD *)(a1 + 208));
  if (!(_DWORD)result)
  {
    uint64_t result = ccentropy_rng_init((void *)(a1 + 192), (uint64_t)a3);
    if (!(_DWORD)result)
    {
      int v8 = ccaes_cbc_encrypt_mode();
      uint64_t result = ccdrbg_df_bc_init_internal((void *)(a1 + 224), v8, 0x20uLL);
      if (!(_DWORD)result)
      {
        int v9 = ccaes_ctr_crypt_mode();
        __int128 v10 = xmmword_10019FBD0;
        DWORD2(v10) = 1;
        uint64_t v11 = a1 + 224;
        ccdrbg_factory_nistctr((void *)(a1 + 768), (uint64_t)&v9);
        memset(v13, 0, sizeof(v13));
        uint64_t result = (*a3)(a3, 32LL, v13);
        if (!(_DWORD)result)
        {
          a2();
          strcpy(v12, "corecrypto process rng");
          uint64_t result = ccdrbg_init_internal(a1 + 768);
          if (!(_DWORD)result)
          {
            uint64_t result = ccrng_crypto_init( (void *)(a1 + 8),  a1 + 192,  a1 + 96,  a1 + 208,  a1 + 768,  a1 + 824,  4096LL,  0x20uLL,  256LL,  a1 + 2104);
            if (!(_DWORD)result) {
              *(void *)a1 = generate_2;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t generate_2(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(a1 + 8);
}

uint64_t ccrng_process_atfork_prepare(os_unfair_lock_s *a1)
{
  return 0LL;
}

uint64_t ccrng_process_atfork_parent(os_unfair_lock_s *a1)
{
  return 0LL;
}

uint64_t ccrng_process_atfork_child(uint64_t a1)
{
  return cc_lock_init((_DWORD *)(a1 + 208));
}

uint64_t ccec_verify_composite_digest_ws( uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a7)
  {
    *a7 = 0LL;
    a7[1] = 0LL;
  }

  __int128 v21 = 0uLL;
  uint64_t v13 = *(void *)*a2;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  unint64_t v17 = ccec_signature_r_s_size(a2);
  if (ccn_read_uint_internal(v13, v15, v17, a5)
    || (unint64_t v18 = ccec_signature_r_s_size(a2), ccn_read_uint_internal(v13, v16, v18, a6)))
  {
    uint64_t result = 4294967289LL;
  }

  else
  {
    uint64_t result = ccec_verify_internal_ws(a1, (unint64_t **)a2, a3, a4, v15, v16, (uint64_t)&v21);
    if (a7 && !(_DWORD)result) {
      *(_OWORD *)a7 = v21;
    }
  }

  *(void *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_verify_composite_msg_ws( uint64_t a1, uint64_t *a2, unint64_t *a3, size_t a4, char *a5, uint64_t a6, uint64_t a7, void *a8)
{
  return ccec_verify_composite_digest_ws(a1, a2, *a3, (uint64_t)v15, a6, a7, a8);
}

uint64_t ccn_shift_right(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result) {
    return ccn_shift_right_asm(result, a2, a3, a4);
  }
  return result;
}

uint64_t ccn_shift_right_multi(uint64_t a1, int8x16_t *a2, int8x16_t *a3, unint64_t a4)
{
  uint64_t result = ccn_shift_right(a1, a2, a3, a4 & 0x3F);
  if (a1)
  {
    uint64_t v8 = 0LL;
    do
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = v8;
      do
      {
        v9 |= ((((v10 ^ ((_DWORD)v8 + (a4 >> 6)) | ((v10 ^ (v8 + (a4 >> 6))) >> 32))
               + 0xFFFFFFFF) >> 32)
             - 1) & a2->i64[v10];
        ++v10;
      }

      while (a1 != v10);
      a2->i64[v8++] = v9;
    }

    while (v8 != a1);
  }

  return result;
}

BOOL ccn_sub_ws(uint64_t a1, BOOL a2, void *a3, uint64_t *a4, unint64_t *a5)
{
  return ccn_sub_asm(a2, a3, a4, a5);
}

BOOL ccn_sub_asm(BOOL result, void *a2, uint64_t *a3, unint64_t *a4)
{
  _BOOL1 v4 = 1;
  if (result)
  {
    if (result)
    {
      unint64_t v6 = *a3++;
      unint64_t v5 = v6;
      unint64_t v7 = *a4++;
      _BOOL1 v4 = v5 >= v7;
      *a2++ = v5 - v7;
    }

    if (result & 2)
    {
      uint64_t v8 = *a3;
      uint64_t v9 = a3[1];
      a3 += 2;
      unint64_t v10 = *a4;
      unint64_t v11 = a4[1];
      a4 += 2;
      _BOOL1 v13 = v4;
      _BOOL1 v4 = __CFSUB__(v8, v10, v4);
      uint64_t v12 = v8 - (v10 + !v13);
      _BOOL1 v14 = v4;
      _BOOL1 v4 = __CFSUB__(v9, v11, v4);
      *a2 = v12;
      a2[1] = v9 - (v11 + !v14);
      a2 += 2;
    }

    BOOL v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      int v16 = v15 - 4;
      uint64_t v18 = *a3;
      uint64_t v19 = a3[1];
      unint64_t v17 = a3 + 2;
      unint64_t v21 = *a4;
      uint64_t v22 = a4[1];
      uint64_t v20 = (uint64_t *)(a4 + 2);
      uint64_t v24 = *v17;
      uint64_t v25 = v17[1];
      unint64_t v23 = v17 + 2;
      uint64_t v27 = *v20;
      uint64_t v28 = v20[1];
      for (uint64_t i = v20 + 2; v16; uint64_t i = v38 + 2)
      {
        _BOOL1 v30 = v4;
        _BOOL1 v4 = __CFSUB__(v18, v21, v4);
        uint64_t v29 = v18 - (v21 + !v30);
        _BOOL1 v32 = v4;
        _BOOL1 v4 = __CFSUB__(v19, v22, v4);
        uint64_t v31 = v19 - (v22 + !v32);
        uint64_t v18 = *v23;
        uint64_t v19 = v23[1];
        unint64_t v33 = v23 + 2;
        _BOOL1 v35 = v4;
        _BOOL1 v4 = __CFSUB__(v24, v27, v4);
        uint64_t v34 = v24 - (v27 + !v35);
        *a2 = v29;
        a2[1] = v31;
        uint64_t v36 = a2 + 2;
        _BOOL1 v37 = v4;
        _BOOL1 v4 = __CFSUB__(v25, v28, v4);
        unint64_t v21 = *i;
        uint64_t v22 = i[1];
        unint64_t v38 = i + 2;
        *uint64_t v36 = v34;
        v36[1] = v25 - (v28 + !v37);
        a2 = v36 + 2;
        v16 -= 4;
        uint64_t v24 = *v33;
        uint64_t v25 = v33[1];
        unint64_t v23 = v33 + 2;
        uint64_t v27 = *v38;
        uint64_t v28 = v38[1];
      }

      _BOOL1 v40 = v4;
      _BOOL1 v4 = __CFSUB__(v18, v21, v4);
      uint64_t v39 = v18 - (v21 + !v40);
      _BOOL1 v42 = v4;
      _BOOL1 v4 = __CFSUB__(v19, v22, v4);
      uint64_t v41 = v19 - (v22 + !v42);
      _BOOL1 v44 = v4;
      _BOOL1 v4 = __CFSUB__(v24, v27, v4);
      uint64_t v43 = v24 - (v27 + !v44);
      _BOOL1 v45 = v4;
      _BOOL1 v4 = __CFSUB__(v25, v28, v4);
      *a2 = v39;
      a2[1] = v41;
      BOOL v46 = a2 + 2;
      *BOOL v46 = v43;
      v46[1] = v25 - (v28 + !v45);
    }

    return !v4;
  }

  return result;
}

unint64_t ccn_sub1(uint64_t a1, void *a2, unint64_t *a3, unint64_t a4)
{
  {
    unint64_t v4 = *a3++;
    unsigned __int128 v5 = v4 - (unsigned __int128)a4;
    *a2++ = v5;
    a4 = *((void *)&v5 + 1) >> 63;
  }

  return a4;
}

unint64_t ccn_write_uint_size_internal(unint64_t a1, unint64_t *a2)
{
  return (ccn_bitlen_public_value(a1, a2) + 7) >> 3;
}

uint64_t ccn_write_uint_padded_ct_internal( unint64_t a1, unint64_t *a2, unint64_t a3, char *__s)
{
  if (a3 > 0x7FFFFFFE) {
    return 4294967289LL;
  }
  unint64_t v6 = 8 * a1;
  if (8 * a1 > 0x7FFFFFFE) {
    return 4294967289LL;
  }
  unint64_t v7 = __s;
  unint64_t v8 = a3;
  unint64_t v10 = a3 - v6;
  if (a3 <= v6)
  {
    LODWORD(v10) = 0;
  }

  else
  {
    cc_clear(a3 - v6, __s);
    v7 += v10;
    unint64_t v8 = v6;
  }

  unint64_t v11 = ccn_bitlen_public_value(a1, a2);
  if (v8 < (v11 + 7) >> 3) {
    return 4294967289LL;
  }
  uint64_t result = (_DWORD)v10 + (_DWORD)v8 - ((v11 + 7) >> 3);
  if (v8 < 8)
  {
    unint64_t v12 = 0LL;
  }

  else
  {
    unint64_t v12 = ((v8 - 8) >> 3) + 1;
    _BOOL1 v13 = a2;
    unint64_t v14 = v12;
    do
    {
      unint64_t v15 = *v13++;
      *(void *)&v7[v8 - 8] = bswap64(v15);
      v8 -= 8LL;
      --v14;
    }

    while (v14);
  }

  if (v8)
  {
    unint64_t v16 = a2[v12];
    unint64_t v17 = &v7[v8 - 1];
    do
    {
      *v17-- = v16;
      v16 >>= 8;
      --v8;
    }

    while (v8);
  }

  return result;
}

BOOL ccn_add1_asm(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4)
{
  if (!a1) {
    return a4;
  }
  uint64_t v5 = *a3;
  unint64_t v4 = a3 + 1;
  BOOL v6 = __CFADD__(v5, a4);
  *a2 = v5 + a4;
  for (uint64_t i = a2 + 1; --a1; ++i)
  {
    uint64_t v8 = *v4++;
    BOOL v9 = v6;
    BOOL v6 = __CFADD__(v6, v8);
    *uint64_t i = v9 + v8;
  }

  return v6;
}

uint64_t ccn_cond_neg(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result = ccn_mux_next_mask();
  uint64_t v9 = __ROR8__(0x5555555555555555LL, a2 | (2 * result));
  if (a1)
  {
    BOOL v10 = 1LL;
    do
    {
      uint64_t v12 = *a4++;
      uint64_t v11 = v12;
      BOOL v13 = v10 + ~v12;
      BOOL v10 = __CFADD__(v10, ~v12);
      uint64_t v14 = v11 ^ v13;
      uint64_t v15 = v11 ^ result;
      *a3 = v15;
      *a3++ = v14 & v9 ^ v14 & 0x5555555555555555LL ^ v15 ^ result;
      --a1;
    }

    while (a1);
  }

  return result;
}

unint64_t ccec_compressed_x962_export_pub_size(uint64_t a1)
{
  return ((unint64_t)(cczp_bitlen(a1) + 7) >> 3) + 1;
}

uint64_t ccec_compressed_x962_export_pub(uint64_t *a1, char *a2)
{
  uint64_t v3 = (unint64_t *)(a1 + 2);
  unint64_t v4 = (unint64_t *)*a1;
  unint64_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 3) + 1;
  return ccec_export_affine_point_public_value(v4, 3, v3, &v6, a2);
}

uint64_t cc_lock_init(_DWORD *a1)
{
  *a1 = 0;
  return 0LL;
}

uint64_t cccmac_final_generate_internal(char *__s, size_t a2, void *a3)
{
  __src[0] = 0LL;
  __src[1] = 0LL;
  unint64_t v4 = (void *)*((void *)__s + 8);
  unint64_t v5 = *((void *)__s + 6);
  unint64_t v6 = *((void *)__s + 7) + v5;
  *((void *)__s + 7) = v6;
  if (v5 > 0x10)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }

  else
  {
    if (v5) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v6 == 0;
    }
    char v9 = !v8;
    uint64_t v10 = 0xFFFFFFFFLL;
    if (a2 - 17 >= 0xFFFFFFFFFFFFFFF0LL && (v9 & 1) == 0)
    {
      uint64_t v12 = __s + 32;
      BOOL v13 = __s;
      if (v5 != 16)
      {
        BOOL v13 = __s + 16;
        uint64_t v14 = &v12[v5];
        cc_clear(16 - v5, &v12[v5]);
        char *v14 = 0x80;
      }

      for (uint64_t i = 0LL; i != -16; --i)
        __s[i + 47] ^= v13[i + 15];
      cccbc_update_internal( (uint64_t)v4,  (uint64_t)(__s + 72),  (uint64_t)&__s[*v4 + 72],  1LL,  (uint64_t)(__s + 32),  (uint64_t)__src);
      memcpy(a3, __src, a2);
      uint64_t v10 = 0LL;
      unint64_t v4 = (void *)*((void *)__s + 8);
    }
  }

  cc_clear(v4[1] + *v4 + 80LL, __s);
  return v10;
}

unint64_t ccn_subn(uint64_t a1, void *a2, uint64_t *a3, BOOL a4, unint64_t *a5)
{
  uint64_t v5 = a1 - a4;
  unint64_t v6 = &a2[a4];
  unint64_t v7 = (unint64_t *)&a3[a4];
  unint64_t v8 = ccn_sub_ws(0LL, a4, a2, a3, a5);
  return ccn_sub1(v5, v6, v7, v8);
}

uint64_t cc_fault_canary_set(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  for (unint64_t i = 0LL; i != 16; ++i)
    *(_BYTE *)(result + i) = *(_BYTE *)(a5 + i % a3) ^ *(_BYTE *)(a4 + i % a3) ^ *(_BYTE *)(a2 + i);
  if (a3 >= 0x11)
  {
    for (uint64_t j = 16LL; j != a3; ++j)
      *(_BYTE *)(result + (j & 0xF)) ^= *(_BYTE *)(a5 + j) ^ *(_BYTE *)(a4 + j);
  }

  return result;
}

uint64_t ccec_validate_scalar(void *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = cczp_prime((uint64_t)&a1[5 * *a1 + 4]);
  if (ccn_n(*a1, a2)) {
    return 0LL;
  }
  return 0xFFFFFFFFLL;
}

int32x4_t *AccelerateCrypto_SHA256_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int8x16_t v4 = *a3;
    int8x16_t v5 = a3[1];
    int8x16_t v6 = a3[2];
    int8x16_t v7 = a3[3];
    uint64_t v3 = a3 + 4;
    _Q1 = (int32x4_t)vrev32q_s8(v5);
    int32x4_t v9 = *result;
    _Q2 = (int32x4_t)vrev32q_s8(v6);
    _Q17 = result[1];
    _Q3 = (int32x4_t)vrev32q_s8(v7);
    _Q18 = *result;
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v4), (int32x4_t)K256);
    _Q5 = vaddq_s32(_Q1, (int32x4_t)xmmword_10016C390);
    _Q19 = _Q17;
    _Q6 = vaddq_s32(_Q2, (int32x4_t)xmmword_10016C3A0);
    _Q7 = vaddq_s32(_Q3, (int32x4_t)xmmword_10016C3B0);
    uint64_t v19 = &xmmword_10016C3C0;
    int v20 = 3;
    do
    {
      _Q20 = _Q18;
      int32x4_t v22 = (int32x4_t)*v19;
      __asm { SHA256SU0       V0.4S, V1.4S }

      int32x4_t v28 = (int32x4_t)v19[1];
      __asm { SHA256H         Q18, Q19, V4.4S }

      int32x4_t v30 = (int32x4_t)v19[2];
      __asm { SHA256SU1       V0.4S, V2.4S, V3.4S }

      int32x4_t v32 = (int32x4_t)v19[3];
      __asm { SHA256H2        Q19, Q20, V4.4S }

      v19 += 4;
      _Q4 = vaddq_s32(_Q0, v22);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V1.4S, V2.4S
        SHA256H         Q18, Q19, V5.4S
        SHA256SU1       V1.4S, V3.4S, V0.4S
        SHA256H2        Q19, Q20, V5.4S
      }

      _Q5 = vaddq_s32(_Q1, v28);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V2.4S, V3.4S
        SHA256H         Q18, Q19, V6.4S
        SHA256SU1       V2.4S, V0.4S, V1.4S
        SHA256H2        Q19, Q20, V6.4S
      }

      _Q6 = vaddq_s32(_Q2, v30);
      --v20;
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V3.4S, V0.4S
        SHA256H         Q18, Q19, V7.4S
        SHA256SU1       V3.4S, V1.4S, V2.4S
        SHA256H2        Q19, Q20, V7.4S
      }

      _Q7 = vaddq_s32(_Q3, v32);
    }

    while (!(_NF ^ _VF | _ZF));
    BOOL v44 = a2 <= 1;
    uint64_t v45 = a2 - 1;
    if (!v44)
    {
      BOOL v46 = (int32x4_t *)(v19 - 16);
      do
      {
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V4.4S }

        int8x16_t v49 = v3[1];
        int8x16_t v50 = v3[2];
        __asm { SHA256H2        Q19, Q20, V4.4S }

        int8x16_t v52 = v3[3];
        _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(*v3), *v46);
        _Q20 = _Q18;
        v3 += 4;
        __asm { SHA256H         Q18, Q19, V5.4S }

        _Q1 = (int32x4_t)vrev32q_s8(v49);
        __asm { SHA256H2        Q19, Q20, V5.4S }

        _Q5 = vaddq_s32(_Q1, v46[1]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V6.4S }

        _Q2 = (int32x4_t)vrev32q_s8(v50);
        __asm { SHA256H2        Q19, Q20, V6.4S }

        _Q6 = vaddq_s32(_Q2, v46[2]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V7.4S }

        _Q3 = (int32x4_t)vrev32q_s8(v52);
        __asm { SHA256H2        Q19, Q20, V7.4S }

        _Q7 = vaddq_s32(_Q3, v46[3]);
        int32x4_t v9 = vaddq_s32(v9, _Q18);
        _Q17 = vaddq_s32(_Q17, _Q19);
        _Q20 = v9;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }

        _Q4 = vaddq_s32(_Q0, v46[4]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }

        _Q5 = vaddq_s32(_Q1, v46[5]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }

        _Q6 = vaddq_s32(_Q2, v46[6]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }

        _Q7 = vaddq_s32(_Q3, v46[7]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }

        _Q4 = vaddq_s32(_Q0, v46[8]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }

        _Q5 = vaddq_s32(_Q1, v46[9]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }

        _Q6 = vaddq_s32(_Q2, v46[10]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }

        _Q7 = vaddq_s32(_Q3, v46[11]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }

        _Q4 = vaddq_s32(_Q0, v46[12]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }

        _Q5 = vaddq_s32(_Q1, v46[13]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }

        _Q6 = vaddq_s32(_Q2, v46[14]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }

        _Q7 = vaddq_s32(_Q3, v46[15]);
        BOOL v44 = v45-- <= 1;
      }

      while (!v44);
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V4.4S
      SHA256H2        Q19, Q20, V4.4S
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V5.4S
      SHA256H2        Q19, Q20, V5.4S
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V6.4S
      SHA256H2        Q19, Q20, V6.4S
    }

    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V7.4S
      SHA256H2        Q19, Q20, V7.4S
    }

    *uint64_t result = vaddq_s32(v9, _Q18);
    result[1] = vaddq_s32(_Q17, _Q19);
  }

  return result;
}

uint64_t ccec_import_affine_point_ws( uint64_t a1, unint64_t *a2, int a3, uint64_t a4, unsigned __int8 *a5, void *a6)
{
  if (!a4) {
    return 4294967289LL;
  }
  unint64_t v11 = *a2;
  if (a4 == 1 && !*a5) {
    return 4294967136LL;
  }
  switch(a3)
  {
    case 4:
      uint64_t v12 = 4294967124LL;
      goto LABEL_20;
    case 1:
      uint64_t v12 = 4294967126LL;
      if (*a5 != 4) {
        return v12;
      }
LABEL_20:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v11);
      if (a3 == 4) {
        unint64_t v16 = a5;
      }
      else {
        unint64_t v16 = a5 + 1;
      }
      uint64_t v17 = cczp_bitlen((uint64_t)a2);
      uint64_t uint_public_value = ccn_read_uint_public_value(v11, a6, (unint64_t)(v17 + 7) >> 3, v16);
      if (ccn_cmp_public_value(v11, a6, a2 + 3) == -1)
      {
        if ((a3 - 3) <= 1)
        {
          uint64_t uint_public_value = ccec_affine_point_from_x_ws(a1, a2, (uint64_t)a6, (uint64_t)a6);
          if (!(_DWORD)uint_public_value)
          {
            cczp_negate((uint64_t)a2, v15, &a6[*a2]);
            uint64_t v19 = &a6[*a2];
            if (a3 == 4) {
              unsigned int v20 = ccn_cmp_public_value(v11, v15, v19) >> 31;
            }
            else {
              LOBYTE(v20) = (*v19 & 1) != (*a5 & 1);
            }
            ccn_mux(v11, v20, v19, v15, v19);
            goto LABEL_35;
          }

uint64_t cccmac_generate_subkeys(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5)
{
  v17[0] = 0LL;
  v17[1] = 0LL;
  __s[0] = 0LL;
  __s[1] = 0LL;
  uint64_t result = cccbc_one_shot_explicit_internal(a1, a2, 16LL, *(void *)(a1 + 8), 1LL, a3, v17, (uint64_t)__s, (uint64_t)__s);
  if (!(_DWORD)result)
  {
    LOBYTE(v8) = 0;
    unsigned int v9 = SLOBYTE(__s[0]);
    for (uint64_t i = 15LL; i != -1; --i)
    {
      unsigned int v11 = *((unsigned __int8 *)__s + i);
      a4[i] = v8 | (2 * v11);
      unsigned int v8 = v11 >> 7;
    }

    LOBYTE(v12) = 0;
    a4[15] ^= (v9 >> 7) & 0x87;
    unsigned int v13 = *a4;
    for (uint64_t j = 15LL; j != -1; --j)
    {
      unsigned int v15 = a4[j];
      *(_BYTE *)(a5 + j) = v12 | (2 * v15);
      unsigned int v12 = v15 >> 7;
    }

    *(_BYTE *)(a5 + 15) ^= (v13 >> 7) & 0x87;
    cc_clear(0x10uLL, __s);
    return 0LL;
  }

  return result;
}

void *ccsha1_di()
{
  return &ccsha1_vng_arm_di;
}

int8x16_t gcm_init( int8x16_t *a1, int8x16_t *a2, double a3, double a4, double a5, double a6, double a7, int8x16_t a8)
{
  int32x4_t v8 = (int32x4_t)vqtbl1q_s8(*a2, *(int8x16_t *)qword_10016D1C0);
  int8x16_t v9 = veorq_s8(a8, a8);
  int8x16_t v10 = veorq_s8( vandq_s8( vextq_s8(*(int8x16_t *)&qword_10016D1C0[2], *(int8x16_t *)&qword_10016D1C0[2], 8uLL),  (int8x16_t)vshrq_n_s32(vdupq_laneq_s32(v8, 3), 0x1FuLL)),  vorrq_s8( vextq_s8(v9, (int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x3FuLL), 8uLL),  (int8x16_t)vshlq_n_s64((int64x2_t)v8, 1uLL)));
  *a1 = v10;
  a1[8] = veorq_s8(v10, vextq_s8(v10, v10, 8uLL));
  int8x16_t v11 = (int8x16_t)vmull_high_p64((uint64x2_t)v10, (uint64x2_t)v10);
  int8x16_t v12 = (int8x16_t)vmull_p64(v10.u64[0], v10.u64[0]);
  int8x16_t v13 = veorq_s8( v12,  veorq_s8( v11,  (int8x16_t)vmull_p64( veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0],  veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0])));
  int8x16_t v14 = veorq_s8(vextq_s8(v9, v13, 8uLL), v12);
  int8x16_t v15 = veorq_s8(vextq_s8(v14, v14, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v14.u64[0]));
  int8x16_t v16 = veorq_s8( veorq_s8(vextq_s8(v13, v9, 8uLL), v11),  veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v15.u64[0])));
  a1[1] = v16;
  a1[9] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL));
  v13.i64[0] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL)).u64[0];
  int8x16_t v17 = (int8x16_t)vmull_high_p64((uint64x2_t)v16, (uint64x2_t)v10);
  int8x16_t v18 = (int8x16_t)vmull_p64(v16.u64[0], v10.u64[0]);
  int8x16_t v19 = veorq_s8(v18, veorq_s8(v17, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v13.u64[0])));
  int8x16_t v20 = veorq_s8(vextq_s8(v9, v19, 8uLL), v18);
  int8x16_t v21 = veorq_s8(vextq_s8(v20, v20, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v20.u64[0]));
  int8x16_t v22 = veorq_s8( veorq_s8(vextq_s8(v19, v9, 8uLL), v17),  veorq_s8(vextq_s8(v21, v21, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v21.u64[0])));
  a1[2] = v22;
  a1[10] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL));
  v19.i64[0] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL)).u64[0];
  int8x16_t v23 = (int8x16_t)vmull_high_p64((uint64x2_t)v22, (uint64x2_t)v10);
  int8x16_t v24 = (int8x16_t)vmull_p64(v22.u64[0], v10.u64[0]);
  int8x16_t v25 = veorq_s8(v24, veorq_s8(v23, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v19.u64[0])));
  int8x16_t v26 = veorq_s8(vextq_s8(v9, v25, 8uLL), v24);
  int8x16_t v27 = veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v26.u64[0]));
  int8x16_t v28 = veorq_s8( veorq_s8(vextq_s8(v25, v9, 8uLL), v23),  veorq_s8(vextq_s8(v27, v27, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v27.u64[0])));
  a1[3] = v28;
  a1[11] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL));
  v25.i64[0] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0];
  int8x16_t v29 = (int8x16_t)vmull_high_p64((uint64x2_t)v28, (uint64x2_t)v10);
  int8x16_t v30 = (int8x16_t)vmull_p64(v28.u64[0], v10.u64[0]);
  int8x16_t v31 = veorq_s8(v30, veorq_s8(v29, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v25.u64[0])));
  int8x16_t v32 = veorq_s8(vextq_s8(v9, v31, 8uLL), v30);
  int8x16_t v33 = veorq_s8(vextq_s8(v32, v32, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v32.u64[0]));
  int8x16_t v34 = veorq_s8( veorq_s8(vextq_s8(v31, v9, 8uLL), v29),  veorq_s8(vextq_s8(v33, v33, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v33.u64[0])));
  a1[4] = v34;
  a1[12] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL));
  v31.i64[0] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL)).u64[0];
  int8x16_t v35 = (int8x16_t)vmull_high_p64((uint64x2_t)v34, (uint64x2_t)v10);
  int8x16_t v36 = (int8x16_t)vmull_p64(v34.u64[0], v10.u64[0]);
  int8x16_t v37 = veorq_s8(v36, veorq_s8(v35, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v31.u64[0])));
  int8x16_t v38 = veorq_s8(vextq_s8(v9, v37, 8uLL), v36);
  int8x16_t v39 = veorq_s8(vextq_s8(v38, v38, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v38.u64[0]));
  int8x16_t v40 = veorq_s8( veorq_s8(vextq_s8(v37, v9, 8uLL), v35),  veorq_s8(vextq_s8(v39, v39, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v39.u64[0])));
  a1[5] = v40;
  a1[13] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL));
  v37.i64[0] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL)).u64[0];
  int8x16_t v41 = (int8x16_t)vmull_high_p64((uint64x2_t)v40, (uint64x2_t)v10);
  int8x16_t v42 = (int8x16_t)vmull_p64(v40.u64[0], v10.u64[0]);
  int8x16_t v43 = veorq_s8(v42, veorq_s8(v41, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v37.u64[0])));
  int8x16_t v44 = veorq_s8(vextq_s8(v9, v43, 8uLL), v42);
  int8x16_t v45 = veorq_s8(vextq_s8(v44, v44, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v44.u64[0]));
  int8x16_t v46 = veorq_s8( veorq_s8(vextq_s8(v43, v9, 8uLL), v41),  veorq_s8(vextq_s8(v45, v45, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v45.u64[0])));
  a1[6] = v46;
  a1[14] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL));
  v43.i64[0] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL)).u64[0];
  int8x16_t v47 = (int8x16_t)vmull_high_p64((uint64x2_t)v46, (uint64x2_t)v10);
  int8x16_t v48 = (int8x16_t)vmull_p64(v46.u64[0], v10.u64[0]);
  int8x16_t v49 = veorq_s8(v48, veorq_s8(v47, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v43.u64[0])));
  int8x16_t v50 = veorq_s8(vextq_s8(v9, v49, 8uLL), v48);
  int8x16_t v51 = veorq_s8(vextq_s8(v50, v50, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v50.u64[0]));
  int8x16_t result = veorq_s8( veorq_s8(vextq_s8(v49, v9, 8uLL), v47),  veorq_s8(vextq_s8(v51, v51, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v51.u64[0])));
  a1[7] = result;
  a1[15] = veorq_s8(result, vextq_s8(result, result, 8uLL));
  return result;
}

int8x16_t gcm_gmult( int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, double a4, double a5, double a6, double a7, double a8, int8x16_t a9)
{
  int8x16_t v9 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10016D1C0);
  int8x16_t v10 = veorq_s8(a9, a9);
  unint64_t v11 = veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0];
  int8x16_t v12 = (int8x16_t)vmull_high_p64((uint64x2_t)v9, *a2);
  int8x16_t v13 = (int8x16_t)vmull_p64(v9.u64[0], a2->i64[0]);
  int8x16_t v14 = veorq_s8( v13,  veorq_s8( v12,  (int8x16_t)vmull_p64( veorq_s8(*(int8x16_t *)a2, vextq_s8(*(int8x16_t *)a2, *(int8x16_t *)a2, 8uLL)).u64[0],  v11)));
  int8x16_t v15 = veorq_s8(vextq_s8(v10, v14, 8uLL), v13);
  int8x16_t v16 = veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v15.u64[0]));
  int8x16_t result = vqtbl1q_s8( veorq_s8( veorq_s8(vextq_s8(v14, v10, 8uLL), v12),  veorq_s8(vextq_s8(v16, v16, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000LL, v16.u64[0]))),  *(int8x16_t *)qword_10016D1C0);
  *a3 = result;
  return result;
}

int8x16_t gcm_ghash(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, uint64_t a4)
{
  int8x16_t v5 = veorq_s8(v4, v4);
  int8x16_t v6 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10016D1C0);
  BOOL v7 = a4 < 128;
  for (uint64_t i = a4 - 128; !v7; i -= 128LL)
  {
    int8x16_t v9 = vqtbl1q_s8(a3[7], *(int8x16_t *)qword_10016D1C0);
    int8x16_t v10 = (int8x16_t)vmull_p64(a2->i64[0], v9.u64[0]);
    int8x16_t v11 = (int8x16_t)vmull_high_p64(*a2, (uint64x2_t)v9);
    int8x16_t v12 = (int8x16_t)vmull_p64(a2[8].u64[0], veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0]);
    int8x16_t v13 = vqtbl1q_s8(a3[6], *(int8x16_t *)qword_10016D1C0);
    uint64x2_t v14 = a2[1];
    int8x16_t v15 = veorq_s8(v10, (int8x16_t)vmull_p64(v14.u64[0], v13.u64[0]));
    int8x16_t v16 = veorq_s8(v11, (int8x16_t)vmull_high_p64(v14, (uint64x2_t)v13));
    int8x16_t v17 = veorq_s8(v12, (int8x16_t)vmull_p64(a2[9].u64[0], veorq_s8(v13, vextq_s8(v13, v13, 8uLL)).u64[0]));
    int8x16_t v18 = vqtbl1q_s8(a3[5], *(int8x16_t *)qword_10016D1C0);
    uint64x2_t v19 = a2[2];
    int8x16_t v20 = veorq_s8(v15, (int8x16_t)vmull_p64(v19.u64[0], v18.u64[0]));
    int8x16_t v21 = veorq_s8(v16, (int8x16_t)vmull_high_p64(v19, (uint64x2_t)v18));
    int8x16_t v22 = veorq_s8(v17, (int8x16_t)vmull_p64(a2[10].u64[0], veorq_s8(v18, vextq_s8(v18, v18, 8uLL)).u64[0]));
    int8x16_t v23 = vqtbl1q_s8(a3[4], *(int8x16_t *)qword_10016D1C0);
    uint64x2_t v24 = a2[3];
    int8x16_t v25 = veorq_s8(v20, (int8x16_t)vmull_p64(v24.u64[0], v23.u64[0]));
    int8x16_t v26 = veorq_s8(v21, (int8x16_t)vmull_high_p64(v24, (uint64x2_t)v23));
    int8x16_t v27 = veorq_s8(v22, (int8x16_t)vmull_p64(a2[11].u64[0], veorq_s8(v23, vextq_s8(v23, v23, 8uLL)).u64[0]));
    int8x16_t v28 = vqtbl1q_s8(a3[3], *(int8x16_t *)qword_10016D1C0);
    uint64x2_t v29 = a2[4];
    int8x16_t v30 = veorq_s8(v25, (int8x16_t)vmull_p64(v29.u64[0], v28.u64[0]));
    int8x16_t v31 = veorq_s8(v26, (int8x16_t)vmull_high_p64(v29, (uint64x2_t)v28));
    int8x16_t v32 = veorq_s8(v27, (int8x16_t)vmull_p64(a2[12].u64[0], veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0]));
    int8x16_t v33 = vqtbl1q_s8(a3[2], *(int8x16_t *)qword_10016D1C0);
    uint64x2_t v34 = a2[5];
    int8x16_t v35 = veorq_s8(v30, (int8x16_t)vmull_p64(v34.u64[0], v33.u64[0]));
    int8x16_t v36 = veorq_s8(v31, (int8x16_t)vmull_high_p64(v34, (uint64x2_t)v33));
    int8x16_t v37 = veorq_s8(v32, (int8x16_t)vmull_p64(a2[13].u64[0], veorq_s8(v33, vextq_s8(v33, v33, 8uLL)).u64[0]));
    int8x16_t v38 = vqtbl1q_s8(a3[1], *(int8x16_t *)qword_10016D1C0);
    uint64x2_t v39 = a2[6];
    int8x16_t v40 = veorq_s8(v35, (int8x16_t)vmull_p64(v39.u64[0], v38.u64[0]));
    int8x16_t v41 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v39, (uint64x2_t)v38));
    int8x16_t v42 = veorq_s8(v37, (int8x16_t)vmull_p64(a2[14].u64[0], veorq_s8(v38, vextq_s8(v38, v38, 8uLL)).u64[0]));
    uint64x2_t v43 = a2[7];
    int8x16_t v44 = veorq_s8(vqtbl1q_s8(*a3, *(int8x16_t *)qword_10016D1C0), v6);
    int8x16_t v45 = veorq_s8(v40, (int8x16_t)vmull_p64(v43.u64[0], v44.u64[0]));
    int8x16_t v46 = veorq_s8(v41, (int8x16_t)vmull_high_p64(v43, (uint64x2_t)v44));
    int8x16_t v47 = veorq_s8( v46,  veorq_s8( v45,  veorq_s8(v42, (int8x16_t)vmull_p64(a2[15].u64[0], veorq_s8(v44, vextq_s8(v44, v44, 8uLL)).u64[0]))));
    int8x16_t v48 = veorq_s8(v45, vextq_s8(v5, v47, 8uLL));
    int8x16_t v49 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v48.u64[0]), vextq_s8(v48, v48, 8uLL));
    int8x16_t v6 = veorq_s8( veorq_s8(v46, vextq_s8(v47, v5, 8uLL)),  veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v49.u64[0]), vextq_s8(v49, v49, 8uLL)));
    a3 += 8;
    BOOL v7 = i < 128;
  }

  BOOL v7 = i < -112;
  uint64_t v50 = i + 112;
  if (!v7)
  {
    int8x16_t v52 = *a3;
    int8x16_t v51 = a3 + 1;
    int8x16_t v53 = veorq_s8(v6, vqtbl1q_s8(v52, *(int8x16_t *)qword_10016D1C0));
    char v54 = (uint64x2_t *)((char *)a2 + v50);
    uint64x2_t v55 = *(uint64x2_t *)((char *)a2 + v50);
    int8x16_t v56 = (int8x16_t)vmull_p64(v53.u64[0], v55.u64[0]);
    int8x16_t v57 = (int8x16_t)vmull_high_p64((uint64x2_t)v53, v55);
    int8x16_t v58 = (int8x16_t)vmull_p64( veorq_s8(v53, vextq_s8(v53, v53, 8uLL)).u64[0],  *(unint64_t *)((char *)a2[8].u64 + v50));
    BOOL v7 = v50 < 16;
    for (uint64_t j = v50 - 16; !v7; j -= 16LL)
    {
      --v54;
      int8x16_t v60 = *v51++;
      int8x16_t v61 = vqtbl1q_s8(v60, *(int8x16_t *)qword_10016D1C0);
      int8x16_t v56 = veorq_s8(v56, (int8x16_t)vmull_p64(v61.u64[0], v54->i64[0]));
      int8x16_t v57 = veorq_s8(v57, (int8x16_t)vmull_high_p64((uint64x2_t)v61, *v54));
      int8x16_t v58 = veorq_s8(v58, (int8x16_t)vmull_p64(veorq_s8(v61, vextq_s8(v61, v61, 8uLL)).u64[0], v54[8].u64[0]));
      BOOL v7 = j < 16;
    }

    int8x16_t v62 = veorq_s8(v57, veorq_s8(v56, v58));
    int8x16_t v63 = veorq_s8(v56, vextq_s8(v5, v62, 8uLL));
    int8x16_t v64 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v63.u64[0]), vextq_s8(v63, v63, 8uLL));
    int8x16_t v6 = veorq_s8( veorq_s8(v57, vextq_s8(v62, v5, 8uLL)),  veorq_s8((int8x16_t)vmull_p64(0xC200000000000000LL, v64.u64[0]), vextq_s8(v64, v64, 8uLL)));
  }

  int8x16_t result = vqtbl1q_s8(v6, *(int8x16_t *)qword_10016D1C0);
  *a1 = result;
  return result;
}

int64x2_t *AccelerateCrypto_SHA512_compress_hwassist(int64x2_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int64x2_t v3 = *result;
    int64x2_t v4 = result[1];
    int64x2_t v5 = result[2];
    int64x2_t v6 = result[3];
    do
    {
      _Q24 = v3;
      _Q25 = v4;
      _Q0 = vrev64q_s8(*a3);
      _Q1 = vrev64q_s8(a3[1]);
      _Q2 = vrev64q_s8(a3[2]);
      _Q3 = vrev64q_s8(a3[3]);
      _Q4 = vrev64q_s8(a3[4]);
      _Q5 = vrev64q_s8(a3[5]);
      _Q6 = vrev64q_s8(a3[6]);
      _Q7 = vrev64q_s8(a3[7]);
      a3 += 8;
      _Q29 = vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL);
      _Q28 = vextq_s8((int8x16_t)v4, (int8x16_t)v5, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }

      int64x2_t v26 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }

      int8x16_t v29 = (int8x16_t)vaddq_s64(v4, v26);
      _Q29 = vextq_s8(v29, (int8x16_t)v5, 8uLL);
      _Q28 = vextq_s8((int8x16_t)v3, v29, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }

      int64x2_t v35 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }

      int8x16_t v38 = (int8x16_t)vaddq_s64(v3, v35);
      _Q29 = vextq_s8(v38, v29, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v38, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }

      int64x2_t v44 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }

      int8x16_t v47 = (int8x16_t)vaddq_s64(_Q27, v44);
      _Q29 = vextq_s8(v47, v38, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v47, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }

      int64x2_t v53 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }

      int8x16_t v56 = (int8x16_t)vaddq_s64(_Q26, v53);
      _Q29 = vextq_s8(v56, v47, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v56, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }

      int64x2_t v62 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }

      int8x16_t v65 = (int8x16_t)vaddq_s64(_Q25, v62);
      _Q29 = vextq_s8(v65, v56, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v65, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }

      int64x2_t v71 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }

      int8x16_t v74 = (int8x16_t)vaddq_s64(_Q24, v71);
      _Q29 = vextq_s8(v74, v65, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v74, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }

      int64x2_t v80 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }

      int8x16_t v83 = (int8x16_t)vaddq_s64(_Q27, v80);
      _Q29 = vextq_s8(v83, v74, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v83, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }

      int64x2_t v89 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }

      int8x16_t v92 = (int8x16_t)vaddq_s64(_Q26, v89);
      _Q29 = vextq_s8(v92, v83, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v92, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }

      int64x2_t v98 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }

      int8x16_t v101 = (int8x16_t)vaddq_s64(_Q25, v98);
      _Q29 = vextq_s8(v101, v92, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v101, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }

      int64x2_t v107 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }

      int8x16_t v110 = (int8x16_t)vaddq_s64(_Q24, v107);
      _Q29 = vextq_s8(v110, v101, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v110, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }

      int64x2_t v116 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }

      int8x16_t v119 = (int8x16_t)vaddq_s64(_Q27, v116);
      _Q29 = vextq_s8(v119, v110, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v119, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }

      int64x2_t v125 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }

      int8x16_t v128 = (int8x16_t)vaddq_s64(_Q26, v125);
      _Q29 = vextq_s8(v128, v119, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v128, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }

      int64x2_t v134 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }

      int8x16_t v137 = (int8x16_t)vaddq_s64(_Q25, v134);
      _Q29 = vextq_s8(v137, v128, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v137, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }

      int64x2_t v143 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }

      int8x16_t v146 = (int8x16_t)vaddq_s64(_Q24, v143);
      _Q29 = vextq_s8(v146, v137, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v146, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }

      int64x2_t v152 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }

      int8x16_t v155 = (int8x16_t)vaddq_s64(_Q27, v152);
      _Q29 = vextq_s8(v155, v146, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v155, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }

      int64x2_t v161 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }

      int8x16_t v164 = (int8x16_t)vaddq_s64(_Q26, v161);
      _Q29 = vextq_s8(v164, v155, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v164, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }

      int64x2_t v170 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }

      int8x16_t v173 = (int8x16_t)vaddq_s64(_Q25, v170);
      _Q29 = vextq_s8(v173, v164, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v173, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }

      int64x2_t v179 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }

      int8x16_t v182 = (int8x16_t)vaddq_s64(_Q24, v179);
      _Q29 = vextq_s8(v182, v173, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v182, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }

      int64x2_t v188 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }

      int8x16_t v191 = (int8x16_t)vaddq_s64(_Q27, v188);
      _Q29 = vextq_s8(v191, v182, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v191, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }

      int64x2_t v197 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }

      int8x16_t v200 = (int8x16_t)vaddq_s64(_Q26, v197);
      _Q29 = vextq_s8(v200, v191, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v200, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }

      int64x2_t v206 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }

      int8x16_t v209 = (int8x16_t)vaddq_s64(_Q25, v206);
      _Q29 = vextq_s8(v209, v200, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v209, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }

      int64x2_t v215 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }

      int8x16_t v218 = (int8x16_t)vaddq_s64(_Q24, v215);
      _Q29 = vextq_s8(v218, v209, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v218, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }

      int64x2_t v224 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }

      int8x16_t v227 = (int8x16_t)vaddq_s64(_Q27, v224);
      _Q29 = vextq_s8(v227, v218, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v227, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }

      int64x2_t v233 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }

      int8x16_t v236 = (int8x16_t)vaddq_s64(_Q26, v233);
      _Q29 = vextq_s8(v236, v227, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v236, 8uLL);
      _Q31 = vextq_s8(_Q4, _Q5, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V0.2D, V1.2D
      }

      int64x2_t v242 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V0.2D, V7.2D, V31.2D
      }

      int8x16_t v245 = (int8x16_t)vaddq_s64(_Q25, v242);
      _Q29 = vextq_s8(v245, v236, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v245, 8uLL);
      _Q31 = vextq_s8(_Q5, _Q6, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V1.2D, V2.2D
      }

      int64x2_t v251 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V1.2D, V0.2D, V31.2D
      }

      int8x16_t v254 = (int8x16_t)vaddq_s64(_Q24, v251);
      _Q29 = vextq_s8(v254, v245, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v254, 8uLL);
      _Q31 = vextq_s8(_Q6, _Q7, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V2.2D, V3.2D
      }

      int64x2_t v260 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V2.2D, V1.2D, V31.2D
      }

      int8x16_t v263 = (int8x16_t)vaddq_s64(_Q27, v260);
      _Q29 = vextq_s8(v263, v254, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v263, 8uLL);
      _Q31 = vextq_s8(_Q7, _Q0, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V3.2D, V4.2D
      }

      int64x2_t v269 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V3.2D, V2.2D, V31.2D
      }

      int8x16_t v272 = (int8x16_t)vaddq_s64(_Q26, v269);
      _Q29 = vextq_s8(v272, v263, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v272, 8uLL);
      _Q31 = vextq_s8(_Q0, _Q1, 8uLL);
      __asm
      {
        SHA512H         Q27, Q29, V28.2D
        SHA512SU0       V4.2D, V5.2D
      }

      int64x2_t v278 = _Q27;
      __asm
      {
        SHA512H2        Q27, Q25, V24.2D
        SHA512SU1       V4.2D, V3.2D, V31.2D
      }

      int8x16_t v281 = (int8x16_t)vaddq_s64(_Q25, v278);
      _Q29 = vextq_s8(v281, v272, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v281, 8uLL);
      _Q31 = vextq_s8(_Q1, _Q2, 8uLL);
      __asm
      {
        SHA512H         Q26, Q29, V28.2D
        SHA512SU0       V5.2D, V6.2D
      }

      int64x2_t v287 = _Q26;
      __asm
      {
        SHA512H2        Q26, Q24, V27.2D
        SHA512SU1       V5.2D, V4.2D, V31.2D
      }

      int8x16_t v290 = (int8x16_t)vaddq_s64(_Q24, v287);
      _Q29 = vextq_s8(v290, v281, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v290, 8uLL);
      _Q31 = vextq_s8(_Q2, _Q3, 8uLL);
      __asm
      {
        SHA512H         Q25, Q29, V28.2D
        SHA512SU0       V6.2D, V7.2D
      }

      int64x2_t v296 = _Q25;
      __asm
      {
        SHA512H2        Q25, Q27, V26.2D
        SHA512SU1       V6.2D, V5.2D, V31.2D
      }

      int8x16_t v299 = (int8x16_t)vaddq_s64(_Q27, v296);
      _Q29 = vextq_s8(v299, v290, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v299, 8uLL);
      _Q31 = vextq_s8(_Q3, _Q4, 8uLL);
      __asm
      {
        SHA512H         Q24, Q29, V28.2D
        SHA512SU0       V7.2D, V0.2D
      }

      int64x2_t v305 = _Q24;
      __asm
      {
        SHA512H2        Q24, Q26, V25.2D
        SHA512SU1       V7.2D, V6.2D, V31.2D
      }

      int8x16_t v308 = (int8x16_t)vaddq_s64(_Q26, v305);
      _Q29 = vextq_s8(v308, v299, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v308, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q27, Q25, V24.2D
      }

      int8x16_t v313 = (int8x16_t)vaddq_s64(_Q25, _Q30);
      _Q29 = vextq_s8(v313, v308, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v313, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q26, Q24, V27.2D
      }

      int8x16_t v318 = (int8x16_t)vaddq_s64(_Q24, _Q30);
      _Q29 = vextq_s8(v318, v313, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v318, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q25, Q27, V26.2D
      }

      int8x16_t v323 = (int8x16_t)vaddq_s64(_Q27, _Q30);
      _Q29 = vextq_s8(v323, v318, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, v323, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q24, Q26, V25.2D
      }

      int8x16_t v328 = (int8x16_t)vaddq_s64(_Q26, _Q30);
      _Q29 = vextq_s8(v328, v323, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q25, v328, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q27, Q25, V24.2D
      }

      int8x16_t v333 = (int8x16_t)vaddq_s64(_Q25, _Q30);
      _Q29 = vextq_s8(v333, v328, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q24, v333, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q26, Q24, V27.2D
      }

      int8x16_t v338 = (int8x16_t)vaddq_s64(_Q24, _Q30);
      _Q29 = vextq_s8(v338, v333, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q27, v338, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q25, Q27, V26.2D
      }

      int64x2_t v343 = vaddq_s64(_Q27, _Q30);
      _Q29 = vextq_s8((int8x16_t)v343, v338, 8uLL);
      _Q28 = vextq_s8((int8x16_t)_Q26, (int8x16_t)v343, 8uLL);
      __asm
      {
        SHA512H         Q30, Q29, V28.2D
        SHA512H2        Q24, Q26, V25.2D
      }

      int64x2_t v3 = vaddq_s64(v3, _Q24);
      int64x2_t v4 = vaddq_s64(v4, _Q25);
      int64x2_t v5 = vaddq_s64(v5, vaddq_s64(_Q26, _Q30));
      int64x2_t v6 = vaddq_s64(v6, v343);
    }

    while (a2-- > 1);
    *int8x16_t result = v3;
    result[1] = v4;
    result[2] = v5;
    result[3] = v6;
  }

  return result;
}

int32x4_t *AccelerateCrypto_SHA1_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  if (a2)
  {
    int8x16_t v5 = *a3;
    int8x16_t v6 = a3[1];
    int8x16_t v7 = a3[2];
    int8x16_t v8 = a3[3];
    int64x2_t v4 = a3 + 4;
    int32x4_t v10 = *result;
    int8x16_t v9 = result + 1;
    int32x4_t v11 = v10;
    v10.i32[0] = v9->i32[0];
    int8x16_t v12 = v9 - 1;
    v3.i32[0] = v10.i32[0];
    _Q1 = (int32x4_t)vrev32q_s8(v6);
    _Q2 = (int32x4_t)vrev32q_s8(v7);
    _Q3 = (int32x4_t)vrev32q_s8(v8);
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v5), *(int32x4_t *)K_XMM_AR);
    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)K_XMM_AR);
    _Q19 = v3;
    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)K_XMM_AR);
    _Q7 = vaddq_s32(_Q3, *(int32x4_t *)K_XMM_AR);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

    _S20 = v11.i32[0];
    __asm
    {
      SHA1C           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }

    _Q4 = vaddq_s32(_Q0, *(int32x4_t *)K_XMM_AR);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }

    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }

    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }

    _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1C           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }

    _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }

    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }

    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }

    _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }

    _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }

    _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }

    _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }

    _Q7 = vaddq_s32(_Q3, loc_10016DA80);
    __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V4.4S
      SHA1H           S19, S20
      SHA1SU1         V0.4S, V3.4S
    }

    _Q4 = vaddq_s32(_Q0, loc_10016DA80);
    __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V5.4S
      SHA1H           S19, S20
      SHA1SU1         V1.4S, V0.4S
    }

    _Q5 = vaddq_s32(_Q1, loc_10016DA80);
    __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1M           Q18, S19, V6.4S
      SHA1H           S19, S20
      SHA1SU1         V2.4S, V1.4S
    }

    _Q6 = vaddq_s32(_Q2, loc_10016DA80);
    __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V7.4S
      SHA1H           S19, S20
      SHA1SU1         V3.4S, V2.4S
    }

    _Q7 = vaddq_s32(_Q3, loc_10016DA80);
    BOOL v105 = a2 <= 1;
    for (uint64_t i = a2 - 1; !v105; --i)
    {
      int8x16_t v107 = *v4;
      int8x16_t v108 = v4[1];
      int8x16_t v109 = v4[2];
      int8x16_t v110 = v4[3];
      v4 += 4;
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V4.4S
        SHA1H           S19, S20
      }

      _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v107), *(int32x4_t *)K_XMM_AR);
      _Q1 = (int32x4_t)vrev32q_s8(v108);
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V5.4S
        SHA1H           S19, S20
      }

      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)K_XMM_AR);
      _Q2 = (int32x4_t)vrev32q_s8(v109);
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V6.4S
        SHA1H           S19, S20
      }

      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)K_XMM_AR);
      _Q3 = (int32x4_t)vrev32q_s8(v110);
      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V7.4S
        SHA1H           S19, S20
      }

      _Q7 = vaddq_s32(_Q3, *(int32x4_t *)K_XMM_AR);
      _Q19 = vaddq_s32(v3, _Q19);
      int32x4_t v11 = vaddq_s32(v11, _Q18);
      int32x4_t v3 = _Q19;
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

      _S20 = v11.i32[0];
      __asm
      {
        SHA1C           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }

      _Q4 = vaddq_s32(_Q0, *(int32x4_t *)K_XMM_AR);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }

      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }

      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }

      _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1C           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }

      _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }

      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[2]);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }

      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }

      _Q7 = vaddq_s32(_Q3, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }

      _Q4 = vaddq_s32(_Q0, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }

      _Q5 = vaddq_s32(_Q1, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }

      _Q6 = vaddq_s32(_Q2, *(int32x4_t *)&K_XMM_AR[4]);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }

      _Q7 = vaddq_s32(_Q3, loc_10016DA80);
      __asm { SHA1SU0         V0.4S, V1.4S, V2.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V4.4S
        SHA1H           S19, S20
        SHA1SU1         V0.4S, V3.4S
      }

      _Q4 = vaddq_s32(_Q0, loc_10016DA80);
      __asm { SHA1SU0         V1.4S, V2.4S, V3.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V5.4S
        SHA1H           S19, S20
        SHA1SU1         V1.4S, V0.4S
      }

      _Q5 = vaddq_s32(_Q1, loc_10016DA80);
      __asm { SHA1SU0         V2.4S, V3.4S, V0.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1M           Q18, S19, V6.4S
        SHA1H           S19, S20
        SHA1SU1         V2.4S, V1.4S
      }

      _Q6 = vaddq_s32(_Q2, loc_10016DA80);
      __asm { SHA1SU0         V3.4S, V0.4S, V1.4S }

      _S20 = _Q18;
      __asm
      {
        SHA1P           Q18, S19, V7.4S
        SHA1H           S19, S20
        SHA1SU1         V3.4S, V2.4S
      }

      _Q7 = vaddq_s32(_Q3, loc_10016DA80);
      BOOL v105 = i <= 1;
    }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V4.4S
      SHA1H           S19, S20
    }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V5.4S
      SHA1H           S19, S20
    }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V6.4S
      SHA1H           S19, S20
    }

    _S20 = _Q18;
    __asm
    {
      SHA1P           Q18, S19, V7.4S
      SHA1H           S19, S20
    }

    int32x4_t *v12 = vaddq_s32(v11, _Q18);
    int8x16_t result = v12 + 1;
    result->i32[0] = vaddq_s32(v3, _Q19).u32[0];
  }

  return result;
}

void *ccec_cp_256_asm()
{
  return &ccec_cp256_asm;
}

_OWORD *ccn_p256_mul_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p256(a3, a4, a5);
}

_OWORD *ccn_p256_sqr_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  return ccn_mulmod_p256(a3, a4, a4);
}

uint64_t ccn_p256_inv_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  int v8 = 4;
  int8x16_t v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4LL);
  int32x4_t v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4LL);
  int32x4_t v11 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4LL);
  ccn_mulmod_p256(v11, a4, a4);
  ccn_mulmod_p256(v10, v11, a4);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v9, v10, a4);
  ccn_mulmod_p256(v10, v9, v11);
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v8;
  }

  while (v8);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v12 = 8;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v12;
  }

  while (v12);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  int v13 = 16;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v13;
  }

  while (v13);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  ccn_set(4LL, v11, v10);
  int v14 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v14;
  }

  while (v14);
  ccn_mulmod_p256(v11, v11, a4);
  int v15 = 128;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v15;
  }

  while (v15);
  ccn_mulmod_p256(v11, v11, v10);
  int v16 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v16;
  }

  while (v16);
  ccn_mulmod_p256(v11, v11, v10);
  int v17 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v17;
  }

  while (v17);
  ccn_mulmod_p256(v10, v11, v9);
  ccn_mulmod_p256(v9, v10, a4);
  v19[0] = xmmword_10019FE88;
  v19[1] = unk_10019FE98;
  ccn_mulmod_p256(v9, v9, (unint64_t *)v19);
  if (ccn_n(4LL, v9) == 1 && *v9 == 1)
  {
    ccn_set(4LL, a3, v10);
    uint64_t result = 0LL;
  }

  else
  {
    uint64_t result = 4294967254LL;
  }

  *(void *)(a1 + 16) = v7;
  return result;
}

_OWORD *ccn_p256_from_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  v5[0] = xmmword_10019FE88;
  v5[1] = unk_10019FE98;
  return ccn_mulmod_p256(a3, a4, (unint64_t *)v5);
}

uint64_t cczp_mm_redc_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v8 = cczp_n((uint64_t)a2);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = a2[*a2 + 3];
    int32x4_t v11 = a4;
    uint64_t v12 = v8;
    do
    {
      uint64_t v13 = cczp_prime((uint64_t)a2);
      uint64_t *v11 = ccn_addmul1(v9, v11, v13, *v11 * v10);
      ++v11;
      --v12;
    }

    while (v12);
  }

  BOOL v14 = ccn_add_ws(a1, v9, &a4[v9], &a4[v9], a4);
  int v15 = (unint64_t *)cczp_prime((uint64_t)a2);
  char v16 = ccn_sub_ws(a1, v9, a4, &a4[v9], v15) ^ v14;
  return ccn_mux(v9, v16, a3, &a4[v9], a4);
}

uint64_t inc_uint(uint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = (_BYTE *)(a2 + result - 1);
    unint64_t v3 = 2LL;
    do
    {
      if (++*v2--) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v3 > a2;
      }
      ++v3;
    }

    while (!v5);
  }

  return result;
}

uint64_t ccn_cond_clear(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t result = ccn_mux_next_mask();
  for (uint64_t i = __ROR8__(0x5555555555555555LL, a2 | (2 * result)); a1; --a1)
  {
    uint64_t v8 = *a3;
    uint64_t v9 = *a3 ^ result;
    *a3 = v9;
    *a3++ = v9 ^ v8 & 0x5555555555555555LL ^ v8 & i ^ result;
  }

  return result;
}

uint64_t ccn_shift_right_asm(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result)
  {
    unint64_t v4 = a3->i64[0];
    char v5 = 64 - a4;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(64 - a4);
    uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(-a4);
    BOOL v8 = result == 4;
    BOOL v9 = result < 4;
    result -= 4LL;
    if (!v9)
    {
      if (v8)
      {
        int8x16_t v13 = a3[1];
        *a2 = veorq_s8( (int8x16_t)vshlq_u64(*(uint64x2_t *)a3, v7),  (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(*a3, v13, 8uLL), v6));
        a2[1] = veorq_s8( (int8x16_t)vshlq_u64((uint64x2_t)v13, v7),  (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v13, v13, 8uLL).u64[0], v6));
        return result;
      }

      do
      {
        int8x16_t v10 = *a3;
        int8x16_t v11 = a3[1];
        a3 += 2;
        unint64_t v4 = a3->i64[0];
        v12.i64[0] = vextq_s8(v11, v11, 8uLL).u64[0];
        v12.i64[1] = a3->i64[0];
        *a2 = veorq_s8( (int8x16_t)vshlq_u64((uint64x2_t)v10, v7),  (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v10, v11, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v7), (int8x16_t)vshlq_u64(v12, v6));
        a2 += 2;
        BOOL v9 = result <= 4;
        result -= 4LL;
      }

      while (!v9);
    }

    uint64_t v14 = result + 4;
    int v15 = &a3->u64[1];
    BOOL v16 = v14 == 2;
    BOOL v9 = v14 < 2;
    uint64_t result = v14 - 2;
    if (!v9)
    {
      if (v16)
      {
        uint64_t v19 = *v15 >> a4;
        a2->i64[0] = (v4 >> a4) | (*v15 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = v19;
        return result;
      }

      do
      {
        unint64_t v17 = *v15;
        unint64_t v18 = v15[1];
        v15 += 2;
        a2->i64[0] = (v4 >> a4) | (v17 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = (v17 >> a4) | (v18 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        ++a2;
        unint64_t v4 = v18;
        BOOL v9 = result <= 2;
        result -= 2LL;
      }

      while (!v9);
    }

    a2->i64[0] = v4 >> a4;
  }

  return result;
}

uint64_t ccaes_vng_ccm_encrypt(_DWORD *a1, int8x16_t *a2, unint64_t a3, int8x16_t *a4, int8x16_t *a5)
{
  __int32 v10 = a2[4].i32[0];
  if (v10 == 5) {
    goto LABEL_6;
  }
  if (v10 == 4)
  {
    if (a2[4].i32[2])
    {
      (*(void (**)(_DWORD *, uint64_t, int8x16_t *, int8x16_t *))(*(void *)a1 + 24LL))( a1 + 2,  1LL,  a2 + 1,  a2 + 1);
      a2[4].i32[2] = 0;
    }

    a2[4].i32[0] = 5;
LABEL_6:
    unint64_t v11 = a2[4].u32[1];
    if ((_DWORD)v11)
    {
      unint64_t v12 = v11 >= a3 ? a3 : a2[4].u32[1];
      ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, v12, (uint64_t)a4);
      ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, v12, (uint64_t)a4, (uint64_t)a5);
      a4 = (int8x16_t *)((char *)a4 + v12);
      a5 = (int8x16_t *)((char *)a5 + v12);
      a3 -= v12;
      if (a2[4].i32[1]) {
        goto LABEL_24;
      }
    }

    if (a3 < 0x10) {
      goto LABEL_24;
    }
    int8x16_t v13 = (int8x16_t *)(a1 + 2);
    unint64_t v14 = a3 >> 4;
    int v15 = a1[62];
    if (v15 > 159)
    {
      if (v15 == 224)
      {
LABEL_21:
        ccm256_encrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8LL) + ~a2[5].i32[0]);
        goto LABEL_23;
      }

      if (v15 == 192)
      {
LABEL_22:
        ccm192_encrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8LL) + ~a2[5].i32[0]);
        goto LABEL_23;
      }

      if (v15 != 160)
      {
LABEL_23:
        unint64_t v16 = a3 & 0xFFFFFFFFFFFFFFF0LL;
        a3 &= 0xFu;
        a4 = (int8x16_t *)((char *)a4 + v16);
        a5 = (int8x16_t *)((char *)a5 + v16);
LABEL_24:
        ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, a3, (uint64_t)a4);
        ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5);
        return 0LL;
      }
    }

    else if (v15 != 10)
    {
      if (v15 != 12)
      {
        if (v15 != 14) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }

      goto LABEL_22;
    }

    ccm128_encrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8LL) + ~a2[5].i32[0]);
    goto LABEL_23;
  }

  return 4294967228LL;
}

uint64_t ccn_set_bit(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 1LL << a2;
  uint64_t v4 = (a2 >> 3) & 0x1FFFFFFFFFFFFFF8LL;
  if (a3) {
    uint64_t v5 = *(void *)(result + v4) | v3;
  }
  else {
    uint64_t v5 = *(void *)(result + v4) & ~v3;
  }
  *(void *)(result + v4) = v5;
  return result;
}

uint64_t ccn_zero(uint64_t a1, void *a2)
{
  return cc_clear(8 * a1, a2);
}

uint64_t ccn_seti(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = a3;
  return cc_clear(8 * a1 - 8, a2 + 1);
}

unint64_t ccn_cond_rsub(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555LL, a2 | (2 * mask));
  if (a1)
  {
    uint64_t v12 = 0LL;
    do
    {
      unint64_t v14 = *a4++;
      unint64_t v13 = v14;
      uint64_t v15 = *a5++;
      unsigned __int128 v16 = __PAIR128__(v12, v12) - v13;
      uint64_t v17 = v16 + v15;
      if (__CFADD__((void)v16, v15)) {
        uint64_t v18 = *((void *)&v16 + 1) + 1LL;
      }
      else {
        uint64_t v18 = (__PAIR128__(v12, v12) - v13) >> 64;
      }
      uint64_t v12 = v18 >> 63;
      uint64_t v19 = v13 ^ v17;
      uint64_t v20 = v13 ^ mask;
      *a3 = v20;
      *a3++ = v19 & v11 ^ v19 & 0x5555555555555555LL ^ v20 ^ mask;
      --a1;
    }

    while (a1);
    unint64_t v21 = (unint64_t)v18 >> 63;
  }

  else
  {
    unint64_t v21 = 0LL;
  }

  return v21 & a2;
}

BOOL timingsafe_enable_if_supported()
{
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000LL) != 0)
  {
    BOOL v0 = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) != 0;
    __asm { MSR             DIT, #1 }
  }

  else
  {
    BOOL v0 = 0LL;
  }

  if ((MEMORY[0xFFFFFC010] & 0x200000000000LL) != 0)
  {
    sb();
  }

  else
  {
    __dsb(0xFu);
    __isb(0xFu);
  }

  return v0;
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((result & 1) == 0 && (MEMORY[0xFFFFFC010] & 0x200000000000000LL) != 0) {
    __asm { MSR             DIT, #0 }
  }

  return result;
}

void sb()
{
  __asm { SB }

uint64_t ccnistkdf_ctr_cmac_fixed_internal( void *a1, unsigned int a2, unint64_t a3, uint64_t a4, unint64_t a5, char *a6, rsize_t a7, char *a8)
{
  if (!a7) {
    return 4294967289LL;
  }
  rsize_t v11 = a1[1];
  memset(__src, 0, sizeof(__src));
  rsize_t v12 = a7 / v11;
  if (a7 % v11) {
    rsize_t v13 = v12 + 1;
  }
  else {
    rsize_t v13 = a7 / v11;
  }
  HIDWORD(v14) = a2;
  LODWORD(v14) = (a2 << 24) - 0x8000000;
  uint64_t result = 4294967289LL;
  if ((v14 >> 27) <= 3u && !(v13 >> a2))
  {
    if (a3)
    {
      if (a4)
      {
        unsigned __int128 v16 = a8;
        if (a8)
        {
          rsize_t v26 = v13;
          unint64_t v27 = a3;
          rsize_t v29 = a7 % v11;
          int8x16_t v30 = &v26;
          size_t v19 = 80 * ((v11 + *a1 + 159) / 0x50);
          uint64_t v20 = (char *)&v26 - v19;
          uint64_t v28 = a4;
          bzero((char *)&v26 - v19, v19);
          int8x16_t v31 = a1;
          size_t v21 = 80 * ((a1[1] + *a1 + 159LL) / 0x50uLL);
          int8x16_t v22 = (char *)&v26 - v21;
          bzero((char *)&v26 - v21, v21);
          cccmac_init_internal(v31, (uint64_t)&v26 - v19, v27, v28);
          if (v11 <= a7)
          {
            LODWORD(v23) = 1;
            do
            {
              memcpy(v22, v20, v19);
              PRF_EVAL(v22, a2, v23, a5, a6, v16);
              rsize_t v23 = (v23 + 1);
              v16 += v11;
            }

            while (v12 >= v23);
          }

          size_t v24 = v29;
          if (v29)
          {
            memcpy(v22, v20, v19);
            PRF_EVAL(v22, a2, v26, a5, a6, __src);
            memcpy(v16, __src, v24);
          }

          cc_clear(v11, __src);
          int8x16_t v25 = v31;
          cc_clear(v25[1] + *v25 + 80LL, v20);
          cc_clear(v25[1] + *v25 + 80LL, v22);
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t ccnistkdf_ctr_cmac_internal( void *a1, unsigned int a2, unint64_t a3, uint64_t a4, size_t a5, const void *a6, size_t a7, const void *a8, rsize_t a9, size_t a10, char *a11)
{
  size_t v18 = a5 + a7 + a10;
  v27[0] = cc_malloc_clear((v18 + 8) & 0xFFFFFFFFFFFFFFF8LL);
  v27[1] = (v18 + 8) >> 3;
  v27[2] = 0LL;
  void v27[3] = cc_ws_alloc;
  uint64_t v28 = cc_ws_free;
  if (!v27[0]) {
    return 4294967283LL;
  }
  unint64_t v25 = a3;
  size_t v19 = (char *)cc_ws_alloc(v27, (v18 + 8) >> 3);
  uint64_t v20 = 4294967289LL;
  if (a10 <= 4 && !((8 * a9) >> (8 * a10)))
  {
    size_t v21 = v19;
    unint64_t v22 = v18 + 1;
    if (a5 && a6) {
      memcpy(v19, a6, a5);
    }
    rsize_t v23 = &v21[a5];
    v21[a5] = 0;
    if (a7 && a8) {
      memcpy(v23 + 1, a8, a7);
    }
    unsigned int __src = bswap32(8 * a9) >> (-8 * a10);
    memcpy(&v23[a7 + 1], &__src, a10);
    uint64_t v20 = ccnistkdf_ctr_cmac_fixed_internal(a1, a2, v25, a4, v22, v21, a9, a11);
  }

  v28((uint64_t)v27);
  return v20;
}

uint64_t PRF_EVAL(char *a1, unsigned int a2, int a3, unint64_t a4, char *a5, void *a6)
{
  unint64_t __src = HIBYTE(a3);
  BYTE1(__src) = BYTE2(a3);
  BYTE2(__src) = BYTE1(a3);
  BYTE3(__src) = a3;
  __src >>= 8 * (4 - (a2 >> 3));
  cccmac_update_internal(a1, a2 >> 3, (char *)&__src);
  cccmac_update_internal(a1, a4, a5);
  return cccmac_final_generate_internal(a1, *(void *)(*((void *)a1 + 8) + 8LL), a6);
}

uint64_t AccelerateCrypto_ecb_AES_encrypt(__int128 *a1, int a2, uint64_t a3, int8x16_t *a4)
{
  uint64_t v4 = *((unsigned int *)a1 + 60);
  _VF = __OFSUB__(a2, 4);
  int v6 = a2 - 4;
  for (int8x16_t i = *(int8x16_t *)((char *)a1 + v4); v6 < 0 == _VF; v6 -= 4)
  {
    _Q4 = *a1;
    uint64_t v9 = 16LL;
    a3 += 64LL;
    do
    {
      __asm
      {
        AESE            V0.16B, V4.16B
        AESMC           V0.16B, V0.16B
        AESE            V1.16B, V4.16B
        AESMC           V1.16B, V1.16B
        AESE            V2.16B, V4.16B
        AESMC           V2.16B, V2.16B
        AESE            V3.16B, V4.16B
        AESMC           V3.16B, V3.16B
      }

      _Q4 = a1[(unint64_t)v9 / 0x10];
      v9 += 16LL;
    }

    while (v9 < v4);
    __asm
    {
      AESE            V0.16B, V4.16B
      AESE            V1.16B, V4.16B
      AESE            V2.16B, V4.16B
      AESE            V3.16B, V4.16B
    }

    *a4 = veorq_s8(_Q0, i);
    a4[1] = veorq_s8(_Q1, i);
    a4[2] = veorq_s8(_Q2, i);
    a4[3] = veorq_s8(_Q3, i);
    a4 += 4;
    _VF = __OFSUB__(v6, 4);
  }

  int v25 = v6 & 3;
  if (v25)
  {
    do
    {
      _Q4 = *a1;
      uint64_t v27 = 16LL;
      a3 += 16LL;
      do
      {
        __asm
        {
          AESE            V0.16B, V4.16B
          AESMC           V0.16B, V0.16B
        }

        _Q4 = a1[(unint64_t)v27 / 0x10];
        v27 += 16LL;
      }

      while (v27 < v4);
      __asm { AESE            V0.16B, V4.16B }

      *a4++ = veorq_s8(_Q0, i);
      _VF = __OFSUB__(v25--, 1);
    }

    while (!((v25 < 0) ^ _VF | (v25 == 0)));
  }

  return 0LL;
}

uint64_t ccaes_vng_ccm_decrypt(_DWORD *a1, int8x16_t *a2, unint64_t a3, int8x16_t *a4, int8x16_t *a5)
{
  __int32 v10 = a2[4].i32[0];
  if (v10 == 5) {
    goto LABEL_6;
  }
  if (v10 == 4)
  {
    if (a2[4].i32[2])
    {
      (*(void (**)(_DWORD *, uint64_t, int8x16_t *, int8x16_t *))(*(void *)a1 + 24LL))( a1 + 2,  1LL,  a2 + 1,  a2 + 1);
      a2[4].i32[2] = 0;
    }

    a2[4].i32[0] = 5;
LABEL_6:
    unint64_t v11 = a2[4].u32[1];
    if ((_DWORD)v11)
    {
      unint64_t v12 = v11 >= a3 ? a3 : a2[4].u32[1];
      ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, v12, (uint64_t)a4, (uint64_t)a5);
      ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, v12, (uint64_t)a5);
      a4 = (int8x16_t *)((char *)a4 + v12);
      a5 = (int8x16_t *)((char *)a5 + v12);
      a3 -= v12;
      if (a2[4].i32[1]) {
        goto LABEL_24;
      }
    }

    if (a3 < 0x10) {
      goto LABEL_24;
    }
    rsize_t v13 = (int8x16_t *)(a1 + 2);
    unint64_t v14 = a3 >> 4;
    int v15 = a1[62];
    if (v15 > 159)
    {
      if (v15 == 224)
      {
LABEL_21:
        ccm256_decrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8LL) + ~a2[5].i32[0]);
        goto LABEL_23;
      }

      if (v15 == 192)
      {
LABEL_22:
        ccm192_decrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8LL) + ~a2[5].i32[0]);
        goto LABEL_23;
      }

      if (v15 != 160)
      {
LABEL_23:
        unint64_t v16 = a3 & 0xFFFFFFFFFFFFFFF0LL;
        a3 &= 0xFu;
        a4 = (int8x16_t *)((char *)a4 + v16);
        a5 = (int8x16_t *)((char *)a5 + v16);
LABEL_24:
        ccmode_ccm_crypt((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5);
        ccmode_ccm_macdata((uint64_t)a1, (uint64_t)a2, 0, a3, (uint64_t)a5);
        return 0LL;
      }
    }

    else if (v15 != 10)
    {
      if (v15 != 12)
      {
        if (v15 != 14) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }

      goto LABEL_22;
    }

    ccm128_decrypt(a4, a5, a2 + 1, v14, v13, a2, *(void *)(*(void *)a1 + 8LL) + ~a2[5].i32[0]);
    goto LABEL_23;
  }

  return 4294967228LL;
}

unint64_t ccec_export_affine_point_size(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
    case 2:
      unint64_t result = ((unint64_t)(cczp_bitlen(a1) + 7) >> 2) | 1;
      break;
    case 3:
      unint64_t result = ccec_compressed_x962_export_pub_size(a1);
      break;
    case 4:
      unint64_t result = (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
      break;
    default:
      unint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t ccec_export_affine_point_public_value( unint64_t *a1, int a2, unint64_t *a3, unint64_t *a4, char *a5)
{
  unint64_t v10 = ccec_export_affine_point_size((uint64_t)a1, a2);
  if (!v10) {
    return 4294967289LL;
  }
  if (*a4 < v10) {
    return 4294967133LL;
  }
  *a4 = v10;
  unsigned int v11 = a2 - 1;
  unint64_t v12 = *a1;
  if (a2 == 4) {
    rsize_t v13 = a5;
  }
  else {
    rsize_t v13 = a5 + 1;
  }
  uint64_t v14 = cczp_bitlen((uint64_t)a1);
  if (v11 <= 1)
  {
    int v15 = &v13[(unint64_t)(cczp_bitlen((uint64_t)a1) + 7) >> 3];
    unint64_t v16 = &a3[*a1];
    uint64_t v17 = cczp_bitlen((uint64_t)a1);
  }

  uint64_t result = 0LL;
  if ((a2 & 0xFFFFFFFE) == 2) {
    *a5 |= a3[*a1] & 1;
  }
  return result;
}

unint64_t ccn_trailing_zeros(unint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = result;
    uint64_t result = 0LL;
    unint64_t v3 = v2 - 1;
    uint64_t v4 = (v2 << 6) - 64;
    do
    {
      unint64_t v5 = *(void *)(a2 + 8 * v3);
      --v3;
      v4 -= 64LL;
    }

    while (v3 < v2);
  }

  return result;
}

uint64_t ccec_verify_internal_with_base_ws( uint64_t a1, unint64_t **a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (uint64_t *)*a2;
  uint64_t v16 = (uint64_t)(*a2 + 4);
  unint64_t v15 = **a2;
  if (a3 <= 0xF)
  {
    uint64x2_t v34 = (os_log_s *)cc_log_default();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      ccec_sign_internal_ws_cold_1(a3, v34);
    }
  }

  if (!ccec_validate_scalar(v14, a5) && !ccec_validate_scalar(v14, a6))
  {
    int8x16_t v38 = (unint64_t *)a5;
    uint64_t v41 = *(void *)(a1 + 16);
    size_t v19 = (int8x16_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    uint64x2_t v39 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    uint64_t v44 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    uint64_t v43 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    int8x16_t v40 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v15);
    int8x16_t v42 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v15);
    size_t v20 = ccec_signature_r_s_size((uint64_t *)a2);
    int8x16_t v36 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    memset(v36, 170, v20);
    __int128 __s = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v15);
    unint64_t v37 = v20;
    memset(__s, 255, v20);
    uint64_t v21 = cczp_bitlen(v16 + 40 * *v14);
    unint64_t v22 = v21;
    else {
      unint64_t v23 = (unint64_t)(v21 + 7) >> 3;
    }
    uint64_t uint_internal = ccn_read_uint_internal(v15, v19, v23, a4);
    if ((uint_internal & 0x80000000) == 0)
    {
      if (v22 < 8 * a3) {
        ccn_shift_right(v15, v19, v19, -(int)v22 & 7LL);
      }
      int v25 = (unint64_t *)cczp_prime(v16 + 40 * v15);
      if (!ccn_sub_ws(a1, v15, v39, v19->i64, v25)) {
        ccn_set(v15, v19, v39);
      }
      if (cczp_inv_ws(a1, v16 + 40 * v15)
        || (cczp_mul_ws(a1, v16 + 40 * v15),
            cczp_mul_ws(a1, v16 + 40 * v15),
            rsize_t v26 = a2 + 2,
            ccn_n(v15, &a2[2 * *v14 + 2]) != 1)
        || v26[2 * *v14] != (unint64_t *)1)
      {
LABEL_37:
        uint64_t v17 = 4294967289LL;
LABEL_39:
        uint64_t v29 = v41;
LABEL_34:
        *(void *)(a1 + 16) = v29;
        return v17;
      }

      uint64_t v27 = v16 + 40 * v15;
      uint64_t uint_internal = ccec_projectify_ws(a1, (uint64_t)v14);
      if (!(_DWORD)uint_internal)
      {
        uint64_t uint_internal = ccec_projectify_ws(a1, (uint64_t)v14);
        if (!(_DWORD)uint_internal)
        {
          if (ccec_is_point_ws(a1, v14, v42))
          {
            uint64_t v28 = *v14;
            if (ccn_cmp_internal(*v14, v16 + 16 * *v14 + 8 * *v14, v26))
            {
              uint64_t v17 = ccec_twin_mult_ws(a1, v14, v40, v44, (uint64_t)v40, v43, v42);
              uint64_t v29 = v41;
              if ((_DWORD)v17) {
                goto LABEL_34;
              }
            }

            else
            {
              uint64_t v30 = v16 + 40 * v28;
              uint64_t v31 = *(void *)(a1 + 16);
              (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v28);
              cczp_bitlen(v30);
              if (ccec_mult_ws(a1, (uint64_t)v14)
                || (cczp_bitlen(v30), ccec_mult_ws(a1, (uint64_t)v14)))
              {
                uint64_t v17 = 0xFFFFFFFFLL;
              }

              else
              {
                ccec_full_add_ws(a1, (uint64_t)v14);
                uint64_t v17 = 0LL;
              }

              uint64_t v29 = v41;
              *(void *)(a1 + 16) = v31;
              if ((_DWORD)v17) {
                goto LABEL_34;
              }
            }

            if (ccec_affinify_x_only_ws(a1, v14, (uint64_t)v40, (uint64_t)v40))
            {
              uint64_t v17 = 4294967289LL;
            }

            else
            {
              uint64_t v32 = cczp_prime(v27);
              if ((ccn_cmp_internal(v15, v40, v32) & 0x80000000) == 0)
              {
                int8x16_t v33 = (unint64_t *)cczp_prime(v27);
                ccn_sub_ws(a1, v15, v40, (uint64_t *)v40, v33);
              }

              else {
                uint64_t v17 = 0LL;
              }
              ccn_write_uint_padded_ct_internal(v15, v38, v37, (char *)v36);
              ccn_write_uint_padded_ct_internal(v15, (unint64_t *)v40, v37, (char *)__s);
              cc_fault_canary_set(a8, (uint64_t)&CCEC_FAULT_CANARY, v37, (uint64_t)v36, (uint64_t)__s);
            }

            goto LABEL_34;
          }

          goto LABEL_37;
        }
      }
    }

    uint64_t v17 = uint_internal;
    goto LABEL_39;
  }

  return 4294967289LL;
}

uint64_t ccec_verify_internal_ws( uint64_t a1, unint64_t **a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return ccec_verify_internal_with_base_ws(a1, a2, a3, a4, a5, a6, (uint64_t)&(*a2)[2 * **a2 + 4 + **a2], a7);
}

double ccn_shift_left(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64x2_t a5)
{
  uint64_t v5 = a2 + 8 * a1;
  uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(a4);
  uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(a4 - 64);
  BOOL v8 = (unint64_t *)(a3 + 8 * a1 - 8);
  BOOL v9 = a1 == 4;
  BOOL v10 = a1 < 4;
  uint64_t v11 = a1 - 4;
  if (!v10)
  {
    if (v9)
    {
      v16.i64[0] = 0LL;
      v16.i64[1] = *(v8 - 3);
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v16, v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 3), v6));
      int8x16_t v17 = veorq_s8( (int8x16_t)vshlq_u64(*((uint64x2_t *)v8 - 1), v7),  (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = v17;
      return *(double *)a5.i64;
    }

    do
    {
      uint64x2_t v12 = *(uint64x2_t *)(v8 - 3);
      uint64x2_t v13 = *(uint64x2_t *)(v8 - 1);
      uint64x2_t v14 = *((uint64x2_t *)v8 - 2);
      uint64x2_t v15 = *((uint64x2_t *)v8 - 1);
      v8 -= 4;
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v14, v7), (int8x16_t)vshlq_u64(v12, v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = veorq_s8((int8x16_t)vshlq_u64(v15, v7), (int8x16_t)vshlq_u64(v13, v6));
      v5 -= 32LL;
      BOOL v10 = v11 <= 4;
      v11 -= 4LL;
    }

    while (!v10);
  }

  uint64_t v18 = v11 & 3;
  if (!v18) {
    return *(double *)a5.i64;
  }
  if (v18 == 3)
  {
    uint64x2_t v19 = *((uint64x2_t *)v8 - 1);
  }

  else
  {
    if ((v18 & 2) == 0) {
      goto LABEL_13;
    }
    v19.i64[0] = 0LL;
    v19.i64[1] = *(v8 - 1);
  }

  a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6), (int8x16_t)vshlq_u64(v19, v7));
  v8 -= 2;
  *(uint64x2_t *)(v5 - 16) = a5;
  v5 -= 16LL;
LABEL_13:
  if ((v18 & 1) != 0)
  {
    a5.i64[0] = *v8;
    a5.i64[0] = vshlq_u64(a5, v6).u64[0];
    *(void *)(v5 - 8) = a5.i64[0];
  }

  return *(double *)a5.i64;
}

void *ccn_mulmod_p384(void *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  unint64_t v3 = a2 + 2;
  unint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  v3 += 2;
  unint64_t v8 = *v3;
  unint64_t v9 = v3[1];
  unint64_t v11 = *a3;
  unint64_t v12 = a3[1];
  BOOL v10 = a3 + 2;
  unint64_t v13 = *v10;
  unint64_t v14 = v10[1];
  v10 += 2;
  unint64_t v15 = *v10;
  unint64_t v16 = v10[1];
  unsigned __int128 v17 = v5 * (unsigned __int128)v11 + ((v4 * (unsigned __int128)v11) >> 64);
  unsigned __int128 v18 = v17 + v4 * (unsigned __int128)v12;
  uint64_t v19 = __CFADD__(__CFADD__((void)v17, v4 * v12), *((void *)&v17 + 1)) | __CFADD__( (v4 * (unsigned __int128)v12) >> 64,  *((void *)&v18 + 1));
  uint64_t v20 = (v6 * (unsigned __int128)v11) >> 64;
  uint64_t v21 = *((void *)&v18 + 1) + v6 * v11;
  _BOOL1 v22 = __CFADD__(__CFADD__(*((void *)&v18 + 1), v6 * v11), v19);
  uint64_t v23 = __CFADD__(*((void *)&v18 + 1), v6 * v11) + v19;
  v22 |= __CFADD__(v20, v23);
  v23 += v20;
  BOOL v24 = v22;
  uint64_t v25 = (v5 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v21, v5 * v12);
  unint64_t v26 = v21 + v5 * v12;
  BOOL v28 = v22;
  _BOOL1 v22 = __CFADD__(v22, v23);
  uint64_t v27 = v28 + v23;
  v22 |= __CFADD__(v25, v27);
  v27 += v25;
  BOOL v29 = v22 + v24;
  uint64_t v30 = (v4 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v26, v4 * v13);
  unint64_t v31 = v26 + v4 * v13;
  BOOL v33 = v22;
  _BOOL1 v22 = __CFADD__(v22, v27);
  uint64_t v32 = v33 + v27;
  v22 |= __CFADD__(v30, v32);
  v32 += v30;
  BOOL v34 = v22 + v29;
  uint64_t v35 = (v7 * (unsigned __int128)v11) >> 64;
  _BOOL1 v22 = __CFADD__(v32, v7 * v11);
  uint64_t v36 = v32 + v7 * v11;
  BOOL v38 = v22;
  _BOOL1 v22 = __CFADD__(v22, v34);
  uint64_t v37 = v38 + v34;
  v22 |= __CFADD__(v35, v37);
  v37 += v35;
  BOOL v39 = v22;
  uint64_t v40 = (v6 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v36, v6 * v12);
  uint64_t v41 = v36 + v6 * v12;
  BOOL v43 = v22;
  _BOOL1 v22 = __CFADD__(v22, v37);
  uint64_t v42 = v43 + v37;
  v22 |= __CFADD__(v40, v42);
  v42 += v40;
  BOOL v44 = v22 + v39;
  uint64_t v45 = (v5 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v41, v5 * v13);
  uint64_t v46 = v41 + v5 * v13;
  BOOL v48 = v22;
  _BOOL1 v22 = __CFADD__(v22, v42);
  uint64_t v47 = v48 + v42;
  v22 |= __CFADD__(v45, v47);
  v47 += v45;
  BOOL v49 = v22 + v44;
  uint64_t v50 = (v4 * (unsigned __int128)v14) >> 64;
  _BOOL1 v22 = __CFADD__(v46, v4 * v14);
  unint64_t v51 = v46 + v4 * v14;
  BOOL v53 = v22;
  _BOOL1 v22 = __CFADD__(v22, v47);
  uint64_t v52 = v53 + v47;
  v22 |= __CFADD__(v50, v52);
  v52 += v50;
  BOOL v54 = v22 + v49;
  uint64_t v55 = (*v3 * (unsigned __int128)v11) >> 64;
  _BOOL1 v22 = __CFADD__(v52, *v3 * v11);
  uint64_t v56 = v52 + *v3 * v11;
  BOOL v58 = v22;
  _BOOL1 v22 = __CFADD__(v22, v54);
  uint64_t v57 = v58 + v54;
  v22 |= __CFADD__(v55, v57);
  v57 += v55;
  BOOL v59 = v22;
  uint64_t v60 = (v7 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v56, v7 * v12);
  uint64_t v61 = v56 + v7 * v12;
  BOOL v63 = v22;
  _BOOL1 v22 = __CFADD__(v22, v57);
  uint64_t v62 = v63 + v57;
  v22 |= __CFADD__(v60, v62);
  v62 += v60;
  BOOL v64 = v22 + v59;
  uint64_t v65 = (v6 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v61, v6 * v13);
  uint64_t v66 = v61 + v6 * v13;
  BOOL v68 = v22;
  _BOOL1 v22 = __CFADD__(v22, v62);
  uint64_t v67 = v68 + v62;
  v22 |= __CFADD__(v65, v67);
  v67 += v65;
  BOOL v69 = v22 + v64;
  uint64_t v70 = (v5 * (unsigned __int128)v14) >> 64;
  _BOOL1 v22 = __CFADD__(v66, v5 * v14);
  uint64_t v71 = v66 + v5 * v14;
  BOOL v73 = v22;
  _BOOL1 v22 = __CFADD__(v22, v67);
  uint64_t v72 = v73 + v67;
  v22 |= __CFADD__(v70, v72);
  v72 += v70;
  BOOL v74 = v22 + v69;
  uint64_t v75 = (v4 * (unsigned __int128)v15) >> 64;
  _BOOL1 v22 = __CFADD__(v71, v4 * v15);
  unint64_t v76 = v71 + v4 * v15;
  BOOL v78 = v22;
  _BOOL1 v22 = __CFADD__(v22, v72);
  uint64_t v77 = v78 + v72;
  v22 |= __CFADD__(v75, v77);
  v77 += v75;
  BOOL v79 = v22 + v74;
  uint64_t v80 = (v9 * (unsigned __int128)v11) >> 64;
  _BOOL1 v22 = __CFADD__(v77, v9 * v11);
  uint64_t v81 = v77 + v9 * v11;
  BOOL v83 = v22;
  _BOOL1 v22 = __CFADD__(v22, v79);
  uint64_t v82 = v83 + v79;
  v22 |= __CFADD__(v80, v82);
  v82 += v80;
  BOOL v84 = v22;
  uint64_t v85 = (*v3 * (unsigned __int128)v12) >> 64;
  _BOOL1 v22 = __CFADD__(v81, *v3 * v12);
  uint64_t v86 = v81 + *v3 * v12;
  BOOL v88 = v22;
  _BOOL1 v22 = __CFADD__(v22, v82);
  uint64_t v87 = v88 + v82;
  v22 |= __CFADD__(v85, v87);
  v87 += v85;
  BOOL v89 = v22 + v84;
  uint64_t v90 = (v7 * (unsigned __int128)v13) >> 64;
  _BOOL1 v22 = __CFADD__(v86, v7 * v13);
  uint64_t v91 = v86 + v7 * v13;
  BOOL v93 = v22;
  _BOOL1 v22 = __CFADD__(v22, v87);
  uint64_t v92 = v93 + v87;
  v22 |= __CFADD__(v90, v92);
  v92 += v90;
  BOOL v94 = v22 + v89;
  uint64_t v95 = (v6 * (unsigned __int128)v14) >> 64;
  _BOOL1 v22 = __CFADD__(v91, v6 * v14);
  uint64_t v96 = v91 + v6 * v14;
  BOOL v98 = v22;
  _BOOL1 v22 = __CFADD__(v22, v92);
  uint64_t v97 = v98 + v92;
  v22 |= __CFADD__(v95, v97);
  v97 += v95;
  BOOL v99 = v22 + v94;
  uint64_t v100 = (v5 * (unsigned __int128)v15) >> 64;
  _BOOL1 v22 = __CFADD__(v96, v5 * v15);
  uint64_t v101 = v96 + v5 * v15;
  BOOL v103 = v22;
  _BOOL1 v22 = __CFADD__(v22, v97);
  uint64_t v102 = v103 + v97;
  v22 |= __CFADD__(v100, v102);
  v102 += v100;
  BOOL v104 = v22 + v99;
  uint64_t v105 = (v4 * (unsigned __int128)v16) >> 64;
  _BOOL1 v22 = __CFADD__(v101, v4 * v16);
  unint64_t v106 = v101 + v4 * v16;
  BOOL v108 = v22;
  _BOOL1 v22 = __CFADD__(v22, v102);
  uint64_t v107 = v108 + v102;
  v22 |= __CFADD__(v105, v107);
  v107 += v105;
  unint64_t v109 = 0x100000001LL * v4 * v11;
  unint64_t v110 = HIDWORD(v109);
  unint64_t v111 = HIDWORD(v109) + __CFADD__(v4 * v11, (v4 * v11) << 32) + (void)v18;
  unsigned __int128 v112 = __PAIR128__( v51,  __CFADD__(__CFADD__(v4 * v11, (v4 * v11) << 32), (void)v18) | __CFADD__( HIDWORD(v109),  __CFADD__( v4 * v11,  (v4 * v11) << 32)
                                                                                            + (void)v18))
       + v31;
  BOOL v113 = __CFADD__( __CFADD__( __CFADD__(__CFADD__(v4 * v11, (v4 * v11) << 32), (void)v18) | __CFADD__( HIDWORD(v109),  __CFADD__( v4 * v11,  (v4 * v11) << 32)
                                                                                              + (void)v18),
             v31),
           v51);
  unsigned __int128 v114 = __PAIR128__(v106, v113) + v76;
  BOOL v116 = __CFADD__(__CFADD__(v113, v76), v106);
  unint64_t v115 = v109 + v116 + v107;
  unint64_t v117 = (__CFADD__(v116, v107) | __CFADD__(v109, v116 + v107)) + v22 + v104;
  _BOOL1 v22 = v111 >= (v4 * v11) << 32;
  unsigned __int128 v120 = __PAIR128__(v112, v111) - __PAIR128__(v109, (v4 * v11) << 32);
  unint64_t v119 = v120 >> 64;
  uint64_t v118 = v120;
  BOOL v121 = !__CFSUB__((void)v112, v109, v22);
  _BOOL1 v22 = v119 >= v110;
  unsigned __int128 v124 = __PAIR128__(*((unint64_t *)&v112 + 1), v119) - __PAIR128__(v121, v110);
  uint64_t v123 = v124 >> 64;
  uint64_t v122 = v124;
  _BOOL1 v126 = __CFSUB__(*((void *)&v112 + 1), v121, v22);
  unint64_t v125 = v114 - !v126;
  BOOL v128 = (unint64_t)v114 >= !v126;
  unint64_t v127 = *((void *)&v114 + 1) - !v128;
  unsigned __int128 v129 = __PAIR128__(v117, v115) - (*((void *)&v114 + 1) < (unint64_t)!v128);
  unsigned __int128 v130 = v129 + v9 * (unsigned __int128)v12;
  unsigned __int128 v131 = v130 + v8 * (unsigned __int128)v13;
  unsigned __int128 v132 = v131 + v7 * (unsigned __int128)v14;
  unsigned __int128 v133 = v132 + v6 * (unsigned __int128)v15;
  unsigned __int128 v134 = v133 + v5 * (unsigned __int128)v16;
  uint64_t v135 = 0x100000001LL * v118;
  unint64_t v136 = (unint64_t)(0x100000001LL * v118) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v118, v118 << 32), v122);
  unint64_t v137 = __CFADD__(v118, v118 << 32) + v122;
  v22 |= __CFADD__(v136, v137);
  v137 += v136;
  uint64_t v138 = v22 + v123;
  BOOL v139 = __CFADD__(v22, v123);
  unsigned __int128 v140 = __PAIR128__(v127, v139) + v125;
  BOOL v142 = __CFADD__(__CFADD__(v139, v125), v127);
  unint64_t v141 = v142 + v134;
  uint64_t v143 = v135 + __CFADD__(v142, (void)v134) + *((void *)&v134 + 1);
  unint64_t v144 = (__CFADD__(__CFADD__(v142, (void)v134), *((void *)&v134 + 1)) | __CFADD__( v135,  __CFADD__( v142,  (void)v134)
                                                                                              + *((void *)&v134 + 1)))
       + (__CFADD__(__CFADD__((void)v133, v5 * v16), *((void *)&v133 + 1)) | __CFADD__( (v5 * (unsigned __int128)v16) >> 64,  *((void *)&v134 + 1)))
       + (__CFADD__(__CFADD__((void)v132, v6 * v15), *((void *)&v132 + 1)) | __CFADD__( (v6 * (unsigned __int128)v15) >> 64,  *((void *)&v133 + 1)))
       + (__CFADD__(__CFADD__((void)v131, v7 * v14), *((void *)&v131 + 1)) | __CFADD__( (v7 * (unsigned __int128)v14) >> 64,  *((void *)&v132 + 1)))
       + (__CFADD__(__CFADD__((void)v130, v8 * v13), *((void *)&v130 + 1)) | __CFADD__( (v8 * (unsigned __int128)v13) >> 64,  *((void *)&v131 + 1)))
       + (unint64_t)(__CFADD__(__CFADD__((void)v129, v9 * v12), *((void *)&v129 + 1)) | __CFADD__((v9 * (unsigned __int128)v12) >> 64, *((void *)&v130 + 1)));
  _BOOL1 v22 = v137 >= v135 << 32;
  unint64_t v145 = v137 - (v135 << 32);
  LOBYTE(v142) = v22;
  _BOOL1 v22 = __CFSUB__(v138, v135, v22);
  unint64_t v146 = v138 - (v135 + !v142);
  uint64_t v147 = !v22;
  _BOOL1 v22 = v146 >= v136;
  unsigned __int128 v150 = __PAIR128__(v140, v146) - __PAIR128__(v147, v136);
  uint64_t v149 = v150 >> 64;
  uint64_t v148 = v150;
  _BOOL1 v152 = __CFSUB__((void)v140, v147, v22);
  unint64_t v151 = *((void *)&v140 + 1) - !v152;
  BOOL v154 = *((void *)&v140 + 1) >= (unint64_t)!v152;
  _BOOL1 v22 = v141 >= !v154;
  unint64_t v153 = v141 - !v154;
  unsigned __int128 v155 = __PAIR128__(v144, v143) - !v22;
  unsigned __int128 v156 = v155 + v9 * (unsigned __int128)v13;
  unsigned __int128 v157 = v156 + v8 * (unsigned __int128)v14;
  unsigned __int128 v158 = v157 + v7 * (unsigned __int128)v15;
  unsigned __int128 v159 = v158 + v6 * (unsigned __int128)v16;
  uint64_t v160 = 0x100000001LL * v145;
  unint64_t v161 = (0x100000001LL * v145) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v145, v145 << 32), v148);
  unint64_t v162 = __CFADD__(v145, v145 << 32) + v148;
  v22 |= __CFADD__(v161, v162);
  v162 += v161;
  uint64_t v163 = v22 + v149;
  BOOL v164 = __CFADD__(v22, v149);
  unsigned __int128 v165 = __PAIR128__(v153, v164) + v151;
  BOOL v167 = __CFADD__(__CFADD__(v164, v151), v153);
  unint64_t v166 = v167 + v159;
  uint64_t v168 = v160 + __CFADD__(v167, (void)v159) + *((void *)&v159 + 1);
  unint64_t v169 = (__CFADD__(__CFADD__(v167, (void)v159), *((void *)&v159 + 1)) | __CFADD__( v160,  __CFADD__( v167,  (void)v159)
                                                                                              + *((void *)&v159 + 1)))
       + (__CFADD__(__CFADD__((void)v158, v6 * v16), *((void *)&v158 + 1)) | __CFADD__( (v6 * (unsigned __int128)v16) >> 64,  *((void *)&v159 + 1)))
       + (__CFADD__(__CFADD__((void)v157, v7 * v15), *((void *)&v157 + 1)) | __CFADD__( (v7 * (unsigned __int128)v15) >> 64,  *((void *)&v158 + 1)))
       + (__CFADD__(__CFADD__((void)v156, v8 * v14), *((void *)&v156 + 1)) | __CFADD__( (v8 * (unsigned __int128)v14) >> 64,  *((void *)&v157 + 1)))
       + (unint64_t)(__CFADD__(__CFADD__((void)v155, v9 * v13), *((void *)&v155 + 1)) | __CFADD__((v9 * (unsigned __int128)v13) >> 64, *((void *)&v156 + 1)));
  _BOOL1 v22 = v162 >= v160 << 32;
  unint64_t v170 = v162 - (v160 << 32);
  LOBYTE(v167) = v22;
  _BOOL1 v22 = __CFSUB__(v163, v160, v22);
  unint64_t v171 = v163 - (v160 + !v167);
  uint64_t v172 = !v22;
  _BOOL1 v22 = v171 >= v161;
  unsigned __int128 v175 = __PAIR128__(v165, v171) - __PAIR128__(v172, v161);
  uint64_t v174 = v175 >> 64;
  uint64_t v173 = v175;
  _BOOL1 v177 = __CFSUB__((void)v165, v172, v22);
  unint64_t v176 = *((void *)&v165 + 1) - !v177;
  BOOL v179 = *((void *)&v165 + 1) >= (unint64_t)!v177;
  _BOOL1 v22 = v166 >= !v179;
  unint64_t v178 = v166 - !v179;
  unsigned __int128 v180 = __PAIR128__(v169, v168) - !v22;
  unsigned __int128 v181 = v180 + v9 * (unsigned __int128)v14;
  unsigned __int128 v182 = v181 + v8 * (unsigned __int128)v15;
  unsigned __int128 v183 = v182 + v7 * (unsigned __int128)v16;
  uint64_t v184 = 0x100000001LL * v170;
  unint64_t v185 = (0x100000001LL * v170) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v170, v170 << 32), v173);
  unint64_t v186 = __CFADD__(v170, v170 << 32) + v173;
  v22 |= __CFADD__(v185, v186);
  v186 += v185;
  uint64_t v187 = v22 + v174;
  BOOL v188 = __CFADD__(v22, v174);
  unsigned __int128 v189 = __PAIR128__(v178, v188) + v176;
  BOOL v191 = __CFADD__(__CFADD__(v188, v176), v178);
  unint64_t v190 = v191 + v183;
  uint64_t v192 = v184 + __CFADD__(v191, (void)v183) + *((void *)&v183 + 1);
  unint64_t v193 = (__CFADD__(__CFADD__(v191, (void)v183), *((void *)&v183 + 1)) | __CFADD__( v184,  __CFADD__( v191,  (void)v183)
                                                                                              + *((void *)&v183 + 1)))
       + (__CFADD__(__CFADD__((void)v182, v7 * v16), *((void *)&v182 + 1)) | __CFADD__( (v7 * (unsigned __int128)v16) >> 64,  *((void *)&v183 + 1)))
       + (__CFADD__(__CFADD__((void)v181, v8 * v15), *((void *)&v181 + 1)) | __CFADD__( (v8 * (unsigned __int128)v15) >> 64,  *((void *)&v182 + 1)))
       + (unint64_t)(__CFADD__(__CFADD__((void)v180, v9 * v14), *((void *)&v180 + 1)) | __CFADD__((v9 * (unsigned __int128)v14) >> 64, *((void *)&v181 + 1)));
  _BOOL1 v22 = v186 >= v184 << 32;
  unint64_t v194 = v186 - (v184 << 32);
  LOBYTE(v191) = v22;
  _BOOL1 v22 = __CFSUB__(v187, v184, v22);
  unint64_t v195 = v187 - (v184 + !v191);
  uint64_t v196 = !v22;
  _BOOL1 v22 = v195 >= v185;
  unsigned __int128 v199 = __PAIR128__(v189, v195) - __PAIR128__(v196, v185);
  uint64_t v198 = v199 >> 64;
  uint64_t v197 = v199;
  _BOOL1 v201 = __CFSUB__((void)v189, v196, v22);
  unint64_t v200 = *((void *)&v189 + 1) - !v201;
  BOOL v203 = *((void *)&v189 + 1) >= (unint64_t)!v201;
  _BOOL1 v22 = v190 >= !v203;
  unint64_t v202 = v190 - !v203;
  unsigned __int128 v204 = __PAIR128__(v193, v192) - !v22;
  unsigned __int128 v205 = v204 + v9 * (unsigned __int128)v15;
  unsigned __int128 v206 = v205 + v8 * (unsigned __int128)v16;
  uint64_t v207 = 0x100000001LL * v194;
  unint64_t v208 = (0x100000001LL * v194) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v194, v194 << 32), v197);
  unint64_t v209 = __CFADD__(v194, v194 << 32) + v197;
  v22 |= __CFADD__(v208, v209);
  v209 += v208;
  uint64_t v210 = v22 + v198;
  BOOL v211 = __CFADD__(v22, v198);
  unsigned __int128 v212 = __PAIR128__(v202, v211) + v200;
  BOOL v214 = __CFADD__(__CFADD__(v211, v200), v202);
  unint64_t v213 = v214 + v206;
  uint64_t v215 = v207 + __CFADD__(v214, (void)v206) + *((void *)&v206 + 1);
  unint64_t v216 = (__CFADD__(__CFADD__(v214, (void)v206), *((void *)&v206 + 1)) | __CFADD__( v207,  __CFADD__( v214,  (void)v206)
                                                                                              + *((void *)&v206 + 1)))
       + (__CFADD__(__CFADD__((void)v205, v8 * v16), *((void *)&v205 + 1)) | __CFADD__( (v8 * (unsigned __int128)v16) >> 64,  *((void *)&v206 + 1)))
       + (unint64_t)(__CFADD__(__CFADD__((void)v204, v9 * v15), *((void *)&v204 + 1)) | __CFADD__((v9 * (unsigned __int128)v15) >> 64, *((void *)&v205 + 1)));
  _BOOL1 v22 = v209 >= v207 << 32;
  unint64_t v217 = v209 - (v207 << 32);
  LOBYTE(v214) = v22;
  _BOOL1 v22 = __CFSUB__(v210, v207, v22);
  unint64_t v218 = v210 - (v207 + !v214);
  uint64_t v219 = !v22;
  _BOOL1 v22 = v218 >= v208;
  unsigned __int128 v222 = __PAIR128__(v212, v218) - __PAIR128__(v219, v208);
  uint64_t v221 = v222 >> 64;
  uint64_t v220 = v222;
  _BOOL1 v224 = __CFSUB__((void)v212, v219, v22);
  unint64_t v223 = *((void *)&v212 + 1) - !v224;
  BOOL v226 = *((void *)&v212 + 1) >= (unint64_t)!v224;
  _BOOL1 v22 = v213 >= !v226;
  unint64_t v225 = v213 - !v226;
  unsigned __int128 v227 = __PAIR128__(v216, v215) - !v22;
  unsigned __int128 v228 = v227 + v9 * (unsigned __int128)v16;
  uint64_t v229 = 0x100000001LL * v217;
  unint64_t v230 = (0x100000001LL * v217) >> 32;
  _BOOL1 v22 = __CFADD__(__CFADD__(v217, v217 << 32), v220);
  unint64_t v231 = __CFADD__(v217, v217 << 32) + v220;
  v22 |= __CFADD__(v230, v231);
  v231 += v230;
  uint64_t v232 = v22 + v221;
  BOOL v233 = __CFADD__(v22, v221);
  unsigned __int128 v234 = __PAIR128__(v225, v233) + v223;
  BOOL v236 = __CFADD__(__CFADD__(v233, v223), v225);
  unint64_t v235 = v236 + v228;
  uint64_t v237 = v229 + __CFADD__(v236, (void)v228) + *((void *)&v228 + 1);
  unint64_t v238 = (__CFADD__(__CFADD__(v236, (void)v228), *((void *)&v228 + 1)) | __CFADD__( v229,  __CFADD__( v236,  (void)v228)
                                                                                              + *((void *)&v228 + 1)))
       + (unint64_t)(__CFADD__(__CFADD__((void)v227, v9 * v16), *((void *)&v227 + 1)) | __CFADD__((v9 * (unsigned __int128)v16) >> 64, *((void *)&v228 + 1)));
  _BOOL1 v22 = v231 >= v229 << 32;
  unint64_t v239 = v231 - (v229 << 32);
  LOBYTE(v236) = v22;
  _BOOL1 v22 = __CFSUB__(v232, v229, v22);
  unint64_t v240 = v232 - (v229 + !v236);
  uint64_t v241 = !v22;
  _BOOL1 v22 = v240 >= v230;
  unsigned __int128 v244 = __PAIR128__(v234, v240) - __PAIR128__(v241, v230);
  uint64_t v243 = v244 >> 64;
  uint64_t v242 = v244;
  _BOOL1 v246 = __CFSUB__((void)v234, v241, v22);
  uint64_t v245 = *((void *)&v234 + 1) - !v246;
  BOOL v248 = *((void *)&v234 + 1) >= (unint64_t)!v246;
  _BOOL1 v22 = v235 >= !v248;
  unint64_t v247 = v235 - !v248;
  unsigned __int128 v249 = __PAIR128__(v238, v237) - !v22;
  _BOOL1 v22 = v239 >= 0xFFFFFFFF;
  unint64_t v250 = v239 - 0xFFFFFFFF;
  _BOOL1 v252 = v22;
  _BOOL1 v22 = __CFSUB__(v242, 0xFFFFFFFF00000000LL, v22);
  uint64_t v251 = v242 - (!v252 - 0x100000000LL);
  _BOOL1 v254 = v22;
  _BOOL1 v22 = __CFSUB__(v243, -2LL, v22);
  uint64_t v253 = v243 - (!v254 - 2LL);
  _BOOL1 v256 = v22;
  _BOOL1 v22 = __CFSUB__(v245, -1LL, v22);
  uint64_t v255 = v245 - (!v256 - 1LL);
  _BOOL1 v258 = v22;
  _BOOL1 v22 = __CFSUB__(v247, -1LL, v22);
  unint64_t v257 = v247 - (!v258 - 1LL);
  uint64_t v259 = v249 - (!v22 - 1LL);
  uint64_t v260 = *((void *)&v249 + 1) - !__CFSUB__((void)v249, -1LL, v22);
  _BOOL1 v22 = __CFADD__(__CFADD__(v250, (v260 & 0xFFFFFFFF00000000LL) >> 32), v251);
  uint64_t v261 = __CFADD__(v250, (v260 & 0xFFFFFFFF00000000LL) >> 32) + v251;
  uint64_t v263 = v22 | __CFADD__(v260 & 0xFFFFFFFF00000000LL, v261);
  _BOOL1 v22 = __CFADD__(v263, v253);
  uint64_t v262 = v263 + v253;
  uint64_t v265 = v22 | __CFADD__(v260 & 0xFFFFFFFFFFFFFFFELL, v262);
  _BOOL1 v22 = __CFADD__(v265, v255);
  uint64_t v264 = v265 + v255;
  uint64_t v267 = v22 | __CFADD__(v260, v264);
  _BOOL1 v22 = __CFADD__(v267, v257);
  uint64_t v266 = v267 + v257;
  *a1 = v250 + ((v260 & 0xFFFFFFFF00000000LL) >> 32);
  a1[1] = (v260 & 0xFFFFFFFF00000000LL) + v261;
  v268 = a1 + 2;
  void *v268 = (v260 & 0xFFFFFFFFFFFFFFFELL) + v262;
  v268[1] = v260 + v264;
  uint64_t result = v268 + 2;
  *uint64_t result = v260 + v266;
  result[1] = v260 + (v22 | __CFADD__(v260, v266)) + v259;
  return result;
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t ccn_cond_add(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t mask = ccn_mux_next_mask();
  uint64_t v11 = __ROR8__(0x5555555555555555LL, a2 | (2 * mask));
  uint64_t v12 = 0LL;
  if (a1)
  {
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v15 = *a4++;
      uint64_t v14 = v15;
      uint64_t v17 = *a5++;
      uint64_t v16 = v17;
      BOOL v18 = __CFADD__(v12, v14);
      uint64_t v19 = v12 + v14;
      if (v18) {
        uint64_t v13 = 1LL;
      }
      BOOL v18 = __CFADD__(v19, v16);
      uint64_t v20 = v19 + v16;
      if (v18) {
        uint64_t v12 = v13 + 1;
      }
      else {
        uint64_t v12 = v13;
      }
      uint64_t v21 = v14 ^ v20;
      uint64_t v22 = v14 ^ mask;
      *a3 = v22;
      *a3++ = v21 & v11 ^ v21 & 0x5555555555555555LL ^ v22 ^ mask;
      uint64_t v13 = 0LL;
      --a1;
    }

    while (a1);
  }

  return v12 & a2;
}

uint64_t ccec_sign_composite_ws( uint64_t a1, unint64_t **a2, unint64_t a3, uint64_t a4, char *a5, char *a6, uint64_t (**a7)(void, unint64_t, void *))
{
  unint64_t v14 = **a2;
  uint64_t v15 = *(void *)(a1 + 16);
  uint64_t v16 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v14);
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v14);
  uint64_t v18 = ccec_sign_internal_ws(a1, (uint64_t **)a2, a3, a4, v16, v17, a7);
  if (!(_DWORD)v18)
  {
    unint64_t v19 = **a2;
    unint64_t v20 = ccec_signature_r_s_size((uint64_t *)a2);
    ccn_write_uint_padded_ct_internal(v19, v16, v20, a5);
    unint64_t v21 = **a2;
    unint64_t v22 = ccec_signature_r_s_size((uint64_t *)a2);
    ccn_write_uint_padded_ct_internal(v21, (unint64_t *)v17, v22, a6);
  }

  *(void *)(a1 + 16) = v15;
  return v18;
}

uint64_t ccec_sign_composite_msg_ws( uint64_t a1, unint64_t **a2, unint64_t *a3, size_t a4, char *a5, char *a6, char *a7, uint64_t (**a8)(void, unint64_t, void *))
{
  return ccec_sign_composite_ws(a1, a2, *a3, (uint64_t)v15, a6, a7, a8);
}

uint64_t cczp_is_quadratic_residue_ws(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = cczp_n(a2);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  unint64_t v9 = (void *)cczp_prime(a2);
  ccn_set(v6, v8, v9);
  v8->i64[0] &= ~1uLL;
  BOOL v10 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccn_shift_right(v6, v10, v8, 1LL);
  uint64_t v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  unsigned int v12 = cczp_power_fast_ws(a1, a2, v11, a3, (uint64_t)v10);
  cczp_from_ws(a1, a2);
  BOOL v13 = ccn_n(v6, v11) == 1 && *v11 == 1LL;
  uint64_t result = v13 & ~(((v12 | ((unint64_t)(int)v12 >> 32)) + 0xFFFFFFFF) >> 32);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t ccdrbg_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t ccdrbg_reseed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t ccdrbg_generate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v14 = timingsafe_enable_if_supported();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
  cc_disable_dit_with_sb((unsigned int *)&v14);
  return v12;
}

uint64_t ccccm_one_shot_internal( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  size_t v20 = (*(void *)a1 + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v21 = (char *)&v26 - v20;
  bzero((char *)&v26 - v20, v20);
  size_t v22 = (*(void *)(a1 + 8) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v23 = (char *)&v26 - v22;
  bzero((char *)&v26 - v22, v22);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a1 + 24))(a1, v21, a2, a3);
  if (!(_DWORD)v24)
  {
    uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))( v21,  v23,  a4,  a5,  a11,  a9,  a6);
    if (!(_DWORD)v24)
    {
      uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t))(a1 + 40))(v21, v23, a9, a10);
      if (!(_DWORD)v24)
      {
        uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 48))(v21, v23, a6, a7, a8);
        if (!(_DWORD)v24) {
          uint64_t v24 = (*(uint64_t (**)(char *, char *, uint64_t))(a1 + 56))(v21, v23, a12);
        }
      }
    }
  }

  cc_clear(*(void *)a1, v21);
  cc_clear(*(void *)(a1 + 8), v23);
  return v24;
}

uint64_t cczp_add_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  uint64_t v12 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v11);
  LOBYTE(a5) = ccn_add_ws(a1, v11, a3, a4, a5);
  BOOL v13 = (unint64_t *)cczp_prime(a2);
  BOOL v14 = ccn_sub_ws(a1, v11, v12, a3, v13);
  uint64_t result = ccn_mux(v11, !v14 | a5, a3, v12, a3);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_add_ws(uint64_t a1, uint64_t a2)
{
  return (**(uint64_t (***)(void))(a2 + 16))();
}

void *ccec_cp_384_asm()
{
  return &ccec_cp384_asm;
}

void *ccn_p384_mul_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p384(a3, a4, a5);
}

void *ccn_p384_sqr_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  return ccn_mulmod_p384(a3, a4, a4);
}

uint64_t ccn_p384_inv_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 6LL);
  unint64_t v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 6LL);
  uint64_t v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 6LL);
  ccn_mulmod_p384(v10, a4, a4);
  ccn_mulmod_p384(v9, v10, a4);
  ccn_mulmod_p384(v9, v9, v9);
  ccn_mulmod_p384(v9, v9, v9);
  ccn_mulmod_p384(v8, v9, a4);
  ccn_mulmod_p384(v9, v8, v10);
  int v11 = 4;
  do
  {
    ccn_mulmod_p384(v9, v9, v9);
    --v11;
  }

  while (v11);
  ccn_mulmod_p384(v8, v8, v9);
  ccn_mulmod_p384(v9, v8, v10);
  int v12 = 8;
  do
  {
    ccn_mulmod_p384(v9, v9, v9);
    --v12;
  }

  while (v12);
  ccn_mulmod_p384(v8, v8, v9);
  ccn_mulmod_p384(v9, v8, v10);
  int v13 = 16;
  do
  {
    ccn_mulmod_p384(v9, v9, v9);
    --v13;
  }

  while (v13);
  ccn_mulmod_p384(v8, v8, v9);
  ccn_mulmod_p384(v9, v8, a4);
  ccn_mulmod_p384(v10, v9, a4);
  int v14 = 32;
  do
  {
    ccn_mulmod_p384(v10, v10, v10);
    --v14;
  }

  while (v14);
  ccn_mulmod_p384(v9, v10, v9);
  int v15 = 64;
  do
  {
    ccn_mulmod_p384(v10, v10, v10);
    --v15;
  }

  while (v15);
  ccn_mulmod_p384(v10, v10, v8);
  ccn_mulmod_p384(v8, v9, a4);
  int v16 = 64;
  do
  {
    ccn_mulmod_p384(v8, v8, v8);
    --v16;
  }

  while (v16);
  ccn_mulmod_p384(v9, v8, v9);
  ccn_mulmod_p384(v8, v9, a4);
  int v17 = 128;
  do
  {
    ccn_mulmod_p384(v8, v8, v8);
    --v17;
  }

  while (v17);
  ccn_mulmod_p384(v8, v8, v9);
  int v18 = 128;
  do
  {
    ccn_mulmod_p384(v8, v8, v8);
    --v18;
  }

  while (v18);
  ccn_mulmod_p384(v9, v8, v10);
  ccn_mulmod_p384(v8, v9, a4);
  uint64_t v23 = 0LL;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  unint64_t v20 = 1LL;
  ccn_mulmod_p384(v8, v8, &v20);
  if (ccn_n(6LL, v8) == 1 && *v8 == 1)
  {
    ccn_set(6LL, a3, v9);
    uint64_t result = 0LL;
  }

  else
  {
    uint64_t result = 4294967254LL;
  }

  *(void *)(a1 + 16) = v7;
  return result;
}

void *ccn_p384_from_asm_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v8 = 0LL;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  unint64_t v5 = 1LL;
  return ccn_mulmod_p384(a3, a4, &v5);
}

uint64_t cczp_div2_ws(uint64_t a1, uint64_t a2, int8x16_t *a3, uint64_t *a4)
{
  uint64_t v7 = cczp_n(a2);
  uint64_t v8 = *a4 & 1;
  unint64_t v9 = (uint64_t *)cczp_prime(a2);
  uint64_t v10 = ccn_cond_add(v7, v8, a3->i64, a4, v9);
  uint64_t result = ccn_shift_right(v7, a3, a3, 1LL);
  a3->i64[v7 - 1] |= v10 << 63;
  return result;
}

uint64_t cczp_modn_ws(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, char *a5)
{
  unint64_t v10 = cczp_n((uint64_t)a2);
  uint64_t v11 = v10;
  if ((a4 - 1) / v10 <= 1) {
    unint64_t v12 = 1LL;
  }
  else {
    unint64_t v12 = (a4 - 1) / v10;
  }
  uint64_t v17 = a4;
  uint64_t v18 = *(void *)(a1 + 16);
  int v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v10);
  unint64_t v19 = a5;
  ccn_set(v11, v13, a5);
  unint64_t v14 = v12 - 1;
  if (v12 != 1)
  {
    int v15 = &v19[8 * v11];
    do
    {
      ccn_set(v11, &v13[8 * v11], v15);
      cczp_mm_redc_ws(a1, a2, (uint64_t *)v13, (uint64_t *)v13);
      v15 += 8 * v11;
      --v14;
    }

    while (v14);
  }

  if (v17 != v12 * v11) {
    ccn_set(v17 - v12 * v11, &v13[8 * v11], &v19[8 * v12 * v11]);
  }
  ccn_zero(v11 - (v17 - v12 * v11), &v13[8 * v11 + 8 * (v17 - v12 * v11)]);
  cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
  do
  {
    ccn_mul_ws(a1, v11, (uint64_t)v13, (uint64_t)a3, (uint64_t)&a2[*a2 + 4]);
    uint64_t result = cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
    --v12;
  }

  while (v12);
  *(void *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_mod_default_ws(uint64_t a1, void *a2, uint64_t *a3, char *a4)
{
  uint64_t v8 = 2 * cczp_n((uint64_t)a2);
  return cczp_modn_ws(a1, a2, a3, v8, a4);
}

uint64_t cczp_mod_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 32LL))();
}

uint64_t cczp_mul_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = cczp_n(a2);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v10);
  uint64_t v12 = cczp_n(a2);
  ccn_mul_ws(a1, v12, v11, a4, a5);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t cczp_mul_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 16LL))();
}

_OWORD *ccn_mulmod_p256(void *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  unint64_t v3 = a2 + 2;
  unint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  unint64_t v9 = *a3;
  unint64_t v10 = a3[1];
  uint64_t v8 = a3 + 2;
  unint64_t v11 = *v8;
  unint64_t v12 = v8[1];
  unint64_t v13 = v4 * v9;
  uint64_t v14 = (v5 * (unsigned __int128)v9) >> 64;
  uint64_t v15 = *v3 * v9;
  uint64_t v16 = (v6 * (unsigned __int128)v9) >> 64;
  unint64_t v18 = v9;
  uint64_t v17 = (__PAIR128__(v5, v4) * v9) >> 64;
  _BOOL1 v19 = __CFADD__(__CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9), v14);
  uint64_t v20 = __CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9) + v14;
  v19 |= __CFADD__(v15, v20);
  v20 += v15;
  uint64_t v21 = (v7 * (unsigned __int128)v9) >> 64;
  uint64_t v22 = (v7 * (unsigned __int128)v10) >> 64;
  BOOL v24 = v19;
  _BOOL1 v19 = __CFADD__(v19, v16);
  uint64_t v23 = v24 + v16;
  v19 |= __CFADD__(v7 * v9, v23);
  v23 += v7 * v9;
  BOOL v26 = v19;
  _BOOL1 v19 = __CFADD__(v19, v21);
  uint64_t v25 = v26 + v21;
  v19 |= __CFADD__(v7 * v10, v25);
  v25 += v7 * v10;
  uint64_t v27 = v7 * *v8;
  uint64_t v28 = (v7 * (unsigned __int128)v11) >> 64;
  BOOL v30 = v19;
  _BOOL1 v19 = __CFADD__(v19, v22);
  uint64_t v29 = v30 + v22;
  v19 |= __CFADD__(v27, v29);
  v29 += v27;
  BOOL v32 = v19;
  _BOOL1 v19 = __CFADD__(v19, v28);
  uint64_t v31 = v32 + v28;
  v19 |= __CFADD__(v7 * v12, v31);
  v31 += v7 * v12;
  uint64_t v33 = v19 + ((v7 * (unsigned __int128)v12) >> 64);
  uint64_t v34 = (v4 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v17, v4 * v10);
  uint64_t v35 = (__PAIR128__(v10, v18) * __PAIR128__(v5, v4)) >> 64;
  BOOL v37 = v19;
  _BOOL1 v19 = __CFADD__(v19, v20);
  uint64_t v36 = v37 + v20;
  v19 |= __CFADD__(v34, v36);
  v36 += v34;
  uint64_t v38 = (v6 * (unsigned __int128)v10) >> 64;
  BOOL v40 = v19;
  _BOOL1 v19 = __CFADD__(v19, v23);
  uint64_t v39 = v40 + v23;
  v19 |= __CFADD__(v6 * v10, v39);
  v39 += v6 * v10;
  BOOL v42 = v19;
  _BOOL1 v19 = __CFADD__(v19, v25);
  uint64_t v41 = v42 + v25;
  v19 |= __CFADD__(v38, v41);
  v41 += v38;
  uint64_t v43 = (v6 * (unsigned __int128)v12) >> 64;
  BOOL v45 = v19;
  _BOOL1 v19 = __CFADD__(v19, v29);
  uint64_t v44 = v45 + v29;
  v19 |= __CFADD__(v6 * v12, v44);
  v44 += v6 * v12;
  BOOL v47 = v19;
  _BOOL1 v19 = __CFADD__(v19, v31);
  uint64_t v46 = v47 + v31;
  v19 |= __CFADD__(v43, v46);
  v46 += v43;
  uint64_t v48 = v19 + v33;
  uint64_t v49 = (v5 * (unsigned __int128)v10) >> 64;
  _BOOL1 v19 = __CFADD__(v36, v5 * v10);
  uint64_t v50 = v36 + v5 * v10;
  BOOL v52 = v19;
  _BOOL1 v19 = __CFADD__(v19, v39);
  uint64_t v51 = v52 + v39;
  v19 |= __CFADD__(v49, v51);
  v51 += v49;
  uint64_t v53 = (v6 * (unsigned __int128)v11) >> 64;
  BOOL v55 = v19;
  _BOOL1 v19 = __CFADD__(v19, v41);
  uint64_t v54 = v55 + v41;
  v19 |= __CFADD__(v6 * v11, v54);
  v54 += v6 * v11;
  BOOL v57 = v19;
  _BOOL1 v19 = __CFADD__(v19, v44);
  uint64_t v56 = v57 + v44;
  v19 |= __CFADD__(v53, v56);
  v56 += v53;
  BOOL v58 = v19;
  uint64_t v59 = (v4 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v50, v4 * v11);
  uint64_t v60 = v50 + v4 * v11;
  BOOL v62 = v19;
  _BOOL1 v19 = __CFADD__(v19, v51);
  uint64_t v61 = v62 + v51;
  v19 |= __CFADD__(v59, v61);
  v61 += v59;
  uint64_t v63 = (v5 * (unsigned __int128)v12) >> 64;
  BOOL v65 = v19;
  _BOOL1 v19 = __CFADD__(v19, v54);
  uint64_t v64 = v65 + v54;
  v19 |= __CFADD__(v5 * v12, v64);
  v64 += v5 * v12;
  BOOL v67 = v19;
  _BOOL1 v19 = __CFADD__(v19, v56);
  uint64_t v66 = v67 + v56;
  v19 |= __CFADD__(v63, v66);
  v66 += v63;
  uint64_t v68 = v19 + v58;
  uint64_t v69 = (v5 * (unsigned __int128)v11) >> 64;
  _BOOL1 v19 = __CFADD__(v61, v5 * v11);
  uint64_t v70 = v61 + v5 * v11;
  BOOL v72 = v19;
  _BOOL1 v19 = __CFADD__(v19, v64);
  uint64_t v71 = v72 + v64;
  v19 |= __CFADD__(v69, v71);
  v71 += v69;
  uint64_t v73 = v19;
  uint64_t v74 = (v4 * (unsigned __int128)v12) >> 64;
  _BOOL1 v19 = __CFADD__(v70, v4 * v12);
  uint64_t v75 = v70 + v4 * v12;
  BOOL v77 = v19;
  _BOOL1 v19 = __CFADD__(v19, v71);
  uint64_t v76 = v77 + v71;
  v19 |= __CFADD__(v74, v76);
  v76 += v74;
  BOOL v79 = v19;
  _BOOL1 v19 = __CFADD__(v19, v66);
  uint64_t v78 = v79 + v66;
  v19 |= __CFADD__(v73, v78);
  v78 += v73;
  BOOL v81 = v19;
  _BOOL1 v19 = __CFADD__(v19, v46);
  uint64_t v80 = v81 + v46;
  v19 |= __CFADD__(v68, v80);
  v80 += v68;
  uint64_t v82 = v19 + v48;
  _BOOL1 v19 = __CFADD__(v35, v13 << 32);
  unint64_t v83 = v35 + (v13 << 32);
  BOOL v85 = v19;
  _BOOL1 v19 = __CFADD__(v19, v60);
  uint64_t v84 = v85 + v60;
  v19 |= __CFADD__(HIDWORD(v13), v84);
  v84 += HIDWORD(v13);
  BOOL v87 = v19;
  _BOOL1 v19 = __CFADD__(v19, v75);
  uint64_t v86 = v87 + v75;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v13, v86);
  v86 += 0xFFFFFFFF00000001LL * v13;
  uint64_t v88 = v19 + ((v13 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v84, v83 << 32);
  unint64_t v89 = v84 + (v83 << 32);
  BOOL v91 = v19;
  _BOOL1 v19 = __CFADD__(v19, v86);
  uint64_t v90 = v91 + v86;
  v19 |= __CFADD__(HIDWORD(v83), v90);
  v90 += HIDWORD(v83);
  BOOL v93 = v19;
  _BOOL1 v19 = __CFADD__(v19, v76);
  uint64_t v92 = v93 + v76;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v83, v92);
  v92 += 0xFFFFFFFF00000001LL * v83;
  uint64_t v94 = v19 + ((v83 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v90, v89 << 32);
  unint64_t v95 = v90 + (v89 << 32);
  BOOL v97 = v19;
  _BOOL1 v19 = __CFADD__(v19, v92);
  uint64_t v96 = v97 + v92;
  v19 |= __CFADD__(HIDWORD(v89), v96);
  v96 += HIDWORD(v89);
  BOOL v99 = v19;
  _BOOL1 v19 = __CFADD__(v19, v78);
  uint64_t v98 = v99 + v78;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v89, v98);
  v98 += 0xFFFFFFFF00000001LL * v89;
  uint64_t v100 = v19 + ((v89 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v96, v95 << 32);
  uint64_t v101 = v96 + (v95 << 32);
  BOOL v103 = v19;
  _BOOL1 v19 = __CFADD__(v19, v98);
  uint64_t v102 = v103 + v98;
  v19 |= __CFADD__(HIDWORD(v95), v102);
  v102 += HIDWORD(v95);
  BOOL v105 = v19;
  _BOOL1 v19 = __CFADD__(v19, v80);
  uint64_t v104 = v105 + v80;
  v19 |= __CFADD__(0xFFFFFFFF00000001LL * v95, v104);
  v104 += 0xFFFFFFFF00000001LL * v95;
  uint64_t v106 = v19 + ((v95 * (unsigned __int128)0xFFFFFFFF00000001LL) >> 64);
  _BOOL1 v19 = __CFADD__(v88, v101);
  uint64_t v107 = v88 + v101;
  BOOL v109 = v19;
  _BOOL1 v19 = __CFADD__(v19, v94);
  uint64_t v108 = v109 + v94;
  v19 |= __CFADD__(v102, v108);
  v108 += v102;
  BOOL v111 = v19;
  _BOOL1 v19 = __CFADD__(v19, v100);
  unint64_t v110 = v111 + v100;
  v19 |= __CFADD__(v104, v110);
  v110 += v104;
  BOOL v113 = v19;
  _BOOL1 v19 = __CFADD__(v19, v106);
  uint64_t v112 = v113 + v106;
  v19 |= __CFADD__(v82, v112);
  v112 += v82;
  BOOL v114 = v19;
  _BOOL1 v19 = __CFADD__(v107++, 1LL);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v108, 0xFFFFFFFFLL, v19);
  uint64_t v115 = v108 - (!v113 + 0xFFFFFFFFLL);
  LOBYTE(v113) = v19;
  _BOOL1 v19 = v110 >= !v19;
  unint64_t v116 = v110 - !v113;
  LOBYTE(v113) = v19;
  _BOOL1 v19 = __CFSUB__(v112, 0xFFFFFFFF00000001LL, v19);
  BOOL v117 = v114 - !v19;
  uint64_t v118 = v114 - !v19;
  _BOOL1 v19 = __CFADD__(__CFADD__(v107, v117), v115);
  uint64_t v119 = __CFADD__(v107, v117) + v115;
  *a1 = v107 + v117;
  a1[1] = v118 + v119;
  uint64_t result = a1 + 2;
  return result;
}

uint64_t cccmac_update_internal(void *a1, unint64_t a2, char *__src)
{
  uint64_t result = 0LL;
  if (a2)
  {
    unint64_t v5 = __src;
    if (__src)
    {
      unint64_t v6 = a2;
      unint64_t v7 = (void *)a1[8];
      memset(&v12[2], 0, 224);
      unint64_t v8 = a1[6];
      if (16 - v8 >= a2) {
        size_t v9 = a2;
      }
      else {
        size_t v9 = 16 - v8;
      }
      memset(v12, 0, 32);
      if (v8 > 0x10) {
        return 0xFFFFFFFFLL;
      }
      if (v8)
      {
        memcpy((char *)a1 + v8 + 32, __src, v9);
        a1[6] += v9;
        v6 -= v9;
        if (!v6) {
          return 0LL;
        }
        v5 += v9;
        cccbc_update_internal( (uint64_t)v7,  (uint64_t)(a1 + 9),  (uint64_t)a1 + *v7 + 72,  1LL,  (uint64_t)(a1 + 4),  (uint64_t)v12);
        a1[7] += 16LL;
      }

      if (v6 >= 0x11)
      {
        unint64_t v10 = (v6 - 1) >> 4;
        do
        {
          if (v10 >= 0x10) {
            uint64_t v11 = 16LL;
          }
          else {
            uint64_t v11 = v10;
          }
          cccbc_update_internal((uint64_t)v7, (uint64_t)(a1 + 9), (uint64_t)a1 + *v7 + 72, v11, (uint64_t)v5, (uint64_t)v12);
          v5 += 16 * v11;
          v10 -= v11;
        }

        while (v10);
      }

      __memcpy_chk(a1 + 4, v5, v6 - ((v6 - 1) & 0xFFFFFFFFFFFFFFF0LL), 16LL);
      uint64_t result = 0LL;
      a1[6] = v6 - ((v6 - 1) & 0xFFFFFFFFFFFFFFF0LL);
    }
  }

  return result;
}

uint64_t cczp_sqr_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = cczp_n(a2);
  size_t v9 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v8);
  ccn_sqr_ws(a1, v8, v9, a4);
  uint64_t result = cczp_mod_ws(a1, a2);
  *(void *)(a1 + 16) = v7;
  return result;
}

uint64_t cczp_sqr_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 24LL))();
}

uint64_t cczp_prime(uint64_t a1)
{
  return a1 + 24;
}

uint64_t cczp_sub_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = cczp_n(a2);
  BOOL v12 = ccn_sub_ws(a1, v11, a3, a4, a5);
  unint64_t v13 = (uint64_t *)cczp_prime(a2);
  uint64_t result = ccn_cond_add(v11, v12, a3, a3, v13);
  *(void *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sub_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a2 + 16) + 8LL))();
}

uint64_t cccmac_init_internal(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t result = 4294967289LL;
  if (a3 <= 0x20 && ((1LL << a3) & 0x101010000LL) != 0)
  {
    uint64_t v9 = a2 + 72;
    cccbc_init_internal((uint64_t)a1);
    __src[0] = 0LL;
    __src[1] = 0LL;
    cccbc_set_iv_internal((uint64_t)a1, (void *)(v9 + *a1), __src);
    *(void *)(a2 + 56) = 0LL;
    *(void *)(a2 + 64) = a1;
    *(void *)(a2 + 48) = 0LL;
    return cccmac_generate_subkeys((uint64_t)a1, a3, a4, (char *)a2, a2 + 16);
  }

  return result;
}

uint64_t ccrng_getentropy_generate(int a1, unint64_t a2, char *buffer)
{
  if (a2)
  {
    unint64_t v4 = a2;
    do
    {
      if (v4 >= 0x100) {
        size_t v5 = 256LL;
      }
      else {
        size_t v5 = v4;
      }
      if (getentropy(buffer, v5) == -1) {
        cc_abort();
      }
      buffer += v5;
      v4 -= v5;
    }

    while (v4);
  }

  return 0LL;
}

void *ccsha256_di()
{
  return &ccsha256_vng_arm_di;
}

uint64_t ccdrbg_df_derive_keys(uint64_t (**a1)(void), uint64_t a2, uint64_t a3, rsize_t a4, void *a5)
{
  uint64_t v7 = (*a1)();
  if ((_DWORD)v7) {
    cc_clear(a4, a5);
  }
  return v7;
}

uint64_t ccdrbg_df_bc_derive_keys(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, void *a5)
{
  BOOL v32 = a5;
  uint64_t v9 = *(void **)(a1 + 8);
  size_t v10 = (*v9 + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v33 = (char *)&v31 - v10;
  bzero((char *)&v31 - v10, v10);
  size_t v11 = (v9[1] + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  BOOL v12 = (char *)&v31 - v11;
  unsigned int v13 = 0;
  if (a2)
  {
    uint64_t v14 = (uint64_t *)(a3 + 8);
    uint64_t v15 = a2;
    do
    {
      uint64_t v16 = *v14;
      v14 += 2;
      v13 += v16;
      --v15;
    }

    while (v15);
  }

  bzero(v12, v11);
  __src[0] = 0LL;
  __src[1] = 0LL;
  unsigned int v43 = bswap32(v13);
  unsigned int v44 = bswap32(a4);
  __int128 v41 = xmmword_10019FED0;
  memset(v40, 0, sizeof(v40));
  uint64_t v17 = *(void *)(a1 + 16);
  v39[0] = 0LL;
  v39[1] = 0LL;
  unint64_t v37 = v17 + 16;
  if (v17 == -16)
  {
LABEL_13:
    uint64_t v23 = v33;
    uint64_t inited = cccbc_init_internal((uint64_t)v9);
    uint64_t v25 = v32;
    if (!(_DWORD)inited)
    {
      if (!a4)
      {
LABEL_26:
        uint64_t v29 = 0LL;
        goto LABEL_27;
      }

      BOOL v26 = (void *)((char *)v40 + *(void *)(a1 + 16));
      while (1)
      {
        uint64_t v27 = (uint64_t)v26;
        cc_clear(*(void *)(*(void *)(a1 + 8) + 8LL), v12);
        BOOL v26 = a4 <= 0xF ? v39 : v25;
        uint64_t inited = cccbc_update_internal(*(void *)(a1 + 8), (uint64_t)v23, (uint64_t)v12, 1LL, v27, (uint64_t)v26);
        if ((_DWORD)inited) {
          break;
        }
        if (a4 <= 0xF) {
          memcpy(v25, v26, a4);
        }
        if (a4 >= 0x10) {
          uint64_t v28 = 16LL;
        }
        else {
          uint64_t v28 = a4;
        }
        uint64_t v25 = (void *)((char *)v25 + v28);
        a4 -= v28;
        if (!a4) {
          goto LABEL_26;
        }
      }
    }

    uint64_t v29 = inited;
    goto LABEL_27;
  }

  uint64_t v36 = a2;
  unsigned int v18 = 0;
  unint64_t v19 = 0LL;
  size_t v34 = 16LL - (((_BYTE)v13 + 8) & 0xF);
  uint64_t v35 = (size_t *)(a3 + 8);
  while (1)
  {
    cc_clear(*(void *)(*(void *)(a1 + 8) + 8LL), v12);
    LODWORD(__src[0]) = bswap32(v18);
    uint64_t v38 = 0LL;
    uint64_t updated = update_0( *(void *)(a1 + 8),  a1 + 32,  (uint64_t)v12,  (uint64_t)&v40[v19 / 0x10],  &v38,  0x18uLL,  (char *)__src);
    if ((_DWORD)updated) {
      break;
    }
    uint64_t v21 = v35;
    uint64_t v22 = v36;
    if (v36)
    {
      do
      {
        uint64_t updated = update_0( *(void *)(a1 + 8),  a1 + 32,  (uint64_t)v12,  (uint64_t)&v40[v19 / 0x10],  &v38,  *v21,  (char *)*(v21 - 1));
        if ((_DWORD)updated) {
          goto LABEL_28;
        }
        v21 += 2;
      }

      while (--v22);
    }

    uint64_t updated = update_0(*(void *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, v34, (char *)&v41);
    if ((_DWORD)updated) {
      break;
    }
    ++v18;
    v19 += 16LL;
    if (v19 >= v37)
    {
      uint64_t v9 = *(void **)(a1 + 8);
      goto LABEL_13;
    }
  }

uint64_t update_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, size_t __n, char *__src)
{
  uint64_t v7 = __src;
  size_t v8 = __n;
  unint64_t v14 = 16LL - *a5;
  if (*a5) {
    BOOL v15 = __n >= v14;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    memcpy((void *)(a4 + *a5), __src, 16LL - *a5);
    uint64_t result = cccbc_update_internal(a1, a2, a3, 1LL, a4, a4);
    if ((_DWORD)result) {
      return result;
    }
    v8 -= v14;
    v7 += v14;
    *a5 = 0LL;
  }

  if (v8 < 0x10)
  {
LABEL_11:
    if (v8)
    {
      memcpy((void *)(a4 + *a5), v7, v8);
      uint64_t result = 0LL;
      *a5 += v8;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    while (1)
    {
      uint64_t result = cccbc_update_internal(a1, a2, a3, 1LL, (uint64_t)v7, a4);
      if ((_DWORD)result) {
        break;
      }
      v8 -= 16LL;
      v7 += 16;
      if (v8 <= 0xF) {
        goto LABEL_11;
      }
    }
  }

  return result;
}

uint64_t ccdrbg_df_bc_init_internal(void *a1, void *a2, unint64_t a3)
{
  uint64_t result = 4294967291LL;
  if (a3 <= 0x20 && *a2 <= 0x200uLL && a2[1] == 16LL)
  {
    *a1 = ccdrbg_df_bc_derive_keys;
    a1[1] = a2;
    a1[2] = a3;
    return cccbc_init_internal((uint64_t)a2);
  }

  return result;
}

void *cc_malloc_clear(size_t a1)
{
  unint64_t v2 = malloc(a1);
  unint64_t v3 = v2;
  if (v2) {
    bzero(v2, a1);
  }
  return v3;
}

uint64_t cc_ws_alloc(void *a1, uint64_t a2)
{
  unint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1 + 8 * v2;
  unint64_t v5 = v2 + a2;
  a1[2] = v5;
  cc_try_abort_if (v5 > v3);
  return v4;
}

void cc_ws_free(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
}

uint64_t ccmode_ccm_init(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 72);
  *a2 = v2;
  (*(void (**)(void))(v2 + 16))();
  return 0LL;
}

uint64_t ccctr_context_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccctr_init_internal(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t ccctr_update_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
}

uint64_t ccmode_ccm_set_iv( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  *(_DWORD *)(a2 + 64) = 1;
  cc_clear(0x10uLL, (void *)(a2 + 48));
  *(_DWORD *)(a2 + 68) = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if ((a5 & 1) == 0)
  {
    unint64_t v15 = 15 - a3;
    if (6 - a3 >= 0xFFFFFFFFFFFFFFF9LL && a3 >= 7 && a3 <= 0xD)
    {
      BOOL v16 = v15 >= 8 || a7 >> (8 * v15) == 0;
      BOOL v17 = !v16;
      if (!HIDWORD(a6) && !v17)
      {
        *(_BYTE *)(a2 + 16) = (((4 * a5) & 0xF8) - 8) | ((a6 != 0) << 6) | (14 - a3);
        *(void *)(a2 + 80) = a3;
        *(void *)(a2 + 88) = a5;
        unsigned int v18 = (_BYTE *)(a2 + 17);
        __memcpy_chk(a2 + 17, a4, a3, 15LL);
        unint64_t v19 = (_BYTE *)(a2 + 31);
        unint64_t v20 = 15 - a3;
        do
        {
          *v19-- = a7;
          a7 >>= 8;
          --v20;
        }

        while (v20);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24LL))( a1 + 8,  1LL,  a2 + 16,  a2 + 16);
        *(_BYTE *)a2 = 14 - a3;
        __memcpy_chk(a2 + 1, a4, a3, 15LL);
        cc_clear(15 - a3, (void *)(a2 + 1 + a3));
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1 + 8, 1LL, a2, a2 + 32);
        if (a6)
        {
          if (a6 >> 8 > 0xFE)
          {
            v23.i32[1] = -1;
            int16x8_t v24 = (int16x8_t)vshlq_u64((uint64x2_t)vdupq_n_s64(a6), (uint64x2_t)xmmword_10019FF00);
            *(int32x2_t *)v24.i8 = vmovn_s64((int64x2_t)v24);
            v23.i32[0] = *(_DWORD *)(a2 + 16);
            v25.i32[0] = 16646399;
            v25.i16[2] = v24.i16[0];
            v25.i16[3] = v24.i16[2];
            *(int8x8_t *)v24.i8 = veor_s8((int8x8_t)*(_OWORD *)&vmovl_u8(v23), v25);
            *(_DWORD *)(a2 + 16) = vmovn_s16(v24).u32[0];
            *(_BYTE *)(a2 + 20) ^= BYTE1(a6);
            unsigned int v18 = (_BYTE *)(a2 + 21);
            int v21 = 6;
          }

          else
          {
            *(_BYTE *)(a2 + 16) ^= BYTE1(a6);
            int v21 = 2;
          }

          *v18 ^= a6;
          int v22 = 4;
        }

        else
        {
          int v21 = 0;
          int v22 = 5;
        }

        uint64_t result = 0LL;
        *(_DWORD *)(a2 + 72) = v21;
        *(_DWORD *)(a2 + 64) = v22;
      }
    }
  }

  return result;
}

uint64_t ccmode_ccm_macdata(uint64_t result, uint64_t a2, int a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8 = result;
  unsigned int v9 = *(_DWORD *)(*(void *)result + 8LL);
  if (a3)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)result + 24LL))( result + 8,  1LL,  a2 + 16,  a2 + 16);
    unsigned int v10 = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }

  else
  {
    unsigned int v10 = *(_DWORD *)(a2 + 72);
  }

  uint64_t v17 = a2;
  if (a4)
  {
    unint64_t v11 = 0LL;
    uint64_t v12 = a2 + 16;
    uint64_t v13 = a5 - 1;
    uint64_t v14 = a2 + 15;
    do
    {
      if (a4 - v11 >= v9 - v10) {
        unint64_t v15 = v9 - v10;
      }
      else {
        unint64_t v15 = a4 - v11;
      }
      if (v15)
      {
        unint64_t v16 = v15;
        do
        {
          *(_BYTE *)(v14 + v10 + v16) ^= *(_BYTE *)(v13 + v11 + v16);
          --v16;
        }

        while (v16);
      }

      unsigned int v10 = (v10 + v15) % v9;
      if (!v10) {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v8 + 24LL))( v8 + 8,  1LL,  v12,  v12);
      }
      v11 += v15;
    }

    while (v11 < a4);
  }

  *(_DWORD *)(v17 + 72) = v10;
  return result;
}

uint64_t ccmode_ccm_cbcmac(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a3 && *(_DWORD *)(a2 + 64) != 4) {
    return 4294967228LL;
  }
  ccmode_ccm_macdata(a1, a2, 0, a3, a4);
  return 0LL;
}

uint64_t ccmode_ccm_crypt(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v9 = result;
    uint64_t v10 = 0LL;
    unint64_t v11 = *(void *)(*(void *)result + 8LL);
    uint64_t v12 = *(void *)(a2 + 80);
    uint64_t v19 = (v11 + ~(_DWORD)v12);
    uint64_t v13 = result + 8;
    uint64_t v14 = a2 + 48;
    unint64_t v15 = *(unsigned int *)(a2 + 68);
    uint64_t v16 = a2 + v12;
    do
    {
      if (!v15)
      {
        uint64_t v17 = v19;
        do
        {
          __int16 v18 = (*(_BYTE *)(v16 + v17--))++ + 1;
        }

        while ((v18 & 0x100) != 0);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v9 + 24LL))( v13,  1LL,  a2,  v14);
        unint64_t v15 = *(unsigned int *)(a2 + 68);
      }

      *(_BYTE *)(a5 + v10) = *(_BYTE *)(a2 + v15 + 48) ^ *(_BYTE *)(a4 + v10);
      unint64_t v15 = (*(_DWORD *)(a2 + 68) + 1) % v11;
      *(_DWORD *)(a2 + 68) = v15;
      ++v10;
    }

    while (v10 != a3);
  }

  return result;
}

uint64_t ccmode_ccm_finalize(uint64_t a1, uint64_t a2, void *__dst)
{
  if (*(_DWORD *)(a2 + 64) == 1) {
    return 4294967228LL;
  }
  if (*(_DWORD *)(a2 + 72)) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1 + 8, 1LL, a2 + 16, a2 + 16);
  }
  for (uint64_t i = *(void *)(*(void *)a1 + 8LL); i; --i)
    *(_BYTE *)(a2 + i + 31) ^= *(_BYTE *)(a2 + i + 15);
  memcpy(__dst, (const void *)(a2 + 32), *(void *)(a2 + 88));
  return 0LL;
}

uint64_t ccmode_ccm_reset(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 72) = 0;
  *(void *)(a2 + 80) = 0LL;
  *(void *)(a2 + 88) = 0LL;
  *(void *)(a2 + 64) = 1LL;
  return 0LL;
}

uint64_t ccec_generate_key_internal_fips_ws( uint64_t a1, uint64_t *a2, uint64_t (**a3)(void, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v8 = *a2;
  *a4 = a2;
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  uint64_t v11 = cczp_bitlen((uint64_t)a2);
  uint64_t result = (*a3)(a3, ((unint64_t)(v11 + 62) >> 3) & 0x1FFFFFFFFFFFFFF8LL, (uint64_t *)v10);
  if (!(_DWORD)result)
  {
    uint64_t result = ccec_generate_scalar_fips_retry_ws( a1,  a2,  (uint64_t (**)(void, unint64_t, void *))a3,  &a4[3 * **a4 + 2]);
    if (!(_DWORD)result) {
      uint64_t result = ccec_make_pub_from_priv_ws(a1, a2, a3, (uint64_t)&a4[3 * **a4 + 2], 0LL, a4);
    }
  }

  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t ccec_validate_point_and_projectify_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *a2;
  uint64_t v9 = cczp_prime((uint64_t)a2);
  uint64_t v10 = *a2;
  uint64_t v11 = a4 + 8 * *a2;
  uint64_t v12 = cczp_prime((uint64_t)a2);
  uint64_t result = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    else {
      return 4294967289LL;
    }
  }

  return result;
}

uint64_t ccn_cmp_asm(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  if (result)
  {
    unint64_t v3 = result;
    uint64_t result = 0LL;
    do
    {
      unint64_t v5 = *a2++;
      unint64_t v4 = v5;
      unint64_t v6 = *a3++;
      BOOL v7 = v4 >= v6;
      if (v4 > v6) {
        uint64_t result = 1LL;
      }
      if (!v7) {
        uint64_t result = -1LL;
      }
    }

    while (v3-- > 1);
  }

  return result;
}

uint64_t cc_disable_dit_with_sb(unsigned int *a1)
{
  return timingsafe_restore_if_supported(*a1);
}

void platform_connectionInfo_configStreamCategoryListReady_cold_1()
{
}

void logObjectForModule_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getSleepAssertionPluginInstance_cold_1()
{
  uint64_t v0 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformSleepAssertionPluginProtocol);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v2,  v3,  "[#SleepAssertions] Could not find plugin conforming to %@!",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_4();
}

void _getACPowerPluginInstance_cold_1()
{
  uint64_t v0 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformIOKitPowerPluginProtocol);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v2,  v3,  "[#SleepAssertions] Could not find plugin conforming to %@!",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_4();
}

void acc_nvmInfo_getPairingStatus_cold_1(uint64_t a1, int a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  (uint8_t *)&v2,  0x12u);
}

void _parseIdentificationParams_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pEndpoint == NULL", v1, 2u);
}

void _parseIdentificationParams_cold_2()
{
}

void iap2_accAuthentication_certificate_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_accAuthentication_certificate_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __iap2_accAuthentication_certificate_block_invoke_2_cold_1( unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  uint64_t v4 = *(unsigned __int16 *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  v6[0] = 67109632;
  v6[1] = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "iAP2 auth failed bCertValid:%d, pkNonceBytes:%04lX, nonceLen:%02lX\n",  (uint8_t *)v6,  0x1Cu);
}

void iap2_accAuthentication_certSerial_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_accAuthentication_certSerial_cold_3(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "iap2_accAuthentication_certSerial";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s Ignoring serial number data with invalid length:0x%02lX",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_2();
}

void iap2_destinationSharing_StartDestinationInformation_cold_3(uint64_t a1)
{
}

void iap2_destinationSharing_StartDestinationInformation_cold_4(uint64_t a1)
{
}

void iap2_destinationSharing_DestinationInformationStatus_cold_1( unsigned __int16 a1, uint64_t a2, os_log_s *a3)
{
  v4[0] = 67109632;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = 2;
  __int16 v7 = 1024;
  int MsgID = iAP2MsgGetMsgID(a2);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message",  (uint8_t *)v4,  0x14u);
  OUTLINED_FUNCTION_4();
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_4()
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v0, v1, "locale = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_6()
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v0, v1, "entryPointsunsigned int Count = %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_9( void *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 134218240;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_5_0( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "dLatitude = %f, dLongitude = %f",  *(double *)v3,  *(double *)&v3[8]);
  OUTLINED_FUNCTION_2();
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_17()
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v0, v1, "addressParamStr = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void iap2_destinationSharing_DestinationInformationUpdateHandler_cold_19()
{
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v0, v1, "addressStrings = %@, addressStringsunsigned int Count = %ld");
  OUTLINED_FUNCTION_2();
}

void _checkIdentificationInfo_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Identified for Destination Sharing", v1, 2u);
}

void oobPairing_endpoint_create_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pProtocolEndpoint = NULL", v1, 2u);
  OUTLINED_FUNCTION_5_1();
}

void oobPairing_endpoint_processIncomingData_cold_1(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown messageID %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_5_1();
}

void oobPairing_endpoint_processIncomingData_cold_4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "oobPairing_endpoint_processIncomingData: call acc_manager_checkForWirelessCTA",  v1,  2u);
  OUTLINED_FUNCTION_5_1();
}

void _invokeFeatureHandlerIterator_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 8);
  int v4 = *(_DWORD *)(a2 + 28);
  uint64_t v5 = *(void *)(a2 + 16);
  v6[0] = 67109634;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Skipping invokeHandler (handlerType: %d) for %{coreacc:ACCEndpoint_Protocol_t}d endpoint %@!",  (uint8_t *)v6,  0x18u);
  OUTLINED_FUNCTION_2();
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_9()
{
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_11( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_13()
{
}

void mfi4Auth_protocol_messageHandler_receiveIncomingData_cold_17( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_setEndpointSecureTunnelDataReceiveTypeHandler_cold_1()
{
}

void mfi4Auth_protocol_messageHandler_setEndpointSecureTunnelDataReceiveTypeHandler_cold_3()
{
}

void mfi4Auth_protocol_messageHandler_setEndpointSecureTunnelDataReceiveTypeHandler_cold_5( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_handleOutgoingSecureTunnelDataForClient_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_handleOutgoingSecureTunnelDataForClient_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_messageHandler_handleOutgoingSecureTunnelDataForClient_cold_9( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __mfi4Auth_endpoint_setAccessoryUserName_block_invoke_cold_1()
{
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_1()
{
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_2()
{
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_3()
{
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_4()
{
  OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "waitSessionClosed: RequestSessionOpen != false",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void _mfi4Auth_endpoint_waitSessionClosed_cold_5()
{
}

void __mfi4Auth_endpoint_getAccessoryUserName_block_invoke_cold_1()
{
}

void __mfi4Auth_endpoint_provisionPairing_block_invoke_cold_1()
{
}

void __mfi4Auth_endpoint_erasePairing_block_invoke_cold_1()
{
}

void _mfi4Auth_endpoint_setNvmKeyValues_cold_4()
{
}

void __mfi4Auth_endpoint_getPublicNvmKeyValues_block_invoke_cold_1()
{
}

void __mfi4Auth_endpoint_getPrivateNvmKeyValues_block_invoke_cold_1()
{
}

void __mfi4Auth_endpoint_beginVendorKeyErase_block_invoke_cold_1()
{
}

void _mfi4Auth_endpoint_requestNvmErasePublicKey_cold_1()
{
}

void _mfi4Auth_endpoint_requestNvmErasePublicKey_cold_2()
{
}

void _mfi4Auth_endpoint_requestNvmErasePublicKey_cold_3()
{
}

void __mfi4Auth_endpoint_beginUserKeyErase_block_invoke_cold_1()
{
}

void iAP2PacketRelease_cold_1()
{
}

void iAP2PacketGenerateBuffer_cold_2()
{
  __assert_rtn("iAP2PacketGenerateBuffer", "iAP2Packet.c", 1644, "packet->bufferLen == packet->packetLen");
}

void acc_endpoint_create_cold_5()
{
}

void acc_endpoint_processIncomingData_cold_2(const __CFData *a1, uint64_t a2, os_log_s *a3)
{
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v6 = *(void *)(a2 + 16);
  int v8 = 134218242;
  CFIndex v9 = Length;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  OUTLINED_FUNCTION_5_2( (void *)&_mh_execute_header,  a3,  v7,  "No Passthrough pair, ignore %ld bytes of data for endpoint %@",  (uint8_t *)&v8);
}

void acc_endpoint_processIncomingData_cold_7()
{
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "Endpoint %@ isPassThrough(passthroughMode=%d)",  v1,  0x12u);
  OUTLINED_FUNCTION_2();
}

void __acc_endpoint_setupPassthroughPair_cold_1()
{
  OUTLINED_FUNCTION_5_2( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "setupPassthroughPair (Device) for endpoint %@, endpointCount=%ld",  v1);
  OUTLINED_FUNCTION_2();
}

void __acc_endpoint_setupPassthroughPair_cold_3()
{
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "endpoint %@ is not a passthrough endpoint",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void __acc_endpoint_setupPassthroughPair_cold_5()
{
  OUTLINED_FUNCTION_5_2( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "setupPassthroughPair (Accessory) for endpoint %@, endpointCount=%ld",  v1);
  OUTLINED_FUNCTION_2();
}

void __acc_endpoint_setupPassthroughPair_cold_7()
{
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "setupPassthroughPair for endpoint %@, validPassthroughPair=%d passthroughMode=%d",  v3,  0x18u);
  OUTLINED_FUNCTION_2();
}

void acc_endpoint_sendOutgoingData_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pEndpoint = NULL", a5, a6, a7, a8, 0);
}

void acc_endpoint_sendOutgoingData_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pEndpoint->pConnection = NULL", a5, a6, a7, a8, 0);
}

void _setupComponentList_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "_setupComponentList: transportComponent is NULL",  buf,  2u);
}

void _setupComponentList_cold_2(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "_setupComponentList: transportComponents contains %ld entries",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void acc_authInfo_setCertData_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_authInfo_setStatus_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_AvailableDigitalCarKeys_cold_2(uint64_t a1, os_log_s *a2)
{
  v3[0] = 67109376;
  v3[1] = 0;
  __int16 v4 = 1024;
  int MsgID = iAP2MsgGetMsgID(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message",  (uint8_t *)v3,  0xEu);
}

void _checkIdentificationInfo_cold_1_0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Identified for Digital Car Key Matching",  v1,  2u);
}

void _checkIdentificationInfo_cold_3(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "digital car key matching is only available on the AirPlay transport",  v1,  2u);
}

#error "100174254: call analysis failed (funcsize=50)"
#error "100174324: call analysis failed (funcsize=50)"
#error "1001743C8: call analysis failed (funcsize=37)"
#error "100174464: call analysis failed (funcsize=37)"
#error "10017452C: call analysis failed (funcsize=50)"
#error "1001745D0: call analysis failed (funcsize=37)"
#error "10017466C: call analysis failed (funcsize=37)"
#error "100174708: call analysis failed (funcsize=37)"
void acc_manager_getConnectionWithUUID_cold_1()
{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11_0( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d connectionUUID %@, deprecated, should use acc_manager_callbackForConnection",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_6_2();
}

void acc_manager_iterateAllConnections_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_manager_iterateAllEndpoints_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_manager_callbackForConnection_cold_1()
{
}

void acc_manager_callbackForConnection_cold_3()
{
  LODWORD(v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "acc_manager_callbackForConnection";
  WORD6(v2) = 1024;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d call iteratorCB, connection %@, context %d ", v2);
  OUTLINED_FUNCTION_6_2();
}

void acc_manager_callbackForEndpoint_cold_1()
{
}

void acc_manager_callbackForEndpoint_cold_3()
{
  LODWORD(v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "acc_manager_callbackForEndpoint";
  WORD6(v2) = 1024;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_5((void *)&_mh_execute_header, v0, v1, "%s:%d call iteratorCB, endpoint %@, context %d ", v2);
  OUTLINED_FUNCTION_6_2();
}

void acc_manager_copyEndpointUUIDsForConnection_cold_1()
{
  v3[0] = 136315906;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s:%d connectionUUID %@, endpointUUIDs %@ ",  (uint8_t *)v3,  0x26u);
  OUTLINED_FUNCTION_6_2();
}

void acc_manager_copyEndpointUUIDsForConnection_cold_3()
{
}

void acc_manager_getEndpointWithUUID_cold_1()
{
}

void acc_manager_enableLockoutForTransportType_cold_3(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid transport type: %{coreacc:ACCEndpoint_TransportType_t}d or timeout value: %u!",  (uint8_t *)v3,  0xEu);
  OUTLINED_FUNCTION_2();
}

void acc_manager_isLockoutActiveForTransportType_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CFDictionaryApplierFunction_findWirelessCTADonorCapableConnection_cold_1(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "findWirelessCTADonorCapableConnection: donorConnectionsFound %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void _CFDictionaryApplierFunction_findWirelessCTADonorCapableConnection_cold_4()
{
}

void _CFDictionaryApplierFunction_findWirelessCTADonorCapableConnection_cold_6( uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void _CFDictionaryApplierFunction_findWirelessCTAReceiverCapableConnection_cold_2( uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void _CFDictionaryApplierFunction_findOOBPairingEndpoint_cold_1()
{
}

void _CFDictionaryApplierFunction_findInductiveCTADonorCapableConnection_cold_2( uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void _CFDictionaryApplierFunction_findInductiveCTAReceiverCapableConnection_cold_3( uint64_t a1, uint64_t a2, os_log_s *a3)
{
}

void _CFDictionaryApplierFunction_findInductiveAuthEndpoint_cold_1()
{
}

void iap2_sessionFileTransfer_cleanUpRemoveTransferList_cold_1()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v1,  v2,  "iap2_sessionFileTransfer_cleanUpRemoveTransferList: %@ removed %u items",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void iap2_sessionFileTransfer_cleanUpRemoveTransferList_cold_3()
{
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "iap2_sessionFileTransfer_cleanUpRemoveTransferList: %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void iap2_sessionFileTransfer_findTransferEntry_cold_2()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v1,  v2,  "iap2_sessionFileTransfer_findTransferEntry: %@ bufferID=%u, use inTransferList",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void iap2_sessionFileTransfer_findTransferEntry_cold_4()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v1,  v2,  "iap2_sessionFileTransfer_findTransferEntry: %@ bufferID=%u, use outTransferList",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void iap2_sessionFileTransfer_findTransferEntryForFeature_cold_1(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = *a1;
  int v3 = *((_DWORD *)a1 + 1);
  BOOL v4 = *((void *)a1 + 2) != 0LL;
  v5[0] = 67109632;
  v5[1] = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  BOOL v9 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Failed to find transfer! compareItem(bufferID=%u type=%d context(%d))",  (uint8_t *)v5,  0x14u);
  OUTLINED_FUNCTION_2();
}

void iap2_sessionFileTransfer_findTransferEntryForFeature_cold_3()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v1,  v2,  "iap2_sessionFileTransfer_findTransferEntryForFeature: %@ dir=%xh, use inTransferList",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void iap2_sessionFileTransfer_findTransferEntryForFeature_cold_5()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v1,  v2,  "iap2_sessionFileTransfer_findTransferEntryForFeature: %@ dir=%xh, use outTransferList",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void platform_iapd_bridge_accessory_connected_cold_1()
{
}

void iAP2TimeCreate_cold_1()
{
  __assert_rtn("iAP2TimeCreate", "iAP2Time.c", 606, "timeBuff != NULL");
}

void iAP2TimeCreate_cold_2()
{
  __assert_rtn("iAP2TimeCreate", "iAP2Time.c", 607, "expiredCB != NULL");
}

void iAP2TimeCreate_cold_3()
{
  __assert_rtn("iAP2TimeCreate", "iAP2Time.c", 608, "maxTimeouts != INVALID_TIMEOUT_ID");
}

void iAP2TimeCreate_cold_4()
{
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)",  buf,  8u);
}

void audioProductCerts_endpoint_create_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pEndpoint = NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void audioProductCerts_endpoint_create_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pConnection = NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void audioProductCerts_endpoint_publish_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void audioProductCerts_endpoint_publish_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handlePropertiesDidChange_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0( (void *)&_mh_execute_header,  v1,  v2,  "PropertiesDidchange: new %@, old %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void _audioProductCerts_endpoint_handlePropertiesDidChange_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0( (void *)&_mh_execute_header,  v1,  v2,  "Notification received %@, userInfo: %@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void _audioProductCerts_endpoint_processIncomingData_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 24);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "audioProductCerts processIncomingData: Unexpected data from %{coreacc:ACCEndpoint_TransportType_t}d dataIn %@",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_2();
}

void audioProductCerts_endpoint_propertyDidChange_cold_2(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v1 = 0LL;
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v2, v3, "PropertyDidchange: %@, value %@", (void)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

void audioProductCerts_endpoint_propertyDidChange_cold_4(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v1 = 0LL;
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v2, v3, "PropertyDidchange: %@, key %@", (void)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

void audioProductCerts_endpoint_propertyDidChange_cold_9(uint64_t a1, CFTypeRef cf, os_log_s *a3)
{
  CFTypeID v6 = CFGetTypeID(cf);
  LODWORD(OUTLINED_FUNCTION_12( (void *)&_mh_execute_header,  v0,  v1,  "[#iapd Bridge] ignoring authenticated flag for iAP1 bridge",  v2,  v3,  v4,  v5, v6) = v6 == CFNumberGetTypeID();
  CFTypeID v7 = CFGetTypeID(cf);
  int v8 = 136315906;
  BOOL v9 = "_audioProductCerts_endpoint_validKeyValueType";
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 1024;
  int v13 = v6;
  __int16 v14 = 1024;
  BOOL v15 = v7 == CFBooleanGetTypeID();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "%s: %@ is number(%d)/BOOLean(%d) type",  (uint8_t *)&v8,  0x22u);
}

void audioProductCerts_endpoint_propertyDidChange_cold_11()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "%s: %@ is array type", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void audioProductCerts_endpoint_propertyDidChange_cold_13(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "PropertyDidchange: key / value types are invalid!",  v1,  2u);
  OUTLINED_FUNCTION_5_1();
}

void audioProductCerts_endpoint_propertyDidChange_cold_14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void audioProductCerts_endpoint_propertyDidChange_cold_16( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthCertList_cold_1()
{
}

void _audioProductCerts_endpoint_handleAuthResponseList_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_15( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleMissingCertList_cold_16( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_6( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_12( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handleAuthResponseWithMissingCert_cold_13( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void audioProductCerts_endpoint_propertiesDidChange_cold_3()
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_5_0((void *)&_mh_execute_header, v1, v2, "PropertiesDidchange: %@, %@", (void)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void _CFArrayApplierFunction_parseEntries_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_getSerialEntryIndexInCertList_cold_1(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "_audioProductCerts_endpoint_getSerialEntryIndexInCertList";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, a3, "%s: resultIndex %ld", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_1()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v0, v1, "%s: %@, currentAuthChallengeNonce %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_3()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v0, v1, "%s: %@, currentAuthChallenge %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_5()
{
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9_2();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v2, (uint64_t)v2, "%s: %@, authChallenge %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_6_2();
}

void _audioProductCerts_endpoint_generateAuthChallenge_cold_7()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_12_1((void *)&_mh_execute_header, v0, (uint64_t)v0, "%s: %@, authPendingList %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_6_2();
}

void _audioProductCerts_endpoint_handlePrimaryBudMismatch_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_handlePrimaryBudMismatch_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _audioProductCerts_endpoint_validateChallenge_cold_1()
{
}

void _audioProductCerts_endpoint_validateChallenge_cold_6()
{
}

void _audioProductCerts_endpoint_validateChallenge_cold_8()
{
  v3[0] = 136315650;
  OUTLINED_FUNCTION_13_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s: Unable to create blob!!! (%@, %@)",  (uint8_t *)v3,  0x20u);
  OUTLINED_FUNCTION_6_2();
}

void _audioProductCerts_endpoint_validateChallenge_cold_17()
{
}

void iAP2LinkProcessInOrderPacketCMD_cold_1(unsigned __int8 *a1, unsigned __int8 a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = 136316162;
  uint64_t v5 = "iAP2LinkProcessInOrderPacketCMD";
  __int16 v6 = 1024;
  int v7 = 100;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = a2;
  __int16 v12 = 1024;
  int v13 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s:%d linkVer=%d cmdID=%xh(%d) not supported link version!",  (uint8_t *)&v4,  0x24u);
}

void iAP2LinkProcessInOrderPacketCMD_cold_3(int a1, os_log_s *a2)
{
  int v2 = 136315650;
  int v3 = "iAP2LinkProcessInOrderPacketCMD";
  __int16 v4 = 1024;
  int v5 = 119;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s:%d Unsupported control packet type=%d",  (uint8_t *)&v2,  0x18u);
  OUTLINED_FUNCTION_2();
}

void _convertUserVendorNVMRead_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertUserVendorNVMRead_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMEraseResponse_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMEraseResponse_cold_2()
{
}

void mfi4Auth_protocol_handle_NVMEraseResponse_cold_8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMEraseResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMEraseResponse_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMReadResponse_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMReadResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMReadResponse_cold_13( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMReadResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMReadResponse_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMReadResponse_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadAccessoryInfo_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadAccessoryInfo_cold_15( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadUserPublicKey_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _handleNvmReadUserPublicKey_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _replyGetNVMKey_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMAuthStart_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMAuthStart_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMWriteResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMWriteResponse_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMWriteResponse_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMWriteResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertNVMWriteResponse_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestUserNVMWrite_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_1()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_8()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_9()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_10()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_12()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_13()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_14()
{
}

void mfi4Auth_protocol_handle_NVMPublicKeyChallenge_cold_16( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMWritePublicKey_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMErasePublicKey_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_4()
{
}

void mfi4Auth_protocol_handle_NVMAuthStart_cold_6( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_2()
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_3()
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_4()
{
}

void mfi4Auth_protocol_initSigmaContextNvm_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_5()
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_7()
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_9()
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_17()
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_19()
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_22()
{
}

void mfi4Auth_protocol_handle_NVMAuthFinish_cold_26( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMPublicKeyChallenge_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMPublicKeyChallenge_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMOperation_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMOperation_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestNVMOperation_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_4()
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_5()
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_6()
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_7()
{
}

void mfi4Auth_protocol_handle_NVMOperationResponse_cold_9( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_parse_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestVendorNVMRead_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestVendorNVMRead_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestVendorNVMRead_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestManufacturerNVMRead_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestManufacturerNVMRead_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_initMessage_RequestManufacturerNVMRead_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertUserNVMWrite_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertUserNVMWrite_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_requestNvmErasePublicKey_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_requestNvmErasePublicKey_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_nvm_copyUserPublicKeyForSerialNumber_cold_1()
{
}

void _getCachedUserPublicKey_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getCachedUserPublicKey_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_convertUserAccessoryInfoToAction_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_convertUserAccessoryInfoToAction_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generateUserAccessoryInfoPayload_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generateUserAccessoryInfoPayload_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generateUserAccessoryInfoPayload_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getEndpointSampleRates_cold_1(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_2((void *)&_mh_execute_header, (int)a2, a3, "transportComponent is NULL", a1);
}

void t56_util_ios_getT56Endpoint_cold_1()
{
}

void t56_util_ios_getT56Endpoint_cold_3()
{
}

void t56_util_callbackOnTimer_cold_2()
{
}

void t56_util_callbackOnTimer_cold_4()
{
}

void t56_util_cancelTimer_cold_1()
{
}

void acc_connection_create_cold_2()
{
}

void acc_connection_setProperty_cold_1()
{
}

void acc_connection_setProperty_cold_3()
{
}

void acc_connection_publish_cold_3(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = "_checkForAdapterInfo";
  __int16 v6 = 1024;
  int v7 = 1505;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s:%d Could not get adapterConnection for UUID %@ !!!  connection %@",  (uint8_t *)&v4,  0x26u);
}

void acc_connection_publish_cold_9(uint64_t *a1, os_log_s *a2)
{
  int v2 = *((unsigned __int16 *)a1 + 70);
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%d EAService endpoints are now advertised for connection %@",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_2();
}

void acc_connection_publish_cold_11()
{
}

void acc_connection_destroy_cold_1()
{
}

void acc_connection_destroy_cold_3()
{
}

void acc_connection_setAuthStatus_cold_1()
{
}

void acc_connection_setAuthStatus_cold_3()
{
}

void acc_connection_mapAccessoryInfo_cold_6()
{
}

void acc_connection_setProperties_cold_1()
{
}

void acc_connection_setProperties_cold_3()
{
}

void acc_connection_sendDataOut_cold_2(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Sending outgoing data for connection %@...",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_2();
}

void platform_analytics_endpointAccessoryInfoDidChange_cold_2(char a1, os_log_s *a2)
{
  uint64_t v2 = "YES";
  if ((a1 & 1) != 0) {
    uint64_t v2 = "NO";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[#EventLogger] accInfoIsDifferent: %s",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_2();
}

void platform_analytics_endpointAccessoryInfoDidChange_cold_4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[#EventLogger] oldAccessoryInfo: %@, newAccessoryInfo: %@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_2();
}

void acc_protocolParser_iAP2_run_cold_1()
{
}

void acc_protocolParser_iAP2_run_cold_3()
{
}

void acc_protocolParser_iAP2_run_cold_5()
{
}

void acc_protocolParser_iAP2_run_cold_7()
{
}

void acc_protocolParser_iAP2_run_cold_9( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolParser_iAP2_run_cold_11( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolParser_iAP2_run_cold_13()
{
}

void acc_protocolParser_iAP2_run_cold_15()
{
}

void acc_protocolParser_iAP2_run_cold_17()
{
}

void acc_protocolParser_iAP2_run_cold_19()
{
}

void acc_protocolParser_iAP2_run_cold_21()
{
}

void acc_protocolParser_iAP2_run_cold_24()
{
}

void acc_protocolParser_iAP2_run_cold_26()
{
}

void acc_protocolParser_iAP2_run_cold_30()
{
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_1(uint64_t a1)
{
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_2(uint64_t a1)
{
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_3(uint64_t a1)
{
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_4(uint64_t a1)
{
}

void iap2_wifisharing_AccessoryWiFiConfigurationInformation_cold_5(uint64_t a1)
{
}

void _checkIdentificationInfo_cold_1_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _checkIdentificationInfo_cold_3_0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolRouter_routeIncomingData_cold_1()
{
}

void acc_protocolRouter_routeOutgoingSecureTunnelDataForClient_cold_1()
{
}

void acc_protocolRouter_setSecureTunnelDataTypeHandler_cold_1()
{
}

void iAP2LinkRunLoopCreate_cold_1()
{
}

void iAP2LinkRunLoopCreate_cold_2()
{
}

void iAP2LinkRunLoopRunOnce_cold_1()
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2( (void *)&_mh_execute_header,  a2,  a3,  "iAP2Navigation StartRouteGuidance: for componentList=%@",  a5,  a6,  a7,  a8,  2u);
  OUTLINED_FUNCTION_2();
}

void iap2_navigation_startRouteGuidanceHandler_cold_4(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_5(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_6(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_7(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_8(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_9(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_10(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_11(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_12(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_13(uint64_t a1)
{
}

void iap2_navigation_startRouteGuidanceHandler_cold_14(uint64_t a1)
{
}

void iap2_navigation_stopRouteGuidanceHandler_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2( (void *)&_mh_execute_header,  a2,  a3,  "iAP2Navigation StopRouteGuidance: for componentList=%@",  a5,  a6,  a7,  a8,  2u);
  OUTLINED_FUNCTION_2();
}

void iap2_navigation_roadObjectDetectionUpdateHandler_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_navigation_roadObjectDetectionUpdateHandler_cold_12(uint64_t a1)
{
}

void _parseRoadSignParameter_cold_1()
{
}

void _parseRoadSignParameter_cold_3()
{
}

void _parseRoadSignParameter_cold_5()
{
}

void _parseRoadSignParameter_cold_7()
{
}

void _parseRoadSignParameter_cold_9()
{
}

void _parseRoadSignParameter_cold_11()
{
}

void _parseRoadLaneParameter_cold_13()
{
}

void _parseRoadLaneParameter_cold_15()
{
}

void _parseRoadLaneParameter_cold_18()
{
}

void _parseRoadLaneParameter_cold_21()
{
}

void _convertRouteGuidanceStateTypeForFunc_cold_1()
{
}

void _convertManeuverStateTypeForFunc_cold_1()
{
}

void _convertDistaceUnitTypeForFunc_cold_1()
{
}

void _convertManeuverTypeForFunc_cold_1()
{
}

void _convertDrivingSideTypeForFunc_cold_1()
{
}

void _convertJunctionTypeForFunc_cold_1()
{
}

void iap2_navigation_laneGuidanceInfoUpdateHandler_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "iAP2Navigation LaneGuidanceInfoUpdate %@, laneInfoList arrayObj=%@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_2();
}

void _parseIdentificationParams_cold_1_0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pEndpoint == NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void _parseIdentificationParams_cold_2_0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  a1,  a3,  "navigation = NULL or navigation->displayComponents = NULL",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_5_1();
}

void _parseIdentificationParams_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_auth_protocol_sizeofMessageData_cold_5(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_3_7( (void *)&_mh_execute_header,  a2,  a3,  "[AccAuth] sizeofEncryptedAuthInfoData: encryptedInfoType %d, dataLen %d \n",  67109376,  v3);
  OUTLINED_FUNCTION_2();
}

void acc_auth_protocol_isRespMessage_cold_1()
{
}

void acc_auth_protocol_initSetupMessage_cold_2(uint64_t a1, os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 10);
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[AccAuth] initSetupMessage: DO_IF_ACCESSORY - copy authTypes, authTypesLen %d -> %d \n",  (uint8_t *)v3,  0xEu);
  OUTLINED_FUNCTION_2();
}

void acc_auth_protocol_initSetupMessage_cold_4()
{
}

void acc_auth_protocol_createSessionWithContext_cold_2()
{
}

void acc_auth_protocol_createSessionWithContext_cold_4()
{
}

void __acc_auth_protocol_handleAuthSetup_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __acc_auth_protocol_handleAuthSetup_cold_6( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _parseIdentificationParams_cold_1_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pProtocolEndpoint == NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void _parseIdentificationParams_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_location_update_cold_2(uint8_t *a1, _DWORD *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 0;
  OUTLINED_FUNCTION_5_9((void *)&_mh_execute_header, a3, (uint64_t)a3, "paramID: %04X, nmeaSentenceRef = nil!\n", a1);
}

void iap2_location_send_gprmc_data_values_cold_2(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = 65520;
  OUTLINED_FUNCTION_5_9( (void *)&_mh_execute_header,  a1,  a3,  "Not identified for outgoing message ID: 0x%04X!",  (uint8_t *)v3);
  OUTLINED_FUNCTION_5_1();
}

void _handleIdentificationRejection_cold_1(char a1, uint64_t a2, os_log_t log)
{
  if ((a1 & 1) != 0 || (uint64_t v3 = *(void *)(a2 + 8)) == 0) {
    uint64_t v3 = 0LL;
  }
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to reset SupportedNMEASentences for endpointUUID %@",  (uint8_t *)&v4,  0xCu);
  OUTLINED_FUNCTION_2();
}

void platform_bluetooth_copyNameForMacAddress_cold_1(os_log_s *a1)
{
  int v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformBluetoothAccessoryInformationPluginProtocol);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "[#Bluetooth] Could not find plugin conforming to %@!",  (uint8_t *)&v4,  0xCu);
}

void _parseIdentificationParamsPower_cold_1()
{
}

void _parseIdentificationParamsPower_cold_3()
{
}

void _parseIdentificationParamsPower_cold_5()
{
}

void _parseIdentificationParamsPower_cold_9()
{
}

void _processPowerSourceUpdate_cold_6(uint64_t a1, unsigned __int16 *a2, os_log_t log)
{
  if (!a1 || (uint64_t v3 = *(void *)(a1 + 8)) == 0) {
    uint64_t v3 = 0LL;
  }
  int v4 = *((unsigned __int8 *)a2 + 2);
  int v5 = *a2;
  int v6 = 138412802;
  uint64_t v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Check availableCurrentForDevice(ChargingCurrentLimit) for override, accessory %@, isValid %d, availableCurrentForDevice %d",  (uint8_t *)&v6,  0x18u);
  OUTLINED_FUNCTION_2();
}

void _cbPowerSourceUpdateParams_cold_1()
{
}

void iap2_power_powerSourceUpdateHandler_cold_2()
{
}

void _cbAccessoryPowerUpdateParams_cold_2()
{
}

void iap2_power_accessoryPowerUpdateHandler_cold_1()
{
}

void iap2_power_updateHandler_cold_1()
{
}

void main_cold_12(void *a1)
{
  id v3 = OUTLINED_FUNCTION_7_6(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_6_7((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "acc_strings_bundle: %@", (uint8_t *)v2);

  OUTLINED_FUNCTION_3_8();
}

void main_cold_14(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6_7( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "mainBundle.preferredLocalizations: %@",  (uint8_t *)a2);
}

void main_cold_16(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6_7( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "mainBundle.localizations: %@",  (uint8_t *)a2);
}

void main_cold_18(void *a1)
{
  id v3 = OUTLINED_FUNCTION_5_10(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_4_11((void *)&_mh_execute_header, v4, v5, "mainBundle.builtInPlugInsPath: %@");

  OUTLINED_FUNCTION_3_8();
}

void main_cold_20(void *a1)
{
  id v3 = OUTLINED_FUNCTION_5_10(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_4_11((void *)&_mh_execute_header, v4, v5, "mainBundle.bundleIdentifier: %@");

  OUTLINED_FUNCTION_3_8();
}

void main_cold_22(void *a1)
{
  id v3 = OUTLINED_FUNCTION_5_10(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_4_11((void *)&_mh_execute_header, v4, v5, "mainBundle.bundlePath: %@");

  OUTLINED_FUNCTION_3_8();
}

void main_cold_24(void *a1)
{
  id v3 = OUTLINED_FUNCTION_7_6(a1);
  *(_DWORD *)uint64_t v2 = 138412290;
  *(void *)(v2 + 4) = v3;
  OUTLINED_FUNCTION_6_7((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "mainBundle: %@", (uint8_t *)v2);

  OUTLINED_FUNCTION_3_8();
}

void platform_externalAccessory_addEAAccessoryForEAEndpoints_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "platform_externalAccessory_addEAAccessoryForEAEndpoints: endpointUUIDs: %@, primaryEndpointUUID: %@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_2();
}

void _findiAP2EndpointForConnection_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No iAP2 endpoint found!", v1, 2u);
}

void _sendEAPowerSourceUpdate_cold_1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error setting AccessoryPowerMode for endpoint: %@",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_2();
}

void platform_externalAccessory_removeEAAccessoryForPrimaryEndpoint_cold_3(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 primaryEndpointUUID]);
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Removing accessory primaryEndpointUUID %@",  (uint8_t *)&v4,  0xCu);
}

void platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus_cold_1(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s Couldn't find EA accessory to notify with primary endpointUUID %@",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_2();
}

void platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus_cold_3( unsigned __int8 a1, int a2, os_log_t log)
{
  int v3 = 136315906;
  __int16 v4 = "platform_externalAccessory_notifyClientsOOBBTPairingCompletionStatus";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "ERROR: %s: result=%d connectionID=%u macAddr=%@, invalid macAddr! skip update!",  (uint8_t *)&v3,  0x22u);
}

void platform_auth_verifyNonceSignatureForType_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[#Authentication] Failed to parse certData!\n",  v0,  2u);
}

void _sendUpdateForUUID_cold_1(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[#Device Notifications] Sending update for notification type: %{coreacc:ACCDeviceNotification_t}d to endpoint %@...",  (uint8_t *)v3,  0x12u);
  OUTLINED_FUNCTION_2();
}

void ___addObserversForNotification_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolParser_iAP1_run_cold_1()
{
}

void acc_protocolParser_iAP1_run_cold_3()
{
}

void acc_protocolParser_iAP1_run_cold_5( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_protocolParser_iAP1_run_cold_6()
{
}

void acc_protocolParser_iAP1_run_cold_8()
{
}

void acc_protocolParser_iAP1_run_cold_11()
{
}

void acc_protocolParser_iAP1_run_cold_13()
{
}

void acc_protocolParser_iAP1_run_cold_15()
{
}

void acc_protocolParser_iAP1_run_cold_17()
{
}

void acc_protocolParser_iAP1_run_cold_19()
{
}

void acc_protocolParser_iAP1_run_cold_22()
{
}

void loggingProtocol_handleMessage_cold_1()
{
}

void loggingProtocol_handleMessage_cold_3()
{
}

void loggingProtocol_handleMessage_cold_4()
{
}

void loggingProtocol_handleMessage_cold_6( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_7( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_9()
{
}

void loggingProtocol_handleMessage_cold_10()
{
}

void loggingProtocol_handleMessage_cold_12( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_13()
{
}

void loggingProtocol_handleMessage_cold_14()
{
}

void loggingProtocol_handleMessage_cold_16( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_17()
{
}

void loggingProtocol_handleMessage_cold_18()
{
}

void loggingProtocol_handleMessage_cold_19()
{
}

void loggingProtocol_handleMessage_cold_20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void loggingProtocol_handleMessage_cold_21(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Final binary log segment was received.",  v1,  2u);
  OUTLINED_FUNCTION_5_1();
}

void loggingProtocol_handleMessage_cold_23(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LOWORD(OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v0,  v1,  "Logging Protocol Session Sync Received. AccessoryName: %s, Protocol Version: %d",  v2, v3) = 2080;
  *(void *)((char *)&v3 + 2) = a1;
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  a2,  a3,  "BinaryLogSegment received. LogFileID: %u, segmentData: %s",  67109378,  (const char *)v3);
  OUTLINED_FUNCTION_2();
}

void loggingProtocol_handleMessage_cold_25()
{
}

void loggingProtocol_requestAccessoryLogs_cold_1(int a1, os_log_s *a2)
{
  v2[0] = 67109632;
  v2[1] = a1;
  __int16 v3 = 2048;
  uint64_t v4 = 0LL;
  __int16 v5 = 2048;
  uint64_t v6 = -1LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Sending RequestBinaryLogAvailable. LogPriority: %u, TimeStampStart: %llu, TimeStampEnd: %llu",  (uint8_t *)v2,  0x1Cu);
}

void sendMessage_stopBinaryLogFile_cold_1()
{
}

void sendMessage_requestBinaryLogFileInfo_cold_1()
{
}

void writeMessage_binaryBlock_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void writeMessage_binaryBlock_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __acc_auth_protocol_handleNotInCache_cold_3()
{
}

void __acc_auth_protocol_handlContinueWithSegment_cold_2()
{
}

void __acc_auth_protocol_handleCertificateChainInfoRequest_cold_2()
{
  v4[0] = 67109632;
  v4[1] = v0;
  __int16 v5 = 1024;
  int v6 = v1;
  __int16 v7 = 1024;
  int v8 = 32;
  OUTLINED_FUNCTION_7_7( (void *)&_mh_execute_header,  v2,  v3,  "[AccAuth][1Way] handleCertificateChainInfoRequest: sessionID %d, role %d, requestHashSize %d \n",  (uint8_t *)v4);
  OUTLINED_FUNCTION_2();
}

void __acc_auth_protocol_handleChallenge_cold_2()
{
}

void __acc_auth_protocol_handleCertificateHash_cold_2()
{
}

void __acc_auth_protocol_handleCertificate_cold_2()
{
}

void __acc_auth_protocol_handleCertificateChainCert_cold_2()
{
  OUTLINED_FUNCTION_7_7( (void *)&_mh_execute_header,  v0,  v1,  "[AccAuth][1Way] handleCertificateChainCert: sessionID %d, role %d, first segment(=%d), init for segmented received. \n",  v2);
  OUTLINED_FUNCTION_2();
}

void __acc_auth_protocol_handleResponse_cold_3()
{
}

void __acc_auth_protocol_handleResponse_cold_7()
{
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "[AccAuth][1Way] handleCertificate: sessionID %d, role %d, first segment(=%d), init for segmented received. maxDataLen %d \n",  v3,  0x1Au);
}

void __acc_auth_protocol_handleResponse_cold_10()
{
}

void __acc_auth_protocol_sendCertChainRequestOrChallenge_cold_2()
{
}

void iap2_CarPlayStartSession_cold_2(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_3(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_4(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_5(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_6(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_7(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_11(uint64_t a1)
{
}

void iap2_CarPlayStartSession_cold_12(uint64_t a1)
{
}

void _checkIdentificationInfo_cold_1_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Identified for CarPlay Connection Initiation",  v1,  2u);
}

void _isPowerDuringSleepForApplePencil_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[#Power] Failed to find ACCPlatformPowerInfo instance, no sleep assertion for Apple Pencil",  v1,  2u);
}

void _sendOutgoingMessage_cold_3(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 8);
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Not identified for outgoing message ID: 0x%04X! (endpoint %@)",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_2();
}

void iap2_sessionControl_authorizationHook_authentication_cold_1(unsigned int *a1)
{
}

void ___requestAuthorization_block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "certSerialString: %@, accName: %@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_2();
}

void _statusUpdateHandler_cold_1()
{
}

void _statusUpdateHandler_cold_4(uint64_t a1)
{
}

void _statusUpdateHandler_cold_5(uint64_t a1)
{
}

void _statusUpdateHandler_cold_6(uint64_t a1)
{
}

void _statusUpdateHandler_cold_7(uint64_t a1)
{
}

void _statusUpdateHandler_cold_8(uint64_t a1)
{
}

void _statusUpdateHandler_cold_9(uint64_t a1)
{
}

void _statusUpdateHandler_cold_10(uint64_t a1)
{
}

void _statusUpdateHandler_cold_11(uint64_t a1)
{
}

void _statusUpdateHandler_cold_12(uint64_t a1)
{
}

void _statusUpdateHandler_cold_13(uint64_t a1)
{
}

void _statusUpdateHandler_cold_14(uint64_t a1)
{
}

void _statusUpdateHandler_cold_15(uint64_t a1)
{
}

void _statusUpdateHandler_cold_16(uint64_t a1)
{
}

void _statusUpdateHandler_cold_17(uint64_t a1)
{
}

void _statusUpdateHandler_cold_18(uint64_t a1)
{
}

void _statusUpdateHandler_cold_19(uint64_t a1)
{
}

void _statusUpdateHandler_cold_20(uint64_t a1)
{
}

void _statusUpdateHandler_cold_21(uint64_t a1)
{
}

void _statusUpdateHandler_cold_22(uint64_t a1)
{
}

void _statusUpdateHandler_cold_23(uint64_t a1)
{
}

void _statusUpdateHandler_cold_24(uint64_t a1)
{
}

void _statusUpdateHandler_cold_25(uint64_t a1)
{
}

void _statusUpdateHandler_cold_26(uint64_t a1)
{
}

void _statusUpdateHandler_cold_27(uint64_t a1)
{
}

void _statusUpdateHandler_cold_28(uint64_t a1)
{
}

void _statusUpdateHandler_cold_29(uint64_t a1)
{
}

void _statusUpdateHandler_cold_30(uint64_t a1)
{
}

void _statusUpdateHandler_cold_31(uint64_t a1)
{
}

void iap2_vehicle_startStatusUpdatesHandler_cold_1()
{
}

void iap2_vehicle_startStatusUpdatesHandler_cold_2()
{
}

void _parseIdentificationParams_cold_1_2(uint64_t a1)
{
}

void _parseIdentificationParams_cold_3_0(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "engineType >= eiAP2ParamID_VehicleInformationComponent_EngineType_Unknown",  buf,  2u);
}

void _parseIdentificationParams_cold_4(uint8_t *a1, _DWORD *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 20;
  OUTLINED_FUNCTION_10_5((void *)&_mh_execute_header, (int)a2, a3, "msgParamID: %d", a1);
}

void _parseIdentificationParams_cold_5_0(uint8_t *a1, _DWORD *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 21;
  OUTLINED_FUNCTION_10_5((void *)&_mh_execute_header, (int)a2, a3, "msgParamID: %d", a1);
}

void _startFeatureFromDevice_cold_2(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "iAP2OOBBTPairing2 _startFeatureFromDevice: accInfoDict = %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void _startFeatureFromDevice_cold_5(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "transportComponent is NULL!", buf, 2u);
}

void mfi4Auth_endpoint_create_cold_1()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void mfi4Auth_endpoint_create_cold_2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "endpointUUID = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void _mfi4Auth_endpoint_initSession_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_endpoint_initSession_cold_4(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "_mfi4Auth_endpoint_initSession";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s: endpointUUID %@, endpointSupportsMutualAuth %d",  (uint8_t *)&v3,  0x1Cu);
}

void _mfi4Auth_endpoint_sendAuthSetupStart_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_endpoint_processIncomingData_cold_1()
{
}

void mfi4Auth_endpoint_processIncomingData_cold_2()
{
}

void mfi4Auth_endpoint_processIncomingData_cold_3()
{
}

void mfi4Auth_endpoint_sendOutgoingData_cold_2()
{
}

void mfi4Auth_endpoint_setEndpointSecureTunnelDataReceiveTypeHandler_cold_2()
{
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_1()
{
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_2()
{
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_3()
{
}

void ___mfi4Auth_endpoint_sendAuthSetupStart_block_invoke_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __qiAuth_endpoint_processIncomingData_block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 52);
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *a2;
  int v6 = 136315906;
  __int16 v7 = "qiAuth_endpoint_processIncomingData_block_invoke";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to process incoming message!!! hdr 0x%02X, (%d bytes) %@",  (uint8_t *)&v6,  0x22u);
}

void _qiAuth_endpoint_handleMessage_cold_2()
{
}

void qiAuth_endpoint_setAuthState_cold_2()
{
}

void qiAuth_endpoint_setAuthState_cold_3()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pEndpoint = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void qiAuth_endpoint_setAuthState_cold_4()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pConnection = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void _userNotificationHandler_cold_1(uint64_t a1)
{
}

void _userNotificationHandler_cold_8(uint64_t a1)
{
}

void iAP2LinkActionHandleTimeSyncResponse_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "Offset Uncertainty = %lld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void iAP2LinkActionHandleTimeSyncResponse_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "Filtered Time Offset = %lld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void iAP2LinkActionHandleTimeSyncResponse_cold_6( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "Time Offset = %lld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void iAP2LinkActionHandleTimeSyncResponse_cold_8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "Cur Timestamp = 0X%llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void iAP2LinkActionHandleTimeSyncResponse_cold_10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "Recv Timestamp = 0X%llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void iAP2LinkActionHandleTimeSyncResponse_cold_12( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "Orig Timestamp = 0X%llx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_3(uint64_t a1)
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_4(uint64_t a1)
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_5()
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_6()
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_8(uint64_t a1)
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_9(uint64_t a1)
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_10(uint64_t a1)
{
}

void iap2_mediaLibrary_startMediaLibraryUpdatesHandler_cold_11()
{
}

void iap2_mediaLibrary_playMediaLibraryItemsHandler_cold_4(uint64_t a1)
{
}

void iap2_mediaLibrary_playMediaLibraryCollectionHandler_cold_5(uint64_t a1)
{
}

void iap2_mediaLibrary_playMediaLibrarySpecialHandler_cold_1(uint64_t a1)
{
}

void iap2_mediaLibrary_playMediaLibrarySpecialHandler_cold_3(uint64_t a1)
{
}

void iap2_mediaLibrary_playMediaLibrarySpecialHandler_cold_6(uint64_t a1)
{
}

void iap2_mediaLibrary_updateHandler_cold_3(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_14_1( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "_iap2_mediaLibrary_playlistUpdateHandler: failed to get bufferID... need to retry later! (but not supported yet)",  a1);
}

void _iAP2MediaLibraryMsgCleanupCB_cold_2()
{
}

void _iAP2MediaLibraryMsgCleanupCB_cold_5(uint64_t a1, uint64_t *a2, os_log_s *a3)
{
  int v5 = (unsigned __int16)a1;
  int MsgID = iAP2MsgGetMsgID(a1);
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  int v10 = *((_DWORD *)a2 + 6);
  int v11 = *((unsigned __int8 *)a2 + 28);
  v12[0] = 67110658;
  v12[1] = v5;
  __int16 v13 = 1024;
  int v14 = MsgID;
  __int16 v15 = 2112;
  uint64_t v16 = v7;
  __int16 v17 = 2112;
  uint64_t v18 = v8;
  __int16 v19 = 2112;
  uint64_t v20 = v9;
  __int16 v21 = 1024;
  int v22 = v10;
  __int16 v23 = 1024;
  int v24 = v11;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "_iAP2MediaLibraryMsgCleanupCB: msg=%hxh msgID=%04xh context(accessoryUID=%@ libraryUID=%@ lastRevision=%@ updatesInM sg=%d confirmed=%d)",  (uint8_t *)v12,  0x38u);
}

void __MsgSentOutCB_cold_1()
{
}

float iap2_mediaLibrary_updatePlaylistContentHandler_cold_6(unsigned __int8 *a1, os_log_s *a2)
{
  int v2 = *a1;
  int v3 = *((_DWORD *)a1 + 1);
  int v4 = *((unsigned __int16 *)a1 + 4);
  int v5 = *((unsigned __int16 *)a1 + 8);
  v7[0] = 67109888;
  v7[1] = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "updatePlaylistContentHandler: xferEntry(bufferID=%u type=%u fileXfer=%hxh context=%hxh)",  (uint8_t *)v7,  0x1Au);
  return result;
}

void iap2_mediaLibrary_updatePlaylistContentHandler_cold_9(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  OUTLINED_FUNCTION_14_1( (void *)&_mh_execute_header,  a1,  a3,  "updatePlaylistContentHandler: failed to get bufferID... need to retry later! (but not supported yet)",  v3);
}

void iap2_mediaLibrary_updatePlaylistContentHandler_cold_11(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "updatePlaylistContentHandler: ERROR: PlaylistContentStyleRecords style for sessionVer=%d is not valid!",  (uint8_t *)v2,  8u);
}

void __handleTransferEnd_cold_2()
{
}

void _calcWindowSize_cold_2()
{
}

void _calcWindowSize_cold_4()
{
}

void iap2_externalaccessory_statusEASessionHandler_cold_1()
{
}

void iap2_externalaccessory_statusEASessionHandler_cold_5(unsigned __int16 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "platform_externalAccessory couldn't close eaSession %d from accessory SessionStatus",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_5_1();
}

void iap2_externalaccessory_statusEASessionHandler_cold_8(uint64_t a1, os_log_s *a2)
{
  v4[0] = 67109376;
  v4[1] = 0;
  __int16 v5 = 1024;
  int MsgID = iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_7_8( (void *)&_mh_execute_header,  a2,  v3,  "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message",  (uint8_t *)v4);
  OUTLINED_FUNCTION_4();
}

void iap2_externalaccessory_statusEASessionHandler_cold_9(uint64_t a1, os_log_s *a2)
{
  v4[0] = 67109376;
  v4[1] = 1;
  __int16 v5 = 1024;
  int MsgID = iAP2MsgGetMsgID(a1);
  OUTLINED_FUNCTION_7_8( (void *)&_mh_execute_header,  a2,  v3,  "Param ID: %d parse error for Msg ID: 0x%04X - ignoring message",  (uint8_t *)v4);
  OUTLINED_FUNCTION_4();
}

void _iAP2_closeEASession_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _iAP2_closeEASession_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _iAP2_closeEASession_cold_6( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_externalAccessory_openEASession_cold_3()
{
}

void _iap2_externalAccessory_openEASessionSent_cold_1()
{
}

void iap2_externalAccessory_closeEASession_cold_1()
{
}

void iap2_externalAccessory_outgoingEADataAvailable_cold_4(_BYTE *a1, _BYTE *a2)
{
}

void iap2_externalAccessory_sendOutgoingEAData_cold_2(_BYTE *a1, _BYTE *a2)
{
}

void iap2_externalAccessory_sendOutgoingEAData_cold_4(unsigned __int16 *a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(OUTLINED_FUNCTION_4_14((void *)&_mh_execute_header, v2, (uint64_t)v2, "dataBuf is NULL!", v3) = 67109378;
  HIDWORD(OUTLINED_FUNCTION_4_14((void *)&_mh_execute_header, v2, (uint64_t)v2, "dataBuf is NULL!", v3) = *a1;
  LOWORD(OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  v0,  v1,  "[AccAuth][1Way] sendCertChainRequestOrChallenge: sessionID %d, role %d, needCertChainInfo %d \n",  v2,  v3, v4) = 2112;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  a2,  a3,  "Queued all bytes for future send for eaSession %d (sessionUUID %@)",  v3,  (void)v4,  WORD4(v4));
  OUTLINED_FUNCTION_2();
}

void iap2_externalAccessory_sendOutgoingEAData_cold_6()
{
}

void iap2_externalAccessory_sendOutgoingEAData_cold_8()
{
}

void _queueOutgoingDataForEASessionUUID_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _queueOutgoingDataForEASessionUUID_cold_3()
{
}

void _eaDataQueuedCB_cold_1()
{
}

void _eaDataQueuedCB_cold_3()
{
}

void _eaDataQueuedCB_cold_5()
{
}

void _eaDataQueuedCB_cold_7(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Old cache length was %d, new length is %d",  (uint8_t *)v3,  0xEu);
  OUTLINED_FUNCTION_2();
}

void _eaDataQueuedCB_cold_9( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _eaDataQueuedCB_cold_12()
{
}

void _eaDataQueuedCB_cold_14()
{
  OUTLINED_FUNCTION_4_5( (void *)&_mh_execute_header,  v0,  v1,  "_eaDataQueuedCB: Have more data to send in cache, eaSessionUUID %@, pendingDataCFIndex Length = %d");
  OUTLINED_FUNCTION_2();
}

void _CFDictionaryApplierFunction_deactiveEASession_cold_1()
{
}

void _parseIdentificationSupportedEAProtocol_cold_2()
{
}

void _parseIdentificationSupportedEAProtocol_cold_4()
{
}

void _parseIdentificationSupportedEAProtocol_cold_6( unsigned __int8 *a1, CFStringRef theString, os_log_s *a3)
{
  int v4 = *a1;
  v5[0] = 67109378;
  v5[1] = v4;
  __int16 v6 = 2080;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Already have an ea protocol for ID %d (protocol %s)",  (uint8_t *)v5,  0x12u);
  OUTLINED_FUNCTION_4();
}

void _parseIdentificationPreferredBundleSeedID_cold_1()
{
  OUTLINED_FUNCTION_4_14((void *)&_mh_execute_header, v0, v1, "puint64_t Feature = NULL", v2);
  OUTLINED_FUNCTION_5_1();
}

void _iap2_externalAccessory_eaDataQueuedCB_cold_1()
{
}

void _destroyFeature_cold_1()
{
}

void _destroyFeature_cold_3()
{
}

void _startFeatureFromDevice_cold_1()
{
}

void _startFeatureFromDevice_cold_3()
{
}

void _checkIdentificationInfo_cold_1_3()
{
}

void _checkIdentificationInfo_cold_5(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "transportComponent is NULL", buf, 2u);
}

void iap2_usbHostMode_StartUSBHostModeHandler_cold_1()
{
}

void iap2_usbHostMode_StartUSBHostModeHandler_cold_3()
{
}

void iap2_usbHostMode_StartUSBHostModeHandler_cold_5()
{
}

void iap2_usbHostMode_StopUSBHostModeHandler_cold_3()
{
}

void iap2_usbHostMode_StopUSBHostModeHandler_cold_5()
{
}

void iap2_usbHostMode_USBModeChangeNotification_cold_1()
{
}

void _requestAppLaunchHandler_cold_3(uint64_t a1)
{
}

void _requestAppLaunchHandler_cold_4(uint64_t a1)
{
}

void accSNTPTimeSync_endpoint_create_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pProtocolEndpoint = NULL", v1, 2u);
}

void _accSNTPTimeSync_endpoint_processIncomingData_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  if (*(void *)a1) {
    int v3 = *(_DWORD *)(*(void *)a1 + 24LL);
  }
  else {
    int v3 = 17;
  }
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "sntpTimeSync processIncomingData: %{coreacc:ACCEndpoint_TransportType_t}d dataIn %@",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_2();
}

void platform_wifisharing_request_device_wifi_information_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void platform_wifisharing_request_device_wifi_information_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___presentShareWiFiCredentialsNotification_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___presentShareWiFiCredentialsNotification_block_invoke_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iAP2ListArrayAddItemAfter_cold_1()
{
  __assert_rtn("iAP2ListArrayAddItemAfter", "iAP2ListArray.c", 600, "itemIndex != kiAP2ListArrayInvalidIndex");
}

void iap2_appLinks_start_cold_2(uint64_t a1, uint64_t a2)
{
}

void iap2_appLinks_start_cold_5(uint64_t a1, uint64_t a2)
{
}

void iap2_appLinks_appLinksUpdateHandler_cold_1()
{
}

void iap2_appLinks_appLinksUpdateHandler_cold_8()
{
}

void _calculateListCap_cold_2()
{
}

void _appLinksAppIconResponse_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _appLinksAppIconResponse_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _appIconFileTransferIDSent_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _appIconFileTransferIDSent_cold_3(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 109);
  int v4 = *(unsigned __int16 *)(a1 + 112);
  int v5 = *a2;
  v6[0] = 67109632;
  v6[1] = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 1024;
  int v10 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Call Start pTransfer(ID=%u type=%d state=%d)",  (uint8_t *)v6,  0x14u);
  OUTLINED_FUNCTION_2();
}

void _appIconFileTransferIDSent_cold_6(uint64_t a1, int *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 109);
  int v4 = *a2;
  int v5 = 138544130;
  uint64_t v6 = @"#AppIcon";
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%{public}@ ignore starting transfer in non-idle state, transfer (%p id=%d state=%d)",  (uint8_t *)&v5,  0x22u);
}

void _appIconFileTransferEndHandler_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _appIconFileTransferEndHandler_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)",  buf,  8u);
}

void platform_connectionInfo_setAccessoryUserName_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_getAccessoryUserName_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_getPairingStatus_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_provisionPairing_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_resetPairing_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_getPublicNvmKeyValues_cold_1(uint64_t a1)
{
}

void platform_connectionInfo_setPublicNvmKeyValues_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_getPrivateNvmKeyValues_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_setPrivateNvmKeyValues_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_beginVendorKeyErase_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_continueVendorKeyErase_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_cancelVendorKeyErase_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_beginUserKeyErase_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_continueUserKeyErase_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_cancelUserKeyErase_cold_2(uint64_t a1)
{
}

void platform_connectionInfo_copyUserPrivateKey_cold_2(uint64_t a1)
{
}

void _acc_auth_protocol_isBusySessionID_cold_1(char a1, int a2, os_log_t log)
{
  v3[0] = 67109632;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1 & 1;
  __int16 v6 = 1024;
  int v7 = (unsigned __int16)__availableSessionIDs;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[AccAuth] _isBusySessionID: sessionID %d, isBusySessionID %d, __availableSessionIDs %#04x \n",  (uint8_t *)v3,  0x14u);
  OUTLINED_FUNCTION_2();
}

void _acc_auth_protocol_cleanupCertificateInfo_cold_2()
{
}

void _acc_auth_protocol_cleanupCertificateData_cold_2()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "[AccAuth] _cleanupCertificateData: certificateDataLen %d, certificateHashLen %d \n",  v2,  0xEu);
  OUTLINED_FUNCTION_2();
}

void _acc_auth_protocol_validateCertificateChain_cold_2()
{
}

void _acc_auth_protocol_validateCertificateChain_cold_4(void *a1, os_log_s *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[AccAuth] _validateCertificateChain: certList.count %lu \n",  (uint8_t *)&v3,  0xCu);
}

void _acc_auth_protocol_validateCertificateChain_cold_6()
{
}

void iap2_assistiveTouch_startAssistiveTouchHandler_cold_1()
{
  OUTLINED_FUNCTION_3_11( (void *)&_mh_execute_header,  v0,  v1,  "StartAssistiveTouch: %@ started %d->%d pEndpoint=%p assistiveTouch=%p");
  OUTLINED_FUNCTION_6_10();
}

void iap2_assistiveTouch_stopAssistiveTouchHandler_cold_1(uint64_t a1, unsigned __int8 *a2)
{
  *(_DWORD *)uint64_t v4 = 138413314;
  *(void *)&v4[4] = *(void *)(a1 + 8);
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = *a2;
  *(_WORD *)&v4[18] = 1024;
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_3_11( (void *)&_mh_execute_header,  v2,  v3,  "StopAssistiveTouch: %@ started %d->%d pEndpoint=%p assistiveTouch=%p",  *(void *)v4,  *(void *)&v4[8],  *(unsigned int *)&v4[16]);
  OUTLINED_FUNCTION_6_10();
}

void iap2_assistiveTouch_startAssistiveTouchUpdateHandler_cold_1()
{
  OUTLINED_FUNCTION_3_11( (void *)&_mh_execute_header,  v0,  v1,  "StartAssistiveTouchUpdate: %@ infoRequested %d->%d pEndpoint=%p assistiveTouch=%p");
  OUTLINED_FUNCTION_6_10();
}

void iap2_assistiveTouch_stopAssistiveTouchUpdateHandler_cold_1(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)uint64_t v4 = 138413314;
  *(void *)&v4[4] = *(void *)(a1 + 8);
  *(_WORD *)&v4[12] = 1024;
  *(_DWORD *)&v4[14] = *(unsigned __int8 *)(a2 + 1);
  *(_WORD *)&v4[18] = 1024;
  OUTLINED_FUNCTION_5_15();
  OUTLINED_FUNCTION_3_11( (void *)&_mh_execute_header,  v2,  v3,  "StopAssistiveTouchUpdate: %@ infoRequested %d->%d pEndpoint=%p assistiveTouch=%p",  *(void *)v4,  *(void *)&v4[8],  *(unsigned int *)&v4[16]);
  OUTLINED_FUNCTION_6_10();
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_1()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_3()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_5()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_14()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_16()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_18()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_20()
{
}

void mfi4Auth_protocol_processIncomingMessageRelay_cold_22()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_1()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_3()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_5()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_7()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_9( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_11()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_12()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_13()
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_15( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_handle_iAP2RelayRemote_cold_20()
{
}

void mfi4Auth_relay_handle_iAP2RelaySucceeded_cold_1()
{
}

void mfi4Auth_relay_handle_iAP2RelaySucceeded_cold_3()
{
}

void mfi4Auth_relay_handle_iAP2RelaySucceeded_cold_5()
{
}

void mfi4Auth_relay_handle_iAP2RelayFailed_cold_1()
{
}

void mfi4Auth_relay_handle_iAP2RelayFailed_cold_3()
{
}

void mfi4Auth_relay_handle_iAP2RelayFailed_cold_5()
{
}

void mfi4Auth_relay_initMessage_DeviceiAP2RelayRemote_RequestAccessoryInfoUpdate_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_initMessage_DeviceiAP2RelayRemote_RequestAccessoryInfoUpdate_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_StartRelayForType_cold_1()
{
}

void mfi4Auth_relay_StartRelayForType_cold_3()
{
}

void mfi4Auth_relay_StartRelayForType_cold_7( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_relay_StartRelayForType_cold_11()
{
}

void mfi4Auth_relay_StartRelayForType_cold_14()
{
}

void mfi4Auth_relay_StartRelayForT56_cold_9( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_setSecureTunnelDataReceiveTypeHandler_cold_3()
{
}

void mfi4Auth_protocol_setSecureTunnelDataReceiveTypeHandler_cold_5()
{
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_1()
{
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_3()
{
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_8()
{
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_9()
{
}

void mfi4Auth_protocol_processOutgoingSecureTunnelDataForClient_cold_13()
{
}

void mfi4Auth_relay_initMessage_DeviceiAP2RelayRemote_TypeData_cold_1()
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_12( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _mfi4Auth_relay_handle_AccessoryInformationUpdate_cold_14( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void acc_platform_packetLogging_logEventVA_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Endpoint destroyed during logging", v1, 2u);
}

void acc_platform_packetLogging_logEventVA_cold_5(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void iAP2BuffPoolGetBuffSize_cold_1()
{
}

void iAP2BuffPoolInit_cold_1()
{
}

void iAP2BuffPoolCleanup_cold_1()
{
}

void iAP2BuffPoolGet_cold_1()
{
}

void iAP2BuffPoolReturn_cold_1()
{
}

void _addMediaItemAttributesToMessage_cold_1()
{
}

void _addMediaItemAttributesToMessage_cold_3()
{
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_2()
{
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_4()
{
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_6()
{
}

void iap2_nowPlaying_mediaItemArtworkUpdateHandler_cold_8(const __CFData *a1, os_log_s *a2)
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_1()
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_4()
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_6()
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_9( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_11()
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_13()
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_15()
{
}

void iap2_nowPlaying_playbackAttributesUpdateHandler_cold_17()
{
}

void _addplaybackAttributesToMessage_cold_1()
{
}

void _addplaybackAttributesToMessage_cold_3()
{
}

void iap2_nowPlaying_playbackQueueListChangedHandler_cold_1()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_1()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_2()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_3()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_4()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_5()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_6()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_7()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_10()
{
}

void iap2_nowPlaying_playbackQueueListInfoResponseHandler_cold_12()
{
}

void ___createFeature_block_invoke_cold_2()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Sending elapsed time update: %u ms for endpoint %@",  v2,  0x12u);
  OUTLINED_FUNCTION_2();
}

void ___createFeature_block_invoke_cold_4()
{
}

void ___createFeature_block_invoke_cold_6(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  if (!a1 || (uint64_t v4 = *(void *)(a1 + 8)) == 0) {
    uint64_t v4 = 0LL;
  }
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = obfuscatedPointer(a2);
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "iAP2 Now Playing elapsed time timer callback fired! %@, pFeature %p",  (uint8_t *)&v5,  0x16u);
  OUTLINED_FUNCTION_4();
}

void ___createFeature_block_invoke_cold_8()
{
}

void _continueElapsedTimeTimer_cold_1()
{
}

void _continueElapsedTimeTimer_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _continueElapsedTimeTimer_cold_5()
{
}

void _startNowPlayingUpdatesHandler_cold_1()
{
}

void _startNowPlayingUpdatesHandler_cold_12(CFArrayRef *a1, os_log_s *a2)
{
}

void _startNowPlayingUpdatesHandler_cold_14(CFArrayRef *a1, os_log_s *a2)
{
}

void _startNowPlayingUpdatesHandler_cold_16(uint64_t a1, uint64_t a2)
{
}

void _startNowPlayingUpdatesHandler_cold_18(uint64_t a1, uint64_t a2)
{
}

void _startNowPlayingUpdatesHandler_cold_20(uint64_t a1)
{
}

void _startNowPlayingUpdatesHandler_cold_21(uint64_t a1)
{
}

void _startNowPlayingUpdatesHandler_cold_22(uint64_t a1)
{
}

void _startNowPlayingUpdatesHandler_cold_23(uint64_t a1, uint64_t a2)
{
}

void _startNowPlayingUpdatesHandler_cold_25()
{
}

void _stopNowPlayingUpdatesHandler_cold_1()
{
}

void _setNowPlayingInfoHandler_cold_1()
{
}

void _setNowPlayingInfoHandler_cold_3()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "_setNowPlayingInfoHandler: autoChoosePBQListStartIndex=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void _setNowPlayingInfoHandler_cold_8()
{
}

void _handleFileTransferIDSent_cold_1()
{
}

void _handleFileTransferIDSent_cold_3()
{
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "Call Start pTransfer(ID=%u type=%d state=%d)",  v3,  0x14u);
  OUTLINED_FUNCTION_2();
}

void _handleFileTransferEnd_cold_1()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "%{public}@ _handleFileTransferEnd called with unexpected state: %d!",  v2,  0x12u);
  OUTLINED_FUNCTION_2();
}

void _handleFileTransferEnd_cold_4()
{
}

void __iAP2FileTransferSendBufferPacket_cold_1()
{
  __assert_rtn("__iAP2FileTransferSendBufferPacket", "iAP2FileTransfer.c", 190, "payloadLen <= sizeof(payload)");
}

void __iAP2FileTransferSendBufferPacket_cold_4()
{
}

void iAP2FileTransferAllocateBufferID_cold_2(unsigned __int8 a1, os_log_s *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "iAP2FileTransferAllocateBufferID";
  __int16 v4 = 1024;
  int v5 = 603;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s:%d Could not allocate buffer ID for transfer, session=%d",  (uint8_t *)&v2,  0x18u);
  OUTLINED_FUNCTION_2();
}

void iAP2FileTransferCreate_cold_1()
{
}

void iAP2FileTransferDelete_cold_1()
{
  OUTLINED_FUNCTION_12_3( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx) pBuffer=%hx buffSize=%lu",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_16_1();
}

void iAP2FileTransferCleanup_cold_1()
{
  OUTLINED_FUNCTION_12_3( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx) pBuffer=%hx buffSize=%lu",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_16_1();
}

void iAP2FileTransferStart_cold_1()
{
  __assert_rtn( "iAP2FileTransferStart",  "iAP2FileTransfer.c",  1121,  "payloadLen <= iAP2LinkGetMaxSendPayloadSize (fileXfer->link, NULL)");
}

void iAP2FileTransferSuccess_cold_1()
{
  OUTLINED_FUNCTION_6_11( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx buffID=0x%X Successful transfer, send Control Success",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_6_2();
}

void iAP2FileTransferSuccess_cold_3()
{
  OUTLINED_FUNCTION_12_3( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx) pBuffer=%hx buffSize=%lu",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_16_1();
}

void iAP2FileTransferResume_cold_1()
{
  OUTLINED_FUNCTION_6_11( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx buffID=0x%X Resume send",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_6_2();
}

void iAP2FileTransferResume_cold_3()
{
  OUTLINED_FUNCTION_6_11( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx buffID=0x%X Resume, send Control Start",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_6_2();
}

void iAP2FileTransferResume_cold_5()
{
  OUTLINED_FUNCTION_8_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx)",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_15_2();
}

void iAP2FileTransferCancel_cold_1()
{
}

void iAP2FileTransferCancel_cold_3()
{
  OUTLINED_FUNCTION_6_11( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx buffID=0x%X Send Control Cancel",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_6_2();
}

void iAP2FileTransferCancel_cold_6()
{
  OUTLINED_FUNCTION_8_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d fileXfer=%hx state=%d session=%u sentSize=%lu totalSize=%lu (endCB=%hx userInfo=%hx)",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_15_2();
}

void platform_usb_setUSBHostHIDInterface_cold_1()
{
}

void _getUSBHostPluginInstance_cold_1(os_log_s *a1)
{
  uint64_t v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformUSBHostPluginProtocol);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "[#USB] Could not find plugin conforming to %@!",  (uint8_t *)&v4,  0xCu);
}

void platform_usb_clearUSBHostHIDInterfaces_cold_1()
{
}

void platform_usb_configureUSBHostNCMInterface_cold_1()
{
}

void platform_usb_setNeedOutZlp_cold_1()
{
}

void configStream_endpoint_create_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "configStream initSession: ", v1, 2u);
}

void __configStream_endpoint_processIncomingData_block_invoke_cold_6(uint64_t a1, uint64_t a2, os_log_t log)
{
  if (a1 && *(void *)a1) {
    int v3 = *(_DWORD *)(*(void *)a1 + 24LL);
  }
  else {
    int v3 = 17;
  }
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "configStream processIncomingData: %{coreacc:ACCEndpoint_TransportType_t}d dataIn %@",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_2();
}

void _configStream_endpoint_sendNextClientRequest_cold_3(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16LL);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "configStream sendNextClientRequest for endpoint: %@",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_2();
}

void qiAuth_protocol_start_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_4_18((void *)&_mh_execute_header, v0, v1, "%s:%d result %d, role %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_initMsg_GET_DIGESTS_cold_2()
{
  LODWORD(OUTLINED_FUNCTION_4_14((void *)&_mh_execute_header, v2, (uint64_t)v2, "dataBuf is NULL!", v3) = 136315906;
  *(void *)((char *)&v3 + 4) = "qiAuth_protocol_initMsg_GET_DIGESTS";
  OUTLINED_FUNCTION_15_3();
  LOWORD(OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  v0,  v1,  "[AccAuth][1Way] sendCertChainRequestOrChallenge: sessionID %d, role %d, needCertChainInfo %d \n",  v2,  v3, v4) = 0;
  HIWORD(OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  v0,  v1,  "[AccAuth][1Way] sendCertChainRequestOrChallenge: sessionID %d, role %d, needCertChainInfo %d \n",  v2,  v3, v4) = v0;
  LOWORD(OUTLINED_FUNCTION_4_3( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d",  v1,  v2,  v3,  v4, v5) = v0;
  HIWORD(OUTLINED_FUNCTION_4_3( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d",  v1,  v2,  v3,  v4, v5) = v1;
  OUTLINED_FUNCTION_4_18( (void *)&_mh_execute_header,  v1,  v2,  "%s:%d version %d, slotMask 0x%x",  (const char *)v3,  (unint64_t)"qiAuth_protocol_initMsg_GET_DIGESTS" >> 32,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_timeoutForRequest_cold_1(uint64_t a1, int a2, os_log_s *a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 12);
  qiAuth_protocol_msgTypeString(a2);
  *(_DWORD *)uint8_t v8 = 136316162;
  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)&v8[7] = 2611;
  v8[9] = v6;
  int v9 = v5;
  __int16 v10 = v6;
  int v11 = a2;
  __int16 v12 = 2080;
  uint64_t v13 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s:%d TX: Unexpected MsgType!!! ver %d, msgType %d(%s)",  (uint8_t *)v8,  0x28u);
}

void _qiAuth_protocol_timeoutCallback_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_4_18( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d Unknown role(%d)! can't handle timer %d!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_timeoutCallback_cold_3()
{
}

void qiAuth_protocol_processIncomingData_cold_2(int a1, os_log_s *a2)
{
  *(_DWORD *)uint64_t v7 = 136315906;
  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)&v7[7] = 425;
  v7[9] = v4;
  int v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_5_4((void *)&_mh_execute_header, a2, v6, "%s:%d SendData, outMsgType %u(%s)", (uint8_t *)v7);
}

void qiAuth_protocol_processIncomingData_cold_4()
{
  *(_DWORD *)__int16 v4 = 136316674;
  OUTLINED_FUNCTION_14_3();
  *(_DWORD *)&v4[7] = 316;
  v4[9] = v0;
  int v5 = v1;
  __int16 v6 = v0;
  int v7 = 0;
  __int16 v8 = v0;
  int v9 = 0;
  __int16 v10 = 2080;
  int v11 = "UNKNOWN";
  __int16 v12 = v0;
  int v13 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s:%d Unknown Role! %d, ver %d, msgType %d(%s), dataInLen %d",  (uint8_t *)v4,  0x34u);
}

void _qiAuth_protocol_handleResponse_DIGESTS_cold_3()
{
  v2[0] = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_7_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_handleResponse_CERTIFICATE_cold_2()
{
}

void _qiAuth_protocol_handleResponse_CERTIFICATE_cold_7()
{
  v2[0] = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_7_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_handleResponse_CHALLENGE_AUTH_cold_7()
{
  v2[0] = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_7_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_handleResponse_ERROR_cold_2()
{
  LODWORD(OUTLINED_FUNCTION_4_3( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "Make sure you have called init_logging_signposts() / init_logging()!\n module %d, gLogSignpostObjects: %p, gNumLogSignpostObjects: %d",  v1,  v2,  v3,  v4, v5) = 136316162;
  OUTLINED_FUNCTION_10_6();
  LOWORD(OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v1,  v2,  "platform_connectionInfo_copyUserPrivateKey: unexpected protocol: %s",  v3,  v4,  v5,  v6, v7) = 0;
  HIWORD(OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v1,  v2,  "platform_connectionInfo_copyUserPrivateKey: unexpected protocol: %s",  v3,  v4,  v5,  v6, v7) = v0;
  LOWORD(OUTLINED_FUNCTION_1_1( (void *)&_mh_execute_header,  v2,  v3,  "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message",  v4,  v5,  v6,  v7, v8) = v0;
  HIWORD(OUTLINED_FUNCTION_1_1( (void *)&_mh_execute_header,  v2,  v3,  "Subparam ID: %d parse error in Param ID: %d for Msg ID: 0x%04X - ignoring message",  v4,  v5,  v6,  v7, v8) = v1;
  OUTLINED_FUNCTION_8_11( (void *)&_mh_execute_header,  v2,  v3,  "%s:%d RX: ERROR msg(%d): Unknown errorCode 0x%02X, errorData 0x%02X",  v5,  v6,  v7,  v8,  v4);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_handleResponse_ERROR_cold_8()
{
  v2[0] = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_7_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_authStateString_cold_1()
{
  *(_DWORD *)int v4 = 136315906;
  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)&v4[7] = 756;
  v4[9] = 2080;
  uint64_t v5 = v0;
  __int16 v6 = v1;
  int v7 = v2;
  OUTLINED_FUNCTION_5_4((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%d result %s, authState %d", (uint8_t *)v4);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_saveDigest_cold_2()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136316162;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_11( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d Unknown/Invalid Role! %d, result %d, slot %d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_saveCertNextSegment_cold_3()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136316162;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_11( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d Unknown/Invalid Role! %d, result %d, slot %d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_calculateChallengeHash_cold_2()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, currentSlot %d, failed to hash TBSAuth!!!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_calculateChallengeHash_cold_4()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, currentSlot %d, failed to get compose TBSAuth !!!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_calculateChallengeHash_cold_6()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, currentSlot %d, failed to create temp CHALLENGE_AUTH message for TBSAuth !!!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_calculateChallengeHash_cold_8()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, currentSlot %d, failed to get certificate digest !!!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_calculateChallengeHash_cold_10()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, currentSlot %d, We have not received a certificate digest !!!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_protocol_calculateChallengeHash_cold_12()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, currentSlot %d, We have not received a valid certificateAuth message !!!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_getCachedCertLengthFromHeader_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "_qiAuth_protocol_getCachedCertLengthFromHeader";
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_4_18( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d result %d, slot %d",  (const char *)v2,  (unint64_t)"_qiAuth_protocol_getCachedCertLengthFromHeader" >> 32,  v3,  v4);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_getCachedCertLengthFromHeader_cold_3()
{
}

void _qiAuth_protocol_finishAuth_cold_2()
{
}

void _qiAuth_protocol_finishAuth_cold_3()
{
}

void _qiAuth_protocol_finishAuth_cold_5()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_9_9( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d We don't have the CHALLENGE request info anymore to calculate hash!!!  slot %d, lastMsgSent %d",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_finishAuth_cold_8()
{
}

void _qiAuth_protocol_finishAuth_cold_10()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_4_18((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_6_2();
}

void _qiAuth_protocol_finishAuth_cold_12()
{
  v2[0] = 136315906;
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_7_10((void *)&_mh_execute_header, v0, v1, "%s:%d role %d, currentSlot %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_6_2();
}

void iap2_features_registerMessageHandlers_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_features_registerMessageHandlers_cold_3(uint8_t *a1, uint64_t a2, int *a3, os_log_s *a4)
{
  int v4 = _kiAP2FeatureInfoEntries[4 * a2];
  *(_DWORD *)a1 = 67109120;
  *a3 = v4;
  OUTLINED_FUNCTION_3_13( (void *)&_mh_execute_header,  "Registering message handlers for %{coreacc:iAP2Feature_t}d...",  a1,  a4);
}

void iap2_features_registerIdentificationParamHandlers_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_features_registerIdentificationParamHandlers_cold_3( uint8_t *a1, uint64_t a2, int *a3, os_log_s *a4)
{
  int v4 = _kiAP2FeatureInfoEntries[4 * a2];
  *(_DWORD *)a1 = 67109120;
  *a3 = v4;
  OUTLINED_FUNCTION_3_13( (void *)&_mh_execute_header,  "Registering identification param handlers for %{coreacc:iAP2Feature_t}d...",  a1,  a4);
}

void iap2_features_createFeature_cold_2(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Error creating feature: %{coreacc:iAP2Feature_t}d!",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_5_1();
}

void iap2_sessionRouter_processSessionData_cold_2(uint64_t a1, os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Received incoming packet for session type: %{coreacc:iAP2PacketServiceType_t}d",  (uint8_t *)v3,  8u);
}

void iAP2FSMCreate_cold_1()
{
}

void iAP2FSMHandleEvent_cold_2()
{
}

void iAP2FSMHandleEvent_cold_3()
{
}

void _startCallStateUpdatesHandler_cold_1(CFSetRef *a1, os_log_s *a2)
{
}

void _startCallStateUpdatesHandler_cold_4(uint64_t a1)
{
}

void _startCallStateUpdatesHandler_cold_5()
{
}

void _stopCallStateUpdatesHandler_cold_1()
{
}

void _startCommunicationsUpdatesHandler_cold_4()
{
}

void _stopCommunicationsUpdatesHandler_cold_1()
{
}

void _initiateCallHandler_cold_1()
{
}

void _initiateCallHandler_cold_2()
{
}

void _initiateCallHandler_cold_4()
{
}

void _initiateCallHandler_cold_6()
{
}

void _acceptCallHandler_cold_2()
{
}

void _acceptCallHandler_cold_3()
{
}

void _endCallHandler_cold_2()
{
}

void _holdStatusUpdateHandler_cold_1()
{
}

void _muteStatusUpdateHandler_cold_1()
{
}

void _sendDTMFHandler_cold_1()
{
}

void _startListUpdatesHandler_cold_6(uint64_t a1, uint64_t a2)
{
}

void _startListUpdatesHandler_cold_11(uint64_t a1, uint64_t a2)
{
}

void _startListUpdatesHandler_cold_12(uint64_t a1)
{
}

void _startListUpdatesHandler_cold_13(uint64_t a1)
{
}

void iap2_communications_callStateUpdateHandler_cold_1()
{
}

void iap2_communications_callStateUpdateHandler_cold_3()
{
}

void iap2_communications_communicationsUpdateHandler_cold_1()
{
}

void iap2_communications_communicationsUpdateHandler_cold_3()
{
}

void _recentsListUpdateHandler_cold_1()
{
}

void _convertACCCallServiceToiAP2CallService_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iAP2MsgGetNextParamWithError_cold_1(int a1, int a2, os_log_t log)
{
  int v3 = 136315906;
  uint64_t v4 = "iAP2MsgGetNextParamWithError";
  __int16 v5 = 1024;
  int v6 = 406;
  __int16 v7 = 1024;
  int v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s:%d reached end of parameter (%d bytes), grplen %d\n",  (uint8_t *)&v3,  0x1Eu);
}

void iAP2MsgGetNextParamWithError_cold_3(int a1, os_log_s *a2)
{
  int v2 = 136315650;
  int v3 = "iAP2MsgGetNextParamWithError";
  __int16 v4 = 1024;
  int v5 = 411;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s:%d reached end of message buffer (%d bytes)\n",  (uint8_t *)&v2,  0x18u);
  OUTLINED_FUNCTION_2();
}

void _getSystemPluginInstance_cold_1(os_log_s *a1)
{
  int v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformSystemPluginProtocol);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "[#System] Could not find plugin conforming to %@!",  (uint8_t *)&v4,  0xCu);
}

void mfi4Auth_util_packIntoTunnelDataiAP2Msg_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_util_packIntoTunnelDataiAP2Msg_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_util_packIntoTunnelDataiAP2Msg_cold_5( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_util_unpackFromTunnelDataiAP2Msg_cold_4(uint64_t a1, os_log_s *a2)
{
  v4[0] = 67109376;
  v4[1] = iAP2MsgGetMsgID(a1);
  __int16 v5 = 1024;
  int MsgLen = iAP2MsgGetMsgLen(a1);
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "mfi4Auth_util_unpackFromTunnelDataiAP2Msg: message 0x%04X, length %d",  (uint8_t *)v4,  0xEu);
}

void accAuthProtocol_endpoint_create_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pProtocolEndpoint = NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void accAuthProtocol_endpoint_publish_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _accAuthProtocol_endpoint_sendAuthSetupStart_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __iAP2BuffPoolGetSendPacket_cold_1()
{
}

void __iAP2BuffPoolGetSendPacket_cold_2()
{
}

void __iAP2BuffPoolGetRecvPacket_cold_1()
{
}

void __iAP2BuffPoolGetRecvPacket_cold_2()
{
}

void qiAuth_util_generateNonce_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  *(void *)((char *)&v2 + 4) = "qiAuth_util_generateNonce";
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_4_18( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d role %d, nonceSize %d",  (const char *)v2,  (unint64_t)"qiAuth_util_generateNonce" >> 32,  v3,  v4);
  OUTLINED_FUNCTION_6_2();
}

void qiAuth_util_verifyCertificateChain_cold_2()
{
}

void qiAuth_util_verifyChallengeSignature_cold_2()
{
}

void qiAuth_util_verifyChallengeSignature_cold_5()
{
}

void qiAuth_util_policy_preferredSlot_cold_1()
{
}

void qiAuth_util_policy_challengeFirst_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void qiAuth_util_callbackOnTimer_cold_2()
{
}

void qiAuth_util_callbackOnTimer_cold_4()
{
}

void qiAuth_util_cancelTimer_cold_1()
{
}

void acc_accInfo_updateAccessoryInfoWithDictionary_cold_1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  uint64_t v11 = a1[9];
  uint64_t v12 = a1[10];
  uint64_t v13 = a1[11];
  uint64_t v15 = a1[12];
  uint64_t v14 = a1[13];
  int v16 = 136318978;
  __int16 v17 = "acc_accInfo_updateAccessoryInfoWithDictionary";
  __int16 v18 = 1024;
  int v19 = 381;
  __int16 v20 = 2112;
  uint64_t v21 = v2;
  __int16 v22 = 2112;
  uint64_t v23 = v3;
  __int16 v24 = 2112;
  uint64_t v25 = v4;
  __int16 v26 = 2112;
  uint64_t v27 = v5;
  __int16 v28 = 2112;
  uint64_t v29 = v6;
  __int16 v30 = 2112;
  uint64_t v31 = v7;
  __int16 v32 = 2112;
  uint64_t v33 = v8;
  __int16 v34 = 2112;
  uint64_t v35 = v9;
  __int16 v36 = 2112;
  uint64_t v37 = v11;
  __int16 v38 = 2112;
  uint64_t v39 = v10;
  __int16 v40 = 2112;
  uint64_t v41 = v12;
  __int16 v42 = 2112;
  uint64_t v43 = v13;
  __int16 v44 = 2112;
  uint64_t v45 = v15;
  __int16 v46 = 2112;
  uint64_t v47 = v14;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[#Accessory Info] %s:%d Set accessory info: name: %@, manufacturer: %@, model: %@, serialNumber: %@, hardwareVersion : %@, firmwareVersionActive: %@, firmwareVersionPending: %@, ppid: %@ regionCode: %@, deviceUID: %@, deviceCompatibi lity: %@, vid/pid: %@/%@, accessoryPlatformID: %@",  (uint8_t *)&v16,  0x9Eu);
}

void _getPluginInstance_cold_1(os_log_s *a1)
{
  uint64_t v2 = NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___ACCPlatformLightningPluginProtocol);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  a1,  OS_LOG_TYPE_ERROR,  "[#Lightning] Could not find plugin conforming to %@!",  (uint8_t *)&v4,  0xCu);
}

void _sendStopOOBBTPairing_cold_1()
{
}

void iap2_identification_releaseIdentInfo_cold_1()
{
}

void iap2_identification_checkIdentificationInfoFeatures_cold_1()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pFeatureInfoEntries == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void _addRejectParam_cold_1()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pIdentInfo == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_processStringParam_cold_1()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pStr == NULL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_cbIdentificationInfoParams_cold_2()
{
}

void iap2_identification_cbIdentificationInfoParams_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_identification_cbIdentificationInfoParams_cold_6()
{
}

void iap2_identification_getParamHandler_cold_1()
{
  OUTLINED_FUNCTION_6_0( (void *)&_mh_execute_header,  v0,  v1,  "iAP2IdentificationParamHandler_t = NULL for param ID: %d!",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_releaseRejectMessage_cold_1()
{
}

void iap2_identification_checkMsgIDList_cold_1()
{
  OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "pIdentInfo->messagesRcvdFromDevSet = NULL",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_checkMsgIDList_cold_3()
{
  OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "pIdentInfo->messagesSentByAccSet = NULL",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_checkRequiredTransportComponentParam_cold_1()
{
}

void iap2_identification_identificationInfoHandler_cold_5()
{
  OUTLINED_FUNCTION_6_0( (void *)&_mh_execute_header,  v0,  v1,  "Error parsing an identification component, aborting!\n(One of the param feature handlers returned error: %d)",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_identificationInfoHandler_cold_7()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "identInfoSet == false!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void iap2_identification_copyMacAddressForComponentID_cold_1(unsigned __int16 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "iap2_identification_copyMacAddressForComponentID: componentID=%d macAddr=%@",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_2();
}

void iap2_identification_setParamHandler_cold_1()
{
}

void iap2_identification_setParamHandler_cold_3()
{
}

void iap2_identification_setRequiredIdentificationParam_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iap2_identification_setRequiredIdentificationParam_cold_3()
{
}

void acc_protocolParser_detectProtocol_cold_1(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 0xFFFF;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Incoming data length is larger than max buffer size of %u - discarding data!",  (uint8_t *)v1,  8u);
}

void _runFSM_cold_1(unsigned __int8 *a1, unsigned __int16 *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Current byte: %02X, index: %d",  (uint8_t *)v5,  0xEu);
  OUTLINED_FUNCTION_2();
}

void iap2_messageHandlers_setHandler_cold_1(unsigned __int16 a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Added message handler for ID: 0x%04X",  (uint8_t *)v2,  8u);
}

void iap2_messageHandlers_setHandler_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Initialized message handler dictionary!",  v1,  2u);
}

void __t56_endpoint_processIncomingData_block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 52);
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *a2;
  int v6 = 136315906;
  int v7 = "t56_endpoint_processIncomingData_block_invoke";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed to process incoming message!!! hdr 0x%02X, (%d bytes) %@",  (uint8_t *)&v6,  0x22u);
  OUTLINED_FUNCTION_6_2();
}

void _t56_endpoint_handleMessage_cold_2()
{
}

void t56_endpoint_sendOutgoingData_cold_1()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pDataOut = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void t56_endpoint_sendOutgoingData_cold_2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "dataOutLen = 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void t56_endpoint_sendOutgoingData_cold_3(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 136315650;
  uint64_t v5 = "t56_endpoint_sendOutgoingData";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s: pProtocolEndpoint %@, dataOutLen %d",  (uint8_t *)&v4,  0x1Cu);
  OUTLINED_FUNCTION_6_2();
}

void t56_endpoint_sendOutgoingDataCF_cold_2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "dataOut = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void t56_endpoint_sendOutgoingDataCF_cold_3()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint->pEndpoint = NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void t56_endpoint_sendOutgoingDataCF_cold_4(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "t56_endpoint_sendOutgoingDataCF";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: parentEndpoint NULL, dataOut %@",  (uint8_t *)&v2,  0x16u);
  OUTLINED_FUNCTION_2();
}

void t56_endpoint_sendOutgoingDataCF_cold_6()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: parentEndpoint %@, dataOut %@", v2);
  OUTLINED_FUNCTION_6_2();
}

void t56_endpoint_sendOutgoingDataCF_cold_8()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: pProtocolEndpoint %@, dataOut %@", v2);
  OUTLINED_FUNCTION_6_2();
}

void mfi4Auth_protocol_decryptIncomingData_cold_1()
{
}

void mfi4Auth_protocol_decryptIncomingData_cold_3()
{
}

void mfi4Auth_protocol_decryptIncomingData_cold_4()
{
}

void mfi4Auth_protocol_decryptIncomingData_cold_5()
{
}

void mfi4Auth_protocol_decryptIncomingData_cold_6()
{
}

void mfi4Auth_protocol_decryptIncomingData_cold_10()
{
}

void logObjectForModule_cold_1_0()
{
}

void mfi4Auth_protocol_decryptPayload_cold_1()
{
}

void mfi4Auth_protocol_decryptPayload_cold_2()
{
}

void mfi4Auth_protocol_decryptPayload_cold_3()
{
}

void mfi4Auth_protocol_decryptPayload_cold_9()
{
}

void mfi4Auth_protocol_encryptOutgoingData_cold_1()
{
}

void mfi4Auth_protocol_encryptOutgoingData_cold_2()
{
}

void mfi4Auth_protocol_encryptOutgoingData_cold_3()
{
}

void mfi4Auth_protocol_encryptOutgoingData_cold_5()
{
}

void mfi4Auth_protocol_encryptOutgoingData_cold_9()
{
}

void mfi4Auth_protocol_encryptPayload_cold_1()
{
}

void mfi4Auth_protocol_encryptPayload_cold_3()
{
}

void mfi4Auth_protocol_encryptPayload_cold_6()
{
}

void mfi4Auth_protocol_authSetupStart_cold_1()
{
}

void mfi4Auth_protocol_authSetupStart_cold_2()
{
}

void mfi4Auth_protocol_authSetupStart_cold_3()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthSetup_cold_1()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthSetup_cold_2()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthSetup_cold_3()
{
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_1()
{
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_2()
{
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_3()
{
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_4()
{
}

void mfi4Auth_protocol_handleAuthSessionClose_cold_6()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_3()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_4()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_5()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_6()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_7()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_9( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_11()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_12( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_13()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_14( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_15()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_16()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_17()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_18()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_19()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_20()
{
}

void mfi4Auth_protocol_handle_AuthSetup_cold_21()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_1()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_2()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_3()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthChallengeResponse_cold_4()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthStart_cold_1()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthStart_cold_2()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthStart_cold_3()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_1()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_2()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_3()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_4()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_8()
{
  OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "mfi4Auth_protocol_initSigmaContext: key_share_size != 33",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void mfi4Auth_protocol_initSigmaContext_cold_10()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_13()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_14()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_15()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_17()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_19()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_21()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_22()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_23()
{
}

void mfi4Auth_protocol_initSigmaContext_cold_27()
{
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_1()
{
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_3()
{
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_4()
{
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_5()
{
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_6()
{
}

void mfi4Auth_protocol_initMessage_AuthStart_cold_7()
{
}

void mfi4Auth_protocol_handle_AuthState_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthState_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthState_cold_4()
{
}

void mfi4Auth_protocol_handle_AuthSetupFailed_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthSetupFailed_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthSetupFailed_cold_3()
{
}

void mfi4Auth_protocol_handle_AuthStart_cold_2()
{
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_1()
{
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_2()
{
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_3(unsigned __int8 a1, os_log_s *a2)
{
  int v2 = 136316162;
  uint64_t v3 = "mfi4Auth_protocol_handle_RequestAuthCert";
  __int16 v4 = 1024;
  int v5 = 744;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 1024;
  int v9 = 1;
  __int16 v10 = 1024;
  int v11 = 2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s:%d paramMask 0x%x, CertHash paramMask 0x%x, CertKeyID paramMask 0x%x ",  (uint8_t *)&v2,  0x24u);
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_5()
{
}

void mfi4Auth_protocol_handle_RequestAuthCert_cold_6()
{
}

void mfi4Auth_protocol_initMessage_AuthCert_cold_1()
{
}

void mfi4Auth_protocol_initMessage_AuthCert_cold_2()
{
}

void mfi4Auth_protocol_initMessage_AuthCert_cold_4()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_3()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_5()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_6()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_8()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_11()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_14()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_15()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_16()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_17()
{
}

void mfi4Auth_protocol_handle_AuthCert_cold_18()
{
  OUTLINED_FUNCTION_6_0( (void *)&_mh_execute_header,  v0,  v1,  "mfi4Auth_protocol_handle_AuthCert: count=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void mfi4Auth_protocol_initMessage_RequestAuthCert_cold_2()
{
}

void mfi4Auth_protocol_initMessage_RequestAuthCert_cold_3()
{
}

void mfi4Auth_protocol_validateCertChain_cold_1()
{
}

void mfi4Auth_protocol_validateCertChain_cold_3()
{
}

void mfi4Auth_protocol_validateCertChain_cold_4()
{
}

void mfi4Auth_protocol_validateCertChain_cold_8()
{
}

void mfi4Auth_protocol_validateSignature_cold_1()
{
}

void mfi4Auth_protocol_validateSignature_cold_2()
{
}

void mfi4Auth_protocol_validateSignature_cold_3()
{
}

void mfi4Auth_protocol_validateSignature_cold_4()
{
}

void mfi4Auth_protocol_validateSignature_cold_5()
{
}

void mfi4Auth_protocol_validateSignature_cold_7()
{
}

void mfi4Auth_protocol_validateSignature_cold_8()
{
}

void mfi4Auth_protocol_validateSignature_cold_9()
{
}

void mfi4Auth_protocol_validateSignature_cold_10()
{
}

void mfi4Auth_protocol_validateSignature_cold_11()
{
}

void mfi4Auth_protocol_validateSignature_cold_12()
{
}

void mfi4Auth_protocol_validateSignature_cold_14()
{
}

void mfi4Auth_protocol_validateSignature_cold_15()
{
}

void mfi4Auth_protocol_initMessage_AuthenticationSucceeded_cold_1()
{
}

void mfi4Auth_protocol_initMessage_AuthenticationSucceeded_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthFinish_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthFinish_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthFinish_cold_3()
{
}

void mfi4Auth_protocol_handle_AuthFinish_cold_4()
{
}

void mfi4Auth_protocol_handle_AuthChallengeResponse_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthChallengeResponse_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthChallengeResponse_cold_3()
{
}

void mfi4Auth_protocol_handle_AuthenticationReset_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthenticationReset_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthenticationReset_cold_4()
{
}

void mfi4Auth_protocol_handle_AuthenticationFailed_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthenticationFailed_cold_2()
{
}

void mfi4Auth_protocol_handle_AuthenticationFailed_cold_3()
{
}

void mfi4Auth_protocol_handle_AuthenticationSucceeded_cold_1()
{
}

void mfi4Auth_protocol_handle_AuthenticationSucceeded_cold_2()
{
}

void mfi4Auth_protocol_initIdentity_cold_2()
{
}

void mfi4Auth_protocol_initIdentity_cold_3()
{
}

void mfi4Auth_protocol_initIdentityCerts_cold_2()
{
}

void mfi4Auth_protocol_initIdentityCerts_cold_3()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_1()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_3()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_4()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_5()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_8()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_9()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_11()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_12()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_13()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_16()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_17()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_18()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_19()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_20()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_22()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_24()
{
}

void mfi4Auth_protocol_processIncomingMessage_cold_27()
{
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_1()
{
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_3()
{
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_4()
{
}

void mfi4Auth_protocol_processIncomingMessageExtra_cold_9()
{
}

void t56_protocol_init_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_4_14((void *)&_mh_execute_header, v2, (uint64_t)v2, "dataBuf is NULL!", v3) = 136315906;
  OUTLINED_FUNCTION_12_0();
  LOWORD(OUTLINED_FUNCTION_1( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  v1,  v2,  v3,  v4, v5) = 0;
  HIWORD(OUTLINED_FUNCTION_1( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  v1,  v2,  v3,  v4, v5) = v0;
  LOWORD(OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "processIncomingMessageExtra: authSession shuttingDown",  v2,  v3,  v4,  v5, v6) = v0;
  HIWORD(OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "processIncomingMessageExtra: authSession shuttingDown",  v2,  v3,  v4,  v5, v6) = v1;
  OUTLINED_FUNCTION_4_18((void *)&_mh_execute_header, v1, v2, "%s:%d result %d, role %dX", v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_2();
}

void t56_protocol_start_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  v0,  v1,  "[AccAuth][1Way] sendCertChainRequestOrChallenge: sessionID %d, role %d, needCertChainInfo %d \n",  v2,  v3, v4) = 136315906;
  OUTLINED_FUNCTION_14_3();
  LOWORD(OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "processIncomingMessageExtra: authSession shuttingDown",  v2,  v3,  v4,  v5, v6) = 0;
  HIWORD(OUTLINED_FUNCTION_4_2( (void *)&_mh_execute_header,  v0,  v1,  "processIncomingMessageExtra: authSession shuttingDown",  v2,  v3,  v4,  v5, v6) = v0;
  LOWORD(OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v1,  v2,  "platform_connectionInfo_copyUserPrivateKey: unexpected protocol: %s",  v3,  v4,  v5,  v6, v7) = v0;
  HIWORD(OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v1,  v2,  "platform_connectionInfo_copyUserPrivateKey: unexpected protocol: %s",  v3,  v4,  v5,  v6, v7) = v1;
  OUTLINED_FUNCTION_4_18((void *)&_mh_execute_header, v2, v3, "%s:%d result %d, role %d", v4, v5, v6, v7);
  OUTLINED_FUNCTION_6_2();
}

void t56_protocol_timeoutForRequest_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 12);
  else {
    int v4 = off_1001FE390[a2 - 1];
  }
  int v5 = 136316162;
  int v6 = "t56_protocol_timeoutForRequest";
  __int16 v7 = 1024;
  int v8 = 975;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = a2;
  __int16 v13 = 2080;
  uint64_t v14 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s:%d Device: Unexpected MsgType!!! ver %d, msgType %d(%s)",  (uint8_t *)&v5,  0x28u);
  OUTLINED_FUNCTION_6_2();
}

void _T56Protocol_timeoutCallback_cold_1()
{
  LODWORD(OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, v0, v1, "timeDifferenceMS: %llu", v2) = 136315906;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_10_7();
  HIWORD(OUTLINED_FUNCTION_1( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  v1,  v2,  v3,  v4, v5) = v0;
  OUTLINED_FUNCTION_4_18( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d Unknown role(%d)! can't handle timer %d!",  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_6_2();
}

void _T56Protocol_timeoutCallback_cold_3()
{
  *(_DWORD *)int v3 = 136315650;
  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)&int v3[7] = 617;
  v3[9] = v0;
  int v4 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s:%d Device: Unhandled timeoutType %d !!!",  (uint8_t *)v3,  0x18u);
  OUTLINED_FUNCTION_2();
}

void t56_protocol_processIncomingData_cold_2()
{
  *(_DWORD *)int v4 = 136315906;
  OUTLINED_FUNCTION_14_3();
  *(_DWORD *)&v4[7] = 350;
  v4[9] = v0;
  int v5 = v1;
  __int16 v6 = 2080;
  uint64_t v7 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s:%d SendData, outMsgType %u(%s)",  (uint8_t *)v4,  0x22u);
  OUTLINED_FUNCTION_6_2();
}

void t56_protocol_processIncomingData_cold_4()
{
  *(_DWORD *)os_log_t v3 = 136316674;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_10_7();
  *(_DWORD *)&v3[13] = 0;
  v3[15] = v0;
  int v4 = 0;
  __int16 v5 = 2080;
  __int16 v6 = "UNKNOWN";
  __int16 v7 = v0;
  int v8 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s:%d Unknown Role! %d, ver %d, msgType %d(%s), dataInLen %d",  (uint8_t *)v3,  0x34u);
}

void _t56_protocol_handleResponse_SESSION_RSP_cold_4()
{
}

void _t56_protocol_handleResponse_DISCOVER_RSP_cold_6()
{
}

void _t56_protocol_handleResponse_DATA_cold_7()
{
}

void _t56_protocol_handleResponse_STATUS_cold_4()
{
}

void _t56_protocol_handleRequest_SESSION_cold_4()
{
}

void _t56_protocol_handleRequest_DISCOVER_cold_3()
{
}

void _t56_protocol_handleRequest_POLL_cold_3()
{
}

void _t56_protocol_handleRequest_DATA_cold_4()
{
}

void _t56_protocol_handleRequest_TERMINATE_cold_4()
{
}

void t56_protocol_initMsg_DISCOVER_cold_2()
{
}

void t56_protocol_initMsg_POLL_cold_2()
{
  v1[0] = 136315394;
  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 1328;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d enter", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

void _checkIdentificationInfo_cold_1_4()
{
}

void _checkIdentificationInfo_cold_3_1()
{
}

void _checkIdentificationInfo_cold_5_0()
{
}

void _hidComponentFunctionType_cold_1()
{
}

void _hidComponentFunctionType_cold_2()
{
}

void _hidComponentFunctionType_cold_3(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4_14((void *)&_mh_execute_header, a3, (uint64_t)a3, "hidComponent is NULL", a1);
}

void _parseiAPHIDComponentIdentificationParams_cold_1()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint == NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void _parseiAPHIDComponentIdentificationParams_cold_2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pFeature == NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void _parseUSBHostHIDComponentIdentificationParams_cold_3()
{
}

void _parseNativeBTHIDComponentIdentificationParams_cold_2()
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "pProtocolEndpoint->pEndpoint == NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_1();
}

void mfi4Auth_protocol_initSessionCommon_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void iAP2LinkDeviceActionAttach_cold_1()
{
}

void iAP2LinkDeviceActionAttach_cold_2()
{
}

void iAP2LinkDeviceActionSendResetSYNACK_cold_1()
{
}

void iAP2LinkDeviceActionSendResetSYNACK_cold_2()
{
}

void iAP2LinkDeviceActionSendDetect_cold_1()
{
}

void iAP2LinkDeviceActionSendDetect_cold_2()
{
}

void iAP2LinkDeviceActionSendRST_cold_1()
{
}

void iAP2LinkDeviceActionSendRST_cold_2()
{
}

void iAP2LinkDeviceActionSendSYNACK_cold_1()
{
}

void iAP2LinkDeviceActionSendSYNACK_cold_2()
{
}

void iAP2LinkDeviceActionResendSYNACK_cold_1()
{
}

void iAP2LinkDeviceActionResendSYNACK_cold_2()
{
}

void iAP2LinkDeviceActionHandleMaxRetries_cold_1()
{
}

void iAP2LinkDeviceActionHandleMaxRetries_cold_2()
{
}

void iAP2LinkDeviceActionNotifyConnection_cold_1()
{
}

void iAP2LinkDeviceActionNotifyConnection_cold_2()
{
}

void iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled_cold_1()
{
}

void iAP2LinkDeviceActionSendRSTWithNewChecksumEnabled_cold_2()
{
}

void iAP2LinkDeviceActionSendSuspend_cold_1()
{
}

void iAP2LinkDeviceActionSendSuspend_cold_2()
{
}

void iAP2LinkDeviceActionSendResume_cold_1()
{
}

void iAP2LinkDeviceActionSendResume_cold_2()
{
}

void iap2_voiceOver_informationHandler_cold_4()
{
  OUTLINED_FUNCTION_4_5((void *)&_mh_execute_header, v0, v1, "informationHandler %@, parm type=%d");
  OUTLINED_FUNCTION_2();
}

void iap2_endpoint_create_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, a1, a3, "pProtocolEndpoint = NULL", a5, a6, a7, a8, 0);
}

void __iap2_endpoint_processIncomingData_block_invoke_cold_1(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_16((void *)&_mh_execute_header, (int)a2, a3, "iAP2 packet complete!", a1);
}

void __iap2_endpoint_processIncomingData_block_invoke_cold_2(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3_16((void *)&_mh_execute_header, (int)a2, a3, "iAP2 packet NOT complete.", a1);
}

void iAP2LinkActionNone_cold_1()
{
}

void iAP2LinkActionNone_cold_2()
{
}

void iAP2LinkActionHandleACK_cold_1()
{
}

void iAP2LinkActionHandleACK_cold_2()
{
}

void iAP2LinkActionSendData_cold_1()
{
}

void iAP2LinkActionSendData_cold_2()
{
}

void iAP2LinkProcessOutQueue_cold_1()
{
}

void iAP2LinkActionDetach_cold_1()
{
}

void iAP2LinkActionDetach_cold_2()
{
}

void iAP2LinkActionSendACK_cold_1()
{
}

void iAP2LinkActionSendACK_cold_2()
{
}

void iAP2LinkActionSendACK_cold_3()
{
}

void iAP2LinkActionSendACK_cold_4()
{
}

void iAP2LinkActionSendACK_cold_5()
{
}

void iAP2LinkActionResendMissing_cold_1()
{
}

void iAP2LinkActionResendMissing_cold_2()
{
}

void iAP2LinkActionResendData_cold_1()
{
}

void iAP2LinkActionResendData_cold_2()
{
}

void iAP2LinkActionHandleData_cold_1()
{
}

void iAP2LinkActionHandleData_cold_2()
{
}

void iAP2LinkIsNoRetransmit_cold_1(unsigned __int16 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *(unsigned __int16 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 2);
  int v6 = *(unsigned __int8 *)(a2 + 3);
  int v7 = 136316418;
  int v8 = "iAP2LinkIsNoRetransmit";
  __int16 v9 = 1024;
  int v10 = 2716;
  __int16 v11 = 1024;
  int v12 = v3;
  __int16 v13 = 1024;
  int v14 = v4;
  __int16 v15 = 1024;
  int v16 = v5;
  __int16 v17 = 1024;
  int v18 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s:%d SYN Param does NOT indicate NoRetransmit: retransmitTimeout=%d cumAckTimeout=%d maxRetransmissions=%d maxCumAck=%d",  (uint8_t *)&v7,  0x2Au);
}

void iAP2LinkActionNotifyConnectionFail_cold_1()
{
}

void iAP2LinkActionNotifyConnectionFail_cold_2()
{
}

void iAP2LinkIsValidSynParam_cold_7()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: retransmitTimeout=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iAP2LinkIsValidSynParam_cold_9()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: maxPacketSize=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iAP2LinkIsValidSynParam_cold_11()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: linkVersion=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void __iAP2LinkIsValidSynParamMaxOutstandingPackets_cold_1()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: maxOutstandingPackets=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void __iAP2LinkIsValidSynParamCumAckTimeout_cold_1()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: cumAckTimeout=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void __iAP2LinkIsValidSynParamMaxRetransmissions_cold_1()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: maxRetransmissions=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void __iAP2LinkIsValidSynParamMaxCumAck_cold_1()
{
  OUTLINED_FUNCTION_3_3( (void *)&_mh_execute_header,  v0,  v1,  "Invalid SYN Params detected: maxCumAck=%d",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_5_1();
}

void iAP2LinkGetBuffSize_cold_1()
{
  __assert_rtn( "iAP2LinkGetBuffSize",  "iAP2Link.c",  2807,  "maxPacketSentRcvdAtOnce <= iAP2_LINK_MAX_SESS_PCKS_SUPPORTED");
}

void iAP2LinkCreate_cold_1()
{
}

void iAP2LinkHandleReadyPacket_cold_3()
{
  __assert_rtn("_CleanupRecvPackets", "iAP2Link.c", 1227, "link->recvPck == NULL");
}

void iAP2LinkHandleSuspend_cold_1()
{
  OUTLINED_FUNCTION_12_6( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d suspend link=%hx(type=%d state=%d)",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_6_2();
}

void iAP2LinkHandleResume_cold_1()
{
  OUTLINED_FUNCTION_12_6( (void *)&_mh_execute_header,  v0,  v1,  "%s:%d resume link=%hx(type=%d state=%d)",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_6_2();
}

void iAP2LinkHandleTimeout_cold_1()
{
}

void _iAP2LinkComparePacketSeq_cold_1()
{
  __assert_rtn("_iAP2LinkComparePacketSeq", "iAP2Link.c", 502, "pck1->link == pck2->link");
}

void _ComparePckTimerIdCB_cold_1()
{
  __assert_rtn("_ComparePckTimerIdCB", "iAP2Link.c", 293, "aPck && bPck && dataSize == sizeof(uintptr_t)");
}

void ccec_sign_internal_ws_cold_1(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Digest should be at least 128 bits long: argument digest_len = %lu",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend__continueOpenSessionForSingleSessionPerEAProtocol_fromPrimaryAccessoryUUID_fromClient_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_continueOpenSessionForSingleSessionPerEAProtocol:fromPrimaryAccessoryUUID:fromClient:");
}

id objc_msgSend_accessoryBLEPairingAttached_blePairingUUID_accInfoDict_supportedPairTypes_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryBLEPairingAttached:blePairingUUID:accInfoDict:supportedPairTypes:");
}

id objc_msgSend_accessoryBLEPairingStateUpdate_blePairingUUID_validMask_btRadioOn_pairingState_pairingModeOn_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "accessoryBLEPairingStateUpdate:blePairingUUID:validMask:btRadioOn:pairingState:pairingModeOn:");
}

id objc_msgSend_accessoryEndpointAttached_transportType_protocol_properties_forConnection_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryEndpointAttached:transportType:protocol:properties:forConnection:");
}

id objc_msgSend_accessoryEndpointAttached_transportType_protocol_properties_forConnection_forClient_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryEndpointAttached:transportType:protocol:properties:forConnection:forClient:");
}

id objc_msgSend_accessoryOOBBTPairingBTAccessoryInfo_oobBtPairingUID_accessoryMacAddr_deviceClass_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryOOBBTPairingBTAccessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:");
}

id objc_msgSend_accessoryOOBBTPairingCompletionStatus_oobBtPairingUID_accessoryMacAddr_result_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryOOBBTPairingCompletionStatus:oobBtPairingUID:accessoryMacAddr:result:");
}

id objc_msgSend_authStateDidChange_forConnectionWithUUID_previousAuthState_authType_connectionIsAuthenticated_connectionWasAuthenticated_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "authStateDidChange:forConnectionWithUUID:previousAuthState:authType:connectionIsAuthenticated:connectionWasAuthenticated:");
}

id objc_msgSend_configStreamPropertyResponse_forCategory_forEndpoint_connection_client_value_success_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configStreamPropertyResponse:forCategory:forEndpoint:connection:client:value:success:");
}

id objc_msgSend_configStreamPropertyResponse_forCategory_forEndpoint_connection_value_success_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configStreamPropertyResponse:forCategory:forEndpoint:connection:value:success:");
}

id objc_msgSend_createEndpointWithTransportType_andProtocol_andIdentifier_andDataOutHandler_forConnectionWithUUID_publishConnection_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:");
}

id objc_msgSend_forceRequestAuthorizationForCertSerial_withName_providesPower_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceRequestAuthorizationForCertSerial:withName:providesPower:completionHandler:");
}

id objc_msgSend_handleIncomingExternalAccessoryData_forEASessionIdentifier_toExternalAccessoryClient_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleIncomingExternalAccessoryData:forEASessionIdentifier:toExternalAccessoryClient:");
}

id objc_msgSend_iAP2KalmanFilterUpdateDeviceTime_Offset_FilteredOffset_OffsetUncertainty_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:");
}

id objc_msgSend_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertiesDidChange:forEndpointWithUUID:previousProperties:connectionUUID:");
}

id objc_msgSend_requestAuthorizationForCertSerial_withName_providesPower_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAuthorizationForCertSerial:withName:providesPower:completionHandler:");
}

id objc_msgSend_startBTOOBPairing_pairingDataC192_pairingDataR192_pairingDataC256_pairingDataR256_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startBTOOBPairing:pairingDataC192:pairingDataR192:pairingDataC256:pairingDataR256:completionHandler:");
}

id objc_msgSend_startMediaLibraryUpdate_library_lastRevision_mediaItemProperties_playlistProperties_playlistContentStyle_playlistContentProperties_reqOptions_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "startMediaLibraryUpdate:library:lastRevision:mediaItemProperties:playlistProperties:playlistContentStyle:play listContentProperties:reqOptions:");
}