@interface CLContextManagerSignificantLocationVisit
+ (BOOL)isInsideSanctionedFloorTransitionPolygon:(CLLocationCoordinate2D)a3;
+ (BOOL)isInsideSanctionedPolygon:(CLLocationCoordinate2D)a3;
- (BOOL)duringVisit;
- (BOOL)hasPressureChangeFrom:(double)a3 to:(double)a4;
- (BOOL)isDeparture:(id)a3;
- (BOOL)isEntry:(id)a3;
- (BOOL)shouldSubmit:(int64_t)a3 calibrationType:(unint64_t)a4;
- (BOOL)shouldTriggerFloorTransitionHarvest:(float)a3 atTime:(double)a4;
- (BOOL)valid;
- (CLContextManagerSignificantLocationVisit)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLLocationCoordinate2D)currentVisitLocation;
- (double)currentVisitHorizontalUncertainty;
- (double)timeUserGetCloseToVisitLocation;
- (id).cxx_construct;
- (void)cleanup;
- (void)dealloc;
- (void)onVisit:(id)a3;
- (void)sendTrackFrom:(double)a3 to:(double)a4 location:(CLLocationCoordinate2D)a5 horrUnc:(double)a6 type:(unint64_t)a7;
- (void)setCurrentVisitHorizontalUncertainty:(double)a3;
- (void)setCurrentVisitLocation:(CLLocationCoordinate2D)a3;
- (void)setDuringVisit:(BOOL)a3;
- (void)setValid:(BOOL)a3;
- (void)sourceUpdated:(unint64_t)a3;
- (void)startBuffering;
- (void)stopBuffering;
@end

@implementation CLContextManagerSignificantLocationVisit

- (CLContextManagerSignificantLocationVisit)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CLContextManagerSignificantLocationVisit;
  v6 = -[CLBarometerCalibrationContextManager initWithUniverse:delegate:withBuffer:withSourceAggregator:]( &v13,  "initWithUniverse:delegate:withBuffer:withSourceAggregator:",  a3,  a4,  a5,  a6);
  v7 = v6;
  if (v6)
  {
    v8 = (CLRoutineMonitorServiceProtocol *) objc_msgSend( -[CLIntersiloUniverse vendor](v6->super._universe, "vendor"),  "proxyForService:",  @"CLRoutineMonitor");
    v7->_routineMonitorProxy = v8;
    if (v8)
    {
      -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:]( v8,  "registerDelegate:inSilo:",  v7,  -[CLIntersiloUniverse silo](v7->super._universe, "silo"));
      -[CLRoutineMonitorServiceProtocol setDelegateEntityName:]( v7->_routineMonitorProxy,  "setDelegateEntityName:",  "CLBarometerCalibration");
      -[CLRoutineMonitorServiceProtocol startLeechingVisitsForClient:]( v7->_routineMonitorProxy,  "startLeechingVisitsForClient:",  v7);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101879420);
      }
      v9 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:SignificantLocationVisit notification enabled}",  buf,  0x12u);
      }

      v7->_valid = 1;
      v7->_duringVisit = 0;
      v7->lastSLVUpdateTimestamp = CFAbsoluteTimeGetCurrent();
      v7->lastFloorTransitionUpdateTimestamp = CFAbsoluteTimeGetCurrent();
      v7->numWorkSubmissions = 0;
      v7->numUnknownSubmissions = 0;
      sub_1004F2598();
      unsigned __int8 v12 = sub_1004F8A40() ^ 1;
      sub_1012049AC(buf, "BarometerCalibrationEnableSanctionedPolygons", &v12, 0);
      v7->useSanctionedPolygons = buf[1];
      -[CLContextManagerSignificantLocationVisit startBuffering](v7, "startBuffering");
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      memset(buf, 0, sizeof(buf));
      sub_100C3CB14(&v7->_floorTransitionDetector.fBuffer.__map_.__first_, buf);
      *(_OWORD *)&v7->_floorTransitionDetector.fInTransition = v16;
      sub_100231C10(buf);
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101879420);
      }
      v10 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:SignificantLocationVisit notification disabled}",  buf,  0x12u);
      }

      v7->_valid = 0;
      v7->_duringVisit = 0;
    }
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLContextManagerSignificantLocationVisit;
  -[CLBarometerCalibrationContextManager dealloc](&v3, "dealloc");
}

- (void)cleanup
{
}

