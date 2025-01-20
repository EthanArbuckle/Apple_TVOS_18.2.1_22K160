@interface CLTileSyncSyChange
- (NSDictionary)properties;
- (NSString)sequencer;
- (NSString)syncKey;
- (int64_t)changeType;
- (void)dealloc;
- (void)setChangeType:(int64_t)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSyncKey:(id)a3;
@end

@implementation CLTileSyncSyChange

- (void)setObjectIdentifier:(id)a3
{
}

- (NSString)sequencer
{
  return 0LL;
}

- (int64_t)changeType
{
  return 1LL;
}

- (void)setChangeType:(int64_t)a3
{
  if (a3 != 1)
  {
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_10182B5B0);
    }
    v4 = (os_log_s *)qword_101934868;
    if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      int64_t v9 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "@GtsSync, Unexpected change type, %{public}ld, set, #CloneMe",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934860 != -1) {
        dispatch_once(&qword_101934860, &stru_10182B5B0);
      }
      int v6 = 134349056;
      int64_t v7 = a3;
      v5 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934868,  0LL,  "@GtsSync, Unexpected change type, %{public}ld, set, #CloneMe",  &v6,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTileSyncSyChange setChangeType:]", "%s\n", v5);
    }
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTileSyncSyChange;
  -[CLTileSyncSyChange dealloc](&v3, "dealloc");
}

- (NSString)syncKey
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSyncKey:(id)a3
{
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setProperties:(id)a3
{
}

@end