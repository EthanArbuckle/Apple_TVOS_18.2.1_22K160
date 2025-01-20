@interface AVAudioDeviceTestServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation AVAudioDeviceTestServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.avfaudio.devicetest"]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AVAudioDeviceTestServiceProtocol));
    [v4 setExportedInterface:v7];

    v8 = objc_opt_new(&OBJC_CLASS___AVAudioDeviceTestService);
    [v4 setExportedObject:v8];
    [v4 resume];
  }

  else
  {
    [v4 invalidate];
  }

  return v6;
}

@end