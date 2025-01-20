@interface CMStrideCalibrationStats
- (CMStrideCalibrationStats)init;
- (id).cxx_construct;
- (void)activityLoggerLogStrideCalEntry:(const CLStrideCalEntry *)a3;
- (void)awdLogDistance:(double)a3 status:(int)a4 description:(id)a5;
- (void)awdMotionFitnessStrideCalibration:(const CLStrideCalEntry *)a3;
- (void)endSessionMetrics:(double)a3;
- (void)loadLastAWDTimestamps;
- (void)setReadyForSubmission;
- (void)startSessionMetricsWithTime:(double)a3 session:(int)a4;
- (void)storeLastAWDTimestamps;
- (void)updateUserHeight:(int64_t)a3;
@end

@implementation CMStrideCalibrationStats

- (CMStrideCalibrationStats)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CMStrideCalibrationStats;
  v2 = -[CMStrideCalibrationStats init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CMStrideCalibrationStats startSessionMetricsWithTime:session:]( v2,  "startSessionMetricsWithTime:session:",  0LL,  0.0);
    -[CMStrideCalibrationStats loadLastAWDTimestamps](v3, "loadLastAWDTimestamps");
  }

  return v3;
}

- (void)startSessionMetricsWithTime:(double)a3 session:(int)a4
{
  __int128 v5 = v8[3];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceFailOther = v8[2];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceFailPedometer = v5;
  __int128 v6 = v8[5];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceInvalidGain = v8[4];
  *(_OWORD *)&self->fSessionMetrics.sumCalibrationDistanceInvalidLength = v6;
  __int128 v7 = v8[1];
  *(_OWORD *)&self->fSessionMetrics.session = v8[0];
  *(_OWORD *)&self->fSessionMetrics.endTime = v7;
}

- (void)endSessionMetrics:(double)a3
{
  p_fSessionMetrics = &self->fSessionMetrics;
  int session = self->fSessionMetrics.session;
  self->fSessionMetrics.double endTime = a3;
  if (session)
  {
    sub_101024DF8(buf, 0LL);
    sub_101026CBC((uint64_t)buf, 0, (uint64_t)&v54, self->fSessionMetrics.startTime, self->fSessionMetrics.endTime);
    double v6 = *(double *)&v55[4];
    self->fSessionMetrics.totalDistance = *(double *)&v55[4];
    double sumCalibrationDistanceFailGps = self->fSessionMetrics.sumCalibrationDistanceFailGps;
    double v8 = self->fSessionMetrics.sumCalibrationDistanceFailPedometer
       + self->fSessionMetrics.sumCalibrationDistanceInvalidLength
       + self->fSessionMetrics.sumCalibrationDistanceInvalidSpeed;
    self->fSessionMetrics.double sumCalibrationDistanceFailPedometer = v8;
    double sumCalibrationDistanceSuccess = self->fSessionMetrics.sumCalibrationDistanceSuccess;
    double sumCalibrationDistanceFailGradient = self->fSessionMetrics.sumCalibrationDistanceFailGradient;
    double v11 = v6 - sumCalibrationDistanceSuccess - sumCalibrationDistanceFailGps - v8 - sumCalibrationDistanceFailGradient;
    self->fSessionMetrics.double sumCalibrationDistanceFailOther = v11;
    v12 = (double *)operator new(0x28uLL);
    v13 = v12;
    double *v12 = sumCalibrationDistanceSuccess;
    v12[1] = v11;
    v12[2] = sumCalibrationDistanceFailGps;
    v12[3] = v8;
    uint64_t v14 = 1LL;
    v15 = v12;
    v12[4] = sumCalibrationDistanceFailGradient;
    do
    {
      if (sumCalibrationDistanceSuccess < v12[v14])
      {
        double sumCalibrationDistanceSuccess = v12[v14];
        v15 = &v12[v14];
      }

      ++v14;
    }

    while (v14 != 5);
    unint64_t v16 = (char *)v15 - (char *)v12;
    int v17 = p_fSessionMetrics->session;
    if (p_fSessionMetrics->session == 15) {
      goto LABEL_9;
    }
    if (v17 == 17)
    {
      uint64_t v19 = sub_100F5A080();
      sub_100F5C6C4(v19, v16 >> 3);
      goto LABEL_11;
    }

    if (v17 == 24)
    {
LABEL_9:
      uint64_t v18 = sub_100F5A080();
      sub_100F5C644(v18, v16 >> 3);
    }

- (void)setReadyForSubmission
{
  uint64_t v2 = sub_100F5A080();
  sub_100F5C8F0(v2);
}

- (void)awdLogDistance:(double)a3 status:(int)a4 description:(id)a5
{
  if (a4 > 7)
  {
    v9 = @"Other";
    uint64_t v8 = 40LL;
  }

  else
  {
    uint64_t v8 = 8LL * a4 + 32;
    v9 = *(&off_101849580 + a4);
  }

  *(double *)((char *)&self->super.isa + v8) = *(double *)((char *)&self->super.isa + v8) + a3;
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101849540);
  }
  v10 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      double v11 = "Fail";
    }
    else {
      double v11 = "Success";
    }
    *(_DWORD *)buf = 136315906;
    double v25 = v11;
    __int16 v26 = 2080;
    id v27 = -[__CFString UTF8String](v9, "UTF8String");
    __int16 v28 = 2080;
    id v29 = [a5 UTF8String];
    __int16 v30 = 2048;
    double v31 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "SessionMetrics,%s,%s,%s,DistanceFusion,%0.4f",  buf,  0x2Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101849540);
    }
    uint64_t v12 = qword_101934518;
    if (a4) {
      v13 = "Fail";
    }
    else {
      v13 = "Success";
    }
    int v16 = 136315906;
    int v17 = v13;
    __int16 v18 = 2080;
    id v19 = -[__CFString UTF8String](v9, "UTF8String");
    __int16 v20 = 2080;
    id v21 = [a5 UTF8String];
    __int16 v22 = 2048;
    double v23 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  2LL,  "SessionMetrics,%s,%s,%s,DistanceFusion,%0.4f",  (const char *)&v16,  42);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrationStats awdLogDistance:status:description:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

