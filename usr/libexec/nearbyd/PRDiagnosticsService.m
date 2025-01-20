@interface PRDiagnosticsService
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)validateClientEntitlements:(id)a3;
- (NSArray)machServicesNames;
- (PRDiagnosticsService)init;
- (void)getChipInfoSync:(BOOL)a3 reply:(id)a4;
- (void)getChipPublicKey:(id)a3;
- (void)getChipType:(id)a3;
- (void)getDeepSleepState:(id)a3;
- (void)getPowerStatsWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)getPreflightInfo:(id)a3;
- (void)getRoseChipPowerState:(id)a3;
- (void)handleXPCDisconnection;
- (void)hasFailedRoseUpdate:(id)a3;
- (void)injectIsoCode:(id)a3;
- (void)prepareForRegulatoryAssistance:(id)a3;
- (void)publishBytes:(char *)a3 amount:(unint64_t)a4;
- (void)requestPowerChange:(BOOL)a3 reply:(id)a4;
- (void)sendHelloWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)setNarrowbandSarState:(int64_t)a3 reply:(id)a4;
- (void)setRegulatoryAccessoryState:(id)a3 reply:(id)a4;
- (void)setRegulatoryIsoCountry:(id)a3 reply:(id)a4;
- (void)setRegulatoryMcc:(id)a3 reply:(id)a4;
- (void)setRoseGlobalConfigParams:(id)a3 reply:(id)a4;
- (void)startStreamingProtobufDataForClientId:(id)a3 reply:(id)a4;
- (void)stopStreamingProtobufDataForClientId:(id)a3 reply:(id)a4;
- (void)triggerLogCollection:(int64_t)a3 reply:(id)a4;
@end

@implementation PRDiagnosticsService

- (PRDiagnosticsService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PRDiagnosticsService;
  v2 = -[PRDiagnosticsService init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_protobufLock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    protobufClients = v3->_protobufClients;
    v3->_protobufClients = v4;

    v6 = (std::recursive_mutex *)sub_100288340();
    sub_100288488(v6, v3);
  }

  return v3;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003882E8(v5);
  }
  int v6 = [v4 processIdentifier];
  BOOL v7 = -[PRDiagnosticsService validateClientEntitlements:](self, "validateClientEntitlements:", v4);
  objc_super v8 = (os_log_s *)qword_1008000A0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_100388208(v6, v8);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.nearbyd.protobuf-client"]);
    if (v10 && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v9), (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
    {
      unsigned int v12 = [v10 BOOLValue];

      if (v12)
      {
        id v13 = sub_1001558A8();
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        [v4 setRemoteObjectInterface:v14];

        id v15 = sub_100155824();
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        [v4 setExportedInterface:v16];
        goto LABEL_19;
      }
    }

    else
    {
    }

    if (sub_1000044D4(v4))
    {
      v17 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#reg-assist, setExportedInterface,calling",  (uint8_t *)buf,  2u);
      }

      id v18 = sub_100155930();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      [v4 setExportedInterface:v19];

      v20 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#reg-assist, setExportedInterface,called",  (uint8_t *)buf,  2u);
      }

      goto LABEL_20;
    }

    [v4 setRemoteObjectInterface:0];
    id v21 = sub_100155690();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v4 setExportedInterface:v16];
LABEL_19:

LABEL_20:
    [v4 setExportedObject:self];
    objc_initWeak(buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10000454C;
    v29[3] = &unk_1007A1A90;
    int v31 = v6;
    objc_copyWeak(&v30, buf);
    [v4 setInterruptionHandler:v29];
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    v25 = sub_100004624;
    v26 = &unk_1007A1A90;
    int v28 = v6;
    objc_copyWeak(&v27, buf);
    [v4 setInvalidationHandler:&v23];
    objc_msgSend(v4, "resume", v23, v24, v25, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
    goto LABEL_21;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_100388278(v6, v8);
  }
LABEL_21:

  return v7;
}

- (NSArray)machServicesNames
{
  return (NSArray *)&off_1007D2118;
}

