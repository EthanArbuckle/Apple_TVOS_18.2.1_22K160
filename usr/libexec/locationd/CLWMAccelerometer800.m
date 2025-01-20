@interface CLWMAccelerometer800
- (CLWMAccelerometer800)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)onAccelerometer800Data:(const void *)a3 count:(unsigned int)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMAccelerometer800

- (CLWMAccelerometer800)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLWMAccelerometer800;
  v7 = -[CLWMBase init](&v10, "init", a3, a4, a5);
  v8 = v7;
  if (v7)
  {
    v7->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v7->_universe = (CLIntersiloUniverse *)a4;
    v7->_metadata = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v8->_sampleCount = 0;
  }

  return v8;
}

- (void)setupListener
{
  if (!self->_accel800Dispatcher.__ptr_.__value_)
  {
    id v3 = -[CLWorkoutRecordingDelegate silo](self->_delegate, "silo");
    v4 = (Dispatcher *)operator new(0x48uLL);
    sub_101212380((uint64_t)v4, v3, (uint64_t)sub_101211ED4, 0x10u, (uint64_t)self);
    value = self->_accel800Dispatcher.__ptr_.__value_;
    self->_accel800Dispatcher.__ptr_.__value_ = v4;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    uint64_t v6 = sub_1008FA854(0);
    sub_1006DCB40(v6, 15, (uint64_t)self->_accel800Dispatcher.__ptr_.__value_, -1.0);
  }

- (void)teardownListeners
{
  if (self->_accel800Dispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_1008FA854(0);
    sub_1006DD2A0(v3, 15, (uint64_t)self->_accel800Dispatcher.__ptr_.__value_);
    value = self->_accel800Dispatcher.__ptr_.__value_;
    self->_accel800Dispatcher.__ptr_.__value_ = 0LL;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8LL))(value);
    }
    if (qword_101934670 != -1) {
      dispatch_once(&qword_101934670, &stru_1018A3AC8);
    }
    v5 = (os_log_s *)qword_101934678;
    if (os_log_type_enabled((os_log_t)qword_101934678, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Recording fast accelerometer stopped.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934670 != -1) {
        dispatch_once(&qword_101934670, &stru_1018A3AC8);
      }
      v8[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934678,  2LL,  "Recording fast accelerometer stopped.",  v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWMAccelerometer800 teardownListeners]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

- (void)dealloc
{
  self->_metadata = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMAccelerometer800;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (id)metadata
{
  return -[NSMutableDictionary copy](self->_metadata, "copy");
}

- (void)onAccelerometer800Data:(const void *)a3 count:(unsigned int)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 136))
    {
      LODWORD(v5) = a4;
      ++self->_sampleCount;
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_metadata,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"ContainsFastAccelData");
      if ((_DWORD)v5)
      {
        uint64_t v8 = *(void *)((char *)a3 + 224 * (v5 - 1) + 33);
        uint64_t v5 = v5;
        v9 = (char *)a3 + 33;
        do
        {
          sub_101125260(v17);
          -[CLWMBase makeSafeCFAbsoluteTime:](self, "makeSafeCFAbsoluteTime:", CFAbsoluteTimeGetCurrent());
          v19 |= 1u;
          v17[77] = v10;
          sub_101139330(v17);
          sub_101082C6C(v18);
          v11 = v18;
          double v12 = *(double *)((char *)v9 - 25) + (double)(unint64_t)(v8 - *v9) / -1000000.0;
          uint64_t v13 = v18[1];
          *(_BYTE *)(v13 + 32) |= 1u;
          *(double *)(v13 + 8) = v12;
          uint64_t v14 = v11[1];
          LODWORD(v12) = *((_DWORD *)v9 - 4);
          *(_BYTE *)(v14 + 32) |= 4u;
          *(_DWORD *)(v14 + 20) = LODWORD(v12);
          uint64_t v15 = v11[1];
          LODWORD(v12) = *((_DWORD *)v9 - 3);
          *(_BYTE *)(v15 + 32) |= 8u;
          *(_DWORD *)(v15 + 24) = LODWORD(v12);
          uint64_t v16 = v11[1];
          LODWORD(v12) = *((_DWORD *)v9 - 2);
          *(_BYTE *)(v16 + 32) |= 0x10u;
          *(_DWORD *)(v16 + 28) = LODWORD(v12);
          sub_10111D6A8((uint64_t)self->_writer.__ptr_, (uint64_t)v17);
          sub_101127D00((PB::Base *)v17);
          v9 += 28;
          --v5;
        }

        while (v5);
      }
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
  value = self->_accel800Dispatcher.__ptr_.__value_;
  self->_accel800Dispatcher.__ptr_.__value_ = 0LL;
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