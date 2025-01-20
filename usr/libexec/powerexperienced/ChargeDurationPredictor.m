@interface ChargeDurationPredictor
+ (id)sharedInstance;
- (BOOL)inTypicalUsageEnvironment;
- (BOOL)lastPluggedInState;
- (BOOL)longChargeExpected;
- (BOOL)predictionAvailableForScheme:(unint64_t)a3;
- (BOOL)predictorReady;
- (BOOL)shortChargeExpected;
- (ChargeDurationPredictor)init;
- (DeviceContext)deviceContext;
- (NSMutableDictionary)predictorOutput;
- (OS_dispatch_queue)mainQueue;
- (OS_dispatch_queue)predictionQueryQueue;
- (OS_os_log)log;
- (_OSChargingPredictor)predictor;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)queryModelForScheme:(unint64_t)a3;
- (void)setDeviceContext:(id)a3;
- (void)setLastPluggedInState:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setPredictionQueryQueue:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setPredictorOutput:(id)a3;
@end

@implementation ChargeDurationPredictor

+ (id)sharedInstance
{
  if (qword_10001B690 != -1) {
    dispatch_once(&qword_10001B690, &stru_100014380);
  }
  return (id)qword_10001B688;
}

- (ChargeDurationPredictor)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ChargeDurationPredictor;
  v2 = -[ChargeDurationPredictor init](&v20, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerexperienced", "chargedurationpredictor");
    log = v2->_log;
    v2->_log = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.powerexperienced.chargedurationpredictorquery", v6);
    predictionQueryQueue = v2->_predictionQueryQueue;
    v2->_predictionQueryQueue = (OS_dispatch_queue *)v7;

    id v9 = sub_100009834();
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    mainQueue = v2->_mainQueue;
    v2->_mainQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[_OSChargingPredictor predictor](&OBJC_CLASS____OSChargingPredictor, "predictor"));
    predictor = v2->_predictor;
    v2->_predictor = (_OSChargingPredictor *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    predictorOutput = v2->_predictorOutput;
    v2->_predictorOutput = (NSMutableDictionary *)v14;

    v2->_lastPluggedInState = IOPSDrawingUnlimitedPower();
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
    deviceContext = v2->_deviceContext;
    v2->_deviceContext = (DeviceContext *)v16;

    -[DeviceContext addObserver:forKeyPath:options:context:]( v2->_deviceContext,  "addObserver:forKeyPath:options:context:",  v2,  @"currentContext",  3LL,  0LL);
    if (!v2->_predictor)
    {
      v18 = v2->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10000D310(v18);
      }
    }
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor deviceContext](self, "deviceContext", a3, a4, a5, a6));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentContext]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kPluggedInContext"]);
  id v10 = [v9 BOOLValue];

  if ((_DWORD)v10 != -[ChargeDurationPredictor lastPluggedInState](self, "lastPluggedInState"))
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109120;
      v14[1] = (_DWORD)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "plugin state changed to %d",  (uint8_t *)v14,  8u);
    }

    -[ChargeDurationPredictor setLastPluggedInState:](self, "setLastPluggedInState:", v10);
    if (!-[ChargeDurationPredictor lastPluggedInState](self, "lastPluggedInState"))
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Clearing cached predictor output",  (uint8_t *)v14,  2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
      [v13 removeAllObjects];
    }
  }

- (BOOL)predictorReady
{
  return MKBDeviceUnlockedSinceBoot(self, a2) != 0;
}

- (BOOL)predictionAvailableForScheme:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6 != 0LL;
}

- (void)queryModelForScheme:(unint64_t)a3
{
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:"))
  {
    if (self->_predictor)
    {
      dispatch_queue_attr_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictionQueryQueue](self, "predictionQueryQueue"));
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000035C8;
      v6[3] = &unk_1000143D0;
      v6[4] = self;
      v6[5] = a3;
      dispatch_async(v5, v6);
    }
  }

- (BOOL)longChargeExpected
{
  if (!-[ChargeDurationPredictor predictorReady](self, "predictorReady")) {
    return 0;
  }
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:", 3LL))
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "LongChargeExpected:prediction not available. kicking off query",  (uint8_t *)&v10,  2u);
    }

    -[ChargeDurationPredictor queryModelForScheme:](self, "queryModelForScheme:", 3LL);
    return 0;
  }

  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_100015098]);

  if (!v4) {
    goto LABEL_12;
  }
  dispatch_queue_attr_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LongChargeExpected: %@", (uint8_t *)&v10, 0xCu);
  }

  else {
LABEL_12:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)shortChargeExpected
{
  if (!-[ChargeDurationPredictor predictorReady](self, "predictorReady")) {
    return 0;
  }
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:", 5LL))
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "shortchargePrediction:prediction not available. kicking off query",  (uint8_t *)&v10,  2u);
    }

    -[ChargeDurationPredictor queryModelForScheme:](self, "queryModelForScheme:", 5LL);
    return 0;
  }

  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_1000150B0]);

  if (!v4) {
    goto LABEL_12;
  }
  dispatch_queue_attr_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "shortChargeExpected: %@", (uint8_t *)&v10, 0xCu);
  }

  else {
LABEL_12:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)inTypicalUsageEnvironment
{
  if (!-[ChargeDurationPredictor predictorReady](self, "predictorReady")) {
    return 0;
  }
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:", 4LL))
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "inTypicalUsageEnvironment:prediction not available. kicking off query",  (uint8_t *)&v10,  2u);
    }

    -[ChargeDurationPredictor queryModelForScheme:](self, "queryModelForScheme:", 4LL);
    return 0;
  }

  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_1000150C8]);

  if (!v4) {
    goto LABEL_12;
  }
  dispatch_queue_attr_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeDurationPredictor predictorOutput](self, "predictorOutput"));
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "inTypicalUsageEnvironment: %@",  (uint8_t *)&v10,  0xCu);
  }

  else {
LABEL_12:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)lastPluggedInState
{
  return self->_lastPluggedInState;
}

- (void)setLastPluggedInState:(BOOL)a3
{
  self->_lastPluggedInState = a3;
}

- (DeviceContext)deviceContext
{
  return (DeviceContext *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDeviceContext:(id)a3
{
}

- (_OSChargingPredictor)predictor
{
  return (_OSChargingPredictor *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPredictor:(id)a3
{
}

- (NSMutableDictionary)predictorOutput
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPredictorOutput:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)predictionQueryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPredictionQueryQueue:(id)a3
{
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMainQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end