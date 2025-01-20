@interface ACCExternalAccessorySession
- (ACCExternalAccessorySession)init;
- (ACCExternalAccessorySession)initWithEASessionUUID:(id)a3 protocolID:(unsigned __int8)a4 legacyConnectionID:(unint64_t)a5 sessionID:(unsigned __int16)a6;
- (BOOL)closeDataPipes;
- (BOOL)openPipeFromApp;
- (BOOL)openPipeToApp;
- (NSLock)sessionNotificationLock;
- (NSString)eaSessionUUID;
- (id)description;
- (int)_createListenSocket;
- (unint64_t)legacyConnectionID;
- (unsigned)protocolID;
- (unsigned)sessionID;
- (void)_createListenSocket;
- (void)_openPipeToApp;
- (void)dealloc;
- (void)shuttingDownSession;
@end

@implementation ACCExternalAccessorySession

- (ACCExternalAccessorySession)init
{
  return 0LL;
}

- (ACCExternalAccessorySession)initWithEASessionUUID:(id)a3 protocolID:(unsigned __int8)a4 legacyConnectionID:(unint64_t)a5 sessionID:(unsigned __int16)a6
{
  id v10 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySession;
  v11 = -[ACCExternalAccessorySession init](&v25, "init");
  v12 = v11;
  if (v11)
  {
    v11->_int protocolID = a4;
    v13 = (NSString *)[v10 copy];
    eaSessionUUID = v12->_eaSessionUUID;
    v12->_eaSessionUUID = v13;

    v12->_legacyConnectionID = a5;
    v12->_int sessionID = a6;
    v15 = objc_alloc_init(&OBJC_CLASS___NSLock);
    sessionNotificationLock = v12->_sessionNotificationLock;
    v12->_sessionNotificationLock = v15;

    v17 = v12->_sessionNotificationLock;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.accessoryd.ea.lock.%@",  v12->_eaSessionUUID));
    -[NSLock setName:](v17, "setName:", v18);

    *(void *)&v12->_listenSock = -1LL;
    *(_WORD *)&v12->_openPipeToAppAfterAccept = 0;
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v19 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v19 = (os_log_s *)&_os_log_default;
      id v20 = &_os_log_default;
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int protocolID = v12->_protocolID;
      int sessionID = v12->_sessionID;
      v23 = v12->_eaSessionUUID;
      *(_DWORD *)buf = 67109634;
      int v27 = protocolID;
      __int16 v28 = 1024;
      int v29 = sessionID;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "new EA Session Basic protocolID=%d sessionID=%d eaSessionUUID=%@",  buf,  0x18u);
    }
  }

  return v12;
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
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int protocolID = self->_protocolID;
    int sessionID = self->_sessionID;
    eaSessionUUID = self->_eaSessionUUID;
    v9[0] = 67109634;
    v9[1] = protocolID;
    __int16 v10 = 1024;
    int v11 = sessionID;
    __int16 v12 = 2112;
    v13 = eaSessionUUID;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "shuttingDown protocolID=%d sessionID=%d eaSessionUUID=%@",  (uint8_t *)v9,  0x18u);
  }
}

- (void)dealloc
{
  eaSessionUUID = self->_eaSessionUUID;
  self->_eaSessionUUID = 0LL;

  sessionNotificationLock = self->_sessionNotificationLock;
  self->_sessionNotificationLock = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySession;
  -[ACCExternalAccessorySession dealloc](&v5, "dealloc");
}

- (BOOL)openPipeToApp
{
  if (self->_sock < 0) {
    self->_openPipeToAppAfterAccept = 1;
  }
  else {
    -[ACCExternalAccessorySession _openPipeToApp](self, "_openPipeToApp");
  }
  return 1;
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
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_openPipeToApp is a no-op", v5, 2u);
  }
}

- (BOOL)openPipeFromApp
{
  if (self->_sock < 0) {
    self->_openPipeFromAppAfterAccept = 1;
  }
  else {
    -[ACCExternalAccessorySession _openPipeFromApp](self, "_openPipeFromApp");
  }
  return 1;
}

- (BOOL)closeDataPipes
{
  int listenSock = self->_listenSock;
  if ((listenSock & 0x80000000) == 0)
  {
    close(listenSock);
    self->_int listenSock = -1;
  }

  int sock = self->_sock;
  if ((sock & 0x80000000) == 0)
  {
    close(sock);
    self->_int sock = -1;
  }

  return 1;
}

- (int)_createListenSocket
{
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v27 = v2;
  __int128 v28 = v2;
  __int128 v25 = v2;
  __int128 v26 = v2;
  __int128 v23 = v2;
  __int128 v24 = v2;
  __int128 v21 = v2;
  __int128 v22 = v2;
  __int128 v19 = v2;
  __int128 v20 = v2;
  __int128 v17 = v2;
  __int128 v18 = v2;
  __int128 v15 = v2;
  __int128 v16 = v2;
  *(_OWORD *)__str = v2;
  __int128 v14 = v2;
  snprintf( __str,  0x100uLL,  "%s/ea.%lu",  "/var/mobile/Library/ExternalAccessory",  -[NSString hash](self->_eaSessionUUID, "hash"));
  unlink(__str);
  int v3 = socket(1, 1, 0);
  if (v3 < 0)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v4 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ACCExternalAccessorySession _createListenSocket].cold.5(v4);
    }
  }

  uint64_t v12 = 0LL;
  memset(&v11[2], 0, 96);
  *(_WORD *)int v11 = 362;
  __strlcpy_chk(&v11[2], __str, 104LL, 104LL);
  if (bind(v3, (const sockaddr *)v11, 0x6Au))
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v6 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v6 = (os_log_s *)&_os_log_default;
      id v7 = &_os_log_default;
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACCExternalAccessorySession _createListenSocket].cold.3();
    }
  }

  if (listen(v3, 5))
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v8 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v8 = (os_log_s *)&_os_log_default;
      id v9 = &_os_log_default;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACCExternalAccessorySession _createListenSocket].cold.1();
    }
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCExternalAccessorySession;
  id v3 = -[ACCExternalAccessorySession description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ eaSessionUUID=%@ legacyConnectionID=%llu protocolID=%d sessionID=%d",  v4,  self->_eaSessionUUID,  self->_legacyConnectionID,  self->_protocolID,  self->_sessionID));

  return v5;
}

- (NSString)eaSessionUUID
{
  return self->_eaSessionUUID;
}

- (unsigned)protocolID
{
  return self->_protocolID;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (unint64_t)legacyConnectionID
{
  return self->_legacyConnectionID;
}

- (NSLock)sessionNotificationLock
{
  return self->_sessionNotificationLock;
}

- (void).cxx_destruct
{
}

- (void)_createListenSocket
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Can't open listenSock", v1, 2u);
}

@end