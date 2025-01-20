@interface CalTrackFinder
- (CalTrackFinder)init;
- (NSDate)timeEnd;
- (NSDate)timeEndGpsLocationSegment;
- (NSDate)timeStart;
- (NSDate)timeStartGpsLocationSegment;
- (NSMutableArray)gpsLocationBuffer;
- (NSMutableArray)gpsLocationBufferFiltered;
- (NSMutableArray)gpsOdometerBuffer;
- (NSMutableArray)pedometerBuffer;
- (double)_extremaRemovedMean:(double)a3[5];
- (double)distanceGps;
- (double)distanceRawPed;
- (double)steps;
- (id)_filterGpsLocationBuffer;
- (id)calTrackHandler;
- (int)gpsSource;
- (unint64_t)_removeAdditionalInconsistentSpeedPedometerEntries;
- (void)_calculateTimeStartEndDistanceGpsPed;
- (void)_clearBuffers;
- (void)_closeCurrentTrack;
- (void)_closeTrackCheckGpsLocation;
- (void)_closeTrackCheckGpsLocationFiltered;
- (void)_closeTrackCheckGpsOdometer;
- (void)_closeTrackCheckPedometer;
- (void)_updateGpsLocationBufferFiltered:(id)a3;
- (void)dealloc;
- (void)setCalTrackHandler:(id)a3;
- (void)setDistanceGps:(double)a3;
- (void)setDistanceRawPed:(double)a3;
- (void)setGpsLocationBuffer:(id)a3;
- (void)setGpsLocationBufferFiltered:(id)a3;
- (void)setGpsOdometerBuffer:(id)a3;
- (void)setGpsSource:(int)a3;
- (void)setPedometerBuffer:(id)a3;
- (void)setSteps:(double)a3;
- (void)setTimeEnd:(id)a3;
- (void)setTimeEndGpsLocationSegment:(id)a3;
- (void)setTimeStart:(id)a3;
- (void)setTimeStartGpsLocationSegment:(id)a3;
- (void)stop;
- (void)updateGpsLocationBuffer:(id)a3 gpsSource:(int)a4;
- (void)updateGpsOdometerBuffer:(CLOdometerEntry *)a3;
- (void)updatePedometerBuffer:(CLExtendedStepCountEntry *)a3;
@end

@implementation CalTrackFinder

- (CalTrackFinder)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CalTrackFinder;
  v2 = -[CalTrackFinder init](&v8, "init");
  if (v2)
  {
    *((void *)v2 + 3) =  +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  5LL);
    *((void *)v2 + 4) =  +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  2048LL);
    *((void *)v2 + 5) =  +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  2048LL);
    *((void *)v2 + 6) =  +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  1024LL);
    *((_DWORD *)v2 + 2) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *((void *)v2 + 13) = 0LL;
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    v3 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "initialize", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      v7[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "initialize",  v7,  2);
      v6 = (uint8_t *)v5;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder init]", "%s\n", v5);
      if (v6 != buf) {
        free(v6);
      }
    }
  }

  return (CalTrackFinder *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CalTrackFinder;
  -[CalTrackFinder dealloc](&v3, "dealloc");
}

- (void)stop
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10187D928);
  }
  objc_super v3 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CloseTrack,Stop", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,Stop",  v6,  2);
    v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder stop]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
}

