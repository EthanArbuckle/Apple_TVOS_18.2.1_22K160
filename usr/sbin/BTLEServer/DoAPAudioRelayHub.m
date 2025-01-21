@interface DoAPAudioRelayHub
+ (BOOL)applicationIDIsSiri:(const char *)a3;
+ (BOOL)applicationIDIsSoundSensor:(const char *)a3;
+ (id)instance;
- (BOOL)isXpcConnectedForDeviceType:(int64_t)a3;
- (DoAPAudioRelayHub)init;
- (NSHashTable)doapAudioRelays;
- (OS_xpc_object)siriXpcConnection;
- (OS_xpc_object)soundSensorXpcConnection;
- (OS_xpc_object)xpcServer;
- (id)relayForIdentifier:(id)a3;
- (id)relayWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6;
- (void)handleCheckInMsg:(id)a3 applicationID:(const char *)a4;
- (void)handleConnection:(id)a3;
- (void)handleConnectionEvent:(id)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleMsg:(id)a3;
- (void)handleServerEvent:(id)a3;
- (void)handleStartStreamMsg:(id)a3;
- (void)handleStopStreamMsg:(id)a3;
- (void)removeDoAPAudioRelayObject:(id)a3;
- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4 forClient:(int64_t)a5;
- (void)setSiriXpcConnection:(id)a3;
- (void)setSoundSensorXpcConnection:(id)a3;
@end

@implementation DoAPAudioRelayHub

- (DoAPAudioRelayHub)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DoAPAudioRelayHub;
  v2 = -[DoAPAudioRelayHub init](&v15, "init");
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100070C38);
    siriXpcConnection = v2->_siriXpcConnection;
    v2->_siriXpcConnection = 0LL;

    soundSensorXpcConnection = v2->_soundSensorXpcConnection;
    v2->_soundSensorXpcConnection = 0LL;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    doapAudioRelays = v2->_doapAudioRelays;
    v2->_doapAudioRelays = (NSHashTable *)v5;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTLEAudioController.xpc", &_dispatch_main_q, 1uLL);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = mach_service;

    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub xpcServer](v2, "xpcServer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100017310;
    handler[3] = &unk_10005CFC8;
    v10 = v2;
    v14 = v10;
    xpc_connection_set_event_handler(v9, handler);

    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub xpcServer](v10, "xpcServer"));
    xpc_connection_resume(v11);

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100070C38);
  }

  return v2;
}

+ (id)instance
{
  if (qword_100070C48 != -1) {
    dispatch_once(&qword_100070C48, &stru_10005D058);
  }
  return (id)qword_100070C40;
}

- (id)relayWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub relayForIdentifier:](self, "relayForIdentifier:", v10));
  if (v12)
  {
    v13 = (DoAPAudioRelay *)v12;
    v14 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub - Publishing DoAPAudioRelay %@ already done",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    v13 = -[DoAPAudioRelay initWithIdentifier:deviceType:properties:codecType:hub:]( objc_alloc(&OBJC_CLASS___DoAPAudioRelay),  "initWithIdentifier:deviceType:properties:codecType:hub:",  v10,  a4,  v11,  v6,  self);
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
    [v15 addObject:v13];

    v16 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub - Publishing DoAPAudioRelay %@",  (uint8_t *)&v18,  0xCu);
    }

    -[DoAPAudioRelay publish](v13, "publish");
  }

  return v13;
}

- (BOOL)isXpcConnectedForDeviceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
LABEL_6:
    BOOL v7 = v4 != 0LL;

    return v7;
  }

  int v6 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", a3);
  BOOL v7 = 0;
  if (a3 == 4 && v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    goto LABEL_6;
  }

  return v7;
}

