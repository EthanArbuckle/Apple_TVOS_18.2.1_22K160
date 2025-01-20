@interface CSAudioPowerServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)listen;
@end

@implementation CSAudioPowerServiceListener

- (void)listen
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", CSAudioPowerServiceName);
  listener = self->_listener;
  self->_listener = v4;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
  v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[CSAudioPowerServiceListener listen]";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s CSAudioPowerXPCListener start listening",  (uint8_t *)&v7,  0xCu);
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
      v17 = "-[CSAudioPowerServiceListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s we got unknown types of XPC connection request",  (uint8_t *)&v16,  0xCu);
    }

    goto LABEL_9;
  }

  uint64_t XPCInterface = CSAudioPowerServiceGetXPCInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
  [v7 setExportedInterface:v10];

  if ((+[CSUtils xpcConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "xpcConnection:hasEntitlement:",  v7,  @"siri.audiopowerupdate.xpc") & 1) == 0)
  {
    [v7 invalidate];
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }

  exportedObject = self->_exportedObject;
  if (!exportedObject)
  {
    v12 = (CSAudioPowerProvider *)objc_claimAutoreleasedReturnValue( +[CSAudioPowerProvider sharedInstance]( &OBJC_CLASS___CSAudioPowerProvider,  "sharedInstance"));
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