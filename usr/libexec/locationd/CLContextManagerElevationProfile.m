@interface CLContextManagerElevationProfile
- (CLContextManagerElevationProfile)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (RTRoutineManager)routineManager;
- (double)retrieveLastPushedTime;
- (void)_sendElevationsFromEstimates:(id)a3 startIndex:(unint64_t)a4 withCompletionBlock:(id)a5;
- (void)dealloc;
- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8;
- (void)getStoredVisit:(id)a3 betweenStartTime:(double)a4 andEndTime:(double)a5 withCompletionBlock:(id)a6;
- (void)saveLastPushedTime:(double)a3;
- (void)sendElevationsFromEstimates:(id)a3 withCompletionBlock:(id)a4;
- (void)setRoutineManager:(id)a3;
@end

@implementation CLContextManagerElevationProfile

- (CLContextManagerElevationProfile)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CLContextManagerElevationProfile;
  v6 = -[CLContextManagerElevationProfileBase initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v20,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  v7 = v6;
  if (v6)
  {
    v19.receiver = v6;
    v19.super_class = (Class)&OBJC_CLASS___CLContextManagerElevationProfile;
    -[CLContextManagerElevationProfileBase initElevationProfileEstimator:withElevationDbInMemory:]( &v19,  "initElevationProfileEstimator:withElevationDbInMemory:",  v6,  0LL);
    LOBYTE(v14) = 0;
    sub_1012049AC(&v15, "ElevationVerbose", (unsigned __int8 *)&v14, 0);
    v7->_isVerboseLogging = v16;
    LOBYTE(v14) = 1;
    sub_1012049AC(&v15, "EnableHistoricalElevationPushModel", (unsigned __int8 *)&v14, 0);
    v7->_pushModelEnabled = v16;
    sub_101204164(&v15, "MaxPushedElevationPeriod", &qword_10134F518, 0);
    v7->_maxPushedElevationPeriod = v18;
    v7->_elevationProfileRoutineAdapter = objc_alloc_init(&OBJC_CLASS___CLElevationProfileRoutineAdapter);
    v8 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor](v7->super.super._universe, "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
    v7->_routineMonitor = v8;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v8,  "registerDelegate:inSilo:",  v7->_elevationProfileRoutineAdapter,  -[CLIntersiloUniverse silo](v7->super.super._universe, "silo"));
    v7->_routineManager = objc_alloc_init(&OBJC_CLASS___RTRoutineManager);
    v7->_lastPushedTime = 0.0;
    -[CLContextManagerElevationProfile retrieveLastPushedTime](v7, "retrieveLastPushedTime");
    v7->_lastPushedTime = v9;
    -[CLContextManagerElevationProfileBase setRegisteredXPCTaskMSLP:](v7, "setRegisteredXPCTaskMSLP:", 0LL);
    -[CLContextManagerElevationProfileBase setRegisteredXPCTaskElevationProfile:]( v7,  "setRegisteredXPCTaskElevationProfile:",  0LL);
    int v14 = 1155596288;
    sub_101206C88(&v15, "ElevationProfilePeriodSeconds", &v14, 0);
    double v10 = v17;
    v11 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](v7->super.super._universe, "silo"), "newTimer");
    v7->_scheduleElevationProfile = v11;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100BEC5B8;
    v13[3] = &unk_10181FA90;
    v13[4] = v7;
    *(double *)&v13[5] = v10;
    -[CLTimer setHandler:](v11, "setHandler:", v13);
    if (v7->_pushModelEnabled) {
      -[CLTimer setNextFireDelay:](v7->_scheduleElevationProfile, "setNextFireDelay:", v10);
    }
  }

  return v7;
}

- (void)dealloc
{
  self->_routineMonitor = 0LL;
  self->_routineManager = 0LL;
  -[CLElevationProfileRoutineAdapter invalidate](self->_elevationProfileRoutineAdapter, "invalidate");

  self->_elevationProfileRoutineAdapter = 0LL;
  -[CLTimer invalidate](self->_scheduleElevationProfile, "invalidate");

  self->_scheduleElevationProfile = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLContextManagerElevationProfile;
  -[CLContextManagerElevationProfileBase dealloc](&v3, "dealloc");
}

