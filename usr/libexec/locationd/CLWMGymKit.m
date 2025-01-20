@interface CLWMGymKit
- (CLWMGymKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)getBlockSetIsCycling;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onFitnessMachineNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)releaseBlocks;
- (void)setIsCyclingWorkout:(BOOL)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
- (void)writeClimbingGymkitData:(const _CLFitnessMachineData *)a3;
- (void)writeCyclingGymkitData:(const _CLFitnessMachineData *)a3;
- (void)writeTreadmillGymkitData:(const _CLFitnessMachineData *)a3;
@end

@implementation CLWMGymKit

- (void)setIsCyclingWorkout:(BOOL)a3
{
  self->_isCyclingWorkout = a3;
}

- (CLWMGymKit)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CLWMGymKit;
  v8 = -[CLWMBase init](&v16, "init");
  if (v8)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3180);
    }
    v9 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GymKit module is initialized.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3180);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "GymKit module is initialized.",  v15,  2);
      v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMGymKit initWithDelegate:universeCopy:settings:]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    v8->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_disableForceActiveListeners = a5->disableForceActiveListeners;
    v8->_sampleCount = 0;
    v8->_isCyclingWorkout = sub_100BEF664(*(void *)&a5[1].hasSyncInWatch);
    v8->_isTreadmillWorkout = sub_100BEF674(*(void *)&a5[1].hasSyncInWatch);
    uint64_t v10 = *(void *)&a5[1].hasSyncInWatch;
    v8->_isEllipticalWorkout = v10 == 9;
    v8->_isStairmillWorkout = v10 == 11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472LL;
    aBlock[2] = sub_1011FDF18;
    aBlock[3] = &unk_10182FAF8;
    aBlock[4] = v8;
    v8->_getBlockSetIsCycling = _Block_copy(aBlock);
  }

  return v8;
}

- (void)setupListener
{
  if (self->_fitnessMachineClient.__ptr_.__value_)
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3180);
    }
    v6 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_fitnessMachineClient";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Duplicate creation of heart rate listener., event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3180);
      }
    }

    v7 = (os_log_s *)qword_101934678;
    if (os_signpost_enabled((os_log_t)qword_101934678))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_fitnessMachineClient";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Duplicate creation of heart rate listener.",  "{msg%{public}.0s:Duplicate creation of heart rate listener., event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3180);
      }
    }

    v8 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)&buf[4] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 2082;
      v13 = "assert";
      __int16 v14 = 2081;
      v15 = "!_fitnessMachineClient";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Duplicate creation of heart rate listener., event:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x26u);
    }

    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Motion/Utilities/WorkoutRecordingModules/CLWMGymKit.mm",  87,  "-[CLWMGymKit setupListener]");
  }

  sub_100D3BE3C((uint64_t)sub_1011FE1FC, (uint64_t)self, self->_delegate, buf);
  v3 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->_fitnessMachineClient.__ptr_.__value_ + 2) register:*((void *)self->_fitnessMachineClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
}

- (void)teardownListeners
{
  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  -[CLWMGymKit releaseBlocks](self, "releaseBlocks");
}

- (void)onFitnessMachineNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    int v5 = *((_DWORD *)a4 + 40);
    if (*a3) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v5 == 1;
    }
    if (v6) {
      goto LABEL_10;
    }
    if (v5) {
      return;
    }
    if (self->_isCyclingWorkout)
    {
LABEL_10:
      -[CLWMGymKit writeCyclingGymkitData:](self, "writeCyclingGymkitData:", a4);
      return;
    }

    if (!*a3)
    {
      if (self->_isTreadmillWorkout)
      {
        -[CLWMGymKit writeTreadmillGymkitData:](self, "writeTreadmillGymkitData:", a4);
      }

      else if (self->_isEllipticalWorkout || self->_isStairmillWorkout)
      {
        -[CLWMGymKit writeClimbingGymkitData:](self, "writeClimbingGymkitData:", a4);
      }
    }
  }

