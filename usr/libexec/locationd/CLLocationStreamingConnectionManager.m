@interface CLLocationStreamingConnectionManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)pairIsNearby;
- (BOOL)rapportLinkActive;
- (CLLocationStreamingConnectionManager)init;
- (IDSService)service;
- (NSMutableDictionary)unacknowledgedMessages;
- (NSMutableSet)clients;
- (RPCompanionLinkClient)rapportLink;
- (id)packageMessage:(id)a3;
- (void)activateRapportLinkIfNecessary;
- (void)addClient:(id)a3;
- (void)beginService;
- (void)endService;
- (void)retireClient:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageIDS:(id)a3;
- (void)sendMessageRapport:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setClients:(id)a3;
- (void)setPairIsNearby:(BOOL)a3;
- (void)setRapportLink:(id)a3;
- (void)setRapportLinkActive:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
- (void)setUnacknowledgedMessages:(id)a3;
- (void)updateNearbyStatusWithCompanionLinkDevice:(id)a3 didConnect:(BOOL)a4;
- (void)updateNearbyStatusWithDevices:(id)a3;
- (void)withClients:(id)a3;
@end

@implementation CLLocationStreamingConnectionManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101994190 != -1) {
    dispatch_once(&qword_101994190, &stru_1018305B8);
  }
  return (id)qword_101994188;
}

+ (BOOL)isSupported
{
  if (qword_1019941A0 != -1) {
    dispatch_once(&qword_1019941A0, &stru_1018305D8);
  }
  return byte_101994198;
}

- (CLLocationStreamingConnectionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationStreamingConnectionManager;
  result = -[CLLocationStreamingConnectionManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLocationStreamingConnectionManagerServiceProtocol,  &OBJC_PROTOCOL___CLLocationStreamingConnectionManagerClientProtocol);
  if (result) {
    result->_rapportLinkActive = 0;
  }
  return result;
}

- (void)updateNearbyStatusWithCompanionLinkDevice:(id)a3 didConnect:(BOOL)a4
{
  BOOL v4 = a4;
  if (objc_msgSend(objc_msgSend(a3, "effectiveIdentifier"), "hasPrefix:", @"BTPipe")
    && self->_pairIsNearby != v4)
  {
    self->_BOOL pairIsNearby = v4;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    v6 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      BOOL pairIsNearby = self->_pairIsNearby;
      *(_DWORD *)buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 1026;
      BOOL v14 = pairIsNearby;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Nearby status change, is nearby:%{public}d}",  buf,  0x18u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002EE024;
    v8[3] = &unk_101830600;
    v8[4] = self;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v8);
  }

- (void)updateNearbyStatusWithDevices:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v9 isDefaultPairedDevice] && objc_msgSend(v9, "isNearby"))
        {
          BOOL v10 = [v9 relationship] == (id)1;
          goto LABEL_12;
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v10 = 0;
LABEL_12:
  if (self->_pairIsNearby != v10)
  {
    self->_BOOL pairIsNearby = v10;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    __int16 v11 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      BOOL pairIsNearby = self->_pairIsNearby;
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 1026;
      BOOL v23 = pairIsNearby;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Nearby status change, is nearby:%{public}d}",  buf,  0x18u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002EE248;
    v13[3] = &unk_101830600;
    v13[4] = self;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v13);
  }