- (void)getChipInfoSync:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000047F8;
  v14[3] = &unk_1007A1AB8;
  id v5 = a4;
  id v15 = v5;
  int v6 = objc_retainBlock(v14);
  BOOL v7 = sub_100288340();
  if (v4)
  {
    uint64_t v8 = sub_10028B02C((uint64_t)v7, (uint64_t)&v12);
    uint64_t v10 = v13;
    __int128 v9 = v12;
    char v11 = 1;
    ((void (*)(void *, uint64_t, __int128 *))v6[2])(v6, v8, &v9);
  }

  else
  {
    sub_10028B034((uint64_t)v7, v6);
  }
}

- (void)getPreflightInfo:(id)a3
{
  id v5 = (void (**)(void))a3;
  v3 = sub_100288340();
  BOOL v4 = (void *)sub_10028B01C((uint64_t)v3);
  v5[2]();
  if (v4) {
}
  }

- (void)hasFailedRoseUpdate:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  v3 = sub_100288340();
  uint64_t v4 = sub_10028B024((uint64_t)v3);
  v5[2](v5, v4);
}

- (void)sendHelloWithTimeout:(unint64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  int v6 = sub_100288340();
  sub_100288528((uint64_t)v6, a3, v9);
  if (v10)
  {
    id v7 = objc_alloc(&OBJC_CLASS___PRHelloResponse);
    if (!v10) {
      sub_100006080();
    }
    id v8 = [v7 initWithHelloResponse:v9];
    v5[2](v5, v8);
  }

  else
  {
    v5[2](v5, 0LL);
  }

  sub_1000060B4((uint64_t)v9);
}

- (void)getPowerStatsWithTimeout:(unint64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  int v6 = sub_100288340();
  sub_10028B170((uint64_t)v6, a3, (uint64_t)v9);
  if (v10)
  {
    id v7 = objc_alloc(&OBJC_CLASS___PRGetPowerStatsResponse);
    if (!v10) {
      sub_100006080();
    }
    id v8 = [v7 initWithGetPowerStatsResponse:v9];
    v5[2](v5, v8);
  }

  else
  {
    v5[2](v5, 0LL);
  }
}

- (void)setRegulatoryMcc:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, BOOL))a4;
  id v6 = v8;
  if (v8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRGlobalDebugSettings sharedSettings](&OBJC_CLASS___PRGlobalDebugSettings, "sharedSettings"));
    [v7 setObject:v8 forKey:PRDebugConfigArgMcc];

    id v6 = v8;
  }

  v5[2](v5, v6 != 0LL);
}

- (void)setRegulatoryIsoCountry:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, BOOL))a4;
  id v6 = v8;
  if (v8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRGlobalDebugSettings sharedSettings](&OBJC_CLASS___PRGlobalDebugSettings, "sharedSettings"));
    [v7 setObject:v8 forKey:PRDebugConfigArgIsoCountry];

    id v6 = v8;
  }

  v5[2](v5, v6 != 0LL);
}

- (void)setRegulatoryAccessoryState:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, BOOL))a4;
  id v6 = v8;
  if (v8)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRGlobalDebugSettings sharedSettings](&OBJC_CLASS___PRGlobalDebugSettings, "sharedSettings"));
    [v7 setObject:v8 forKey:PRDebugConfigArgAccessoryState];

    id v6 = v8;
  }

  v5[2](v5, v6 != 0LL);
}

