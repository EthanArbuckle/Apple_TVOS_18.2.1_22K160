@interface BTLEXpcConnection
+ (id)createNSDictionaryFromXpcDictionary:(id)a3;
- (BTLEXpcConnection)initWithConnection:(id)a3;
- (OS_xpc_object)connection;
- (id)bundleIdentifier;
- (void)authenticationDidFail:(id)a3;
- (void)authenticationDidSucceed:(id)a3;
- (void)handleClassicDeviceUnexpectedDisconnectionMsg:(id)a3;
- (void)handleClassicPairStateRequestMsg:(id)a3;
- (void)handleClassicPairStateResponseMsg:(id)a3;
- (void)handleConnectAlwaysMsg:(id)a3;
- (void)handleConnectClassicDeviceMsg:(id)a3;
- (void)handleConnectOnceMsg:(id)a3;
- (void)handleDOAPDeviceConnectedMsg:(id)a3;
- (void)handleDisconnectClassicDeviceMsg:(id)a3;
- (void)handleDisconnection;
- (void)handleEvent:(id)a3;
- (void)handleHRMDeviceConnectedMsg:(id)a3;
- (void)handleLeaEasyPairRequestMsg:(id)a3;
- (void)handleLeaEasyPairResponseMsg:(id)a3;
- (void)handleLeaStoreBondingInfoRequestMsg:(id)a3;
- (void)handleLeaStoreBondingInfoResponseMsg:(id)a3;
- (void)handleMFiAccessoryAuthMsg:(id)a3;
- (void)handleMsg:(id)a3;
- (void)handleNotifyPiconetClockMsg:(id)a3;
- (void)handleNotifyPrimaryBudSideMsg:(id)a3;
- (void)handlePersistServerServicesMsg:(id)a3;
- (void)handlePreWarmMFiAccessoryAuthMsg:(id)a3;
- (void)handleStoreClassicDeviceSettingsMsg:(id)a3;
- (void)handleStoreClassicLinkKeyRequestExtendedMsg:(id)a3;
- (void)handleStoreClassicLinkKeyRequestMsg:(id)a3;
- (void)handleStoreClassicLinkKeyResponseMsg:(id)a3;
- (void)handleUARPAACPTransportChangeMsg:(id)a3;
- (void)handleUARPDataOverAACPMsg:(id)a3;
- (void)handleUARPDeviceConnectedMsg:(id)a3;
- (void)handleVersionInfoRequestMsg:(id)a3;
- (void)handleVersionInfoResponseMsg:(id)a3;
- (void)peerIsNotUsingBuiltinService:(id)a3;
- (void)peerIsUsingBuiltinService:(id)a3;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation BTLEXpcConnection

- (BTLEXpcConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039CAC();
  }
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___BTLEXpcConnection;
  v6 = -[BTLEXpcConnection init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    xpc_connection_set_target_queue(v7->_connection, &_dispatch_main_q);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000144A8;
    handler[3] = &unk_10005CFC8;
    v9 = v7;
    v16 = v9;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v9 selector:"authenticationDidSucceed:" name:@"AuthenticationServiceAuthDidSucceedNotification" object:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v9 selector:"authenticationDidFail:" name:@"AuthenticationServiceAuthDidFailNotification" object:0];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v9 selector:"peerIsUsingBuiltinService:" name:@"PeerIsUsingBuiltinServiceNotification" object:0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 addObserver:v9 selector:"peerIsNotUsingBuiltinService:" name:@"PeerIsNotUsingBuiltinServiceNotification" object:0];
  }

  return v7;
}

- (id)bundleIdentifier
{
  audit_token_t token = v14;
  v2 = SecTaskCreateWithAuditToken(0LL, &token);
  if (v2)
  {
    v3 = v2;
    *(void *)token.val = 0LL;
    CFStringRef v4 = SecTaskCopySigningIdentifier(v2, (CFErrorRef *)&token);
    id v5 = (void *)v4;
    if (*(void *)token.val)
    {
      v6 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Failed to copy signing ID - using framework-provided bundle identifier!",  buf,  2u);
      }

      CFRelease(*(CFTypeRef *)token.val);
      if (!v5) {
        goto LABEL_12;
      }
      CFRelease(v5);
    }

    else
    {
      if (v4) {
        goto LABEL_12;
      }
      v11 = (os_log_s *)qword_100070CC8;
      if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve signing ID - using framework-provided bundle identifier!",  buf,  2u);
      }
    }

    id v5 = 0LL;
