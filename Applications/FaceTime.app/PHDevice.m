@interface PHDevice
+ (BOOL)isGeminiCapable;
+ (id)currentDevice;
- (BOOL)fetchCellularRadioEnabled;
- (BOOL)fetchRingerSwitchEnabled;
- (BOOL)isCellularRadioEnabled;
- (BOOL)isRingerSwitchEnabled;
- (BOOL)proximitySensorState;
- (OS_dispatch_queue)dispatchQueue;
- (PHDevice)init;
- (RadiosPreferences)radiosPreferences;
- (UIImage)audioRouteGlyphImage;
- (int)ringerStateNotifyToken;
- (unint64_t)stateForNotifyToken:(int)a3;
- (void)airplaneModeChanged;
- (void)dealloc;
- (void)registerForRingerStateNotifications;
- (void)setCellularRadioEnabled:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setProximitySensorState:(BOOL)a3;
- (void)setRadiosPreferences:(id)a3;
- (void)setRingerStateNotifyToken:(int)a3;
- (void)setRingerSwitchEnabled:(BOOL)a3;
- (void)unregisterForRingerStateNotifications;
@end

@implementation PHDevice

+ (id)currentDevice
{
  if (qword_1001168A0 != -1) {
    dispatch_once(&qword_1001168A0, &stru_1000F69B8);
  }
  return (id)qword_100116898;
}

+ (BOOL)isGeminiCapable
{
  if (qword_1001168B0 != -1) {
    dispatch_once(&qword_1001168B0, &stru_1000F69D8);
  }
  return byte_1001168A8;
}

- (PHDevice)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PHDevice;
  v2 = -[PHDevice init](&v9, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PHDevice.serialQueue", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ringerStateNotifyToken = -1;
    v2->_ringerSwitchEnabled = 0;
    -[PHDevice registerForRingerStateNotifications](v2, "registerForRingerStateNotifications");
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](v2, "dispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000712C;
    block[3] = &unk_1000F6930;
    v8 = v2;
    dispatch_barrier_async(v5, block);
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PHDevice;
  -[PHDevice dealloc](&v4, "dealloc");
}

- (BOOL)isCellularRadioEnabled
{
  v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000072DC;
  v5[3] = &unk_1000F6A00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setCellularRadioEnabled:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000736C;
  v6[3] = &unk_1000F6A28;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

- (BOOL)isRingerSwitchEnabled
{
  v2 = self;
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000074E8;
  v5[3] = &unk_1000F6A00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setRingerSwitchEnabled:(BOOL)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007578;
  v6[3] = &unk_1000F6A28;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

- (UIImage)audioRouteGlyphImage
{
  return (UIImage *)+[UIImage currentDeviceRouteGlyphForDisplayStyle:]( &OBJC_CLASS___UIImage,  "currentDeviceRouteGlyphForDisplayStyle:",  0LL);
}

- (RadiosPreferences)radiosPreferences
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100007728;
  v11 = sub_100007738;
  id v12 = 0LL;
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100007740;
  v6[3] = &unk_1000F6A00;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RadiosPreferences *)v4;
}

- (BOOL)fetchCellularRadioEnabled
{
  return -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode") ^ 1;
}

- (BOOL)fetchRingerSwitchEnabled
{
  return -[PHDevice stateForNotifyToken:]( self,  "stateForNotifyToken:",  -[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken")) != 0;
}

- (void)registerForRingerStateNotifications
{
  if (-[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken") == -1)
  {
    objc_initWeak(&location, self);
    dispatch_queue_t v3 = (const char *)[@"com.apple.springboard.ringerstate" UTF8String];
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PHDevice dispatchQueue](self, "dispatchQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100007898;
    v5[3] = &unk_1000F6A50;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &self->_ringerStateNotifyToken, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

- (void)unregisterForRingerStateNotifications
{
  if (-[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken") != -1)
  {
    notify_cancel(-[PHDevice ringerStateNotifyToken](self, "ringerStateNotifyToken"));
    -[PHDevice setRingerStateNotifyToken:](self, "setRingerStateNotifyToken:", 0xFFFFFFFFLL);
  }

- (unint64_t)stateForNotifyToken:(int)a3
{
  uint64_t state64 = 0LL;
  if (a3 == -1) {
    return 0LL;
  }
  notify_get_state(a3, &state64);
  return state64;
}

- (void)airplaneModeChanged
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setRadiosPreferences:(id)a3
{
}

- (int)ringerStateNotifyToken
{
  return self->_ringerStateNotifyToken;
}

- (void)setRingerStateNotifyToken:(int)a3
{
  self->_ringerStateNotifyToken = a3;
}

- (BOOL)proximitySensorState
{
  return self->_proximitySensorState;
}

- (void)setProximitySensorState:(BOOL)a3
{
  self->_proximitySensorState = a3;
}

- (void).cxx_destruct
{
}

@end