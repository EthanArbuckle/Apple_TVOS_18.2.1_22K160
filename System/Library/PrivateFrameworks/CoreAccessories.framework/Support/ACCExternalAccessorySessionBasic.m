@interface ACCExternalAccessorySessionBasic
- (ACCExternalAccessorySessionBasic)initWithEASessionUUID:(id)a3 protocolID:(unsigned __int8)a4 legacyConnectionID:(unint64_t)a5 sessionID:(unsigned __int16)a6;
- (BOOL)closeDataPipes;
- (__CFData)returnEASessionDataFromApp:(unsigned int)a3;
- (unsigned)readEASessionDataFromApp:(id)a3 maxReadSize:(unsigned int)a4;
- (void)_openPipeFromApp;
- (void)_openPipeToApp;
- (void)dealloc;
- (void)sendEABufferDataToApp:(char *)a3 withLength:(unsigned int)a4;
- (void)sendEABufferDataToApp:(id)a3;
- (void)shuttingDownSession;
- (void)startIncomingDataNotifications;
- (void)stopIncomingDataNotifications;
@end

@implementation ACCExternalAccessorySessionBasic

- (ACCExternalAccessorySessionBasic)initWithEASessionUUID:(id)a3 protocolID:(unsigned __int8)a4 legacyConnectionID:(unint64_t)a5 sessionID:(unsigned __int16)a6
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySessionBasic;
  v6 = -[ACCExternalAccessorySession initWithEASessionUUID:protocolID:legacyConnectionID:sessionID:]( &v24,  "initWithEASessionUUID:protocolID:legacyConnectionID:sessionID:",  a3,  a4,  a5,  a6);
  v7 = v6;
  if (v6)
  {
    readSource = v6->_readSource;
    v6->_readSource = 0LL;

    v7->super._listenSock = -[ACCExternalAccessorySession _createListenSocket](v7, "_createListenSocket");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession eaSessionUUID](v7, "eaSessionUUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.accessoryd.easessionqueue.%@",  v9));

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 cStringUsingEncoding:4], 0);
    msgSerialQueue = v7->_msgSerialQueue;
    v7->_msgSerialQueue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  v7->super._listenSock,  0LL,  (dispatch_queue_t)v7->_msgSerialQueue);
    listenSource = v7->_listenSource;
    v7->_listenSource = (OS_dispatch_source *)v14;

    v7->_continueRunningSession = 0;
    v16 = (dispatch_source_s *)v7->_listenSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke;
    handler[3] = &unk_1001F96F8;
    v17 = v7;
    v23 = v17;
    dispatch_source_set_cancel_handler(v16, handler);
    v18 = (dispatch_source_s *)v7->_listenSource;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke_2;
    v20[3] = &unk_1001F96F8;
    v21 = v17;
    dispatch_source_set_event_handler(v18, v20);
    dispatch_resume((dispatch_object_t)v7->_listenSource);
  }

  return v7;
}

uint64_t __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke( uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 12LL);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(*(void *)(a1 + 32) + 12LL) = -1;
  }

  return result;
}

void __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke_2( uint64_t a1)
{
  *(void *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v12 = v2;
  sockaddr v13 = v2;
  sockaddr v10 = v2;
  sockaddr v11 = v2;
  sockaddr v8 = v2;
  sockaddr v9 = v2;
  sockaddr v6 = v2;
  sockaddr v7 = v2;
  socklen_t v5 = -1431655766;
  *(_DWORD *)(*(void *)(a1 + 32) + 16LL) = accept(*(_DWORD *)(*(void *)(a1 + 32) + 12LL), &v6, &v5);
  int v4 = 1;
  setsockopt(*(_DWORD *)(*(void *)(a1 + 32) + 16LL), 0xFFFF, 4097, &kSessionDataSendRecvBufferSize, 4u);
  setsockopt(*(_DWORD *)(*(void *)(a1 + 32) + 16LL), 0xFFFF, 4098, &kSessionDataSendRecvBufferSize, 4u);
  ioctl(*(_DWORD *)(*(void *)(a1 + 32) + 16LL), 0x8004667EuLL, &v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v3 + 20))
  {
    [(id)v3 _openPipeToApp];
    *(_BYTE *)(*(void *)(a1 + 32) + 20LL) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }

  if (*(_BYTE *)(v3 + 21))
  {
    [(id)v3 _openPipeFromApp];
    *(_BYTE *)(*(void *)(a1 + 32) + 21LL) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }

  dispatch_source_cancel(*(dispatch_source_t *)(v3 + 128));
}

