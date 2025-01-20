@interface RMDataStreamHandler
- (BOOL)endpoint:(id)a3 shouldStartStreamingDataToReceiver:(id)a4;
- (RMDataStreamHandler)initWithEndpoint:(id)a3 isInternal:(BOOL)a4;
- (void)dealloc;
- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6;
- (void)endpoint:(id)a3 didReceiveStreamingRequest:(id)a4 withData:(id)a5;
- (void)endpointShouldStopStreamingData:(id)a3;
@end

@implementation RMDataStreamHandler

- (RMDataStreamHandler)initWithEndpoint:(id)a3 isInternal:(BOOL)a4
{
  v7 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RMDataStreamHandler;
  v8 = -[RMDataStreamHandler init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpoint, a3);
    sub_100011130(v7, v9);
    v9->_isInternal = a4;
    v9->_dataProviderStreaming = 0;
  }

  return v9;
}

- (void)dealloc
{
  if (self)
  {
    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
    sub_100004254((uint64_t)self, 0LL);
    endpoint = self->_endpoint;
  }

  else
  {
    [0 invalidate];
    sub_100004254(0LL, 0LL);
    endpoint = 0LL;
  }

  sub_100011130((id *)&endpoint->super.isa, 0LL);
  sub_100003CEC((uint64_t)self, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RMDataStreamHandler;
  -[RMDataStreamHandler dealloc](&v4, "dealloc");
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  v14 = (RMConnectionEndpoint *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!self) {
    goto LABEL_6;
  }
  for (i = self->_endpoint; i != v14; i = 0LL)
  {
    id v12 = (id)sub_1000117F8();
LABEL_6:
    ;
  }
}

- (void)endpoint:(id)a3 didReceiveStreamingRequest:(id)a4 withData:(id)a5
{
  v8 = (RMConnectionEndpoint *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (self) {
    endpoint = self->_endpoint;
  }
  else {
    endpoint = 0LL;
  }
  if (endpoint != v8)
  {
    sub_100011914();
LABEL_41:
    dispatch_once(&qword_100023C98, &stru_10001CCA8);
LABEL_6:
    id v47 = 0LL;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  qword_100023C90,  v11,  &v47));
    id v14 = v47;
    v15 = objc_alloc(&OBJC_CLASS___NSUUID);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Identifier"]);
    v17 = -[NSUUID initWithUUIDString:](v15, "initWithUUIDString:", v16);

    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001CD68);
    }
    v18 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Identifier: %@", buf, 0xCu);
    }

    v19 = (NSUUID *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"Interval"]);
    v46 = v17;
    if (qword_100023970 != -1) {
      dispatch_once(&qword_100023970, &stru_10001CD68);
    }
    v20 = (os_log_s *)qword_100023978;
    if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Interval: %@", buf, 0xCu);
    }

    if (self && self->_dataProviderStreaming)
    {
      if (qword_100023970 != -1) {
        dispatch_once(&qword_100023970, &stru_10001CD68);
      }
      v21 = (os_log_s *)qword_100023978;
      if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "Received a new streaming request while the previous streaming is still active",  buf,  2u);
      }

      -[RMDataStreamHandler endpointShouldStopStreamingData:](self, "endpointShouldStopStreamingData:", v8);
    }

    sub_100003D0C((uint64_t)self, 0LL);
    if (self->_isInternal)
    {
      if ([v9 isEqualToString:@"kRMStartStreamingDummyData"])
      {
        id v45 = v14;
        v22 = -[RMDummyDataProviderConfiguration initWithUniqueIdentifier:updateInterval:]( objc_alloc(&OBJC_CLASS___RMDummyDataProviderConfiguration),  "initWithUniqueIdentifier:updateInterval:",  v46,  -[NSUUID unsignedLongLongValue](v19, "unsignedLongLongValue"));
        v23 = objc_alloc(&OBJC_CLASS___RMDummyDataProvider);
        uint64_t v24 = sub_100010D64((uint64_t)v8);
        v25 = (RMAudioListenerPoseProviderConfiguration *)objc_claimAutoreleasedReturnValue(v24);
        v26 = -[RMDummyDataProvider initWithConfiguration:receiverQueue:]( v23,  "initWithConfiguration:receiverQueue:",  v22,  v25);
        sub_100003D0C((uint64_t)self, v26);

LABEL_37:
        id v14 = v45;
        goto LABEL_38;
      }

      if ([v9 isEqualToString:@"kRMStartStreamingAudioListenerPose"])
      {
        id v45 = v14;
        v22 = (RMDummyDataProviderConfiguration *)objc_claimAutoreleasedReturnValue( [v13 objectForKeyedSubscript:@"TempestOptions"]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"ForceSessionRestart"]);
        id v34 = [v33 BOOLValue];

        v25 = -[RMAudioListenerPoseProviderConfiguration initWithUniqueIdentifier:tempestOptions:forceSessionRestart:]( objc_alloc(&OBJC_CLASS___RMAudioListenerPoseProviderConfiguration),  "initWithUniqueIdentifier:tempestOptions:forceSessionRestart:",  v46,  v22,  v34);
        v35 = objc_alloc(&OBJC_CLASS___RMAudioListenerPoseProvider);
        uint64_t v36 = sub_100010D64((uint64_t)v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v38 = -[RMAudioListenerPoseProvider initWithConfiguration:receiverQueue:]( v35,  "initWithConfiguration:receiverQueue:",  v25,  v37);
        sub_100003D0C((uint64_t)self, v38);

        goto LABEL_37;
      }

- (BOOL)endpoint:(id)a3 shouldStartStreamingDataToReceiver:(id)a4
{
  id v10 = (RMConnectionEndpoint *)a3;
  id v11 = a4;
  if (self) {
    endpoint = self->_endpoint;
  }
  else {
    endpoint = 0LL;
  }
  if (endpoint != v10)
  {
    sub_100011A30();
LABEL_28:
    dispatch_once(&qword_100023970, &stru_10001CD68);
LABEL_12:
    v19 = v6[303];
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      endpointName = self->_endpointName;
      *(_DWORD *)buf = 138543362;
      *(void *)(v5 + 4) = endpointName;
      v21 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Data stream started on endpoint: %{public}@",  buf,  0xCu);
    }

    BOOL v22 = !self->_isInternal;
    v23 = self->_endpointName;
    v42[0] = @"client";
    v42[1] = @"tracking";
    v43[0] = v23;
    v43[1] = &__kCFBooleanTrue;
    v42[2] = @"eventType";
    uint64_t v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v22));
    v43[2] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));

    v27 = (os_log_s *)v6[303];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)(v5 + 4) = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Sending PowerLog event: %{private}@",  buf,  0xCu);
    }

    PLLogRegisteredEvent(100LL, @"AccessoryMotion", v26, 0LL);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000EA90;
    v38[3] = &unk_10001CCF8;
    v39 = v10;
    v28 = v4;
    uint64_t v40 = v28;
    id v29 = v11;
    id v41 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v38));
    sub_100004254((uint64_t)self, v30);

    dataProvider = self->_dataProvider;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10000EF1C;
    v36[3] = &unk_10001CD20;
    id v37 = v29;
    v32 = (void *)objc_claimAutoreleasedReturnValue( -[RMDataProvider startProducingDataWithCallback:]( dataProvider,  "startProducingDataWithCallback:",  v36));
    BOOL v33 = v32 == 0LL;
    if (!v32) {
      self->_dataProviderStreaming = 1;
    }

    goto LABEL_26;
  }

  if (self)
  {
    v13 = self->_dataProvider;
    if (v13)
    {
      objc_super v4 = v13;
      v5 = buf;
      id v14 = sub_10000944C((id *)&v10->super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_setProperty_nonatomic_copy(self, v16, v15, 24LL);

      v7 = &selRef_dealloc;
      v6 = &selRef_dealloc;
      if (!self->_endpointName)
      {
        objc_setProperty_nonatomic_copy(self, v17, @"unknown", 24LL);
        if (qword_100023970 != -1) {
          dispatch_once(&qword_100023970, &stru_10001CD68);
        }
        v18 = (os_log_s *)qword_100023978;
        if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138477827;
          id v45 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "Failed to determine the endpoint name for endpoint: %{private}@",  buf,  0xCu);
        }
      }

      self->_startTime = sub_10000D190();
      if (qword_100023970 == -1) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }

  if (qword_100023970 != -1) {
    dispatch_once(&qword_100023970, &stru_10001CD68);
  }
  id v34 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Streaming can't start because no dataProvider has been initialized!",  buf,  2u);
  }

  BOOL v33 = 0;