LABEL_12:
    CFRelease(v3);
    goto LABEL_13;
  }

  v7 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate security task - using framework-provided bundle identifier!",  (uint8_t *)&token,  2u);
  }

  id v5 = 0LL;
LABEL_13:
  if (![v5 length])
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UNKNOWN-%0000x",  arc4random_uniform(0xFFFFu));
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

    id v5 = (void *)v9;
  }

  return v5;
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[BTLEXpcConnection handleMsg:](self, "handleMsg:", v4);
  }

  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      -[BTLEXpcConnection handleDisconnection](self, "handleDisconnection");
    }

    else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
    {
      sub_100039D10();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_ERROR))
  {
    sub_100039D70();
  }
}

- (void)handleDisconnection
{
  v3 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039DD0(v3, self);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[BTLEXpcServer instance](&OBJC_CLASS___BTLEXpcServer, "instance"));
  [v5 handleXpcDisconnection:self];
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  id v5 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039E5C(v5, v4);
  }
  string = xpc_dictionary_get_string(v4, "kMsgId");
  xpc_object_t value = xpc_dictionary_get_value(v4, "kMsgArgs");
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"handle%sMsg:",  string));
  v10 = NSSelectorFromString(v9);

  else {
    id v11 = v8;
  }
  [self v10:v11];
}

- (void)handleConnectOnceMsg:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kPeerIdentifier");
  xpc_object_t xuuid = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  id v4 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(xuuid));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](&OBJC_CLASS___ConnectionManager, "instance"));
  [v5 connectOnce:v4];
}

- (void)handleConnectAlwaysMsg:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kPeerIdentifiers");
  xpc_object_t xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_1000149E4;
  applier[3] = &unk_10005CFF0;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = v8;
  xpc_array_apply(xarray, applier);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](&OBJC_CLASS___ConnectionManager, "instance"));
  [v5 connectAlways:v4];
}

- (void)handlePersistServerServicesMsg:(id)a3
{
  BOOL v3 = xpc_dictionary_get_BOOL(a3, "kPersist");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ServerServiceManager instance](&OBJC_CLASS___ServerServiceManager, "instance"));
  [v4 setPersist:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  [v5 setPersist:v3];
}

- (void)handleNotifyPiconetClockMsg:(id)a3
{
  id v3 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "kPiconetClock");
  uint64_t v5 = xpc_dictionary_get_uint64(v3, "kPiconetPhaseClock");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v10[0] = @"PiconetClockUserInfoKey";
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", uint64));
  v11[0] = v7;
  v10[1] = @"PiconetPhaseClockUserInfoKey";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v5));
  v11[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  [v6 postNotificationName:@"PiconetClockNotification" object:0 userInfo:v9];
}

- (void)handleConnectClassicDeviceMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kDeviceAddress"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "kQuickDisconnectEnabled");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", uint64));
  [v8 connectDevice:v5 quickDisconnectEnabled:v7];
}

- (void)handleDisconnectClassicDeviceMsg:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v6 disconnectDevice:v5];
}

- (void)handleClassicDeviceUnexpectedDisconnectionMsg:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v6 unexpectedDisconnection:v5];
}

- (void)handleVersionInfoRequestMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kEasyPairingVersion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kCloudAccount");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v8 requestVersionInfo:v5 cloudAccount:v7];
}

- (void)handleVersionInfoResponseMsg:(id)a3
{
  id v3 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kEasyPairingVersion"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kCloudAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "kEasyPairingStatus");

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", uint64));
  [v10 respondVersionInfo:v5 cloudAccount:v7 easyPairingStatus:v9];
}

- (void)handleClassicPairStateRequestMsg:(id)a3
{
  id v3 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v6 requestPairStateForDevice:v5];
}

- (void)handleClassicPairStateResponseMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kDevicePairState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v8 respondToPairState:v5 device:v7];
}

