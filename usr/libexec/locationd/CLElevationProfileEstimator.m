@interface CLElevationProfileEstimator
- (BOOL)_forwardProcessingWithLocationArray:(id)a3 andElevationArray:(id)a4 andKFEstimatesBuffer:(id)a5 andKeepAllLocations:(BOOL)a6 andTaskType:(unint64_t)a7;
- (BOOL)_queryVisitStateByTimestamp:(double)a3 withHistoricalVisits:(id)a4 andVisitSearchStartIndex:(int)a5;
- (BOOL)_rejectOutlyingLocation:(id)a3 withKFEstimates:(id)a4;
- (CLContextManagerElevationProfile)elevationProfileContextManager;
- (CLElevationProfileEstimator)initWithContextManager:(id)a3;
- (double)_getTimestampWithElevationArray:(id)a3 atIndex:(unsigned int)a4;
- (double)_getTimestampWithLocationArray:(id)a3 atIndex:(unsigned int)a4;
- (int)_getLastPredictionIndexWithKFEstimatesBuffer:(id)a3 fromIndex:(int)a4;
- (void)_alignElevationArray:(id)a3 andLocationArray:(id)a4;
- (void)_backwardProcessingWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4;
- (void)_decimateElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andAggregatedLocationArray:(id)a7 andRawElevationArray:(id)a8;
- (void)_decimateLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andRawLocationArray:(id)a7 andRawElevationArray:(id)a8 andTaskType:(unint64_t)a9 andVisitArray:(id)a10 andVisitSearchStartIndex:(int)a11;
- (void)_elevationBatchProcessingWithStartTime:(double)a3 andEndTime:(double)a4 andLocationBuffer:(id)a5 andKSEstimatesBuffer:(id)a6 andTaskType:(unint64_t)a7 andCompletionBlock:(id)a8;
- (void)_gatherLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5 withStartTime:(double)a6 andEndTime:(double)a7 andVisitArray:(id)a8 andVisitSearchStartIndex:(int)a9 andCompletionBlock:(id)a10;
- (void)_initKalmanFilter:(id)a3 withLocationArray:(id)a4 andElevationArray:(id)a5 andTaskType:(unint64_t)a6;
- (void)_kalmanSmootherUpdateWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4 andCurrPredictionIndex:(int)a5 andNextPredictionIndex:(int)a6;
- (void)_logValuesOfFilteredLocations:(id)a3 andTaskType:(unint64_t)a4;
- (void)_logValuesOfLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5;
- (void)_measurementUpdate:(id)a3 withLocation:(id)a4;
- (void)_predictionUpdate:(id)a3 withElevation:(id)a4 withNextElevation:(id)a5 withTravelVelocity:(double)a6;
- (void)_removeInVisitLocation:(id)a3 withVisitArray:(id)a4 andVisitSearchStartIndex:(int)a5;
- (void)_sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:(id)a3 andCompletionBlock:(id)a4;
- (void)_setXPCCriteriaForActivity:(id)a3 withDescription:(id)a4;
- (void)computeElevationProfileWithStartTime:(double)a3 andEndTime:(double)a4;
- (void)computeHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5;
- (void)getTravelVelocity:(double *)a3 withCurrLocation:(id)a4 andNextLocation:(id)a5;
- (void)registerAndRunXPCActivity:(id)a3 withActivityIdentifier:(id)a4 andDescription:(id)a5;
- (void)sendAnalyticsEventWithXpcTaskWaitingTime:(double)a3;
- (void)setElevationProfileContextManager:(id)a3;
@end

@implementation CLElevationProfileEstimator

- (CLElevationProfileEstimator)initWithContextManager:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLElevationProfileEstimator;
  v4 = -[CLElevationProfileEstimator init](&v10, "init");
  if (v4)
  {
    sub_101204164(buf, "ElevationProfileMeanSeaLevelPressureSamplingPeriod", &qword_1012EE830, 0);
    v4->_meanSeaLevelPressureSamplingPeriod = v13;
    sub_101204164(buf, "ElevationProfileDataDecimationPeriod", &qword_1012EE838, 0);
    v4->_decimationPeriod = v13;
    sub_101204164(buf, "ElevationLocationFilterWindowSize", &qword_1012EE840, 0);
    v4->_windowSize = v13;
    v9[0] = 0;
    sub_1012049AC(buf, "ElevationVerbose", v9, 0);
    v4->_isVerboseLogging = buf[1];
    sub_101206C88(buf, "ElevationProfileElevationInitialVar", &dword_1012EE848, 0);
    v4->_elevationInitialVar = v12;
    sub_101206C88(buf, "ElevationProfileElevationProcessNoiseVar", &dword_1012EE84C, 0);
    v4->_elevationProcessNoiseVar = v12;
    sub_101206C88(buf, "ElevationProfileMeanSeaLevelPressureInitialVar", &dword_1012EE850, 0);
    v4->_meanSeaLevelPressureInitialVar = v12;
    sub_101206C88(buf, "ElevationProfileMeanSeaLevelPressureProcessNoiseVar", &dword_1012EE854, 0);
    v4->_meanSeaLevelPressureProcessNoiseVar = v12;
    *(_DWORD *)v9 = 1101004800;
    sub_101206C88(buf, "ElevationProfileLocationMaxVerticalAccuracy", v9, 0);
    v4->_locationMaxVerticalAccuracy = v12;
    sub_101204164(buf, "ElevationProfileMaxOutlierRatio", &qword_1012EE858, 0);
    v4->_maxOutlierRatio = v13;
    v4->_elevationBatchSize = vcvtad_u64_f64( (v4->_meanSeaLevelPressureSamplingPeriod + v4->_meanSeaLevelPressureSamplingPeriod)
                              / 2.56);
    sub_101206440(buf, "ElevationProfileLocationBatchSize", dword_1012EE860, 0);
    *(float *)&v4->_locationBatchSize = v12;
    v4->_refreshMslpXpcTaskScheduleTimestamp = 1.79769313e308;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___CLContextManagerElevationProfile);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
    {
      v4->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      v6 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "initWithContextManager,elevation profile context manager does not exist!",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183D2D0);
        }
        *(_WORD *)v9 = 0;
        v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "initWithContextManager,elevation profile context manager does not exist!",  v9,  2);
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLElevationProfileEstimator initWithContextManager:]", "%s\n", v8);
      }
    }
  }

  return v4;
}

- (void)_setXPCCriteriaForActivity:(id)a3 withDescription:(id)a4
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_GROUP_NAME, (const char *)[a4 UTF8String]);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1LL);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_set_criteria((xpc_activity_t)a3, v6);
  xpc_release(v6);
}

