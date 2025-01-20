@interface CLUsageSyncManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)_sendMessage:(id)a3 identifier:(id *)a4 error:(id *)a5;
- (BOOL)dirtyUsageSyncState;
- (BOOL)isPaired;
- (BOOL)needFullResync;
- (BOOL)retryTimerSet;
- (CLClientManagerPublicProtocol)manager;
- (CLTimer)retryTimer;
- (CLUsageSyncManager)init;
- (IDSService)service;
- (NSMutableArray)errorQueue;
- (NSMutableDictionary)messagesWaitingForAck;
- (NSUUID)pairedDeviceID;
- (id).cxx_construct;
- (id)currentlyActiveDevice;
- (id)mungedUsageDataForPotentiallyOldUsageData:(id)a3;
- (id)pairedDeviceRegistry;
- (int)activeDeviceNearbyStatus;
- (void)addMessageToErrorQueue:(id)a3;
- (void)beginService;
- (void)client:(id)a3 didChangeUsageData:(id)a4;
- (void)client:(id)a3 didChangeUsageDataInternal:(id)a4;
- (void)drainErrorQueue;
- (void)endService;
- (void)handleActiveNotification_bounce:(id)a3;
- (void)handleInactiveNotification_bounce:(id)a3;
- (void)handleMessageError:(id)a3;
- (void)handleMessageResyncRequestWithMessageData:(id)a3;
- (void)handleMessageResyncResponseWithMessageData:(id)a3;
- (void)handleMessageSendError:(id)a3 identifier:(id)a4;
- (void)handleMessageSendSuccessForIdentifier:(id)a3;
- (void)handleMessageUsageUpdateWithMessageData:(id)a3;
- (void)handlePair;
- (void)handlePairNotification_bounce:(id)a3;
- (void)handleUnpair;
- (void)handleUnpairNotification_bounce:(id)a3;
- (void)messageFailedToSend:(id)a3 withError:(id)a4 recoverable:(BOOL)a5;
- (void)onClientManagerNotification:(int)a3 data:(const void *)a4;
- (void)onStatusBarIconChange:(int)a3;
- (void)onStatusBarIconChangeInternal:(int)a3;
- (void)requestFullResync;
- (void)sendAllUsageSyncData;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithMessageType:(id)a3 dataPayload:(id)a4 priority:(int64_t)a5 idsOptions:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActiveDeviceNearbyStatus:(int)a3;
- (void)setDirtyUsageSyncState:(BOOL)a3;
- (void)setErrorQueue:(id)a3;
- (void)setMessagesWaitingForAck:(id)a3;
- (void)setNeedFullResync:(BOOL)a3;
- (void)setPairedDeviceID:(id)a3;
- (void)setPairedDeviceRegistry:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setRetryTimerSet:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
@end

@implementation CLUsageSyncManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019978E8 != -1) {
    dispatch_once(&qword_1019978E8, &stru_101844078);
  }
  return (id)qword_1019978E0;
}

+ (BOOL)isSupported
{
  if (qword_1019978F8 != -1) {
    dispatch_once(&qword_1019978F8, &stru_101844098);
  }
  return byte_1019978F0;
}

- (CLUsageSyncManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLUsageSyncManager;
  return -[CLUsageSyncManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLUsageSyncManagerProtocol,  &OBJC_PROTOCOL___CLUsageSyncManagerClientProtocol);
}

- (void)setSilo:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  unint64_t v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync suspending silo until IDS becomes available}",  buf,  0x12u);
  }

  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLUsageSyncManager;
  -[CLUsageSyncManager setSilo:](&v8, "setSilo:", a3);
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync waiting on IDS to become available}",  buf,  0x12u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10060B8B8;
  v7[3] = &unk_1018306C8;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:completion:]( &OBJC_CLASS___IDSService,  "serviceWithIdentifier:completion:",  @"com.apple.private.alloy.location.usage",  v7);
}

- (void)beginService
{
  objc_super v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    unint64_t v5 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  memset(&v27, 0, sizeof(v27));
  std::string::operator=(&v27, &stru_1019978C8);
  [*((id *)self->_clientManagerClient.__ptr_.__value_ + 2) register:*((void *)self->_clientManagerClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:sub_10120E548((uint64_t)&v27)];
  -[IDSService addDelegate:queue:]( self->_service,  "addDelegate:queue:",  self,  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo"), "queue"));
  self->_dirtyUsageSyncState = 0;
  -[CLUsageSyncManager setPairedDeviceRegistry:]( self,  "setPairedDeviceRegistry:",  [(Class)off_1019395F0[0]() sharedInstance]);
  v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v6,  "addObserver:selector:name:object:",  self,  "handleUnpairNotification_bounce:",  off_1019395F8[0](),  self->_pairedDeviceRegistry);
  v7 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v7,  "addObserver:selector:name:object:",  self,  "handlePairNotification_bounce:",  off_101939600[0](),  self->_pairedDeviceRegistry);
  objc_super v8 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v8,  "addObserver:selector:name:object:",  self,  "handleActiveNotification_bounce:",  off_101939608[0](),  self->_pairedDeviceRegistry);
  v9 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v9,  "addObserver:selector:name:object:",  self,  "handleInactiveNotification_bounce:",  off_101939610[0](),  self->_pairedDeviceRegistry);
  memset(&__p, 0, sizeof(__p));
  uint64_t v10 = sub_1002F8DDC();
  sub_1002A85D0(v10, (uint64_t)@"kCLUsageSyncPairedDeviceID", &__p);
  std::string::size_type size = __p.__r_.__value_.__s.__size_;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    v12 = objc_alloc(&OBJC_CLASS___NSUUID);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v14 =  -[NSUUID initWithUUIDString:]( v12,  "initWithUUIDString:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p));
  }

  else
  {
    v14 = 0LL;
  }

  id v15 = objc_msgSend(objc_msgSend((Class)off_1019395F0[0](), "sharedInstance"), "getActivePairedDevice");
  id v16 = [v15 valueForProperty:off_101939618[0]()];
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  v17 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[NSString UTF8String](-[NSUUID UUIDString](v14, "UUIDString"), "UTF8String");
    id v19 = objc_msgSend(objc_msgSend(v16, "UUIDString"), "UTF8String");
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)v29 = 2082;
    *(void *)&v29[2] = "";
    *(_WORD *)&v29[10] = 2082;
    *(void *)&v29[12] = v18;
    *(_WORD *)&v29[20] = 2082;
    *(void *)&v29[22] = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync UUIDs found, on disk:%{public, location:escape_only}s, current:%{public, location:escape_only}s}",  buf,  0x26u);
  }

  id v20 = objc_msgSend(objc_msgSend((Class)off_1019395F0[0](), "sharedInstance"), "getActivePairedDevice");
  if (v20)
  {
    id v21 = [v20 valueForProperty:off_101939620[0]()];
    if (v21)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      v22 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v21 UTF8String];
        *(_DWORD *)buf = 68289283;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)v29 = 2082;
        *(void *)&v29[2] = "";
        *(_WORD *)&v29[10] = 2081;
        *(void *)&v29[12] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Serial, serial:%{private, location:escape_only}s}",  buf,  0x1Cu);
      }
    }
  }

  if (!v16 && v14) {
    goto LABEL_24;
  }
  if (!v14 || !v16)
  {
LABEL_25:
    if (!v16) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }

  if ((-[NSUUID isEqual:](v14, "isEqual:", v16) & 1) == 0)
  {
LABEL_24:
    -[CLUsageSyncManager handleUnpair](self, "handleUnpair");
    goto LABEL_25;
  }

