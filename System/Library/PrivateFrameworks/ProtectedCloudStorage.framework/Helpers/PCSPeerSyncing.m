@interface PCSPeerSyncing
- (BOOL)checkHashWithRateLimit:(id)a3;
- (BOOL)pendingRequest;
- (BOOL)ratelimitClientSyncing;
- (NSData)keys;
- (PCSDevice)device;
- (PCSIDSTransport)transport;
- (PCSKeyClient)client;
- (PCSKeySyncing)syncingManager;
- (PCSPeerSyncing)initWithDevice:(id)a3 syncingManager:(id)a4;
- (double)checkRatelimit:(double)a3;
- (double)timeUntilSyncing;
- (id)uuid;
- (int)clientVersion;
- (void)checkSyncing:(BOOL)a3;
- (void)handleIncomingMessage:(id)a3;
- (void)haveKeys:(id)a3;
- (void)keyFailure:(id)a3;
- (void)sendCommand:(unsigned int)a3 data:(id)a4 dsid:(id)a5 handleReply:(id)a6;
- (void)sendCurrentKeys:(id)a3;
- (void)sendCurrents:(id)a3 dsid:(id)a4 handleReply:(id)a5;
- (void)sendKeys;
- (void)sendKeys:(id)a3 dsid:(id)a4 handleReply:(id)a5;
- (void)sendKeysOld;
- (void)sendReply:(int)a3 error:(id)a4 toMessage:(id)a5;
- (void)sendSomeKeys:(id)a3 dsid:(id)a4;
- (void)sendiCDPStatus:(BOOL)a3 circleStatus:(BOOL)a4 handleReply:(id)a5;
- (void)setClient:(id)a3;
- (void)setClientVersion:(int)a3;
- (void)setDevice:(id)a3;
- (void)setKeys:(id)a3;
- (void)setPeerCircleStatus:(BOOL)a3;
- (void)setPeeriCDPStatus:(BOOL)a3;
- (void)setPendingRequest:(BOOL)a3;
- (void)setSyncingManager:(id)a3;
- (void)setTransport:(id)a3;
- (void)updateLastSeen;
@end

@implementation PCSPeerSyncing

- (PCSPeerSyncing)initWithDevice:(id)a3 syncingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PCSPeerSyncing;
  v9 = -[PCSPeerSyncing init](&v17, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[PCSIDSTransport transportWithIDSServiceName:]( &OBJC_CLASS___PCSIDSTransport,  "transportWithIDSServiceName:",  off_10002BC88));
    transport = v9->_transport;
    v9->_transport = (PCSIDSTransport *)v10;

    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v9->_syncingManager, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 getClientWithIdentifier:v13]);
    client = v9->_client;
    v9->_client = (PCSKeyClient *)v14;
  }

  return v9;
}

- (id)uuid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 idsDeviceIdentifier]);

  return v3;
}

- (void)updateLastSeen
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v4 setLastSeen:v3];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v6 saveClient:v5];
}

- (void)sendCommand:(unsigned int)a3 data:(id)a4 dsid:(id)a5 handleReply:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDeviceIdentifier]);
    *(_DWORD *)buf = 67109378;
    int v24 = v8;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sending message: %d to peer: %@", buf, 0x12u);
  }

  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8, @"c"));
  v22[0] = v17;
  v22[1] = v10;
  v21[1] = @"d";
  v21[2] = @"i";
  v21[3] = @"P";
  v22[2] = v11;
  v22[3] = &__kCFBooleanTrue;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing transport](self, "transport"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
  [v19 sendMessage:v18 toDevice:v20 withPriority:200 timeout:@"inital sync" logDescription:v12 handleReply:300.0];
}

- (void)sendCurrents:(id)a3 dsid:(id)a4 handleReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceIdentifier]);
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sending keys to peer: %@", buf, 0xCu);
  }

  v17[0] = @"c";
  v17[1] = @"S";
  v18[0] = &off_1000265F8;
  v18[1] = v8;
  v17[2] = @"i";
  v18[2] = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing transport](self, "transport"));
  [v16 sendMessage:v15 toDevice:self->_device withPriority:200 timeout:@"Current" logDescription:v10 handleReply:300.0];
}

