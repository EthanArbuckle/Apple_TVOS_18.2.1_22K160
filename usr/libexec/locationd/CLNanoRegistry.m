@interface CLNanoRegistry
- (BOOL)isAFire6OrOlderWatchPaired;
- (BOOL)isWatchPaired;
@end

@implementation CLNanoRegistry

- (BOOL)isWatchPaired
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_10185A988);
  }
  v2 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174657;
    int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLNR,isWatchPaired,%{private}d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10185A988);
    }
    v6[0] = 67174657;
    v6[1] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "CLNR,isWatchPaired,%{private}d",  v6,  8);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNanoRegistry isWatchPaired]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  return 0;
}

- (BOOL)isAFire6OrOlderWatchPaired
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_10185A988);
  }
  v2 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67174657;
    int v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "CLNR,isAFire6OrOlderWatchPaired,%{private}d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_10185A988);
    }
    v6[0] = 67174657;
    v6[1] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  0LL,  "CLNR,isAFire6OrOlderWatchPaired,%{private}d",  v6,  8);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLNanoRegistry isAFire6OrOlderWatchPaired]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  return 0;
}

@end