@interface CLWMMotionState
- (CLDaemonLocation)getStartLocation;
- (CLWMMotionState)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)getRecordEventBlock;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3;
- (void)releaseBlocks;
- (void)setBlockUpdateIsCycling:(id)a3;
- (void)setGetStartLocation:(id)a3;
- (void)setWorkoutCount:(int)a3;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
- (void)updateCyclingWorkout:(BOOL)a3;
- (void)writeWorkoutEvent:(const WorkoutEvent *)a3;
@end

@implementation CLWMMotionState

- (id)getRecordEventBlock
{
  return *(id *)&self->_startLocation.fromSimulationController;
}

- (CLWMMotionState)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLWMMotionState;
  v8 = -[CLWMBase init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9->_disableLatLong = a5->disableLatLong;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472LL;
    aBlock[2] = sub_10120FC38;
    aBlock[3] = &unk_1018A39B0;
    aBlock[4] = v9;
    *(void *)&v9->_startLocation.fromSimulationController = _Block_copy(aBlock);
    v9->_sampleCount = 0;
  }

  return v9;
}

- (void)setupListener
{
  v3 = v6;
  v6 = 0LL;
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = v6;
    v6 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  objc_msgSend( *((id *)self->_motionStateMediatorClient.__ptr_.__value_ + 2),  "register:forNotification:registrationInfo:",  *((void *)self->_motionStateMediatorClient.__ptr_.__value_ + 1),  2,  0,  v6);
  -[CLWMMotionState getStartLocation](self, "getStartLocation");
}

- (void)teardownListeners
{
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  -[CLWMMotionState releaseBlocks](self, "releaseBlocks");
}

- (void)dealloc
{
  self->_metadata = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLWMMotionState;
  -[CLWMBase dealloc](&v7, "dealloc");
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A39D0);
  }
  v3 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLWMMotionState deallocation is complete",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A39D0);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWMMotionState deallocation is complete",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMMotionState dealloc]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)setGetStartLocation:(id)a3
{
  double ellipsoidalAltitude = self->_startLocation.ellipsoidalAltitude;
  if (ellipsoidalAltitude != 0.0) {
    _Block_release(*(const void **)&ellipsoidalAltitude);
  }
  *(void *)&self->_startLocation.double ellipsoidalAltitude = _Block_copy(a3);
}

- (void)setBlockUpdateIsCycling:(id)a3
{
  id getstartLocation = self->_getstartLocation;
  if (getstartLocation) {
    _Block_release(getstartLocation);
  }
  self->_id getstartLocation = _Block_copy(a3);
}

- (void)updateCyclingWorkout:(BOOL)a3
{
  id getstartLocation = (void (**)(id, BOOL))self->_getstartLocation;
  if (getstartLocation) {
    getstartLocation[2](getstartLocation, a3);
  }
}

- (CLDaemonLocation)getStartLocation
{
  result = *(CLDaemonLocation **)&self->_startLocation.ellipsoidalAltitude;
  if (result)
  {
    result = (CLDaemonLocation *)(*(void *(**)(_OWORD *__return_ptr))&result->coordinate.longitude)(v14);
    $AB5116BA7E623E054F959CECB034F4E7 v6 = ($AB5116BA7E623E054F959CECB034F4E7)v14[7];
    *(_OWORD *)&self->_startLocation.lifespan = v14[6];
    self->_startLocation.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = v6;
    *(_OWORD *)&self->_startLocation.rawCourse = *(_OWORD *)v15;
    *(_OWORD *)&self->_startLocation.integrity = *(_OWORD *)&v15[12];
    __int128 v7 = v14[3];
    *(_OWORD *)&self->_startLocation.altitude = v14[2];
    *(_OWORD *)&self->_startLocation.speed = v7;
    __int128 v8 = v14[5];
    *(_OWORD *)&self->_startLocation.course = v14[4];
    *(_OWORD *)&self->_startLocation.timestamp = v8;
    __int128 v9 = v14[1];
    *(_OWORD *)&self->_startLocation.suitability = v14[0];
    *(_OWORD *)&self->_startLocation.coordinate.longitude = v9;
  }

  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = self->_startLocation.rawCoordinate;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->_startLocation.lifespan;
  retstr->$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = rawCoordinate;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self->_startLocation.rawCourse;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)&self->_startLocation.integrity;
  __int128 v11 = *(_OWORD *)&self->_startLocation.speed;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->_startLocation.altitude;
  *(_OWORD *)&retstr->speed = v11;
  __int128 v12 = *(_OWORD *)&self->_startLocation.timestamp;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->_startLocation.course;
  *(_OWORD *)&retstr->timestamp = v12;
  __int128 v13 = *(_OWORD *)&self->_startLocation.coordinate.longitude;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->_startLocation.suitability;
  *(_OWORD *)&retstr->coordinate.longitude = v13;
  return result;
}

