@interface OSLaunchdJobExitStatus
- (OSLaunchdJobExitStatus)initWithWait4Status:(int)a3 os_reason_namespace:(unsigned int)a4 os_reason_code:(unint64_t)a5 os_reason_flags:(unint64_t)a6;
- (id)description;
- (int)wait4Status;
- (unint64_t)os_reason_code;
- (unint64_t)os_reason_flags;
- (unsigned)os_reason_namespace;
@end

@implementation OSLaunchdJobExitStatus

- (OSLaunchdJobExitStatus)initWithWait4Status:(int)a3 os_reason_namespace:(unsigned int)a4 os_reason_code:(unint64_t)a5 os_reason_flags:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___OSLaunchdJobExitStatus;
  v10 = -[OSLaunchdJobExitStatus init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_os_reason_namespace = a4;
    v10->_wait4Status = a3;
    v10->_os_reason_flags = a6;
    v10->_os_reason_code = a5;
    v12 = v10;
  }

  return v11;
}

- (id)description
{
  uint64_t os_reason_namespace = self->_os_reason_namespace;
  if ((_DWORD)os_reason_namespace) {
    objc_msgSend( NSString,  "stringWithFormat:",  @"exit reason namespace=%u code=%llu",  os_reason_namespace,  self->_os_reason_code);
  }
  else {
    objc_msgSend( NSString,  "stringWithFormat:",  @"wait4() status=%d",  self->_wait4Status,  v4);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)os_reason_flags
{
  return self->_os_reason_flags;
}

- (unsigned)os_reason_namespace
{
  return self->_os_reason_namespace;
}

- (unint64_t)os_reason_code
{
  return self->_os_reason_code;
}

- (int)wait4Status
{
  return self->_wait4Status;
}

@end