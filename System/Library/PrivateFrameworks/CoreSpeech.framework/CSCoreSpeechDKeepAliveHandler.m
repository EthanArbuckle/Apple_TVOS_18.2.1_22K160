@interface CSCoreSpeechDKeepAliveHandler
+ (id)keepAliveDirectory;
+ (id)keepAlivePath;
- (BOOL)_coreSpeechDaemonKeepAlived;
- (CSCoreSpeechDKeepAliveHandler)init;
- (void)_enableCoreSpeechDaemonKeepAlive;
- (void)start;
@end

@implementation CSCoreSpeechDKeepAliveHandler

- (CSCoreSpeechDKeepAliveHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSCoreSpeechDKeepAliveHandler;
  return -[CSCoreSpeechDKeepAliveHandler init](&v3, "init");
}

- (void)start
{
  if ((CSIsHorseman(self, a2) & 1) != 0
    || (id v3 = +[CSUtils isExclaveHardware](&OBJC_CLASS___CSUtils, "isExclaveHardware"), (_DWORD)v3)
    && CSHasAOP(v3))
  {
    -[CSCoreSpeechDKeepAliveHandler _enableCoreSpeechDaemonKeepAlive](self, "_enableCoreSpeechDaemonKeepAlive");
  }

- (void)_enableCoreSpeechDaemonKeepAlive
{
  if (!-[CSCoreSpeechDKeepAliveHandler _coreSpeechDaemonKeepAlived](self, "_coreSpeechDaemonKeepAlived"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[CSCoreSpeechDKeepAliveHandler keepAliveDirectory]( &OBJC_CLASS___CSCoreSpeechDKeepAliveHandler,  "keepAliveDirectory"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSCoreSpeechDKeepAliveHandler keepAlivePath]( &OBJC_CLASS___CSCoreSpeechDKeepAliveHandler,  "keepAlivePath"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v5 = [v4 fileExistsAtPath:v2];

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v16 = 0LL;
      unsigned __int8 v7 = [v6 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v16];
      id v8 = v16;

      if ((v7 & 1) == 0)
      {
        v14 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v11 = v14;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
          *(_DWORD *)buf = 136315650;
          v18 = "-[CSCoreSpeechDKeepAliveHandler _enableCoreSpeechDaemonKeepAlive]";
          __int16 v19 = 2114;
          v20 = v2;
          __int16 v21 = 2114;
          v22 = v12;
          _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Cannot create directory at : %{public}@ : %{public}@",  buf,  0x20u);
          goto LABEL_14;
        }

- (BOOL)_coreSpeechDaemonKeepAlived
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSCoreSpeechDKeepAliveHandler keepAlivePath]( &OBJC_CLASS___CSCoreSpeechDKeepAliveHandler,  "keepAlivePath"));
  unsigned int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    unsigned __int8 v5 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[CSCoreSpeechDKeepAliveHandler keepAlivePath]( &OBJC_CLASS___CSCoreSpeechDKeepAliveHandler,  "keepAlivePath"));
      int v9 = 136315394;
      v10 = "-[CSCoreSpeechDKeepAliveHandler _coreSpeechDaemonKeepAlived]";
      __int16 v11 = 2114;
      v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s KeepAlive file %{public}@ already existing",  (uint8_t *)&v9,  0x16u);
    }
  }

  return v4;
}

+ (id)keepAliveDirectory
{
  if (CSIsSimulator(a1, a2))
  {
    v2 = NSHomeDirectory();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Library/VoiceTrigger"]);
  }

  else
  {
    unsigned int v4 = @"/var/mobile/Library/VoiceTrigger";
  }

  return v4;
}

+ (id)keepAlivePath
{
  if (CSIsSimulator(a1, a2))
  {
    v2 = NSHomeDirectory();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    unsigned int v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"Library/VoiceTrigger/KeepAlive"]);
  }

  else
  {
    unsigned int v4 = @"/var/mobile/Library/VoiceTrigger/KeepAlive";
  }

  return v4;
}

@end