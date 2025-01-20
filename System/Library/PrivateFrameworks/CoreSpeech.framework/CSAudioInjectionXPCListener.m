@interface CSAudioInjectionXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSAudioInjectionXPCListener)init;
- (void)listen;
@end

@implementation CSAudioInjectionXPCListener

- (CSAudioInjectionXPCListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAudioInjectionXPCListener;
  v2 = -[CSAudioInjectionXPCListener init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v4 = -[NSXPCListener initWithMachServiceName:]( v3,  "initWithMachServiceName:",  CSAudioInjectionXPCServiceNameForCoreSpeechDaemon);
    listener = v2->_listener;
    v2->_listener = v4;
  }

  return v2;
}

- (void)listen
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  if ([v3 programmableAudioInjectionEnabled])
  {
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v5 = [v4 exclaveAudioInjectionEnabled];

    if (!v5) {
      return;
    }
  }

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSAudioInjectionXPCListener listen]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s CSAudioInjectionXPCListener start listening",  (uint8_t *)&v7,  0xCu);
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_listener != v6)
  {
    v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[CSAudioInjectionXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s we got unknown types of XPC connection request",  (uint8_t *)&v16,  0xCu);
    }

    goto LABEL_9;
  }

  uint64_t v9 = AudioInjectionXPCGetInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v7 setExportedInterface:v10];

  if ((+[CSUtils xpcConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "xpcConnection:hasEntitlement:",  v7,  @"corespeech.audioinjection.xpc") & 1) == 0)
  {
    [v7 invalidate];
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }

  exportedObject = self->_exportedObject;
  if (!exportedObject)
  {
    v12 = objc_opt_new(&OBJC_CLASS___CSAudioInjectionXPC);
    v13 = self->_exportedObject;
    self->_exportedObject = v12;

    exportedObject = self->_exportedObject;
  }

  [v7 setExportedObject:exportedObject];
  [v7 resume];
  BOOL v14 = 1;
LABEL_10:

  return v14;
}

- (void).cxx_destruct
{
}

@end