@interface W5PeerStatusListener
- (BOOL)handleClientRequest:(id)a3;
- (CWFInterface)interface;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5PeerStatusListener)initWithInterface:(id)a3 statusManager:(id)a4;
- (W5StatusManager)statusManager;
- (id)_connectionInfo;
- (int64_t)currentVersion;
- (void)setInterface:(id)a3;
- (void)setStatusManager:(id)a3;
@end

@implementation W5PeerStatusListener

- (W5PeerStatusListener)initWithInterface:(id)a3 statusManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___W5PeerStatusListener;
  v9 = -[W5PeerStatusListener init](&v15, "init");
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_interface, a3), !v10->_interface)
    || (objc_storeStrong((id *)&v10->_statusManager, a4), !v10->_statusManager))
  {

    uint64_t v11 = sub_10008C90C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      v17 = "-[W5PeerStatusListener initWithInterface:statusManager:]";
      __int16 v18 = 2080;
      v19 = "W5PeerStatusListener.m";
      __int16 v20 = 1024;
      int v21 = 42;
      LODWORD(v14) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v16,  v14,  LODWORD(v15.receiver));
    }

    v10 = 0LL;
  }

  return v10;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  v6 = v5;
  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136316418;
      v19 = "-[W5PeerStatusListener handleClientRequest:]";
      __int16 v20 = 2080;
      int v21 = "W5PeerStatusListener.m";
      __int16 v22 = 1024;
      int v23 = 53;
      __int16 v24 = 2114;
      id v25 = v4;
      __int16 v26 = 2114;
      v27 = v6;
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@' version='%{public}@'",  &v18,  58);
    }

    v10 = objc_alloc_init(&OBJC_CLASS___W5PeerStatusResponsePayload);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerStatusListener currentVersion](self, "currentVersion")));
    -[W5PeerStatusResponsePayload setVersion:](v10, "setVersion:", v11);

    -[W5PeerStatusResponsePayload setStatus:](v10, "setStatus:", 1LL);
    if ([v7 integerValue] == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusListener statusManager](self, "statusManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 status]);
      -[W5PeerStatusResponsePayload setPeerStatus:](v10, "setPeerStatus:", v13);
    }

    v14 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
    ((void (**)(void, W5PeerStatusResponsePayload *, void))v14)[2](v14, v10, 0LL);
  }

  else
  {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusListener _connectionInfo](self, "_connectionInfo"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[W5PeerSimpleResponsePayload payloadFromDictionary:]( &OBJC_CLASS___W5PeerSimpleResponsePayload,  "payloadFromDictionary:",  v15));

    int v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
    ((void (**)(void, void *, void))v16)[2](v16, v7, 0LL);
  }

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerStatusRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.connectionState";
}

- (int64_t)currentVersion
{
  return 1LL;
}

- (id)_connectionInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusListener statusManager](self, "statusManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 networkStatus]);

  v5 = self->_interface;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIPv4Addresses]);
    id v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIPv4Addresses]);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    }

    else
    {
      v42 = &stru_1000D4648;
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIPv4Router]);

    if (v9) {
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 primaryIPv4Router]);
    }
    else {
      v41 = &stru_1000D4648;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIPv6Addresses]);
    id v11 = [v10 count];

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIPv6Addresses]);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
    }

    else
    {
      v40 = &stru_1000D4648;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 primaryIPv6Router]);

    if (v13) {
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 primaryIPv6Router]);
    }
    else {
      v39 = &stru_1000D4648;
    }
    BOOL v34 = ([v4 isAppleReachable] & 2) != 0
       && ([v4 isAppleReachable] & 4) == 0;
    v43[0] = @"networkName";
    uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CWFInterface networkName](v5, "networkName"));
    if (v14) {
      objc_super v15 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface networkName](v5, "networkName"));
    }
    else {
      objc_super v15 = &stru_1000D4648;
    }
    v33 = (__CFString *)v15;
    v44[0] = v15;
    v43[1] = @"bssid";
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface BSSID](v5, "BSSID"));
    v38 = (void *)v14;
    v35 = v4;
    if (v37) {
      int v16 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[CWFInterface BSSID](v5, "BSSID"));
    }
    else {
      int v16 = @"00:00:00:00:00:00";
    }
    v32 = (__CFString *)v16;
    v44[1] = v16;
    v44[2] = &stru_1000D4648;
    v43[2] = @"operatingBand";
    v43[3] = @"rssi";
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CWFInterface RSSI](v5, "RSSI")));
    int v18 = (void *)v17;
    if (v17) {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CWFInterface RSSI](v5, "RSSI")));
    }
    v31 = (void *)v17;
    v44[3] = v17;
    v43[4] = @"cca";
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CWFInterface CCA](v5, "CCA")));
    __int16 v20 = (void *)v19;
    v36 = v18;
    if (v19) {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CWFInterface CCA](v5, "CCA")));
    }
    v30 = (void *)v19;
    v44[4] = v19;
    v43[5] = @"channel";
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v21 channel]));
    v44[5] = v22;
    v43[6] = @"channelWidth";
    int v23 = (void *)objc_claimAutoreleasedReturnValue(-[CWFInterface channel](v5, "channel"));
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v23 width]));
    v44[6] = v24;
    v43[7] = @"txRate";
    -[CWFInterface txRate](v5, "txRate");
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v44[7] = v25;
    v43[8] = @"rxRate";
    -[CWFInterface rxRate](v5, "rxRate");
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v44[8] = v26;
    v44[9] = &off_1000E4528;
    v43[9] = @"txFail";
    v43[10] = @"txFrames";
    v44[10] = &off_1000E4528;
    v44[11] = &off_1000E4528;
    v43[11] = @"packetLoss";
    v43[12] = @"ipv4Address";
    v44[12] = v42;
    v43[13] = @"ipv4Gateway";
    v43[14] = @"ipv6Address";
    v44[13] = v41;
    v44[14] = v40;
    v44[15] = v39;
    v43[15] = @"ipv6Gateway";
    v43[16] = @"knownNetwork";
    v44[16] = &off_1000DF7C8;
    v44[17] = &off_1000DF7E0;
    v43[17] = @"securityType";
    v43[18] = @"internetConnected";
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v34));
    v43[19] = @"speed";
    v44[18] = v27;
    v44[19] = &stru_1000D4648;
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  20LL));

    if (v20) {
    if (v36)
    }

    if (v37) {
    id v4 = v35;
    }
    if (v38) {
  }
    }

  else
  {
    __int16 v28 = &__NSDictionary0__struct;
    v39 = &stru_1000D4648;
    v40 = &stru_1000D4648;
    v41 = &stru_1000D4648;
    v42 = &stru_1000D4648;
  }

  return v28;
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (W5StatusManager)statusManager
{
  return self->_statusManager;
}

- (void)setStatusManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end