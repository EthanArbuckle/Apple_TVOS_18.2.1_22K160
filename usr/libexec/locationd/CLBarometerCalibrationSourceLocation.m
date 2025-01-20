@interface CLBarometerCalibrationSourceLocation
- (CLBarometerCalibrationSourceLocation)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (void)disableSource;
- (void)enableSource;
- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4;
@end

@implementation CLBarometerCalibrationSourceLocation

- (CLBarometerCalibrationSourceLocation)initWithUniverse:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceLocation;
  v4 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v10, "initWithUniverse:delegate:", a3, a4);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101840EB8);
  }
  v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    __int16 v12 = 2082;
    v13 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:initialized location source}",  buf,  0x12u);
  }

  if (v4)
  {
    sub_10043AC3C((uint64_t)sub_10059BDEC, (uint64_t)v4, v4->super._universe, buf);
    v6 = *(Client **)buf;
    *(void *)buf = 0LL;
    value = v4->fLocationControllerClient.__ptr_.__value_;
    v4->fLocationControllerClient.__ptr_.__value_ = v6;
    if (value)
    {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
      v8 = *(Client **)buf;
      *(void *)buf = 0LL;
      if (v8) {
        (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
      }
    }

    v4->_currentUnderDEM = 0;
  }

  return v4;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled)
  {
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:4 registrationInfo:0];
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) register:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:33 registrationInfo:0];
    self->super._sourceEnabled = 1;
  }

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) unregister:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:4];
    [*((id *)self->fLocationControllerClient.__ptr_.__value_ + 2) unregister:*((void *)self->fLocationControllerClient.__ptr_.__value_ + 1) forNotification:33];
    self->super._sourceEnabled = 0;
  }