- (void)_sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:(id)a3 andCompletionBlock:(id)a4
{
  v127 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (![a3 count])
  {
    (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v127);

    return;
  }

  int v12 = [a3 count];
  uint64_t v13 = (v12 - 1);
  if (v12 - 1 < 0) {
    goto LABEL_49;
  }
  id v125 = a4;
  unint64_t v14 = 0LL;
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  uint64_t v126 = 134218752LL;
  do
  {
    id v16 = [a3 objectAtIndex:v13];
    if (self->_isVerboseLogging)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      v17 = (os_log_s *)p_vtable[213];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        [v16 timestamp];
        uint64_t v129 = v18;
        [v16 fState];
        double v130 = v8;
        double v128 = v19;
        [v16 fState];
        double v21 = v20;
        [v16 fCovariance];
        double v22 = v4;
        double v24 = v23;
        [v16 fCovariance];
        double v25 = v7;
        double v26 = v6;
        double v27 = v5;
        double v29 = v28;
        [v16 fCovariance];
        double v31 = v30;
        [v16 fCovariance];
        *(_DWORD *)buf = 134219520;
        uint64_t v147 = v129;
        __int16 v148 = 2048;
        double v149 = v128;
        __int16 v150 = 2048;
        double v151 = v21;
        __int16 v152 = 2048;
        double v153 = v24;
        double v4 = v22;
        double v8 = v130;
        __int16 v154 = 2048;
        double v155 = v29;
        double v5 = v27;
        double v6 = v26;
        double v7 = v25;
        __int16 v156 = 2048;
        double v157 = v31;
        __int16 v158 = 2048;
        double v159 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "historical mslp estimation,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f",  buf,  0x48u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        double v122 = v4;
        double v123 = v5;
        double v131 = v8;
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183D2D0);
        }
        v74 = p_vtable[213];
        [v16 timestamp];
        uint64_t v76 = v75;
        [v16 fState];
        double v78 = v77;
        [v16 fState];
        double v80 = v79;
        [v16 fCovariance];
        double v82 = v81;
        [v16 fCovariance];
        double v84 = v83;
        [v16 fCovariance];
        double v86 = v85;
        [v16 fCovariance];
        int v132 = 134219520;
        uint64_t v133 = v76;
        __int16 v134 = 2048;
        double v135 = v78;
        __int16 v136 = 2048;
        double v137 = v80;
        __int16 v138 = 2048;
        double v139 = v82;
        __int16 v140 = 2048;
        double v141 = v84;
        __int16 v142 = 2048;
        double v143 = v86;
        __int16 v144 = 2048;
        double v145 = v87;
        LODWORD(v119) = 72;
        v88 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v74,  2LL,  "historical mslp estimation,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f",  COERCE_DOUBLE(&v132),  v119,  v120,  v122,  v123,  *(double *)&v125,  *(double *)&v126);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]",  "%s\n",  v88);
        p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
        double v4 = v121;
        double v5 = v124;
        double v8 = v131;
      }
    }

    [v16 fCovariance];
    if (v33 < 0.0)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      v34 = (os_log_s *)p_vtable[213];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        [v16 timestamp];
        uint64_t v36 = v35;
        [v16 fState];
        double v38 = v37;
        [v16 fCovariance];
        *(_DWORD *)buf = 134218496;
        uint64_t v147 = v36;
        __int16 v148 = 2048;
        double v149 = v38;
        __int16 v150 = 2048;
        double v151 = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "warning: negative mslp variance,timestamp,%f,mslp,%f,var,%f",  buf,  0x20u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183D2D0);
        }
        uint64_t v40 = qword_1019346A8;
        [v16 timestamp];
        uint64_t v42 = v41;
        [v16 fState];
        double v44 = v43;
        [v16 fCovariance];
        int v132 = 134218496;
        uint64_t v133 = v42;
        __int16 v134 = 2048;
        double v135 = v44;
        __int16 v136 = 2048;
        double v137 = v45;
        LODWORD(v119) = 32;
        v46 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v40,  0LL,  "warning: negative mslp variance,timestamp,%f,mslp,%f,var,%f",  COERCE_DOUBLE(&v132),  v119,  v120);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]",  "%s\n",  v46);
      }

- (void)registerAndRunXPCActivity:(id)a3 withActivityIdentifier:(id)a4 andDescription:(id)a5
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1004E3208;
  handler[3] = &unk_10183D198;
  handler[4] = self;
  handler[5] = a5;
  handler[6] = a3;
  xpc_activity_register((const char *)[a4 UTF8String], XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)sendAnalyticsEventWithXpcTaskWaitingTime:(double)a3
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183D2D0);
  }
  double v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "sent refresh mslp xpc task waiting time to CoreAnalytics,waitingTime,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183D2D0);
    }
    int v7 = 134217984;
    double v8 = a3;
    double v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "sent refresh mslp xpc task waiting time to CoreAnalytics,waitingTime,%f",  COERCE_DOUBLE(&v7));
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator sendAnalyticsEventWithXpcTaskWaitingTime:]",  "%s\n",  v5);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1004E3720;
  v6[3] = &unk_101820718;
  *(double *)&v6[4] = a3;
  AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.RefreshMslpXpcTaskExecuteEvent", v6);
}

- (void)computeHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5
{
  self->_refreshMslpXpcTaskScheduleTimestamp = CFAbsoluteTimeGetCurrent();
  -[CLContextManagerElevationProfileBase setRegisteredXPCTaskMSLP:]( self->_elevationProfileContextManager,  "setRegisteredXPCTaskMSLP:",  1LL,  _NSConcreteStackBlock,  3221225472LL,  sub_1004E384C,  &unk_10183D1E8,  self,  a5,  *(void *)&a3,  *(void *)&a4);
  -[CLElevationProfileEstimator registerAndRunXPCActivity:withActivityIdentifier:andDescription:]( self,  "registerAndRunXPCActivity:withActivityIdentifier:andDescription:",  &v9,  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.altimeter.historicalmslp"),  @"mslp estimation");
}

- (BOOL)_queryVisitStateByTimestamp:(double)a3 withHistoricalVisits:(id)a4 andVisitSearchStartIndex:(int)a5
{
  if (a5 < 0) {
    return 0;
  }
  uint64_t v7 = a5;
  while (1)
  {
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "startTime");
    if (v8 <= a3)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "endTime");
      if (v9 >= a3) {
        break;
      }
    }

    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "startTime");
    if (v10 <= a3)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "endTime");
      if (v11 == 0.0) {
        break;
      }
    }

    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v7), "startTime");
    BOOL result = 0;
    if (v13 <= a3 && v7-- > 0) {
      continue;
    }
    return result;
  }

  return 1;
}

- (void)_gatherLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5 withStartTime:(double)a6 andEndTime:(double)a7 andVisitArray:(id)a8 andVisitSearchStartIndex:(int)a9 andCompletionBlock:(id)a10
{
  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:]( &OBJC_CLASS___CLContextManagerElevationProfileBase,  "isQueryValidWithStartTime:andEndTime:"))
  {
    if (self->_meanSeaLevelPressureSamplingPeriod + a6 >= a7) {
      double v16 = a7;
    }
    else {
      double v16 = self->_meanSeaLevelPressureSamplingPeriod + a6;
    }
    if ((a9 & 0x80000000) == 0)
    {
      objc_msgSend(objc_msgSend(a8, "objectAtIndexedSubscript:", a9), "endTime");
      if (v17 != 0.0) {
        objc_msgSend(objc_msgSend(a8, "objectAtIndexedSubscript:", a9), "endTime");
      }
    }

    objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[CLContextManagerElevationProfile fetchLocationsWithStartTime:andEndTime:andBatchSize:andLocationArray:andVisitSearchStartIndex:andCompletionBlock:]( self->_elevationProfileContextManager,  "fetchLocationsWithStartTime:andEndTime:andBatchSize:andLocationArray:andVisitSearchStartIndex:andCompletionBlock:",  self->_locationBatchSize,  a6,  v16);
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183D2D0);
    }
    uint64_t v18 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v26 = a6;
      __int16 v27 = 2048;
      double v28 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "query location and elevation with false startTime,%f,endTime,%f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      int v21 = 134218240;
      double v22 = a6;
      __int16 v23 = 2048;
      double v24 = a7;
      LODWORD(v20) = 22;
      float v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "query location and elevation with false startTime,%f,endTime,%f",  COERCE_DOUBLE(&v21),  v20);
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLElevationProfileEstimator _gatherLocationArray:andElevationArray:andTaskType:withStartTime:andEndTime:andVis itArray:andVisitSearchStartIndex:andCompletionBlock:]",  "%s\n",  v19);
    }

    (*((void (**)(id))a10 + 2))(a10);
  }