- (void)updateGpsLocationBuffer:(id)a3 gpsSource:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_101934A90 != -1) {
    dispatch_once(&qword_101934A90, &stru_10187D948);
  }
  v7 = (os_log_s *)qword_101934A98;
  if (os_log_type_enabled((os_log_t)qword_101934A98, OS_LOG_TYPE_DEBUG))
  {
    [a3 coordinate];
    uint64_t v9 = v8;
    [a3 coordinate];
    uint64_t v11 = v10;
    [a3 horizontalAccuracy];
    uint64_t v13 = v12;
    [a3 speed];
    uint64_t v15 = v14;
    [a3 course];
    uint64_t v17 = v16;
    [a3 altitude];
    uint64_t v19 = v18;
    [a3 verticalAccuracy];
    uint64_t v21 = v20;
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 136317698;
    v70 = "CL-GPS-UnfilteredMultipleSources";
    __int16 v71 = 1024;
    *(_DWORD *)v72 = 1;
    *(_WORD *)&v72[4] = 2048;
    *(void *)&v72[6] = v9;
    __int16 v73 = 2048;
    uint64_t v74 = v11;
    __int16 v75 = 2048;
    uint64_t v76 = v13;
    __int16 v77 = 2048;
    uint64_t v78 = v15;
    __int16 v79 = 2048;
    uint64_t v80 = v17;
    __int16 v81 = 2048;
    uint64_t v82 = v19;
    __int16 v83 = 2048;
    uint64_t v84 = v21;
    __int16 v85 = 2048;
    uint64_t v86 = v22;
    __int16 v87 = 1024;
    int v88 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestam p,%0.3f,Source,%d",  buf,  0x68u);
  }

  if (sub_1002921D0(117, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A90 != -1) {
      dispatch_once(&qword_101934A90, &stru_10187D948);
    }
    uint64_t v26 = qword_101934A98;
    [a3 coordinate];
    uint64_t v28 = v27;
    [a3 coordinate];
    uint64_t v30 = v29;
    [a3 horizontalAccuracy];
    uint64_t v32 = v31;
    [a3 speed];
    uint64_t v34 = v33;
    [a3 course];
    uint64_t v36 = v35;
    [a3 altitude];
    uint64_t v38 = v37;
    [a3 verticalAccuracy];
    uint64_t v40 = v39;
    objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceReferenceDate");
    int v49 = 136317698;
    v50 = "CL-GPS-UnfilteredMultipleSources";
    __int16 v51 = 1024;
    *(_DWORD *)v52 = 1;
    *(_WORD *)&v52[4] = 2048;
    *(void *)&v52[6] = v28;
    __int16 v53 = 2048;
    uint64_t v54 = v30;
    __int16 v55 = 2048;
    uint64_t v56 = v32;
    __int16 v57 = 2048;
    uint64_t v58 = v34;
    __int16 v59 = 2048;
    uint64_t v60 = v36;
    __int16 v61 = 2048;
    uint64_t v62 = v38;
    __int16 v63 = 2048;
    uint64_t v64 = v40;
    __int16 v65 = 2048;
    uint64_t v66 = v41;
    __int16 v67 = 1024;
    int v68 = v4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v26,  2LL,  "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestam p,%0.3f,Source,%d",  (const char *)&v49,  104);
    v43 = (uint8_t *)v42;
    sub_10029211C("LOCATION", 1LL, 0, 2LL, "-[CalTrackFinder updateGpsLocationBuffer:gpsSource:]", "%s\n", v42);
    if (v43 != buf) {
      free(v43);
    }
  }

  if (!-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count")
    || (objc_msgSend( objc_msgSend(a3, "timestamp"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "lastObject"),  "timestamp")),  v23 >= 0.01))
  {
    -[CalTrackFinder setTimeEndGpsLocationSegment:]( self,  "setTimeEndGpsLocationSegment:",  [a3 timestamp]);
    if (-[CalTrackFinder gpsSource](self, "gpsSource") != (_DWORD)v4)
    {
      if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count")) {
        -[NSMutableArray removeAllObjects]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "removeAllObjects");
      }
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      v24 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v25 = -[CalTrackFinder gpsSource](self, "gpsSource");
        *(_DWORD *)buf = 134218240;
        v70 = (const char *)v25;
        __int16 v71 = 2048;
        *(void *)v72 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "CloseTrack,GpsSourceChange,GpsSourceOld,%ld,GpsSourceNew,%ld",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        uint64_t v44 = qword_101934518;
        unsigned int v45 = -[CalTrackFinder gpsSource](self, "gpsSource");
        int v49 = 134218240;
        v50 = (const char *)v45;
        __int16 v51 = 2048;
        *(void *)v52 = v4;
        LODWORD(v48) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v44,  2LL,  "CloseTrack,GpsSourceChange,GpsSourceOld,%ld,GpsSourceNew,%ld",  &v49,  v48);
        v47 = (uint8_t *)v46;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder updateGpsLocationBuffer:gpsSource:]", "%s\n", v46);
        if (v47 != buf) {
          free(v47);
        }
      }

      -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
    }

    -[CalTrackFinder setGpsSource:](self, "setGpsSource:", v4);
    if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") == (id)5) {
      -[NSMutableArray removeObjectAtIndex:]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "removeObjectAtIndex:",  0LL);
    }
    if (!-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count")) {
      -[CalTrackFinder setTimeStartGpsLocationSegment:]( self,  "setTimeStartGpsLocationSegment:",  [a3 timestamp]);
    }
    -[NSMutableArray addObject:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "addObject:", a3);
    -[CalTrackFinder _closeTrackCheckGpsLocation](self, "_closeTrackCheckGpsLocation");
    if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") == (id)5) {
      -[CalTrackFinder _updateGpsLocationBufferFiltered:]( self,  "_updateGpsLocationBufferFiltered:",  -[CalTrackFinder _filterGpsLocationBuffer](self, "_filterGpsLocationBuffer"));
    }
  }

- (void)_updateGpsLocationBufferFiltered:(id)a3
{
  if (!-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count")
    || (objc_msgSend( objc_msgSend(a3, "timestamp"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray lastObject]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "lastObject"),  "timestamp")),  v5 >= 0.01))
  {
    -[NSMutableArray addObject:]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "addObject:",  a3);
    -[CalTrackFinder _closeTrackCheckGpsLocationFiltered](self, "_closeTrackCheckGpsLocationFiltered");
  }

