@interface CLSubmersionStateMachine
- (CLSubmersionStateMachine)initWithType:(int64_t)a3;
- (double)deepThreshold;
- (double)nearDepthLimitThreshold;
- (double)pastMaxDepthThreshold;
- (double)sensorErrorThreshold;
- (int64_t)getType;
- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4;
- (int64_t)type;
- (void)initializeThresholds;
- (void)setType:(int64_t)a3;
@end

@implementation CLSubmersionStateMachine

- (CLSubmersionStateMachine)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLSubmersionStateMachine;
  v4 = -[CLSubmersionStateMachine init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    -[CLSubmersionStateMachine initializeThresholds](v4, "initializeThresholds");
  }

  return v5;
}

- (void)initializeThresholds
{
  double v3 = 6.0;
  if (self->_type != 1) {
    goto LABEL_9;
  }
  self->_double maxDepth = 40.0;
  int v4 = MGGetSInt32Answer(@"AbsoluteDepthLimit", 0xFFFFFFFFLL, 6.0);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101872C60);
  }
  v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    float v24 = *(float *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Max depth from gestalt, %d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101872C60);
    }
    float v19 = 1.5047e-36;
    int v20 = v4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "Max depth from gestalt, %d",  &v19);
    v17 = (uint8_t *)v16;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLSubmersionStateMachine initializeThresholds]", "%s\n", v16);
    if (v17 != buf) {
      free(v17);
    }
  }

  if (v4 >= 1)
  {
    double v3 = (double)v4;
LABEL_9:
    self->_double maxDepth = v3;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101872C60);
  }
  v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t type = self->_type;
    double maxDepth = self->_maxDepth;
    *(_DWORD *)buf = 67109376;
    float v24 = *(float *)&type;
    __int16 v25 = 2048;
    double v26 = maxDepth;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "initializing submersion thresholds,type,%d,maxdepth,%f",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101872C60);
    }
    int64_t v12 = self->_type;
    double v13 = self->_maxDepth;
    float v19 = 1.5047e-36;
    int v20 = v12;
    __int16 v21 = 2048;
    double v22 = v13;
    LODWORD(v18) = 18;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "initializing submersion thresholds,type,%d,maxdepth,%f",  &v19,  v18);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLSubmersionStateMachine initializeThresholds]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  float v19 = 1.0;
  sub_101206C88(buf, "DeepDepthMeters", &v19, 0);
  self->_deepThreshold = v24;
  float v9 = self->_maxDepth * 0.875;
  float v19 = v9;
  sub_101206C88(buf, "NearDepthLimitMeters", &v19, 0);
  self->_nearDepthLimitThreshold = v24;
  float v10 = self->_maxDepth;
  float v19 = v10;
  sub_101206C88(buf, "PastMaxDepthMeters", &v19, 0);
  self->_pastMaxDepthThreshold = v24;
  float v11 = self->_maxDepth * 1.1;
  float v19 = v11;
  sub_101206C88(buf, "SensorErrorDepthMeters", &v19, 0);
  self->_sensorErrorThreshold = v24;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
  -[CLSubmersionStateMachine initializeThresholds](self, "initializeThresholds");
}

- (int64_t)getType
{
  return self->_type;
}

- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4
{
  if ((uint64_t)[a3 state] > 199 || a4)
  {
    [a3 depth];
    if (v11 <= self->_sensorErrorThreshold)
    {
      [a3 depth];
      if (v12 <= self->_pastMaxDepthThreshold)
      {
        [a3 depth];
        if (v13 <= self->_nearDepthLimitThreshold)
        {
          [a3 depth];
          if (v14 <= self->_deepThreshold) {
            return 200LL;
          }
          else {
            return 300LL;
          }
        }

        else
        {
          return 400LL;
        }
      }

      else
      {
        return 500LL;
      }
    }

    else
    {
      return 600LL;
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101872C60);
    }
    objc_super v7 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [a3 state];
      [a3 depth];
      *(_DWORD *)buf = 134218240;
      id v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "not updating client state because not submerged,state,%ld,depth,%f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101872C60);
      }
      uint64_t v15 = qword_1019346A8;
      id v16 = [a3 state];
      [a3 depth];
      int v21 = 134218240;
      id v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      LODWORD(v20) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v15,  2LL,  "not updating client state because not submerged,state,%ld,depth,%f",  &v21,  v20);
      float v19 = (uint8_t *)v18;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLSubmersionStateMachine stateFromDepth:forceSubmersion:]", "%s\n", v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    return (int64_t)[a3 state];
  }

- (double)deepThreshold
{
  return self->_deepThreshold;
}

- (double)nearDepthLimitThreshold
{
  return self->_nearDepthLimitThreshold;
}

- (double)pastMaxDepthThreshold
{
  return self->_pastMaxDepthThreshold;
}

- (double)sensorErrorThreshold
{
  return self->_sensorErrorThreshold;
}

- (int64_t)type
{
  return self->_type;
}

@end