- (void)_removeInVisitLocation:(id)a3 withVisitArray:(id)a4 andVisitSearchStartIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = [a4 count];
  if ((v5 & 0x80000000) == 0 && v9)
  {
    double v11 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
    if ((int)[a3 count] >= 1)
    {
      uint64_t v10 = 0LL;
      do
      {
        objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "timestamp");
        if (-[CLElevationProfileEstimator _queryVisitStateByTimestamp:withHistoricalVisits:andVisitSearchStartIndex:]( self,  "_queryVisitStateByTimestamp:withHistoricalVisits:andVisitSearchStartIndex:",  a4,  v5))
        {
          -[NSMutableIndexSet addIndex:](v11, "addIndex:", v10);
        }

        ++v10;
      }

      while (v10 < (int)[a3 count]);
    }

    if (-[NSMutableIndexSet count](v11, "count")) {
      [a3 removeObjectsAtIndexes:v11];
    }
  }

- (void)_decimateLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andRawLocationArray:(id)a7 andRawElevationArray:(id)a8 andTaskType:(unint64_t)a9 andVisitArray:(id)a10 andVisitSearchStartIndex:(int)a11
{
  double v17 = v16;
  id v18 = a8;
  objc_msgSend(objc_msgSend(a8, "lastObject"), "timestamp");
  double v20 = v19;
  int v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int16 v23 = -[CLElevationLocationFilter initWithWindowSize:]( objc_alloc(&OBJC_CLASS___CLElevationLocationFilter),  "initWithWindowSize:",  self->_windowSize);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v24 = [a7 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(a7);
        }
        double v28 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        [v28 timestamp];
        if (v29 >= v17)
        {
          [v28 timestamp];
          if (v30 <= v20)
          {
            [v28 verticalAccuracy];
            if (v31 >= 0.0)
            {
              [v28 verticalAccuracy];
              if (v32 <= self->_locationMaxVerticalAccuracy)
              {
                -[CLElevationLocationFilter append:](v23, "append:", v28);
                if (-[CLElevationLocationFilter readyToFilter](v23, "readyToFilter"))
                {
                  -[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:]( v23,  "fetchFilteredLocations:withElevationArray:",  v22,  v18);
                  -[CLElevationProfileEstimator _removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:]( self,  "_removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:",  v22,  a10,  a11);
                  -[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:]( self,  "_logValuesOfFilteredLocations:andTaskType:",  v22,  a9);
                  -[CLElevationLocationFilter aggregateFilteredLocations:andAddTo:]( v23,  "aggregateFilteredLocations:andAddTo:",  v22,  v21);
                  -[NSMutableArray removeAllObjects](v22, "removeAllObjects");
                }
              }
            }
          }
        }
      }

      id v25 = [a7 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }

    while (v25);
  }

  -[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:]( v23,  "fetchFilteredLocations:withElevationArray:",  v22,  v18);
  -[CLElevationProfileEstimator _removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:]( self,  "_removeInVisitLocation:withVisitArray:andVisitSearchStartIndex:",  v22,  a10,  a11);
  -[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:]( self,  "_logValuesOfFilteredLocations:andTaskType:",  v22,  a9);
  -[CLElevationLocationFilter aggregateFilteredLocations:andAddTo:]( v23,  "aggregateFilteredLocations:andAddTo:",  v22,  v21);
  -[NSMutableArray removeAllObjects](v22, "removeAllObjects");
  -[CLElevationProfileEstimator _decimateElevationsWithStartTime:andEndTime:andLocationArray:andElevationArray:andAggregatedLocationArray:andRawElevationArray:]( self,  "_decimateElevationsWithStartTime:andEndTime:andLocationArray:andElevationArray:andAggregatedLocationArray:andRawElevationArray:",  a5,  a6,  v21,  v18,  a3,  a4);
}

- (void)_decimateElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andAggregatedLocationArray:(id)a7 andRawElevationArray:(id)a8
{
  if ([a7 count])
  {
    objc_msgSend(objc_msgSend(a7, "objectAtIndex:", 0), "timestamp");
    double v14 = v13;
  }

  else
  {
    double v14 = 1.79769313e308;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v15 = [a8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 0LL;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(a8);
        }
        double v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        [v20 timestamp];
        if (v21 >= a3)
        {
          [v20 timestamp];
          if (v22 <= a4)
          {
            while (1)
            {
              [v20 timestamp];
              if (v14 >= v23) {
                break;
              }
              objc_msgSend(objc_msgSend(a5, "lastObject"), "timestamp");
              if (v14 > v24)
              {
                objc_msgSend(objc_msgSend(a6, "lastObject"), "timestamp");
                if (v14 > v25)
                {
                  uint64_t v26 = objc_alloc_init(&OBJC_CLASS___CLElevationDBEntry);
                  id v27 = [a7 objectAtIndex:v17];
                  [v27 timestamp];
                  -[CLElevationDBEntry setTimestamp:](v26, "setTimestamp:");
                  [v27 interpPressure];
                  -[CLElevationDBEntry setPressure:](v26, "setPressure:");
                  [a5 addObject:v27];
                  [a6 addObject:v26];
                }
              }

              if (++v17 >= (unint64_t)[a7 count])
              {
                double v14 = 1.79769313e308;
              }

              else
              {
                objc_msgSend(objc_msgSend(a7, "objectAtIndex:", v17), "timestamp");
                double v14 = v28;
              }
            }

            [v20 timestamp];
            double v30 = v29;
            objc_msgSend(objc_msgSend(a6, "lastObject"), "timestamp");
            if (v30 - v31 > self->_decimationPeriod) {
              [a6 addObject:v20];
            }
          }
        }
      }

      id v16 = [a8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v16);
  }

- (void)_alignElevationArray:(id)a3 andLocationArray:(id)a4
{
  if ([a3 count] && objc_msgSend(a4, "count"))
  {
    objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp");
    double v7 = v6 + -0.000001;
    objc_msgSend(objc_msgSend(a3, "lastObject"), "timestamp");
    double v9 = v8 + 0.000001;
    objc_msgSend(objc_msgSend(a4, "firstObject"), "timestamp");
    if (v7 >= v10 || (objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp"), v11 >= v9))
    {
      int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v13 = [a4 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(a4);
            }
            uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
            [v17 timestamp];
            if (v18 > v7)
            {
              [v17 timestamp];
              if (v19 < v9) {
                -[NSMutableArray addObject:](v12, "addObject:", v17);
              }
            }
          }

          id v14 = [a4 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v14);
      }

      [a4 removeAllObjects];
      [a4 addObjectsFromArray:v12];
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183D2D0);
    }
    double v20 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v32 = [a3 count];
      __int16 v33 = 1024;
      unsigned int v34 = [a4 count];
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "zero elevation or location for kalman smoother,elevationCount,%d,locationCount,%d",  buf,  0xEu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      uint64_t v21 = qword_1019346A8;
      v28[0] = 67109376;
      v28[1] = [a3 count];
      __int16 v29 = 1024;
      unsigned int v30 = [a4 count];
      double v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v21,  0LL,  "zero elevation or location for kalman smoother,elevationCount,%d,locationCount,%d",  v28,  14);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _alignElevationArray:andLocationArray:]",  "%s\n",  v22);
    }
  }