- (void)activateRapportLinkIfNecessary
{
  if (!self->_rapportLink)
  {
    self->_rapportLink = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:]( self->_rapportLink,  "setDispatchQueue:",  objc_msgSend(objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo"), "queue"));
    -[RPCompanionLinkClient setControlFlags:](self->_rapportLink, "setControlFlags:", 32LL);
  }

  if (!-[CLLocationStreamingConnectionManager rapportLinkActive](self, "rapportLinkActive"))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002EE3C0;
    v6[3] = &unk_101830628;
    v6[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:]( -[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"),  "activateWithCompletion:",  v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1002EE4C0;
    v5[3] = &unk_101830650;
    v5[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:]( -[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"),  "setDeviceFoundHandler:",  v5);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1002EE634;
    v4[3] = &unk_101830650;
    v4[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:]( -[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"),  "setDeviceLostHandler:",  v4);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_1002EE7A8;
    v3[3] = &unk_1018306A0;
    v3[4] = self;
    -[RPCompanionLinkClient registerEventID:options:handler:]( -[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink"),  "registerEventID:options:handler:",  @"com.apple.locationd.rapport.event",  0LL,  v3);
  }

- (void)setSilo:(id)a3
{
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101830788);
  }
  id v5 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:suspending silo until IDS becomes available}",  buf,  0x12u);
  }

  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLLocationStreamingConnectionManager;
  -[CLLocationStreamingConnectionManager setSilo:](&v8, "setSilo:", a3);
  if (qword_101934990 != -1) {
    dispatch_once(&qword_101934990, &stru_101830788);
  }
  id v6 = (os_log_s *)qword_101934998;
  if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:waiting on IDS to become available}",  buf,  0x12u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002EEE08;
  v7[3] = &unk_1018306C8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:]( &OBJC_CLASS___IDSService,  "serviceWithIdentifier:completion:",  @"com.apple.private.alloy.location.stream",  v7);
}

- (void)beginService
{
}

- (void)endService
{
  self->_rapportLinkActive = 0;
  self->_rapportLink = 0LL;
  -[CLLocationStreamingConnectionManager setUnacknowledgedMessages:](self, "setUnacknowledgedMessages:", 0LL);
  -[CLLocationStreamingConnectionManager setClients:](self, "setClients:", 0LL);
  -[CLLocationStreamingConnectionManager setService:](self, "setService:", 0LL);
}

- (void)addClient:(id)a3
{
}

- (void)retireClient:(id)a3
{
}

- (id)packageMessage:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "messageType"),  @"kCLLocationStreamingMessageKeyType");
  objc_msgSend( v4,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(a3, "protocolVersion")),  @"kCLLocationStreamingMessageKeyVersion");
  if ([a3 payload]) {
    objc_msgSend( v4,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "payload"),  @"kCLLocationStreamingMessageKeyPayload");
  }
  return v4;
}

- (void)sendMessageIDS:(id)a3
{
  id v5 = -[CLLocationStreamingConnectionManager packageMessage:](self, "packageMessage:");
  __int128 v22 = 0uLL;
  id v6 = -[CLLocationStreamingConnectionManager service](self, "service");
  unsigned __int8 v7 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:]( v6,  "sendMessage:toDestinations:priority:options:identifier:error:",  v5,  +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice),  [a3 priority],  objc_msgSend(a3, "idsOptions"),  (char *)&v22 + 8,  &v22);
  if (v22 == 0)
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    v12 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      id v13 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2082;
      id v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:No error, but also no identifier, message type:%{public, location:escape_only}s}",  buf,  0x1Cu);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101830788);
      }
    }

    __int128 v14 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      id v15 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289282;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2082;
      id v28 = v15;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "No error, but also no identifier",  "{msg%{public}.0s:No error, but also no identifier, message type:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }
  }

  else if ((void)v22)
  {
    unsigned __int8 v8 = v7;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    v9 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (void *)v22;
      id v11 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      *(_DWORD *)buf = 68289538;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2114;
      id v28 = v10;
      __int16 v29 = 2082;
      id v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#warning Got error from IDS, error:%{public, location:escape_only}@, message type :%{public, location:escape_only}s}",  buf,  0x26u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1002EF638;
    v20[3] = &unk_1018306F0;
    v20[4] = a3;
    v20[5] = v22;
    unsigned __int8 v21 = v8;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v20);
  }

  else
  {
    __int128 v16 = -[CLLocationStreamingConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", a3, *((void *)&v22 + 1));
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    __int128 v17 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      id v18 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      id v19 = [*((id *)&v22 + 1) UTF8String];
      *(_DWORD *)buf = 68289538;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 2082;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Handed off message to IDS, message type:%{public, location:escape_only}s, identif ier:%{public, location:escape_only}s}",  buf,  0x26u);
    }
  }