- (void)sendKeys:(id)a3 dsid:(id)a4 handleReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceIdentifier]);
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sending keys to peer: %@", buf, 0xCu);
  }

  v17[0] = @"c";
  v17[1] = @"K";
  v18[0] = &off_100026610;
  v18[1] = v8;
  v17[2] = @"i";
  v18[2] = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing transport](self, "transport"));
  [v16 sendMessage:v15 toDevice:self->_device withPriority:200 timeout:@"Keys" logDescription:v10 handleReply:300.0];
}

- (void)sendiCDPStatus:(BOOL)a3 circleStatus:(BOOL)a4 handleReply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v14[0] = &off_100026628;
  v13[0] = @"c";
  v13[1] = @"I";
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  v14[1] = v9;
  v13[2] = @"O";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  v14[2] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  3LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing transport](self, "transport"));
  [v12 sendMessage:v11 toDevice:self->_device withPriority:200 timeout:@"iCDPFlag" logDescription:v8 handleReply:300.0];
}

- (double)checkRatelimit:(double)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastSent]);
  [v5 timeIntervalSinceDate:v7];
  double v9 = v8;

  double result = a3 - v9;
  if (v9 > a3) {
    return 0.0;
  }
  return result;
}

- (double)timeUntilSyncing
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lastSeen]);
  [v3 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 > 604800.0) {
    return 0.0;
  }
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  BOOL v10 = [v9 failures] == 0;

  -[PCSPeerSyncing checkRatelimit:](self, "checkRatelimit:", dbl_10001BF40[v10]);
  return result;
}

- (BOOL)ratelimitClientSyncing
{
  return v2 > 0.0;
}

- (BOOL)checkHashWithRateLimit:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastHash]);
  unsigned int v7 = [v4 isEqualToData:v6];

  if (v7)
  {
    -[PCSPeerSyncing checkRatelimit:](self, "checkRatelimit:", 86400.0);
    BOOL v9 = v8 > 0.0;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)checkSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsDeviceIdentifier]);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Device %@ checking if syncing needed",  buf,  0xCu);
  }

  syncingManager = self->_syncingManager;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  -[PCSKeySyncing updateClient:](syncingManager, "updateClient:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  LODWORD(syncingManager) = [v11 protocolVersion] == (id)1;

  if ((_DWORD)syncingManager)
  {
    -[PCSPeerSyncing sendKeys](self, "sendKeys");
    return;
  }

  id v12 = self->_syncingManager;
  id v56 = 0LL;
  id v13 = -[PCSKeySyncing copyAllPCSKeys:](v12, "copyAllPCSKeys:", &v56);
  id v54 = v56;
  if (!v13)
  {
    v37 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Can't get initial data: %@", buf, 0xCu);
    }

    goto LABEL_29;
  }

  id v52 = -[PCSKeySyncing copySHA256Hash:](self->_syncingManager, "copySHA256Hash:", v13);
  uint64_t v14 = v52;
  if (!v52)
  {
    v42 = (os_log_s *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v54;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Can't get initial hash: %@", buf, 0xCu);
    }

    goto LABEL_28;
  }

  unsigned int v15 = -[PCSPeerSyncing checkHashWithRateLimit:](self, "checkHashWithRateLimit:", v52);
  if (v15)
  {
    v16 = (void *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 idsDeviceIdentifier]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Client %@ already have uptodate keys",  buf,  0xCu);
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client", v52));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 buildVersion]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 buildVersion]);
  unsigned int v24 = [v21 isEqualToString:v23];

  if (!v24) {
    goto LABEL_19;
  }
  __int16 v25 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 idsDeviceIdentifier]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 buildVersion]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v28;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Client %@ have same os version: %@",  buf,  0x16u);
  }

  if (((v15 ^ 1 | v3) & 1) == 0 && -[PCSPeerSyncing ratelimitClientSyncing](self, "ratelimitClientSyncing"))
  {
    v31 = self->_syncingManager;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
    -[PCSKeySyncing saveClient:](v31, "saveClient:", v32);

    v33 = (void *)qword_10002BDE0;
    uint64_t v14 = v53;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 idsDeviceIdentifier]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Ratelimit sending to device %@", buf, 0xCu);