- (void)handleServerEvent:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection)
  {
    -[DoAPAudioRelayHub handleConnection:](self, "handleConnection:", v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003A0A0();
  }
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub XPC connection: %p",  buf,  0xCu);
  }

  *(_OWORD *)buf = 0u;
  __int128 v27 = 0u;
  xpc_connection_get_audit_token(v4, buf);
  int v6 = (void *)xpc_copy_entitlement_for_token(0LL, buf);
  BOOL v7 = v6;
  if (!v6)
  {
    string = 0LL;
    goto LABEL_10;
  }

  if (xpc_dictionary_get_BOOL(v6, "com.apple.bluetooth.doap"))
  {
    string = xpc_dictionary_get_string(v7, "application-identifier");
    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v9) && !string)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A288();
      }
      goto LABEL_21;
    }

- (void)handleDisconnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
    *(_DWORD *)buf = 134218240;
    v34 = v7;
    __int16 v35 = 2048;
    v36 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub XPC disconnection - siri: %p, soundSensor: %p",  buf,  0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_100070C38);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

  if (v9)
  {
    -[DoAPAudioRelayHub setSiriXpcConnection:](self, "setSiriXpcConnection:", 0LL);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        }

        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v13);
    }

- (void)handleConnectionEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[DoAPAudioRelayHub handleMsg:](self, "handleMsg:", v4);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      -[DoAPAudioRelayHub handleDisconnection:](self, "handleDisconnection:", &_xpc_error_connection_invalid);
    }

    else if (v4 == &_xpc_error_connection_interrupted)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A2E0();
      }
    }

    else if (v4 == &_xpc_error_termination_imminent)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A30C();
      }
    }

    else
    {
      BOOL v6 = os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR);
      if (v4 == &_xpc_error_peer_code_signing_requirement)
      {
        if (v6) {
          sub_10003A338();
        }
      }

      else if (v6)
      {
        sub_10003A364();
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003A3C8();
  }
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  BOOL v6 = (char *)objc_claimAutoreleasedReturnValue(remote_connection);
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_object_t value = xpc_dictionary_get_value(v4, "kMsgArgs");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  memset(v25, 0, sizeof(v25));
  xpc_connection_get_audit_token(v6, v25);
  uint64_t v10 = (void *)xpc_copy_entitlement_for_token(0LL, v25);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = xpc_dictionary_get_string(v10, "application-identifier");
    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v13) && !v12)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A458();
      }
      goto LABEL_25;
    }

    if (!_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v14)
      || +[DoAPAudioRelayHub applicationIDIsSiri:](&OBJC_CLASS___DoAPAudioRelayHub, "applicationIDIsSiri:", v12))
    {
      v16 = (void *)qword_100070CC8;
      if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      v17 = v16;
      id v18 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
      *(_DWORD *)buf = 134218242;
      __int128 v27 = v18;
      __int16 v28 = 2080;
      __int128 v29 = string;
      id v19 = "Received Siri XPC message from %p: %s";
      goto LABEL_12;
    }

    if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v15)
      && +[DoAPAudioRelayHub applicationIDIsSoundSensor:]( &OBJC_CLASS___DoAPAudioRelayHub,  "applicationIDIsSoundSensor:",  v12))
    {
      __int128 v23 = (void *)qword_100070CC8;
      if (!os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:
        if (!strcmp(string, "CheckIn"))
        {
          -[DoAPAudioRelayHub handleCheckInMsg:applicationID:](self, "handleCheckInMsg:applicationID:", v4, v12);
        }

        else
        {
          uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"handle%sMsg:",  string));
          v21 = NSSelectorFromString(v20);

          if (v9) {
            v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v9);
          }
          else {
            v22 = 0LL;
          }
          objc_msgSend(self, v21, v22);
        }

        goto LABEL_25;
      }

      v17 = v23;
      id v18 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
      *(_DWORD *)buf = 134218242;
      __int128 v27 = v18;
      __int16 v28 = 2080;
      __int128 v29 = string;
      id v19 = "Received Sound Sensor XPC message from %p: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);

      goto LABEL_13;
    }

    __int128 v24 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int128 v27 = v12;
      __int16 v28 = 2048;
      __int128 v29 = v6;
      __int16 v30 = 2080;
      v31 = string;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Received XPC message from unexpected applicationID %s, connection %p, msg ID: %s",  buf,  0x20u);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_10003A42C();
  }

- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4 forClient:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100070C38);
  if ((unint64_t)(a5 - 1) > 2)
  {
    int v19 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v10);
    if (a5 == 4)
    {
      if (v19)
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));

        if (v20)
        {
          v21 = (void *)qword_100070CC8;
          if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v21;
            __int128 v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
            *(_DWORD *)buf = 134218242;
            __int128 v27 = v23;
            __int16 v28 = 2112;
            id v29 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Sending Sound Sensor XPC message to %p: %@",  buf,  0x16u);
          }

          xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
          xpc_dictionary_set_string(v16, "kMsgId", (const char *)[v8 UTF8String]);
          if (v9)
          {
            __int128 v24 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
            xpc_dictionary_set_value(v16, "kMsgArgs", v24);
          }

          id v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](self, "soundSensorXpcConnection"));
          goto LABEL_16;
        }
      }
    }
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));

    if (v11)
    {
      uint64_t v13 = (void *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
        *(_DWORD *)buf = 134218242;
        __int128 v27 = v15;
        __int16 v28 = 2112;
        id v29 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sending Siri XPC message to %p: %@",  buf,  0x16u);
      }

      xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_string(v16, "kMsgId", (const char *)[v8 UTF8String]);
      if (v9)
      {
        v17 = (void *)_CFXPCCreateXPCObjectFromCFObject(v9);
        xpc_dictionary_set_value(v16, "kMsgArgs", v17);
      }

      id v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](self, "siriXpcConnection"));
LABEL_16:
      __int128 v25 = (__CFString *)v18;
      xpc_connection_send_message(v18, v16);
LABEL_23:

      goto LABEL_24;
    }

    _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v12);
  }

  xpc_object_t v16 = (id)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a5 >= 5) {
      __int128 v25 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid (%ld)",  a5));
    }
    else {
      __int128 v25 = off_10005D0D8[a5];
    }
    *(_DWORD *)buf = 138412290;
    __int128 v27 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub - No XPC client is checked in yet for %@",  buf,  0xCu);
    goto LABEL_23;
  }

- (void)handleCheckInMsg:(id)a3 applicationID:(const char *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
    *(_DWORD *)buf = 136315394;
    v59 = a4;
    __int16 v60 = 1024;
    LODWORD(v61) = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "DoAPAudioRelayHub - %s checked in. Number of DoAP Audio Relays: %u",  buf,  0x12u);
  }

  char v11 = _os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v8);
  if (!a4 && (v11 & 1) != 0) {
    goto LABEL_55;
  }
  xpc_object_t original = v6;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  v50 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
  id v12 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  uint64_t v14 = &selRef_waitUntilDate_;
  if (!v12) {
    goto LABEL_31;
  }
  id v15 = v12;
  uint64_t v16 = *(void *)v55;
  do
  {
    v17 = 0LL;
    do
    {
      if (*(void *)v55 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)v17);
      if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v13))
      {
        if ([v14 + 422 applicationIDIsSiri:a4]
          && (char *)[v18 deviceType] - 1 > (char *)2)
        {
          goto LABEL_24;
        }

        int v19 = (os_log_s *)(id)qword_100070CC8;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          unint64_t v29 = (unint64_t)[v18 deviceType];
          if (v29 >= 5) {
            __int16 v30 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid (%ld)",  v29));
          }
          else {
            __int16 v30 = off_10005D0D8[v29];
          }
          *(_DWORD *)buf = 136315394;
          v59 = a4;
          __int16 v60 = 2112;
          v61 = v30;
          _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "DoAPAudioRelayHub - skipping relay. applicationID %s, deviceType %@",  buf,  0x16u);
        }
      }

      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 deviceType]));
      [v20 setValue:v21 forKey:@"kMsgDeviceType"];

      v22 = (void *)objc_claimAutoreleasedReturnValue([v18 hidProperties]);
      if (v22)
      {
        __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v18 hidProperties]);
        __int128 v24 = v14;
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"ProductID"]);
        [v20 setValue:v25 forKey:@"kMsgPidNum"];

        uint64_t v14 = v24;
      }

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);

      if (v26)
      {
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
        [v20 setValue:v27 forKey:@"kMsgArgIdentifier"];
      }

      if ([v18 codec])
      {
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v18 codec]));
        [v20 setValue:v28 forKey:@"kMsgCodecType"];
      }

      [v53 addObject:v20];