- (void)getStoredVisit:(id)a3 betweenStartTime:(double)a4 andEndTime:(double)a5 withCompletionBlock:(id)a6
{
  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:]( &OBJC_CLASS___CLContextManagerElevationProfileBase,  "isQueryValidWithStartTime:andEndTime:"))
  {
    v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a4);
    v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a5);
    v13 =  -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v11,  v12);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101877818);
    }
    int v14 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      double v42 = COERCE_DOUBLE("startTime");
      __int16 v43 = 2048;
      double v44 = a4;
      __int16 v45 = 2080;
      v46 = "endTime";
      __int16 v47 = 2048;
      double v48 = a5;
      __int16 v49 = 2080;
      v50 = "startDate";
      __int16 v51 = 2112;
      v52 = v11;
      __int16 v53 = 2080;
      v54 = "endDate";
      __int16 v55 = 2112;
      v56 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "query routine visit with,%s,%f,%s,%f,%s,%@,%s,%@",  buf,  0x52u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101877818);
      }
      int v25 = 136316930;
      double v26 = COERCE_DOUBLE("startTime");
      __int16 v27 = 2048;
      double v28 = a4;
      __int16 v29 = 2080;
      v30 = "endTime";
      __int16 v31 = 2048;
      double v32 = a5;
      __int16 v33 = 2080;
      v34 = "startDate";
      __int16 v35 = 2112;
      v36 = v11;
      __int16 v37 = 2080;
      v38 = "endDate";
      __int16 v39 = 2112;
      v40 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "query routine visit with,%s,%f,%s,%f,%s,%@,%s,%@",  &v25,  82);
      objc_super v20 = (uint8_t *)v19;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]",  "%s\n",  v19);
      if (v20 != buf) {
        free(v20);
      }
    }

    id v15 = objc_alloc(&OBJC_CLASS___RTStoredVisitFetchOptions);
    id v16 =  objc_msgSend( v15,  "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:",  0,  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", RTVisitConfidenceHigh),  v13,  0,  0,  +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1018D4238, &off_1018D4250, 0));
    routineMonitor = self->_routineMonitor;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100BECF28;
    v24[3] = &unk_101877780;
    v24[4] = a3;
    v24[5] = a6;
    -[CLRoutineMonitorServiceProtocol fetchStoredVisitsWithOptions:withReply:]( routineMonitor,  "fetchStoredVisitsWithOptions:withReply:",  v16,  v24);
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101877818);
    }
    double v18 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v42 = a4;
      __int16 v43 = 2048;
      double v44 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "query routine visit with unordered startTime,%f,endTime,%f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101877818);
      }
      int v25 = 134218240;
      double v26 = a4;
      __int16 v27 = 2048;
      double v28 = a5;
      LODWORD(v23) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "query routine visit with unordered startTime,%f,endTime,%f",  COERCE_DOUBLE(&v25),  v23);
      v22 = (uint8_t *)v21;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]",  "%s\n",  v21);
      if (v22 != buf) {
        free(v22);
      }
    }

    (*((void (**)(id, uint64_t))a6 + 2))(a6, 0x7FFFFFFFLL);
  }

- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8
{
}

