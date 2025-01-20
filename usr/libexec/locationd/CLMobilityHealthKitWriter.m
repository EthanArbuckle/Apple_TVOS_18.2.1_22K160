@interface CLMobilityHealthKitWriter
- (BOOL)areWalkingSteadinessNotificationsEnabled;
- (BOOL)isWalkingSteadinessAvailable;
- (CLMobilityHealthKitWriter)initWithDelegate:(id)a3;
- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4;
- (void)dealloc;
@end

@implementation CLMobilityHealthKitWriter

- (CLMobilityHealthKitWriter)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLMobilityHealthKitWriter;
  result = -[CLMobilityHealthKitWriter init](&v5, "init");
  if (result) {
    result->_delegate = (CLMobilityWalkingBoutServiceProtocol *)a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLMobilityHealthKitWriter;
  -[CLMobilityHealthKitWriter dealloc](&v2, "dealloc");
}

- (BOOL)isWalkingSteadinessAvailable
{
  return 0;
}

- (BOOL)areWalkingSteadinessNotificationsEnabled
{
  return 0;
}

- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4
{
  if (qword_1019346B0 != -1) {
    dispatch_once(&qword_1019346B0, &stru_101893820);
  }
  v7 = (os_log_s *)qword_1019346B8;
  if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "HealthKitWriter: Data collection requested through date %@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101893820);
    }
    int v12 = 138412290;
    id v13 = a3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  1LL,  "HealthKitWriter: Data collection requested through date %@",  &v12,  12);
    v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityHealthKitWriter dataCollectorDidRequestCollectionThroughDate:completion:]",  "%s\n",  v9);
    if (v10 != buf) {
      free(v10);
    }
  }

  delegate = self->_delegate;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100FE4644;
  v11[3] = &unk_10184AF38;
  v11[4] = a4;
  -[CLMobilityWalkingBoutServiceProtocol onDataCollectionRequested:](delegate, "onDataCollectionRequested:", v11);
}

@end