- (void)startBuffering
{
}

- (void)stopBuffering
{
}

- (void)onVisit:(id)a3
{
  if (-[CLContextManagerSignificantLocationVisit isEntry:](self, "isEntry:"))
  {
    self->_duringVisit = 1;
    [a3 coordinate];
    -[CLContextManagerSignificantLocationVisit setCurrentVisitLocation:](self, "setCurrentVisitLocation:");
    [a3 horizontalAccuracy];
    -[CLContextManagerSignificantLocationVisit setCurrentVisitHorizontalUncertainty:]( self,  "setCurrentVisitHorizontalUncertainty:");
  }

  else if (-[CLContextManagerSignificantLocationVisit isDeparture:](self, "isDeparture:", a3))
  {
    self->_duringVisit = 0;
  }

  if (!self->useSanctionedPolygons) {
    goto LABEL_8;
  }
  [a3 coordinate];
  if (+[CLContextManagerSignificantLocationVisit isInsideSanctionedPolygon:]( &OBJC_CLASS___CLContextManagerSignificantLocationVisit,  "isInsideSanctionedPolygon:"))
  {
    -[CLContextManagerSignificantLocationVisit startBuffering](self, "startBuffering");
LABEL_8:
    v5 = objc_alloc(&OBJC_CLASS___CLLocation);
    [a3 coordinate];
    double v7 = v6;
    [a3 coordinate];
    v8 = -[CLLocation initWithLatitude:longitude:](v5, "initWithLatitude:longitude:", v7);
    routineMonitorProxy = self->_routineMonitorProxy;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100C3AFC8;
    v11[3] = &unk_10181A300;
    v11[4] = self;
    v11[5] = a3;
    -[CLRoutineMonitorServiceProtocol fetchLocationOfInterestAtLocation:withReply:]( routineMonitorProxy,  "fetchLocationOfInterestAtLocation:withReply:",  v8,  v11);

    return;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  v10 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v13 = 0;
    __int16 v14 = 2082;
    __int128 v15 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:received visit not inside sanctioned polygons}",  buf,  0x12u);
  }

- (BOOL)isEntry:(id)a3
{
  if (a3)
  {
    unsigned int v4 = [a3 hasArrivalDate];
    if (v4) {
      LOBYTE(v4) = [a3 hasDepartureDate] ^ 1;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isDeparture:(id)a3
{
  else {
    return 0;
  }
}

- (BOOL)shouldSubmit:(int64_t)a3 calibrationType:(unint64_t)a4
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  double v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    int numWorkSubmissions = self->numWorkSubmissions;
    int numUnknownSubmissions = self->numUnknownSubmissions;
    int v19 = 68290050;
    __int16 v21 = 2082;
    int v20 = 0;
    v22 = "";
    __int16 v23 = 1026;
    *(_DWORD *)v24 = numWorkSubmissions;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = numUnknownSubmissions;
    *(_WORD *)v25 = 2050;
    *(void *)&v25[2] = a3;
    __int16 v26 = 2050;
    unint64_t v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:number of submissions so far. , numWorkSubmissions:%{public}d, numUnknownSubmission s:%{public}d, loiType:%{public}ld, calibrationType:%{public}ld}",  (uint8_t *)&v19,  0x32u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  if (a4 == 4) {
    goto LABEL_22;
  }
  if (a4 == 3)
  {
    double v11 = self->lastSLVUpdateTimestamp + 86400.0;
    if (Current >= v11)
    {
      if (Current > v11)
      {
        do
        {
          double v17 = v11;
          double v11 = v11 + 86400.0;
        }

        while (Current > v11);
        self->lastSLVUpdateTimestamp = v17;
      }

      self->int numWorkSubmissions = 0;
      self->int numUnknownSubmissions = 0;
      goto LABEL_22;
    }

    if (a3 == -1)
    {
      uint64_t v12 = 73LL;
      unsigned int v13 = self->numUnknownSubmissions;
      unsigned int v14 = *((_DWORD *)sub_100C383CC() + 1);
    }

    else
    {
      if (a3 != 1) {
        goto LABEL_23;
      }
      uint64_t v12 = 72LL;
      unsigned int v13 = self->numWorkSubmissions;
      unsigned int v14 = *((_DWORD *)sub_100C383CC() + 2);
    }

    if (v14 > v13)
    {
      ++*((_BYTE *)&self->super.super.isa + v12);
LABEL_22:
      LOBYTE(v16) = 1;
      return v16;
    }

- (void)sendTrackFrom:(double)a3 to:(double)a4 location:(CLLocationCoordinate2D)a5 horrUnc:(double)a6 type:(unint64_t)a7
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  unsigned int v14 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 68289539;
    v16[1] = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2049;
    double v20 = a3;
    __int16 v21 = 2049;
    double v22 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:Sending track to buffer, start_s:%{private}.09f, end_s:%{private}.09f}",  (uint8_t *)v16,  0x26u);
  }

  __int128 v15 = objc_opt_new(&OBJC_CLASS___CLBarometerCalibrationTrack);
  -[CLBarometerCalibrationTrack setFNotification:](v15, "setFNotification:", 0LL);
  -[CLBarometerCalibrationTrack setFType:](v15, "setFType:", a7);
  -[CLBarometerCalibrationTrack setFStartTime:](v15, "setFStartTime:", a3);
  -[CLBarometerCalibrationTrack setFEndTime:](v15, "setFEndTime:", a4);
  -[CLBarometerCalibrationTrack setFLocationCoordinates:](v15, "setFLocationCoordinates:", latitude, longitude);
  -[CLBarometerCalibrationTrack setFLocationHorizontalUncertainty:](v15, "setFLocationHorizontalUncertainty:", a6);
  -[CLBarometerCalibrationContextClient startTrack:](self->super._delegate, "startTrack:", v15);
  -[CLBarometerCalibrationContextClient stopTrack:](self->super._delegate, "stopTrack:", v15);
}

