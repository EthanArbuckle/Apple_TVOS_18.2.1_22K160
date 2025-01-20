@interface CSXPCClientFactory
+ (id)defaultFactory;
- (id)clientForAudioProviding;
- (id)clientForAudioSessionInfoProviding;
- (id)clientForFallbackAudioSessionReleaseProviding;
- (id)clientForMacOSDuckAudioDevice;
- (id)clientForSmartSiriVolumeProviding;
@end

@implementation CSXPCClientFactory

- (id)clientForAudioProviding
{
  return -[CSXPCClient initWithType:](objc_alloc(&OBJC_CLASS___CSXPCClient), "initWithType:", 1LL);
}

- (id)clientForAudioSessionInfoProviding
{
  return -[CSXPCClient initWithType:](objc_alloc(&OBJC_CLASS___CSXPCClient), "initWithType:", 2LL);
}

- (id)clientForSmartSiriVolumeProviding
{
  return -[CSXPCClient initWithType:](objc_alloc(&OBJC_CLASS___CSXPCClient), "initWithType:", 3LL);
}

- (id)clientForMacOSDuckAudioDevice
{
  return -[CSXPCClient initWithType:](objc_alloc(&OBJC_CLASS___CSXPCClient), "initWithType:", 4LL);
}

- (id)clientForFallbackAudioSessionReleaseProviding
{
  return -[CSXPCClient initWithType:](objc_alloc(&OBJC_CLASS___CSXPCClient), "initWithType:", 6LL);
}

+ (id)defaultFactory
{
  if (qword_10027FBC8 != -1) {
    dispatch_once(&qword_10027FBC8, &stru_10022A080);
  }
  return (id)qword_10027FBD0;
}

@end