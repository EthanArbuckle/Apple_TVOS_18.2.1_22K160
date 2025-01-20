@interface CLWMHeadsetDeviceMotion
- (CLWMHeadsetDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onAccessoryDeviceMotionConfig:(const void *)a3 buffersize:(unsigned int)a4;
- (void)onAccessoryDeviceMotionData:(const void *)a3 buffersize:(unsigned int)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMHeadsetDeviceMotion

- (CLWMHeadsetDeviceMotion)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLWMHeadsetDeviceMotion;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_headsetDMupdateInterval = a5[1].kPrivacyPressureMaxOffset;
    v8->_lowLatencyMode = LOBYTE(a5[1].magIntervalSeconds);
    v8->_dmBufferSize = HIDWORD(a5[1].magIntervalSeconds);
    v8->_sampleCount = 0;
    v8->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }

  return v9;
}

- (void)setupListener
{
  if (self->_headsetDMupdateInterval > 0.0 && sub_100FD4930() && self->_dmBufferSize)
  {
    BOOL lowLatencyMode = self->_lowLatencyMode;
    *(_BYTE *)(sub_100FD4930() + 28) = lowLatencyMode;
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", self->_dmBufferSize),  @"HeadsetDMBufferSize");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_headsetDMupdateInterval),  @"HeadsetDMUpdateInterval");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_lowLatencyMode),  @"HeadsetDMIsLowLatencyModeEnabled");
    -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"HeadsetDMSetupTime");
    id v4 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v5 = (Dispatcher *)operator new(0x48uLL);
    sub_1011FF9FC((uint64_t)v5, v4, (uint64_t)sub_1011FEE6C, self->_dmBufferSize, (uint64_t)self);
    value = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = v5;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v7 = sub_100FD4930();
    sub_1006DCB40( v7,  0,  (uint64_t)self->_accessoryDeviceMotionDispatcher.__ptr_.__value_,  self->_headsetDMupdateInterval);
    id v8 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v9 = (Dispatcher *)operator new(0x48uLL);
    *(void *)v9 = off_1018A2210;
    *(void *)v9 = off_1018A3208;
    *((void *)v9 + 1) = 0LL;
    id v10 = v8;
    *((void *)v9 + 5) = 0LL;
    *((void *)v9 + 2) = v10;
    *((void *)v9 + 3) = sub_1011FEE80;
    *((void *)v9 + 4) = self;
    *((void *)v9 + 6) = 0LL;
    objc_super v11 = operator new[](0x70uLL);
    *(_OWORD *)objc_super v11 = xmmword_1013E4980;
    v11[4] = 0;
    sub_1010DDBC0((void *)v11 + 3, "N/A");
    sub_1010DDBC0((void *)v11 + 6, "N/A");
    *((void *)v11 + 9) = 0LL;
    *((void *)v11 + 10) = 0LL;
    v11[22] = 1065353216;
    *((void *)v11 + 12) = 0LL;
    *((void *)v11 + 13) = 0x3F80000000000000LL;
    *((void *)v9 + 7) = v11 + 4;
    *((void *)v9 + 8) = &_mh_execute_header;
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2020000000LL;
    char v17 = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472LL;
    aBlock[2] = sub_1011FFDAC;
    aBlock[3] = &unk_10182EFC8;
    aBlock[4] = v16;
    *((void *)v9 + 5) = _Block_copy(aBlock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1011FFDC0;
    v14[3] = &unk_10182EFF0;
    v14[4] = v16;
    *((void *)v9 + 6) = _Block_copy(v14);
    _Block_object_dispose(v16, 8);
    v12 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = v9;
    if (v12) {
      (*(void (**)(Dispatcher *))(*(void *)v12 + 8LL))(v12);
    }
    uint64_t v13 = sub_100FD4930();
    sub_1006DCB40(v13, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_, -1.0);
  }

- (void)teardownListeners
{
  if (self->_accessoryDeviceMotionDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_100FD4930();
    sub_1006DD2A0(v3, 0, (uint64_t)self->_accessoryDeviceMotionDispatcher.__ptr_.__value_);
    value = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A31A0);
    }
    v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Tearing down accessory DM", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A31A0);
      }
      v14[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Tearing down accessory DM",  v14,  2);
      id v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMHeadsetDeviceMotion teardownListeners]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  if (self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_)
  {
    uint64_t v6 = sub_100FD4930();
    sub_1006DD2A0(v6, 1, (uint64_t)self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_);
    uint64_t v7 = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
    self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0LL;
    if (v7) {
      (*(void (**)(Dispatcher *))(*(void *)v7 + 8LL))(v7);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A31A0);
    }
    id v8 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Tearing down accessory DM config", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A31A0);
      }
      v14[0] = 0;
      LODWORD(v13) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Tearing down accessory DM config",  v14,  v13);
      v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMHeadsetDeviceMotion teardownListeners]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }
  }