LABEL_27:
      uint64_t v14 = v53;
    }
  }

  else
  {
LABEL_19:
    if (!-[PCSPeerSyncing pendingRequest](self, "pendingRequest"))
    {
      -[PCSPeerSyncing setKeys:](self, "setKeys:", v13);
      -[PCSPeerSyncing setPendingRequest:](self, "setPendingRequest:", 1LL);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
      objc_msgSend(v43, "setNumberHandshakes:", (char *)objc_msgSend(v43, "numberHandshakes") + 1);

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
      [v45 setLastSent:v44];

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
      [v46 saveClient:v47];

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3042000000LL;
      v62 = sub_100009EE0;
      v63 = sub_100009EEC;
      objc_initWeak(&v64, self);
      v48 = (os_log_s *)(id)qword_10002BDE0;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
        v50 = (void *)objc_claimAutoreleasedReturnValue([v49 idsDeviceIdentifier]);
        *(_DWORD *)v57 = 138412546;
        v58 = v50;
        __int16 v59 = 2112;
        v60 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Sending inital check-in to device %@ hash: %@",  v57,  0x16u);
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing dsid](self->_syncingManager, "dsid"));
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_100009EF4;
      v55[3] = &unk_100024C68;
      v55[4] = buf;
      -[PCSPeerSyncing sendCommand:data:dsid:handleReply:]( self,  "sendCommand:data:dsid:handleReply:",  1LL,  v53,  v51,  v55);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&v64);
      goto LABEL_27;
    }

    v38 = (void *)qword_10002BDE0;
    uint64_t v14 = v53;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v40 idsDeviceIdentifier]);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "initial request to device %@ already pending",  buf,  0xCu);

      goto LABEL_27;
    }
  }

- (void)sendKeysOld
{
  if (!-[PCSPeerSyncing pendingRequest](self, "pendingRequest"))
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dsid]);
    if (!v8)
    {
      v20 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Can't get dsid", (uint8_t *)&buf, 2u);
      }

      goto LABEL_16;
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing keys](self, "keys"));

    if (!v9)
    {
      id v23 = 0LL;
      id v10 = [v7 copyAllPCSKeys:&v23];
      id v11 = v23;
      -[PCSPeerSyncing setKeys:](self, "setKeys:", v10);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing keys](self, "keys"));
      LODWORD(v10) = v12 == 0LL;

      if ((_DWORD)v10)
      {
        v21 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Can't get initial data: %@",  (uint8_t *)&buf,  0xCu);
        }

        goto LABEL_16;
      }
    }

    -[PCSPeerSyncing setPendingRequest:](self, "setPendingRequest:", 1LL);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3042000000LL;
    v30 = sub_100009EE0;
    v31 = sub_100009EEC;
    objc_initWeak(v32, self);
    id v13 = (os_log_s *)(id)qword_10002BDE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 idsDeviceIdentifier]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing keys](self, "keys"));
      id v18 = [v16 copySHA256Hash:v17];
      *(_DWORD *)unsigned int v24 = 138412546;
      __int16 v25 = v15;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Sending keys to device %@ hash:%@",  v24,  0x16u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing keys](self, "keys"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000A70C;
    v22[3] = &unk_100024C68;
    void v22[4] = &buf;
    -[PCSPeerSyncing sendCommand:data:dsid:handleReply:](self, "sendCommand:data:dsid:handleReply:", 2LL, v19, v8, v22);

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(v32);
LABEL_16:

    return;
  }

  BOOL v3 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceIdentifier]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "sendKeys request to device %@ already pending",  (uint8_t *)&buf,  0xCu);
  }

