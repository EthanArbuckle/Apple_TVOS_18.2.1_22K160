@interface CLHidDevice
- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5;
- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4;
- (HIDDevice)hidDevice;
- (NSDictionary)matching;
- (void)dealloc;
- (void)setHidDevice:(id)a3;
- (void)setMatching:(id)a3;
@end

@implementation CLHidDevice

- (CLHidDevice)initWithHidDevice:(id)a3 matchingDict:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLHidDevice;
  result = -[CLHidDevice init](&v7, "init");
  if (result)
  {
    result->_matching = (NSDictionary *)a4;
    result->_hidDevice = (HIDDevice *)a3;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHidDevice;
  -[CLHidDevice dealloc](&v3, "dealloc");
}

- (BOOL)setReport:(int64_t)a3 payload:(char *)a4 length:(int64_t)a5
{
  uint64_t v12 = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100784D9C;
  v11[3] = &unk_10184E5B0;
  v11[4] = a3;
  unsigned __int8 v6 = -[HIDDevice setReport:reportLength:withIdentifier:forType:error:timeout:callback:]( -[CLHidDevice hidDevice](self, "hidDevice"),  "setReport:reportLength:withIdentifier:forType:error:timeout:callback:",  a4,  a5,  a3,  2LL,  &v12,  0LL,  v11);
  if ((v6 & 1) == 0)
  {
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_10184E648);
    }
    objc_super v7 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[CLHidManager] setReport: id=0x%lx, failed=%@",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344B0 != -1) {
        dispatch_once(&qword_1019344B0, &stru_10184E648);
      }
      int v13 = 134218242;
      int64_t v14 = a3;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  16LL,  "[CLHidManager] setReport: id=0x%lx, failed=%@",  &v13,  22);
      v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLHidDevice setReport:payload:length:]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }
  }

  return v6;
}

- (NSDictionary)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

- (HIDDevice)hidDevice
{
  return self->_hidDevice;
}

- (void)setHidDevice:(id)a3
{
  self->_hidDevice = (HIDDevice *)a3;
}

@end