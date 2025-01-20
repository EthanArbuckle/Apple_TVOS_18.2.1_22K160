@interface RMHeadphoneActivityProvider
- (id)startProducingDataWithCallback:(id)a3;
- (void)stopProducingData;
@end

@implementation RMHeadphoneActivityProvider

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___RMAudioAccessoryManager);
  sub_100003CEC((uint64_t)self, v5);

  +[CMAudioAccessoryManager _isAvailable](&OBJC_CLASS___CMAudioAccessoryManager, "_isAvailable");
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100007C94;
  v13 = &unk_10001C970;
  v14 = self;
  id v15 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(&v10);
  if (self) {
    audioAccessoryManager = self->_audioAccessoryManager;
  }
  else {
    audioAccessoryManager = 0LL;
  }
  -[RMAudioAccessoryManager startActivityUpdatesWithHandler:]( audioAccessoryManager,  "startActivityUpdatesWithHandler:",  v7,  v10,  v11,  v12,  v13,  v14);

  return 0LL;
}

- (void)stopProducingData
{
  if (self)
  {
    -[RMAudioAccessoryManager stopActivityUpdates](self->_audioAccessoryManager, "stopActivityUpdates");
    sub_100003CEC((uint64_t)self, 0LL);
    objc_setProperty_atomic(self, v3, 0LL, 24LL);
  }

  else
  {
    [0 stopActivityUpdates];
    sub_100003CEC(0LL, 0LL);
  }

- (void).cxx_destruct
{
}

@end