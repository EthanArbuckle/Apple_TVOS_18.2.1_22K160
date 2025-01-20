@interface CLStepDistanceEstimator
- (BOOL)checkCoreAnalyticsPermissions:(BOOL)a3 rawPaceForLUT:(double)a4;
- (CLExtendedStepCountEntry)updateEntryDistanceAndPace:(SEL)a3;
- (CLStepDistanceEstimator)init;
- (double)computeWalkRunSigma:(double)a3;
- (id).cxx_construct;
- (void)checkToSendDistancePercentageCoreAnalytics:(double)a3 mobilityDistance:(double)a4 rawSpeed:(double)a5 rawDist:(double)a6;
- (void)feedBodyMetrics:(CLBodyMetrics *)a3;
- (void)sendDistancePercentageCoreAnalytics;
- (void)setGPSKValueTable:(shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)a3;
- (void)setMobilityKValueTable:(shared_ptr<CMMobilityCal::SpeedToKValueTable>)a3;
@end

@implementation CLStepDistanceEstimator

- (CLStepDistanceEstimator)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLStepDistanceEstimator;
  v2 = -[CLStepDistanceEstimator init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lastEntry.base.timestamp = 1.79769313e308;
    v2->_lastEntry.base.count = -1;
    v2->_totalCalibratedDistanceMobility = 0.0;
    v2->_totalCalibratedDistanceFused = 0.0;
    v2->_totalCalibratedDistance = 0.0;
    __int128 v11 = 0uLL;
    sub_10005F550((uint64_t)&v2->_mobilitySpeedToKValueTable, &v11);
    v4 = (std::__shared_weak_count *)*((void *)&v11 + 1);
    if (*((void *)&v11 + 1))
    {
      v5 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
      do
        unint64_t v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }

    __int128 v11 = 0uLL;
    sub_10005F550((uint64_t)&v3->_gpsSpeedToKValueTable, &v11);
    v7 = (std::__shared_weak_count *)*((void *)&v11 + 1);
    if (*((void *)&v11 + 1))
    {
      v8 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
      do
        unint64_t v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }

    bzero(v3->_percentErrorCountsPerSpeedBin, 0xA84uLL);
    v3->_supportsFirstStepTime = (sub_1004F97F4() & 2) != 0;
  }

  return v3;
}

- (void)setMobilityKValueTable:(shared_ptr<CMMobilityCal::SpeedToKValueTable>)a3
{
}

- (void)setGPSKValueTable:(shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)a3
{
}

- (void)feedBodyMetrics:(CLBodyMetrics *)a3
{
  __int128 v3 = *(_OWORD *)&a3->gender;
  __int128 v4 = *(_OWORD *)&a3->vo2max;
  __int128 v5 = *(_OWORD *)&a3->hronset;
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(_OWORD *)&a3->runVo2max;
  *(_OWORD *)&self->_bodyMetrics.vo2max = v4;
  *(_OWORD *)&self->_bodyMetrics.hronset = v5;
  *(_OWORD *)&self->_bodyMetrics.gender = v3;
}

- (double)computeWalkRunSigma:(double)a3
{
  if (a3 <= 4.0) {
    return 0.08;
  }
  if (a3 >= 5.0) {
    return 0.21;
  }
  return (a3 + -4.0) * 0.13 + 0.08;
}