- (void)updateGpsOdometerBuffer:(CLOdometerEntry *)a3
{
  double v5 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
  objc_sync_enter(v5);
  if (-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count")
    && (v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3->startTime),  -[NSDate timeIntervalSinceDate:]( v6,  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"),  "date")),  v7 < 0.01))
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    uint64_t v16 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      double v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Suppressing duplicate GPS Odometer Entry from CalTrack %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      int v20 = 138412290;
      uint64_t v21 = v6;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  1LL,  "Suppressing duplicate GPS Odometer Entry from CalTrack %@",  &v20,  12);
      uint64_t v18 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder updateGpsOdometerBuffer:]", "%s\n", v17);
      if (v18 != buf) {
        free(v18);
      }
    }

    objc_sync_exit(v5);
  }

  else
  {
    uint64_t v8 = objc_alloc(&OBJC_CLASS___CMGpsOdometerEntry);
    __int128 v9 = *(_OWORD *)&a3->slope;
    v19[8] = *(_OWORD *)&a3->gpsCourseRadians;
    v19[9] = v9;
    CLOdometerTrackProximityInfo trackProximityInfo = a3->trackProximityInfo;
    v19[10] = *(_OWORD *)&a3->batchedLocationFixType;
    v19[11] = trackProximityInfo;
    __int128 v11 = *(_OWORD *)&a3->quality;
    v19[4] = *(_OWORD *)&a3->timestampGps;
    v19[5] = v11;
    __int128 v12 = *(_OWORD *)&a3->smoothedGPSAltitude;
    v19[6] = *(_OWORD *)&a3->groundAltitude;
    v19[7] = v12;
    __int128 v13 = *(_OWORD *)&a3->accuracy;
    v19[0] = *(_OWORD *)&a3->startTime;
    v19[1] = v13;
    __int128 v14 = *(_OWORD *)&a3->odometer;
    v19[2] = *(_OWORD *)&a3->speed;
    v19[3] = v14;
    uint64_t v15 = -[CMGpsOdometerEntry initWithOdometerEntry:](v8, "initWithOdometerEntry:", v19);
    -[NSMutableArray addObject:](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "addObject:", v15);

    objc_sync_exit(v5);
    -[CalTrackFinder _closeTrackCheckGpsOdometer](self, "_closeTrackCheckGpsOdometer");
  }

- (void)updatePedometerBuffer:(CLExtendedStepCountEntry *)a3
{
  if (a3->addition.firstStepTime >= 0.01 && a3->addition.lastStepTime >= 0.01)
  {
    if (!-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")
      || (-[NSDate timeIntervalSinceDate:]( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  a3->base.startTime),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"),  "date")),  v5 >= 0.01))
    {
      v6 = objc_alloc(&OBJC_CLASS___CMPedometerEntry);
      memcpy(v8, a3, sizeof(v8));
      double v7 = -[CMPedometerEntry initWithStepEntry:](v6, "initWithStepEntry:", v8);
      -[NSMutableArray addObject:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "addObject:", v7);

      -[CalTrackFinder _closeTrackCheckPedometer](self, "_closeTrackCheckPedometer");
    }
  }

- (id)_filterGpsLocationBuffer
{
  id v3 = -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "objectAtIndexedSubscript:",  2LL);
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "objectAtIndexedSubscript:",  i),  "coordinate");
    v102[i] = v5;
    objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "objectAtIndexedSubscript:",  i),  "coordinate");
    v101[i] = v6;
  }

  -[CalTrackFinder _extremaRemovedMean:](self, "_extremaRemovedMean:", v102);
  double v8 = v7;
  -[CalTrackFinder _extremaRemovedMean:](self, "_extremaRemovedMean:", v101);
  double v10 = v9;
  __int128 v11 = objc_alloc(&OBJC_CLASS___CLLocation);
  [v3 altitude];
  double v13 = v12;
  [v3 horizontalAccuracy];
  double v15 = v14;
  [v3 verticalAccuracy];
  double v17 = v16;
  [v3 course];
  double v19 = v18;
  [v3 speed];
  uint64_t v21 =  -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:]( v11,  "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:",  [v3 timestamp],  v8,  v10,  v13,  v15,  v17,  v19,  v20);
  if (qword_101934A90 != -1) {
    dispatch_once(&qword_101934A90, &stru_10187D948);
  }
  uint64_t v22 = (os_log_s *)qword_101934A98;
  if (os_log_type_enabled((os_log_t)qword_101934A98, OS_LOG_TYPE_DEBUG))
  {
    -[CLLocation coordinate](v21, "coordinate");
    uint64_t v24 = v23;
    -[CLLocation coordinate](v21, "coordinate");
    uint64_t v26 = v25;
    -[CLLocation horizontalAccuracy](v21, "horizontalAccuracy");
    uint64_t v28 = v27;
    -[CLLocation speed](v21, "speed");
    uint64_t v30 = v29;
    -[CLLocation course](v21, "course");
    uint64_t v32 = v31;
    -[CLLocation altitude](v21, "altitude");
    uint64_t v34 = v33;
    -[CLLocation verticalAccuracy](v21, "verticalAccuracy");
    uint64_t v36 = v35;
    -[NSDate timeIntervalSinceReferenceDate]( -[CLLocation timestamp](v21, "timestamp"),  "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 136317698;
    uint64_t v80 = "CL-GPS-Filtered";
    __int16 v81 = 1024;
    int v82 = 1;
    __int16 v83 = 2048;
    uint64_t v84 = v24;
    __int16 v85 = 2048;
    uint64_t v86 = v26;
    __int16 v87 = 2048;
    uint64_t v88 = v28;
    __int16 v89 = 2048;
    uint64_t v90 = v30;
    __int16 v91 = 2048;
    uint64_t v92 = v32;
    __int16 v93 = 2048;
    uint64_t v94 = v34;
    __int16 v95 = 2048;
    uint64_t v96 = v36;
    __int16 v97 = 2048;
    uint64_t v98 = v37;
    __int16 v99 = 1024;
    unsigned int v100 = -[CalTrackFinder gpsSource](self, "gpsSource");
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestam p,%0.3f,Source,%d",  buf,  0x68u);
  }

  if (sub_1002921D0(117, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A90 != -1) {
      dispatch_once(&qword_101934A90, &stru_10187D948);
    }
    uint64_t v39 = qword_101934A98;
    -[CLLocation coordinate](v21, "coordinate");
    uint64_t v41 = v40;
    -[CLLocation coordinate](v21, "coordinate");
    uint64_t v43 = v42;
    -[CLLocation horizontalAccuracy](v21, "horizontalAccuracy");
    uint64_t v45 = v44;
    -[CLLocation speed](v21, "speed");
    uint64_t v47 = v46;
    -[CLLocation course](v21, "course");
    uint64_t v49 = v48;
    -[CLLocation altitude](v21, "altitude");
    uint64_t v51 = v50;
    -[CLLocation verticalAccuracy](v21, "verticalAccuracy");
    uint64_t v53 = v52;
    -[NSDate timeIntervalSinceReferenceDate]( -[CLLocation timestamp](v21, "timestamp"),  "timeIntervalSinceReferenceDate");
    int v57 = 136317698;
    uint64_t v58 = "CL-GPS-Filtered";
    __int16 v59 = 1024;
    int v60 = 1;
    __int16 v61 = 2048;
    uint64_t v62 = v41;
    __int16 v63 = 2048;
    uint64_t v64 = v43;
    __int16 v65 = 2048;
    uint64_t v66 = v45;
    __int16 v67 = 2048;
    uint64_t v68 = v47;
    __int16 v69 = 2048;
    uint64_t v70 = v49;
    __int16 v71 = 2048;
    uint64_t v72 = v51;
    __int16 v73 = 2048;
    uint64_t v74 = v53;
    __int16 v75 = 2048;
    uint64_t v76 = v54;
    __int16 v77 = 1024;
    unsigned int v78 = -[CalTrackFinder gpsSource](self, "gpsSource");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v39,  2LL,  "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestam p,%0.3f,Source,%d",  (const char *)&v57,  104);
    uint64_t v56 = (uint8_t *)v55;
    sub_10029211C("LOCATION", 1LL, 0, 2LL, "-[CalTrackFinder _filterGpsLocationBuffer]", "%s\n", v55);
    if (v56 != buf) {
      free(v56);
    }
  }

  return v21;
}