- (void)handleStoreClassicLinkKeyRequestMsg:(id)a3
{
  id v3 = a3;
  size_t length = 0LL;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kDeviceLinkKey", &length);
  if (length)
  {
    uint64_t v5 = data;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v7 = (void *)v6;
    if (length)
    {
      for (size_t i = 0LL; i < length; ++i)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5[i]));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 arrayByAddingObject:v9]);

        v7 = v10;
      }
    }

    else
    {
      id v10 = (void *)v6;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
    v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kDeviceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    audit_token_t v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kDeviceAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v11 requestStoreLinkKey:v10 name:v13 device:v15];
  }
}

- (void)handleStoreClassicLinkKeyRequestExtendedMsg:(id)a3
{
  id v3 = a3;
  size_t length = 0LL;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kDeviceLinkKey", &length);
  if (length)
  {
    uint64_t v5 = data;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    v7 = (void *)v6;
    if (length)
    {
      for (size_t i = 0LL; i < length; ++i)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5[i]));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 arrayByAddingObject:v9]);

        v7 = v10;
      }
    }

    else
    {
      id v10 = (void *)v6;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
    v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kDeviceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    audit_token_t v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kDeviceAddress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kDeviceServiceMask"));
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kClassOfDevice"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v11 requestStoreLinkKeyExtended:v10 name:v13 device:v15 deviceServiceMask:v17 classOfDevice:v19];
  }
}

- (void)handleStoreClassicLinkKeyResponseMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kStoreClassicLinkKeyResult"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v8 respondToStoreLinkKey:v5 device:v7];
}

- (void)handleStoreClassicDeviceSettingsMsg:(id)a3
{
  id v3 = a3;
  xpc_object_t value = xpc_dictionary_get_value(v3, "kClassicDeviceSettings");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v6 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
  xpc_object_t xdict = v5;
  if (v5)
  {
    xpc_object_t v7 = xpc_dictionary_get_value(v5, "kCfgDoubleClickInt");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v48 = v8;
    if (v8) {
      int64_t v9 = xpc_int64_get_value(v8);
    }
    else {
      int64_t v9 = 0xFFFFFFFFLL;
    }
    xpc_object_t v11 = xpc_dictionary_get_value(xdict, "kCfgClickHold");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v47 = v12;
    if (v12) {
      int64_t v13 = xpc_int64_get_value(v12);
    }
    else {
      int64_t v13 = 0xFFFFFFFFLL;
    }
    xpc_object_t v14 = xpc_dictionary_get_value(xdict, "kCfgClickHoldInt");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v46 = v15;
    if (v15) {
      int64_t v16 = xpc_int64_get_value(v15);
    }
    else {
      int64_t v16 = 0xFFFFFFFFLL;
    }
    xpc_object_t v17 = xpc_dictionary_get_value(xdict, "kCfgListenModeCfgs");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v45 = v18;
    if (v18) {
      int64_t v19 = xpc_int64_get_value(v18);
    }
    else {
      int64_t v19 = 0xFFFFFFFFLL;
    }
    xpc_object_t v20 = xpc_dictionary_get_value(xdict, "kCfgOneBudANCMode");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (v21) {
      int64_t v23 = xpc_int64_get_value(v21);
    }
    else {
      int64_t v23 = 0xFFFFFFFFLL;
    }
    xpc_object_t v24 = xpc_dictionary_get_value(xdict, "kCfgListenMode");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v25) {
      int64_t v27 = xpc_int64_get_value(v25);
    }
    else {
      int64_t v27 = 0xFFFFFFFFLL;
    }
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ((_DWORD)v9 != -1)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v28, @"kCfgDoubleClickInt");
    }

    if ((_DWORD)v13 != -1)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v13));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v29, @"kCfgClickHold");
    }

    uint64_t v6 = &AFSiriActivationBluetoothDeviceButtonPress_ptr;
    if ((_DWORD)v16 != -1)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v30, @"kCfgClickHoldInt");
    }

    if ((_DWORD)v19 != -1)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v31, @"kCfgListenModeCfgs");
    }

    if ((_DWORD)v23 != -1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v23));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v32, @"kCfgOneBudANCMode");
    }

    if ((_DWORD)v27 != -1)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v27));
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v33, @"kCfgListenMode");
    }
  }

  else
  {
    id v10 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v35 = [v6[135] numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassicDeviceMicMode")];
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  id v37 = [v6[135] numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassicDeviceInEarEnable")];
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  id v39 = [v6[135] numberWithUnsignedLongLong:xpc_dictionary_get_uint64(v3, "kClassicDeviceDoubleTapMode")];
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kDeviceName"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v34 storeDeviceSettings:v36 inEarEnable:v38 doubleTapMode:v40 deviceSettings:v10 deviceName:v42 device:v44];
}

- (void)handleNotifyPrimaryBudSideMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kPrimaryBudSide"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kDeviceAddress");

  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v8 notifyPrimaryBudSide:v5 device:v7];
}