- (void)writeWorkoutEvent:(const WorkoutEvent *)a3
{
  ptr = self->_writer.__ptr_;
  if (!ptr || !*((_BYTE *)ptr + 136)) {
    return;
  }
  ++self->_sampleCount;
  int64_t var2 = a3->var2;
  if ((unint64_t)(var2 - 8) < 2)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var5.var3),  @"PredictedWorkoutType");
    __int128 v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var5.var4);
    metadata = self->_metadata;
    __int128 v9 = @"PredictedWorkoutLocationType";
  }

  else if (var2)
  {
    __int128 v7 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_metadata,  "objectForKeyedSubscript:",  @"UniqueWorkoutActivityCount"),  "integerValue")
         + 1);
    metadata = self->_metadata;
    __int128 v9 = @"UniqueWorkoutActivityCount";
  }

  else
  {
    if ((sub_101210AB0((float *)&self->_activitySet, a3->var5.var3, a3->var5.var3) & 1) != 0) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( self->_metadata,  "objectForKeyedSubscript:",  @"UniqueWorkoutActivityCount"),  "integerValue")
    }
        + 1),
        @"UniqueWorkoutActivityCount");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var5.var3),  @"WorkoutActivityType");
    __int128 v7 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3->var5.var4);
    metadata = self->_metadata;
    __int128 v9 = @"WorkoutActivityLocationType";
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](metadata, "setObject:forKeyedSubscript:", v7, v9);
LABEL_13:
  if (!self->_disableLatLong)
  {
    unint64_t v10 = a3->var2;
    if (v10 <= 0xD && ((1LL << v10) & 0x2300) != 0)
    {
      -[CLWMMotionState getStartLocation](self, "getStartLocation");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", llround(v44)),  @"CoarseLatitude2");
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", llround(*(double *)v45)),  @"CoarseLongitude2");
    }
  }

  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A39D0);
  }
  __int128 v11 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = a3->var2;
    int64_t var3 = a3->var5.var3;
    int64_t var4 = a3->var5.var4;
    *(_DWORD *)buf = 134218496;
    double v44 = *(double *)&v12;
    *(_WORD *)v45 = 2048;
    *(void *)&v45[2] = var3;
    __int16 v46 = 2048;
    int64_t v47 = var4;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received: WorkoutEventType: %ld WorkoutType: %ld Location: %ld",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A39D0);
    }
    int64_t v38 = a3->var2;
    int64_t v39 = a3->var5.var3;
    int64_t v40 = a3->var5.var4;
    int v51 = 134218496;
    int64_t v52 = v38;
    __int16 v53 = 2048;
    int64_t v54 = v39;
    __int16 v55 = 2048;
    int64_t v56 = v40;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "Received: WorkoutEventType: %ld WorkoutType: %ld Location: %ld",  &v51,  32);
    v42 = (uint8_t *)v41;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMMotionState writeWorkoutEvent:]", "%s\n", v41);
    if (v42 != buf) {
      free(v42);
    }
  }

  sub_101125260(buf);
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
  v50 |= 1u;
  uint64_t v48 = v15;
  sub_101138EEC(buf);
  sub_10116EE64(v49);
  v16 = v49;
  uint64_t v17 = *((void *)v49 + 1);
  int64_t v18 = a3->var5.var3;
  *(_WORD *)(v17 + 64) |= 0x200u;
  *(_DWORD *)(v17 + 60) = v18;
  uint64_t v19 = *((void *)v16 + 1);
  int64_t v20 = a3->var2;
  *(_WORD *)(v19 + 64) |= 0x10u;
  *(_DWORD *)(v19 + 40) = v20;
  uint64_t v21 = *((void *)v16 + 1);
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->var3);
  *(_WORD *)(v21 + 64) |= 2u;
  *(void *)(v21 + 16) = v22;
  uint64_t v23 = *((void *)v16 + 1);
  -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", a3->var0);
  *(_WORD *)(v23 + 64) |= 8u;
  *(void *)(v23 + 32) = v24;
  if (a3->var1 != 1.79769313e308)
  {
    uint64_t v25 = *((void *)v16 + 1);
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:");
    *(_WORD *)(v25 + 64) |= 1u;
    *(void *)(v25 + 8) = v26;
  }

  uint64_t v27 = *((void *)v16 + 1);
  int64_t v28 = a3->var5.var4;
  *(_WORD *)(v27 + 64) |= 0x80u;
  *(_DWORD *)(v27 + 52) = v28;
  uint64_t v29 = *((void *)v16 + 1);
  unint64_t var7 = a3->var5.var7;
  *(_WORD *)(v29 + 64) |= 0x100u;
  *(_DWORD *)(v29 + 56) = var7;
  int64_t v31 = a3->var5.var3;
  if (v31 == 14)
  {
    uint64_t v36 = *((void *)v16 + 1);
    int64_t var0 = a3->var5.var5.var0.var0;
    *(_WORD *)(v36 + 64) |= 0x20u;
    *(_DWORD *)(v36 + 44) = var0;
  }

  else if (v31 == 19)
  {
    uint64_t v32 = *((void *)v16 + 1);
    int64_t v33 = a3->var5.var5.var0.var0;
    *(_WORD *)(v32 + 64) |= 0x40u;
    *(_DWORD *)(v32 + 48) = v33;
    uint64_t v34 = *((void *)v16 + 1);
    double var1 = a3->var5.var5.var0.var1;
    *(_WORD *)(v34 + 64) |= 4u;
    *(double *)(v34 + 24) = var1;
  }

  sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
  sub_101127D00((PB::Base *)buf);
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 2)
  {
    __int128 v8 = *((_OWORD *)a4 + 13);
    __int128 v31 = *((_OWORD *)a4 + 12);
    __int128 v32 = v8;
    uint64_t v33 = *((void *)a4 + 28);
    __int128 v9 = *((_OWORD *)a4 + 9);
    __int128 v27 = *((_OWORD *)a4 + 8);
    __int128 v28 = v9;
    __int128 v10 = *((_OWORD *)a4 + 11);
    __int128 v29 = *((_OWORD *)a4 + 10);
    __int128 v30 = v10;
    __int128 v11 = *((_OWORD *)a4 + 5);
    __int128 v23 = *((_OWORD *)a4 + 4);
    __int128 v24 = v11;
    __int128 v12 = *((_OWORD *)a4 + 7);
    __int128 v25 = *((_OWORD *)a4 + 6);
    __int128 v26 = v12;
    __int128 v13 = *((_OWORD *)a4 + 1);
    *(_OWORD *)buf = *(_OWORD *)a4;
    __int128 v20 = v13;
    __int128 v14 = *((_OWORD *)a4 + 3);
    __int128 v21 = *((_OWORD *)a4 + 2);
    __int128 v22 = v14;
    if (!sub_100BEF684((uint64_t)buf))
    {
      -[CLWMMotionState writeWorkoutEvent:](self, "writeWorkoutEvent:", buf);
      if ((void)v20 == 18LL || (void)v20 == 14LL) {
        -[CLWMMotionState updateCyclingWorkout:](self, "updateCyclingWorkout:", sub_100BEF664(v26));
      }
    }
  }

  else
  {
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A39D0);
    }
    uint64_t v15 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#Warning Unhandled motion state mediator notification",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A39D0);
      }
      v18[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "#Warning Unhandled motion state mediator notification",  v18,  2);
      uint64_t v17 = (uint8_t *)v16;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMMotionState onMotionStateMediatorNotification:data:]", "%s\n", v16);
      if (v17 != buf) {
        free(v17);
      }
    }
  }

