@interface CMPedometerTableStepCadenceToStrideLength
+ (id)sharedInstance;
- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForStepCadence:(double)a3;
- (BOOL)isBinaryLogging;
- (BOOL)isCalibrationAvailableForStepCadence:(double)a3;
- (BOOL)isRunCalibrationAvailable;
- (BOOL)isStepCadenceValid:(double)a3;
- (BOOL)isWalkCalibrationAvailable;
- (CMPedometerTableStepCadenceToStrideLength)initWithTestMode:(BOOL)a3;
- (double)strideLengthForStepCadence:(double)a3;
- (void)binsDidChange;
- (void)logBins;
- (void)setUserHeight:(float)a3;
- (void)updateBinsWithTrack:(id)a3;
- (void)updateStrideLengthRun;
- (void)updateStrideLengthStepCadenceWalk;
@end

@implementation CMPedometerTableStepCadenceToStrideLength

- (BOOL)isBinaryLogging
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_10199F568);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_10199F568))
  {
    unsigned __int8 v4 = 0;
    sub_1012049AC((unsigned __int8 *)&unk_10199F560, "LogBinaryPedometerCalibrationTables", &v4, 0);
    __cxa_guard_release(&qword_10199F568);
  }

  return byte_10199F561;
}

+ (id)sharedInstance
{
  if (qword_10199F578 != -1) {
    dispatch_once(&qword_10199F578, &stru_10188CE50);
  }
  return (id)qword_10199F570;
}

- (CMPedometerTableStepCadenceToStrideLength)initWithTestMode:(BOOL)a3
{
  BOOL v3 = a3;
  v11 = 0LL;
  v12 = 0LL;
  uint64_t v13 = 0LL;
  sub_100007590( &v11,  (const void *)qword_10199F530,  *(uint64_t *)algn_10199F538,  (*(void *)algn_10199F538 - qword_10199F530) >> 3);
  __p = 0LL;
  v9 = 0LL;
  uint64_t v10 = 0LL;
  sub_100007590(&__p, (const void *)qword_10199F548, qword_10199F550, (qword_10199F550 - qword_10199F548) >> 3);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CMPedometerTableStepCadenceToStrideLength;
  v5 = -[CMPedometerTable initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:]( &v7,  "initWithTableName:valueInName:valueOutName:defaultValue:binBoundariesWalk:binBoundariesRun:testMode:",  @"StepCadenceToStrideLengthTable",  @"StepCadence",  @"StrideLength",  &v11,  &__p,  v3,  0.705500007);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }

  if (v11)
  {
    v12 = v11;
    operator delete(v11);
  }

  if (v5)
  {
    self->_userHeight = 1.7;
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun](self, "updateStrideLengthRun");
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk]( self,  "updateStrideLengthStepCadenceWalk");
  }

  return self;
}

- (void)logBins
{
  id v3 = objc_msgSend( -[CMPedometerTable description](self, "description"),  "componentsSeparatedByCharactersInSet:",  +[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  id v4 = -[CMPedometerTable copyBins](self, "copyBins");
  if ([v4 count])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100F21898;
    v5[3] = &unk_101879C98;
    v5[4] = v3;
    v5[5] = self;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)binsDidChange
{
  if (!-[CMPedometerTable testMode](self, "testMode"))
  {
    objc_msgSend( objc_msgSend(objc_msgSend((id)sub_1006E2838(), "vendor"), "proxyForService:", @"CLMotionSyncStore"),  "doAsync:",  &stru_10188CE70);
    uint64_t v3 = sub_1008FA854(0);
    (*(void (**)(uint64_t, CLStrideLengthStepCadencePair *))(*(void *)(v3 + 56) + 40LL))( v3 + 56,  &self->_strideLengthStepCadencePairWalk);
  }

- (void)updateBinsWithTrack:(id)a3
{
  double v6 = v5;
  [a3 steps];
  double v8 = v6 / v7;
  [a3 steps];
  double v10 = v9;
  objc_msgSend(objc_msgSend(a3, "stop"), "timeIntervalSinceReferenceDate");
  double v12 = v11;
  objc_msgSend(objc_msgSend(a3, "start"), "timeIntervalSinceReferenceDate");
  double v14 = v10 / (v12 - v13);
  [a3 distanceGps];
  double v16 = v15 / 400.0;
  if (v16 <= 1.0) {
    double v17 = v16 * 0.4;
  }
  else {
    double v17 = 0.4;
  }
  -[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:](self, "updateBinsWithValueOut:valueIn:alpha:", v8, v14, v17);
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10188CE90);
  }
  v18 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316674;
    id v37 = [@"StepCadenceToStrideLengthTable" UTF8String];
    __int16 v38 = 2080;
    id v39 = [@"StepCadence" UTF8String];
    __int16 v40 = 2048;
    double v41 = v14;
    __int16 v42 = 2080;
    id v43 = [@"StrideLength" UTF8String];
    __int16 v44 = 2048;
    double v45 = v8;
    __int16 v46 = 2048;
    double v47 = v17;
    __int16 v48 = 2080;
    id v49 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s",  buf,  0x48u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188CE90);
    }
    uint64_t v19 = qword_101934518;
    int v22 = 136316674;
    id v23 = [@"StepCadenceToStrideLengthTable" UTF8String];
    __int16 v24 = 2080;
    id v25 = [@"StepCadence" UTF8String];
    __int16 v26 = 2048;
    double v27 = v14;
    __int16 v28 = 2080;
    id v29 = [@"StrideLength" UTF8String];
    __int16 v30 = 2048;
    double v31 = v8;
    __int16 v32 = 2048;
    double v33 = v17;
    __int16 v34 = 2080;
    id v35 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  1LL,  "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,%s",  (const char *)&v22,  72);
    v21 = (uint8_t *)v20;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMPedometerTableStepCadenceToStrideLength updateBinsWithTrack:]",  "%s\n",  v20);
    if (v21 != buf) {
      free(v21);
    }
  }

  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:", v14)) {
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun](self, "updateStrideLengthRun");
  }
  else {
    -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk]( self,  "updateStrideLengthStepCadenceWalk");
  }
}