- (void)onAccessoryDeviceMotionData:(const void *)a3 buffersize:(unsigned int)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && a4 && *((_BYTE *)ptr + 136))
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 144LL * a4;
    do
    {
      ++self->_sampleCount;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"HeadsetDMIsPresent");
      sub_101125260(v36);
      sub_1011392DC(v36);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v39 |= 1u;
      CFAbsoluteTime v38 = Current;
      sub_1010F2F4C(v37);
      uint64_t v10 = *(void *)(v37 + 72);
      uint64_t v11 = *(void *)((char *)a3 + v7 + 64);
      *(_BYTE *)(v10 + 152) |= 2u;
      *(void *)(v10 + 136) = v11;
      -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"HeadsetDMLastTimestamp");
      __int128 __src = *(_OWORD *)((char *)a3 + v7);
      sub_10004C5F8((char *)(*(void *)(v37 + 72) + 56LL), (char *)&__src, (uint64_t)&v41, 4uLL);
      *(void *)&__int128 __src = *(void *)((char *)a3 + v7 + 16);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 24);
      sub_10004C5F8((char *)(*(void *)(v37 + 72) + 80LL), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      *(void *)&__int128 __src = *(void *)((char *)a3 + v7 + 28);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 36);
      sub_10004C5F8((char *)(*(void *)(v37 + 72) + 32LL), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      *(void *)&__int128 __src = *(void *)((char *)a3 + v7 + 40);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 48);
      sub_10004C5F8((char *)(*(void *)(v37 + 72) + 104LL), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      uint64_t v12 = *(void *)(v37 + 72);
      int v13 = *(unsigned __int16 *)((char *)a3 + v7 + 52);
      *(_BYTE *)(v12 + 152) |= 4u;
      *(_DWORD *)(v12 + 144) = v13;
      uint64_t v14 = *(void *)(v37 + 72);
      uint64_t v15 = *(void *)((char *)a3 + v7 + 56);
      *(_BYTE *)(v14 + 152) |= 1u;
      *(void *)(v14 + 128) = v15;
      *(void *)&__int128 __src = *(void *)((char *)a3 + v7 + 80);
      DWORD2(__src) = *(_DWORD *)((char *)a3 + v7 + 88);
      sub_10004C5F8((char *)(v37 + 8), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      uint64_t v16 = v37;
      char v17 = (char *)a3 + v7;
      int v18 = *(_DWORD *)((char *)a3 + v7 + 92);
      *(_WORD *)(v37 + 116) |= 0x40u;
      *(_DWORD *)(v16 + 96) = v18;
      uint64_t v19 = v37;
      int v20 = *(_DWORD *)((char *)a3 + v7 + 96);
      *(_WORD *)(v37 + 116) |= 0x20u;
      *(_DWORD *)(v19 + 92) = v20;
      uint64_t v21 = v37;
      int v22 = *(_DWORD *)((char *)a3 + v7 + 100);
      *(_WORD *)(v37 + 116) |= 0x100u;
      *(_DWORD *)(v21 + 104) = v22;
      uint64_t v23 = v37;
      else {
        int v24 = 2;
      }
      *(_WORD *)(v37 + 116) |= 0x10u;
      *(_DWORD *)(v23 + 88) = v24;
      uint64_t v25 = v37;
      int v26 = *((_DWORD *)v17 + 27);
      *(_WORD *)(v37 + 116) |= 0x200u;
      *(_DWORD *)(v25 + 108) = v26;
      uint64_t v27 = v37;
      uint64_t v28 = *((void *)v17 + 14);
      *(_WORD *)(v37 + 116) |= 1u;
      *(void *)(v27 + 56) = v28;
      uint64_t v29 = v37;
      float v30 = *((double *)v17 + 9);
      *(_WORD *)(v37 + 116) |= 8u;
      *(float *)(v29 + 84) = v30;
      uint64_t v31 = v37;
      float v32 = *((double *)v17 + 15);
      *(_WORD *)(v37 + 116) |= 0x80u;
      *(float *)(v31 + 100) = v32;
      uint64_t v33 = v37;
      LOBYTE(v28) = v17[143];
      *(_WORD *)(v37 + 116) |= 0x400u;
      *(_BYTE *)(v33 + 112) = v28;
      if (v17[140])
      {
        *(void *)&__int128 __src = *((void *)v17 + 16);
        DWORD2(__src) = *((_DWORD *)v17 + 34);
        sub_10004C5F8((char *)(v37 + 32), (char *)&__src, (uint64_t)&__src + 12, 3uLL);
      }

      if (v17[142])
      {
        uint64_t v34 = v37;
        int v35 = *((unsigned __int8 *)a3 + v7 + 141);
        *(_WORD *)(v37 + 116) |= 4u;
        *(_DWORD *)(v34 + 80) = v35;
      }

      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v36);
      sub_101127D00((PB::Base *)v36);
      v7 += 144LL;
    }

    while (v8 != v7);
  }

