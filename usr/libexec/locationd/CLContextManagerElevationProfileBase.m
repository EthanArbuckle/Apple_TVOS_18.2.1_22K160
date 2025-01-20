@interface CLContextManagerElevationProfileBase
+ (BOOL)isQueryValidWithStartTime:(double)a3 andEndTime:(double)a4;
- (BOOL)isElevationDbInMemory;
- (BOOL)isLocationUsefulForCalibration:(int)a3;
- (BOOL)registeredXPCTaskElevationProfile;
- (BOOL)registeredXPCTaskMSLP;
- (CLContextManagerElevationProfileBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLElevationProfileEstimator)elevationProfileEstimator;
- (void)dealloc;
- (void)elevationDb;
- (void)fetchElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(id)a5 andElevationArray:(id)a6;
- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8;
- (void)getHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5;
- (void)initElevationProfileEstimator:(id)a3 withElevationDbInMemory:(BOOL)a4;
- (void)pushElevationsFromTime:(double)a3 toTime:(double)a4;
- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7;
- (void)setElevationDb:(void *)a3;
- (void)setElevationProfileEstimator:(id)a3;
- (void)setIsElevationDbInMemory:(BOOL)a3;
- (void)setRegisteredXPCTaskElevationProfile:(BOOL)a3;
- (void)setRegisteredXPCTaskMSLP:(BOOL)a3;
@end

@implementation CLContextManagerElevationProfileBase

- (CLContextManagerElevationProfileBase)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLContextManagerElevationProfileBase;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v12,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  if (v6)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101887BB8);
    }
    v7 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Elevation Profile Context created", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101887BB8);
      }
      v11[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Elevation Profile Context created",  v11,  2);
      v10 = (uint8_t *)v9;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfileBase initWithUniverse:delegate:withBuffer:withSourceAggregator:]",  "%s\n",  v9);
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  return v6;
}

- (void)dealloc
{
  self->_elevationProfileEstimator = 0LL;
  elevationDb = self->_elevationDb;
  if (elevationDb) {
    (*(void (**)(void *))(*(void *)elevationDb + 24LL))(elevationDb);
  }
  self->_elevationDb = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLContextManagerElevationProfileBase;
  -[CLBarometerCalibrationContextManager dealloc](&v4, "dealloc");
}

- (void)initElevationProfileEstimator:(id)a3 withElevationDbInMemory:(BOOL)a4
{
  BOOL v4 = a4;
  self->_elevationProfileEstimator = -[CLElevationProfileEstimator initWithContextManager:]( objc_alloc(&OBJC_CLASS___CLElevationProfileEstimator),  "initWithContextManager:",  a3);
  self->_isElevationDbInMemory = v4;
  v6 = operator new(0x240uLL);
  sub_100CF4CD4(v6, v4);
  self->_elevationDb = v6;
}

- (void)getHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5
{
  elevationProfileEstimator = self->_elevationProfileEstimator;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100E444D0;
  v6[3] = &unk_101887B98;
  v6[4] = a5;
  -[CLElevationProfileEstimator computeHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:]( elevationProfileEstimator,  "computeHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:",  v6,  a3,  a4);
}

- (void)pushElevationsFromTime:(double)a3 toTime:(double)a4
{
}

- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7
{
}

- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8
{
  v9 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  CMErrorDomain,  103LL,  &off_1018D6B98);
  (*((void (**)(id, NSError *))a8 + 2))(a8, v9);
}