- (BOOL)isCalibrationAvailableForStepCadence:(double)a3
{
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:", a3)) {
    return -[CMPedometerTable isRunNativeValueOutAvailable](self, "isRunNativeValueOutAvailable");
  }
  else {
    return -[CMPedometerTable isWalkNativeValueOutAvailable](self, "isWalkNativeValueOutAvailable");
  }
}

- (BOOL)isWalkCalibrationAvailable
{
  return -[CMPedometerTable isWalkNativeValueOutAvailable](self, "isWalkNativeValueOutAvailable");
}

- (BOOL)isRunCalibrationAvailable
{
  return -[CMPedometerTable isRunNativeValueOutAvailable](self, "isRunNativeValueOutAvailable");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForStepCadence:(double)a3
{
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (double)strideLengthForStepCadence:(double)a3
{
  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:")) {
    return self->_strideLengthRun;
  }
  -[CMPedometerTable valueOutForValueIn:](self, "valueOutForValueIn:", a3);
  return result;
}

- (BOOL)isStepCadenceValid:(double)a3
{
  return -[CMPedometerTable isValueInValid:](self, "isValueInValid:", a3);
}

- (void)setUserHeight:(float)a3
{
  if (self->_userHeight != a3)
  {
    self->_userHeight = a3;
    id v15 = -[CMPedometerTable copyBins](self, "copyBins");
    id v4 = [v15 count];
    if (v4)
    {
      id v5 = v4;
      unint64_t v6 = 0LL;
      double v7 = v15;
      do
      {
        id v8 = [v7 objectAtIndexedSubscript:v6];
        if (![v8 state])
        {
          double v9 = (float)(self->_userHeight * flt_101365448[v6 < -[CMPedometerTable walkBinCount](self, "walkBinCount")]);
          id v10 = objc_alloc(&OBJC_CLASS___CMPedometerBin);
          [v8 begin];
          double v12 = v11;
          [v8 end];
          id v14 = objc_msgSend(v10, "initWithValueOut:begin:end:state:", objc_msgSend(v8, "state"), v9, v12, v13);
        }

        ++v6;
        double v7 = v15;
      }

      while (v5 != (id)v6);
      -[CMPedometerTable setBins:](self, "setBins:", v15);
      -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun](self, "updateStrideLengthRun");
      -[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk]( self,  "updateStrideLengthStepCadenceWalk");
    }
  }

- (void)updateStrideLengthRun
{
  id v3 = -[CMPedometerTable copyBins](self, "copyBins");
  id v4 = [v3 count];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = -[CMPedometerTable walkBinCount](self, "walkBinCount");
    unint64_t v7 = v6;
    int v8 = 0;
    double v9 = 0.0;
    do
    {
      id v10 = [v3 objectAtIndexedSubscript:v7];
      if ((uint64_t)[v10 state] >= 11)
      {
        [v10 valueOut];
        double v9 = v9 + v11;
        ++v8;
      }

      ++v7;
    }

    while (v5 != (id)v7);
    if (v8 <= 0) {
LABEL_9:
    }
      double v12 = (float)(self->_userHeight * 0.585);
    else {
      double v12 = v9 / (double)v8;
    }
    self->_double strideLengthRun = v12;
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188CE90);
    }
    double v13 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [@"StepCadenceToStrideLengthTable" UTF8String];
      id v15 = [@"StrideLength" UTF8String];
      double strideLengthRun = self->_strideLengthRun;
      *(_DWORD *)buf = 136315650;
      id v30 = v14;
      __int16 v31 = 2080;
      id v32 = v15;
      __int16 v33 = 2048;
      double v34 = strideLengthRun;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s,%sRun,%0.4f", buf, 0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10188CE90);
      }
      uint64_t v17 = qword_101934518;
      id v18 = [@"StepCadenceToStrideLengthTable" UTF8String];
      id v19 = [@"StrideLength" UTF8String];
      double v20 = self->_strideLengthRun;
      int v23 = 136315650;
      id v24 = v18;
      __int16 v25 = 2080;
      id v26 = v19;
      __int16 v27 = 2048;
      double v28 = v20;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v17,  2LL,  "%s,%sRun,%0.4f",  (const char *)&v23,  32);
      int v22 = (uint8_t *)v21;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMPedometerTableStepCadenceToStrideLength updateStrideLengthRun]",  "%s\n",  v21);
      if (v22 != buf) {
        free(v22);
      }
    }
  }
}

