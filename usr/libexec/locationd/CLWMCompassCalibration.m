@interface CLWMCompassCalibration
- (CLWMCompassCalibration)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onCompassCalibrationData:(const CompassCalibration *)a3;
- (void)retrieveCachedCompassCalibration;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMCompassCalibration

- (CLWMCompassCalibration)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLWMCompassCalibration;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v9->_kCompassCalibrationKey = *(__CFString **)&a5[1].disableAveragedALS;
    v9->_kCachedCalibrationLifeTime = *(double *)&a5[1].disableOdometer;
    v9->_kCachedCompassCalibrationQuality = a5->kCachedCompassCalibrationQuality;
    v9->_sampleCount = 0;
  }

  return v9;
}

- (void)setupListener
{
  if (!self->_compassCalibrationDispatcher.__ptr_.__value_)
  {
    id v3 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v4 = (Dispatcher *)operator new(0x38uLL);
    *(void *)v4 = off_1018A2210;
    *(void *)v4 = off_1018A3A40;
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = sub_10121110C;
    *((void *)v4 + 3) = self;
    id v5 = v3;
    *((void *)v4 + 5) = 0LL;
    *((void *)v4 + 4) = v5;
    *((void *)v4 + 6) = 0LL;
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x2020000000LL;
    char v11 = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472LL;
    aBlock[2] = sub_1012119C4;
    aBlock[3] = &unk_10182EFC8;
    aBlock[4] = v10;
    *((void *)v4 + 5) = _Block_copy(aBlock);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1012119D8;
    v8[3] = &unk_10182EFF0;
    v8[4] = v10;
    *((void *)v4 + 6) = _Block_copy(v8);
    _Block_object_dispose(v10, 8);
    value = self->_compassCalibrationDispatcher.__ptr_.__value_;
    self->_compassCalibrationDispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v7 = sub_100358938(0);
    sub_1006DCB40(v7, 6, (uint64_t)self->_compassCalibrationDispatcher.__ptr_.__value_, -1.0);
  }

- (void)teardownListeners
{
  if (self->_compassCalibrationDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_100358938(0);
    sub_1006DD2A0(v3, 6, (uint64_t)self->_compassCalibrationDispatcher.__ptr_.__value_);
    value = self->_compassCalibrationDispatcher.__ptr_.__value_;
    self->_compassCalibrationDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A39F0);
    }
    id v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Recording compass calibration stopped.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A39F0);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Recording compass calibration stopped.",  v8,  2);
      uint64_t v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMCompassCalibration teardownListeners]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (void)dealloc
{
  self->_metadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMCompassCalibration;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)retrieveCachedCompassCalibration
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136))
  {
    v31 = 0LL;
    uint64_t v4 = sub_1002F8DDC();
    if ((sub_1002A6F20(v4, (uint64_t)self->_kCompassCalibrationKey, (CFTypeRef *)&v31) & 1) != 0)
    {
      objc_msgSend(objc_msgSend(v31, "objectForKeyedSubscript:", @"Time"), "floatValue");
      float v6 = v5;
      id v7 = [v31 objectForKeyedSubscript:@"Bias"];
      id v8 = [v31 objectForKeyedSubscript:@"Scale"];
      sub_101125260(buf);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v35 |= 1u;
      uint64_t v33 = v9;
      sub_101139624(buf);
      sub_10116C140(v34);
      CFAbsoluteTime v10 = v6;
      char v11 = v34;
      uint64_t v12 = v34[1];
      *(_DWORD *)(v12 + 80) |= 1u;
      *(CFAbsoluteTime *)(v12 + 8) = v10;
      uint64_t v13 = v11[1];
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "floatValue");
      *(_DWORD *)(v13 + 80) |= 2u;
      *(_DWORD *)(v13 + 16) = v14;
      uint64_t v15 = v11[1];
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "floatValue");
      *(_DWORD *)(v15 + 80) |= 4u;
      *(_DWORD *)(v15 + 20) = v16;
      uint64_t v17 = v11[1];
      objc_msgSend(objc_msgSend(v7, "objectAtIndexedSubscript:", 2), "floatValue");
      *(_DWORD *)(v17 + 80) |= 8u;
      *(_DWORD *)(v17 + 24) = v18;
      uint64_t v19 = v11[1];
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "floatValue");
      *(_DWORD *)(v19 + 80) |= 0x2000u;
      *(_DWORD *)(v19 + 64) = v20;
      uint64_t v21 = v11[1];
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "floatValue");
      *(_DWORD *)(v21 + 80) |= 0x4000u;
      *(_DWORD *)(v21 + 68) = v22;
      uint64_t v23 = v11[1];
      objc_msgSend(objc_msgSend(v8, "objectAtIndexedSubscript:", 2), "floatValue");
      *(_DWORD *)(v23 + 80) |= 0x8000u;
      *(_DWORD *)(v23 + 72) = v24;
      uint64_t v25 = v11[1];
      float kCachedCompassCalibrationQuality = self->_kCachedCompassCalibrationQuality;
      *(_DWORD *)(v25 + 80) |= 0x1000u;
      *(float *)(v25 + 60) = kCachedCompassCalibrationQuality;
      if (CFAbsoluteTimeGetCurrent() - self->_kCachedCalibrationLifeTime <= v10) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"ContainsValidCompassCalibration");
      }
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)buf);
      sub_101127D00((PB::Base *)buf);
    }

    else
    {
      if (qword_101934580 != -1) {
        dispatch_once(&qword_101934580, &stru_1018A3A10);
      }
      v27 = (os_log_s *)qword_101934588;
      if (os_log_type_enabled((os_log_t)qword_101934588, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[CompassCalibration] no persistent calibration found",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934580 != -1) {
          dispatch_once(&qword_101934580, &stru_1018A3A10);
        }
        __int16 v30 = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934588,  0LL,  "[CompassCalibration] no persistent calibration found",  &v30,  2);
        v29 = (uint8_t *)v28;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMCompassCalibration retrieveCachedCompassCalibration]", "%s\n", v28);
        if (v29 != buf) {
          free(v29);
        }
      }
    }
  }