- (double)_extremaRemovedMean:(double)a3[5]
{
  uint64_t v3 = 0LL;
  int v4 = 0;
  int v5 = 0;
  do
  {
    double v6 = a3[v3];
    if (v6 >= a3[v5]) {
      int v5 = v3;
    }
    if (v6 < a3[v4]) {
      int v4 = v3;
    }
    ++v3;
  }

  while (v3 != 5);
  uint64_t v7 = 0LL;
  a3[v5] = 0.0;
  a3[v4] = 0.0;
  double v8 = 0.0;
  do
    double v8 = v8 + a3[v7++];
  while (v7 != 5);
  return v8 / 3.0;
}

- (void)_calculateTimeStartEndDistanceGpsPed
{
  uint64_t v3 = +[NSArray arrayWithArray:]( &OBJC_CLASS___NSArray,  "arrayWithArray:",  -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"));
  if (-[NSArray count](v3, "count"))
  {
    id v4 = objc_msgSend(-[NSArray firstObject](v3, "firstObject"), "firstStepTime");
    id v5 = objc_msgSend(-[NSArray lastObject](v3, "lastObject"), "lastStepTime");
    if (v4)
    {
      double v6 = v5;
      if (v5)
      {
        [v4 timeIntervalSinceReferenceDate];
        double v8 = v7;
        [v6 timeIntervalSinceReferenceDate];
        if (v8 < v9)
        {
          double v10 = +[NSArray arrayWithArray:]( &OBJC_CLASS___NSArray,  "arrayWithArray:",  -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"));
          if (-[NSArray count](v10, "count"))
          {
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            __int128 v89 = 0u;
            __int128 v90 = 0u;
            id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v89,  v96,  16LL);
            if (v11)
            {
              uint64_t v12 = *(void *)v90;
              while (2)
              {
                for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v90 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  double v14 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)i);
                  objc_msgSend(objc_msgSend(v14, "timestamp"), "timeIntervalSinceReferenceDate");
                  double v16 = v15;
                  [v4 timeIntervalSinceReferenceDate];
                  if (v16 >= v17)
                  {
                    objc_msgSend(objc_msgSend(v14, "timestamp"), "timeIntervalSinceReferenceDate");
                    double v19 = v18;
                    [v6 timeIntervalSinceReferenceDate];
                    if (v19 <= v20)
                    {
                      id v11 = [v14 timestamp];
                      goto LABEL_17;
                    }
                  }
                }

                id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v89,  v96,  16LL);
                if (v11) {
                  continue;
                }
                break;
              }
            }

- (void)_closeTrackCheckGpsLocation
{
  if ((unint64_t)-[NSMutableArray count]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "count") >= 2)
  {
    objc_msgSend( objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "lastObject"),  "timestamp"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") - 2),  "timestamp"));
    double v4 = v3;
    if (v3 > 2.5)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      id v5 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "CloseTrack,GpsLocationEntryTimeOut,TimeSinceLastEntry,%0.2f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        int v8 = 134217984;
        double v9 = v4;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,GpsLocationEntryTimeOut,TimeSinceLastEntry,%0.2f",  COERCE_DOUBLE(&v8));
        double v7 = (uint8_t *)v6;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsLocation]", "%s\n", v6);
        if (v7 != buf) {
          free(v7);
        }
      }

      -[NSMutableArray removeAllObjects]( -[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"),  "removeAllObjects");
      -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
    }
  }

- (void)_closeTrackCheckGpsLocationFiltered
{
  if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count"))
  {
    objc_msgSend( -[NSMutableArray lastObject]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "lastObject"),  "horizontalAccuracy");
    double v4 = v3;
    if (v3 > 24.0)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      id v5 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "CloseTrack,GpsFilteredHorizontalAccuracyOutOfBounds,HorizontalAccuracy,%0.2f",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_29;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,GpsFilteredHorizontalAccuracyOutOfBounds,HorizontalAccuracy,%0.2f");
LABEL_35:
      double v14 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsLocationFiltered]", "%s\n", v6);
      if (v14 != buf) {
        free(v14);
      }
LABEL_29:
      -[NSMutableArray removeLastObject]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "removeLastObject");
      goto LABEL_30;
    }
  }

  if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count"))
  {
    objc_msgSend( -[NSMutableArray lastObject]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "lastObject"),  "speed");
    double v8 = v7;
    if (v7 <= 0.0 || v7 > 13.0)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v13 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CloseTrack,GpsFilteredSpeedOutOfBounds,Speed,%0.2f",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_29;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,GpsFilteredSpeedOutOfBounds,Speed,%0.2f");
      goto LABEL_35;
    }
  }

  if ((unint64_t)-[NSMutableArray count]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "count") < 0x800) {
    return;
  }
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10187D928);
  }
  double v9 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = -[NSMutableArray count]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "count");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "CloseTrack,NumSamplesMaxGpsFilteredLocation,NumSamples,%d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    uint64_t v10 = qword_101934518;
    v15[0] = 67109120;
    v15[1] = -[NSMutableArray count]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  2LL,  "CloseTrack,NumSamplesMaxGpsFilteredLocation,NumSamples,%d",  v15);
    uint64_t v12 = (uint8_t *)v11;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsLocationFiltered]", "%s\n", v11);
    if (v12 != buf) {
      free(v12);
    }
  }

