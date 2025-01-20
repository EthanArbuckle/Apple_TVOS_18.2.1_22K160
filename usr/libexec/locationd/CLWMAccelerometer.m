@interface CLWMAccelerometer
- (CLWMAccelerometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onAccelerometerData:(const Sample *)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMAccelerometer

- (CLWMAccelerometer)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLWMAccelerometer;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_fWorkoutRecorderAccelSampleCount = 0;
    v8->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9->_accelIntervalSeconds = a5->accelIntervalSeconds;
    v9->_kWorkoutRecorderWaitNumAccelSamples = *(_DWORD *)&a5->recordingType.__r_.var1;
    v9->_sampleCount = 0;
  }

  return v9;
}

- (void)setupListener
{
  if (sub_1006E5C40())
  {
    if (self->_accelerometerDispatcher.__ptr_.__value_)
    {
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3B20);
      }
      v7 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        int v11 = 0;
        __int16 v12 = 2082;
        v13 = "";
        __int16 v14 = 2082;
        v15 = "assert";
        __int16 v16 = 2081;
        v17 = "!_accelerometerDispatcher";
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of accelerometer listener., event:%{public, location:escape_on ly}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3B20);
        }
      }

      v8 = (os_log_s *)qword_101934678;
      if (os_signpost_enabled((os_log_t)qword_101934678))
      {
        *(_DWORD *)buf = 68289539;
        int v11 = 0;
        __int16 v12 = 2082;
        v13 = "";
        __int16 v14 = 2082;
        v15 = "assert";
        __int16 v16 = 2081;
        v17 = "!_accelerometerDispatcher";
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of accelerometer listener.",  "{msg%{public}.0s:Duplicate creation of accelerometer listener., event:%{public, location:escape_on ly}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
        if (qword_101934670 != -1) {
          dispatch_once(&qword_101934670, &stru_1018A3B20);
        }
      }

      v9 = (os_log_s *)qword_101934678;
      if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        int v11 = 0;
        __int16 v12 = 2082;
        v13 = "";
        __int16 v14 = 2082;
        v15 = "assert";
        __int16 v16 = 2081;
        v17 = "!_accelerometerDispatcher";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of accelerometer listener., event:%{public, location:escape_on ly}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      }

      abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMAccelerometer.mm",  71,  "-[CLWMAccelerometer setupListener]");
      __break(1u);
    }

    id v3 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v4 = (Dispatcher *)operator new(0x38uLL);
    sub_101212E7C(v4, v3, (uint64_t)sub_101212AB0, (uint64_t)self, 0LL);
    value = self->_accelerometerDispatcher.__ptr_.__value_;
    self->_accelerometerDispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v6 = sub_1006E5C40();
    sub_1006DCB40(v6, 0, (uint64_t)self->_accelerometerDispatcher.__ptr_.__value_, self->_accelIntervalSeconds);
  }

- (void)teardownListeners
{
  if (self->_accelerometerDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1006E5C40();
    sub_1006DD2A0(v3, 0, (uint64_t)self->_accelerometerDispatcher.__ptr_.__value_);
    value = self->_accelerometerDispatcher.__ptr_.__value_;
    self->_accelerometerDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    self->_fWorkoutRecorderAccelSampleCount = 0;
  }

- (void)dealloc
{
  self->_metadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMAccelerometer;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)onAccelerometerData:(const Sample *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    ++self->_sampleCount;
    unsigned int fWorkoutRecorderAccelSampleCount = self->_fWorkoutRecorderAccelSampleCount;
    if (fWorkoutRecorderAccelSampleCount >= self->_kWorkoutRecorderWaitNumAccelSamples)
    {
      if (!-[NSMutableDictionary objectForKey:]( self->_metadata,  "objectForKey:",  @"SensorRecordingActiveAndEnabled"))
      {
        id v7 = objc_msgSend( -[CLIntersiloUniverse vendor](self->_universe, "vendor"),  "proxyForService:",  @"CLFallNotifier");
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_101212D60;
        v20[3] = &unk_101840D20;
        v20[4] = self;
        [v7 doAsync:v20];
      }
    }

    else
    {
      self->_unsigned int fWorkoutRecorderAccelSampleCount = fWorkoutRecorderAccelSampleCount + 1;
    }

    sub_101125260(v17);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___CLWMAccelerometer;
    -[CLWMBase makeSafeCFAbsoluteTime:](&v16, "makeSafeCFAbsoluteTime:", Current);
    v19 |= 1u;
    v17[77] = v9;
    sub_101138CF4(v17);
    sub_101082C6C(v18);
    v10 = v18;
    uint64_t v11 = v18[1];
    double var0 = a3->var0;
    *(_BYTE *)(v11 + 32) |= 1u;
    *(double *)(v11 + 8) = var0;
    uint64_t v13 = v10[1];
    *(float *)&double var0 = a3->var1.var0;
    *(_BYTE *)(v13 + 32) |= 4u;
    *(_DWORD *)(v13 + 20) = LODWORD(var0);
    uint64_t v14 = v10[1];
    *(float *)&double var0 = a3->var1.var1;
    *(_BYTE *)(v14 + 32) |= 8u;
    *(_DWORD *)(v14 + 24) = LODWORD(var0);
    uint64_t v15 = v10[1];
    *(float *)&double var0 = a3->var1.var2;
    *(_BYTE *)(v15 + 32) |= 0x10u;
    *(_DWORD *)(v15 + 28) = LODWORD(var0);
    sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
    sub_101127D00((PB::Base *)v17);
  }

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void).cxx_destruct
{
  value = self->_accelerometerDispatcher.__ptr_.__value_;
  self->_accelerometerDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  return self;
}

@end