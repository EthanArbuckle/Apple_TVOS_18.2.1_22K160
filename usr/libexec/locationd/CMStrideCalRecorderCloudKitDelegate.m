@interface CMStrideCalRecorderCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CMStrideCalRecorderCloudKitDelegate)initWithStrideCalRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CMStrideCalRecorderCloudKitDelegate

- (CMStrideCalRecorderCloudKitDelegate)initWithStrideCalRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CMStrideCalRecorderCloudKitDelegate;
  result = -[CMStrideCalRecorderCloudKitDelegate init](&v5, "init");
  if (result) {
    result->fStrideCalRecorderDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"StrideCalibrationHistory";
}

- (id)zoneName
{
  return @"StrideCalibrationHistoryZone";
}

- (id)dataFieldKey
{
  return @"trackData";
}

- (id)columns
{
  return @"startTime, pacebin, kvalue, kvalueTrack, score, endTime, distance, steps, session, speed, percentGrade, gpsSource, runningFormStrideLength, runningFormStrideLengthMetrics";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v9 = 0LL;
  fStrideCalRecorderDb = self->fStrideCalRecorderDb;
  if (fStrideCalRecorderDb && !sub_100DA453C((uint64_t)fStrideCalRecorderDb, (uint64_t *)a3, &v9))
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10188CFA8);
    }
    v4 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10188CFA8);
      }
      __int16 v8 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "convertToDataBlobWithCode failed",  &v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CMStrideCalRecorderCloudKitDelegate convertStatementToDataBlobs:]",  "%s\n",  v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  return v9;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fStrideCalRecorderDb = self->fStrideCalRecorderDb;
  if (fStrideCalRecorderDb) {
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
    BOOL v7 = sub_100DA47D8((uint64_t)fStrideCalRecorderDb, (uint64_t)a3, (uint64_t)v12);
    __int16 v8 = (sqlite3_stmt *)sub_100019240(*(void *)a4);
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
      if (sub_1003B7480(v8, 1, v13)
        && sub_1003C2AF0(v10, 2, v14)
        && sub_1003B7480(v10, 3, v15)
        && sub_1003B7480(v10, 4, v16)
        && sub_1003B7480(v10, 5, v17)
        && sub_1003B7480(v10, 6, v18)
        && sub_1003B7480(v10, 7, v19)
        && sub_1003C28BC(v10, 8, v20)
        && sub_1003C28BC(v10, 9, v21)
        && sub_1003B7480(v10, 10, v22)
        && sub_1003B7480(v10, 11, v23)
        && sub_1003C28BC(v10, 12, v24)
        && sub_1003B7480(v10, 13, v25))
      {
        sub_1003C28BC(v10, 14, v26);
      }
    }
  }

  return v7;
}

@end