- (void)onCompassCalibrationData:(const CompassCalibration *)a3
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      ++self->_sampleCount;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"ContainsValidCompassCalibration");
      sub_101125260(v17);
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      v19 |= 1u;
      v17[77] = v6;
      sub_101139624(v17);
      sub_10116C140(v18);
      id v7 = v18;
      uint64_t v8 = v18[1];
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      *(_DWORD *)(v8 + 80) |= 1u;
      *(void *)(v8 + 8) = v9;
      uint64_t v10 = v7[1];
      LODWORD(v9) = *(_DWORD *)(&a3->var4 + 1);
      *(_DWORD *)(v10 + 80) |= 2u;
      *(_DWORD *)(v10 + 16) = v9;
      uint64_t v11 = v7[1];
      *(float *)&uint64_t v9 = *(float *)((char *)a3->var5 + 1);
      *(_DWORD *)(v11 + 80) |= 4u;
      *(_DWORD *)(v11 + 20) = v9;
      uint64_t v12 = v7[1];
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var5[1] + 1);
      *(_DWORD *)(v12 + 80) |= 8u;
      *(_DWORD *)(v12 + 24) = v9;
      uint64_t v13 = v7[1];
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var6[2] + 1);
      *(_DWORD *)(v13 + 80) |= 0x2000u;
      *(_DWORD *)(v13 + 64) = v9;
      uint64_t v14 = v7[1];
      *(float *)&uint64_t v9 = *(float *)((char *)a3->var7 + 1);
      *(_DWORD *)(v14 + 80) |= 0x4000u;
      *(_DWORD *)(v14 + 68) = v9;
      uint64_t v15 = v7[1];
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var7[1] + 1);
      *(_DWORD *)(v15 + 80) |= 0x8000u;
      *(_DWORD *)(v15 + 72) = v9;
      uint64_t v16 = v7[1];
      *(float *)&uint64_t v9 = *(float *)((char *)&a3->var8[2] + 1);
      *(_DWORD *)(v16 + 80) |= 0x1000u;
      *(_DWORD *)(v16 + 60) = v9;
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
      sub_101127D00((PB::Base *)v17);
    }
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
  value = self->_compassCalibrationDispatcher.__ptr_.__value_;
  self->_compassCalibrationDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Dispatcher *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  sub_10000AE14((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 7) = 0LL;
  return self;
}

@end