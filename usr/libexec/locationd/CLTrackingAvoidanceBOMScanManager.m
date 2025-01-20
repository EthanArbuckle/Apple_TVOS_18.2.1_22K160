@interface CLTrackingAvoidanceBOMScanManager
- (BOOL)checkDailyResetEligible:(id)a3;
- (CLAvengerScannerClient)controller;
- (CLTrackingAvoidanceBOMScanManager)initWithQueue:(id)a3 andController:(id)a4;
- (OS_dispatch_queue)queue;
- (double)computeBOMScanBackoffOfDate:(id)a3;
- (double)coolDownScan;
- (id)initAndStartWithQueue:(id)a3 andController:(id)a4;
- (id)timestampOfLastBOMDailyLimitResetDate;
- (id)timestampOfLastBeepOnMoveScanDate;
- (unsigned)dailyStartingValue;
- (unsigned)remainingBOMScans;
- (void)dispatchEnableBomScanAfterBackoff;
- (void)enableBOMScan;
- (void)handleRegisterWithController:(id)a3;
- (void)handleUnRegisterController;
- (void)resetBOMScanIfNeeded;
- (void)scanCompleted;
- (void)scheduleDailyResetBOMScan;
- (void)setController:(id)a3;
- (void)setRemainingBOMScansTo:(unsigned int)a3;
- (void)setTimeStampLastBeepOnMoveScan:(double)a3;
- (void)setTimestampLastBOMDailyLimitResetDate:(double)a3;
- (void)submitBOMMetricsBoot;
- (void)submitBOMMetricsScansCompleted:(unint64_t)a3 andTimeSinceLastDisable:(double)a4;
@end

@implementation CLTrackingAvoidanceBOMScanManager

- (CLTrackingAvoidanceBOMScanManager)initWithQueue:(id)a3 andController:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CLTrackingAvoidanceBOMScanManager;
  v6 = -[CLTrackingAvoidanceBOMScanManager init](&v22, "init");
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_queue = (OS_dispatch_queue *)a3;
  v6->_controller = (CLAvengerScannerClient *)a4;
  sub_1002F0B04(buf);
  int v8 = sub_1002A82BC(*(uint64_t *)buf, "TrackingAvoidanceCooldownTimeForBOMScan", &v23);
  double v9 = v23;
  if (!v8) {
    double v9 = 960.0;
  }
  v7->_double coolDownScan = v9;
  v10 = *(std::__shared_weak_count **)v25;
  if (*(void *)v25)
  {
    v11 = (unint64_t *)(*(void *)v25 + 8LL);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  v7->_dailyStartingValue = 5;
  sub_1002F0B04(buf);
  int v13 = sub_1002A775C(*(uint64_t *)buf, "TrackingAvoidanceRemainingBOMScansStartingValue", &v7->_dailyStartingValue);
  int v14 = v13;
  v15 = *(std::__shared_weak_count **)v25;
  if (*(void *)v25)
  {
    v16 = (unint64_t *)(*(void *)v25 + 8LL);
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
      if (!v14) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  if (v13) {
LABEL_14:
  }
    -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](v7, "setRemainingBOMScansTo:", v7->_dailyStartingValue);
LABEL_15:
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  v18 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    double coolDownScan = v7->_coolDownScan;
    unsigned int v20 = -[CLTrackingAvoidanceBOMScanManager remainingBOMScans](v7, "remainingBOMScans");
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v25 = 2082;
    *(void *)&v25[2] = "";
    __int16 v26 = 2050;
    unint64_t v27 = (unint64_t)coolDownScan;
    __int16 v28 = 2050;
    uint64_t v29 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM scan manager init , coolDownScan:%{public}lu, remainingBOMScans:%{public}lu}",  buf,  0x26u);
  }

  -[CLTrackingAvoidanceBOMScanManager submitBOMMetricsBoot](v7, "submitBOMMetricsBoot");
  return v7;
}

- (id)initAndStartWithQueue:(id)a3 andController:(id)a4
{
  v4 = -[CLTrackingAvoidanceBOMScanManager initWithQueue:andController:](self, "initWithQueue:andController:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CLTrackingAvoidanceBOMScanManager resetBOMScanIfNeeded](v4, "resetBOMScanIfNeeded");
    -[CLTrackingAvoidanceBOMScanManager scheduleDailyResetBOMScan](v5, "scheduleDailyResetBOMScan");
    -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](v5, "dispatchEnableBomScanAfterBackoff");
  }

  return v5;
}

- (void)setTimeStampLastBeepOnMoveScan:(double)a3
{
  double v6 = a3;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002AC7B8(v3, "TrackingAvoidanceLastBeepOnMoveScanDate", &v6);
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 944LL))(v4);
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  v5 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2049;
    unint64_t v12 = (unint64_t)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM setting last BOM timestamp, time:%{private}lu}",  buf,  0x1Cu);
  }

