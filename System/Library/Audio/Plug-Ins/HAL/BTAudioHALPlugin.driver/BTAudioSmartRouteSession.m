@interface BTAudioSmartRouteSession
- (BOOL)isForeground;
- (BOOL)isInput;
- (BOOL)isOutput;
- (BTAudioSmartRouteSession)init;
- (BTAudioSmartRouteSession)initWithbundleID:(id)a3;
- (void)dealloc;
- (void)setIsForeground:(BOOL)a3;
- (void)setIsInput:(BOOL)a3;
- (void)setIsOutput:(BOOL)a3;
@end

@implementation BTAudioSmartRouteSession

- (void)dealloc
{
  v3 = (os_log_s *)qword_95A98;
  if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->_bundleID;
    *(_DWORD *)buf = 138412290;
    v7 = bundleID;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Release Bluetooth Smart Route Session in Route Manager %@ ",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteSession;
  -[BTAudioSmartRouteSession dealloc](&v5, "dealloc");
}

- (BTAudioSmartRouteSession)initWithbundleID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteSession;
  v4 = -[BTAudioSmartRouteSession init](&v8, "init");
  objc_super v5 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", a3);
  v4->_bundleID = v5;
  v6 = (os_log_s *)qword_95A98;
  if (os_log_type_enabled((os_log_t)qword_95A98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Initialize Bluetooth Audio Smart Route Session in Route Manager %@ ",  buf,  0xCu);
  }

  return v4;
}

- (BTAudioSmartRouteSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BTAudioSmartRouteSession;
  return -[BTAudioSmartRouteSession init](&v3, "init");
}

- (BOOL)isInput
{
  return self->_isInput;
}

- (void)setIsInput:(BOOL)a3
{
  self->_isInput = a3;
}

- (BOOL)isOutput
{
  return self->_isOutput;
}

- (void)setIsOutput:(BOOL)a3
{
  self->_isOutput = a3;
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setIsForeground:(BOOL)a3
{
  self->_isForeground = a3;
}

@end