@interface CLMiLoBluetoothClient
- (CBAdvertiser)advertiser;
- (CLMiLoBluetoothClient)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (void)_startAdvertising;
- (void)dealloc;
- (void)setAdvertiser:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CLMiLoBluetoothClient

- (CLMiLoBluetoothClient)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLMiLoBluetoothClient;
  v4 = -[CLMiLoBluetoothClient init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    -[CLMiLoBluetoothClient _startAdvertising](v4, "_startAdvertising");
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMiLoBluetoothClient;
  -[CLMiLoBluetoothClient dealloc](&v3, "dealloc");
}

- (void)_startAdvertising
{
  if (!-[CLMiLoBluetoothClient advertiser](self, "advertiser"))
  {
    if (qword_1019348D0 != -1) {
      dispatch_once(&qword_1019348D0, &stru_1018738E0);
    }
    objc_super v3 = (os_log_s *)qword_1019348D8;
    if (os_log_type_enabled((os_log_t)qword_1019348D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#ble, startAdvertising", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019348D0 != -1) {
        dispatch_once(&qword_1019348D0, &stru_1018738E0);
      }
      LOWORD(v14[0]) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019348D8,  2LL,  "#ble, startAdvertising",  v14,  2);
      v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMiLoBluetoothClient _startAdvertising]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    -[CLMiLoBluetoothClient setAdvertiser:](self, "setAdvertiser:", objc_alloc_init(&OBJC_CLASS___CBAdvertiser));
    -[CBAdvertiser setDispatchQueue:]( -[CLMiLoBluetoothClient advertiser](self, "advertiser"),  "setDispatchQueue:",  -[CLMiLoBluetoothClient queue](self, "queue"));
    sub_1002F0B04(buf);
    CFStringRef v4 = CFStringCreateWithCStringNoCopy(0LL, "MicroLocationsBleAdvertiseRate", 0x8000100u, kCFAllocatorNull);
    int v5 = sub_1002A7D20(*(uint64_t *)buf, (uint64_t)v4, v14);
    CFRelease(v4);
    unsigned int v6 = v14[0];
    objc_super v7 = v16;
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        unint64_t v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

    if (v5) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = 40LL;
    }
    -[CBAdvertiser setAdvertiseRate:](-[CLMiLoBluetoothClient advertiser](self, "advertiser"), "setAdvertiseRate:", v10);
    -[CBAdvertiser setNearbyInfoV2DecryptedFlags:]( -[CLMiLoBluetoothClient advertiser](self, "advertiser"),  "setNearbyInfoV2DecryptedFlags:",  4LL);
    -[CBAdvertiser setUseCase:](-[CLMiLoBluetoothClient advertiser](self, "advertiser"), "setUseCase:", 524290LL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100B6D860;
    v13[3] = &unk_101830628;
    v13[4] = self;
    -[CBAdvertiser activateWithCompletion:]( -[CLMiLoBluetoothClient advertiser](self, "advertiser"),  "activateWithCompletion:",  v13);
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (CBAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
}

@end