- (void)shuttingDownSession
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    socklen_t v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    socklen_t v5 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    sockaddr v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession description](self, "description"));
    *(_DWORD *)buf = 138412290;
    sockaddr v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "shuttingDown %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySessionBasic;
  -[ACCExternalAccessorySession shuttingDownSession](&v7, "shuttingDownSession");
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    socklen_t v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    socklen_t v5 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sockaddr v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession description](self, "description"));
    *(_DWORD *)buf = 138412290;
    sockaddr v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_listenSource);
  readSource = self->_readSource;
  if (readSource) {
    dispatch_source_cancel((dispatch_source_t)readSource);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySessionBasic;
  -[ACCExternalAccessorySession dealloc](&v8, "dealloc");
}

- (void)_openPipeToApp
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 10;
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
    id v4 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)socklen_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_openPipeToApp is a no-op", v5, 2u);
  }
}

- (void)_openPipeFromApp
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    socklen_t v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    socklen_t v5 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int sessionID = self->super._sessionID;
    *(_DWORD *)buf = 67109376;
    LODWORD(v21[0]) = sessionID;
    WORD2(v21[0]) = 2048;
    *(void *)((char *)v21 + 6) = -[ACCExternalAccessorySession legacyConnectionID](self, "legacyConnectionID");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SUCCESS - session=%d for legacyConnectionID=0x%llx opened pipe from app",  buf,  0x12u);
  }

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v7 lock];

  objc_super v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_read,  self->super._sock,  0LL,  (dispatch_queue_t)self->_msgSerialQueue);
  readSource = self->_readSource;
  self->_readSource = v8;

  sockaddr v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v10 unlock];

  sockaddr v11 = self->_readSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke;
  handler[3] = &unk_1001F96F8;
  void handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v11, handler);
  sockaddr v12 = self->_readSource;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_68;
  v18[3] = &unk_1001F96F8;
  v18[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)v12, v18);
  sockaddr v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v13 lock];

  if (self->_continueRunningSession)
  {
    dispatch_resume((dispatch_object_t)self->_readSource);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      dispatch_source_t v14 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      dispatch_source_t v14 = (os_log_s *)&_os_log_default;
      id v15 = &_os_log_default;
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession eaSessionUUID](self, "eaSessionUUID"));
      *(_DWORD *)buf = 138412290;
      v21[0] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "eaSessionUUID %@ was already activated, resume readsource",  buf,  0xCu);
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v17 unlock];
}

void __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 10;
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
    id v4 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_3(a1);
  }

  socklen_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessorySessionManager sharedManager]( &OBJC_CLASS___ACCExternalAccessorySessionManager,  "sharedManager"));
  objc_super v7 = *(void **)(a1 + 32);
  sockaddr v6 = (id *)(a1 + 32);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 eaSessionUUID]);
  [v5 outgoingEADataFromClientAvailable:v8];

  if (gLogObjects && gNumLogObjects >= 10)
  {
    sockaddr v9 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    sockaddr v9 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_1(v6);
  }
}

id __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_68(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySessionBasic;
  return objc_msgSendSuper2(&v2, "closeDataPipes");
}

