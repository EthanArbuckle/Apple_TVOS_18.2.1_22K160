@interface CLFallHealthKitManager
+ (void)recordFallEventInHealthKit:(const ImpactEvent *)a3;
@end

@implementation CLFallHealthKitManager

+ (void)recordFallEventInHealthKit:(const ImpactEvent *)a3
{
  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_10182F2E0);
  }
  v3 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "CL does not support healthkit", buf, 2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10182F2E0);
    }
    v5[0] = 0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345D8,  16LL,  "CL does not support healthkit",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 0LL, "+[CLFallHealthKitManager recordFallEventInHealthKit:]", "%s\n", v4);
  }

@end