- (BOOL)hasPressureChangeFrom:(double)a3 to:(double)a4
{
  fDataBuffers = self->super.fDataBuffers;
  uint64_t v5 = fDataBuffers[7];
  if (fDataBuffers[8] == v5
    || (unint64_t v6 = fDataBuffers[10],
        double v7 = (void *)(v5 + 8 * (v6 >> 8)),
        uint64_t v8 = *v7 + 16LL * v6,
        uint64_t v9 = *(void *)(v5 + (((fDataBuffers[11] + v6) >> 5) & 0x7FFFFFFFFFFFFF8LL))
           + 16LL * (*((_BYTE *)fDataBuffers + 88) + v6),
        v8 == v9))
  {
    float v13 = 3.4028e38;
    float v12 = 1.1755e-38;
  }

  else
  {
    double v11 = a3;
    float v12 = 1.1755e-38;
    float v13 = 3.4028e38;
    do
    {
      unsigned int v14 = *(double **)v8;
      __int128 v15 = *(std::__shared_weak_count **)(v8 + 8);
      if (v15)
      {
        p_shared_owners = (unint64_t *)&v15->__shared_owners_;
        do
          unint64_t v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }

      a3 = *v14;
      if (*v14 > v11 && a3 < a4)
      {
        a3 = v14[1];
        if (a3 < v13) {
          float v13 = a3;
        }
        if (a3 > v12) {
          float v12 = a3;
        }
      }

      if (v15)
      {
        __int16 v19 = (unint64_t *)&v15->__shared_owners_;
        do
          unint64_t v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *, SEL, __n128))v15->__on_zero_shared)(v15, a2, *(__n128 *)&a3);
          std::__shared_weak_count::__release_weak(v15);
        }
      }

      v8 += 16LL;
      if (v8 - *v7 == 4096)
      {
        uint64_t v21 = v7[1];
        ++v7;
        uint64_t v8 = v21;
      }
    }

    while (v8 != v9);
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  double v22 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    v24[0] = 68289283;
    v24[1] = 0;
    __int16 v25 = 2082;
    __int16 v26 = "";
    __int16 v27 = 2049;
    double v28 = (float)(v12 - v13);
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:pressure range check, pressure change:%{private}.6f}",  (uint8_t *)v24,  0x1Cu);
  }

  return v12 > (float)(v13 + 0.005);
}