- (void)handleMFiAccessoryAuthMsg:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kPeerIdentifier");
  xpc_object_t xuuid = (xpc_object_t)objc_claimAutoreleasedReturnValue(value);
  id v4 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(xuuid));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ConnectionManager instance](&OBJC_CLASS___ConnectionManager, "instance"));
  [v5 performMFiAuth:v4];
}

- (void)handlePreWarmMFiAccessoryAuthMsg:(id)a3
{
  id v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PreWarmMFiAuth : Launch accessoryd", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](&OBJC_CLASS___ACCTransportClient, "sharedClient"));
  [v4 launchServer];
}

- (void)handleDOAPDeviceConnectedMsg:(id)a3
{
  if ((_os_feature_enabled_impl("SiriTV", "siri_tv_airpods", a3) & 1) != 0)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[CattManager instance](&OBJC_CLASS___CattManager, "instance"));
    [v4 registerServices];
  }

  else
  {
    id v3 = (os_log_s *)qword_100070CC8;
    if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "DoAP: SiriSpeaks is not feature enabled",  buf,  2u);
    }
  }

- (void)handleUARPDeviceConnectedMsg:(id)a3
{
  id v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "UARP not supported", v4, 2u);
  }

- (void)handleUARPAACPTransportChangeMsg:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kUARPDeviceUUID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v5 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v4));
  uint64_t v6 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039EE8(v6, v5);
  }
  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  [v7 addUARPTransportDict:v5 UARPAACPSupported:v8];
}

- (void)handleUARPDataOverAACPMsg:(id)a3
{
  size_t length = 0LL;
  id v3 = a3;
  xpc_object_t value = xpc_dictionary_get_value(v3, "kUARPDeviceUUID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  uint64_t v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
  data = xpc_dictionary_get_data(v3, "kUARPData", &length);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", data, length));
  int64_t v9 = (void *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_100039F7C(v9, v6);
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UARPServiceUARPControllerManager instance]( &OBJC_CLASS___UARPServiceUARPControllerManager,  "instance"));
  [v10 relayAACPUARP:v6 uarpMsg:v8 error:0];
}

- (void)handleHRMDeviceConnectedMsg:(id)a3
{
  id v3 = (os_log_s *)qword_100070CC8;
  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HRM (Classic) not supported", v4, 2u);
  }

- (void)handleLeaEasyPairRequestMsg:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_object_t value = xpc_dictionary_get_value(xdict, "kLeaDeviceTags");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (xpc_array_get_count(v4))
    {
      size_t v6 = 0LL;
      do
      {
        xpc_object_t v7 = xpc_array_get_value(v4, v6);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        int64_t v9 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_string_get_string_ptr(v8),  1LL);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        [v5 addObject:v10];

        ++v6;
      }

      while (v6 < xpc_array_get_count(v4));
    }

    xpc_object_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
    v12 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, "kLeaDeviceAddress"));
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    xpc_object_t v14 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(xdict, "kLeaDeviceIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    [v11 requestLeaEasyPair:v13 deviceIdentifier:v15 deviceTags:v5];
  }
}

- (void)handleLeaEasyPairResponseMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kLeaDevicePairState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kLeaDeviceAddress");

  xpc_object_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v8 respondToLeaEasyPair:v5 device:v7];
}