- (void)onLocationNotification:(int)a3 data:(NotificationData *)a4
{
  unsigned __int8 v7 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:]( &OBJC_CLASS___CLBarometerCalibrationSourceAggregator,  "isLocationUsefulForCalibration:",  v93);

  v8 = v98;
  if (v98)
  {
    p_shared_owners = (unint64_t *)&v98->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  if (v97 < 0) {
    operator delete(__p);
  }
  v11 = v95;
  if (v95)
  {
    __int16 v12 = (unint64_t *)&v95->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  v14 = v94;
  if (v94)
  {
    v15 = (unint64_t *)&v94->__shared_owners_;
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  if (a3 == 4) {
    unsigned __int8 v17 = v7;
  }
  else {
    unsigned __int8 v17 = 0;
  }
  if ((v17 & 1) != 0)
  {
    sub_10059CD18(&v91);
    double v18 = v91;
    **(void **)&double v91 = *(void *)((char *)a4 + 76);
    *(_OWORD *)(*(void *)&v18 + 8LL) = *(_OWORD *)((char *)a4 + 4);
    *(int8x16_t *)(*(void *)&v18 + 24LL) = vextq_s8( *(int8x16_t *)((char *)a4 + 20),  *(int8x16_t *)((char *)a4 + 20),  8uLL);
    *(void *)(*(void *)&v18 + 40LL) = *(void *)((char *)a4 + 36);
    *(_DWORD *)(*(void *)&v18 + 100LL) = *((_DWORD *)a4 + 24);
    *(_DWORD *)(*(void *)&v18 + 96LL) = *((_DWORD *)a4 + 35);
    *(_DWORD *)(*(void *)&v18 + 104LL) = *((_DWORD *)a4 + 54);
    *(_OWORD *)(*(void *)&v18 + 48LL) = *(_OWORD *)((char *)a4 + 536);
    *(_OWORD *)(*(void *)&v18 + 64LL) = *(_OWORD *)((char *)a4 + 520);
    *(_OWORD *)(*(void *)&v18 + 80LL) = *(_OWORD *)((char *)a4 + 44);
    *(_OWORD *)(*(void *)&v18 + 112LL) = *((_OWORD *)a4 + 44);
    *(_BYTE *)(*(void *)&v18 + 156LL) = *((_BYTE *)a4 + 736);
    *(_OWORD *)(*(void *)&v18 + 136LL) = *(_OWORD *)((char *)a4 + 744);
    *(_DWORD *)(*(void *)&v18 + 152LL) = *((_DWORD *)a4 + 62);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101840EB8);
    }
    v19 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      uint64_t v21 = v20;
      -[CLBarometerCalibrationSourceClient getLastAltitudeTime](self->super._delegate, "getLastAltitudeTime");
      uint64_t v22 = **(void **)&v91;
      uint64_t v24 = *(void *)(*(void *)&v91 + 136LL);
      uint64_t v23 = *(void *)(*(void *)&v91 + 144LL);
      int v25 = *(unsigned __int8 *)(*(void *)&v91 + 156LL);
      int v26 = *(_DWORD *)(*(void *)&v91 + 152LL);
      *(_DWORD *)buf = 134219521;
      *(void *)v105 = v21;
      *(_WORD *)&v105[8] = 2048;
      *(void *)&v105[10] = v27;
      *(_WORD *)&v105[18] = 2048;
      *(void *)&v105[20] = v22;
      *(_WORD *)&v105[28] = 2049;
      *(void *)&v105[30] = v23;
      *(_WORD *)&v105[38] = 2049;
      *(void *)&v105[40] = v24;
      *(_WORD *)&v105[48] = 1025;
      *(_DWORD *)&v105[50] = v25;
      __int16 v106 = 1025;
      int v107 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "location last altitude %.3lf last time %.3lf last location time %.3lf,indoorConfidence,%{private}.3lf, outdoorCo nfidence,%{private}.3lf,PositionOutdoorState,%{private}u,mapMatchType,%{private}u",  buf,  0x40u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101840EB8);
      }
      uint64_t v65 = qword_1019346A8;
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      uint64_t v67 = v66;
      -[CLBarometerCalibrationSourceClient getLastAltitudeTime](self->super._delegate, "getLastAltitudeTime");
      uint64_t v68 = **(void **)&v91;
      uint64_t v70 = *(void *)(*(void *)&v91 + 136LL);
      uint64_t v69 = *(void *)(*(void *)&v91 + 144LL);
      int v71 = *(unsigned __int8 *)(*(void *)&v91 + 156LL);
      int v72 = *(_DWORD *)(*(void *)&v91 + 152LL);
      int v100 = 134219521;
      *(void *)v101 = v67;
      *(_WORD *)&v101[8] = 2048;
      *(void *)&v101[10] = v73;
      *(_WORD *)&v101[18] = 2048;
      *(void *)&v101[20] = v68;
      *(_WORD *)&v101[28] = 2049;
      *(void *)&v101[30] = v69;
      *(_WORD *)&v101[38] = 2049;
      *(void *)&v101[40] = v70;
      *(_WORD *)&v101[48] = 1025;
      *(_DWORD *)&v101[50] = v71;
      __int16 v102 = 1025;
      int v103 = v72;
      v74 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v65,  2LL,  "location last altitude %.3lf last time %.3lf last location time %.3lf,indoorConfidence,%{private}. 3lf, outdoorConfidence,%{private}.3lf,PositionOutdoorState,%{private}u,mapMatchType,%{private}u",  &v100,  64);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]",  "%s\n",  v74);
    }

    if (*(_DWORD *)(*(void *)&v91 + 100LL) != 1
      || (double v28 = **(double **)&v91,
          -[CLBarometerCalibrationSourceClient getLastAltitudeTime](self->super._delegate, "getLastAltitudeTime"),
          vabdd_f64(v28, v29) >= 5.0))
    {
      self->_BOOL currentUnderDEM = 0;
LABEL_38:
      if (self->_currentUnderDEM) {
        *(_WORD *)(*(void *)&v91 + 130LL) |= 1u;
      }
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101840EB8);
      }
      v38 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        int v39 = *(unsigned __int16 *)(*(void *)&v91 + 130LL);
        int v40 = *(_DWORD *)(*(void *)&v91 + 100LL);
        uint64_t v41 = **(void **)&v91;
        *(_DWORD *)buf = 136316418;
        *(void *)v105 = "state";
        *(_WORD *)&v105[8] = 1024;
        *(_DWORD *)&v105[10] = v39;
        *(_WORD *)&v105[14] = 2080;
        *(void *)&v105[16] = "type";
        *(_WORD *)&v105[24] = 1024;
        *(_DWORD *)&v105[26] = v40;
        *(_WORD *)&v105[30] = 2080;
        *(void *)&v105[32] = "timestamp";
        *(_WORD *)&v105[40] = 2048;
        *(void *)&v105[42] = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "location altitude information,%s,%u,%s,%d,%s,%f",  buf,  0x36u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101840EB8);
        }
        int v75 = *(unsigned __int16 *)(*(void *)&v91 + 130LL);
        int v76 = *(_DWORD *)(*(void *)&v91 + 100LL);
        uint64_t v77 = **(void **)&v91;
        int v100 = 136316418;
        *(void *)v101 = "state";
        *(_WORD *)&v101[8] = 1024;
        *(_DWORD *)&v101[10] = v75;
        *(_WORD *)&v101[14] = 2080;
        *(void *)&v101[16] = "type";
        *(_WORD *)&v101[24] = 1024;
        *(_DWORD *)&v101[26] = v76;
        *(_WORD *)&v101[30] = 2080;
        *(void *)&v101[32] = "timestamp";
        *(_WORD *)&v101[40] = 2048;
        *(void *)&v101[42] = v77;
        v78 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "location altitude information,%s,%u,%s,%d,%s,%f",  (const char *)&v100,  54,  v88,  LODWORD(v89),  v90,  v91);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]",  "%s\n",  v78);
      }

      double v43 = v91;
      v42 = (const char *)v92;
      *(_BYTE *)(*(void *)&v91 + 128LL) = 0;
      delegate = self->super._delegate;
      double v89 = v43;
      v90 = (char *)v42;
      if (v42)
      {
        v45 = (unint64_t *)(v42 + 8);
        do
          unint64_t v46 = __ldxr(v45);
        while (__stxr(v46 + 1, v45));
      }

      -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 0LL, &v89);
      v47 = (std::__shared_weak_count *)v90;
      if (v90)
      {
        v48 = (unint64_t *)(v90 + 8);
        do
          unint64_t v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
        {
          ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
          std::__shared_weak_count::__release_weak(v47);
        }
      }

      v50 = (std::__shared_weak_count *)v92;
      if (v92)
      {
        v51 = (unint64_t *)(v92 + 8);
        do
          unint64_t v52 = __ldaxr(v51);
        while (__stlxr(v52 - 1, v51));
        if (!v52)
        {
          ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
          std::__shared_weak_count::__release_weak(v50);
        }
      }

      return;
    }

    unsigned int v30 = -[CLBarometerCalibrationSourceClient isInOutdoorWorkout]( self->super._delegate,  "isInOutdoorWorkout");
    double v31 = v91;
    if (v30) {
      *(_WORD *)(*(void *)&v91 + 130LL) |= 2u;
    }
    if (*(_DWORD *)(*(void *)&v31 + 104LL) == 2) {
      *(_WORD *)(*(void *)&v31 + 130LL) |= 4u;
    }
    -[CLBarometerCalibrationSourceClient getLastAltitudeAccuracy](self->super._delegate, "getLastAltitudeAccuracy");
    double v33 = *(double *)(*(void *)&v91 + 48LL);
    double v34 = v32 + 20.0 + *(double *)(*(void *)&v91 + 56LL);
    v35 = self->super._delegate;
    if (self->_currentUnderDEM)
    {
      -[CLBarometerCalibrationSourceClient getLastAltitude](v35, "getLastAltitude");
      if (v33 - v36 < v34 + -3.0)
      {
        BOOL v37 = 0;
LABEL_62:
        self->_BOOL currentUnderDEM = v37;
      }
    }

    else
    {
      -[CLBarometerCalibrationSourceClient getLastAltitude](v35, "getLastAltitude");
      if (v33 - v53 > v34)
      {
        BOOL v37 = 1;
        goto LABEL_62;
      }
    }

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101840EB8);
    }
    v54 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_INFO))
    {
      BOOL currentUnderDEM = self->_currentUnderDEM;
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      uint64_t v57 = v56;
      -[CLBarometerCalibrationSourceClient getLastAltitudeAccuracy](self->super._delegate, "getLastAltitudeAccuracy");
      uint64_t v59 = *(void *)(*(void *)&v91 + 48LL);
      uint64_t v58 = *(void *)(*(void *)&v91 + 56LL);
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)v105 = currentUnderDEM;
      *(_WORD *)&v105[4] = 2048;
      *(void *)&v105[6] = v57;
      *(_WORD *)&v105[14] = 2048;
      *(void *)&v105[16] = v60;
      *(_WORD *)&v105[24] = 2048;
      *(void *)&v105[26] = v59;
      *(_WORD *)&v105[34] = 2048;
      *(void *)&v105[36] = v58;
      *(_WORD *)&v105[44] = 2048;
      *(double *)&v105[46] = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_INFO,  "underDEM, %d, altitude, %f, uncertainty, %f, demAltitude, %f, demUncertainty, %f, threshold, %f",  buf,  0x3Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101840EB8);
      }
      uint64_t v79 = qword_1019346A8;
      BOOL v80 = self->_currentUnderDEM;
      -[CLBarometerCalibrationSourceClient getLastAltitude](self->super._delegate, "getLastAltitude");
      uint64_t v82 = v81;
      -[CLBarometerCalibrationSourceClient getLastAltitudeAccuracy](self->super._delegate, "getLastAltitudeAccuracy");
      uint64_t v84 = *(void *)(*(void *)&v91 + 48LL);
      uint64_t v83 = *(void *)(*(void *)&v91 + 56LL);
      int v100 = 67110400;
      *(_DWORD *)v101 = v80;
      *(_WORD *)&v101[4] = 2048;
      *(void *)&v101[6] = v82;
      *(_WORD *)&v101[14] = 2048;
      *(void *)&v101[16] = v85;
      *(_WORD *)&v101[24] = 2048;
      *(void *)&v101[26] = v84;
      *(_WORD *)&v101[34] = 2048;
      *(void *)&v101[36] = v83;
      *(_WORD *)&v101[44] = 2048;
      *(double *)&v101[46] = v34;
      LODWORD(v87) = 58;
      v86 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v79,  1LL,  "underDEM, %d, altitude, %f, uncertainty, %f, demAltitude, %f, demUncertainty, %f, threshold, %f",  &v100,  v87,  *(double *)&v88,  v89,  *(double *)&v90,  v91);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]",  "%s\n",  v86);
    }

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101840EB8);
    }
    v61 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      int v62 = *(unsigned __int16 *)(*(void *)&v91 + 130LL);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v105 = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEBUG,  "good DEM data: location altitude state is %u",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101840EB8);
      }
      int v63 = *(unsigned __int16 *)(*(void *)&v91 + 130LL);
      int v100 = 67109120;
      *(_DWORD *)v101 = v63;
      v64 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "good DEM data: location altitude state is %u",  &v100);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceLocation onLocationNotification:data:]",  "%s\n",  v64);
    }

    goto LABEL_38;
  }

- (void).cxx_destruct
{
  value = self->fLocationControllerClient.__ptr_.__value_;
  self->fLocationControllerClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  return self;
}

@end