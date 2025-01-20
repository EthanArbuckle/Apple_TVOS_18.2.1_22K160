@interface CLPredictedWalkDistanceCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CLPredictedWalkDistanceCloudKitDelegate)initWithPredictedWalkDistanceBoutRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CLPredictedWalkDistanceCloudKitDelegate

- (CLPredictedWalkDistanceCloudKitDelegate)initWithPredictedWalkDistanceBoutRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLPredictedWalkDistanceCloudKitDelegate;
  result = -[CLPredictedWalkDistanceCloudKitDelegate init](&v5, "init");
  if (result) {
    result->fPredictedWalkDistanceBoutDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"PredictedWalkingDistanceBout";
}

- (id)zoneName
{
  return @"PredictedWalkingDistanceZone";
}

- (id)dataFieldKey
{
  return @"boutData";
}

- (id)columns
{
  return @"startTime, endTime, stepCount, distance, activeTime, elevationAscended, elevationDescended, stepCountGPS, distanceGPS, boutType";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v8 = 0LL;
  fPredictedWalkDistanceBoutDb = self->fPredictedWalkDistanceBoutDb;
  if (fPredictedWalkDistanceBoutDb && !sub_100D481E4((uint64_t)fPredictedWalkDistanceBoutDb, (uint64_t *)a3, &v8))
  {
    if (qword_1019346C0 != -1) {
      dispatch_once(&qword_1019346C0, &stru_101826A88);
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
        dispatch_once(&qword_1019346C0, &stru_101826A88);
      }
      __int16 v7 = 0;
      v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346C8,  2LL,  "convertToDataBlobWithCode failed",  &v7,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLPredictedWalkDistanceCloudKitDelegate convertStatementToDataBlobs:]",  "%s\n",  v6);
    }
  }

  return v8;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fPredictedWalkDistanceBoutDb = self->fPredictedWalkDistanceBoutDb;
  if (fPredictedWalkDistanceBoutDb) {
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
    int v11 = 0;
    double v12 = 0.0;
    double v13 = 0.0;
    int v14 = 0;
    double v16 = 0.0;
    uint64_t v17 = 0LL;
    double v15 = 0.0;
    int v18 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v22 = 0LL;
    BOOL v7 = sub_100D484AC((uint64_t)fPredictedWalkDistanceBoutDb, (uint64_t)a3, (uint64_t)&v11);
    v8 = (sqlite3_stmt *)sub_100019240(*(void *)a4);
    if (v8)
    {
      if (v7)
      {
        v9 = v8;
        LOBYTE(v7) = 1;
        if (sub_1003B7480(v8, 1, v12)
          && sub_1003B7480(v9, 2, v13)
          && sub_1003C2AF0(v9, 3, v14)
          && sub_1003B7480(v9, 4, v15)
          && sub_1003B7480(v9, 5, v16)
          && sub_1003C2AF0(v9, 6, v17)
          && sub_1003C2AF0(v9, 7, SHIDWORD(v17))
          && sub_1003C2AF0(v9, 8, v18)
          && sub_1003B7480(v9, 9, *(double *)&v19))
        {
          sub_1003C28BC(v9, 10, SDWORD2(v19));
        }
      }
    }
  }

  return v7;
}

@end