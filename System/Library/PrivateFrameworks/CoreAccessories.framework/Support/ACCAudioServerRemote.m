@interface ACCAudioServerRemote
- (ACCAudioServerRemote)initWithXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (void)allowBackgroundAudioForClient:(id)a3 withReply:(id)a4;
- (void)deviceAudioStatesWithReply:(id)a3;
- (void)initConnectionToServer:(id)a3;
- (void)setDigitalAudioSampleRate:(unsigned int)a3 withReply:(id)a4;
- (void)supportedDigitalAudioSampleRate:(unsigned int)a3 withReply:(id)a4;
- (void)supportedDigitalAudioSampleRatesWithReply:(id)a3;
@end

@implementation ACCAudioServerRemote

- (ACCAudioServerRemote)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ACCAudioServerRemote;
  v6 = -[ACCAudioServerRemote init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_XPCConnection, a3);
    }

    else
    {

      v7 = 0LL;
    }
  }

  return v7;
}

- (void)initConnectionToServer:(id)a3
{
  v4 = (void (**)(id, BOOL))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACCAudioServer sharedServer](&OBJC_CLASS___ACCAudioServer, "sharedServer"));
  if ((objc_opt_respondsToSelector(v5, "shouldAcceptXPCConnection:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCAudioServerRemote XPCConnection](self, "XPCConnection"));
    BOOL v7 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v6] != 0;
  }

  else
  {
    BOOL v7 = 0LL;
  }

  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
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
    v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Audio] Client has called initConnection method!",  (uint8_t *)v13,  2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v11 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[#Audio] shouldStayConnected: %d",  (uint8_t *)v13,  8u);
  }

  v4[2](v4, v7);
}

- (void)setDigitalAudioSampleRate:(unsigned int)a3 withReply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = (void (**)(id, uint64_t))a4;
  uint64_t v6 = platform_digitalAudio_setSampleRate(v4);
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    id v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109376;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[#Audio] newRate: %d, result: %d",  (uint8_t *)v10,  0xEu);
  }

  if (v5) {
    v5[2](v5, v6);
  }
}

- (void)supportedDigitalAudioSampleRate:(unsigned int)a3 withReply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = (void (**)(id, id))a4;
  id SupportedSampleRate = platform_digitalAudio_getSupportedSampleRate(v4);
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    id v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109376;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = (int)SupportedSampleRate;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[#Audio] inputRate: %d, supportedSampleRate: %d",  (uint8_t *)v10,  0xEu);
  }

  if (v5) {
    v5[2](v5, SupportedSampleRate);
  }
}

- (void)supportedDigitalAudioSampleRatesWithReply:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v4 = platform_digitalAudio_copySupportedSampleRates();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v8 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  else
  {
    id v8 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "[#Audio] sampleRatesArray: %@",  (uint8_t *)&v9,  0xCu);
  }

  v3[2](v3, v5);
}

- (void)deviceAudioStatesWithReply:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  id v4 = platform_digitalAudio_copyDeviceAudioStates();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v8 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  else
  {
    id v8 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[#Audio] audioStates: %@", (uint8_t *)&v9, 0xCu);
  }

  v3[2](v3, v5);
}

- (void)allowBackgroundAudioForClient:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, id))a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    int v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[#Audio] allowBackgroundAudioForClient?",  (uint8_t *)&v13,  2u);
  }

  id v10 = platform_externalAccessory_clientHasOpenEASession((uint64_t)v5);
  if (gLogObjects && gNumLogObjects >= 5)
  {
    __int16 v11 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v11 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 1024;
    int v16 = (int)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[#Audio] clientBundleID: %@ shouldAllowBackgroundAudio: %d",  (uint8_t *)&v13,  0x12u);
  }

  v6[2](v6, v10);
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void).cxx_destruct
{
}

@end