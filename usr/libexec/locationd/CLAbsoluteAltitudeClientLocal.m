@interface CLAbsoluteAltitudeClientLocal
- (BOOL)valid;
- (CLAbsoluteAltitudeClientLocal)initWithElevationSubscription:(void *)a3;
- (void)onElevationThresold:(float)a3 direction:(BOOL)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLAbsoluteAltitudeClientLocal

- (CLAbsoluteAltitudeClientLocal)initWithElevationSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLAbsoluteAltitudeClientLocal;
  result = -[CLAbsoluteAltitudeClientLocal init](&v5, "init");
  if (result)
  {
    result->_elevationSubscription = a3;
    result->_valid = 1;
  }

  else
  {
    MEMORY[0x10] = 0;
  }

  return result;
}

- (void)onElevationThresold:(float)a3 direction:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101842018);
  }
  v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v13 = a3;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "elevation threshold alert,threshold,%f,above,%d",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101842018);
    }
    int v8 = 134218240;
    double v9 = a3;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "elevation threshold alert,threshold,%f,above,%d",  COERCE_DOUBLE(&v8),  18);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAbsoluteAltitudeClientLocal onElevationThresold:direction:]", "%s\n", v7);
  }

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end