- (void)_closeTrackCheckGpsOdometer
{
  double v3 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
  objc_sync_enter(v3);
  if ((unint64_t)-[NSMutableArray count]( -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"),  "count") < 2 || (objc_msgSend( objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"),  "date"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"),  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count")
            - 2),
            "date")),
        double v5 = v4,
        v4 <= 2.5))
  {
    objc_sync_exit(v3);
    double v7 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
    objc_sync_enter(v7);
    objc_msgSend( objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"),  "date"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"),  "date"));
    if (v8 <= 15.0
      || (objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"),  "dist"),  double v10 = v9,  objc_msgSend( -[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"),  "dist"),  v12 = v10 - v11,  v12 <= 200.0))
    {
      objc_sync_exit(v7);
      double v7 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
      objc_sync_enter(v7);
      objc_msgSend( objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"),  "date"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"),  "date"));
      double v15 = v14;
      if (v14 <= 500.0)
      {
        objc_sync_exit(v7);
        double v7 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
        objc_sync_enter(v7);
        if ((unint64_t)-[NSMutableArray count]( -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"),  "count") < 0x800)
        {
          objc_sync_exit(v7);
          return;
        }

        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        double v17 = (os_log_s *)qword_101934518;
        if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v28) = -[NSMutableArray count]( -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"),  "count");
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "CloseTrack,NumSamplesMaxGpsOdometer,NumSamples,%d",  buf,  8u);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_30;
        }
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        uint64_t v23 = qword_101934518;
        int v25 = 67109120;
        LODWORD(v26) = -[NSMutableArray count]( -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"),  "count");
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  2LL,  "CloseTrack,NumSamplesMaxGpsOdometer,NumSamples,%d",  &v25);
        double v19 = (uint8_t *)v24;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v24);
        if (v19 == buf)
        {
LABEL_30:
          objc_sync_exit(v7);
          -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
          return;
        }
      }

      else
      {
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        double v16 = (os_log_s *)qword_101934518;
        if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v28 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "CloseTrack,TimeSpanMax,Timespan,%0.2f",  buf,  0xCu);
        }

        if (!sub_1002921D0(115, 2)) {
          goto LABEL_30;
        }
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        int v25 = 134217984;
        double v26 = v15;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,TimeSpanMax,Timespan,%0.2f",  COERCE_DOUBLE(&v25));
        double v19 = (uint8_t *)v18;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v18);
        if (v19 == buf) {
          goto LABEL_30;
        }
      }
    }

    else
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v13 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v28 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "CloseTrack,DistanceGpsRoughMax,DistanceGpsRough,%0.2f",  buf,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_30;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      int v25 = 134217984;
      double v26 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,DistanceGpsRoughMax,DistanceGpsRough,%0.2f",  COERCE_DOUBLE(&v25));
      double v19 = (uint8_t *)v22;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v22);
      if (v19 == buf) {
        goto LABEL_30;
      }
    }

    free(v19);
    goto LABEL_30;
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10187D928);
  }
  double v6 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v28 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "CloseTrack,GpsOdometerEntryTimeOut,TimeSinceLastEntry,%0.2f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    int v25 = 134217984;
    double v26 = v5;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,GpsOdometerEntryTimeOut,TimeSinceLastEntry,%0.2f",  COERCE_DOUBLE(&v25));
    uint64_t v21 = (uint8_t *)v20;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v20);
    if (v21 != buf) {
      free(v21);
    }
  }

  -[NSMutableArray removeLastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "removeLastObject");
  objc_sync_exit(v3);
  -[CalTrackFinder _closeCurrentTrack](self, "_closeCurrentTrack");
}