- (void)endService
{
  self->_service = 0LL;
  self->_pairedDeviceID = 0LL;
  objc_super v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  self,  off_1019395F8[0](),  self->_pairedDeviceRegistry);
  v4 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v4,  "removeObserver:name:object:",  self,  off_101939600[0](),  self->_pairedDeviceRegistry);
  unint64_t v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v5,  "removeObserver:name:object:",  self,  off_101939608[0](),  self->_pairedDeviceRegistry);
  v6 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v6,  "removeObserver:name:object:",  self,  off_101939610[0](),  self->_pairedDeviceRegistry);

  self->_pairedDeviceRegistry = 0LL;
  -[CLTimer setHandler:](self->_retryTimer, "setHandler:", 0LL);

  self->_retryTimer = 0LL;
  self->_errorQueue = 0LL;

  self->_messagesWaitingForAck = 0LL;
}

- (void)onClientManagerNotification:(int)a3 data:(const void *)a4
{
}

- (void)handleUnpairNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10060C37C;
  v3[3] = &unk_10181A288;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (void)handlePairNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10060C3E8;
  v3[3] = &unk_10181A288;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (void)handleUnpair
{
  id v3 = objc_msgSend(objc_msgSend((Class)off_1019395F0[0](), "sharedInstance"), "getActivePairedDevice");
  id v4 = [v3 valueForProperty:off_101939618[0]()];
  if (objc_msgSend(v4, "isEqual:", -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID")))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    unint64_t v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289282;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      __int16 v12 = 2082;
      v13 = (const char *)objc_msgSend(objc_msgSend(v4, "UUIDString"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Non-active device unpaired, current id:%{public, location:escape_only}s}",  (uint8_t *)&v8,  0x1Cu);
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289538;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      __int16 v12 = 2082;
      v13 = -[NSString UTF8String]( -[NSUUID UUIDString](-[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID"), "UUIDString"),  "UTF8String");
      __int16 v14 = 2082;
      id v15 = objc_msgSend(objc_msgSend(v4, "UUIDString"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Unpair, current id:%{public, location:escape_only}s, active id:%{publi c, location:escape_only}s}",  (uint8_t *)&v8,  0x26u);
    }

    -[CLClientManagerPublicProtocol syncgetDoSync:]( -[CLUsageSyncManager manager](self, "manager"),  "syncgetDoSync:",  &stru_1018440B8);
    -[CLUsageSyncManager setPairedDeviceID:](self, "setPairedDeviceID:", 0LL);
    -[CLUsageSyncManager setErrorQueue:]( self,  "setErrorQueue:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[CLTimer setNextFireDelay:](self->_retryTimer, "setNextFireDelay:", 1.79769313e308);
    self->_retryTimerSet = 0;
    -[CLUsageSyncManager setMessagesWaitingForAck:]( self,  "setMessagesWaitingForAck:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v7 = sub_1002F8DDC();
    sub_1002A66DC(v7);
    -[CLUsageSyncManager service:nearbyDevicesChanged:]( self,  "service:nearbyDevicesChanged:",  -[CLUsageSyncManager service](self, "service"),  -[IDSService devices](-[CLUsageSyncManager service](self, "service"), "devices"));
  }

- (void)handlePair
{
  id v3 = objc_msgSend(objc_msgSend((Class)off_1019395F0[0](), "sharedInstance"), "getActivePairedDevice");
  id v4 = [v3 valueForProperty:off_101939618[0]()];
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  unint64_t v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289538;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2082;
    id v12 = objc_msgSend(objc_msgSend(v4, "UUIDString"), "UTF8String");
    __int16 v13 = 2082;
    __int16 v14 = -[NSString UTF8String]( -[NSUUID UUIDString](-[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID"), "UUIDString"),  "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Pairing, new id:%{public, location:escape_only}s, old id:%{public, locat ion:escape_only}s}",  (uint8_t *)v8,  0x26u);
  }

  if (v4)
  {
    if ((objc_msgSend(v4, "isEqual:", -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID")) & 1) == 0)
    {
      -[CLUsageSyncManager setPairedDeviceID:](self, "setPairedDeviceID:", v4);
      uint64_t v6 = sub_1002F8DDC();
      sub_1002ACAEC( v6,  @"kCLUsageSyncPairedDeviceID",  (char *)-[NSString UTF8String](-[NSUUID UUIDString](self->_pairedDeviceID, "UUIDString"), "UTF8String"));
      uint64_t v7 = sub_1002F8DDC();
      (*(void (**)(uint64_t))(*(void *)v7 + 944LL))(v7);
      -[CLUsageSyncManager service:nearbyDevicesChanged:]( self,  "service:nearbyDevicesChanged:",  -[CLUsageSyncManager service](self, "service"),  -[IDSService devices](-[CLUsageSyncManager service](self, "service"), "devices"));
    }
  }

- (void)handleActiveNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10060C8E0;
  v3[3] = &unk_10181A288;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (void)handleInactiveNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10060C94C;
  v3[3] = &unk_10181A288;
  v3[4] = self;
  objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo"), "async:", v3);
}

- (id)currentlyActiveDevice
{
  id v3 = -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID");
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v4 = objc_msgSend(objc_msgSend((Class)off_1019395F0[0](), "sharedInstance"), "getPairedDevices");
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      __int16 v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }

    id v10 = v9;
    if (!v10) {
      goto LABEL_20;
    }
    id v11 = [v10 valueForProperty:off_101939628()];
    id v12 = -[IDSService linkedDevicesWithRelationship:]( -[CLUsageSyncManager service](self, "service"),  "linkedDevicesWithRelationship:",  1LL);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
LABEL_13:
      uint64_t v16 = 0LL;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
        if (v14 == (id)++v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14) {
            goto LABEL_13;
          }
          goto LABEL_25;
        }
      }

      id result = v17;
      if (result) {
        return result;
      }
    }

- (BOOL)isPaired
{
  return -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID") != 0LL;
}

- (BOOL)_sendMessage:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  if (-[CLUsageSyncManager isPaired](self, "isPaired"))
  {
    id v9 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    objc_msgSend( v9,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "messageType"),  @"kCLUsageSyncMessageTypeKey");
    if ([a3 dataPayload]) {
      objc_msgSend( v9,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "dataPayload"),  @"kCLUsageSyncMessageDataKey");
    }
    sub_1004F2598();
    if (sub_1004F7500())
    {
      id v10 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
      if (!v10 || ([v10 operatingSystemVersion], *(uint64_t *)buf <= 4))
      {
        *(void *)uint64_t buf = 0LL;
        uint64_t v11 = sub_1002F8DDC();
        sub_1002A7A7C(v11, (uint64_t)@"kCLUsageSyncNextSequenceNumberKey", buf);
        uint64_t v12 = sub_1002F8DDC();
        uint64_t v20 = *(void *)buf + 1LL;
        sub_1002ABFBC(v12, @"kCLUsageSyncNextSequenceNumberKey", &v20);
        uint64_t v13 = sub_1002F8DDC();
        (*(void (**)(uint64_t))(*(void *)v13 + 944LL))(v13);
        objc_msgSend( v9,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(void *)buf),  @"kCLUsageSyncMessageSequenceNumberKey");
      }
    }

    id v14 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
    if (v14)
    {
      id v15 = v14;
      if ([v14 relationship] == (id)2)
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018441C0);
        }
        uint64_t v16 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v22 = 2082;
          __int128 v23 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync device is standalone watch. Spoof it is sent}",  buf,  0x12u);
        }

        LOBYTE(v14) = 1;
      }

      else
      {
        LOBYTE(v14) = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:]( self->_service,  "sendMessage:toDestinations:priority:options:identifier:error:",  v9,  +[NSSet setWithObject:]( NSSet,  "setWithObject:",  (id)IDSCopyIDForDevice(v15)),  [a3 priority],  objc_msgSend(a3, "idsOptions"),  a4,  a5);
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    v17 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v22 = 2082;
      __int128 v23 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Attempted to send when unpaired}",  buf,  0x12u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
    }

    v18 = (os_log_s *)qword_101934988;
    LODWORD(v14) = os_signpost_enabled((os_log_t)qword_101934988);
    if ((_DWORD)v14)
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v22 = 2082;
      __int128 v23 = "";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Attempted to send when unpaired",  "{msg%{public}.0s:#usesync Attempted to send when unpaired}",  buf,  0x12u);
      LOBYTE(v14) = 0;
    }
  }

  return (char)v14;
}