- (void)writeCyclingGymkitData:(const _CLFitnessMachineData *)a3
{
  v28 |= 1u;
  v26[77] = v5;
  sub_10113A050(v26);
  sub_10116CB9C(v27);
  BOOL v6 = v27;
  uint64_t v7 = v27[1];
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->var0);
  *(_DWORD *)(v7 + 176) |= 0x800u;
  *(void *)(v7 + 96) = v8;
  uint64_t v9 = v6[1];
  double var14 = a3->var14;
  *(_DWORD *)(v9 + 176) |= 0x20u;
  *(double *)(v9 + 48) = var14;
  double var15 = a3->var15;
  uint64_t v12 = v6[1];
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  if (var15 > 0.0)
  {
    uint64_t v14 = 0LL;
    if (var15 != 1.79769313e308)
    {
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", var15, 0.0);
      uint64_t v14 = v15;
    }
  }

  *(_DWORD *)(v12 + 176) |= 0x80u;
  *(void *)(v12 + 64) = v14;
  uint64_t v16 = v6[1];
  double var11 = a3->var11;
  *(_DWORD *)(v16 + 176) |= 0x10u;
  *(double *)(v16 + 40) = var11;
  double var12 = a3->var12;
  uint64_t v19 = v6[1];
  if (var12 > 0.0 && var12 != 1.79769313e308)
  {
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:");
    uint64_t v13 = v20;
  }

  *(_DWORD *)(v19 + 176) |= 2u;
  *(void *)(v19 + 16) = v13;
  uint64_t v21 = v6[1];
  double var8 = a3->var8;
  *(_DWORD *)(v21 + 176) |= 0x40u;
  *(double *)(v21 + 56) = var8;
  double var9 = a3->var9;
  uint64_t v24 = v6[1];
  uint64_t v25 = 0LL;
  if (var9 > 0.0 && var9 != 1.79769313e308) {
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", var9);
  }
  *(_DWORD *)(v24 + 176) |= 0x400u;
  *(void *)(v24 + 88) = v25;
  sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v26);
  sub_101127D00((PB::Base *)v26);
}

- (void)writeTreadmillGymkitData:(const _CLFitnessMachineData *)a3
{
  v24 |= 1u;
  v22[77] = v5;
  sub_10113A050(v22);
  sub_10116CB9C(v23);
  BOOL v6 = v23;
  uint64_t v7 = v23[1];
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->var0);
  *(_DWORD *)(v7 + 176) |= 0x800u;
  *(void *)(v7 + 96) = v8;
  uint64_t v9 = v6[1];
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->var1);
  *(_DWORD *)(v9 + 176) |= 4u;
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = v6[1];
  double var17 = a3->var17;
  *(_DWORD *)(v11 + 176) |= 8u;
  *(double *)(v11 + 32) = var17;
  uint64_t v13 = v6[1];
  double var2 = a3->var2;
  *(_DWORD *)(v13 + 176) |= 0x8000u;
  *(double *)(v13 + 128) = var2;
  uint64_t v15 = v6[1];
  double var3 = a3->var3;
  *(_DWORD *)(v15 + 176) |= 0x2000u;
  *(double *)(v15 + 112) = var3;
  uint64_t v17 = v6[1];
  double var8 = a3->var8;
  *(_DWORD *)(v17 + 176) |= 0x40u;
  *(double *)(v17 + 56) = var8;
  double var9 = a3->var9;
  uint64_t v20 = v6[1];
  uint64_t v21 = 0LL;
  if (var9 > 0.0 && var9 != 1.79769313e308) {
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", var9);
  }
  *(_DWORD *)(v20 + 176) |= 0x400u;
  *(void *)(v20 + 88) = v21;
  sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v22);
  sub_101127D00((PB::Base *)v22);
}

- (void)writeClimbingGymkitData:(const _CLFitnessMachineData *)a3
{
  if (self->_isEllipticalWorkout)
  {
    uint64_t v5 = @"HasEllipticalData";
LABEL_5:
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  v5);
    goto LABEL_6;
  }

  if (self->_isStairmillWorkout)
  {
    uint64_t v5 = @"HasStairMillData";
    goto LABEL_5;
  }

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (id)getBlockSetIsCycling
{
  return self->_getBlockSetIsCycling;
}

- (void)releaseBlocks
{
}

- (void)dealloc
{
  self->_metadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMGymKit;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void).cxx_destruct
{
  value = self->_fitnessMachineClient.__ptr_.__value_;
  self->_fitnessMachineClient.__ptr_.__value_ = 0LL;
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