- (void)_closeTrackCheckPedometer
{
  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    objc_msgSend( objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"),  "date"),  "timeIntervalSinceDate:",  objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") - 2),  "date"));
    double v4 = v3;
    if (v3 > 3.84)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v5 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v29 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "CloseTrack,PedometerEntryTimeOut,TimeSinceLastEntry,%0.2f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        LODWORD(v25) = 134217984;
        *(double *)((char *)&v25 + 4) = v4;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,PedometerEntryTimeOut,TimeSinceLastEntry,%0.2f",  COERCE_DOUBLE(&v25));
        uint64_t v23 = (uint8_t *)v22;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckPedometer]", "%s\n", v22);
        if (v23 != buf) {
          free(v23);
        }
      }

      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      goto LABEL_57;
    }
  }

  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    unsigned int v6 = objc_msgSend( -[NSMutableArray lastObject]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "lastObject"),  "deltaSteps");
    if (!(v6
         + objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "count")
                           - 2),
                           "deltaSteps")))
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v7 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "CloseTrack,NoStepsForTwoPedometerEntries",  buf,  2u);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_57;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      LOWORD(v25) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,NoStepsForTwoPedometerEntries",  &v25,  2,  v25,  v26,  v27);
      goto LABEL_66;
    }
  }

  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count"))
  {
    objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"),  "speedCurrent");
    if (v9 <= 0.0)
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      uint64_t v21 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "CloseTrack,PedometerSpeedCurrentZero",  buf,  2u);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_57;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,PedometerSpeedCurrentZero");
      goto LABEL_66;
    }
  }

  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"),  "speedCurrent");
    double v11 = v10;
    objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") - 2),  "speedCurrent");
    double v13 = v12;
    double v14 = 0.0;
    if (v12 > 0.01) {
      double v14 = (v11 - v12) / v12;
    }
    if (fabs(v14) > 0.1)
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v15 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        double v29 = v13;
        __int16 v30 = 2048;
        double v31 = v11;
        __int16 v32 = 2048;
        double v33 = v14 * 100.0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "CloseTrack,PedometerSpeedCurrentJump,SpeedCurrentPrev,%0.2f,SpeedCurrent,%0.2f,SpeedCurrentJumpPercent,%0.2f",  buf,  0x20u);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_57;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,PedometerSpeedCurrentJump,SpeedCurrentPrev,%0.2f,SpeedCurrent,%0.2f,SpeedCurrentJumpPercent,%0.2f");
      goto LABEL_66;
    }
  }

  if ((unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") >= 2)
  {
    objc_msgSend( -[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"),  "pedometerArmConstrainedState");
    int v17 = (int)v16;
    if ((int)v16)
    {
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v18 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "CloseTrack,PedometerArmConstrainedState,%d",  buf,  8u);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_57;
      }
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,PedometerArmConstrainedState,%d",  &v25);
      goto LABEL_66;
    }
  }

  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10187D928);
  }
  double v19 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = -[NSMutableArray count]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "count");
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "CloseTrack,NumSamplesMaxPedometer,NumSamples,%d",  buf,  8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    uint64_t v20 = qword_101934518;
    -[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  2LL,  "CloseTrack,NumSamplesMaxPedometer,NumSamples,%d",  &v25);
LABEL_66:
    uint64_t v24 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeTrackCheckPedometer]", "%s\n", v8);
    if (v24 != buf) {
      free(v24);
    }
  }