- (void)sendSomeKeys:(id)a3 dsid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  double v8 = (char *)[v6 count];
  if ([v6 count])
  {
    if ((unint64_t)v8 < 0xB)
    {
      BOOL v9 = 0LL;
    }

    else
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 10, v8 - 10));
      uint64_t v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 0, 10));

      id v6 = (id)v10;
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10000ACE8;
    v30[3] = &unk_100024C90;
    v30[4] = self;
    id v18 = v16;
    id v31 = v18;
    id v19 = v17;
    id v32 = v19;
    [v6 enumerateObjectsUsingBlock:v30];
    v20 = (os_log_s *)(id)qword_10002BDE0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v18 count];
      id v22 = [v9 count];
      *(_DWORD *)__int128 buf = 134218240;
      id v35 = v21;
      __int16 v36 = 2048;
      id v37 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "sending %lu (%lu left) keys to", buf, 0x16u);
    }

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10000AD50;
    v25[3] = &unk_100024CB8;
    objc_copyWeak(&v29, &location);
    id v23 = v19;
    id v26 = v23;
    id v24 = v9;
    id v27 = v24;
    id v28 = v7;
    -[PCSPeerSyncing sendKeys:dsid:handleReply:](self, "sendKeys:dsid:handleReply:", v18, v28, v25);

    objc_destroyWeak(&v29);
  }

  else
  {
    id v11 = (os_log_s *)(id)qword_10002BDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceIdentifier]);
      *(_DWORD *)__int128 buf = 138412290;
      id v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No key to send [to device: %@", buf, 0xCu);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing syncingManager](self, "syncingManager"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSDevice idsDeviceIdentifier](self->_device, "idsDeviceIdentifier"));
    [v14 signalComplete:v15];

    -[PCSPeerSyncing setPendingRequest:](self, "setPendingRequest:", 0LL);
  }

  objc_destroyWeak(&location);
}

- (void)sendCurrentKeys:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing syncingManager](self, "syncingManager"));
  id v7 = [v6 copyIdentitySet];

  if (v7)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000B1EC;
    void v14[3] = &unk_100024CE0;
    id v16 = v7;
    id v8 = v5;
    id v15 = v8;
    PCSServiceItemsGetEachName(v14);
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000B250;
    v11[3] = &unk_100024D08;
    objc_copyWeak(v12, &location);
    v12[1] = v7;
    -[PCSPeerSyncing sendCurrents:dsid:handleReply:](self, "sendCurrents:dsid:handleReply:", v8, v4, v11);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  else
  {
    -[PCSPeerSyncing setPendingRequest:](self, "setPendingRequest:", 0LL);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing syncingManager](self, "syncingManager"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSDevice idsDeviceIdentifier](self->_device, "idsDeviceIdentifier"));
    [v9 signalComplete:v10];
  }
}