- (void)fetchElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(id)a5 andElevationArray:(id)a6
{
  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:]( &OBJC_CLASS___CLContextManagerElevationProfileBase,  "isQueryValidWithStartTime:andEndTime:"))
  {
    memset(__p, 0, 24);
    elevationDb = self->_elevationDb;
    if (elevationDb)
    {
      sub_100CF5370((uint64_t)elevationDb, 0, (int)[a5 intValue], __p, a3, a4);
      objc_super v12 = (double *)__p[0];
      for (i = (double *)__p[1]; v12 != i; v12 += 8)
      {
        double v14 = v12[4];
        double v15 = v12[6];
        v16 = objc_alloc_init(&OBJC_CLASS___CLElevationDBEntry);
        -[CLElevationDBEntry setTimestamp:](v16, "setTimestamp:", v14);
        -[CLElevationDBEntry setPressure:](v16, "setPressure:", v15);
        [a6 addObject:v16];
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101887BB8);
      }
      v17 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        *(void *)&double v30 = ((char *)__p[1] - (char *)__p[0]) >> 6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "received stored elevations,count,%{public}lu",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101887BB8);
      }
      int v26 = 134349056;
      int64_t v27 = ((char *)__p[1] - (char *)__p[0]) >> 6;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "received stored elevations,count,%{public}lu",  &v26,  12);
      v19 = (uint8_t *)v18;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]",  "%s\n",  v18);
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101887BB8);
      }
      v23 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "invalid elevationDb", buf, 2u);
      }

      if (!sub_1002921D0(115, 0)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101887BB8);
      }
      LOWORD(v26) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "invalid elevationDb",  &v26,  2);
      v19 = (uint8_t *)v24;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]",  "%s\n",  v24);
    }

    if (v19 != buf) {
      free(v19);
    }
LABEL_27:
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    return;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101887BB8);
  }
  v20 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    double v30 = a3;
    __int16 v31 = 2048;
    double v32 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "query stored elevations with false startTime,%f,endTime,%f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101887BB8);
    }
    LODWORD(__p[0]) = 134218240;
    *(void **)((char *)__p + 4) = *(void **)&a3;
    WORD2(__p[1]) = 2048;
    *(void **)((char *)&__p[1] + 6) = *(void **)&a4;
    LODWORD(v25) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "query stored elevations with false startTime,%f,endTime,%f",  COERCE_DOUBLE(__p),  v25);
    v22 = (uint8_t *)v21;
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLContextManagerElevationProfileBase fetchElevationsWithStartTime:andEndTime:andBatchSize:andElevationArray:]",  "%s\n",  v21);
    if (v22 != buf) {
      free(v22);
    }
  }

- (BOOL)isLocationUsefulForCalibration:(int)a3
{
  return (a3 < 0xC) & (0xC12u >> a3);
}

+ (BOOL)isQueryValidWithStartTime:(double)a3 andEndTime:(double)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL result = 0;
  BOOL v9 = a3 >= a4 || a4 == 1.79769313e308 || a3 == 1.79769313e308;
  if (!v9 && a3 > 0.0 && a4 > 0.0 && Current >= a3) {
    return Current + 29.72 >= a4;
  }
  return result;
}

- (BOOL)registeredXPCTaskMSLP
{
  return self->_registeredXPCTaskMSLP;
}

- (void)setRegisteredXPCTaskMSLP:(BOOL)a3
{
  self->_registeredXPCTaskMSLP = a3;
}

- (BOOL)registeredXPCTaskElevationProfile
{
  return self->_registeredXPCTaskElevationProfile;
}

- (void)setRegisteredXPCTaskElevationProfile:(BOOL)a3
{
  self->_registeredXPCTaskElevationProfile = a3;
}

- (CLElevationProfileEstimator)elevationProfileEstimator
{
  return self->_elevationProfileEstimator;
}

- (void)setElevationProfileEstimator:(id)a3
{
  self->_elevationProfileEstimator = (CLElevationProfileEstimator *)a3;
}

- (void)elevationDb
{
  return self->_elevationDb;
}

- (void)setElevationDb:(void *)a3
{
  self->_elevationDb = a3;
}

- (BOOL)isElevationDbInMemory
{
  return self->_isElevationDbInMemory;
}

- (void)setIsElevationDbInMemory:(BOOL)a3
{
  self->_isElevationDbInMemory = a3;
}

@end