- (BOOL)closeDataPipes
{
  listenSource = self->_listenSource;
  if (listenSource) {
    dispatch_source_cancel((dispatch_source_t)listenSource);
  }
  readSource = self->_readSource;
  if (readSource) {
    dispatch_source_cancel((dispatch_source_t)readSource);
  }
  return 1;
}

- (void)sendEABufferDataToApp:(id)a3
{
  id v4 = a3;
  if (self->super._sock != -1)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 10;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v7 = (os_log_s *)&_os_log_default;
      id v6 = &_os_log_default;
    }

    else
    {
      objc_super v7 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic sendEABufferDataToApp:].cold.1(v4);
    }

    int sock = self->super._sock;
    id v9 = v4;
    send(sock, [v9 bytes], (size_t)objc_msgSend(v9, "length"), 0);
  }
}

- (void)sendEABufferDataToApp:(char *)a3 withLength:(unsigned int)a4
{
  int sock = self->super._sock;
  if (sock != -1) {
    send(sock, a3, a4, 0);
  }
}

- (unsigned)readEASessionDataFromApp:(id)a3 maxReadSize:(unsigned int)a4
{
  id v6 = a3;
  ssize_t v7 = recv(self->super._sock, (char *)[v6 mutableBytes] + 2, a4, 0);
  uint64_t v8 = v7;
  if (v7 == -1)
  {
    if (*__error() != 35)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v10 = (os_log_s *)*(id *)(gLogObjects + 72);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v10 = (os_log_s *)&_os_log_default;
        id v14 = &_os_log_default;
      }

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *__error();
        int v19 = 67109120;
        LODWORD(v20) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ERROR - error reading data from pipe (errno=%d)",  (uint8_t *)&v19,  8u);
      }
    }
  }

  else if (v7 >= 1)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v9 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = (os_log_s *)&_os_log_default;
      id v11 = &_os_log_default;
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic readEASessionDataFromApp:maxReadSize:].cold.5(self, v8, v9);
    }

    [v6 setLength:v8 + 2];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      sockaddr v12 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      sockaddr v12 = (os_log_s *)&_os_log_default;
      id v13 = &_os_log_default;
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic readEASessionDataFromApp:maxReadSize:].cold.3(v6, v12);
    }
    goto LABEL_38;
  }

  if (gLogObjects && gNumLogObjects >= 10)
  {
    sockaddr v12 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    sockaddr v12 = (os_log_s *)&_os_log_default;
    id v16 = &_os_log_default;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession eaSessionUUID](self, "eaSessionUUID"));
    int v19 = 134218242;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Read %lld bytes for sessionUUID %@, not appending data",  (uint8_t *)&v19,  0x16u);
  }

  LODWORD(v8) = 0;
LABEL_38:

  return v8;
}