- (void)addMessageToErrorQueue:(id)a3
{
  if (!self->_retryTimerSet)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    id v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Setting 5 minute error retry timer}",  (uint8_t *)&v8,  0x12u);
    }

    -[CLTimer setNextFireDelay:](self->_retryTimer, "setNextFireDelay:", 300.0);
    self->_retryTimerSet = 1;
  }

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  id v6 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "message"), "messageType"), "UTF8String");
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2082;
    id v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Adding a message to the error queue, type:%{public, location:escape_only}s}",  (uint8_t *)&v8,  0x1Cu);
  }

  -[NSMutableArray addObject:](self->_errorQueue, "addObject:", a3);
}

- (void)drainErrorQueue
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  id v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = -[NSMutableArray count](self->_errorQueue, "count");
    uint64_t buf = 68289282LL;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2050;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Draining the error queue, count:%{public}lu}",  (uint8_t *)&buf,  0x1Cu);
  }

  id v5 = self->_errorQueue;
  -[CLUsageSyncManager setErrorQueue:]( self,  "setErrorQueue:",  +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[CLTimer setNextFireDelay:](self->_retryTimer, "setNextFireDelay:", 1.79769313e308);
  self->_retryTimerSet = 0;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CLUsageSyncManager handleMessageError:]( self,  "handleMessageError:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i));
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  __int16 v10 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026LL;
    __int16 v17 = 2082;
    v18 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Error queue drained}",  (uint8_t *)&buf,  0x12u);
  }

