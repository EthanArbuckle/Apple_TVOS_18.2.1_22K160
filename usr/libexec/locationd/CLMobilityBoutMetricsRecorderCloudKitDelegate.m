@interface CLMobilityBoutMetricsRecorderCloudKitDelegate
- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4;
- (CLMobilityBoutMetricsRecorderCloudKitDelegate)initWithBoutMetricsRecorderDb:(void *)a3;
- (id)columns;
- (id)convertStatementToDataBlobs:(const void *)a3;
- (id)dataFieldKey;
- (id)recordType;
- (id)zoneName;
@end

@implementation CLMobilityBoutMetricsRecorderCloudKitDelegate

- (CLMobilityBoutMetricsRecorderCloudKitDelegate)initWithBoutMetricsRecorderDb:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLMobilityBoutMetricsRecorderCloudKitDelegate;
  result = -[CLMobilityBoutMetricsRecorderCloudKitDelegate init](&v5, "init");
  if (result) {
    result->fBoutMetricsDb = a3;
  }
  return result;
}

- (id)recordType
{
  return @"MobilityBout";
}

- (id)zoneName
{
  return @"MobilityMetricsZone";
}

- (id)dataFieldKey
{
  return @"boutData";
}

- (id)columns
{
  return @"startTime, endTime, stepCount, workoutType, terminationReason, numGaitMetrics, invalidGradePercentage, deviceSide, walkingSpeed, doubleSupportPercentage, stepLength, asymmetryPercentage, segmentsRejectedByIsSwingStanceCycle, segmentsRejectedByIsNotRunning, segmentsRejectedByIsFeasibleWalkingSpeed, segmentsRejectedByIsPendular, segmentsRejectedByIsSufficientVerticalTwist, segmentsRejectedByIsCadenceConcordant, walkingSpeedRejectionStatus, doubleSupportPercentageRejectionStatus, stepLengthRejectionStatus, asymmetryPercentageRejectionStatus, userHeight, isHeightSet, userWeight, isWeightSet, boundaryType, cycleTimeMean, stepLengthEntropy, stepLengthPoincareSD1, stepLengthPoincareSD2, cycleTimeEntropy, cycleTimePoincareSD1, cycleTimePoincareSD2, stepIndexOfHarmonicityAP, stepIndexOfHarmonicityML, stepIndexOfHarmonicityVT, swingIndexOfHarmonicityAP, swingIndexOfHarmonicityML, swingIndexOfHarmonicityVT";
}

- (id)convertStatementToDataBlobs:(const void *)a3
{
  v9 = 0LL;
  fBoutMetricsDb = self->fBoutMetricsDb;
  if (fBoutMetricsDb && !sub_100FB1E48((uint64_t)fBoutMetricsDb, (uint64_t *)a3, &v9))
  {
    if (qword_1019346B0 != -1) {
      dispatch_once(&qword_1019346B0, &stru_101858A08);
    }
    v4 = (os_log_s *)qword_1019346B8;
    if (os_log_type_enabled((os_log_t)qword_1019346B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "convertToDataBlobWithCode failed", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346B0 != -1) {
        dispatch_once(&qword_1019346B0, &stru_101858A08);
      }
      __int16 v8 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346B8,  2LL,  "convertToDataBlobWithCode failed",  &v8,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMobilityBoutMetricsRecorderCloudKitDelegate convertStatementToDataBlobs:]",  "%s\n",  v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  return v9;
}

- (BOOL)convertDataBlob:(id)a3 toBoundStatement:(const void *)a4
{
  fBoutMetricsDb = self->fBoutMetricsDb;
  if (fBoutMetricsDb) {
    BOOL v5 = *(void *)a4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    LOBYTE(v8) = 0;
  }

  else
  {
    int v11 = 0;
    int v14 = 0;
    __int128 v12 = 0u;
    memset(v13, 0, sizeof(v13));
    __int128 v15 = xmmword_101338660;
    int64x2_t v16 = vdupq_n_s64(0xFFF0000000000000LL);
    int64x2_t v17 = v16;
    double v18 = -INFINITY;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    float v25 = 1.7;
    unsigned __int8 v26 = 0;
    float v27 = 68.03;
    unsigned __int8 v28 = 0;
    BOOL v8 = sub_100FB2150((uint64_t)fBoutMetricsDb, (uint64_t)a3, (uint64_t)&v11);
    v9 = (sqlite3_stmt *)sub_100019240(*(void *)a4);
    if (v9)
    {
      if (v8)
      {
        v10 = v9;
        LOBYTE(v8) = 1;
        if (sub_1003B7480(v9, 1, *(double *)&v12)
          && sub_1003B7480(v10, 2, *((double *)&v12 + 1))
          && sub_1003C2AF0(v10, 3, *(int *)v13)
          && sub_1003C28BC(v10, 4, *(int *)&v13[4])
          && sub_1003C28BC(v10, 5, *(int *)&v13[8])
          && sub_1003C2AF0(v10, 6, *(int *)&v13[12])
          && sub_1003B7480(v10, 7, *(double *)&v13[16])
          && sub_1003C28BC(v10, 8, v13[24])
          && sub_1003B7480(v10, 9, *(double *)&v19)
          && sub_1003B7480(v10, 10, *((double *)&v19 + 1))
          && sub_1003B7480(v10, 11, *(double *)&v20)
          && sub_1003B7480(v10, 12, *((double *)&v20 + 1))
          && sub_1003C2AF0(v10, 13, SDWORD2(v22))
          && sub_1003C2AF0(v10, 14, SHIDWORD(v22))
          && sub_1003C2AF0(v10, 15, v23)
          && sub_1003C2AF0(v10, 16, SDWORD1(v23))
          && sub_1003C2AF0(v10, 17, SDWORD2(v23))
          && sub_1003C2AF0(v10, 18, SHIDWORD(v23))
          && sub_1003C2AF0(v10, 19, v24)
          && sub_1003C2AF0(v10, 20, SDWORD1(v24))
          && sub_1003C2AF0(v10, 21, SDWORD2(v24))
          && sub_1003C2AF0(v10, 22, SHIDWORD(v24))
          && sub_1003B7480(v10, 23, v25)
          && sub_1003C28BC(v10, 24, v26)
          && sub_1003B7480(v10, 25, v27)
          && sub_1003C28BC(v10, 26, v28)
          && sub_1003C28BC(v10, 27, v14)
          && sub_1003B7480(v10, 28, *(double *)&v15)
          && sub_1003B7480(v10, 29, *((double *)&v15 + 1))
          && sub_1003B7480(v10, 30, *(double *)v16.i64)
          && sub_1003B7480(v10, 31, *(double *)&v16.i64[1])
          && sub_1003B7480(v10, 32, *(double *)v17.i64)
          && sub_1003B7480(v10, 33, *(double *)&v17.i64[1])
          && sub_1003B7480(v10, 34, v18)
          && sub_1003B7480(v10, 35, *(float *)&v21)
          && sub_1003B7480(v10, 36, *((float *)&v21 + 1))
          && sub_1003B7480(v10, 37, *((float *)&v21 + 2))
          && sub_1003B7480(v10, 38, *((float *)&v21 + 3))
          && sub_1003B7480(v10, 39, *(float *)&v22))
        {
          sub_1003B7480(v10, 40, *((float *)&v22 + 1));
        }
      }
    }
  }

  return v8;
}

@end