- (void)onAccessoryDeviceMotionConfig:(const void *)a3 buffersize:(unsigned int)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && a4 && *((_BYTE *)ptr + 136))
  {
    uint64_t v6 = a4;
    uint64_t v7 = (char *)a3 + 80;
    do
    {
      sub_101125260(v14);
      sub_10113B2B0(v14);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v17 |= 1u;
      CFAbsoluteTime v16 = Current;
      sub_1010E4A40(v15);
      uint64_t v9 = v15[4];
      int v10 = *((_DWORD *)v7 - 20);
      *(_BYTE *)(v9 + 32) |= 2u;
      *(_DWORD *)(v9 + 28) = v10;
      sub_1008D2030(v15[4], (std::string *)v7 - 3);
      sub_1008D2070(v15[4], (std::string *)v7 - 2);
      uint64_t v11 = v15[4];
      int v12 = *((_DWORD *)v7 - 6);
      *(_BYTE *)(v11 + 32) |= 1u;
      *(_DWORD *)(v11 + 24) = v12;
      int v13 = v15;
      LOBYTE(v12) = *((_BYTE *)v7 - 4);
      *((_BYTE *)v15 + 44) |= 1u;
      *((_BYTE *)v13 + 40) = v12;
      __int128 __src = *v7;
      sub_10004C5F8((char *)v15 + 8, (char *)&__src, (uint64_t)&v19, 4uLL);
      sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v14);
      sub_101127D00((PB::Base *)v14);
      v7 += 6;
      --v6;
    }

    while (v6);
  }

- (int)getSampleCount
{
  return self->_sampleCount;
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)dealloc
{
  self->_metadata = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLWMHeadsetDeviceMotion;
  -[CLWMBase dealloc](&v7, "dealloc");
  if (qword_101934670 != -1) {
    dispatch_once(&qword_101934670, &stru_1018A31A0);
  }
  uint64_t v3 = (os_log_s *)qword_101934678;
  if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLWMHeadsetDeviceMotion deallocation is complete",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A31A0);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  0LL,  "CLWMHeadsetDeviceMotion deallocation is complete",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMHeadsetDeviceMotion dealloc]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

- (void).cxx_destruct
{
  value = self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionConfigDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
  }
  id v4 = self->_accessoryDeviceMotionDispatcher.__ptr_.__value_;
  self->_accessoryDeviceMotionDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Dispatcher *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 4) = 0LL;
  *((void *)self + 5) = 0LL;
  return self;
}

@end