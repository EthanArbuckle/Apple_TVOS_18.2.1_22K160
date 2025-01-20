@interface NESMLegacySession
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (int)type;
- (void)dealloc;
- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5;
- (void)handleDeviceLock;
- (void)handleDeviceUnlock;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleSecuritySessionInfoRequest:(id)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)install;
- (void)uninstall;
@end

@implementation NESMLegacySession

- (int)type
{
  if (self) {
    LODWORD(self) = self->_sessionType;
  }
  return (int)self;
}

- (void)dealloc
{
  if (self && self->_bridge)
  {
    if (qword_1000CFBE0 != -1) {
      dispatch_once(&qword_1000CFBE0, &stru_1000BE370);
    }
    (*(void (**)(_ne_sm_bridge *))(qword_1000CFBD8 + 8))(self->_bridge);
    self->_bridge = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMLegacySession;
  -[NESMSession dealloc](&v3, "dealloc");
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t value = xpc_dictionary_get_value(v4, "SessionOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (qword_1000CFBE0 != -1) {
    dispatch_once(&qword_1000CFBE0, &stru_1000BE370);
  }
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___NESMLegacySession;
  -[NESMSession handleStartMessage:](&v72, "handleStartMessage:", v4, qword_1000CFBD8);
  v7 = &AnalyticsSendEventLazy_ptr;
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
    uint64_t v9 = isa_nsdictionary(v8);
    if ((v9 & 1) != 0)
    {
      v11 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v8);

      if (v11) {
        goto LABEL_12;
      }
    }

    else
    {
      uint64_t v12 = ne_log_obj(v9, v10);
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to convert the XPC options dictionary to a CFDictionary",  buf,  2u);
      }
    }
  }

  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
LABEL_12:
  v66 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v11,  "objectForKeyedSubscript:",  @"OutgoingInterface"));
  if ((isa_nsstring(v14) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 primaryPhysicalInterface]);

    if (!v16) {
      goto LABEL_16;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryPhysicalInterface]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 interfaceName]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v18,  @"OutgoingInterface");
  }

LABEL_16:
  v19 = v11;
  v21 = v19;
  v65 = v6;
  if (!self)
  {

    v58 = 0LL;
    id Property = 0LL;
    goto LABEL_73;
  }

  v22 = (char *)objc_msgSend(objc_getProperty(self, v20, 360, 1), "type");
  id v24 = objc_msgSend(objc_getProperty(self, v23, 360, 1), "passwordKeychainItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v27 = objc_msgSend(objc_getProperty(self, v26, 360, 1), "username");
  v68 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (v21)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", kSCEntNetIPSec));
    else {
      v29 = 0LL;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", kSCEntNetPPP));

    else {
      v30 = 0LL;
    }

    v7 = &AnalyticsSendEventLazy_ptr;
    if (v29)
    {
      if (v30) {
        goto LABEL_27;
      }
LABEL_30:
      v30 = (NSMutableDictionary *)objc_alloc_init((Class)v7[215]);
      if (v25) {
        goto LABEL_28;
      }
      goto LABEL_31;
    }
  }

  else
  {
    v30 = 0LL;
  }

  v29 = (NSMutableDictionary *)objc_alloc_init((Class)v7[215]);
  if (!v30) {
    goto LABEL_30;
  }
LABEL_27:
  if (v25)
  {
LABEL_28:
    id v67 = [v25 copyPassword];
    goto LABEL_32;
  }

- (void)handleStopMessageWithReason:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NESMLegacySession;
  -[NESMSession handleStopMessageWithReason:](&v5, "handleStopMessageWithReason:", *(void *)&a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100063870;
  v4[3] = &unk_1000BEC08;
  v4[4] = self;
  sub_10005EEA8((uint64_t)self, v4);
}

- (BOOL)handleSleep
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000637CC;
  v3[3] = &unk_1000BEC08;
  v3[4] = self;
  sub_10005EEA8((uint64_t)self, v3);
  return 1;
}

- (void)handleSleepTime:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10006375C;
  v3[3] = &unk_1000BEB20;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  sub_10005EEA8((uint64_t)self, v3);
}

- (void)handleWakeup
{
  objc_super v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000636E4;
  block[3] = &unk_1000BEC08;
  block[4] = self;
  dispatch_async(v3, block);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000636F0;
  v4[3] = &unk_1000BEC08;
  v4[4] = self;
  sub_10005EEA8((uint64_t)self, v4);
}

- (void)handleChangeEventForInterface:(id)a3 newFlags:(unint64_t)a4 previousFlags:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NESMLegacySession;
  -[NESMSession handleChangeEventForInterface:newFlags:previousFlags:]( &v13,  "handleChangeEventForInterface:newFlags:previousFlags:",  v8,  a4,  a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000632C0;
  v10[3] = &unk_1000BE8D8;
  v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a4;
  id v9 = v8;
  sub_10005EEA8((uint64_t)self, v10);
}

- (void)handleSecuritySessionInfoRequest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000631D0;
  v5[3] = &unk_1000BEBE0;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  sub_10005EEA8((uint64_t)self, v5);
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100062E98;
  v6[3] = &unk_1000BEDA8;
  int v9 = a4;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  sub_10005EEA8((uint64_t)self, v6);
}

- (void)install
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100061758;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (void)uninstall
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000615DC;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    uint64_t v7 = ne_log_obj(v4, v5);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 VPN]);
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = [v9 isEnabled];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: enabled = %d", buf, 0x12u);
    }

    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___NESMLegacySession;
    if (-[NESMSession handleUpdateConfiguration:](&v17, "handleUpdateConfiguration:", v6))
    {
      if (self && self->_sessionType == 2)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appVPN]);
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 protocol]);
      }

      else
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 VPN]);
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue([v11 protocol]);
        if (!self)
        {
LABEL_11:

          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_100061560;
          v16[3] = &unk_1000BEC08;
          v16[4] = self;
          sub_10005EEA8((uint64_t)self, v16);
          BOOL v14 = 1;
          goto LABEL_12;
        }
      }

      objc_setProperty_atomic(self, v12, v13, 360LL);
      goto LABEL_11;
    }
  }

  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)handleUserLogout
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000614E4;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (void)handleUserSwitch
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100061468;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (void)handleDeviceLock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000613EC;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (void)handleDeviceUnlock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100061370;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (void)handleInstalledAppsChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100060BF0;
  v2[3] = &unk_1000BEC08;
  v2[4] = self;
  sub_10005EEA8((uint64_t)self, v2);
}

- (void)handleInitializeState
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](v2, "configuration"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@:%d",  v5,  -[NESMLegacySession type](v2, "type")));
  -[NESMSession setAuxiliaryDataKey:](v2, "setAuxiliaryDataKey:", v6);

  -[NESMSession setupFromAuxiliaryData](v2, "setupFromAuxiliaryData");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession lastDisconnectError](v2, "lastDisconnectError"));
  id v8 = v7;
  if (v7)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    unsigned int v10 = [v9 isEqualToString:@"NEVPNConnectionErrorDomainIPSec"];

    if (v10)
    {
      v16 = @"LastCause";
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v8 code]));
      objc_super v17 = v11;
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10005EE28;
      v14[3] = &unk_1000BEBE0;
      v14[4] = v2;
      id v13 = v12;
      id v15 = v13;
      sub_10005EEA8((uint64_t)v2, v14);
    }
  }

  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
}

@end