- (void)triggerLogCollection:(int64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  memset(&v24, 0, sizeof(v24));
  id v6 = sub_100005150();
  sub_1000062D0(v22, (uint64_t)v6);
  if (v23)
  {
    id v7 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (!v23) {
        sub_100006080();
      }
      sub_10034C490((uint64_t)v22, &v25);
      if ((v25.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        id v8 = &v25;
      }
      else {
        id v8 = (std::stringbuf::string_type *)v25.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315138;
      id v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cached Hello Response: %s", buf, 0xCu);
    }
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionaryRepresentation]);

  char v11 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v10 count];
    LODWORD(v25.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(v25.__r_.__value_.__r.__words[0]) = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "===== Current defaults (%d) =====",  (uint8_t *)&v25,  8u);
  }

  [v10 enumerateKeysAndObjectsUsingBlock:&stru_1007A1AF8];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 printableState]);

  id v15 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25.__r_.__value_.__l.__data_) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "===== Findable Device =====",  (uint8_t *)&v25,  2u);
  }

  [v14 enumerateObjectsUsingBlock:&stru_1007A1B38];
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NIServerFindingSession sharedServicePrintableState]( &OBJC_CLASS___NIServerFindingSession,  "sharedServicePrintableState"));

  v17 = (void *)v16;
  id v18 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25.__r_.__value_.__l.__data_) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "===== Finding Service =====",  (uint8_t *)&v25,  2u);
  }

  [v17 enumerateObjectsUsingBlock:&stru_1007A1B58];
  v19 = "sysdiagnose-triggered";
  switch(a3)
  {
    case 0LL:
      goto LABEL_19;
    case 1LL:
      std::string::assign(&v24, "user-triggered-non-fatal");
      a3 = 1LL;
      break;
    case 2LL:
      std::string::assign(&v24, "user-triggered-fatal");
      a3 = 0LL;
      break;
    case 3LL:
      std::string::assign(&v24, "user-triggered-dump-all-existing-logs-if-crashlog");
      a3 = 2LL;
      break;
    case 4LL:
      v19 = "user-triggered-dump-all-existing-logs";
LABEL_19:
      std::string::assign(&v24, v19);
      a3 = 3LL;
      break;
    default:
      break;
  }

  v20 = sub_100288340();
  uint64_t v21 = sub_10028B03C((uint64_t)v20, a3, &v24);
  v5[2](v5, v21);

  sub_1000060B4((uint64_t)v22);
}

- (void)setRoseGlobalConfigParams:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v5)
  {
    id v17 = 0LL;
    uint64_t v8 = sub_10000E048(v5, &v17);
    id v9 = v17;
    if ((v8 & 1) == 0)
    {
      char v10 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100388324((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    v7[2](v7, v8);
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)getRoseChipPowerState:(id)a3
{
  v3 = (void (**)(id, uint64_t, uint64_t))a3;
  __int16 v9 = 0;
  uint64_t v4 = sub_100288340();
  if ((sub_10028B178((uint64_t)v4, (BOOL *)&v9 + 1) & 1) != 0)
  {
    if (!HIBYTE(v9))
    {
      uint64_t v7 = 0LL;
LABEL_12:
      uint64_t v8 = 1LL;
      goto LABEL_13;
    }

    id v5 = sub_100288340();
    if (sub_10028B188((uint64_t)v5, &v9))
    {
      if (HIBYTE(v9)) {
        BOOL v6 = v9 == 0;
      }
      else {
        BOOL v6 = 0;
      }
      uint64_t v7 = v6;
      goto LABEL_12;
    }
  }

  uint64_t v8 = 0LL;
  uint64_t v7 = 0LL;
LABEL_13:
  v3[2](v3, v8, v7);
}

- (void)requestPowerChange:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v5 = sub_100288340();
  uint64_t v6 = sub_10028B180((uint64_t)v5, v4);
  v7[2](v7, v6);
}

- (void)getChipType:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  int v3 = sub_100353940();
  if (v3) {
    uint64_t v4 = 2LL * (v3 == 1);
  }
  else {
    uint64_t v4 = 1LL;
  }
  v5[2](v5, v4);
}

- (void)getChipPublicKey:(id)a3
{
  id v5 = (void (**)(void))a3;
  int v3 = sub_100288340();
  CFDataRef v4 = sub_10028B190((uint64_t)v3);
  v5[2]();
  if (v4) {
}
  }

- (void)setNarrowbandSarState:(int64_t)a3 reply:(id)a4
{
  __int16 v9 = (void (**)(id, uint64_t))a4;
  if (a3 == 3)
  {
    uint64_t v7 = 2LL;
LABEL_8:
    uint64_t v8 = sub_100288340();
    uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)v8 + 136LL))(v8, v7);
    goto LABEL_9;
  }

  if (a3 == 2)
  {
    uint64_t v7 = 1LL;
    goto LABEL_8;
  }

  if (a3)
  {
    uint64_t v7 = 0LL;
    goto LABEL_8;
  }

  id v5 = sub_100288340();
  uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v5 + 144LL))(v5);
LABEL_9:
  v9[2](v9, v6);
}

