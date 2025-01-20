@interface DMPluginFaulter
- (DMPluginFaulter)init;
- (NSString)message;
- (OS_os_log)os_log;
- (void)_faultForUnknownPluginIdentifier;
- (void)faultWithPluginIdentifier:(id)a3 message:(id)a4;
- (void)setMessage:(id)a3;
- (void)setOs_log:(id)a3;
@end

@implementation DMPluginFaulter

- (DMPluginFaulter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMPluginFaulter;
  v2 = -[DMPluginFaulter init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = _DMCoreLog();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    -[DMPluginFaulter setOs_log:](v2, "setOs_log:", v4);
  }

  return v2;
}

- (void)faultWithPluginIdentifier:(id)a3 message:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  -[DMPluginFaulter setMessage:](self, "setMessage:", v6);
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMPluginSpecificUtilitiesManager utilitiesForPluginIdentifier:]( &OBJC_CLASS___DMPluginSpecificUtilitiesManager,  "utilitiesForPluginIdentifier:"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMPluginFaulter os_log](self, "os_log"));
      [v7 faultWithLog:v8 message:v6];
    }

    else
    {
      -[DMPluginFaulter _faultForUnknownPluginIdentifier](self, "_faultForUnknownPluginIdentifier");
    }
  }

  else
  {
    -[DMPluginFaulter _faultForUnknownPluginIdentifier](self, "_faultForUnknownPluginIdentifier");
  }
}

- (void)_faultForUnknownPluginIdentifier
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DMPluginFaulter os_log](self, "os_log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_100007F40(self, v3);
  }
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (OS_os_log)os_log
{
  return self->_os_log;
}

- (void)setOs_log:(id)a3
{
}

- (void).cxx_destruct
{
}

@end