- (double)timeUserGetCloseToVisitLocation
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  unsigned int v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
    double v6 = v5;
    -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
    *(_DWORD *)buf = 68289539;
    int v42 = 0;
    __int16 v43 = 2082;
    v44 = "";
    __int16 v45 = 2049;
    double v46 = v6;
    __int16 v47 = 2049;
    double v48 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:checking distance to visit, visitLat:%{private}7f, visitLon:%{private}7f}",  buf,  0x26u);
  }

  -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
  double v9 = v8;
  -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
  if (sub_1002954D0(v9, v10))
  {
    fDataBuffers = self->super.fDataBuffers;
    uint64_t v12 = fDataBuffers[1];
    double v13 = -1.0;
    if (fDataBuffers[2] != v12)
    {
      unint64_t v14 = fDataBuffers[4];
      __int128 v15 = (void *)(v12 + 8 * (v14 >> 8));
      BOOL v16 = (double **)(*v15 + 16LL * v14);
      uint64_t v17 = *(void *)(v12 + (((fDataBuffers[5] + v14) >> 5) & 0x7FFFFFFFFFFFFF8LL))
          + 16LL * (*((_BYTE *)fDataBuffers + 40) + v14);
      if (v16 != (double **)v17)
      {
        char v18 = 0;
        while (1)
        {
          __int16 v19 = *v16;
          unint64_t v20 = (std::__shared_weak_count *)v16[1];
          if (v20)
          {
            p_shared_owners = (unint64_t *)&v20->__shared_owners_;
            do
              unint64_t v22 = __ldxr(p_shared_owners);
            while (__stxr(v22 + 1, p_shared_owners));
          }

          if (v19)
          {
            int v23 = 0;
            double v24 = v19[4];
            if (v24 > 0.0 && v24 < 66.0)
            {
              double v25 = v19[1];
              double v26 = v19[2];
              -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
              double v28 = v27;
              -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
              double v30 = sub_100D2EC74(v25, v26, v28, v29);
              if (v30 <= 400.0)
              {
                if ((v18 & (v30 < 400.0)) == 1)
                {
                  double v2 = *v19;
                  char v18 = 1;
                  int v23 = 1;
                }

                else
                {
                  int v23 = 0;
                }
              }

              else
              {
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_101879420);
                }
                v31 = (os_log_s *)qword_1019346A8;
                if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
                {
                  double v32 = *v19;
                  uint64_t v33 = *((void *)v19 + 1);
                  uint64_t v34 = *((void *)v19 + 2);
                  *(_DWORD *)buf = 68290051;
                  int v42 = 0;
                  __int16 v43 = 2082;
                  v44 = "";
                  __int16 v45 = 2050;
                  double v46 = v32;
                  __int16 v47 = 2050;
                  double v48 = v30;
                  __int16 v49 = 2049;
                  uint64_t v50 = v33;
                  __int16 v51 = 2049;
                  uint64_t v52 = v34;
                  _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:faraway location encountered, time_s:%{public}.09f, distance: %{public}.2f, locLat:%{private}7f, locLon:%{private}7f}",  buf,  0x3Au);
                }

                int v23 = 7;
                char v18 = 1;
              }
            }
          }

          else
          {
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_101879420);
            }
            v35 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289026;
              int v42 = 0;
              __int16 v43 = 2082;
              v44 = "";
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:no location recorded}",  buf,  0x12u);
            }

            int v23 = 6;
          }

          if (!v20) {
            goto LABEL_30;
          }
          v36 = (unint64_t *)&v20->__shared_owners_;
          do
            unint64_t v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
            if (!v23) {
              goto LABEL_32;
            }
          }

          else
          {
LABEL_30:
            if (!v23) {
              goto LABEL_32;
            }
          }

          if (v23 != 7)
          {
            if (v23 == 6) {
              return -1.0;
            }
            else {
              return v2;
            }
          }