- (__CFData)returnEASessionDataFromApp:(unsigned int)a3
{
  uint64_t v5 = a3;
  id v6 = (char *)calloc(1uLL, a3);
  ssize_t v7 = recv(self->super._sock, v6 + 2, v5 - 2, 0);
  uint64_t v8 = (const char *)v7;
  if (v7 == -1)
  {
    if (*__error() != 35)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v11 = (os_log_s *)*(id *)(gLogObjects + 72);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v11 = (os_log_s *)&_os_log_default;
        id v17 = &_os_log_default;
      }

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = *__error();
        int v23 = 136315906;
        objc_super v24 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/accessoryd/XPC_Servers/ACCExternalAccessorySession.m";
        __int16 v25 = 2080;
        v26 = "-[ACCExternalAccessorySessionBasic returnEASessionDataFromApp:]";
        __int16 v27 = 1024;
        unsigned int v28 = 391;
        __int16 v29 = 1024;
        unsigned int v30 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ERROR - %s:%s - %d error reading data from pipe (errno=%d)\n",  (uint8_t *)&v23,  0x22u);
      }
    }
  }

  else if (v7 >= 1)
  {
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 10;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      sockaddr v12 = (os_log_s *)&_os_log_default;
      id v10 = &_os_log_default;
    }

    else
    {
      sockaddr v12 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v22 = (char *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession eaSessionUUID](self, "eaSessionUUID"));
      int v23 = 134218754;
      objc_super v24 = v8;
      __int16 v25 = 2112;
      v26 = v22;
      __int16 v27 = 1024;
      unsigned int v28 = -[ACCExternalAccessorySession sessionID](self, "sessionID");
      __int16 v29 = 1024;
      unsigned int v30 = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Read %lld bytes for sessionUUID %@ sessionID %d, maxReadSize (including two extra bytes of padding) = %d",  (uint8_t *)&v23,  0x22u);
    }

    id v13 = (const __CFData *)(id)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytesNoCopy:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytesNoCopy:length:",  v6,  v8 + 2LL));
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v14 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v14 = (os_log_s *)&_os_log_default;
      id v15 = &_os_log_default;
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic returnEASessionDataFromApp:].cold.3(v13);
    }

    id v16 = v13;
    goto LABEL_41;
  }

  free(v6);
  if (gLogObjects && gNumLogObjects >= 10)
  {
    id v13 = (const __CFData *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v13 = (const __CFData *)&_os_log_default;
    id v19 = &_os_log_default;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = (char *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession eaSessionUUID](self, "eaSessionUUID"));
    int v23 = 134218242;
    objc_super v24 = v8;
    __int16 v25 = 2112;
    v26 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Read %lld bytes for sessionUUID %@, not appending data",  (uint8_t *)&v23,  0x16u);
  }

  id v16 = 0LL;
LABEL_41:

  return v16;
}

- (void)stopIncomingDataNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v3 lock];

  if (self->_continueRunningSession)
  {
    readSource = (dispatch_object_s *)self->_readSource;
    if (readSource) {
      dispatch_suspend(readSource);
    }
    self->_continueRunningSession = 0;
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v5 unlock];
}

- (void)startIncomingDataNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v3 lock];

  if (!self->_continueRunningSession)
  {
    self->_continueRunningSession = 1;
    readSource = (dispatch_object_s *)self->_readSource;
    if (readSource)
    {
      dispatch_resume(readSource);
    }

    else
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v5 = (os_log_s *)*(id *)(gLogObjects + 72);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v5 = (os_log_s *)&_os_log_default;
        id v6 = &_os_log_default;
      }

      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        ssize_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession eaSessionUUID](self, "eaSessionUUID"));
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "readsource not yet created for EA session UUID %@",  (uint8_t *)&v9,  0xCu);
      }
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessorySession sessionNotificationLock](self, "sessionNotificationLock"));
  [v8 unlock];
}

- (void).cxx_destruct
{
}

void __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_1(id *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 eaSessionUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v2,  v3,  "finished sending outgoingEADataFromClientAvailable notification for sessionUUID %@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

void __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_3(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eaSessionUUID]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v2,  v3,  "in _readSource event handler for session %@. sending data available notification",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_4();
}

- (void)sendEABufferDataToApp:(void *)a1 .cold.1(void *a1)
{
}

- (void)readEASessionDataFromApp:(void *)a1 maxReadSize:(os_log_s *)a2 .cold.3( void *a1,  os_log_s *a2)
{
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "dataBuffer length %lu is now %@ (first two bytes are reserved for sessionID)",  v4,  0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)readEASessionDataFromApp:(os_log_s *)a3 maxReadSize:.cold.5( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 eaSessionUUID]);
  int v7 = 134218498;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 1024;
  unsigned int v12 = [a1 sessionID];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Read %lld bytes for sessionUUID %@ sessionID %d",  (uint8_t *)&v7,  0x1Cu);
}

- (void)returnEASessionDataFromApp:(const __CFData *)a1 .cold.3(const __CFData *a1)
{
}

@end