- (void)sendKeys
{
  if (!-[PCSPeerSyncing pendingRequest](self, "pendingRequest"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing dsid](self->_syncingManager, "dsid"));
    if (v7)
    {
      syncingManager = self->_syncingManager;
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDeviceIdentifier]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSKeySyncing outStandingPCSKeys:](syncingManager, "outStandingPCSKeys:", v10));

      if (v11)
      {
        BOOL v12 = -[PCSKeySyncing iCDPStatus](self->_syncingManager, "iCDPStatus");
        BOOL v13 = -[PCSKeySyncing companionCircleMember](self->_syncingManager, "companionCircleMember");
        uint64_t v14 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = v14;
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
          *(_DWORD *)__int128 buf = 67109376;
          LODWORD(v36[0]) = v12;
          WORD2(v36[0]) = 1024;
          *(_DWORD *)((char *)v36 + 6) = [v16 iCDP];
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "local iCDP: %d, cached peer iCDP status: %d",  buf,  0xEu);
        }

        objc_super v17 = (void *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v17;
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
          unsigned int v20 = [v19 circle];
          *(_DWORD *)__int128 buf = 67109376;
          LODWORD(v36[0]) = v13;
          WORD2(v36[0]) = 1024;
          *(_DWORD *)((char *)v36 + 6) = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "local circle: %d, cached peer circle status: %d",  buf,  0xEu);
        }

        -[PCSPeerSyncing setPendingRequest:](self, "setPendingRequest:", 1LL);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
        if (v12 != [v21 iCDP])
        {

LABEL_18:
          objc_initWeak(&location, self);
          id v26 = (os_log_s *)qword_10002BDE0;
          if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 67109376;
            LODWORD(v36[0]) = v12;
            WORD2(v36[0]) = 1024;
            *(_DWORD *)((char *)v36 + 6) = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Setting peer iCDP status to: %d and circle to: %d",  buf,  0xEu);
          }

          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472LL;
          v28[2] = sub_10000B7D0;
          v28[3] = &unk_100024D30;
          objc_copyWeak(&v31, &location);
          BOOL v32 = v12;
          BOOL v33 = v13;
          id v27 = v11;
          id v29 = v27;
          id v30 = v7;
          -[PCSPeerSyncing sendiCDPStatus:circleStatus:handleReply:]( self,  "sendiCDPStatus:circleStatus:handleReply:",  v12,  v13,  v28);

          objc_destroyWeak(&v31);
          objc_destroyWeak(&location);

          goto LABEL_22;
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
        unsigned int v25 = [v24 circle];

        if (v13 != v25) {
          goto LABEL_18;
        }
        -[PCSPeerSyncing sendSomeKeys:dsid:](self, "sendSomeKeys:dsid:", v11, v7);

LABEL_22:
        return;
      }

      id v22 = (os_log_s *)qword_10002BDE0;
      if (!os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)__int128 buf = 0;
      id v23 = "Can't get pending keys";
    }

    else
    {
      id v22 = (os_log_s *)qword_10002BDE0;
      if (!os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)__int128 buf = 0;
      id v23 = "Can't get dsid";
    }

    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    goto LABEL_22;
  }

  BOOL v3 = (void *)qword_10002BDE0;
  if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 idsDeviceIdentifier]);
    *(_DWORD *)__int128 buf = 138412290;
    v36[0] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "sendKeys request to device %@ already pending",  buf,  0xCu);
  }

- (void)haveKeys:(id)a3
{
  id v18 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v4 updateClient:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 buildVersion]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v8 setBuildVersion:v7];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v9 setFailures:0];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstSync]);

  if (!v11)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
    [v13 setFirstSync:v12];
  }

  uint64_t v14 = (uint64_t)v18;
  if (!v18) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  id v19 = (id)v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v15 setLastHash:v19];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v16 saveClient:v17];
}

- (void)setPeeriCDPStatus:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v5 updateClient:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v7 setICDP:v3];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v9 saveClient:v8];
}

- (void)setPeerCircleStatus:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v5 updateClient:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v7 setCircle:v3];

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v9 saveClient:v8];
}

- (void)keyFailure:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v4 updateClient:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  objc_msgSend(v6, "setFailures:", objc_msgSend(v6, "failures") + 1);

  if (!v10) {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v7 setLastHash:v10];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PCSKeySyncing defaultSyncingManager](&OBJC_CLASS___PCSKeySyncing, "defaultSyncingManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing client](self, "client"));
  [v8 saveClient:v9];
}

- (void)sendReply:(int)a3 error:(id)a4 toMessage:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v14 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
  [v9 setObject:v10 forKeyedSubscript:@"r"];

  if (v14)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
    [v9 setObject:v11 forKeyedSubscript:@"D"];

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v14 code]));
    [v9 setObject:v12 forKeyedSubscript:@"C"];

    [v9 setObject:@"foo" forKeyedSubscript:@"S"];
  }

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing transport](self, "transport"));
  [v13 sendResponse:v9 toMessage:v8 withPriority:200 timeout:@"reply" logDescription:120.0];
}