- (void)_sendElevationsFromEstimates:(id)a3 startIndex:(unint64_t)a4 withCompletionBlock:(id)a5
{
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = [a3 count];
  unint64_t v11 = a4;
  if (a4 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    unint64_t v11 = a4;
    if ((unint64_t)v9 > a4)
    {
      *(void *)&__int128 v10 = 134350080LL;
      __int128 v60 = v10;
      uint64_t v61 = 134219008LL;
      unint64_t v11 = a4;
      unint64_t v12 = a4;
      do
      {
        objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
        if (v13 >= 0.0)
        {
          objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
          if (v14 >= 0.0)
          {
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
            float v16 = v15;
            if (v12)
            {
              objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12 - 1), "timestamp");
              double lastPushedTime = v17;
            }

            else
            {
              double lastPushedTime = self->_lastPushedTime;
            }

            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
            double v20 = lastPushedTime;
            if (v19 - lastPushedTime > 15.36)
            {
              objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
              double v20 = v21 + -15.36;
            }

            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
            if (v20 > v22)
            {
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_101877818);
              }
              double v23 = (os_log_s *)qword_1019346A8;
              if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
              {
                double v24 = self->_lastPushedTime;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                *(_DWORD *)buf = v60;
                unint64_t v75 = v12;
                __int16 v76 = 2050;
                double v77 = lastPushedTime;
                __int16 v78 = 2050;
                double v79 = v24;
                __int16 v80 = 2050;
                double v81 = v25;
                __int16 v82 = 2050;
                double v83 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Elevation timestamp rolled back,iteration,%{public}lu,prevTimestamp,%{public}f,lastPushTime,%{public}f ,endTime,%{public}f,beginTime,%{public}f",  buf,  0x34u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_101877818);
                }
                uint64_t v53 = qword_1019346A8;
                double v54 = self->_lastPushedTime;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                int v64 = v60;
                unint64_t v65 = v12;
                __int16 v66 = 2050;
                double v67 = lastPushedTime;
                __int16 v68 = 2050;
                double v69 = v54;
                __int16 v70 = 2050;
                double v71 = v55;
                __int16 v72 = 2050;
                double v73 = v20;
                LODWORD(v59) = 52;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v53,  1LL,  "Elevation timestamp rolled back,iteration,%{public}lu,prevTimestamp,%{public}f,lastPushTime,%{public}f ,endTime,%{public}f,beginTime,%{public}f",  &v64,  *(void *)&v59);
                v57 = (uint8_t *)v56;
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]",  "%s\n",  v56);
                if (v57 != buf) {
                  free(v57);
                }
              }

              objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
              double v20 = v26 + -15.36;
            }

            double v27 = sqrtf(v16);
            double v28 = objc_alloc(&OBJC_CLASS___NSDateInterval);
            __int16 v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v20);
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
            v30 = -[NSDateInterval initWithStartDate:endDate:]( v28,  "initWithStartDate:endDate:",  v29,  +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
            id v31 = objc_alloc(&OBJC_CLASS___RTElevation);
            objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fState");
            id v33 = [v31 initWithElevation:v30 dateInterval:0 elevationUncertainty:v32 estimationStatus:v27];
            if (self->_isVerboseLogging)
            {
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_101877818);
              }
              v34 = (os_log_s *)qword_1019346A8;
              if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                unint64_t v36 = v35;
                [v33 elevation];
                double v38 = v37;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fState");
                double v40 = v39;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
                *(_DWORD *)buf = v61;
                unint64_t v75 = v36;
                __int16 v76 = 2048;
                double v77 = v38;
                __int16 v78 = 2048;
                double v79 = v27;
                __int16 v80 = 2048;
                double v81 = v40;
                __int16 v82 = 2048;
                double v83 = sqrtf(v41);
                _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "send elevation profile back to client,timestamp,%f,elevation,%f,elevationUncertainty,%f,mslp,%f,mslpUncertainty,%f",  buf,  0x34u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_101877818);
                }
                uint64_t v43 = qword_1019346A8;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "timestamp");
                unint64_t v45 = v44;
                [v33 elevation];
                double v47 = v46;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fState");
                double v49 = v48;
                objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "fCovariance");
                int v64 = v61;
                unint64_t v65 = v45;
                __int16 v66 = 2048;
                double v67 = v47;
                __int16 v68 = 2048;
                double v69 = v27;
                __int16 v70 = 2048;
                double v71 = v49;
                __int16 v72 = 2048;
                double v73 = sqrtf(v50);
                LODWORD(v59) = 52;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v43,  2LL,  "send elevation profile back to client,timestamp,%f,elevation,%f,elevationUncertainty,%f,mslp,%f,mslpUncertainty,%f",  COERCE_DOUBLE(&v64),  v59,  *(double *)&v60,  *((double *)&v60 + 1),  *(double *)&v61);
                v52 = (uint8_t *)v51;
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]",  "%s\n",  v51);
                if (v52 != buf) {
                  free(v52);
                }
              }
            }

            -[NSMutableArray addObject:](v8, "addObject:", v33);

            unint64_t v11 = v12;
          }
        }

        ++v12;
        id v42 = [a3 count];
      }

      while (v12 < a4 + 100 && v12 < (unint64_t)v42);
    }
  }

  v58 = (dispatch_queue_s *)objc_msgSend(-[CLIntersiloUniverse silo](self->super.super._universe, "silo"), "queue");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100BEE7A0;
  block[3] = &unk_1018777F8;
  block[4] = self;
  block[5] = v8;
  block[8] = a4;
  block[9] = v11;
  block[6] = a3;
  block[7] = a5;
  dispatch_async(v58, block);
}

