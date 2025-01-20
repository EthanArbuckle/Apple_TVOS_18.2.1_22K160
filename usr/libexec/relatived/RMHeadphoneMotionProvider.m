@interface RMHeadphoneMotionProvider
- (id)startProducingDataWithCallback:(id)a3;
- (void)stopProducingData;
@end

@implementation RMHeadphoneMotionProvider

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___RMAudioAccessoryManager);
  sub_100003CFC((uint64_t)self, v5);

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10000BA68;
  v13 = &unk_10001CB10;
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
  -[RMAudioAccessoryManager startDeviceMotionUpdatesWithHandler:]( audioAccessoryManager,  "startDeviceMotionUpdatesWithHandler:",  v7,  v10,  v11,  v12,  v13,  v14);

  return 0LL;
}

- (void)stopProducingData
{
  v2 = self;
  if (self) {
    self = (RMHeadphoneMotionProvider *)self->_audioAccessoryManager;
  }
  -[RMHeadphoneMotionProvider stopDeviceMotionUpdates](self, "stopDeviceMotionUpdates");
  sub_100003CFC((uint64_t)v2, 0LL);
}

- (void).cxx_destruct
{
}

@end