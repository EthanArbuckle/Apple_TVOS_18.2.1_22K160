@interface DACLifecycleCoordinator
- (void)dealloc;
@end

@implementation DACLifecycleCoordinator

- (void)dealloc
{
  id v3 = sub_100014610(3);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      messageChannel = self->_messageChannel;
    }
    else {
      messageChannel = 0LL;
    }
    v6 = messageChannel;
    *(_DWORD *)buf = 134218240;
    v10 = self;
    __int16 v11 = 2048;
    v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%p deallocating, dropping message channel %p",  buf,  0x16u);
  }

  v7 = self->_messageChannel;
  self->_messageChannel = 0LL;

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DACLifecycleCoordinator;
  -[DACLifecycleCoordinator dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
}

@end