- (void)handleLeaStoreBondingInfoRequestMsg:(id)a3
{
  id v3 = a3;
  size_t v30 = 0LL;
  size_t length = 0LL;
  size_t v29 = 0LL;
  data = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceRand", &length);
  uint64_t v5 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceLtk", &v30);
  size_t v6 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "kLeaDeviceIrk", &v29);
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  id v8 = (void *)v7;
  if (length)
  {
    for (size_t i = 0LL; i < length; ++i)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", data[i]));
      xpc_object_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 arrayByAddingObject:v10]);

      id v8 = v11;
    }
  }

  else
  {
    xpc_object_t v11 = (void *)v7;
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  int64_t v13 = (void *)v12;
  if (v30)
  {
    for (size_t j = 0LL; j < v30; ++j)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v5[j]));
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:v15]);

      int64_t v13 = v16;
    }
  }

  else
  {
    int64_t v16 = (void *)v12;
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  v18 = (void *)v17;
  if (v29)
  {
    for (size_t k = 0LL; k < v29; ++k)
    {
      xpc_object_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", v6[k]));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v18 arrayByAddingObject:v20]);

      v18 = v21;
    }
  }

  else
  {
    v21 = (void *)v17;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  int64_t v23 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kLeaDeviceEdiv"));
  xpc_object_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kLeaDeviceName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  int64_t v27 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, "kLeaDeviceAddress"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v22 requestLeaStoreBondingInfo:v24 rand:v11 ltk:v16 irk:v21 name:v26 device:v28];
}

- (void)handleLeaStoreBondingInfoResponseMsg:(id)a3
{
  id v3 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[EndpointManager instance](&OBJC_CLASS___EndpointManager, "instance"));
  id v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_dictionary_get_uint64(v3, "kLeaStoreBondingInfoResult"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  string = xpc_dictionary_get_string(v3, "kLeaDeviceAddress");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
  [v8 respondToLeaStoreBondingInfo:v5 device:v7];
}

+ (id)createNSDictionaryFromXpcDictionary:(id)a3
{
  id v3 = a3;
  size_t count = xpc_dictionary_get_count(v3);
  uint64_t v5 = 8 * count;
  size_t v6 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v6, 8 * count);
  bzero(v6, 8 * count);
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x2020000000LL;
  v12[3] = 0LL;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472LL;
  applier[2] = sub_10001654C;
  applier[3] = &unk_10005D018;
  void applier[4] = v12;
  applier[5] = v6;
  applier[6] = v6;
  xpc_dictionary_apply(v3, applier);
  uint64_t v7 = -[NSDictionary initWithObjects:forKeys:count:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjects:forKeys:count:",  v6,  v6,  count);
  _Block_object_dispose(v12, 8);
  if (count)
  {
    uint64_t v8 = 8 * count;
    do
    {

      v8 -= 8LL;
    }

    while (v8);
    int64_t v9 = v6 - 8;
    do
    {

      v5 -= 8LL;
    }

    while (v5);
  }

  return v7;
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  xpc_dictionary_set_string(v8, "kMsgId", v10);
  if (v6)
  {
    xpc_object_t v11 = (void *)_CFXPCCreateXPCObjectFromCFObject(v6);
    xpc_dictionary_set_value(v8, "kMsgArgs", v11);
  }

  if (os_log_type_enabled((os_log_t)qword_100070CC8, OS_LOG_TYPE_DEBUG)) {
    sub_10003A03C();
  }
  uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[BTLEXpcConnection connection](self, "connection"));
  xpc_connection_send_message(v12, v8);
}

- (void)authenticationDidSucceed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"AuthenticationServiceCertClassUserInfoKey"]);

    v13[0] = @"kPeerIdentifier";
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 msgIdentifier]);
    v13[1] = @"kCertClass";
    v14[0] = v9;
    v14[1] = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
    -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", @"AuthenticationDidSucceed", v10);
  }

  else
  {
    xpc_object_t v11 = @"kPeerIdentifier";
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 msgIdentifier]);
    uint64_t v12 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", @"AuthenticationDidSucceed", v9);
  }
}

- (void)authenticationDidFail:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v7 = @"kPeerIdentifier";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 msgIdentifier]);
  xpc_object_t v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", @"AuthenticationDidFail", v6);
}

- (void)peerIsUsingBuiltinService:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v7 = @"kPeerIdentifier";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 msgIdentifier]);
  xpc_object_t v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", @"PeerIsUsingBuiltinService", v6);
}

- (void)peerIsNotUsingBuiltinService:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v7 = @"kPeerIdentifier";
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 msgIdentifier]);
  xpc_object_t v8 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[BTLEXpcConnection sendMsg:args:](self, "sendMsg:args:", @"PeerIsNotUsingBuiltinService", v6);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end