- (void)_closeCurrentTrack
{
  *(double *)&unint64_t v3 = COERCE_DOUBLE((id)-[CalTrackFinder _removeAdditionalInconsistentSpeedPedometerEntries]( self,  "_removeAdditionalInconsistentSpeedPedometerEntries"));
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10187D928);
  }
  double v4 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v78 = *(double *)&v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "CloseTrack,NumAdditionalPedometerEntriesRemoved,%ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    int v71 = 134217984;
    double v72 = *(double *)&v3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,NumAdditionalPedometerEntriesRemoved,%ld",  &v71);
    id v54 = (uint8_t *)v53;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v53);
    if (v54 != buf) {
      free(v54);
    }
  }

  -[CalTrackFinder _calculateTimeStartEndDistanceGpsPed](self, "_calculateTimeStartEndDistanceGpsPed");
  double v5 = objc_alloc(&OBJC_CLASS___CalibrationTrack);
  unsigned int v6 = -[CalTrackFinder timeStart](self, "timeStart");
  double v7 = -[CalTrackFinder timeEnd](self, "timeEnd");
  -[CalTrackFinder distanceGps](self, "distanceGps");
  double v9 = v8;
  -[CalTrackFinder distanceRawPed](self, "distanceRawPed");
  double v11 = v10;
  -[CalTrackFinder steps](self, "steps");
  double v13 =  -[CalibrationTrack initWithStart:stop:distanceGps:distanceRawPed:steps:gpsSource:]( v5,  "initWithStart:stop:distanceGps:distanceRawPed:steps:gpsSource:",  v6,  v7,  -[CalTrackFinder gpsSource](self, "gpsSource"),  v9,  v11,  v12);
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_10187D928);
  }
  double v14 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeStartGpsLocationSegment](self, "timeStartGpsLocationSegment"),  "timeIntervalSinceReferenceDate");
    double v16 = v15;
    -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeEndGpsLocationSegment](self, "timeEndGpsLocationSegment"),  "timeIntervalSinceReferenceDate");
    double v18 = v17;
    double v19 = COERCE_DOUBLE(objc_msgSend(-[CalibrationTrack description](v13, "description"), "UTF8String"));
    *(_DWORD *)buf = 134218498;
    double v78 = v16;
    __int16 v79 = 2048;
    double v80 = v18;
    __int16 v81 = 2080;
    double v82 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "CloseTrack,TrackMetrics,TimeStartGpsLocationSegment,%0.2f,TimeEndGpsLocationSegment,%0.2f,%s",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    uint64_t v55 = qword_101934518;
    -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeStartGpsLocationSegment](self, "timeStartGpsLocationSegment"),  "timeIntervalSinceReferenceDate");
    double v57 = v56;
    -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeEndGpsLocationSegment](self, "timeEndGpsLocationSegment"),  "timeIntervalSinceReferenceDate");
    double v59 = v58;
    double v60 = COERCE_DOUBLE(objc_msgSend(-[CalibrationTrack description](v13, "description"), "UTF8String"));
    int v71 = 134218498;
    double v72 = v57;
    __int16 v73 = 2048;
    double v74 = v59;
    __int16 v75 = 2080;
    double v76 = v60;
    LODWORD(v65) = 32;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v55,  2LL,  "CloseTrack,TrackMetrics,TimeStartGpsLocationSegment,%0.2f,TimeEndGpsLocationSegment,%0.2f,%s",  COERCE_DOUBLE(&v71),  v65,  (const char *)v66);
    double v62 = (uint8_t *)v61;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v61);
    if (v62 != buf) {
      free(v62);
    }
  }

  -[CalTrackFinder distanceGps](self, "distanceGps");
  if (v20 >= 100.0)
  {
    -[CalTrackFinder distanceGps](self, "distanceGps");
    double v27 = v26;
    -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeEnd](self, "timeEnd"),  "timeIntervalSinceReferenceDate");
    double v29 = v28;
    -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeStart](self, "timeStart"),  "timeIntervalSinceReferenceDate");
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    double v31 = v27 / (v29 - v30);
    __int16 v32 = -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered");
    id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v66,  v70,  16LL);
    if (v33)
    {
      id v34 = v33;
      unint64_t v35 = 0LL;
      uint64_t v36 = *(void *)v67;
      double v37 = 0.0;
      do
      {
        for (uint64_t i = 0LL; i != v34; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v67 != v36) {
            objc_enumerationMutation(v32);
          }
          id v39 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
          objc_msgSend(objc_msgSend(v39, "timestamp"), "timeIntervalSinceReferenceDate");
          double v41 = v40;
          -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeStart](self, "timeStart"),  "timeIntervalSinceReferenceDate");
          if (v41 >= v42)
          {
            objc_msgSend(objc_msgSend(v39, "timestamp"), "timeIntervalSinceReferenceDate");
            double v44 = v43;
            -[NSDate timeIntervalSinceReferenceDate]( -[CalTrackFinder timeEnd](self, "timeEnd"),  "timeIntervalSinceReferenceDate");
            if (v44 <= v45)
            {
              [v39 speed];
              double v37 = v37 + v46;
              ++v35;
            }
          }
        }

        id v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v66,  v70,  16LL);
      }

      while (v34);
      if (v35) {
        double v47 = v37 / (double)v35;
      }
      else {
        double v47 = 0.0;
      }
    }

    else
    {
      double v47 = 0.0;
    }

    double v48 = 1.0;
    if (v31 > 0.0) {
      double v48 = (v47 - v31) / v31;
    }
    if (fabs(v48) <= 0.2)
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v51 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "CloseTrack,Success", buf, 2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        LOWORD(v71) = 0;
        LODWORD(v65) = 2;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseTrack,Success",  &v71,  *(void *)&v65);
        double v64 = (uint8_t *)v63;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v63);
        if (v64 != buf) {
          free(v64);
        }
      }

      if (-[CalTrackFinder calTrackHandler](self, "calTrackHandler"))
      {
        double v52 = -[CalTrackFinder calTrackHandler](self, "calTrackHandler");
        v52[2](v52, v13);
      }
    }

    else
    {
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      double v49 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        double v78 = v47;
        __int16 v79 = 2048;
        double v80 = v31;
        __int16 v81 = 2048;
        double v82 = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEBUG,  "CloseCurrentTrack,Fail,GpsSpeedDiscrepancyDetected,SpeedGpsRawMean,%0.2f,GpsDistanceOverTime,%0.2f,SpeedErrorPercent,%0.2f",  buf,  0x20u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_10187D928);
        }
        int v71 = 134218496;
        double v72 = v47;
        __int16 v73 = 2048;
        double v74 = v31;
        __int16 v75 = 2048;
        double v76 = v48;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "CloseCurrentTrack,Fail,GpsSpeedDiscrepancyDetected,SpeedGpsRawMean,%0.2f,GpsDistanceOverTime,%0.2f,SpeedErrorPercent,%0.2f");
        goto LABEL_45;
      }
    }
  }

  else
  {
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_10187D928);
    }
    uint64_t v21 = (os_log_s *)qword_101934518;
    if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
    {
      -[CalTrackFinder distanceGps](self, "distanceGps");
      *(_DWORD *)buf = 134217984;
      double v78 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "CloseTrack,Fail,DistanceGpsNotSufficient,DistanceGps,%0.2f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_10187D928);
      }
      uint64_t v23 = qword_101934518;
      -[CalTrackFinder distanceGps](self, "distanceGps");
      int v71 = 134217984;
      double v72 = v24;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v23,  2LL,  "CloseTrack,Fail,DistanceGpsNotSufficient,DistanceGps,%0.2f");