- (void)_initKalmanFilter:(id)a3 withLocationArray:(id)a4 andElevationArray:(id)a5 andTaskType:(unint64_t)a6
{
  id v11 = [a4 firstObject];
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    double v15 = 1.79769313e308;
LABEL_3:
    id v16 = 0LL;
    double v17 = v15;
    while (1)
    {
      if (*(void *)v44 != v14) {
        objc_enumerationMutation(a5);
      }
      double v18 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v16);
      [v18 timestamp];
      double v20 = v19;
      [v11 timestamp];
      double v15 = vabdd_f64(v20, v21);
      if (v15 > v17) {
        break;
      }
      [v18 pressure];
      float v6 = v22;
      id v16 = (char *)v16 + 1;
      double v17 = v15;
      if (v13 == v16)
      {
        id v13 = [a5 countByEnumeratingWithState:&v43 objects:v59 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v11 elevation];
  *(float *)&double v23 = v23;
  float v24 = sub_100FAE05C(*(float *)&v23, v6);
  objc_msgSend(objc_msgSend(a5, "firstObject"), "pressure");
  *(float *)&double v25 = v25;
  float v26 = sub_100FADFE8(*(float *)&v25, v24);
  uint64_t v41 = 0LL;
  float elevationInitialVar = self->_elevationInitialVar;
  float meanSeaLevelPressureInitialVar = self->_meanSeaLevelPressureInitialVar;
  sub_1004E5B0C((uint64_t)&v38, (uint64_t)&elevationInitialVar);
  *(float *)&double v27 = v26;
  *(float *)&double v28 = v24;
  objc_msgSend(a3, "setFState:", v27, v28);
  double v36 = v38;
  int v37 = v39;
  [a3 setFP:&v36];
  *(float *)&double v29 = self->_elevationProcessNoiseVar;
  *(float *)&double v30 = self->_meanSeaLevelPressureProcessNoiseVar;
  objc_msgSend(a3, "setFQ:", v29, v30);
  LODWORD(v31) = 1.0;
  LODWORD(v32) = 0;
  objc_msgSend(a3, "setFH:", v31, v32);
  if (self->_isVerboseLogging)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183D2D0);
    }
    __int16 v33 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v54 = a6;
      __int16 v55 = 2048;
      double v56 = v26;
      __int16 v57 = 2048;
      double v58 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "initialize Kalman filter,taskType,%lu,elevation,%f,mslp,%f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      int v47 = 134218496;
      unint64_t v48 = a6;
      __int16 v49 = 2048;
      double v50 = v26;
      __int16 v51 = 2048;
      double v52 = v24;
      LODWORD(v35) = 32;
      unsigned int v34 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "initialize Kalman filter,taskType,%lu,elevation,%f,mslp,%f",  &v47,  v35,  v36);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _initKalmanFilter:withLocationArray:andElevationArray:andTaskType:]",  "%s\n",  v34);
    }
  }

- (double)_getTimestampWithLocationArray:(id)a3 atIndex:(unsigned int)a4
{
  return result;
}

- (double)_getTimestampWithElevationArray:(id)a3 atIndex:(unsigned int)a4
{
  return result;
}

- (void)_predictionUpdate:(id)a3 withElevation:(id)a4 withNextElevation:(id)a5 withTravelVelocity:(double)a6
{
  float v12 = v11;
  [a5 pressure];
  float v14 = v13;
  [a3 fState];
  float v16 = v15;
  if (a3)
  {
    [a3 fP];
  }

  else
  {
    int v53 = 0;
    double v52 = 0.0;
  }

  [a3 fQ];
  v51[0] = v17;
  [a5 timestamp];
  double v19 = v18;
  [a4 timestamp];
  double v21 = vabdd_f64(v19, v20);
  if (v12 == 0.0) {
    float v22 = 1.0;
  }
  else {
    float v22 = 101320.0 / v12;
  }
  float v23 = v21 * 100.0 / 3600.0 + v21 * 0.00200000009 * a6;
  float v24 = vabds_f32(v14, v12);
  float v25 = v24 * sub_100FAE134(v12);
  sub_100FAE09C(v12, v16);
  float v27 = v25 / v26;
  if (self->_isVerboseLogging)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183D2D0);
    }
    double v28 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      double v41 = v27;
      double v44 = v24;
      double v42 = sub_100FAE134(v12);
      sub_100FAE09C(v12, v16);
      *(_DWORD *)buf = 134219776;
      *(double *)&uint8_t buf[4] = v23;
      *(_WORD *)float v71 = 2048;
      *(double *)&v71[2] = v22;
      __int16 v72 = 2048;
      double v73 = v27;
      __int16 v74 = 2048;
      double v75 = v24;
      __int16 v76 = 2048;
      double v77 = a6;
      __int16 v78 = 2048;
      double v79 = v21;
      __int16 v80 = 2048;
      double v81 = v42;
      __int16 v82 = 2048;
      double v83 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "mslp uncertainty model,deltaMslpDue2TimeAndDistance,%f,pressure2MslpFactor,%f,estBaroModelUncReflectedInMslp,%f, deltaPressure,%f,travelVelocity,%f,timeDifference,%f,slopeDiffDElevationDPressure,%f,dHdMslp,%f",  buf,  0x52u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      double v48 = a6;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      uint64_t v33 = qword_1019346A8;
      *((float *)&v46 + 1) = v21 * 100.0 / 3600.0 + v21 * 0.00200000009 * a6;
      double v34 = v23;
      *(float *)&double v44 = v22;
      *(float *)&double v42 = v27;
      double v35 = v27;
      double v36 = v24;
      double v37 = sub_100FAE134(v12);
      sub_100FAE09C(v12, v16);
      int v54 = 134219776;
      double v55 = v34;
      __int16 v56 = 2048;
      double v57 = v22;
      __int16 v58 = 2048;
      double v59 = v35;
      __int16 v60 = 2048;
      double v61 = v36;
      __int16 v62 = 2048;
      double v63 = v48;
      __int16 v64 = 2048;
      double v65 = v21;
      __int16 v66 = 2048;
      double v67 = v37;
      __int16 v68 = 2048;
      double v69 = v38;
      LODWORD(v40) = 82;
      int v39 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v33,  2LL,  "mslp uncertainty model,deltaMslpDue2TimeAndDistance,%f,pressure2MslpFactor,%f,estBaroModelUncRefle ctedInMslp,%f,deltaPressure,%f,travelVelocity,%f,timeDifference,%f,slopeDiffDElevationDPressure,%f,dHdMslp,%f",  COERCE_DOUBLE(&v54),  v40,  v41,  v42,  v44,  v46,  v48,  v49);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _predictionUpdate:withElevation:withNextElevation:withTravelVelocity:]",  "%s\n",  v39);
      if (v39 != buf) {
        free(v39);
      }
      float v22 = v45;
      float v23 = v47;
      float v27 = v43;
    }
  }

  *(float *)&v51[1] = (float)(v27 + (float)(v22 * v23)) * (float)(v27 + (float)(v22 * v23));
  float v30 = sub_100FADFE8(v12, v16);
  [a3 fState];
  *(float *)&double v31 = v30;
  [a3 setFState:v31];
  sub_100FAE09C(v12, v16);
  *(void *)buf = 0LL;
  *(_DWORD *)&buf[8] = v32;
  *(_DWORD *)float v71 = 1065353216;
  objc_msgSend(a3, "setF01:");
  sub_1004E62B0((uint64_t)&v52, (uint64_t)buf, (uint64_t)v51);
  double v49 = v52;
  int v50 = v53;
  [a3 setFP:&v49];
}