- (void)getDeepSleepState:(id)a3
{
  int v3 = (void (**)(id, void))a3;
  CFDataRef v4 = sub_100288340();
  unsigned __int16 v5 = sub_10028B6A4((uint64_t)v4);
  unsigned __int8 v6 = v5;
  unsigned int v7 = v5;
  uint64_t v8 = (os_log_s *)qword_1008000A0;
  BOOL v9 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (v7 > 0xFF)
  {
    if (v9)
    {
      if (v6 > 2u) {
        uint64_t v11 = "";
      }
      else {
        uint64_t v11 = off_1007A1C58[(char)v6];
      }
      int v12 = 136315138;
      uint64_t v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#deep-slp PRDiagnosticsService getDeepSleepState %s",  (uint8_t *)&v12,  0xCu);
    }

    if (v6 >= 3u) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = v6 + 1;
    }
  }

  else
  {
    if (v9)
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#deep-slp PRDiagnosticsService getDeepSleepState nullopt",  (uint8_t *)&v12,  2u);
    }

    uint64_t v10 = 0LL;
  }

  v3[2](v3, v10);
}

- (void)startStreamingProtobufDataForClientId:(id)a3 reply:(id)a4
{
  id v8 = a3;
  unsigned __int8 v6 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(&self->_protobufLock);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_protobufClients, "setObject:forKeyedSubscript:", v7, v8);

  os_unfair_lock_unlock(&self->_protobufLock);
  v6[2](v6, 1LL);
}

- (void)stopStreamingProtobufDataForClientId:(id)a3 reply:(id)a4
{
  id v7 = a3;
  unsigned __int8 v6 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(&self->_protobufLock);
  -[NSMutableDictionary removeObjectForKey:](self->_protobufClients, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(&self->_protobufLock);
  v6[2](v6, 1LL);
}

- (void)prepareForRegulatoryAssistance:(id)a3
{
  int v3 = (void (**)(id, void))a3;
  CFDataRef v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#reg-assist, prepareForRegulatoryAssistance called.",  v9,  2u);
  }

  unsigned __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  unsigned __int8 v6 = sub_1000044D4(v5);

  if ((v6 & 1) != 0)
  {
    v3[2](v3, 0LL);
  }

  else
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    uint64_t v11 = @"Insufficient entitlements.";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.Proximity.ErrorDomain",  999LL,  v7));
    ((void (**)(id, void *))v3)[2](v3, v8);
  }
}

- (void)injectIsoCode:(id)a3
{
  id v3 = a3;
  CFDataRef v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#reg-assist, injectIsoCode called.",  (uint8_t *)__p,  2u);
  }

  unsigned __int16 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  if ((sub_1000044D4(v5) & 1) != 0)
  {
    if (v3)
    {
      id v6 = v3;
      sub_1000065CC(__p, (char *)[v6 UTF8String]);
      id v7 = sub_100288340();
      char v8 = (*(uint64_t (**)(void *, void **))(*(void *)v7 + 128LL))(v7, __p);
      BOOL v9 = (os_log_s *)qword_1008000A0;
      if ((v8 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#reg-assist, successfully inject iso code: %@.",  buf,  0xCu);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        sub_1003883C4((uint64_t)v6, v9, v18, v19, v20, v21, v22, v23);
      }

      if (v25 < 0) {
        operator delete(__p[0]);
      }
    }

    else
    {
      id v17 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100388388(v17);
      }
    }
  }

  else
  {
    NSErrorUserInfoKey v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100388428((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (BOOL)validateClientEntitlements:(id)a3
{
  CFDataRef v4 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.nearbyd.diagnostics"]);
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)handleXPCDisconnection
{
  v2 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "[PRDiagnosticsService] xpc disconnection",  v3,  2u);
  }

- (void)publishBytes:(char *)a3 amount:(unint64_t)a4
{
  if (a4 >= 0x3E9) {
    sub_10038848C();
  }
  p_protobufLock = &self->_protobufLock;
  os_unfair_lock_lock(&self->_protobufLock);
  char v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  a3,  a4,  0LL));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  BOOL v9 = self->_protobufClients;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(id *)(*((void *)&v16 + 1) + 8LL * (void)v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_protobufClients,  "objectForKeyedSubscript:",  v13,  (void)v16));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 remoteObjectProxy]);
        [v15 consumeProtobufBytes:v8];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v10);
  }

  os_unfair_lock_unlock(p_protobufLock);
}

- (void).cxx_destruct
{
}

@end