- (CLExtendedStepCountEntry)updateEntryDistanceAndPace:(SEL)a3
{
  double currentPace = a4->currentPace;
  BOOL v8 = currentPace == 0.0
    || self->_lastEntry.base.timestamp == 1.79769313e308
    || vabdd_f64(currentPace, self->_lastEntry.addition.rawPace) > self->_lastEntry.addition.rawPace * 0.15;
  double rawDistance = a4->rawDistance;
  unsigned int count = self->_lastEntry.base.count;
  unsigned int v11 = a4->count;
  unsigned int v12 = v11 - count;
  if (v11 >= count)
  {
    double activeTime = a4->activeTime;
    double v18 = self->_lastEntry.base.activeTime;
    if (activeTime <= v18) {
      double v16 = 0.0;
    }
    else {
      double v16 = activeTime - v18;
    }
    double v109 = v16;
    if (v16 <= 0.0)
    {
      double timestamp = self->_lastEntry.base.timestamp;
      if (a4->timestamp > timestamp) {
        double v16 = a4->timestamp - timestamp;
      }
      else {
        double v16 = 0.0;
      }
    }
  }

  else
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10185FCE8);
    }
    v13 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
    {
      unsigned int v14 = self->_lastEntry.base.count;
      unsigned int v15 = a4->count;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "#Warning Step count went backwards (%u -> %u). locationd starting? Motion Co-processor reboot?",  buf,  0xEu);
    }

    double v16 = 0.0;
    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10185FCE8);
      }
      unsigned int v93 = self->_lastEntry.base.count;
      unsigned int v94 = a4->count;
      int v112 = 67109376;
      *(_DWORD *)v113 = v93;
      *(_WORD *)&v113[4] = 1024;
      *(_DWORD *)&v113[6] = v94;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  1LL,  "#Warning Step count went backwards (%u -> %u). locationd starting? Motion Co-processor reboot?",  &v112,  14);
      v96 = (char *)v95;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v95);
      if (v96 != buf) {
        free(v96);
      }
    }

    unsigned int v12 = 0;
    double v109 = 0.0;
  }

  double v20 = (double)v12;
  double v21 = rawDistance * (double)v12;
  a4->double rawDistance = v21;
  double v105 = rawDistance;
  BOOL v22 = rawDistance <= 0.0 || v12 == 0;
  double v23 = 0.0;
  BOOL v24 = v22 || v16 <= 0.0;
  double v25 = v16 / v21;
  if (v24) {
    double v25 = 0.0;
  }
  double v104 = v25;
  if (currentPace <= 0.0) {
    double v26 = v25;
  }
  else {
    double v26 = currentPace;
  }
  double v27 = 1.0;
  double v28 = 1.0;
  double v29 = 1.0;
  if (v26 > 0.0)
  {
    -[CMPedometerTableRawSpeedToKValue kValueForRawSpeed:]( +[CMPedometerTableRawSpeedToKValue sharedInstance]( &OBJC_CLASS___CMPedometerTableRawSpeedToKValue,  "sharedInstance"),  "kValueForRawSpeed:",  1.0 / v26);
    double v28 = v30;
    ptr = self->_mobilitySpeedToKValueTable.__ptr_;
    if (ptr)
    {
      *(double *)buf = 1.0 / v26;
      v32 = (void *)(**(uint64_t (***)(SpeedToKValueTable *, _BYTE *))ptr)(ptr, buf);
      v33 = v32;
      BOOL v34 = v32 != 0LL;
      if (v32)
      {
        [v32 mean];
        double v27 = v35;
      }

      v36 = self->_gpsSpeedToKValueTable.__ptr_;
      if (!v36)
      {
        if (!v33) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
    }

    else
    {
      v36 = self->_gpsSpeedToKValueTable.__ptr_;
      if (!v36)
      {
LABEL_47:
        double v29 = 1.0;
        goto LABEL_48;
      }

      BOOL v34 = 0;
      v33 = 0LL;
    }

    *(double *)buf = 1.0 / v26;
    v37 = (void *)(**(uint64_t (***)(GPSRawSpeedToKValueTable *, _BYTE *))v36)(v36, buf);
    if (v37)
    {
      v38 = v37;
      [v37 mean];
      double v110 = v39;
      [v38 variance];
      double v29 = 1.0;
      if (!v34) {
        goto LABEL_48;
      }
      double v41 = v40;
      [v33 variance];
      double v107 = v42;
      [v38 variance];
      if (v43 > 0.0)
      {
        [v33 variance];
        if (v44 > 0.0)
        {
          double v29 = (v27 * (1.0 / v107) + 1.0 / v41 * v110) / (1.0 / v41 + 1.0 / v107);
          goto LABEL_48;
        }
      }

      goto LABEL_47;
    }

    double v29 = 1.0;
    if (!v34) {
      goto LABEL_48;
    }
LABEL_46:
    [v33 variance];
    goto LABEL_47;
  }

- (BOOL)checkCoreAnalyticsPermissions:(BOOL)a3 rawPaceForLUT:(double)a4
{
  *(void *)&double v6 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v7
    && (objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v6),  "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    LOBYTE(v8) = a4 > 0.0 && !a3;
  }

  else
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10185FCE8);
    }
    unint64_t v9 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Not sending distance estimate analytics, no IHA permission",  buf,  2u);
    }

    BOOL v8 = sub_1002921D0(115, 2);
    if (v8)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10185FCE8);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Not sending distance estimate analytics, no IHA permission",  v13,  2);
      unsigned int v11 = (uint8_t *)v10;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStepDistanceEstimator checkCoreAnalyticsPermissions:rawPaceForLUT:]",  "%s\n",  v10);
      if (v11 != buf) {
        free(v11);
      }
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (void)checkToSendDistancePercentageCoreAnalytics:(double)a3 mobilityDistance:(double)a4 rawSpeed:(double)a5 rawDist:(double)a6
{
  double v8 = 0.0;
  if (a3 != 0.0) {
    double v8 = (a4 - a3) * 100.0 / a3;
  }
  double v9 = a3 / a6;
  if (a6 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v9;
  }
  if (a6 == 0.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = a4 / a6;
  }
  __p = 0LL;
  unsigned int v57 = 0LL;
  uint64_t v58 = 0LL;
  sub_100007590(&__p, (const void *)qword_101999288, qword_101999290, (qword_101999290 - qword_101999288) >> 3);
  uint64_t v12 = 0LL;
  if (v57 != __p)
  {
    unint64_t v13 = (v57 - (_BYTE *)__p) >> 3;
    if (v13 <= 1) {
      unint64_t v13 = 1LL;
    }
    while (*((double *)__p + v12) < a5)
    {
      if (v13 == ++v12)
      {
        LODWORD(v12) = v13;
        break;
      }
    }
  }

  unsigned int v53 = 0LL;
  BOOL v54 = 0LL;
  uint64_t v55 = 0LL;
  sub_100007590(&v53, (const void *)qword_1019992A0, qword_1019992A8, (qword_1019992A8 - qword_1019992A0) >> 3);
  percentErrorCountsPerSpeedBin = self->_percentErrorCountsPerSpeedBin;
  unsigned int v15 = v53;
  double v16 = v54;
  if (v54 == v53)
  {
    percentErrorCountsPerSpeedBin[(int)v12][0].__elems_[0] = percentErrorCountsPerSpeedBin[(int)v12][0].__elems_[0]
                                                           + 1.0;
    if (!v16) {
      goto LABEL_24;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
    unint64_t v18 = (v54 - v53) >> 3;
    if (v18 <= 1) {
      unint64_t v18 = 1LL;
    }
    while (*(double *)&v53[8 * v17] < v8)
    {
      if (v18 == ++v17)
      {
        LODWORD(v17) = v18;
        break;
      }
    }

    percentErrorCountsPerSpeedBin[(int)v12][(int)v17].__elems_[0] = percentErrorCountsPerSpeedBin[(int)v12][(int)v17].__elems_[0]
                                                                  + 1.0;
  }

  BOOL v54 = v15;
  operator delete(v15);
LABEL_24:
  if (__p)
  {
    unsigned int v57 = __p;
    operator delete(__p);
  }

  double v50 = 0LL;
  double v51 = 0LL;
  uint64_t v52 = 0LL;
  sub_100007590(&v50, (const void *)qword_101999288, qword_101999290, (qword_101999290 - qword_101999288) >> 3);
  uint64_t v19 = 0LL;
  if (v51 != v50)
  {
    unint64_t v20 = (v51 - (_BYTE *)v50) >> 3;
    if (v20 <= 1) {
      unint64_t v20 = 1LL;
    }
    while (*((double *)v50 + v19) < a5)
    {
      if (v20 == ++v19)
      {
        LODWORD(v19) = v20;
        break;
      }
    }
  }

  v47 = 0LL;
  v48 = 0LL;
  uint64_t v49 = 0LL;
  sub_100007590(&v47, (const void *)qword_1019992A0, qword_1019992A8, (qword_1019992A8 - qword_1019992A0) >> 3);
  double v21 = v47;
  BOOL v22 = v48;
  if (v48 == v47)
  {
    percentErrorCountsPerSpeedBin[(int)v19][0].__elems_[1] = v10
                                                           + percentErrorCountsPerSpeedBin[(int)v19][0].__elems_[1];
    if (!v22) {
      goto LABEL_41;
    }
  }

  else
  {
    uint64_t v23 = 0LL;
    unint64_t v24 = (v48 - v47) >> 3;
    if (v24 <= 1) {
      unint64_t v24 = 1LL;
    }
    while (*(double *)&v47[8 * v23] < v8)
    {
      if (v24 == ++v23)
      {
        LODWORD(v23) = v24;
        break;
      }
    }

    uint64_t v25 = (uint64_t)&percentErrorCountsPerSpeedBin[(int)v19][(int)v23];
    *(double *)(v25 + 8) = v10 + *(double *)(v25 + 8);
  }

  v48 = v21;
  operator delete(v21);
LABEL_41:
  if (v50)
  {
    double v51 = v50;
    operator delete(v50);
  }

  double v44 = 0LL;
  double v45 = 0LL;
  uint64_t v46 = 0LL;
  sub_100007590(&v44, (const void *)qword_101999288, qword_101999290, (qword_101999290 - qword_101999288) >> 3);
  if (v45 == v44)
  {
    int v28 = 0;
  }

  else
  {
    uint64_t v26 = 0LL;
    unint64_t v27 = (v45 - (_BYTE *)v44) >> 3;
    if (v27 <= 1) {
      unint64_t v27 = 1LL;
    }
    while (*((double *)v44 + v26) < a5)
    {
      if (v27 == ++v26)
      {
        LODWORD(v26) = v27;
        break;
      }
    }

    int v28 = v26;
  }

  double v41 = 0LL;
  double v42 = 0LL;
  uint64_t v43 = 0LL;
  sub_100007590(&v41, (const void *)qword_1019992A0, qword_1019992A8, (qword_1019992A8 - qword_1019992A0) >> 3);
  double v29 = v41;
  double v30 = v42;
  if (v42 == v41)
  {
    percentErrorCountsPerSpeedBin[v28][0].__elems_[2] = v11 + percentErrorCountsPerSpeedBin[v28][0].__elems_[2];
    if (!v30) {
      goto LABEL_60;
    }
  }

  else
  {
    uint64_t v31 = 0LL;
    unint64_t v32 = (v42 - v41) >> 3;
    if (v32 <= 1) {
      unint64_t v32 = 1LL;
    }
    while (*(double *)&v41[8 * v31] < v8)
    {
      if (v32 == ++v31)
      {
        LODWORD(v31) = v32;
        break;
      }
    }

    uint64_t v33 = (uint64_t)&percentErrorCountsPerSpeedBin[v28][(int)v31];
    *(double *)(v33 + 16) = v11 + *(double *)(v33 + 16);
  }

  double v42 = v29;
  operator delete(v29);
LABEL_60:
  if (v44)
  {
    double v45 = v44;
    operator delete(v44);
  }

  int entryCount = self->_entryCount;
  self->_int entryCount = entryCount + 1;
  if (entryCount >= 100)
  {
    self->_int entryCount = 0;
    -[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics](self, "sendDistancePercentageCoreAnalytics");
    bzero(self->_percentErrorCountsPerSpeedBin, 0xA80uLL);
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10185FCE8);
  }
  double v35 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
  {
    int v36 = self->_entryCount;
    *(_DWORD *)buf = 67109376;
    int v63 = v36;
    __int16 v64 = 2048;
    double v65 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Distance Estimate, checked to send Core Analytics event. Entry Count:%d, seen error: %f",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10185FCE8);
    }
    int v37 = self->_entryCount;
    v59[0] = 67109376;
    v59[1] = v37;
    __int16 v60 = 2048;
    double v61 = v8;
    LODWORD(v40) = 18;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  1LL,  "Distance Estimate, checked to send Core Analytics event. Entry Count:%d, seen error: %f",  v59,  v40);
    double v39 = (uint8_t *)v38;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStepDistanceEstimator checkToSendDistancePercentageCoreAnalytics:mobilityDistance:rawSpeed:rawDist:]",  "%s\n",  v38);
    if (v39 != buf) {
      free(v39);
    }
  }