- (void)activityLoggerLogStrideCalEntry:(const CLStrideCalEntry *)a3
{
  v4 = objc_autoreleasePoolPush();
  __int128 v5 = objc_alloc_init(&OBJC_CLASS___ALActivityLog);
  -[ALActivityLog setTimestamp:](v5, "setTimestamp:", a3->startTime);
  -[ALActivityLog setStrideCalData:]( v5,  "setStrideCalData:",  objc_alloc_init(&OBJC_CLASS___ALCLStrideCalEntry));
  -[ALCLStrideCalEntry setRecordId:]( -[ALActivityLog strideCalData](v5, "strideCalData"),  "setRecordId:",  a3->recordId);
  -[ALCLStrideCalEntry setStartTime:]( -[ALActivityLog strideCalData](v5, "strideCalData"),  "setStartTime:",  a3->startTime);
  -[ALCLStrideCalEntry setPacebin:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setPacebin:", a3->pacebin);
  float kvalue = a3->kvalue;
  __int128 v7 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&double v8 = kvalue;
  -[ALCLStrideCalEntry setKvalue:](v7, "setKvalue:", v8);
  float kvalueTrack = a3->kvalueTrack;
  v10 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&double v11 = kvalueTrack;
  -[ALCLStrideCalEntry setKvalueTrack:](v10, "setKvalueTrack:", v11);
  float score = a3->score;
  v13 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&double v14 = score;
  -[ALCLStrideCalEntry setScore:](v13, "setScore:", v14);
  -[ALCLStrideCalEntry setEndTime:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setEndTime:", a3->endTime);
  float distance = a3->distance;
  int v16 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&double v17 = distance;
  -[ALCLStrideCalEntry setDistance:](v16, "setDistance:", v17);
  -[ALCLStrideCalEntry setSteps:]( -[ALActivityLog strideCalData](v5, "strideCalData"),  "setSteps:",  a3->steps);
  -[ALCLStrideCalEntry setSession:]( -[ALActivityLog strideCalData](v5, "strideCalData"),  "setSession:",  a3->session);
  float speed = a3->speed;
  id v19 = -[ALActivityLog strideCalData](v5, "strideCalData");
  *(float *)&double v20 = speed;
  -[ALCLStrideCalEntry setSpeed:](v19, "setSpeed:", v20);
  -[ALCLStrideCalEntry setRegularEntry:](-[ALActivityLog strideCalData](v5, "strideCalData"), "setRegularEntry:", 1LL);
  objc_msgSend( -[CLServiceVendor proxyForService:]( +[CLServiceVendor sharedInstance](CLServiceVendor, "sharedInstance"),  "proxyForService:",  @"CLActivityLogger"),  "logData:",  v5);
  objc_autoreleasePoolPop(v4);
}

- (void)awdMotionFitnessStrideCalibration:(const CLStrideCalEntry *)a3
{
  uint32_t v5 = arc4random_uniform(0xAu);
  uint32_t v6 = arc4random_uniform(0xAu);
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101849540);
  }
  __int128 v7 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    double startTime = a3->startTime;
    *(_DWORD *)buf = 134218752;
    double v38 = startTime;
    __int16 v39 = 1024;
    *(_DWORD *)double v40 = v5;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v6;
    LOWORD(v41) = 1024;
    *(_DWORD *)((char *)&v41 + 2) = v5 == v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Trying to send track with startTime %f. a %u b %u a == b %d",  buf,  0x1Eu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101849540);
    }
    double v20 = a3->startTime;
    int v30 = 134218752;
    double v31 = v20;
    __int16 v32 = 1024;
    *(_DWORD *)v33 = v5;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v6;
    LOWORD(v34) = 1024;
    *(_DWORD *)((char *)&v34 + 2) = v5 == v6;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Trying to send track with startTime %f. a %u b %u a == b %d",  COERCE_DOUBLE(&v30),  30);
    __int16 v22 = (uint8_t *)v21;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]", "%s\n", v21);
    if (v22 != buf) {
      free(v22);
    }
  }

  if (v5 == v6)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101849540);
    }
    v10 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      double v11 = a3->startTime;
      uint64_t v12 = *(void *)sub_1006B4618(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 1uLL);
      uint64_t v13 = *(void *)sub_1006B4618(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 0LL);
      *(_DWORD *)buf = 134218752;
      double v38 = v11;
      __int16 v39 = 2048;
      *(double *)double v40 = Current;
      *(_WORD *)&v40[8] = 2048;
      uint64_t v41 = v12;
      __int16 v42 = 2048;
      uint64_t v43 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Trying to send track with startTime %f. now %f 2 %f 1 %f",  buf,  0x2Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101849540);
      }
      uint64_t v23 = qword_101934518;
      double v24 = a3->startTime;
      uint64_t v25 = *(void *)sub_1006B4618(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 1uLL);
      uint64_t v26 = *(void *)sub_1006B4618(&self->fLastAWDTimestamps.fHeadAndSize.fHead, 0LL);
      int v30 = 134218752;
      double v31 = v24;
      __int16 v32 = 2048;
      *(double *)v33 = Current;
      *(_WORD *)&v33[8] = 2048;
      uint64_t v34 = v25;
      __int16 v35 = 2048;
      uint64_t v36 = v26;
      LODWORD(v29) = 42;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  2LL,  "Trying to send track with startTime %f. now %f 2 %f 1 %f",  COERCE_DOUBLE(&v30),  v29);
      __int16 v28 = (uint8_t *)v27;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalibrationStats awdMotionFitnessStrideCalibration:]",  "%s\n",  v27);
      if (v28 != buf) {
        free(v28);
      }
    }

    uint64_t fHead = self->fLastAWDTimestamps.fHeadAndSize.fHead;
    if (Current - *(double *)&self->fLastAWDTimestamps.fBuffer[8 * fHead] > 86400.0)
    {
      uint64_t fSize = self->fLastAWDTimestamps.fHeadAndSize.fSize;
      unint64_t fCapacity = self->fLastAWDTimestamps.fCapacity;
      if (fSize + fHead >= fCapacity) {
        uint64_t v17 = self->fLastAWDTimestamps.fCapacity;
      }
      else {
        uint64_t v17 = 0LL;
      }
      *(double *)&self->fLastAWDTimestamps.fBuffer[8 * (fSize + fHead - v17)] = Current;
      if (fCapacity <= fSize)
      {
        unint64_t v18 = fHead + 1;
        if (v18 >= fCapacity) {
          __int16 v19 = fCapacity;
        }
        else {
          __int16 v19 = 0;
        }
        self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = v18 - v19;
      }

      else
      {
        self->fLastAWDTimestamps.fHeadAndSize.uint64_t fSize = fSize + 1;
      }

      -[CMStrideCalibrationStats storeLastAWDTimestamps](self, "storeLastAWDTimestamps");
    }
  }