- (void)messageFailedToSend:(id)a3 withError:(id)a4 recoverable:(BOOL)a5
{
  BOOL v5 = a5;
  if ([a4 code] == (id)24)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    int v9 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      id v15 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Message was replaced}",  (uint8_t *)&v12,  0x12u);
    }
  }

  else
  {
    __int16 v10 = objc_alloc_init(&OBJC_CLASS___CLClientManagerUsageSyncMessageError);
    -[CLClientManagerUsageSyncMessageError setMessage:](v10, "setMessage:", a3);
    -[CLClientManagerUsageSyncMessageError setError:](v10, "setError:", a4);
    -[CLClientManagerUsageSyncMessageError setRecoverable:](v10, "setRecoverable:", v5);
    if ([a4 code] == (id)23 && v5)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      __int128 v11 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 68289026;
        int v13 = 0;
        __int16 v14 = 2082;
        id v15 = "";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Message timed out.  Retrying}",  (uint8_t *)&v12,  0x12u);
      }

      -[CLUsageSyncManager handleMessageError:](self, "handleMessageError:", v10);
    }

    else
    {
      -[CLUsageSyncManager addMessageToErrorQueue:](self, "addMessageToErrorQueue:", v10);
    }
  }

- (void)handleMessageError:(id)a3
{
  id v5 = [a3 message];
  id v6 = [a3 error];
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  id v7 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)uint64_t v16 = 2082;
    *(void *)&v16[2] = "";
    *(_WORD *)&v16[10] = 2114;
    *(void *)&v16[12] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync #warning Got error from IDS, attempting to recover, error:%{public, location:escape_only}@}",  buf,  0x1Cu);
  }

  if ([v5 isMessageOfType:@"kCLUsageSyncMessageUsageUpdateKey"])
  {
    id v8 = sub_10060D9EC((uint64_t)objc_msgSend( objc_msgSend(v5, "dataPayload"),  "objectForKeyedSubscript:",  @"kCLUsageSyncClientKey"));
    *(void *)uint64_t buf = 0LL;
    *(void *)uint64_t v16 = buf;
    *(void *)&v16[8] = 0x3052000000LL;
    *(void *)&v16[16] = sub_10060C160;
    __int16 v17 = sub_10060C170;
    uint64_t v18 = 0LL;
    v13[6] = buf;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10060DA58;
    v14[3] = &unk_1018440E0;
    v14[4] = v8;
    v14[5] = buf;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10060DAE8;
    v13[3] = &unk_101844108;
    v13[4] = self;
    v13[5] = v8;
    -[CLClientManagerPublicProtocol doAsync:withReply:]( -[CLUsageSyncManager manager](self, "manager"),  "doAsync:withReply:",  v14,  v13);
    _Block_object_dispose(buf, 8);
  }

  else if ([v5 isMessageOfType:@"kCLUsageSyncMessageResyncResponseKey"])
  {
    -[CLUsageSyncManager sendAllUsageSyncData](self, "sendAllUsageSyncData");
  }

  else if ([v5 isMessageOfType:@"kCLUsageSyncMessageResyncRequestKey"])
  {
    -[CLUsageSyncManager requestFullResync](self, "requestFullResync");
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    int v9 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      id v10 = objc_msgSend(objc_msgSend(v5, "messageType"), "UTF8String");
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v16 = 2082;
      *(void *)&v16[2] = "";
      *(_WORD *)&v16[10] = 2082;
      *(void *)&v16[12] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Unrecognized type message failed to send.  Cannot recover., type:%{public, location:escape_only}s}",  buf,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
    }

    __int128 v11 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v12 = objc_msgSend(objc_msgSend(v5, "messageType"), "UTF8String");
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v16 = 2082;
      *(void *)&v16[2] = "";
      *(_WORD *)&v16[10] = 2082;
      *(void *)&v16[12] = v12;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Unrecognized type message failed to send.  Cannot recover.",  "{msg%{public}.0s:#usesync Unrecognized type message failed to send.  Cannot recover., type:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }
  }

- (void)sendMessage:(id)a3
{
  if (self->_pairedDeviceID)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    BOOL v5 = -[CLUsageSyncManager _sendMessage:identifier:error:](self, "_sendMessage:identifier:error:", a3, &v13, &v12);
    if (!v5 || v12)
    {
      -[CLUsageSyncManager messageFailedToSend:withError:recoverable:]( self,  "messageFailedToSend:withError:recoverable:",  a3,  v12,  v5);
    }

    else if (v13)
    {
      id v6 = -[CLUsageSyncManager messagesWaitingForAck](self, "messagesWaitingForAck");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", a3, v13);
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      id v8 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        id v9 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
        *(_DWORD *)uint64_t buf = 68289282;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2082;
        id v19 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Didn't get an identifier for message, type:%{public, location:escape_only}s}",  buf,  0x1Cu);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018441C0);
        }
      }

      id v10 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        id v11 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
        *(_DWORD *)uint64_t buf = 68289282;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2082;
        id v19 = v11;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Didn't get an identifier for message",  "{msg%{public}.0s:#usesync Didn't get an identifier for message, type:%{public, location:escape_only}s}",  buf,  0x1Cu);
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    id v7 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2082;
      id v19 = objc_msgSend(objc_msgSend(a3, "messageType"), "UTF8String");
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Dropping a message because we aren't paired, type:%{public, location:escape_only}s}",  buf,  0x1Cu);
    }
  }

- (void)sendMessageWithMessageType:(id)a3 dataPayload:(id)a4 priority:(int64_t)a5 idsOptions:(id)a6
{
  id v11 = objc_alloc_init(&OBJC_CLASS___CLClientManagerUsageSyncMessage);
  -[CLClientManagerUsageSyncMessage setMessageType:](v11, "setMessageType:", a3);
  -[CLClientManagerUsageSyncMessage setDataPayload:](v11, "setDataPayload:", a4);
  -[CLClientManagerUsageSyncMessage setPriority:](v11, "setPriority:", a5);
  -[CLClientManagerUsageSyncMessage setIdsOptions:](v11, "setIdsOptions:", a6);
  -[CLUsageSyncManager sendMessage:](self, "sendMessage:", v11);
}

