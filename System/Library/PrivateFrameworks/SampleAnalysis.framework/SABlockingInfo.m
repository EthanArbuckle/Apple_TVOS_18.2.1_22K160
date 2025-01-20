@interface SABlockingInfo
- (BOOL)hasMatchingBlocker:(id)a3;
- (NSString)portName;
- (SABlockingInfo)init;
- (id)_init;
- (int)blockingPid;
- (unint64_t)blockingTid;
- (unint64_t)portDomain;
- (unint64_t)portFlags;
@end

@implementation SABlockingInfo

- (SABlockingInfo)init
{
  int v2 = *__error();
  _sa_logt();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl( &dword_186C92000,  v3,  OS_LOG_TYPE_ERROR,  "Must use a subclass of SABlockingInfo, not SABlockingInfo directly",  v11,  2u);
  }

  *__error() = v2;
  _SASetCrashLogMessage( 1848,  "Must use a subclass of SABlockingInfo, not SABlockingInfo directly",  v4,  v5,  v6,  v7,  v8,  v9,  v11[0]);
  result = (SABlockingInfo *)_os_crash();
  __break(1u);
  return result;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SABlockingInfo;
  return -[SABlockingInfo init](&v3, sel_init);
}

- (unint64_t)blockingTid
{
  int v3 = *__error();
  _sa_logt();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(self);
    _os_log_error_impl( &dword_186C92000,  v4,  OS_LOG_TYPE_ERROR,  "SABlockingInfo subclass %s doesn't implement blockingTid",  buf,  0xCu);
  }

  *__error() = v3;
  char v5 = object_getClassName(self);
  _SASetCrashLogMessage(1856, "SABlockingInfo subclass %s doesn't implement blockingTid", v6, v7, v8, v9, v10, v11, v5);
  unint64_t result = _os_crash();
  __break(1u);
  return result;
}

- (int)blockingPid
{
  int v3 = *__error();
  _sa_logt();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(self);
    _os_log_error_impl( &dword_186C92000,  v4,  OS_LOG_TYPE_ERROR,  "SABlockingInfo subclass %s doesn't implement blockingPid",  buf,  0xCu);
  }

  *__error() = v3;
  char v5 = object_getClassName(self);
  _SASetCrashLogMessage(1860, "SABlockingInfo subclass %s doesn't implement blockingPid", v6, v7, v8, v9, v10, v11, v5);
  int result = _os_crash();
  __break(1u);
  return result;
}

- (NSString)portName
{
  return 0LL;
}

- (unint64_t)portFlags
{
  return 0LL;
}

- (unint64_t)portDomain
{
  return 0LL;
}

- (BOOL)hasMatchingBlocker:(id)a3
{
  id v5 = a3;
  unint64_t v6 = -[SABlockingInfo blockingTid](self, "blockingTid");
  uint64_t v7 = [v5 blockingTid];
  if (v6 | v7)
  {
    if (v6 != v7)
    {
      char v8 = 0;
      goto LABEL_18;
    }

@end