- (void)updateStrideLengthStepCadenceWalk
{
  id v3 = -[CMPedometerTable copyBins](self, "copyBins");
  if ([v3 count])
  {
    if (!-[CMPedometerTable walkBinCount](self, "walkBinCount")) {
      goto LABEL_11;
    }
    id v4 = 0LL;
    unint64_t v5 = 0LL;
    double v6 = 0.0;
    double v7 = 0.0;
    do
    {
      id v8 = [v3 objectAtIndexedSubscript:v5];
      if ((uint64_t)[v8 state] >= 11)
      {
        [v8 begin];
        if (v9 >= 1.16666663)
        {
          [v8 end];
          if (v10 <= 2.16666675 && (uint64_t)[v8 state] >= (uint64_t)v4)
          {
            [v8 valueOut];
            double v6 = v11;
            [v8 center];
            double v7 = v12;
            id v4 = [v8 state];
          }
        }
      }

      ++v5;
    }

    while (v5 < -[CMPedometerTable walkBinCount](self, "walkBinCount"));
    if (!v4)
    {
LABEL_11:
      double v6 = (float)(self->_userHeight * 0.415);
      double v7 = 1.83333337;
    }

    float v13 = v6;
    p_strideLengthStepCadencePairWalk = &self->_strideLengthStepCadencePairWalk;
    float v15 = v7;
    self->_strideLengthStepCadencePairWalk.double strideLength = v13;
    self->_strideLengthStepCadencePairWalk.double stepCadence = v15;
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188CE90);
    }
    double v16 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [@"StepCadenceToStrideLengthTable" UTF8String];
      id v18 = [@"StrideLength" UTF8String];
      double strideLength = p_strideLengthStepCadencePairWalk->strideLength;
      id v20 = [@"StepCadence" UTF8String];
      double stepCadence = p_strideLengthStepCadencePairWalk->stepCadence;
      *(_DWORD *)buf = 136316162;
      id v41 = v17;
      __int16 v42 = 2080;
      id v43 = v18;
      __int16 v44 = 2048;
      double v45 = strideLength;
      __int16 v46 = 2080;
      id v47 = v20;
      __int16 v48 = 2048;
      double v49 = stepCadence;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s,%sWalk,%0.4f,%sWalk,%0.4f", buf, 0x34u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10188CE90);
      }
      uint64_t v22 = qword_101934518;
      id v23 = [@"StepCadenceToStrideLengthTable" UTF8String];
      id v24 = [@"StrideLength" UTF8String];
      double v25 = p_strideLengthStepCadencePairWalk->strideLength;
      id v26 = [@"StepCadence" UTF8String];
      double v27 = p_strideLengthStepCadencePairWalk->stepCadence;
      int v30 = 136316162;
      id v31 = v23;
      __int16 v32 = 2080;
      id v33 = v24;
      __int16 v34 = 2048;
      double v35 = v25;
      __int16 v36 = 2080;
      id v37 = v26;
      __int16 v38 = 2048;
      double v39 = v27;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v22,  2LL,  "%s,%sWalk,%0.4f,%sWalk,%0.4f",  (const char *)&v30,  52);
      id v29 = (uint8_t *)v28;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMPedometerTableStepCadenceToStrideLength updateStrideLengthStepCadenceWalk]",  "%s\n",  v28);
      if (v29 != buf) {
        free(v29);
      }
    }
  }
}

@end