@interface CLProactiveGnssAdapterVisit
- (BOOL)valid;
- (CLProactiveGnssAdapterVisit)initWithProactiveGnss:(void *)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLProactiveGnssAdapterVisit

- (CLProactiveGnssAdapterVisit)initWithProactiveGnss:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLProactiveGnssAdapterVisit;
  result = -[CLProactiveGnssAdapterVisit init](&v5, "init");
  if (result)
  {
    result->_valid = 0;
    if (a3)
    {
      result->_visitProactiveGnss = a3;
      result->_valid = 1;
    }
  }

  return result;
}

- (void)onVisit:(id)a3
{
  if (qword_101934880 != -1) {
    dispatch_once(&qword_101934880, &stru_1018A2168);
  }
  objc_super v5 = (os_log_s *)qword_101934888;
  if (os_log_type_enabled((os_log_t)qword_101934888, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ProactiveGnss,onVisit", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934880 != -1) {
      dispatch_once(&qword_101934880, &stru_1018A2168);
    }
    v9[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934888,  2LL,  "ProactiveGnss,onVisit",  v9,  2);
    v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLProactiveGnssAdapterVisit onVisit:]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  visitProactiveGnss = self->_visitProactiveGnss;
  if (visitProactiveGnss) {
    sub_1011BE22C((uint64_t)visitProactiveGnss, a3);
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