- (void)sendDistancePercentageCoreAnalytics
{
  p_bodyMetrics = &self->_bodyMetrics;
  __int128 v4 = *(_OWORD *)&self->_bodyMetrics.vo2max;
  v47[0] = *(_OWORD *)&self->_bodyMetrics.gender;
  v47[1] = v4;
  v48[0] = *(_OWORD *)&self->_bodyMetrics.hronset;
  *(_OWORD *)((char *)v48 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v5 = sub_100F8D984((uint64_t)v47);
  __int128 v6 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v45[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v45[1] = v6;
  v46[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v46 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v7 = sub_100496E10((unsigned int *)v45);
  __int128 v8 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v43[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v43[1] = v8;
  v44[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v44 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v9 = sub_100F8DA2C((uint64_t)v43);
  __int128 v10 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v41[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v41[1] = v10;
  v42[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  uint64_t v33 = self;
  *(_OWORD *)((char *)v42 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v11 = sub_100F8DAEC((uint64_t)v41);
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10185FCE8);
  }
  uint64_t v12 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    int v68 = v5;
    __int16 v69 = 1024;
    int v70 = v7;
    __int16 v71 = 1024;
    int v72 = v9;
    __int16 v73 = 1024;
    int v74 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Distance Estimate, age: %d, gender: %d, bmi: %d, userheight: %d.",  buf,  0x1Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10185FCE8);
    }
    int v49 = 67109888;
    int v50 = v5;
    __int16 v51 = 1024;
    int v52 = v7;
    __int16 v53 = 1024;
    int v54 = v9;
    __int16 v55 = 1024;
    int v56 = v11;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  1LL,  "Distance Estimate, age: %d, gender: %d, bmi: %d, userheight: %d.",  &v49,  26,  v28,  v29);
    unint64_t v27 = (uint8_t *)v26;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics]", "%s\n", v26);
    if (v27 != buf) {
      free(v27);
    }
  }

  uint64_t v14 = 0LL;
  unsigned int v15 = (__shared_weak_count **)&v33->_percentErrorCountsPerSpeedBin[0][0].__elems_[2];
  *(void *)&__int128 v13 = 67111168LL;
  __int128 v31 = v13;
  do
  {
    uint64_t v16 = 0LL;
    double v30 = v15;
    do
    {
      *(void *)&v34[0] = _NSConcreteStackBlock;
      *(void *)&v34[1] = 3221225472LL;
      *(void *)&v34[2] = sub_1008EA6E8;
      *(void *)&v34[3] = &unk_10185FCC8;
      int v35 = v5;
      int v36 = v16;
      int v37 = v7;
      int v38 = v14;
      int v39 = v9;
      int v40 = v11;
      *(void *)&v34[4] = v33;
      AnalyticsSendEventLazy(@"com.apple.com.apple.CoreMotion.Pedometer.MobilityBasedCalibrationDaily", v34);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10185FCE8);
      }
      uint64_t v17 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
      {
        double v18 = *((double *)v15 - 2);
        uint64_t v19 = (uint64_t)*(v15 - 1);
        Class v20 = (Class)*v15;
        *(_DWORD *)buf = v31;
        int v68 = v5;
        __int16 v69 = 1024;
        int v70 = v16;
        __int16 v71 = 1024;
        int v72 = v7;
        __int16 v73 = 1024;
        int v74 = v14;
        __int16 v75 = 1024;
        int v76 = v9;
        __int16 v77 = 1024;
        int v78 = v11;
        __int16 v79 = 2048;
        double v80 = v18;
        __int16 v81 = 2048;
        uint64_t v82 = v19;
        __int16 v83 = 2048;
        Class v84 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Distance Estimate, sent Core Analytics event. speedLB: - ageGroup %d | distancePercentageErrorBin: %d | gender : %d | speedBin: %d | userBmiBin: %d | userHeightBin: %d | countPerBin: %f | sumRatioGPStoRawDist: %f | sumRat ioMobilitytoRawDist: %f",  buf,  0x44u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10185FCE8);
        }
        double v21 = *((double *)v15 - 2);
        uint64_t v22 = (uint64_t)*(v15 - 1);
        Class v23 = (Class)*v15;
        int v49 = v31;
        int v50 = v5;
        __int16 v51 = 1024;
        int v52 = v16;
        __int16 v53 = 1024;
        int v54 = v7;
        __int16 v55 = 1024;
        int v56 = v14;
        __int16 v57 = 1024;
        int v58 = v9;
        __int16 v59 = 1024;
        int v60 = v11;
        __int16 v61 = 2048;
        double v62 = v21;
        __int16 v63 = 2048;
        uint64_t v64 = v22;
        __int16 v65 = 2048;
        Class v66 = v23;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  1LL,  "Distance Estimate, sent Core Analytics event. speedLB: - ageGroup %d | distancePercentageErrorBin: %d | gender : %d | speedBin: %d | userBmiBin: %d | userHeightBin: %d | countPerBin: %f | sumRatioGPStoRawDist: %f | sumRat ioMobilitytoRawDist: %f",  &v49,  68,  v28,  (_DWORD)v30,  (_DWORD)v31,  DWORD2(v31),  v32,  *(double *)&v33,  v34[0]);
        uint64_t v25 = (uint8_t *)v24;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics]",  "%s\n",  v24);
        if (v25 != buf) {
          free(v25);
        }
      }

      ++v16;
      v15 += 3;
    }

    while (v16 != 14);
    ++v14;
    unsigned int v15 = v30 + 42;
  }

  while (v14 != 8);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  return self;
}

@end