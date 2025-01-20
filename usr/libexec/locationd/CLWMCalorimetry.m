@interface CLWMCalorimetry
- (CLWMCalorimetry)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onCalorimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)resetBodyMetrics;
- (void)setWorkoutRecording:(id)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
- (void)writeBodyMetrics;
@end

@implementation CLWMCalorimetry

- (void)setWorkoutRecording:(id)a3
{
  self->_workoutRecording = (CLWorkoutRecording *)a3;
}

- (CLWMCalorimetry)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLWMCalorimetry;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9->_disableBodyMetrics = a5->disableBodyMetrics;
    v9->_disableMeanMaxMets = a5->disableMeanMaxMets;
    v9->_sampleCount = 0;
  }

  return v9;
}

- (void)setupListener
{
  if (self->_calorimetryClient.__ptr_.__value_)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A36E8);
    }
    v6 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      objc_super v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_calorimetryClient";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of calorimetry listener., event:%{public, location:escape_only}s , condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A36E8);
      }
    }

    v7 = (os_log_s *)qword_101934678;
    if (os_signpost_enabled((os_log_t)qword_101934678))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      objc_super v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_calorimetryClient";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of calorimetry listener.",  "{msg%{public}.0s:Duplicate creation of calorimetry listener., event:%{public, location:escape_only}s , condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A36E8);
      }
    }

    v8 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      objc_super v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_calorimetryClient";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of calorimetry listener., event:%{public, location:escape_only}s , condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMCalorimetry.mm",  78,  "-[CLWMCalorimetry setupListener]");
  }

  sub_100E18F18((uint64_t)sub_10120BF88, (uint64_t)self, self->_delegate, buf);
  v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  if (!self->_disableBodyMetrics)
  {
    -[CLWMCalorimetry resetBodyMetrics](self, "resetBodyMetrics");
    [*((id *)self->_calorimetryClient.__ptr_.__value_ + 2) register:*((void *)self->_calorimetryClient.__ptr_.__value_ + 1) forNotification:2 registrationInfo:0];
  }

  if (!self->_disableMeanMaxMets) {
    [*((id *)self->_calorimetryClient.__ptr_.__value_ + 2) register:*((void *)self->_calorimetryClient.__ptr_.__value_ + 1) forNotification:8 registrationInfo:0];
  }
}

- (void)teardownListeners
{
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (void)dealloc
{
  self->_metadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMCalorimetry;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)onCalorimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v6 = *a3;
  if (*a3 == 2)
  {
    if (!sub_10120C434((uint64_t)&self->_bodyMetrics, (uint64_t)a4))
    {
      __int128 v11 = *(_OWORD *)a4;
      __int128 v12 = *((_OWORD *)a4 + 1);
      __int128 v13 = *((_OWORD *)a4 + 2);
      *(_OWORD *)&self->_bodyMetrics.runVo2max = *(_OWORD *)((char *)a4 + 44);
      *(_OWORD *)&self->_bodyMetrics.vo2max = v12;
      *(_OWORD *)&self->_bodyMetrics.hronset = v13;
      *(_OWORD *)&self->_bodyMetrics.gender = v11;
      -[CLWMCalorimetry writeBodyMetrics](self, "writeBodyMetrics");
      return;
    }

    int v6 = *a3;
  }

  if (v6 == 8)
  {
    metadata = self->_metadata;
    uint64_t v9 = sub_1004F2598();
    sub_1004F58C8(v9, (uint64_t)__p);
    if (v15 >= 0) {
      __int16 v10 = __p;
    }
    else {
      __int16 v10 = (void **)__p[0];
    }
    -[NSMutableDictionary setValue:forKey:]( metadata,  "setValue:forKey:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10),  @"HardwareType");
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    -[NSMutableDictionary setValue:forKey:]( self->_metadata,  "setValue:forKey:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)a4),  @"MeanMaxMets");
  }

- (void)resetBodyMetrics
{
  *(_OWORD *)&self->_bodyMetrics.hronset = xmmword_1013E4A84;
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(__int128 *)((char *)&xmmword_1013E4A84 + 12);
  *(_OWORD *)&self->_bodyMetrics.gender = xmmword_1013E4A64;
  *(_OWORD *)&self->_bodyMetrics.vo2max = unk_1013E4A74;
  self->_bodyMetrics.runVo2max = 7.0;
}

- (void)writeBodyMetrics
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !self->_disableBodyMetrics)
  {
    sub_101125260(v22);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    v24 |= 1u;
    v22[77] = v4;
    sub_101138D48(v22);
    sub_10116BDCC(v23);
    v5 = v23;
    uint64_t v6 = v23[1];
    int gender = self->_bodyMetrics.gender;
    *(_WORD *)(v6 + 64) |= 0x10u;
    *(_DWORD *)(v6 + 24) = gender;
    uint64_t v8 = v5[1];
    float heightM = self->_bodyMetrics.heightM;
    *(_WORD *)(v8 + 64) |= 0x20u;
    *(float *)(v8 + 28) = heightM;
    uint64_t v10 = v5[1];
    float weightKG = self->_bodyMetrics.weightKG;
    *(_WORD *)(v10 + 64) |= 0x1000u;
    *(float *)(v10 + 56) = weightKG;
    uint64_t v12 = v5[1];
    float vo2max = self->_bodyMetrics.vo2max;
    *(_WORD *)(v12 + 64) |= 0x800u;
    *(float *)(v12 + 52) = vo2max;
    uint64_t v14 = v5[1];
    float age = self->_bodyMetrics.age;
    *(_WORD *)(v14 + 64) |= 2u;
    *(float *)(v14 + 12) = age;
    uint64_t v16 = v5[1];
    float hrmin = self->_bodyMetrics.hrmin;
    *(_WORD *)(v16 + 64) |= 0x80u;
    *(float *)(v16 + 36) = hrmin;
    uint64_t v18 = v5[1];
    float hrmax = self->_bodyMetrics.hrmax;
    *(_WORD *)(v18 + 64) |= 0x40u;
    *(float *)(v18 + 32) = hrmax;
    uint64_t v20 = v5[1];
    float hronset = self->_bodyMetrics.hronset;
    *(_WORD *)(v20 + 64) |= 0x100u;
    *(float *)(v20 + 40) = hronset;
    sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
    sub_101127D00((PB::Base *)v22);
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
  value = self->_calorimetryClient.__ptr_.__value_;
  self->_calorimetryClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
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