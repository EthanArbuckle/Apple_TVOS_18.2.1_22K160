@interface CLWalkingSpeedCalCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CLWalkingSpeedCalCloudKitDelegate)initWithWalkingSpeedCalRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CLWalkingSpeedCalCloudKitDelegate

- (CLWalkingSpeedCalCloudKitDelegate)initWithWalkingSpeedCalRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLWalkingSpeedCalCloudKitDelegate;
  result = -[CLWalkingSpeedCalCloudKitDelegate init](&v5, "init");
  if (result) {
    result->fWalkingSpeedCalDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"WalkingSpeedStrideCalibration";
}

- (id)zoneName
{
  return @"WalkingSpeedStrideCalZone";
}

- (id)dataFieldKey
{
  return @"gaitData";
}

- (id)columns
{
  return @"startTime, endTime, cadenceWatch, cadenceGaitCycle, meanWalkingSpeed, gaitCycleYield";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v8 = 0LL;
  fWalkingSpeedCalDb = self->fWalkingSpeedCalDb;
  if (fWalkingSpeedCalDb && !sub_1006DF2A8((uint64_t)fWalkingSpeedCalDb, (uint64_t *)a3, &v8))
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_10183DD98);
    }
    v4 = (os_log_s *)qword_1019346C8;
    if (os_log_type_enabled((os_log_t)qword_1019346C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346C0 != -1) {
        dispatch_once(&qword_1019346C0, &stru_10183DD98);
      }
      __int16 v7 = 0;
      v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  2LL,  "convertToDataBlobWithCode failed",  &v7,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWalkingSpeedCalCloudKitDelegate convertStatementToDataBlobs:]",  "%s\n",  v6);
    }
  }

  return v8;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fWalkingSpeedCalDb = self->fWalkingSpeedCalDb;
  if (fWalkingSpeedCalDb) {
    BOOL v5 = *(void *)a4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    LOBYTE(v7) = 0;
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v12 = 0u;
    BOOL v7 = sub_1006DF548((uint64_t)fWalkingSpeedCalDb, (uint64_t)a3, (uint64_t)&v12);
    v8 = (sqlite3_stmt *)sub_100019240(*(void *)a4);
    if (v8) {
      BOOL v9 = !v7;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      v10 = v8;
      LOBYTE(v7) = 1;
      if (sub_1003B7480(v8, 1, *(double *)&v12)
        && sub_1003B7480(v10, 2, *((double *)&v12 + 1))
        && sub_1003B7480(v10, 3, *(double *)&v13)
        && sub_1003B7480(v10, 4, *((double *)&v13 + 1))
        && sub_1003B7480(v10, 5, *(double *)&v14))
      {
        sub_1003B7480(v10, 6, *((double *)&v14 + 1));
      }
    }
  }

  return v7;
}

@end