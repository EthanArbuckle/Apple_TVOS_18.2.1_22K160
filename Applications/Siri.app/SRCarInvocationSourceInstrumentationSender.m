@interface SRCarInvocationSourceInstrumentationSender
- (SRCarInvocationSourceInstrumentationSender)init;
- (void)sendBTCarInvocationContext;
@end

@implementation SRCarInvocationSourceInstrumentationSender

- (SRCarInvocationSourceInstrumentationSender)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SRCarInvocationSourceInstrumentationSender;
  v2 = -[SRCarInvocationSourceInstrumentationSender init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[SRUIFInstrumentationManager sharedManager](&OBJC_CLASS___SRUIFInstrumentationManager, "sharedManager"));
    manager = v2->_manager;
    v2->_manager = (SRUIFInstrumentationManager *)v3;
  }

  return v2;
}

- (void)sendBTCarInvocationContext
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SISchemaInvocation);
  id v4 = objc_alloc_init(&OBJC_CLASS___SISchemaBluetoothCarInvocationContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bluetoothPreferredCarAudioRoute]);

  if ([v6 isEqualToString:@"A2DP"])
  {
    uint64_t v7 = 1LL;
  }

  else if ([v6 isEqualToString:@"DeviceSpeaker"])
  {
    uint64_t v7 = 2LL;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[SRCarInvocationSourceInstrumentationSender sendBTCarInvocationContext]";
    __int16 v11 = 1024;
    int v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #BTCarInvocationSourceSender The current preferred audio route is: %d",  (uint8_t *)&v9,  0x12u);
  }

  [v4 setRoute:v7];
  [v3 setBluetoothCarInvocationContext:v4];
  -[SRUIFInstrumentationManager emitInstrumentation:](self->_manager, "emitInstrumentation:", v3);
}

- (void).cxx_destruct
{
}

@end