- (void)_measurementUpdate:(id)a3 withLocation:(id)a4
{
  if (a3)
  {
    [a3 fP];
  }

  else
  {
    int v29 = 0;
    uint64_t v28 = 0LL;
  }

  [a3 fH];
  float v7 = v6;
  float v9 = v8;
  *(float *)float v27 = v6;
  *(float *)&v27[1] = v8;
  [a4 verticalAccuracy];
  double v11 = v10;
  [a4 verticalAccuracy];
  *(float *)&double v12 = v11 * v12;
  int v31 = LODWORD(v12);
  [a4 elevation];
  *(float *)&double v11 = v13;
  [a3 fState];
  float v30 = *(float *)&v11 - (float)((float)(v7 * v14) + (float)(v9 * v15));
  LODWORD(v16) = 2139095039;
  [a3 setF01:v16];
  sub_1004E6868((float *)&v28, (uint64_t)v27, (float *)&v31, &v30);
  float v18 = v17;
  float v20 = v19;
  uint64_t v25 = v28;
  int v26 = v29;
  [a3 setFP:&v25];
  [a3 fState];
  *(float *)&double v22 = v18 + v21;
  *(float *)&double v24 = v20 + v23;
  objc_msgSend(a3, "setFState:", v22, v24);
}

- (BOOL)_rejectOutlyingLocation:(id)a3 withKFEstimates:(id)a4
{
  double v6 = v5;
  [a3 elevation];
  double v8 = vabdd_f64(v6, v7);
  [a3 verticalAccuracy];
  return v8 > v9 * 5.0;
}