- (id)timestampOfLastBeepOnMoveScanDate
{
  uint64_t v3 = sub_1002F8DDC();
  if ((sub_1002A82BC(v3, "TrackingAvoidanceLastBeepOnMoveScanDate", &v6) & 1) == 0)
  {
    double v6 = 0.0;
    -[CLTrackingAvoidanceBOMScanManager setTimeStampLastBeepOnMoveScan:](self, "setTimeStampLastBeepOnMoveScan:", 0.0);
    if (qword_101934900 != -1) {
      dispatch_once(&qword_101934900, &stru_10182B388);
    }
    uint64_t v4 = (os_log_s *)qword_101934908;
    if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 2049;
      unint64_t v12 = (unint64_t)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM setting default value, timestampOfLastBeepOnMoveScanDate:%{private}lu}",  buf,  0x1Cu);
    }
  }

  return +[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v6);
}

- (void)setTimestampLastBOMDailyLimitResetDate:(double)a3
{
  double v6 = a3;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002AC7B8(v3, "TrackingAvoidanceLastBOMDailyLimitReset", &v6);
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 944LL))(v4);
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  v5 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2049;
    unint64_t v12 = (unint64_t)v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM setting last BOM daily limit reset timestamp, time:%{private}lu}",  buf,  0x1Cu);
  }

- (id)timestampOfLastBOMDailyLimitResetDate
{
  uint64_t v3 = sub_1002F8DDC();
  if ((sub_1002A82BC(v3, "TrackingAvoidanceLastBOMDailyLimitReset", &v6) & 1) == 0)
  {
    double v6 = 0.0;
    -[CLTrackingAvoidanceBOMScanManager setTimestampLastBOMDailyLimitResetDate:]( self,  "setTimestampLastBOMDailyLimitResetDate:",  0.0);
    if (qword_101934900 != -1) {
      dispatch_once(&qword_101934900, &stru_10182B388);
    }
    uint64_t v4 = (os_log_s *)qword_101934908;
    if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 2049;
      unint64_t v12 = (unint64_t)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM setting default value, lastBOMDailyLimitResetKey:%{private}lu}",  buf,  0x1Cu);
    }
  }

  return +[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v6);
}

- (void)setRemainingBOMScansTo:(unsigned int)a3
{
  unsigned int v6 = a3;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002ABC7C(v3, "TrackingAvoidanceRemainingBOMScans", &v6);
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 944LL))(v4);
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  v5 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    v10 = "";
    __int16 v11 = 2049;
    uint64_t v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM setting scans reaming, remainingBOMScans:%{private}lu}",  buf,  0x1Cu);
  }

- (unsigned)remainingBOMScans
{
  uint64_t v3 = sub_1002F8DDC();
  if ((sub_1002A775C(v3, "TrackingAvoidanceRemainingBOMScans", &v6) & 1) == 0)
  {
    -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:](self, "setRemainingBOMScansTo:", 5LL);
    unsigned int v6 = 5;
    if (qword_101934900 != -1) {
      dispatch_once(&qword_101934900, &stru_10182B388);
    }
    uint64_t v4 = (os_log_s *)qword_101934908;
    if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289283;
      int v8 = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 2049;
      uint64_t v12 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM setting default value, remainingBOMScans:%{private}lu}",  buf,  0x1Cu);
    }
  }

  return v6;
}

- (void)handleRegisterWithController:(id)a3
{
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  v5 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    int v8 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM register}",  (uint8_t *)v6,  0x12u);
  }

  -[CLTrackingAvoidanceBOMScanManager setController:](self, "setController:", a3);
  -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](self, "dispatchEnableBomScanAfterBackoff");
}

- (void)handleUnRegisterController
{
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  uint64_t v3 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    unsigned int v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM unregister}",  (uint8_t *)v4,  0x12u);
  }

  -[CLTrackingAvoidanceBOMScanManager setController:](self, "setController:", 0LL);
}

- (void)enableBOMScan
{
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  uint64_t v3 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    int v6 = 68289539;
    int v7 = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2049;
    uint64_t v11 = -[CLTrackingAvoidanceBOMScanManager remainingBOMScans](self, "remainingBOMScans");
    __int16 v12 = 2113;
    id v13 = -[CLTrackingAvoidanceBOMScanManager timestampOfLastBeepOnMoveScanDate]( self,  "timestampOfLastBeepOnMoveScanDate");
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM scans, count:%{private}lu, LastBOMScan:%{private, location:escape_only}@}",  (uint8_t *)&v6,  0x26u);
  }

  if (-[CLTrackingAvoidanceBOMScanManager remainingBOMScans](self, "remainingBOMScans")
    && -[CLTrackingAvoidanceBOMScanManager controller](self, "controller"))
  {
    unsigned int v4 = -[CLAvengerScannerClient performNotOptedInBOMScan](self->_controller, "performNotOptedInBOMScan");
    if (qword_101934900 != -1) {
      dispatch_once(&qword_101934900, &stru_10182B388);
    }
    __int16 v5 = (os_log_s *)qword_101934908;
    if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
    {
      int v6 = 68289283;
      int v7 = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      __int16 v10 = 2049;
      uint64_t v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM scan completed, completed:%{private}lu}",  (uint8_t *)&v6,  0x1Cu);
    }
  }