LABEL_24:
      v17 = (char *)v17 + 1;
    }

    while (v15 != v17);
    id v31 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    id v15 = v31;
  }

  while (v31);
LABEL_31:

  id v6 = original;
  reply = (__CFString *)xpc_dictionary_create_reply(original);
  v33 = (void *)_CFXPCCreateXPCObjectFromCFObject(v53);
  xpc_dictionary_set_value(reply, "kMsgArgs", v33);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100070C38);
  if (!_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP", v34))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](v50, "siriXpcConnection"));

    v41 = (void *)qword_100070CC8;
    if (!v40)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A4DC();
      }
      goto LABEL_54;
    }

    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](v50, "siriXpcConnection"));
      *(_DWORD *)buf = 134218242;
      v59 = v43;
      __int16 v60 = 2112;
      v61 = reply;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Sending Siri CheckIn reply to %p: %@",  buf,  0x16u);
    }

    v39 = v50;
LABEL_41:
    v44 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](v39, "siriXpcConnection"));
LABEL_42:
    v45 = v44;
    xpc_connection_send_message(v44, reply);

    goto LABEL_54;
  }

  if (![v14 + 422 applicationIDIsSiri:a4])
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](v50, "soundSensorXpcConnection"));

    v47 = (void *)qword_100070CC8;
    if (!v46)
    {
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
        sub_10003A4B0();
      }
      goto LABEL_54;
    }

    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](v50, "soundSensorXpcConnection"));
      *(_DWORD *)buf = 134218242;
      v59 = v49;
      __int16 v60 = 2112;
      v61 = reply;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Sending Sound Sensor CheckIn reply to %p: %@",  buf,  0x16u);
    }

    v44 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub soundSensorXpcConnection](v50, "soundSensorXpcConnection"));
    goto LABEL_42;
  }

  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](v50, "siriXpcConnection"));

  v36 = (void *)qword_100070CC8;
  if (v35)
  {
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      v38 = (char *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub siriXpcConnection](v50, "siriXpcConnection"));
      *(_DWORD *)buf = 134218242;
      v59 = v38;
      __int16 v60 = 2112;
      v61 = reply;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Sending Siri CheckIn reply to %p: %@",  buf,  0x16u);
    }

    v39 = v50;
    goto LABEL_41;
  }

  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR)) {
    sub_10003A484();
  }
LABEL_54:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100070C38);

LABEL_55:
}

- (void)handleStartStreamMsg:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"kMsgArgIdentifier"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub relayForIdentifier:](self, "relayForIdentifier:", v4));
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A508();
  }
  [v5 handleStartStream];
}

- (void)handleStopStreamMsg:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"kMsgArgIdentifier"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub relayForIdentifier:](self, "relayForIdentifier:", v4));
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A534();
  }
  [v5 handleStopStream];
}

- (id)relayForIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)removeDoAPAudioRelayObject:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A560();
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelayHub doapAudioRelays](self, "doapAudioRelays"));
  [v5 removeObject:v4];
}

+ (BOOL)applicationIDIsSiri:(const char *)a3
{
  if (!a3) {
    return 0;
  }
  if (!strcmp(a3, "com.apple.corespeechd")) {
    return 1;
  }
  return strcmp(a3, "com.apple.MobileSMS") == 0;
}

+ (BOOL)applicationIDIsSoundSensor:(const char *)a3
{
  return a3 && strcmp(a3, "com.apple.SensingPredictXPCService") == 0;
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (OS_xpc_object)siriXpcConnection
{
  return self->_siriXpcConnection;
}

- (void)setSiriXpcConnection:(id)a3
{
}

- (OS_xpc_object)soundSensorXpcConnection
{
  return self->_soundSensorXpcConnection;
}

- (void)setSoundSensorXpcConnection:(id)a3
{
}

- (NSHashTable)doapAudioRelays
{
  return self->_doapAudioRelays;
}

- (void).cxx_destruct
{
}

@end