- (void)sourceUpdated:(unint64_t)a3
{
  if (a3 != 1 || !self->_duringVisit) {
    return;
  }
  sub_1004908E0((uint64_t)&v36, (void *)self->super.fDataBuffers + 6);
  __int128 v35 = v4;
  double v5 = *(std::__shared_weak_count **)(*(void *)(v37 + (((unint64_t)(v39 + v38 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL))
  if (*((void *)&v4 + 1))
  {
    double v6 = (unint64_t *)(*((void *)&v4 + 1) + 8LL);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  double v8 = (double *)v4;
  double v9 = *(double *)v4;
  if (*(double *)v4 <= 0.0)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101879420);
    }
    uint64_t v16 = qword_1019346A8;
    if (!os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_50;
    }
    double v18 = *v8;
    double v17 = v8[1];
    *(_DWORD *)buf = 68289539;
    int v41 = 0;
    __int16 v42 = 2082;
    __int16 v43 = "";
    __int16 v44 = 2049;
    double v45 = v17;
    __int16 v46 = 2050;
    double v47 = v18;
    double v13 = "{\"msg%{public}.0s\":\"received invalid pressure / time from source aggregator\", \"pressure\":\"%{private}5f\""
          ", time_s:%{public}.09f}";
    unint64_t v14 = (os_log_s *)v16;
    uint32_t v15 = 38;
  }

  else
  {
    double v10 = *(double *)(v4 + 8);
    if (v9 == 1.79769313e308 || v10 == 1.79769313e308)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101879420);
      }
      uint64_t v12 = qword_1019346A8;
      if (!os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 68289026;
      int v41 = 0;
      __int16 v42 = 2082;
      __int16 v43 = "";
      double v13 = "{msg%{public}.0s:received DBL_MAX pressure / TIME from source aggregator}";
    }

    else
    {
      *(float *)&double v10 = v10;
      if (!-[CLContextManagerSignificantLocationVisit shouldTriggerFloorTransitionHarvest:atTime:]( self,  "shouldTriggerFloorTransitionHarvest:atTime:",  v10,  v35)) {
        goto LABEL_50;
      }
      if (self->useSanctionedPolygons
        && (-[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation"),
            !+[CLContextManagerSignificantLocationVisit isInsideSanctionedFloorTransitionPolygon:]( &OBJC_CLASS___CLContextManagerSignificantLocationVisit,  "isInsideSanctionedFloorTransitionPolygon:")))
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101879420);
        }
        uint64_t v12 = qword_1019346A8;
        if (!os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 68289026;
        int v41 = 0;
        __int16 v42 = 2082;
        __int16 v43 = "";
        double v13 = "{msg%{public}.0s:floor transition is not inside sanctioned polygons}";
      }

      else
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101879420);
        }
        unint64_t v20 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289026;
          int v41 = 0;
          __int16 v42 = 2082;
          __int16 v43 = "";
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:trigger floor transition harvest}",  buf,  0x12u);
        }

        if (-[CLContextManagerSignificantLocationVisit shouldSubmit:calibrationType:]( self,  "shouldSubmit:calibrationType:",  -1LL,  4LL))
        {
          double v21 = *v8;
          -[CLContextManagerSignificantLocationVisit timeUserGetCloseToVisitLocation]( self,  "timeUserGetCloseToVisitLocation");
          double v23 = v22;
          double v24 = v21 + -600.0;
          if (v22 >= 0.0)
          {
            if (v22 > v24)
            {
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_101879420);
              }
              double v26 = (os_log_s *)qword_1019346A8;
              if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 68289538;
                int v41 = 0;
                __int16 v42 = 2082;
                __int16 v43 = "";
                __int16 v44 = 2050;
                double v45 = v24;
                __int16 v46 = 2050;
                double v47 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:truncate period before user moved into close radius of the visit, defaultSt artTimestamp_s:%{public}.09f, timeUserBecomesCloseToSLV_s:%{public}.09f}",  buf,  0x26u);
              }

              double v24 = v23;
            }
          }

          else
          {
            if (qword_1019346A0 != -1) {
              dispatch_once(&qword_1019346A0, &stru_101879420);
            }
            double v25 = (os_log_s *)qword_1019346A8;
            if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289026;
              int v41 = 0;
              __int16 v42 = 2082;
              __int16 v43 = "";
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:no locations indicating user moved into close radius of the visit}",  buf,  0x12u);
            }
          }

          double v27 = *v8;
          -[CLContextManagerSignificantLocationVisit currentVisitLocation](self, "currentVisitLocation");
          double v29 = v28;
          double v31 = v30;
          -[CLContextManagerSignificantLocationVisit currentVisitHorizontalUncertainty]( self,  "currentVisitHorizontalUncertainty");
          -[CLContextManagerSignificantLocationVisit sendTrackFrom:to:location:horrUnc:type:]( self,  "sendTrackFrom:to:location:horrUnc:type:",  4LL,  v24,  v27,  v29,  v31,  v32);
          sub_10067FEA8((uint64_t)&self->_floorTransitionDetector);
          goto LABEL_50;
        }

        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101879420);
        }
        uint64_t v12 = qword_1019346A8;
        if (!os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_50;
        }
        *(_DWORD *)buf = 68289026;
        int v41 = 0;
        __int16 v42 = 2082;
        __int16 v43 = "";
        double v13 = "{msg%{public}.0s:number of submissions exceeded for floor transition traces, submission denied}";
      }
    }

    unint64_t v14 = (os_log_s *)v12;
    uint32_t v15 = 18;
  }

  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, v13, buf, v15);