- (void)loadLastAWDTimestamps
{
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A82BC(v3, "StrideCalAWD0", &v17);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A82BC(v4, "StrideCalAWD1", &v16);
  uint64_t fSize = self->fLastAWDTimestamps.fHeadAndSize.fSize;
  unint64_t fCapacity = self->fLastAWDTimestamps.fCapacity;
  fBuffer = self->fLastAWDTimestamps.fBuffer;
  uint64_t fHead = self->fLastAWDTimestamps.fHeadAndSize.fHead;
  if (fHead + fSize >= fCapacity) {
    uint64_t v9 = self->fLastAWDTimestamps.fCapacity;
  }
  else {
    uint64_t v9 = 0LL;
  }
  *(void *)&fBuffer[8 * (fHead + fSize - v9)] = v17;
  if (fCapacity <= fSize)
  {
    unint64_t v12 = fHead + 1;
    if (v12 >= fCapacity) {
      __int16 v13 = fCapacity;
    }
    else {
      __int16 v13 = 0;
    }
    LOWORD(fHead) = v12 - v13;
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = fHead;
    uint64_t fHead = (unsigned __int16)fHead;
    unsigned int v11 = fSize;
    __int16 v10 = fSize;
  }

  else
  {
    __int16 v10 = fSize + 1;
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fSize = fSize + 1;
    unsigned int v11 = (unsigned __int16)(fSize + 1);
    uint64_t fSize = (unsigned __int16)(fSize + 1);
  }

  unint64_t v14 = fHead + fSize;
  if (v14 >= fCapacity) {
    unint64_t v15 = fCapacity;
  }
  else {
    unint64_t v15 = 0LL;
  }
  *(void *)&fBuffer[8 * (v14 - v15)] = v16;
  if (fCapacity <= v11)
  {
    if (fHead + 1 < fCapacity) {
      LOWORD(fCapacity) = 0;
    }
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = fHead + 1 - fCapacity;
  }

  else
  {
    self->fLastAWDTimestamps.fHeadAndSize.uint64_t fSize = v10 + 1;
  }

- (void)storeLastAWDTimestamps
{
  uint64_t v3 = sub_1002F8DDC();
  self = (CMStrideCalibrationStats *)((char *)self + 112);
  uint64_t v4 = (const void *)sub_1006B4618((unsigned __int16 *)self, 0LL);
  sub_1002AC7B8(v3, "StrideCalAWD0", v4);
  uint64_t v5 = sub_1002F8DDC();
  uint32_t v6 = (const void *)sub_1006B4618((unsigned __int16 *)self, 1uLL);
  sub_1002AC7B8(v5, "StrideCalAWD1", v6);
}

- (void)updateUserHeight:(int64_t)a3
{
  self->fHeightCM = a3;
}

- (id).cxx_construct
{
  *(void *)&self->fLastAWDTimestamps.fHeadAndSize.uint64_t fHead = 0x200000000LL;
  return self;
}

@end