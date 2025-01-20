@interface W5PeerSensingListener
- (BOOL)handleClientRequest:(id)a3;
- (BOOL)performSensing:(id)a3 error:(id *)a4;
- (CWFInterface)interface;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5PeerSensingListener)initWithInterface:(id)a3;
- (id)_responseDictionaryWithSuccess:(BOOL)a3 errorString:(id)a4;
- (void)setInterface:(id)a3;
@end

@implementation W5PeerSensingListener

- (W5PeerSensingListener)initWithInterface:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5PeerSensingListener;
  v6 = -[W5PeerSensingListener init](&v12, "init");
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_interface, a3), !v7->_interface))
  {

    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[W5PeerSensingListener initWithInterface:]";
      __int16 v15 = 2080;
      v16 = "W5PeerSensingListener.m";
      __int16 v17 = 1024;
      int v18 = 35;
      LODWORD(v11) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v13,  v11,  LODWORD(v12.receiver));
    }

    v7 = 0LL;
  }

  return v7;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___W5PeerSensingResponsePayload);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);

  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CWFSensingParameters);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"numberOfReports"]);
    objc_msgSend(v7, "setNumberOfReports:", (int)objc_msgSend(v9, "intValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"placeLabels"]);
    [v7 setPlaceLabels:v11];

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"activityLabels"]);
    [v7 setActivityLabels:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 options]);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"submitMetric"]);
    objc_msgSend(v7, "setSubmitMetric:", objc_msgSend(v15, "intValue") != 0);

    uint64_t v16 = sub_10008C90C();
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
      int v29 = 136315906;
      v30 = "-[W5PeerSensingListener handleClientRequest:]";
      __int16 v31 = 2080;
      v32 = "W5PeerSensingListener.m";
      __int16 v33 = 1024;
      int v34 = 58;
      __int16 v35 = 2114;
      v36 = v18;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) Performing sensing with parameters='%{public}@'",  &v29,  38);
    }

    id v28 = 0LL;
    BOOL v19 = -[W5PeerSensingListener performSensing:error:](self, "performSensing:error:", v7, &v28);
    id v20 = v28;
    -[W5PeerSensingResponsePayload setResult:](v5, "setResult:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedDescription]);

    -[W5PeerSensingResponsePayload setErrorStr:](v5, "setErrorStr:", v21);
    v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
    ((void (**)(void, W5PeerSensingResponsePayload *, void))v22)[2](v22, v5, 0LL);
  }

  else
  {
    uint64_t v23 = sub_10008C90C();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      v30 = "-[W5PeerSensingListener handleClientRequest:]";
      __int16 v31 = 2080;
      v32 = "W5PeerSensingListener.m";
      __int16 v33 = 1024;
      int v34 = 45;
      LODWORD(v26) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] %s (%s:%u) Incoming request for W5DeviceConnection to perform sensing, but options dictionary was empty",  (const char *)&v29,  v26,  v27);
    }

    -[W5PeerSensingResponsePayload setResult:](v5, "setResult:", 0LL);
    -[W5PeerSensingResponsePayload setErrorStr:](v5, "setErrorStr:", @"empty request dictionary");
    id v7 = (id)objc_claimAutoreleasedReturnValue([v4 handler]);
    (*((void (**)(id, W5PeerSensingResponsePayload *, void))v7 + 2))(v7, v5, 0LL);
  }

  return v6 != 0LL;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.performSensing";
}

- (Class)requestPayloadClass
{
  return 0LL;
}

- (BOOL)performSensing:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_10008C90C();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSensingListener interface](self, "interface"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 networkName]);
    int v15 = 136315906;
    uint64_t v16 = "-[W5PeerSensingListener performSensing:error:]";
    __int16 v17 = 2080;
    int v18 = "W5PeerSensingListener.m";
    __int16 v19 = 1024;
    int v20 = 85;
    __int16 v21 = 2114;
    v22 = v10;
    int v14 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) corewifi perform sensing for network='%{public}@'",  &v15,  v14);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSensingListener interface](self, "interface"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 performSensingWithParameters:v6 error:a4]);

  return v12 != 0LL;
}

- (id)_responseDictionaryWithSuccess:(BOOL)a3 errorString:(id)a4
{
  BOOL v4 = a3;
  id v5 = (__CFString *)a4;
  if (v5) {
    int v6 = 1;
  }
  else {
    int v6 = v4;
  }
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = @"unknown error";
  }
  v12[0] = @"result";
  uint64_t v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  v12[1] = @"error";
  v13[0] = v9;
  v13[1] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));

  return v10;
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end