- (void)requestFullResync
{
  if (-[CLUsageSyncManager isPaired](self, "isPaired"))
  {
    v8[0] = IDSSendMessageOptionTimeoutKey;
    v8[1] = IDSSendMessageOptionEncryptPayloadKey;
    v9[0] = &off_1018D3680;
    v9[1] = &__kCFBooleanTrue;
    _DWORD v8[2] = IDSSendMessageOptionForceLocalDeliveryKey;
    v8[3] = IDSSendMessageOptionQueueOneIdentifierKey;
    v9[2] = &__kCFBooleanTrue;
    v9[3] = @"kCLUsageSyncResyncRequestQueueIdentifierKey";
    -[CLUsageSyncManager sendMessageWithMessageType:dataPayload:priority:idsOptions:]( self,  "sendMessageWithMessageType:dataPayload:priority:idsOptions:",  @"kCLUsageSyncMessageResyncRequestKey",  0LL,  300LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL));
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    uint64_t v3 = qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026LL;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      id v4 = "{msg%{public}.0s:#usesync Full resync requested}";
      BOOL v5 = (os_log_s *)v3;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, v6, v4, (uint8_t *)&buf, 0x12u);
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    uint64_t v7 = qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289026LL;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      id v4 = "{msg%{public}.0s:#usesync Not performing full sync due to being unpaired}";
      BOOL v5 = (os_log_s *)v7;
      os_log_type_t v6 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
  }

- (void)client:(id)a3 didChangeUsageData:(id)a4
{
  char v7 = _os_feature_enabled_impl("CoreLocation", "CLUnfederatedUsageSync");
  sub_1004F2598();
  if ((v7 & 1) != 0)
  {
    if (sub_1001B9A1C())
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      id v8 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        uint64_t v13 = "";
        id v9 = "{msg%{public}.0s:#usesync dropping watch usage data change}";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x12u);
        return;
      }

      return;
    }

- (void)client:(id)a3 didChangeUsageDataInternal:(id)a4
{
  if (a4)
  {
    if (-[CLUsageSyncManager isPaired](self, "isPaired"))
    {
      v27[0] = @"kCLUsageSyncClientKey";
      v27[1] = @"kCLUsageSyncUsageKey";
      v28[0] = a3;
      v28[1] = a4;
      char v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL);
      v25[0] = IDSSendMessageOptionTimeoutKey;
      v25[1] = IDSSendMessageOptionEncryptPayloadKey;
      v26[0] = &off_1018D3680;
      v26[1] = &__kCFBooleanTrue;
      v25[2] = IDSSendMessageOptionForceLocalDeliveryKey;
      v25[3] = IDSSendMessageOptionNonWakingKey;
      v26[2] = &__kCFBooleanTrue;
      v26[3] = &__kCFBooleanTrue;
      v25[4] = IDSSendMessageOptionQueueOneIdentifierKey;
      v26[4] = [@"usage-" stringByAppendingString:a3];
      -[CLUsageSyncManager sendMessageWithMessageType:dataPayload:priority:idsOptions:]( self,  "sendMessageWithMessageType:dataPayload:priority:idsOptions:",  @"kCLUsageSyncMessageUsageUpdateKey",  v7,  300LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  5LL));
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      uint64_t v8 = qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 68289538;
        int v18 = 0;
        __int16 v19 = 2082;
        id v20 = "";
        __int16 v21 = 2082;
        id v22 = [a3 UTF8String];
        __int16 v23 = 2114;
        id v24 = a4;
        id v9 = "{msg%{public}.0s:#usesync Enqueued usage update message, client:%{public, location:escape_only}"
             "s, usage:%{public, location:escape_only}@}";
        int v10 = (os_log_s *)v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 38;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v17, v12);
      }
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      uint64_t v16 = qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO))
      {
        int v17 = 68289026;
        int v18 = 0;
        __int16 v19 = 2082;
        id v20 = "";
        id v9 = "{msg%{public}.0s:#usesync Not performing sync due to being unpaired}";
        int v10 = (os_log_s *)v16;
        os_log_type_t v11 = OS_LOG_TYPE_INFO;
        uint32_t v12 = 18;
        goto LABEL_18;
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    uint64_t v13 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2082;
      id v22 = [a3 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Got empty usage dictionary, client:%{public, location:escape_only}s}",  (uint8_t *)&v17,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
    }

    __int16 v14 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v15 = [a3 UTF8String];
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2082;
      id v22 = v15;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Got empty usage dictionary",  "{msg%{public}.0s:#usesync Got empty usage dictionary, client:%{public, location:escape_only}s}",  (uint8_t *)&v17,  0x1Cu);
    }
  }

- (void)onStatusBarIconChange:(int)a3
{
  if (sub_1001B9A1C())
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    BOOL v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      uint32_t v12 = "";
      os_log_type_t v6 = "{msg%{public}.0s:#onStatusBarIconChange on watch, dropping iconState change}";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x12u);
    }
  }

  else
  {
    dword_101997900 = a3;
    if (self->_coalescingUpdates)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      BOOL v5 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        uint32_t v12 = "";
        os_log_type_t v6 = "{msg%{public}.0s:#onStatusBarIconChange dropping iconState change, coalescing updates}";
        goto LABEL_11;
      }
    }

    else
    {
      self->_coalescingUpdates = 1;
      dispatch_time_t v7 = dispatch_time(0LL, 1000000000LL);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10060E7D4;
      block[3] = &unk_10181A288;
      block[4] = self;
      dispatch_after( v7,  (dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo"), "queue"),  block);
    }
  }

- (void)onStatusBarIconChangeInternal:(int)a3
{
  if (self->_lastStatusBarIconState == a3)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    id v4 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      int v18 = "";
      __int16 v19 = 1026;
      LODWORD(v20) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#onStatusBarIconChangeInternal dropping duplicate iconState, iconState:%{public}d}",  buf,  0x18u);
    }
  }

  else
  {
    self->_lastStatusBarIconState = a3;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    os_log_type_t v6 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      int v18 = "";
      __int16 v19 = 1025;
      LODWORD(v20) = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#onStatusBarIconChangeInternal processing iconState, iconState:%{private}d}",  buf,  0x18u);
    }

    if (a3 == 1)
    {
      char v7 = 0;
      uint64_t v8 = 2LL;
    }

    else if (a3 == 2)
    {
      char v7 = 0;
      uint64_t v8 = 10LL;
    }

    else
    {
      char v7 = 1;
      uint64_t v8 = 21LL;
    }

    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if ((v7 & 1) == 0)
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      sub_100547724(v8, &v14, &v13);
      if (v14)
      {
        int v10 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
        -[NSMutableDictionary setValue:forKey:](v9, "setValue:forKey:", v10, v14);
      }

      else
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018441C0);
        }
        __int16 v11 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v16 = 0;
          __int16 v17 = 2082;
          int v18 = "";
          __int16 v19 = 2050;
          uint64_t v20 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#onStatusBarIconChangeInternal lacks start key, clientServiceType:%{public}lu}",  buf,  0x1Cu);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_1018441C0);
          }
        }

        uint32_t v12 = (os_log_s *)qword_101934988;
        if (os_signpost_enabled((os_log_t)qword_101934988))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v16 = 0;
          __int16 v17 = 2082;
          int v18 = "";
          __int16 v19 = 2050;
          uint64_t v20 = v8;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#onStatusBarIconChangeInternal lacks start key",  "{msg%{public}.0s:#onStatusBarIconChangeInternal lacks start key, clientServiceType:%{public}lu}",  buf,  0x1Cu);
        }
      }
    }

    -[CLUsageSyncManager client:didChangeUsageDataInternal:]( self,  "client:didChangeUsageDataInternal:",  @"com.apple.location.AggregateLocationIconApp",  v9);
  }