LABEL_45:
      id v50 = (uint8_t *)v25;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v25);
      if (v50 != buf) {
        free(v50);
      }
    }
  }

  -[CalTrackFinder _clearBuffers](self, "_clearBuffers");
}

- (unint64_t)_removeAdditionalInconsistentSpeedPedometerEntries
{
  uint64_t v3 = -1LL;
  for (unint64_t i = 1LL; ; ++i)
  {
    id v5 = (unint64_t)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") <= 8
       ? -[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")
       : (id)8;
    unsigned int v6 = (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") + v3;
    objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  v6),  "speedCurrent");
    double v7 = 1.0;
    if (v8 > 0.01)
    {
      objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  v6),  "speedInstant");
      double v10 = v9;
      objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  v6),  "speedCurrent");
      double v12 = v10 - v11;
      objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:]( -[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"),  "objectAtIndexedSubscript:",  v6),  "speedCurrent");
      double v7 = v12 / v13;
    }

    if (fabs(v7) < 0.1) {
      break;
    }
    -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
    --v3;
  }

  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")) {
    -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
  }
  else {
    --i;
  }
  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count"))
  {
    ++i;
    -[NSMutableArray removeLastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeLastObject");
  }

  return i;
}

- (void)_clearBuffers
{
  if (-[NSMutableArray count](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "count")) {
    -[NSMutableArray removeAllObjects]( -[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"),  "removeAllObjects");
  }
  uint64_t v3 = -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer");
  objc_sync_enter(v3);
  if (-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count")) {
    -[NSMutableArray removeAllObjects]( -[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"),  "removeAllObjects");
  }
  objc_sync_exit(v3);
  if (-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")) {
    -[NSMutableArray removeAllObjects](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "removeAllObjects");
  }
}

- (id)calTrackHandler
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCalTrackHandler:(id)a3
{
}

- (NSMutableArray)gpsLocationBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setGpsLocationBuffer:(id)a3
{
}

- (NSMutableArray)gpsLocationBufferFiltered
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setGpsLocationBufferFiltered:(id)a3
{
}

- (NSMutableArray)gpsOdometerBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setGpsOdometerBuffer:(id)a3
{
}

- (NSMutableArray)pedometerBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPedometerBuffer:(id)a3
{
}

- (NSDate)timeStart
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTimeStart:(id)a3
{
}

- (NSDate)timeEnd
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTimeEnd:(id)a3
{
}

- (NSDate)timeStartGpsLocationSegment
{
  return (NSDate *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTimeStartGpsLocationSegment:(id)a3
{
}

- (NSDate)timeEndGpsLocationSegment
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setTimeEndGpsLocationSegment:(id)a3
{
}

- (double)distanceGps
{
  return self->_distanceGps;
}

- (void)setDistanceGps:(double)a3
{
  self->_distanceGps = a3;
}

- (double)distanceRawPed
{
  return self->_distanceRawPed;
}

- (void)setDistanceRawPed:(double)a3
{
  self->_distanceRawPed = a3;
}

- (double)steps
{
  return self->_steps;
}

- (void)setSteps:(double)a3
{
  self->_steps = a3;
}

- (int)gpsSource
{
  return self->_gpsSource;
}

- (void)setGpsSource:(int)a3
{
  self->_gpsSource = a3;
}

@end