@interface CLCompanionNotifierCompanionAdapter
- (BOOL)valid;
- (CLCompanionNotifierCompanionAdapter)initWithCompanionNotifierCompanion:(void *)a3;
- (void)onAbsoluteAltitudeUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLCompanionNotifierCompanionAdapter

- (CLCompanionNotifierCompanionAdapter)initWithCompanionNotifierCompanion:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLCompanionNotifierCompanionAdapter;
  result = -[CLCompanionNotifierCompanionAdapter init](&v5, "init");
  if (result)
  {
    result->_companionNotifierCompanion = a3;
    result->_valid = 1;
  }

  else
  {
    MEMORY[0x10] = 0;
  }

  return result;
}

- (void)onAbsoluteAltitudeUpdate:(id)a3
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10186FD10);
  }
  v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    [a3 filteredPressure];
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "received filtered pressure in CompanionNotifierCompanion,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10186FD10);
    }
    uint64_t v6 = qword_1019346A8;
    [a3 filteredPressure];
    int v10 = 134217984;
    uint64_t v11 = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  2LL,  "received filtered pressure in CompanionNotifierCompanion,%f",  COERCE_DOUBLE(&v10));
    v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionNotifierCompanionAdapter onAbsoluteAltitudeUpdate:]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
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