LABEL_50:
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  sub_10049108C(&v36);
}

- (BOOL)shouldTriggerFloorTransitionHarvest:(float)a3 atTime:(double)a4
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  unint64_t v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2049;
    double v18 = a3;
    __int16 v19 = 2050;
    double v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:received floor transition detection request, pressure:%{private}5f, time_s: %{public}.09f}",  (uint8_t *)&v13,  0x26u);
  }

  p_floorTransitionDetector = &self->_floorTransitionDetector;
  sub_10067FAC4((uint64_t)p_floorTransitionDetector, a3, a4);
  double v9 = sub_10067FEA0((uint64_t)p_floorTransitionDetector);
  if (v9 == 0.0) {
    return 0;
  }
  double v11 = v9;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  uint64_t v12 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 68289283;
    int v14 = 0;
    __int16 v15 = 2082;
    uint64_t v16 = "";
    __int16 v17 = 2049;
    double v18 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:floor transition detected, transition time_s:%{private}.09f}",  (uint8_t *)&v13,  0x1Cu);
  }

  return a4 - v11 <= 600.0 && a4 - v11 >= 180.0;
}

+ (BOOL)isInsideSanctionedPolygon:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  double v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = 68289539LL;
    *(_WORD *)double v10 = 2082;
    *(void *)&v10[2] = "";
    __int16 v11 = 2049;
    CLLocationDegrees v12 = latitude;
    __int16 v13 = 2049;
    CLLocationDegrees v14 = longitude;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:received request to resolve whether the following location is inside sanctioned polygons:  , lat:%{private}6f, lon:%{private}6f}",  (uint8_t *)&v9,  0x26u);
  }

  uint64_t v9 = *(void *)&longitude;
  *(CLLocationDegrees *)double v10 = latitude;
  double v6 = &qword_10199B048;
  uint64_t v7 = 7600LL;
  while (!sub_100A3F7A4((double *)v6 + 3, (double *)&v9) || (sub_100A3F648((__int128 **)v6, (__int128 *)&v9) & 1) == 0)
  {
    v6 += 10;
    v7 -= 80LL;
    if (!v7) {
      return 0;
    }
  }

  return 1;
}

+ (BOOL)isInsideSanctionedFloorTransitionPolygon:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101879420);
  }
  double v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = 68289539LL;
    *(_WORD *)uint64_t v9 = 2082;
    *(void *)&v9[2] = "";
    __int16 v10 = 2049;
    CLLocationDegrees v11 = latitude;
    __int16 v12 = 2049;
    CLLocationDegrees v13 = longitude;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:received request to resolve whether the following location is inside sanctioned floor trans ition polygons: , lat:%{private}6f, lon:%{private}6f}",  (uint8_t *)&v8,  0x26u);
  }

  uint64_t v8 = *(void *)&longitude;
  *(CLLocationDegrees *)uint64_t v9 = latitude;
  unint64_t v6 = 0x1FFFFFFFFFFFFF60uLL;
  while (!sub_100A3F7A4((double *)&qword_10199CDE0[v6 + 166], (double *)&v8)
       || (sub_100A3F648((__int128 **)&qword_10199CDE0[v6 + 163], (__int128 *)&v8) & 1) == 0)
  {
    v6 += 10LL;
    if (!(v6 * 8)) {
      return 0;
    }
  }

  return 1;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)duringVisit
{
  return self->_duringVisit;
}

- (void)setDuringVisit:(BOOL)a3
{
  self->_duringVisit = a3;
}

- (CLLocationCoordinate2D)currentVisitLocation
{
  double latitude = self->_currentVisitLocation.latitude;
  double longitude = self->_currentVisitLocation.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCurrentVisitLocation:(CLLocationCoordinate2D)a3
{
  self->_currentVisitLocation = a3;
}

- (double)currentVisitHorizontalUncertainty
{
  return self->_currentVisitHorizontalUncertainty;
}

- (void)setCurrentVisitHorizontalUncertainty:(double)a3
{
  self->_currentVisitHorizontalUncertainty = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0LL;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_WORD *)self + 64) = 0;
  return self;
}

@end