- (BOOL)_forwardProcessingWithLocationArray:(id)a3 andElevationArray:(id)a4 andKFEstimatesBuffer:(id)a5 andKeepAllLocations:(BOOL)a6 andTaskType:(unint64_t)a7
{
  double v88 = 0.0;
  double v11 = objc_alloc_init(&OBJC_CLASS___CLKFRunningEstimates);
  double v85 = *(double *)&a7;
  -[CLElevationProfileEstimator _initKalmanFilter:withLocationArray:andElevationArray:andTaskType:]( self,  "_initKalmanFilter:withLocationArray:andElevationArray:andTaskType:",  v11,  a3,  a4,  a7);
  HIDWORD(v83) = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  *(void *)&__int128 v14 = 134218752LL;
  __int128 v81 = v14;
  *(void *)&__int128 v14 = 134220032LL;
  __int128 v84 = v14;
LABEL_2:
  uint64_t v15 = v13;
  while ((unint64_t)[a3 count] > v15
       || (unint64_t)[a4 count] > v12)
  {
    -[CLElevationProfileEstimator _getTimestampWithLocationArray:atIndex:]( self,  "_getTimestampWithLocationArray:atIndex:",  a3,  v15);
    double v17 = v16;
    -[CLElevationProfileEstimator _getTimestampWithElevationArray:atIndex:]( self,  "_getTimestampWithElevationArray:atIndex:",  a4,  v12);
    double v19 = v18 + -0.000001;
    if (v17 >= v18 + -0.000001) {
      double v20 = v18;
    }
    else {
      double v20 = v17;
    }
    if (v17 >= v18 + -0.000001)
    {
      else {
        uint64_t v24 = (v12 + 1);
      }
      id v25 = [a4 objectAtIndex:v12];
      id v26 = [a4 objectAtIndex:v24];
      -[CLElevationProfileEstimator _predictionUpdate:withElevation:withNextElevation:withTravelVelocity:]( self,  "_predictionUpdate:withElevation:withNextElevation:withTravelVelocity:",  v11,  v25,  v26,  v88);
      uint64_t v12 = (v12 + 1);
    }

    else
    {
      uint64_t v13 = (v15 + 1);
      else {
        unint64_t v21 = (v15 + 1);
      }
      id v22 = [a3 objectAtIndex:v15];
      id v23 = [a3 objectAtIndex:v21];
      if (!a6
        && -[CLElevationProfileEstimator _rejectOutlyingLocation:withKFEstimates:]( self,  "_rejectOutlyingLocation:withKFEstimates:",  v22,  v11))
      {
        if (self->_isVerboseLogging)
        {
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183D2D0);
          }
          double v59 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
          {
            [v22 timestamp];
            uint64_t v61 = v60;
            [v22 elevation];
            uint64_t v63 = v62;
            [v22 verticalAccuracy];
            *(_DWORD *)buf = v81;
            *(double *)&uint8_t buf[4] = v85;
            __int16 v102 = 2048;
            *(void *)uint64_t v103 = v61;
            *(_WORD *)&v103[8] = 2048;
            *(void *)&v103[10] = v63;
            *(_WORD *)&v103[18] = 2048;
            *(void *)&v103[20] = v64;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEBUG,  "reject location outlier,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f",  buf,  0x2Au);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183D2D0);
            }
            uint64_t v65 = qword_1019346A8;
            [v22 timestamp];
            uint64_t v67 = v66;
            [v22 elevation];
            uint64_t v69 = v68;
            [v22 verticalAccuracy];
            int v89 = v81;
            double v90 = v85;
            __int16 v91 = 2048;
            *(void *)double v92 = v67;
            *(_WORD *)&v92[8] = 2048;
            *(void *)&v92[10] = v69;
            *(_WORD *)&v92[18] = 2048;
            *(void *)&v92[20] = v70;
            LODWORD(v80) = 42;
            float v71 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v65,  2LL,  "reject location outlier,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f",  &v89,  v80,  *(double *)&v81,  *((double *)&v81 + 1));
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:a ndKeepAllLocations:andTaskType:]",  "%s\n",  v71);
          }
        }

        ++HIDWORD(v83);
        goto LABEL_2;
      }

      else {
        -[CLElevationProfileEstimator getTravelVelocity:withCurrLocation:andNextLocation:]( self,  "getTravelVelocity:withCurrLocation:andNextLocation:",  &v88,  v22,  v23);
      }
      -[CLElevationProfileEstimator _measurementUpdate:withLocation:]( self,  "_measurementUpdate:withLocation:",  v11,  v22);
      uint64_t v15 = v13;
    }

    float v27 = objc_alloc_init(&OBJC_CLASS___CLKalmanFilterEstimates);
    -[CLKFRunningEstimates fState](v11, "fState");
    -[CLKalmanFilterEstimates setFState:](v27, "setFState:");
    if (v11) {
      -[CLKFRunningEstimates fP](v11, "fP");
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_1004EA88C((uint64_t)buf, 0LL, 0LL);
    -[CLKalmanFilterEstimates setFCovariance:](v27, "setFCovariance:");
    -[CLKalmanFilterEstimates setIsMeasurement:](v27, "setIsMeasurement:", v17 < v19);
    -[CLKalmanFilterEstimates setTimestamp:](v27, "setTimestamp:", v20);
    -[CLKFRunningEstimates F01](v11, "F01");
    -[CLKalmanFilterEstimates setF01:](v27, "setF01:");
    [a5 addObject:v27];
    if (self->_isVerboseLogging)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      uint64_t v28 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v29 = -[CLKalmanFilterEstimates isMeasurement](v27, "isMeasurement");
        -[CLKalmanFilterEstimates timestamp](v27, "timestamp");
        uint64_t v31 = v30;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        double v33 = v32;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        double v35 = v34;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        double v37 = v36;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        double v39 = v38;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        double v41 = v40;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        *(_DWORD *)buf = v84;
        *(double *)&uint8_t buf[4] = v85;
        __int16 v102 = 1024;
        *(_DWORD *)uint64_t v103 = v29;
        *(_WORD *)&v103[4] = 2048;
        *(void *)&v103[6] = v31;
        *(_WORD *)&v103[14] = 2048;
        *(double *)&v103[16] = v33;
        *(_WORD *)&v103[24] = 2048;
        *(double *)&v103[26] = v35;
        __int16 v104 = 2048;
        double v105 = v37;
        __int16 v106 = 2048;
        double v107 = v39;
        __int16 v108 = 2048;
        double v109 = v41;
        __int16 v110 = 2048;
        double v111 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "enumerate KF estimates,taskType,%lu,isMeasurement,%d,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f",  buf,  0x58u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183D2D0);
        }
        uint64_t v43 = qword_1019346A8;
        unsigned int v44 = -[CLKalmanFilterEstimates isMeasurement](v27, "isMeasurement");
        -[CLKalmanFilterEstimates timestamp](v27, "timestamp");
        uint64_t v46 = v45;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        double v48 = v47;
        -[CLKalmanFilterEstimates fState](v27, "fState");
        double v50 = v49;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        double v52 = v51;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        double v54 = v53;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        double v56 = v55;
        -[CLKalmanFilterEstimates fCovariance](v27, "fCovariance");
        int v89 = v84;
        double v90 = v85;
        __int16 v91 = 1024;
        *(_DWORD *)double v92 = v44;
        *(_WORD *)&v92[4] = 2048;
        *(void *)&v92[6] = v46;
        *(_WORD *)&v92[14] = 2048;
        *(double *)&v92[16] = v48;
        *(_WORD *)&v92[24] = 2048;
        *(double *)&v92[26] = v50;
        __int16 v93 = 2048;
        double v94 = v52;
        __int16 v95 = 2048;
        double v96 = v54;
        __int16 v97 = 2048;
        double v98 = v56;
        __int16 v99 = 2048;
        double v100 = v57;
        __int16 v58 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v43,  2LL,  "enumerate KF estimates,taskType,%lu,isMeasurement,%d,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P0 1,%f,P10,%f,P11,%f",  &v89,  88,  *(double *)&v81,  *((double *)&v81 + 1),  v82,  v83,  *(double *)&v84,  *((double *)&v84 + 1),  v85);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKe epAllLocations:andTaskType:]",  "%s\n",  v58);
      }
    }
  }

  double v72 = (double)HIDWORD(v83) / (double)(unint64_t)[a3 count];
  double maxOutlierRatio = self->_maxOutlierRatio;
  if (!a6)
  {
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_10183D2F0);
    }
    __int16 v74 = (os_log_s *)qword_1019345B8;
    if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
    {
      id v75 = [a3 count];
      *(_DWORD *)buf = 134219008;
      *(double *)&uint8_t buf[4] = v85;
      __int16 v102 = 2048;
      *(void *)uint64_t v103 = HIDWORD(v83);
      *(_WORD *)&v103[8] = 2048;
      *(void *)&v103[10] = v75;
      *(_WORD *)&v103[18] = 2048;
      *(double *)&v103[20] = v72;
      *(_WORD *)&v103[28] = 1024;
      *(_DWORD *)&v103[30] = v72 > maxOutlierRatio;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEBUG,  "outlier rejection summary,taskType,%lu,outlierCount,%lu,totalCount,%lu,outlierRatio,%f,isRepeatKF,%d",  buf,  0x30u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345B0 != -1) {
        dispatch_once(&qword_1019345B0, &stru_10183D2F0);
      }
      uint64_t v77 = qword_1019345B8;
      id v78 = [a3 count];
      int v89 = 134219008;
      double v90 = v85;
      __int16 v91 = 2048;
      *(void *)double v92 = HIDWORD(v83);
      *(_WORD *)&v92[8] = 2048;
      *(void *)&v92[10] = v78;
      *(_WORD *)&v92[18] = 2048;
      *(double *)&v92[20] = v72;
      *(_WORD *)&v92[28] = 1024;
      *(_DWORD *)&v92[30] = v72 > maxOutlierRatio;
      LODWORD(v80) = 48;
      double v79 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v77,  2LL,  "outlier rejection summary,taskType,%lu,outlierCount,%lu,totalCount,%lu,outlierRatio,%f,isRepeatKF,%d",  &v89,  *(void *)&v80,  (void)v81,  *((double *)&v81 + 1),  LODWORD(v82));
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeep AllLocations:andTaskType:]",  "%s\n",  v79);
    }
  }

  return v72 > maxOutlierRatio;
}

- (void)getTravelVelocity:(double *)a3 withCurrLocation:(id)a4 andNextLocation:(id)a5
{
  double v9 = v8;
  [a4 timestamp];
  double v11 = v9 - v10;
  double v12 = 0.0;
  if (v11 != 0.0)
  {
    objc_msgSend(a4, "latitude", 0.0);
    double v14 = v13;
    [a4 longitude];
    double v16 = v15;
    [a5 latitude];
    double v18 = v17;
    [a5 longitude];
    double v12 = fabs(fabs(sub_100D2EC74(v14, v16, v18, v19)) / v11);
  }

  *a3 = v12;
}

- (int)_getLastPredictionIndexWithKFEstimatesBuffer:(id)a3 fromIndex:(int)a4
{
  do
  {
    int v6 = a4;
    if (a4 < 1) {
      break;
    }
    --a4;
  }

  while ((objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (v6 - 1)), "isMeasurement") & 1) != 0);
  return v6 - 1;
}

- (void)_kalmanSmootherUpdateWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4 andCurrPredictionIndex:(int)a5 andNextPredictionIndex:(int)a6
{
  uint64_t v10 = a6 - 1;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v10), "fState");
  float v84 = v12;
  float v85 = v11;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v10), "fCovariance");
  float v95 = v13;
  float v96 = v14;
  float v97 = v15;
  float v98 = v16;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a6), "fState");
  float v82 = v18;
  float v83 = v17;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a6), "fCovariance");
  float v20 = v19;
  float v22 = v21;
  float v24 = v23;
  float v26 = v25;
  *(float *)__int16 v93 = v19;
  *(float *)&v93[1] = v21;
  *(float *)&v93[2] = v23;
  *(float *)&v93[3] = v25;
  v94[0] = 0;
  v94[2] = 0;
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a6), "F01");
  v94[1] = v27;
  v94[3] = 1065353216;
  objc_msgSend(objc_msgSend(a4, "lastObject"), "fState");
  float v29 = v28;
  float v31 = v30;
  objc_msgSend(objc_msgSend(a4, "lastObject"), "fCovariance");
  float v80 = v33;
  float v81 = v32;
  float v35 = v34;
  float v37 = v36;
  float v38 = sub_1004E7BF8((uint64_t)&v95, (uint64_t)v94);
  sub_1004E7CF0((uint64_t)v90, v38, v39, v40, v41);
  sub_1004E7CF0((uint64_t)v92, v20, v22, v24, v26);
  sub_1004E5B0C((uint64_t)v87, (uint64_t)v92);
  unint64_t v42 = 0LL;
  char v43 = 1;
  do
  {
    char v44 = v43;
    int v45 = *(_DWORD *)sub_1004E2E2C((uint64_t)v90, 0LL, v42);
    *(_DWORD *)sub_1004E2C54((uint64_t)v91, 0LL) = v45;
    int v46 = *(_DWORD *)sub_1004E2E2C((uint64_t)v90, 1uLL, v42);
    *(_DWORD *)sub_1004E2C54((uint64_t)v91, 1uLL) = v46;
    sub_1004E7DC4((uint64_t)v87, (uint64_t)v91);
    int v47 = *(_DWORD *)sub_1004E2C54((uint64_t)v91, 0LL);
    *(_DWORD *)sub_1004E2E2C((uint64_t)v88, 0LL, v42) = v47;
    int v48 = *(_DWORD *)sub_1004E2C54((uint64_t)v91, 1uLL);
    float v49 = (_DWORD *)sub_1004E2E2C((uint64_t)v88, 1uLL, v42);
    char v43 = 0;
    *float v49 = v48;
    unint64_t v42 = 1LL;
  }

  while ((v44 & 1) != 0);
  sub_1004E7CF0((uint64_t)v89, v88[0], v88[1], v88[2], v88[3]);
  double v50 = objc_alloc_init(&OBJC_CLASS___CLKalmanSmootherEstimates);
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", a5), "timestamp");
  -[CLKalmanSmootherEstimates setTimestamp:](v50, "setTimestamp:");
  *(float *)buf = v29 - v83;
  *(float *)&unint64_t v103 = v31 - v82;
  *(float *)&double v51 = v85 + sub_1004E8078((uint64_t)v89, (float *)buf);
  *(float *)&double v53 = v84 + v52;
  -[CLKalmanSmootherEstimates setFState:](v50, "setFState:", v51, v53);
  float v54 = v95;
  float v55 = v96;
  float v56 = v97;
  float v57 = v98;
  v86[0] = sub_1004E818C((uint64_t)v93, v81, v80, v35, v37);
  v86[1] = v58;
  v86[2] = v59;
  v86[3] = v60;
  float v99 = sub_1004E7BF8((uint64_t)v89, (uint64_t)v86);
  unint64_t v100 = __PAIR64__(v62, v61);
  v101[0] = v63;
  *(float *)buf = sub_1004E7BF8((uint64_t)&v99, (uint64_t)v88);
  unint64_t v103 = __PAIR64__(v65, v64);
  v104[0] = v66;
  *(float *)&double v67 = sub_1004E8124((uint64_t)buf, v54, v55, v56, v57);
  -[CLKalmanSmootherEstimates setFCovariance:](v50, "setFCovariance:", v67);
  if ([a4 count])
  {
    objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
    double v69 = v68;
    -[CLKalmanSmootherEstimates timestamp](v50, "timestamp");
    if (v69 < v70)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10183D2D0);
      }
      float v71 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
      {
        -[CLKalmanSmootherEstimates timestamp](v50, "timestamp");
        unint64_t v73 = v72;
        objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
        *(float *)buf = 3.9123e-34;
        unint64_t v103 = v73;
        LOWORD(v104[0]) = 2050;
        *(void *)((char *)v104 + 2) = v74;
        _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_INFO,  "Time order error in Kalman smoother estimate,currEntryTimestamp,%{public}f,prevEntryTimestamp,%{public}f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10183D2D0);
        }
        uint64_t v75 = qword_1019346A8;
        -[CLKalmanSmootherEstimates timestamp](v50, "timestamp");
        unint64_t v77 = v76;
        objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
        float v99 = 3.9123e-34;
        unint64_t v100 = v77;
        LOWORD(v101[0]) = 2050;
        *(void *)((char *)v101 + 2) = v78;
        double v79 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v75,  1LL,  "Time order error in Kalman smoother estimate,currEntryTimestamp,%{public}f,prevEntryTimestamp,%{public}f",  &v99,  22);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictio nIndex:andNextPredictionIndex:]",  "%s\n",  v79);
      }
    }
  }

  [a4 addObject:v50];
}

- (void)_backwardProcessingWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4
{
  id v7 = [a3 count];
  if ((_DWORD)v7)
  {
    double v8 = objc_alloc_init(&OBJC_CLASS___CLKalmanSmootherEstimates);
    id v9 = [a3 lastObject];
    [v9 timestamp];
    -[CLKalmanSmootherEstimates setTimestamp:](v8, "setTimestamp:");
    [v9 fState];
    -[CLKalmanSmootherEstimates setFState:](v8, "setFState:");
    [v9 fCovariance];
    -[CLKalmanSmootherEstimates setFCovariance:](v8, "setFCovariance:");
    [a4 addObject:v8];

    uint64_t v10 = -[CLElevationProfileEstimator _getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:]( self,  "_getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:",  a3,  v7);
    for (i = -[CLElevationProfileEstimator _getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:]( self,  "_getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:",  a3,  v10); (i & 0x80000000) == 0; uint64_t v10 = v12)
    {
      uint64_t v12 = i;
      -[CLElevationProfileEstimator _kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictionIndex:andNextPredictionIndex:]( self,  "_kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictionIndex:andNextPredictionIndex:",  a3,  a4,  i,  v10);
      uint64_t i = -[CLElevationProfileEstimator _getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:]( self,  "_getLastPredictionIndexWithKFEstimatesBuffer:fromIndex:",  a3,  v12);
    }

    [a3 removeAllObjects];
    id v13 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "reverseObjectEnumerator"), "allObjects"), "mutableCopy");
    [a4 removeAllObjects];
    [a4 addObjectsFromArray:v13];
  }