- (void)sendAllUsageSyncData
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x3052000000LL;
  v5[3] = sub_10060C160;
  v5[4] = sub_10060C170;
  v5[5] = 0LL;
  void v3[5] = v5;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10060EC5C;
  v4[3] = &unk_101838B40;
  v4[4] = v5;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10060EC98;
  v3[3] = &unk_101844130;
  v3[4] = self;
  -[CLClientManagerPublicProtocol doAsync:withReply:]( -[CLUsageSyncManager manager](self, "manager"),  "doAsync:withReply:",  v4,  v3);
  _Block_object_dispose(v5, 8);
}

- (id)mungedUsageDataForPotentiallyOldUsageData:(id)a3
{
  if (!sub_1004F7500()) {
    return a3;
  }
  id v5 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
  if (v5)
  {
    [v5 operatingSystemVersion];
  }

  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  unint64_t v9 = 0LL;
  *(void *)&__int128 v6 = 68289282LL;
  __int128 v32 = v6;
  do
  {
    uint64_t v10 = qword_10130B7E8[v7];
    v33 = 0LL;
    v34 = 0LL;
    sub_100547724(v10, &v34, &v33);
    if (v34) {
      BOOL v11 = v33 == 0LL;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      uint64_t v14 = (NSNumber *)objc_msgSend(a3, "objectForKeyedSubscript:");
      id v15 = [a3 objectForKeyedSubscript:v33];
      int v16 = v15;
      if (v14) {
        BOOL v17 = v15 == 0LL;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17)
      {
        if (!v14)
        {
LABEL_36:
          uint64_t v14 = v8;
          goto LABEL_37;
        }

        if (v8)
        {
LABEL_35:
          -[NSNumber doubleValue](v8, "doubleValue", v32);
          double v24 = v23;
          -[NSNumber doubleValue](v14, "doubleValue");
          if (v24 > v25) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
      }

      else
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018441C0);
        }
        int v18 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t buf = v32;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2114;
          uint64_t v39 = (uint64_t)a3;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Found start time AND stop time for a service, usageData:%{public, loca tion:escape_only}@}",  buf,  0x1Cu);
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_1018441C0);
          }
        }

        __int16 v19 = (os_log_s *)qword_101934988;
        if (os_signpost_enabled((os_log_t)qword_101934988))
        {
          *(_DWORD *)uint64_t buf = v32;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2114;
          uint64_t v39 = (uint64_t)a3;
          _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Found start time AND stop time for a service",  "{msg%{public}.0s:#usesync Found start time AND stop time for a service, usageData:%{public, loca tion:escape_only}@}",  buf,  0x1Cu);
        }

        objc_msgSend(v16, "doubleValue", v32);
        double v21 = v20;
        -[NSNumber doubleValue](v14, "doubleValue");
        if (v21 > v22)
        {
          uint64_t v14 = v8;
          goto LABEL_38;
        }

        int v16 = 0LL;
        if (v8) {
          goto LABEL_35;
        }
      }

- (CLClientManagerPublicProtocol)manager
{
  return (CLClientManagerPublicProtocol *)*((void *)self->_clientManagerClient.__ptr_.__value_ + 2);
}

- (void)handleMessageSendError:(id)a3 identifier:(id)a4
{
  if (a4)
  {
    id v7 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLUsageSyncManager messagesWaitingForAck](self, "messagesWaitingForAck"),  "objectForKeyedSubscript:",  a4);
    if (v7)
    {
      -[CLUsageSyncManager messageFailedToSend:withError:recoverable:]( self,  "messageFailedToSend:withError:recoverable:",  v7,  a3,  1LL);
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      uint64_t v10 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 68289538;
        int v12 = 0;
        __int16 v13 = 2082;
        uint64_t v14 = "";
        __int16 v15 = 2082;
        id v16 = [a4 UTF8String];
        __int16 v17 = 2114;
        id v18 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Message from past life failed, identifier:%{public, location:escape_only }s, error:%{public, location:escape_only}@}",  (uint8_t *)&v11,  0x26u);
      }
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    uint64_t v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Unknown message failed, error:%{public, location:escape_only}@}",  (uint8_t *)&v11,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
    }

    unint64_t v9 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Unknown message failed",  "{msg%{public}.0s:#usesync Unknown message failed, error:%{public, location:escape_only}@}",  (uint8_t *)&v11,  0x1Cu);
    }
  }

- (void)handleMessageSendSuccessForIdentifier:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  id v4 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    __int16 v8 = 2082;
    id v9 = [a3 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Message sent, identifier:%{public, location:escape_only}s}",  (uint8_t *)v5,  0x1Cu);
  }