- (void)recordWorkoutSessionEvent:(const WorkoutEvent *)a3
{
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
}

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)setWorkoutCount:(int)a3
{
}

- (void)releaseBlocks
{
}

- (void).cxx_destruct
{
  p_activitySet = &self->_activitySet;
  next = self->_activitySet.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v5 = (void *)*next;
      operator delete(next);
      next = v5;
    }

    while (v5);
  }

  value = p_activitySet->__table_.__bucket_list_.__ptr_.__value_;
  p_activitySet->__table_.__bucket_list_.__ptr_.__value_ = 0LL;
  if (value) {
    operator delete(value);
  }
  sub_10000AE14((uint64_t)&self->_writer);
  __int128 v7 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0LL;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8LL))(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_DWORD *)self + 28) = 0xFFFF;
  *(void *)((char *)self + 116) = 0LL;
  *(void *)((char *)self + 124) = 0LL;
  *(_OWORD *)((char *)self + 132) = xmmword_1012E0070;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)((char *)self + 148) = _Q0;
  *(_OWORD *)((char *)self + 164) = _Q0;
  *(_OWORD *)((char *)self + 180) = _Q0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 56) = 0;
  *((void *)self + 25) = 0xBFF0000000000000LL;
  *((void *)self + 26) = 0LL;
  *((void *)self + 27) = 0LL;
  *(void *)((char *)self + 228) = 0xBFF0000000000000LL;
  *((_DWORD *)self + 59) = 0x7FFFFFFF;
  *((void *)self + 31) = 0LL;
  *((void *)self + 32) = 0LL;
  *((void *)self + 30) = 0LL;
  *((_BYTE *)self + 264) = 0;
  return self;
}

@end