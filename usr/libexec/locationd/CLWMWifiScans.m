@interface CLWMWifiScans
- (CLWMWifiScans)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)dealloc;
- (void)onWifiScanNotification:(const int *)a3 data:(const void *)a4;
- (void)removeAllObjects;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)teardownListeners;
@end

@implementation CLWMWifiScans

- (CLWMWifiScans)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CLWMWifiScans;
  v8 = -[CLWMBase init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLWorkoutRecordingDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    v8->_disableWifiScans = a5->disableWifiScans;
    v8->_wifiLookupTable = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v9->_sampleCount = 0;
  }

  return v9;
}

- (void)setupListener
{
  v3 = v6;
  v6 = 0LL;
  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = v6;
    v6 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->_wifiClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
}

- (void)teardownListeners
{
  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (void)dealloc
{
  self->_wifiLookupTable = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMWifiScans;
  -[CLWMBase dealloc](&v3, "dealloc");
}

- (void)removeAllObjects
{
}

- (void)onWifiScanNotification:(const int *)a3 data:(const void *)a4
{
  ptr = self->_writer.__ptr_;
  if (ptr && *((_BYTE *)ptr + 136) && !self->_disableWifiScans)
  {
    ++self->_sampleCount;
    if (*a3 == 3)
    {
      v5 = (void *)*((void *)self->_wifiClient.__ptr_.__value_ + 2);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1012207E0;
      v6[3] = &unk_1018A43A0;
      v6[4] = self;
      objc_msgSend(v5, "fetchScanResultWithReply:", v6, a4);
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
  value = self->_wifiClient.__ptr_.__value_;
  self->_wifiClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  sub_10000AE14((uint64_t)&self->_writer);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 6) = 0LL;
  return self;
}

@end