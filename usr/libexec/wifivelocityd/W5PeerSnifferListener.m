@interface W5PeerSnifferListener
- (BOOL)handleClientRequest:(id)a3;
- (CWFInterface)interface;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5PeerSnifferListener)initWithInterface:(id)a3 snifferManager:(id)a4;
- (W5WiFiSniffManager)snifferManager;
- (id)_runSnifferOnChannels:(id)a3 interface:(id)a4 duration:(double)a5 noAutoStop:(BOOL)a6 rotationInternal:(int64_t)a7 uuid:(id)a8;
- (void)setInterface:(id)a3;
- (void)setSnifferManager:(id)a3;
- (void)stopSnifferWithUUID:(id)a3 interface:(id)a4;
@end

@implementation W5PeerSnifferListener

- (W5PeerSnifferListener)initWithInterface:(id)a3 snifferManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___W5PeerSnifferListener;
  v9 = -[W5PeerSnifferListener init](&v15, "init");
  v10 = v9;
  if (!v9
    || (objc_storeStrong((id *)&v9->_interface, a3), !v10->_interface)
    || (objc_storeStrong((id *)&v10->_snifferManager, a4), !v10->_snifferManager))
  {

    uint64_t v11 = sub_10008C90C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      v17 = "-[W5PeerSnifferListener initWithInterface:snifferManager:]";
      __int16 v18 = 2080;
      v19 = "W5PeerSnifferListener.m";
      __int16 v20 = 1024;
      int v21 = 43;
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
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
  id v7 = [v6 integerValue];

  id v8 = objc_alloc_init(&OBJC_CLASS___W5PeerSnifferResponsePayload);
  -[W5PeerSnifferResponsePayload setVersion:](v8, "setVersion:", &off_1000DEC28);
  if (v7 == (id)1)
  {
    id v9 = [v5 type];
    v10 = (char *)objc_claimAutoreleasedReturnValue([v5 channels]);
    [v5 duration];
    double v12 = v11;
    v13 = (char *)objc_claimAutoreleasedReturnValue([v5 uuid]);
    if (v9 == (id)2)
    {
      uint64_t v20 = sub_10008C90C();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543362;
        v29 = v13;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] Request received to cancel sniffer with UUID: %{public}@",  &v28,  12);
      }

      -[W5PeerSnifferListener stopSnifferWithUUID:interface:]( self,  "stopSnifferWithUUID:interface:",  v13,  self->_interface);
      -[W5PeerSnifferResponsePayload setStatus:](v8, "setStatus:", 1LL);
    }

    else if (v9 == (id)1 && v10)
    {
      uint64_t v14 = sub_10008C90C();
      objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 138543362;
        v29 = v10;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] Request received to run sniffer on channels: %{public}@",  &v28,  12);
      }

      if (!v13)
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v16 = sub_10008C90C();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138543362;
          v29 = v13;
          LODWORD(v27) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] Generating uuid for sniffer invocation %{public}@",  &v28,  v27);
        }
      }

      id v18 = [v5 noAutoStop];
      if ((_DWORD)v18) {
        id v19 = [v5 rotationInterval];
      }
      else {
        id v19 = 0LL;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]( self,  "_runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:",  v10,  self->_interface,  v18,  v19,  v13,  v12));
      -[W5PeerSnifferResponsePayload setStatus:](v8, "setStatus:", 1LL);
      -[W5PeerSnifferResponsePayload setFilePaths:](v8, "setFilePaths:", v22);
      -[W5PeerSnifferResponsePayload setUuid:](v8, "setUuid:", v13);
      uint64_t v23 = sub_10008C90C();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 136316162;
        v29 = "-[W5PeerSnifferListener handleClientRequest:]";
        __int16 v30 = 2080;
        v31 = "W5PeerSnifferListener.m";
        __int16 v32 = 1024;
        int v33 = 83;
        __int16 v34 = 2114;
        v35 = v13;
        __int16 v36 = 2114;
        v37 = v22;
        LODWORD(v27) = 48;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] %s (%s:%u) For Sniffer Request, replied with UUID: %{public}@, paths: %{public}@",  &v28,  v27);
      }
    }
  }

  v25 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
  ((void (**)(void, W5PeerSnifferResponsePayload *, void))v25)[2](v25, v8, 0LL);

  return 1;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerSnifferRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.runSniffer";
}

- (id)_runSnifferOnChannels:(id)a3 interface:(id)a4 duration:(double)a5 noAutoStop:(BOOL)a6 rotationInternal:(int64_t)a7 uuid:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x3032000000LL;
  v39[3] = sub_100012560;
  v39[4] = sub_100012570;
  id v40 = 0LL;
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x2020000000LL;
  char v38 = 0;
  uint64_t v31 = 0LL;
  __int16 v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  __int16 v34 = sub_100012560;
  v35 = sub_100012570;
  __int16 v36 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100012578;
  v21[3] = &unk_1000D1410;
  BOOL v30 = a6;
  id v17 = v16;
  id v22 = v17;
  double v28 = a5;
  int64_t v29 = a7;
  id v18 = v15;
  v25 = v37;
  v26 = v39;
  id v23 = v18;
  v24 = self;
  uint64_t v27 = &v31;
  [v14 enumerateObjectsUsingBlock:v21];
  id v19 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

  return v19;
}

- (void)stopSnifferWithUUID:(id)a3 interface:(id)a4
{
  v6 = (char *)a3;
  id v7 = a4;
  uint64_t v8 = sub_10008C90C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    id v22 = v6;
    int v17 = 12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] Stopping Sniffer Request with UUID: %{public}@",  &v21,  v17);
  }

  snifferManager = self->_snifferManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100012DE4;
  v19[3] = &unk_1000D1438;
  double v11 = v6;
  uint64_t v20 = v11;
  -[W5WiFiSniffManager cancelRequestWithUUID:reply:](snifferManager, "cancelRequestWithUUID:reply:", v11, v19);
  id v18 = 0LL;
  [v7 setUserAutoJoinDisabled:0 error:&v18];
  id v12 = v18;
  uint64_t v13 = sub_10008C90C();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v15 = [v7 userAutoJoinDisabled];
    int v21 = 136316418;
    id v22 = "-[W5PeerSnifferListener stopSnifferWithUUID:interface:]";
    __int16 v23 = 2080;
    v24 = "W5PeerSnifferListener.m";
    __int16 v25 = 1024;
    int v26 = 176;
    __int16 v27 = 1024;
    int v28 = 0;
    __int16 v29 = 1024;
    unsigned int v30 = v15;
    __int16 v31 = 2114;
    id v32 = v12;
    LODWORD(v16) = 50;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) Setting User Auto Join Disabled: %d, status: %d, error: %{public}@",  &v21,  v16);
  }
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (W5WiFiSniffManager)snifferManager
{
  return self->_snifferManager;
}

- (void)setSnifferManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end