@interface CMStrideCalibrationDatabase
- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3;
- (BOOL)isCalibrationConvergedStdForBinWithSpeed:(double)a3;
- (BOOL)queryStrideLengthTracks:(void *)a3;
- (CMStrideCalibrationDatabase)initWithSilo:(id)a3;
- (CMStrideCalibrationDatabaseDelegate)delegate;
- (id).cxx_construct;
- (id)copyHistory;
- (void)addEntry:(CLStrideCalEntry *)a3;
- (void)registerStrideCalDbForColdStorage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CMStrideCalibrationDatabase

- (CMStrideCalibrationDatabase)initWithSilo:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CMStrideCalibrationDatabase;
  v4 = -[CMStrideCalibrationDatabase init](&v13, "init");
  if (v4)
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101863F40);
    }
    v5 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "StrideCalDb init", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101863F40);
      }
      v12[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "StrideCalDb init",  v12,  2);
      v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrationDatabase initWithSilo:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    v6 = (CMStrideCalRecorderDb *)operator new(0x258uLL);
    sub_100DA3D94(v6, 0LL);
    value = v4->fStrideCalDb.__ptr_.__value_;
    v4->fStrideCalDb.__ptr_.__value_ = v6;
    if (value)
    {
      (*(void (**)(CMStrideCalRecorderDb *))(*(void *)value + 24LL))(value);
      v6 = v4->fStrideCalDb.__ptr_.__value_;
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1009A0828;
    v11[3] = &unk_101863F20;
    v11[4] = v4;
    sub_100DA4234((uint64_t)v6, a3, v11);
  }

  return v4;
}

- (void)addEntry:(CLStrideCalEntry *)a3
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101863F40);
  }
  v5 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    double startTime = a3->startTime;
    *(_DWORD *)buf = 134217984;
    double v13 = startTime;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "insertion startTime %f", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101863F40);
    }
    double v7 = a3->startTime;
    int v10 = 134217984;
    double v11 = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "insertion startTime %f",  COERCE_DOUBLE(&v10));
    v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrationDatabase addEntry:]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  sub_1009A0C44((uint64_t)self->fStrideCalDb.__ptr_.__value_, (uint64_t)a3);
}

- (BOOL)isCalibrationConvergedStdForBinWithSpeed:(double)a3
{
  v4 = sub_100DA5ECC((uint64_t)self->fStrideCalDb.__ptr_.__value_, a3);
  if (-[NSArray count](v4, "count") < 0xA) {
    return 0;
  }
  uint64_t v5 = 0LL;
  double v6 = 0.0;
  do
  {
    objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", v5), "getBytes:length:", v17, 120);
    double v6 = v6 + v18;
    ++v5;
  }

  while (v5 != 10);
  uint64_t v7 = 0LL;
  double v8 = 0.0;
  double v9 = v6 / 10.0;
  do
  {
    objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", v7), "getBytes:length:", v17, 120);
    double v8 = v8 + (v18 - v9) * (v18 - v9);
    ++v7;
  }

  while (v7 != 10);
  double v10 = v8 / 10.0;
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101863F40);
  }
  double v11 = (os_log_s *)qword_101934518;
  double v12 = sqrt(v10);
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    double v24 = a3;
    __int16 v25 = 2048;
    double v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Speed,%f,KFactorStd,%0.4f", buf, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101863F40);
    }
    int v19 = 134218240;
    double v20 = a3;
    __int16 v21 = 2048;
    double v22 = v12;
    LODWORD(v16) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Speed,%f,KFactorStd,%0.4f",  COERCE_DOUBLE(&v19),  v16);
    v15 = (uint8_t *)v14;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalibrationDatabase isCalibrationConvergedStdForBinWithSpeed:]",  "%s\n",  v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  return v12 < 0.025;
}

- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3
{
  uint64_t v20 = 0LL;
  memset(v19, 0, sizeof(v19));
  v4 = sub_100DA5ECC((uint64_t)self->fStrideCalDb.__ptr_.__value_, a3);
  v14 = off_10182B230;
  int v15 = 5;
  memset(v16, 0, sizeof(v16));
  v18[0] = 0LL;
  v18[1] = 0LL;
  v17 = v18;
  sub_100210444(&v14);
  if (-[NSArray count](v4, "count") < 5) {
    goto LABEL_11;
  }
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    objc_msgSend( -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i),  "getBytes:length:",  v19,  120);
    sub_1002104CC((uint64_t)&v14, (double *)&v19[1] + 1);
  }

  double v13 = 0.0;
  if (sub_100358478(&v14, 2, &v13))
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101863F40);
    }
    double v6 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v26 = a3;
      __int16 v27 = 2048;
      double v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Median kValue pacebin with rawSpeed %f: %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101863F40);
      }
      int v21 = 134218240;
      double v22 = a3;
      __int16 v23 = 2048;
      double v24 = v13;
      LODWORD(v12) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Median kValue pacebin with rawSpeed %f: %f",  COERCE_DOUBLE(&v21),  v12);
      double v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalibrationDatabase isCalibrationConvergedMedianForSpeed:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CMPedometerTableRawSpeedToKValue kValueForRawSpeed:]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "kValueForRawSpeed:",  a3);
    BOOL v8 = fabs((v7 - v13) / v13) < 0.05;
  }

  else
  {
LABEL_11:
    BOOL v8 = 0;
  }

  v14 = off_10182B230;
  sub_100008390((uint64_t)&v17, v18[0]);
  sub_100210578(v16);
  return v8;
}

- (id)copyHistory
{
  v17 = 0LL;
  double v18 = 0LL;
  uint64_t v19 = 0LL;
  (*(void (**)(CMStrideCalRecorderDb *, _BYTE **))(*(void *)self->fStrideCalDb.__ptr_.__value_ + 40LL))( self->fStrideCalDb.__ptr_.__value_,  &v17);
  v2 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  0xEEEEEEEEEEEEEEEFLL * ((v18 - v17) >> 3));
  v3 = v17;
  v4 = v18;
  if (v17 != v18)
  {
    do
    {
      id v5 = objc_alloc(&OBJC_CLASS___CMStrideCalibrationEntryInternal);
      __int128 v6 = *v3;
      __int128 v7 = v3[1];
      __int128 v8 = v3[3];
      v15[2] = v3[2];
      v15[3] = v8;
      v15[0] = v6;
      v15[1] = v7;
      __int128 v9 = v3[4];
      __int128 v10 = v3[5];
      __int128 v11 = v3[6];
      uint64_t v16 = *((void *)v3 + 14);
      v15[5] = v10;
      v15[6] = v11;
      v15[4] = v9;
      id v12 = [v5 initWithCLStrideCalEntry:v15];
      -[NSMutableArray addObject:](v2, "addObject:", v12);

      v3 = (_OWORD *)((char *)v3 + 120);
    }

    while (v3 != v4);
  }

  double v13 = -[NSArray initWithArray:](objc_alloc(&OBJC_CLASS___NSArray), "initWithArray:", v2);
  if (v17)
  {
    double v18 = v17;
    operator delete(v17);
  }

  return v13;
}

- (BOOL)queryStrideLengthTracks:(void *)a3
{
  return sub_100DA629C((uint64_t)self->fStrideCalDb.__ptr_.__value_, (void **)a3);
}

- (void)registerStrideCalDbForColdStorage:(id)a3
{
  if (a3)
  {
    value = self->fStrideCalDb.__ptr_.__value_;
    if (value)
    {
      id v5 = +[CLActivityRecorderUtils getDbDetails:]( &OBJC_CLASS___CLActivityRecorderUtils,  "getDbDetails:",  (char *)value + 72);
      objc_msgSend( a3,  "registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:",  objc_msgSend(v5, "objectForKeyedSubscript:", @"url"),  objc_msgSend(v5, "objectForKeyedSubscript:", @"name"),  0,  0,  0);
    }
  }

- (CMStrideCalibrationDatabaseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CMStrideCalibrationDatabaseDelegate *)a3;
}

- (void).cxx_destruct
{
  value = self->fStrideCalDb.__ptr_.__value_;
  self->fStrideCalDb.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CMStrideCalRecorderDb *))(*(void *)value + 24LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end