- (void)sendElevationsFromEstimates:(id)a3 withCompletionBlock:(id)a4
{
  if ([a3 count])
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101877818);
    }
    v7 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a3 count];
      objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp");
      uint64_t v10 = v9;
      objc_msgSend(objc_msgSend(a3, "lastObject"), "timestamp");
      *(_DWORD *)buf = 134218496;
      id v31 = v8;
      __int16 v32 = 2048;
      uint64_t v33 = v10;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "pushing elevations,num,%lu,first timestamp,%f,last timestamp,%f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101877818);
      }
      uint64_t v13 = qword_1019346A8;
      id v14 = [a3 count];
      objc_msgSend(objc_msgSend(a3, "firstObject"), "timestamp");
      uint64_t v16 = v15;
      objc_msgSend(objc_msgSend(a3, "lastObject"), "timestamp");
      int v24 = 134218496;
      id v25 = v14;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      LODWORD(v23) = 32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  0LL,  "pushing elevations,num,%lu,first timestamp,%f,last timestamp,%f",  &v24,  v23);
      double v19 = (uint8_t *)v18;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfile sendElevationsFromEstimates:withCompletionBlock:]",  "%s\n",  v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    -[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]( self,  "_sendElevationsFromEstimates:startIndex:withCompletionBlock:",  a3,  0LL,  a4);
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101877818);
    }
    unint64_t v12 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v31 = [a3 count];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pushing elevations,num,%lu", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101877818);
      }
      uint64_t v20 = qword_1019346A8;
      int v24 = 134217984;
      id v25 = [a3 count];
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "pushing elevations,num,%lu",  &v24);
      double v22 = (uint8_t *)v21;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLContextManagerElevationProfile sendElevationsFromEstimates:withCompletionBlock:]",  "%s\n",  v21);
      if (v22 != buf) {
        free(v22);
      }
    }

    (*((void (**)(id))a4 + 2))(a4);
  }

- (void)saveLastPushedTime:(double)a3
{
  double v8 = a3;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002AC7B8(v3, "CLElevationProfile_LastPushedTimestamp", &v8);
  uint64_t v4 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v4 + 944LL))(v4);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101877818);
  }
  v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "saved elevation profile push time,%{public}f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101877818);
    }
    int v9 = 134349056;
    double v10 = v8;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  1LL,  "saved elevation profile push time,%{public}f",  &v9,  12);
    v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerElevationProfile saveLastPushedTime:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

- (double)retrieveLastPushedTime
{
  double v7 = 0.0;
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A82BC(v2, "CLElevationProfile_LastPushedTimestamp", &v7);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101877818);
  }
  uint64_t v3 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "retrieved elevation profile push time,%{public}f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101877818);
    }
    int v8 = 134349056;
    double v9 = v7;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  1LL,  "retrieved elevation profile push time,%{public}f",  &v8,  12);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLContextManagerElevationProfile retrieveLastPushedTime]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  return v7;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

@end