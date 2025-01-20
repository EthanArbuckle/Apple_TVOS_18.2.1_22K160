@interface CLFenceBinner
+ (id)binForAccuracy:(double)a3;
+ (id)binForAge:(double)a3;
+ (id)binForConvergingSessionCount:(int)a3;
+ (id)binForConvergingSessionDuration:(double)a3;
+ (id)binForConvergingUsageMetricCount:(int)a3;
+ (id)binForDistance:(double)a3;
+ (id)binForNumber:(id)a3 bins:(id)a4;
@end

@implementation CLFenceBinner

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  if (a3 && a4) {
    return +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  objc_msgSend( a4,  "indexOfObject:inSortedRange:options:usingComparator:",  a3,  0,  objc_msgSend(a4, "count"),  1536,  &stru_10188DBE0));
  }
  if (qword_101934870 != -1) {
    dispatch_once(&qword_101934870, &stru_10188DCC0);
  }
  v7 = (os_log_s *)qword_101934878;
  if (os_log_type_enabled((os_log_t)qword_101934878, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = a3;
    __int16 v16 = 2112;
    id v17 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "#FenceMetrics Error creating bins for number %@, bins, %@, invalid input",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934870 != -1) {
      dispatch_once(&qword_101934870, &stru_10188DCC0);
    }
    int v10 = 138412546;
    id v11 = a3;
    __int16 v12 = 2112;
    id v13 = a4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934878,  16LL,  "#FenceMetrics Error creating bins for number %@, bins, %@, invalid input",  &v10,  22);
    v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 0LL, "+[CLFenceBinner binForNumber:bins:]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  return 0LL;
}

+ (id)binForDistance:(double)a3
{
  if (qword_10199F610 != -1) {
    dispatch_once(&qword_10199F610, &stru_10188DC00);
  }
  v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  return _[a1 binForNumber:v5 bins:qword_10199F608];
}

+ (id)binForAccuracy:(double)a3
{
  if (qword_10199F620 != -1) {
    dispatch_once(&qword_10199F620, &stru_10188DC20);
  }
  v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  return _[a1 binForNumber:v5 bins:qword_10199F618];
}

+ (id)binForAge:(double)a3
{
  if (qword_10199F630 != -1) {
    dispatch_once(&qword_10199F630, &stru_10188DC40);
  }
  v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  return _[a1 binForNumber:v5 bins:qword_10199F628];
}

+ (id)binForConvergingSessionDuration:(double)a3
{
  if (qword_10199F640 != -1) {
    dispatch_once(&qword_10199F640, &stru_10188DC60);
  }
  v5 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3);
  return _[a1 binForNumber:v5 bins:qword_10199F638];
}

+ (id)binForConvergingSessionCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_10199F650 != -1) {
    dispatch_once(&qword_10199F650, &stru_10188DC80);
  }
  v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3);
  return _[a1 binForNumber:v5 bins:qword_10199F648];
}

+ (id)binForConvergingUsageMetricCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_10199F660 != -1) {
    dispatch_once(&qword_10199F660, &stru_10188DCA0);
  }
  v5 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3);
  return _[a1 binForNumber:v5 bins:qword_10199F658];
}

@end