LABEL_26:

  return v33;
}

- (void)endpointShouldStopStreamingData:(id)a3
{
  v5 = (RMConnectionEndpoint *)a3;
  v6 = v5;
  if (self) {
    endpoint = self->_endpoint;
  }
  else {
    endpoint = 0LL;
  }
  if (endpoint == v5)
  {
    v3 = &selRef_dealloc;
    if (qword_100023970 == -1) {
      goto LABEL_5;
    }
  }

  else
  {
    sub_100011B4C();
  }

  dispatch_once(&qword_100023970, &stru_10001CD68);
LABEL_5:
  v8 = (void *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      endpointName = self->_endpointName;
    }
    else {
      endpointName = 0LL;
    }
    *(_DWORD *)buf = 138543362;
    v26 = endpointName;
    id v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Data stream stopped on endpoint: %{public}@",  buf,  0xCu);
  }

  if (self)
  {
    BOOL v11 = !self->_isInternal;
    id v12 = self->_endpointName;
  }

  else
  {
    id v12 = 0LL;
    BOOL v11 = 1LL;
  }

  v23[0] = @"client";
  v23[1] = @"tracking";
  v24[0] = v12;
  v24[1] = &__kCFBooleanFalse;
  v23[2] = @"eventType";
  v13 = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v11));
  v24[2] = v14;
  v15 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  3LL));

  SEL v16 = (os_log_s *)qword_100023978;
  if (os_log_type_enabled((os_log_t)qword_100023978, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v26 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Sending PowerLog event: %{private}@",  buf,  0xCu);
  }

  PLLogRegisteredEvent(100LL, @"AccessoryMotion", v15, 0LL);
  if (self)
  {
    if (!self->_isInternal)
    {
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      v20 = sub_10000F23C;
      v21 = &unk_10001CD48;
      BOOL v22 = self;
      AnalyticsSendEventLazy(@"com.apple.CoreMotion.AudioAccessory.MotionAPI", &v18);
    }

    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
    sub_100004254((uint64_t)self, 0LL);
    dataProvider = self->_dataProvider;
  }

  else
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_10000F23C;
    v21 = &unk_10001CD48;
    BOOL v22 = 0LL;
    AnalyticsSendEventLazy(@"com.apple.CoreMotion.AudioAccessory.MotionAPI", &v18);
    [0 invalidate];
    sub_100004254(0LL, 0LL);
    dataProvider = 0LL;
  }

  -[RMDataProvider stopProducingData](dataProvider, "stopProducingData");
  if (self) {
    self->_dataProviderStreaming = 0;
  }
}

- (void).cxx_destruct
{
}

@end