- (void)handleMessageUsageUpdateWithMessageData:(id)a3
{
  if (!_os_feature_enabled_impl("CoreLocation", "CLUnfederatedUsageSync")
    || (sub_1004F2598(), !sub_1004F7500()))
  {
    objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo");
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    id v5 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v16) = 2082;
      *(void *)((char *)&v16 + 2) = "";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Got usage update}",  buf,  0x12u);
    }

    id v6 = [a3 objectForKeyedSubscript:@"kCLUsageSyncClientKey"];
    id v7 = [a3 objectForKeyedSubscript:@"kCLUsageSyncUsageKey"];
    id v8 = v7;
    if (v6 && v7)
    {
      id v9 = sub_10060D9EC((uint64_t)v6);
      id v10 = -[CLUsageSyncManager mungedUsageDataForPotentiallyOldUsageData:]( self,  "mungedUsageDataForPotentiallyOldUsageData:",  v8);
      *(void *)uint64_t buf = 0LL;
      *(void *)&__int128 v16 = buf;
      *((void *)&v16 + 1) = 0x2020000000LL;
      LOBYTE(v17) = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10060FADC;
      v14[3] = &unk_101844158;
      v14[4] = v9;
      v14[5] = v10;
      void v14[6] = buf;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10060FB6C;
      v13[3] = &unk_101844130;
      v13[4] = self;
      v13[5] = buf;
      -[CLClientManagerPublicProtocol doAsync:withReply:]( -[CLUsageSyncManager manager](self, "manager"),  "doAsync:withReply:",  v14,  v13);
      _Block_object_dispose(buf, 8);
    }

    else
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      int v11 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        LOWORD(v16) = 2082;
        *(void *)((char *)&v16 + 2) = "";
        WORD5(v16) = 1026;
        HIDWORD(v16) = v6 != 0LL;
        __int16 v17 = 1026;
        BOOL v18 = v8 != 0LL;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Didn't get an expected parameter, client key:%{public}hhd, usage data:%{public}hhd}",  buf,  0x1Eu);
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_1018441C0);
        }
      }

      int v12 = (os_log_s *)qword_101934988;
      if (os_signpost_enabled((os_log_t)qword_101934988))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        LOWORD(v16) = 2082;
        *(void *)((char *)&v16 + 2) = "";
        WORD5(v16) = 1026;
        HIDWORD(v16) = v6 != 0LL;
        __int16 v17 = 1026;
        BOOL v18 = v8 != 0LL;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#usesync Didn't get an expected parameter",  "{msg%{public}.0s:#usesync Didn't get an expected parameter, client key:%{public}hhd, usage data:%{public}hhd}",  buf,  0x1Eu);
      }
    }
  }

- (void)handleMessageResyncRequestWithMessageData:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  id v4 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Got request for full resync of data}",  (uint8_t *)v5,  0x12u);
  }

  -[CLUsageSyncManager sendAllUsageSyncData](self, "sendAllUsageSyncData");
}

- (void)handleMessageResyncResponseWithMessageData:(id)a3
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  id v5 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v17) = 2082;
    *(void *)((char *)&v17 + 2) = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Got full resync data}",  buf,  0x12u);
  }

  id v6 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend( v6,  "setObject:forKeyedSubscript:",  -[CLUsageSyncManager mungedUsageDataForPotentiallyOldUsageData:]( self,  "mungedUsageDataForPotentiallyOldUsageData:",  objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * (void)i))),  sub_10060D9EC(*(void *)(*((void *)&v12 + 1) + 8 * (void)i)));
      }

      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }

    while (v7);
  }

  *(void *)uint64_t buf = 0LL;
  *(void *)&__int128 v17 = buf;
  *((void *)&v17 + 1) = 0x2020000000LL;
  char v18 = 0;
  v10[5] = buf;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10060FEE8;
  v11[3] = &unk_101844180;
  v11[4] = v6;
  v11[5] = buf;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100610000;
  v10[3] = &unk_101844130;
  v10[4] = self;
  -[CLClientManagerPublicProtocol doAsync:withReply:]( -[CLUsageSyncManager manager](self, "manager"),  "doAsync:withReply:",  v11,  v10);
  _Block_object_dispose(buf, 8);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3, a4), "silo");
  if (!a7 && v8)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    int v11 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      char v18 = "";
      __int16 v19 = 2082;
      id v20 = [a5 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync sent, identifier:%{public, location:escape_only}s}",  (uint8_t *)&v15,  0x1Cu);
    }

    -[CLUsageSyncManager handleMessageSendSuccessForIdentifier:](self, "handleMessageSendSuccessForIdentifier:", a5);