- (void)sendMessageRapport:(id)a3
{
  id v5 = -[CLLocationStreamingConnectionManager packageMessage:](self, "packageMessage:");
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 1;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  __int16 v20 = sub_1002EFA0C;
  unsigned __int8 v21 = sub_1002EFA1C;
  uint64_t v22 = 0LL;
  id v6 = -[CLLocationStreamingConnectionManager rapportLink](self, "rapportLink");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002EFA28;
  v16[3] = &unk_101830740;
  v16[6] = &v17;
  v16[7] = v23;
  v16[4] = a3;
  v16[5] = self;
  -[RPCompanionLinkClient sendEventID:event:destinationID:options:completion:]( v6,  "sendEventID:event:destinationID:options:completion:",  @"com.apple.locationd.rapport.event",  v5,  RPDestinationIdentifierPairedCompanion,  0LL,  v16);
  if (v18[5])
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    unsigned __int8 v7 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v8 = (void *)v18[5];
      id v9 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      uint64_t buf = 68289538LL;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2082;
      id v31 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#warning Got error from #Rapport, error:%{public, location:escape_only}@, message type:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x26u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101830788);
      }
    }

    int v10 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      id v11 = (void *)v18[5];
      id v12 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      uint64_t buf = 68289538LL;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2114;
      id v29 = v11;
      __int16 v30 = 2082;
      id v31 = v12;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#warning Got error from #Rapport",  "{msg%{public}.0s:#warning Got error from #Rapport, error:%{public, location:escape_only}@, message type:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x26u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002EFCA4;
    v15[3] = &unk_101830768;
    v15[4] = a3;
    v15[5] = &v17;
    v15[6] = v23;
    -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v15);
  }

  else
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    id v13 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      id v14 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      uint64_t buf = 68289282LL;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2082;
      id v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Handed off message to #Rapport, message type:%{public, location:escape_only}s}",  (uint8_t *)&buf,  0x1Cu);
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);
}

- (void)sendMessage:(id)a3
{
}

- (void)withClients:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  clients = self->_clients;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(clients);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( clients,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a5 objectForKeyedSubscript:@"kCLLocationStreamingMessageKeyPayload"];
  id v10 = [a5 objectForKeyedSubscript:@"kCLLocationStreamingMessageKeyType"];
  if (v10)
  {
    __int128 v11 = v10;
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    __int128 v12 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      id v26 = [v11 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:IDS Got message, type:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }

    signed int v13 = objc_msgSend( objc_msgSend(a5, "objectForKeyedSubscript:", @"kCLLocationStreamingMessageKeyVersion"),  "intValue");
    sub_1002EEB90();
    sub_1010DDBC0(buf, (char *)[v11 UTF8String]);
    uint64_t v14 = sub_10008E8D0((uint64_t)&qword_1019941A8, (const void **)buf);
    if (SBYTE3(v26) < 0) {
      operator delete(*(void **)buf);
    }
    if ((uint64_t *)v14 == &qword_1019941B0)
    {
      int v15 = -1;
      int v16 = -1;
    }

    else
    {
      int v16 = *(_DWORD *)(v14 + 56);
      int v15 = *(_DWORD *)(v14 + 60);
      if (v13 >= v16 && v13 <= v15)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1002F01D0;
        v21[3] = &unk_101830678;
        v21[4] = v11;
        v21[5] = v9;
        -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v21);
        return;
      }
    }

    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    uint64_t v19 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v11 UTF8String];
      *(_DWORD *)uint64_t buf = 68290050;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      id v26 = v20;
      __int16 v27 = 1026;
      signed int v28 = v13;
      __int16 v29 = 1026;
      int v30 = v16;
      __int16 v31 = 1026;
      int v32 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Received message of unsupported version, type:%{public, location:escape_only}s, d eclared version:%{public}d, minimum version:%{public}d, maximum version:%{public}d}",  buf,  0x2Eu);
    }
  }

  else
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    uint64_t v17 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2113;
      id v26 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Missing message type, message:%{private, location:escape_only}@}",  buf,  0x1Cu);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101830788);
      }
    }

    id v18 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2113;
      id v26 = a5;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Missing message type",  "{msg%{public}.0s:Missing message type, message:%{private, location:escape_only}@}",  buf,  0x1Cu);
    }
  }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe", a3, a4), "silo");
  if (a5)
  {
    id v11 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLLocationStreamingConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages"),  "objectForKeyedSubscript:",  a5);
    id v12 = v11;
    -[NSMutableDictionary removeObjectForKey:]( -[CLLocationStreamingConnectionManager unacknowledgedMessages](self, "unacknowledgedMessages"),  "removeObjectForKey:",  a5);
    if (a7 && v8) {
      sub_101234708();
    }
    if (!a7 && v8)
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101830788);
      }
      signed int v13 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        int v23 = 0;
        __int16 v24 = 2082;
        __int16 v25 = "";
        __int16 v26 = 2082;
        id v27 = [a5 UTF8String];
        __int16 v28 = 2082;
        *(void *)__int16 v29 = objc_msgSend(objc_msgSend(v11, "messageType"), "UTF8String");
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:IDS Send success, identifier:%{public, location:escape_only}s, type:%{public, location:escape_only}s}",  buf,  0x26u);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1002F0660;
      v20[3] = &unk_101830600;
      v20[4] = v11;
      uint64_t v14 = v20;