- (double)computeBOMScanBackoffOfDate:(id)a3
{
  double coolDownScan = self->_coolDownScan;
  BOOL v6 = v4 >= coolDownScan || v4 < 0.0;
  double result = coolDownScan - v4;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (void)dispatchEnableBomScanAfterBackoff
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(v3 * 1000000000.0));
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100212AF4;
  v6[3] = &unk_10182B328;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)scanCompleted
{
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  double v3 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    BOOL v6 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM scan completed }",  (uint8_t *)v4,  0x12u);
  }

  -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:]( self,  "setRemainingBOMScansTo:",  -[CLTrackingAvoidanceBOMScanManager remainingBOMScans](self, "remainingBOMScans") - 1);
  -[NSDate timeIntervalSinceDate:]( +[NSDate now](&OBJC_CLASS___NSDate, "now"),  "timeIntervalSinceDate:",  -[CLTrackingAvoidanceBOMScanManager timestampOfLastBeepOnMoveScanDate](self, "timestampOfLastBeepOnMoveScanDate"));
  -[CLTrackingAvoidanceBOMScanManager submitBOMMetricsScansCompleted:andTimeSinceLastDisable:]( self,  "submitBOMMetricsScansCompleted:andTimeSinceLastDisable:",  1LL);
  -[NSDate timeIntervalSince1970](+[NSDate now](&OBJC_CLASS___NSDate, "now"), "timeIntervalSince1970");
  -[CLTrackingAvoidanceBOMScanManager setTimeStampLastBeepOnMoveScan:](self, "setTimeStampLastBeepOnMoveScan:");
  -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](self, "dispatchEnableBomScanAfterBackoff");
}

- (void)submitBOMMetricsBoot
{
}

- (void)submitBOMMetricsScansCompleted:(unint64_t)a3 andTimeSinceLastDisable:(double)a4
{
  if (a4 > 86400.0 || a4 < 0.0) {
    double v6 = -1.0;
  }
  else {
    double v6 = a4;
  }
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  id v7 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289538;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    __int16 v13 = 2050;
    unint64_t v14 = (unint64_t)v6;
    __int16 v15 = 2050;
    unint64_t v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM metrics , timeSinceLastDisable:%{public}lu, scanCount:%{public}lu}",  buf,  0x26u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100212DC4;
  v8[3] = &unk_101827B10;
  v8[4] = a3;
  *(double *)&v8[5] = v6;
  AnalyticsSendEventLazy(@"com.apple.clx.ta.BOMScanning", v8);
}

- (void)resetBOMScanIfNeeded
{
  if (-[CLTrackingAvoidanceBOMScanManager checkDailyResetEligible:]( self,  "checkDailyResetEligible:",  +[NSDate now](&OBJC_CLASS___NSDate, "now")))
  {
    if (qword_101934900 != -1) {
      dispatch_once(&qword_101934900, &stru_10182B388);
    }
    double v3 = (os_log_s *)qword_101934908;
    if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      double v6 = "";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM reset }",  (uint8_t *)v4,  0x12u);
    }

    -[CLTrackingAvoidanceBOMScanManager setRemainingBOMScansTo:]( self,  "setRemainingBOMScansTo:",  self->_dailyStartingValue);
    -[NSDate timeIntervalSince1970](+[NSDate now](&OBJC_CLASS___NSDate, "now"), "timeIntervalSince1970");
    -[CLTrackingAvoidanceBOMScanManager setTimestampLastBOMDailyLimitResetDate:]( self,  "setTimestampLastBOMDailyLimitResetDate:");
    -[CLTrackingAvoidanceBOMScanManager dispatchEnableBomScanAfterBackoff](self, "dispatchEnableBomScanAfterBackoff");
  }

- (BOOL)checkDailyResetEligible:(id)a3
{
  double v4 = v3;
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  __int16 v5 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2050;
    unint64_t v11 = (unint64_t)v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM checking daily reset , timeSinceLastDailyReset:%{public}lu}",  (uint8_t *)v7,  0x1Cu);
  }

  return v4 < -86400.0 || v4 > 86400.0;
}

- (void)scheduleDailyResetBOMScan
{
  if (qword_101934900 != -1) {
    dispatch_once(&qword_101934900, &stru_10182B388);
  }
  double v3 = (os_log_s *)qword_101934908;
  if (os_log_type_enabled((os_log_t)qword_101934908, OS_LOG_TYPE_INFO))
  {
    id buf = (id)68289282;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2050;
    uint64_t v12 = 3600LL;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#ut BOM schedule daily reset check, timeUntilNextReset:%{public}lu}",  (uint8_t *)&buf,  0x1Cu);
  }

  objc_initWeak(&buf, self);
  dispatch_time_t v4 = dispatch_time(0LL, 3600000000000LL);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100213224;
  block[3] = &unk_10182B328;
  objc_copyWeak(&v7, &buf);
  dispatch_after(v4, queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&buf);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (CLAvengerScannerClient)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  self->_controller = (CLAvengerScannerClient *)a3;
}

- (double)coolDownScan
{
  return self->_coolDownScan;
}

- (unsigned)dailyStartingValue
{
  return self->_dailyStartingValue;
}

@end