LABEL_19:
    -[NSMutableDictionary removeObjectForKey:]( -[CLUsageSyncManager messagesWaitingForAck](self, "messagesWaitingForAck"),  "removeObjectForKey:",  a5);
    return;
  }

  id v12 = objc_msgSend(objc_msgSend(a7, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (!v12 || [v12 code] != (id)32)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    __int128 v14 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289794;
      int v16 = 0;
      __int16 v17 = 2082;
      char v18 = "";
      __int16 v19 = 2082;
      id v20 = [a5 UTF8String];
      __int16 v21 = 1026;
      BOOL v22 = v8;
      __int16 v23 = 2114;
      id v24 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync #warning Failure, identifier:%{public, location:escape_only}s, succeeded :%{public}hhd, error:%{public, location:escape_only}@}",  (uint8_t *)&v15,  0x2Cu);
    }

    -[CLUsageSyncManager handleMessageSendError:identifier:](self, "handleMessageSendError:identifier:", a7, a5);
    goto LABEL_19;
  }

  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  __int128 v13 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    char v18 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Sync to/from standalone watch is not supported}",  (uint8_t *)&v15,  0x12u);
  }

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = [a5 objectForKeyedSubscript:@"kCLUsageSyncMessageTypeKey"];
  if (v9)
  {
    id v10 = v9;
    id v11 = [a5 objectForKeyedSubscript:@"kCLUsageSyncMessageDataKey"];
    if ([@"kCLUsageSyncMessageUsageUpdateKey" isEqualToString:v10])
    {
      -[CLUsageSyncManager handleMessageUsageUpdateWithMessageData:]( self,  "handleMessageUsageUpdateWithMessageData:",  v11);
      return;
    }

    if ([@"kCLUsageSyncMessageResyncRequestKey" isEqualToString:v10])
    {
      -[CLUsageSyncManager handleMessageResyncRequestWithMessageData:]( self,  "handleMessageResyncRequestWithMessageData:",  v11);
      return;
    }

    if ([@"kCLUsageSyncMessageResyncResponseKey" isEqualToString:v10])
    {
      -[CLUsageSyncManager handleMessageResyncResponseWithMessageData:]( self,  "handleMessageResyncResponseWithMessageData:",  v11);
      return;
    }

    if ([@"kCLUsageSyncMessagePromptKey" isEqualToString:v10])
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
      char v18 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 68289283;
        int v23 = 0;
        __int16 v24 = 2082;
        double v25 = "";
        __int16 v26 = 2113;
        id v27 = a5;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync #warning received legacy kCLUsageSyncMessagePromptKey message, ignoring, p ayload:%{private, location:escape_only}@}",  (uint8_t *)&v22,  0x1Cu);
      }

      return;
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    __int16 v19 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v22 = 68289539;
      int v23 = 0;
      __int16 v24 = 2082;
      double v25 = "";
      __int16 v26 = 2082;
      id v27 = [v10 UTF8String];
      __int16 v28 = 2113;
      id v29 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Unrecognized message, type:%{public, location:escape_only}s, payload:% {private, location:escape_only}@}",  (uint8_t *)&v22,  0x26u);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
    }

    uint64_t v20 = qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v21 = [v10 UTF8String];
      int v22 = 68289539;
      int v23 = 0;
      __int16 v24 = 2082;
      double v25 = "";
      __int16 v26 = 2082;
      id v27 = v21;
      __int16 v28 = 2113;
      id v29 = a5;
      __int128 v14 = "#usesync Unrecognized message";
      int v15 = "{msg%{public}.0s:#usesync Unrecognized message, type:%{public, location:escape_only}s, payload"
            ":%{private, location:escape_only}@}";
      int v16 = (os_log_s *)v20;
      uint32_t v17 = 38;
      goto LABEL_12;
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_1018441C0);
    }
    id v12 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      int v22 = 68289282;
      int v23 = 0;
      __int16 v24 = 2082;
      double v25 = "";
      __int16 v26 = 2114;
      id v27 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#usesync Got invalid message from IDS, message:%{public, location:escape_only}@}",  (uint8_t *)&v22,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_1018441C0);
      }
    }

    uint64_t v13 = qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      int v22 = 68289282;
      int v23 = 0;
      __int16 v24 = 2082;
      double v25 = "";
      __int16 v26 = 2114;
      id v27 = a5;
      __int128 v14 = "#usesync Got invalid message from IDS";
      int v15 = "{msg%{public}.0s:#usesync Got invalid message from IDS, message:%{public, location:escape_only}@}";
      int v16 = (os_log_s *)v13;
      uint32_t v17 = 28;
LABEL_12:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v14,  v15,  (uint8_t *)&v22,  v17);
    }
  }

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = -[CLUsageSyncManager currentlyActiveDevice](self, "currentlyActiveDevice");
  if (v5 && [v5 isNearby])
  {
    if (-[CLUsageSyncManager activeDeviceNearbyStatus](self, "activeDeviceNearbyStatus") == 1) {
      return;
    }
    int v6 = 1;
    uint64_t v7 = 1LL;
  }

  else
  {
    if (-[CLUsageSyncManager activeDeviceNearbyStatus](self, "activeDeviceNearbyStatus") == 2) {
      return;
    }
    int v6 = 0;
    uint64_t v7 = 2LL;
  }

  -[CLUsageSyncManager setActiveDeviceNearbyStatus:](self, "setActiveDeviceNearbyStatus:", v7);
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_1018441C0);
  }
  BOOL v8 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289282LL;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 1026;
    int v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#usesync Paired device nearby change, is nearby:%{public}hhd}",  (uint8_t *)&buf,  0x18u);
  }

  if ((v6 & 1) != 0)
  {
    if (self->_needFullResync)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100610A7C;
      v9[3] = &unk_10181A288;
      void v9[4] = self;
      objc_msgSend(objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo"), "async:", v9);
    }
  }

  else if (self->_dirtyUsageSyncState)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100610A54;
    v10[3] = &unk_10181A288;
    v10[4] = self;
    -[CLClientManagerPublicProtocol doAsync:withReply:]( -[CLUsageSyncManager manager](self, "manager"),  "doAsync:withReply:",  &stru_1018441A0,  v10);
  }

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setService:(id)a3
{
}

- (BOOL)dirtyUsageSyncState
{
  return self->_dirtyUsageSyncState;
}

- (void)setDirtyUsageSyncState:(BOOL)a3
{
  self->_dirtyUsageSyncState = a3;
}

- (BOOL)needFullResync
{
  return self->_needFullResync;
}

- (void)setNeedFullResync:(BOOL)a3
{
  self->_needFullResync = a3;
}

- (NSUUID)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
}

- (id)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
}

- (BOOL)retryTimerSet
{
  return self->_retryTimerSet;
}

- (void)setRetryTimerSet:(BOOL)a3
{
  self->_retryTimerSet = a3;
}

- (CLTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (NSMutableArray)errorQueue
{
  return self->_errorQueue;
}

- (void)setErrorQueue:(id)a3
{
}

- (NSMutableDictionary)messagesWaitingForAck
{
  return self->_messagesWaitingForAck;
}

- (void)setMessagesWaitingForAck:(id)a3
{
}

- (int)activeDeviceNearbyStatus
{
  return self->_activeDeviceNearbyStatus;
}

- (void)setActiveDeviceNearbyStatus:(int)a3
{
  self->_activeDeviceNearbyStatus = a3;
}

- (void).cxx_destruct
{
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end