- (void)_elevationBatchProcessingWithStartTime:(double)a3 andEndTime:(double)a4 andLocationBuffer:(id)a5 andKSEstimatesBuffer:(id)a6 andTaskType:(unint64_t)a7 andCompletionBlock:(id)a8
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10183D2D0);
  }
  uint64_t v12 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v23 = a7;
    __int16 v24 = 2048;
    double v25 = a3;
    __int16 v26 = 2048;
    double v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "start elevation batch processing,taskType,%lu,startTime,%f,endTime,%f",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10183D2D0);
    }
    int v16 = 134218496;
    unint64_t v17 = a7;
    __int16 v18 = 2048;
    double v19 = a3;
    __int16 v20 = 2048;
    double v21 = a4;
    LODWORD(v14) = 32;
    id v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "start elevation batch processing,taskType,%lu,startTime,%f,endTime,%f",  &v16,  v14,  v15);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _elevationBatchProcessingWithStartTime:andEndTime:andLocationBuffer:andKSEstimatesBu ffer:andTaskType:andCompletionBlock:]",  "%s\n",  v13);
  }

  objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]( self->_elevationProfileContextManager,  "getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:",  a3,  a4);
}

- (void)computeElevationProfileWithStartTime:(double)a3 andEndTime:(double)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1004E8D04;
  v5[3] = &unk_10183D2B0;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  -[CLContextManagerElevationProfileBase setRegisteredXPCTaskElevationProfile:]( self->_elevationProfileContextManager,  "setRegisteredXPCTaskElevationProfile:",  1LL);
  -[CLElevationProfileEstimator registerAndRunXPCActivity:withActivityIdentifier:andDescription:]( self,  "registerAndRunXPCActivity:withActivityIdentifier:andDescription:",  v5,  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.altimeter.historicalelevation"),  @"elevation profile calculation");
}

- (void)_logValuesOfLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5
{
  if (self->_isVerboseLogging)
  {
    if ([a3 count])
    {
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      id v6 = [a3 countByEnumeratingWithState:&v50 objects:v71 count:16];
      if (v6)
      {
        id v8 = v6;
        uint64_t v9 = *(void *)v51;
        *(void *)&__int128 v7 = 134218752LL;
        __int128 v42 = v7;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v51 != v9) {
              objc_enumerationMutation(a3);
            }
            float v11 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v10);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183D2D0);
            }
            uint64_t v12 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
            {
              [v11 timestamp];
              uint64_t v14 = v13;
              [v11 elevation];
              uint64_t v16 = v15;
              [v11 verticalAccuracy];
              *(_DWORD *)buf = v42;
              unint64_t v64 = a5;
              __int16 v65 = 2048;
              uint64_t v66 = v14;
              __int16 v67 = 2048;
              uint64_t v68 = v16;
              __int16 v69 = 2048;
              uint64_t v70 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "enumerate locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f",  buf,  0x2Au);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183D2D0);
              }
              uint64_t v18 = qword_1019346A8;
              [v11 timestamp];
              uint64_t v20 = v19;
              [v11 elevation];
              uint64_t v22 = v21;
              [v11 verticalAccuracy];
              int v55 = v42;
              unint64_t v56 = a5;
              __int16 v57 = 2048;
              uint64_t v58 = v20;
              __int16 v59 = 2048;
              uint64_t v60 = v22;
              __int16 v61 = 2048;
              uint64_t v62 = v23;
              LODWORD(v41) = 42;
              __int16 v24 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  2LL,  "enumerate locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f",  &v55,  v41,  *(double *)&v42,  *((double *)&v42 + 1));
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _logValuesOfLocationArray:andElevationArray:andTaskType:]",  "%s\n",  v24);
            }

            uint64_t v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v25 = [a3 countByEnumeratingWithState:&v50 objects:v71 count:16];
          id v8 = v25;
        }

        while (v25);
      }
    }

    if ([a4 count])
    {
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      id v26 = [a4 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v47;
        uint64_t v43 = 134218496LL;
        do
        {
          float v29 = 0LL;
          do
          {
            if (*(void *)v47 != v28) {
              objc_enumerationMutation(a4);
            }
            float v30 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)v29);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183D2D0);
            }
            float v31 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
            {
              [v30 timestamp];
              uint64_t v33 = v32;
              [v30 pressure];
              *(_DWORD *)buf = v43;
              unint64_t v64 = a5;
              __int16 v65 = 2048;
              uint64_t v66 = v33;
              __int16 v67 = 2048;
              uint64_t v68 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "enumerate elevations,taskType,%lu,timestamp,%f,pressure,%f",  buf,  0x20u);
            }

            if (sub_1002921D0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_10183D2D0);
              }
              uint64_t v35 = qword_1019346A8;
              [v30 timestamp];
              uint64_t v37 = v36;
              [v30 pressure];
              int v55 = v43;
              unint64_t v56 = a5;
              __int16 v57 = 2048;
              uint64_t v58 = v37;
              __int16 v59 = 2048;
              uint64_t v60 = v38;
              LODWORD(v41) = 32;
              float v39 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v35,  2LL,  "enumerate elevations,taskType,%lu,timestamp,%f,pressure,%f",  &v55,  v41,  *(double *)&v43);
              sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _logValuesOfLocationArray:andElevationArray:andTaskType:]",  "%s\n",  v39);
            }

            float v29 = (char *)v29 + 1;
          }

          while (v27 != v29);
          id v40 = [a4 countByEnumeratingWithState:&v46 objects:v54 count:16];
          id v27 = v40;
        }

        while (v40);
      }
    }
  }

- (void)_logValuesOfFilteredLocations:(id)a3 andTaskType:(unint64_t)a4
{
  if (self->_isVerboseLogging)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v33 objects:v57 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v34;
      *(void *)&__int128 v6 = 134219008LL;
      __int128 v30 = v6;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v9);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_10183D2D0);
          }
          float v11 = (os_log_s *)qword_1019346A8;
          if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
          {
            [v10 timestamp];
            uint64_t v13 = v12;
            [v10 elevation];
            uint64_t v15 = v14;
            [v10 verticalAccuracy];
            uint64_t v17 = v16;
            [v10 interpPressure];
            *(_DWORD *)buf = v30;
            unint64_t v48 = a4;
            __int16 v49 = 2048;
            uint64_t v50 = v13;
            __int16 v51 = 2048;
            uint64_t v52 = v15;
            __int16 v53 = 2048;
            uint64_t v54 = v17;
            __int16 v55 = 2048;
            uint64_t v56 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "enumerate filtered locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f,interpPressure,%f",  buf,  0x34u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_10183D2D0);
            }
            uint64_t v19 = qword_1019346A8;
            [v10 timestamp];
            uint64_t v21 = v20;
            [v10 elevation];
            uint64_t v23 = v22;
            [v10 verticalAccuracy];
            uint64_t v25 = v24;
            [v10 interpPressure];
            int v37 = v30;
            unint64_t v38 = a4;
            __int16 v39 = 2048;
            uint64_t v40 = v21;
            __int16 v41 = 2048;
            uint64_t v42 = v23;
            __int16 v43 = 2048;
            uint64_t v44 = v25;
            __int16 v45 = 2048;
            uint64_t v46 = v26;
            LODWORD(v29) = 52;
            id v27 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  2LL,  "enumerate filtered locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f,interpPressure,%f",  &v37,  v29,  *(double *)&v30,  *((double *)&v30 + 1),  v31);
            sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:]",  "%s\n",  v27);
          }

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v28 = [a3 countByEnumeratingWithState:&v33 objects:v57 count:16];
        id v7 = v28;
      }

      while (v28);
    }
  }

- (CLContextManagerElevationProfile)elevationProfileContextManager
{
  return self->_elevationProfileContextManager;
}

- (void)setElevationProfileContextManager:(id)a3
{
  self->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
}

@end