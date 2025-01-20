@interface CSOpportuneSpeakListnerTestService
- (CSOpportuneSpeakListnerTestService)init;
- (void)opportuneSpeakListener:(id)a3 didStopUnexpectedly:(BOOL)a4;
- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4;
- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4;
- (void)receiveOpportuneSpeakListenerStart;
- (void)receiveOpportuneSpeakListenerStop;
- (void)start;
@end

@implementation CSOpportuneSpeakListnerTestService

- (CSOpportuneSpeakListnerTestService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSOpportuneSpeakListnerTestService;
  v2 = -[CSOpportuneSpeakListnerTestService init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOpportuneSpeakListnerTestService", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (void)start
{
  p_notifyToken = &self->_notifyToken;
  queue = (dispatch_queue_s *)self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003E3AC;
  handler[3] = &unk_10022EA50;
  handler[4] = self;
  notify_register_dispatch("com.apple.corespeech.opportunelistner.start", &self->_notifyToken, queue, handler);
  v5 = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003E3B4;
  v6[3] = &unk_10022EA50;
  v6[4] = self;
  notify_register_dispatch("com.apple.corespeech.opportunelistner.stop", p_notifyToken, v5, v6);
}

- (void)receiveOpportuneSpeakListenerStart
{
  dispatch_queue_t v3 = objc_alloc_init(&OBJC_CLASS___CSOpportuneSpeakListener);
  listener = self->listener;
  self->listener = v3;

  -[CSOpportuneSpeakListener setDelegate:](self->listener, "setDelegate:", self);
  v5 = objc_alloc_init(&OBJC_CLASS___CSOpportuneSpeakListenerOption);
  -[CSOpportuneSpeakListenerOption setDeviceId:](v5, "setDeviceId:", @"A945B95D-69F6-FC77-4FAE-91F50A039CD8");
  -[CSOpportuneSpeakListener startListenWithOption:completion:]( self->listener,  "startListenWithOption:completion:",  v5,  &stru_10022AEB8);
}

- (void)receiveOpportuneSpeakListenerStop
{
}

- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSOpportuneSpeakListnerTestService opportuneSpeakListener:hasRemoteVADAvailable:]";
    __int16 v8 = 1024;
    BOOL v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s hasRemoteVADAvailable : %d",  (uint8_t *)&v6,  0x12u);
  }

- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSOpportuneSpeakListnerTestService opportuneSpeakListener:hasVADAvailable:]";
    __int16 v8 = 1024;
    BOOL v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s hasVADAvailable : %d", (uint8_t *)&v6, 0x12u);
  }

- (void)opportuneSpeakListener:(id)a3 didStopUnexpectedly:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSOpportuneSpeakListnerTestService opportuneSpeakListener:didStopUnexpectedly:]";
    __int16 v8 = 1024;
    BOOL v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s didStopUnexpectedly : %d",  (uint8_t *)&v6,  0x12u);
  }

- (void).cxx_destruct
{
}

@end