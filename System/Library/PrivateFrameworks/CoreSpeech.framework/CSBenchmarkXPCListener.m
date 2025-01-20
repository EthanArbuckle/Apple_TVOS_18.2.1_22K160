@interface CSBenchmarkXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CSBenchmarkXPCListener)init;
- (void)listen;
@end

@implementation CSBenchmarkXPCListener

- (CSBenchmarkXPCListener)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 isModelBenchmarkingEnabled];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___CSBenchmarkXPCListener;
    self = -[CSBenchmarkXPCListener init](&v7, "init");
    v5 = self;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)listen
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned int v4 = [v3 isModelBenchmarkingEnabled];

  if (v4)
  {
    v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.corespeech.benchmark.xpc");
    listener = self->_listener;
    self->_listener = v5;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
    objc_super v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[CSBenchmarkXPCListener listen]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s CSBenchmarkXPCListener start listening",  (uint8_t *)&v8,  0xCu);
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (self->_listener != v6)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSBenchmarkXPCListener listener:shouldAcceptNewConnection:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s we got unknown types of XPC connection request",  (uint8_t *)&buf,  0xCu);
    }

- (void).cxx_destruct
{
}

@end