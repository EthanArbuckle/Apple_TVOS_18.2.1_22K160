@interface ESListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ESListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener _UUID](&OBJC_CLASS___NSXPCListener, "_UUID"));
  v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &unk_100049460);
  unsigned int v7 = [v5 isEqual:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.siri.embeddedspeech"]);
  v9 = v8;
  if (!v7)
  {
    if (v8)
    {
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.des-service"]);

      if (!v13)
      {
        NSLog( @"Rejecting %@, no %@ or %@ entitlement",  v4,  @"com.apple.siri.embeddedspeech",  @"com.apple.private.des-service");
        goto LABEL_11;
      }
    }

    v12 = -[ESConnection initWithXPCConnection:](objc_alloc(&OBJC_CLASS___ESConnection), "initWithXPCConnection:", v4);
    uint64_t XPCInterface = CESRSpeechServiceGetXPCInterface();
    v15 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
    [v4 setExportedInterface:v15];

    uint64_t v16 = CESRSpeechServiceDelegateGetXPCInterface([v4 setExportedObject:v12]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v4 setRemoteObjectInterface:v17];

    goto LABEL_9;
  }

  if (!v9)
  {
    NSLog(@"Rejecting %@, no %@ entitlement", v4, @"com.apple.siri.embeddedspeech");
LABEL_11:
    BOOL v18 = 0;
    goto LABEL_12;
  }

  uint64_t v10 = CESRSpeechProfileBuilderServiceGetXPCInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v4 setExportedInterface:v11];

  v12 = -[ESSpeechProfileBuilderConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ESSpeechProfileBuilderConnection),  "initWithXPCConnection:",  v4);
  [v4 setExportedObject:v12];
LABEL_9:

  [v4 resume];
  BOOL v18 = 1;
LABEL_12:

  return v18;
}

@end