LABEL_29:
      -[CLLocationStreamingConnectionManager withClients:](self, "withClients:", v14);
      return;
    }

    id v17 = objc_msgSend(objc_msgSend(a7, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (!v17 || [v17 code] != (id)32)
    {
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101830788);
      }
      uint64_t v19 = (os_log_s *)qword_101934998;
      if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        int v23 = 0;
        __int16 v24 = 2082;
        __int16 v25 = "";
        __int16 v26 = 2082;
        id v27 = [a5 UTF8String];
        __int16 v28 = 1026;
        *(_DWORD *)__int16 v29 = v8;
        *(_WORD *)&v29[4] = 2114;
        *(void *)&v29[6] = a7;
        __int16 v30 = 2082;
        id v31 = objc_msgSend(objc_msgSend(v11, "messageType"), "UTF8String");
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#warning Send failure, identifier:%{public, location:escape_only}s, success:% {public}d, error:%{public, location:escape_only}@, type:%{public, location:escape_only}s}",  buf,  0x36u);
      }

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1002F0650;
      v21[3] = &unk_101830678;
      v21[4] = v11;
      v21[5] = a7;
      uint64_t v14 = v21;
      goto LABEL_29;
    }

    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    id v18 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Sync to/from standalone watch is not supported}",  buf,  0x12u);
    }
  }

  else
  {
    if (qword_101934990 != -1) {
      dispatch_once(&qword_101934990, &stru_101830788);
    }
    int v15 = (os_log_s *)qword_101934998;
    if (os_log_type_enabled((os_log_t)qword_101934998, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Missing identifier}",  buf,  0x12u);
      if (qword_101934990 != -1) {
        dispatch_once(&qword_101934990, &stru_101830788);
      }
    }

    int v16 = (os_log_s *)qword_101934998;
    if (os_signpost_enabled((os_log_t)qword_101934998))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Missing identifier",  "{msg%{public}.0s:Missing identifier}",  buf,  0x12u);
    }
  }

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
}

- (RPCompanionLinkClient)rapportLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRapportLink:(id)a3
{
}

- (BOOL)rapportLinkActive
{
  return self->_rapportLinkActive;
}

- (void)setRapportLinkActive:(BOOL)a3
{
  self->_rapportLinkActive = a3;
}

- (NSMutableDictionary)unacknowledgedMessages
{
  return self->_unacknowledgedMessages;
}

- (void)setUnacknowledgedMessages:(id)a3
{
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setService:(id)a3
{
}

- (BOOL)pairIsNearby
{
  return self->_pairIsNearby;
}

- (void)setPairIsNearby:(BOOL)a3
{
  self->_BOOL pairIsNearby = a3;
}

@end