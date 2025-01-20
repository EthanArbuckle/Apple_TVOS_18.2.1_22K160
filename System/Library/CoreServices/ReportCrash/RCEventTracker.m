@interface RCEventTracker
- (RCEventTracker)init;
- (int)total_count;
- (int64_t)increment:(const char *)a3;
- (void)decrement:(const char *)a3;
- (void)waitForAll;
@end

@implementation RCEventTracker

- (RCEventTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RCEventTracker;
  return -[RCEventTracker initWithCondition:](&v3, "initWithCondition:", 0LL);
}

- (int64_t)increment:(const char *)a3
{
  id v5 = -[RCEventTracker condition](self, "condition");
  id v6 = v5;
  else {
    int64_t v7 = 1LL;
  }
  ++LODWORD(self->txn);
  if (!self->super._priv)
  {
    v8 = (void *)os_transaction_create("ReportCrash.log.generation");
    priv = self->super._priv;
    self->super._priv = v8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    v12 = a3;
    __int16 v13 = 2048;
    id v14 = v6;
    __int16 v15 = 2048;
    int64_t v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s condition bump %ld -> %ld",  (uint8_t *)&v11,  0x20u);
  }

  -[RCEventTracker unlockWithCondition:](self, "unlockWithCondition:", v7);
  return v7;
}

- (void)decrement:(const char *)a3
{
  id v5 = (char *)-[RCEventTracker condition](self, "condition");
  id v6 = v5;
  else {
    int64_t v7 = v5 - 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    v10 = a3;
    __int16 v11 = 2048;
    v12 = v6;
    __int16 v13 = 2048;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s condition decrement %ld -> %ld",  (uint8_t *)&v9,  0x20u);
  }

  if (!v7)
  {
    priv = self->super._priv;
    self->super._priv = 0LL;
  }

  -[RCEventTracker unlockWithCondition:](self, "unlockWithCondition:", v7);
}

- (void)waitForAll
{
}

- (int)total_count
{
  return (int)self->txn;
}

- (void).cxx_destruct
{
}

@end