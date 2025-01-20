@interface CLRunningHealthKitWriter
- (CLRunningHealthKitWriter)init;
- (HKHealthStore)healthStore;
- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setHealthStore:(id)a3;
@end

@implementation CLRunningHealthKitWriter

- (CLRunningHealthKitWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRunningHealthKitWriter;
  return -[CLRunningHealthKitWriter init](&v3, "init");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLRunningHealthKitWriter;
  -[CLRunningHealthKitWriter dealloc](&v2, "dealloc");
}

- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4
{
  if (qword_101934740 != -1) {
    dispatch_once(&qword_101934740, &stru_101866AC0);
  }
  v6 = (os_log_s *)qword_101934748;
  if (os_log_type_enabled((os_log_t)qword_101934748, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[HealthKitWriter] Data collection requested through date %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934740 != -1) {
      dispatch_once(&qword_101934740, &stru_101866AC0);
    }
    int v9 = 138543362;
    id v10 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934748,  2LL,  "[HealthKitWriter] Data collection requested through date %{public}@",  &v9,  12);
    v8 = (uint8_t *)v7;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLRunningHealthKitWriter dataCollectorDidRequestCollectionThroughDate:completion:]",  "%s\n",  v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  (*((void (**)(id, uint64_t, void))a4 + 2))(a4, 1LL, 0LL);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

@end