- (void)handleIncomingMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    BOOL v12 = self;
    uint64_t v13 = 0LL;
LABEL_8:
    -[PCSPeerSyncing checkSyncing:](v12, "checkSyncing:", v13);
    goto LABEL_27;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 message]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"c"]);
  unsigned int v8 = [v7 intValue];

  if (v8 == 10)
  {
    id v14 = (void *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      *(_DWORD *)__int128 buf = 138412290;
      v41[0] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "handleIncomingMessage sync with escrow proxy: %@",  buf,  0xCu);
    }

    -[PCSPeerSyncing checkSyncing:](self, "checkSyncing:", 1LL);
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"s"]);

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      unsigned int v20 = (os_log_s *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        v41[0] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "sync with escrow proxy for service %@",  buf,  0xCu);
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[PCSAccountsModel defaultAccountsModel](&OBJC_CLASS___PCSAccountsModel, "defaultAccountsModel"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dsid]);
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      id v39 = 0LL;
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  @"nextRegistrySync",  &v39));
      id v24 = v39;
      unsigned int v25 = v24;
      if (!v23 || v24)
      {
        id v26 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          v41[0] = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
        }
      }

      id v38 = 0LL;
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[PCSAccountsModel settingsKeyForKey:error:]( &OBJC_CLASS___PCSAccountsModel,  "settingsKeyForKey:error:",  @"registrySyncIdentifier",  &v38));
      id v28 = v38;
      id v29 = v28;
      if (!v27 || v28)
      {
        id v30 = (os_log_s *)qword_10002BDE0;
        if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          v41[0] = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Failed to get key: %@", buf, 0xCu);
        }
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[PCSSyncing defaultPCSSyncing](&OBJC_CLASS___PCSSyncing, "defaultPCSSyncing"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      void v36[2] = sub_10000C414;
      v36[3] = &unk_100024D58;
      v36[4] = self;
      id v37 = v5;
      [v31 triggerSyncingWithEscrowProxy:v18 dsid:v22 publicKeys:0 accountIdentifier:v35 settingsKeyExpirationDate:v23 settingsKeyIdentifier:v27 complete:v36];
    }

    else
    {
      -[PCSPeerSyncing sendReply:error:toMessage:](self, "sendReply:error:toMessage:", 0LL, 0LL, v5);
    }
  }

  else
  {
    if (v8 == 4)
    {
      id v9 = (void *)qword_10002BDE0;
      if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
        *(_DWORD *)__int128 buf = 138412290;
        v41[0] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "handleIncomingMessage watch requested keys: %@",  buf,  0xCu);
      }

      BOOL v12 = self;
      uint64_t v13 = 1LL;
      goto LABEL_8;
    }

    BOOL v32 = (void *)qword_10002BDE0;
    if (os_log_type_enabled((os_log_t)qword_10002BDE0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PCSPeerSyncing device](self, "device"));
      *(_DWORD *)__int128 buf = 67109378;
      LODWORD(v41[0]) = v8;
      WORD2(v41[0]) = 2112;
      *(void *)((char *)v41 + 6) = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "handleIncomingMessage unknown command %d from device: %@",  buf,  0x12u);
    }
  }

- (PCSDevice)device
{
  return (PCSDevice *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDevice:(id)a3
{
}

- (PCSIDSTransport)transport
{
  return (PCSIDSTransport *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTransport:(id)a3
{
}

- (NSData)keys
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setKeys:(id)a3
{
}

- (BOOL)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(BOOL)a3
{
  self->_pendingRequest = a3;
}

- (int)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(int)a3
{
  self->_clientVersion = a3;
}

- (PCSKeyClient)client
{
  return (PCSKeyClient *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setClient:(id)a3
{
}

- (PCSKeySyncing)syncingManager
{
  return (PCSKeySyncing *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSyncingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end