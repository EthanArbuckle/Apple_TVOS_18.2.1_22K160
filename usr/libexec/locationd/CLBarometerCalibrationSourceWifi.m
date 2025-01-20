@interface CLBarometerCalibrationSourceWifi
- (CLBarometerCalibrationSourceWifi)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWifiData>)convertAPToWifiData:(AccessPoint *)a3;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)processActiveScan:(const void *)a3;
- (void)processScanCache:(const void *)a3;
- (void)writeWifiAPToJson:(id)a3 withData:(const void *)a4;
@end

@implementation CLBarometerCalibrationSourceWifi

- (CLBarometerCalibrationSourceWifi)initWithUniverse:(id)a3 delegate:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceWifi;
  v5 = -[CLBarometerCalibrationSource initWithUniverse:delegate:](&v14, "initWithUniverse:delegate:", a3, a4);
  if (v5)
  {
    v5->_wifiServiceProxy = (CLWifiServiceProtocol *) objc_msgSend( objc_msgSend(a3, "vendor"),  "proxyForService:",  @"CLWifiService");
    sub_10034FF34((uint64_t)sub_100ED63B4, (uint64_t)v5, v5->super._universe, buf);
    v6 = *(Client **)buf;
    *(void *)buf = 0LL;
    value = v5->_wifiServiceClient.__ptr_.__value_;
    v5->_wifiServiceClient.__ptr_.__value_ = v6;
    if (value)
    {
      (*(void (**)(Client *))(*(void *)value + 8LL))(value);
      v8 = *(Client **)buf;
      *(void *)buf = 0LL;
      if (v8) {
        (*(void (**)(Client *))(*(void *)v8 + 8LL))(v8);
      }
    }

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10188ADA0);
    }
    v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "enabling wifi data source", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      v13[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "enabling wifi data source",  v13,  2);
      v12 = (uint8_t *)v11;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceWifi initWithUniverse:delegate:]",  "%s\n",  v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    v5->lastSubmissionToSourceAggregator = 1.79769313e308;
  }

  return v5;
}

- (void)enableSource
{
  LODWORD(v5) = 3600;
  WORD2(v5) = 0;
  if (!self->super._sourceEnabled)
  {
    *((void *)&v5 + 1) = "baro";
    value = self->_wifiServiceClient.__ptr_.__value_;
    v4 = sub_10039E77C(&v5);
    objc_msgSend( *((id *)value + 2),  "register:forNotification:registrationInfo:",  *((void *)value + 1),  12,  v4,  (void)v5);
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0];
    self->super._sourceEnabled = 1;
  }

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:3];
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];
    self->super._sourceEnabled = 0;
  }

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 12)
  {
    if (sub_100CD95FC(*(_DWORD *)(a4 + 140)))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      v7 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        v8 = sub_10099EC00(*(_DWORD *)(a4 + 140));
        *(_DWORD *)buf = 136446210;
        v21 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "ignoring NotificationScanCache source %{public}s",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10188ADA0);
        }
        uint64_t v9 = qword_1019346A8;
        v10 = sub_10099EC00(*(_DWORD *)(a4 + 140));
        int v18 = 136446210;
        v19 = v10;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  2LL,  "ignoring NotificationScanCache source %{public}s",  &v18,  12);
        v12 = (uint8_t *)v11;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]",  "%s\n",  v11);
        if (v12 != buf) {
          free(v12);
        }
      }
    }

    else
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      v13 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "received wifi scan cache notification",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_10188ADA0);
        }
        LOWORD(v18) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "received wifi scan cache notification",  &v18,  2);
        v17 = (uint8_t *)v16;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]",  "%s\n",  v16);
        if (v17 != buf) {
          free(v17);
        }
      }

      [a1 processScanCache:a4 + 112];
    }
  }

  else if (a3 == 3)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10188ADA0);
    }
    v6 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received wifi scan notification", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      LOWORD(v18) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "received wifi scan notification",  &v18,  2);
      v15 = (uint8_t *)v14;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]",  "%s\n",  v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    [a1 processActiveScan:a4 + 112];
  }

- (void)processActiveScan:(const void *)a3
{
  if (self->lastSubmissionToSourceAggregator == 1.79769313e308) {
    self->double lastSubmissionToSourceAggregator = CFAbsoluteTimeGetCurrent();
  }
  if (CFAbsoluteTimeGetCurrent() > self->lastSubmissionToSourceAggregator + 5.0)
  {
    sub_100ED72CC((uint64_t)&self->activeScanBuffer, 0xAu, (uint64_t)&v62);
    v6 = v62;
    for (i = v63; v6 != i; v6 += 2)
    {
      uint64_t v7 = *v6;
      v8 = (std::__shared_weak_count *)v6[1];
      v60 = (uint64_t *)*v6;
      v61 = v8;
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          unint64_t v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
        delegate = self->super._delegate;
        uint64_t v58 = v7;
        v59 = v8;
        do
          unint64_t v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }

      else
      {
        delegate = self->super._delegate;
        uint64_t v58 = v7;
        v59 = 0LL;
      }

      -[CLBarometerCalibrationSourceClient didUpdateSource:withData:](delegate, "didUpdateSource:withData:", 2LL, &v58);
      v13 = v59;
      if (v59)
      {
        objc_super v14 = (unint64_t *)&v59->__shared_owners_;
        do
          unint64_t v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      v16 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
      {
        v17 = v60;
        sub_1007EC454(&__p);
        p_p = &__p;
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        int v19 = *((_DWORD *)v17 + 4);
        int v20 = *((_DWORD *)v17 + 6);
        uint64_t v21 = *v17;
        *(_DWORD *)buf = 68290051;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        *(_WORD *)&buf[18] = 2081;
        *(void *)&buf[20] = p_p;
        *(_WORD *)&buf[28] = 1025;
        *(_DWORD *)&buf[30] = v19;
        *(_WORD *)&buf[34] = 1025;
        *(_DWORD *)&buf[36] = v20;
        *(_WORD *)&buf[40] = 2049;
        *(void *)&buf[42] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:submit wifi scan data, mac:%{private, location:escape_only}s, channel:%{priva te}d, rssi:%{private}d, scan time stamp_s:%{private}.09f}",  buf,  0x32u);
      }

      v22 = v61;
      if (v61)
      {
        v23 = (unint64_t *)&v61->__shared_owners_;
        do
          unint64_t v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10188ADA0);
    }
    v25 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t value = self->activeScanBuffer.buffer.__table_.__p2_.__value_;
      v28 = (char *)v62;
      v27 = (char *)v63;
      double lastSubmissionToSourceAggregator = self->lastSubmissionToSourceAggregator;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = value;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = (v27 - v28) >> 4;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = lastSubmissionToSourceAggregator;
      *(_WORD *)&buf[32] = 2048;
      *(CFAbsoluteTime *)&buf[34] = Current;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "buffered %zu samples, submitted %zu samples, between %f and %f",  buf,  0x2Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      uint64_t v40 = qword_1019346A8;
      unint64_t v41 = self->activeScanBuffer.buffer.__table_.__p2_.__value_;
      v43 = (char *)v62;
      v42 = (char *)v63;
      double v44 = self->lastSubmissionToSourceAggregator;
      CFAbsoluteTime v45 = CFAbsoluteTimeGetCurrent();
      LODWORD(__p.__r_.__value_.__l.__data_) = 134218752;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v41;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (v42 - v43) >> 4;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
      double v65 = v44;
      __int16 v66 = 2048;
      CFAbsoluteTime v67 = v45;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v40,  2LL,  "buffered %zu samples, submitted %zu samples, between %f and %f",  (size_t)&__p,  42,  v48,  *(double *)&a3);
      v47 = (char *)v46;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLBarometerCalibrationSourceWifi processActiveScan:]", "%s\n", v46);
      if (v47 != buf) {
        free(v47);
      }
    }

    sub_1008AC3D0((uint64_t)&self->activeScanBuffer);
    self->double lastSubmissionToSourceAggregator = CFAbsoluteTimeGetCurrent();
    *(void *)buf = &v62;
    sub_10004CC28((void ***)buf);
  }

  uint64_t v31 = *(void *)a3;
  uint64_t v32 = *((void *)a3 + 1);
  if (*(void *)a3 != v32)
  {
    do
    {
      *(void *)buf = *(void *)v31;
      if (*(char *)(v31 + 31) < 0)
      {
        sub_1010DD48C(&buf[8], *(void **)(v31 + 8), *(void *)(v31 + 16));
      }

      else
      {
        __int128 v33 = *(_OWORD *)(v31 + 8);
        *(void *)&buf[24] = *(void *)(v31 + 24);
        *(_OWORD *)&buf[8] = v33;
      }

      __int128 v34 = *(_OWORD *)(v31 + 32);
      __int128 v35 = *(_OWORD *)(v31 + 48);
      __int128 v36 = *(_OWORD *)(v31 + 64);
      uint64_t v70 = *(void *)(v31 + 80);
      *(_OWORD *)&buf[48] = v35;
      __int128 v69 = v36;
      *(_OWORD *)&buf[32] = v34;
      if (!sub_100ED7390((uint64_t)buf))
      {
        uint64_t v49 = *(void *)buf;
        if ((buf[31] & 0x80000000) != 0)
        {
          sub_1010DD48C(&v50, *(void **)&buf[8], *(unint64_t *)&buf[16]);
        }

        else
        {
          __int128 v50 = *(_OWORD *)&buf[8];
          uint64_t v51 = *(void *)&buf[24];
        }

        __int128 v52 = *(_OWORD *)&buf[32];
        __int128 v53 = *(_OWORD *)&buf[48];
        __int128 v54 = v69;
        uint64_t v55 = v70;
        -[CLBarometerCalibrationSourceWifi convertAPToWifiData:](self, "convertAPToWifiData:", &v49);
        sub_100ED7464(&self->activeScanBuffer.buffer.__table_.__bucket_list_.__ptr_.__value_, &v56);
        v37 = v57;
        if (v57)
        {
          v38 = (unint64_t *)&v57->__shared_owners_;
          do
            unint64_t v39 = __ldaxr(v38);
          while (__stlxr(v39 - 1, v38));
          if (!v39)
          {
            ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
            std::__shared_weak_count::__release_weak(v37);
          }
        }

        if (SHIBYTE(v51) < 0) {
          operator delete((void *)v50);
        }
      }

      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      v31 += 88LL;
    }

    while (v31 != v32);
  }

- (void)processScanCache:(const void *)a3
{
  v3 = *(uint64_t **)a3;
  v4 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v4)
  {
    do
    {
      uint64_t v26 = *v3;
      if (*((char *)v3 + 31) < 0)
      {
        sub_1010DD48C(&v27, (void *)v3[1], v3[2]);
      }

      else
      {
        __int128 v6 = *(_OWORD *)(v3 + 1);
        uint64_t v28 = v3[3];
        __int128 v27 = v6;
      }

      __int128 v7 = *((_OWORD *)v3 + 2);
      __int128 v8 = *((_OWORD *)v3 + 3);
      __int128 v9 = *((_OWORD *)v3 + 4);
      uint64_t v32 = v3[10];
      __int128 v30 = v8;
      __int128 v31 = v9;
      __int128 v29 = v7;
      if (!sub_100ED7390((uint64_t)&v26))
      {
        delegate = self->super._delegate;
        uint64_t v17 = v26;
        if (SHIBYTE(v28) < 0)
        {
          sub_1010DD48C(&__p, (void *)v27, *((unint64_t *)&v27 + 1));
        }

        else
        {
          __int128 __p = v27;
          uint64_t v19 = v28;
        }

        __int128 v20 = v29;
        __int128 v21 = v30;
        __int128 v22 = v31;
        uint64_t v23 = v32;
        -[CLBarometerCalibrationSourceWifi convertAPToWifiData:](self, "convertAPToWifiData:", &v17);
        __int128 v25 = v24;
        __int128 v24 = 0uLL;
        -[CLBarometerCalibrationSourceClient didUpdateSource:withData:]( delegate,  "didUpdateSource:withData:",  2LL,  &v25);
        v11 = (std::__shared_weak_count *)*((void *)&v25 + 1);
        if (*((void *)&v25 + 1))
        {
          unint64_t v12 = (unint64_t *)(*((void *)&v25 + 1) + 8LL);
          do
            unint64_t v13 = __ldaxr(v12);
          while (__stlxr(v13 - 1, v12));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
            std::__shared_weak_count::__release_weak(v11);
          }
        }

        objc_super v14 = (std::__shared_weak_count *)*((void *)&v24 + 1);
        if (*((void *)&v24 + 1))
        {
          unint64_t v15 = (unint64_t *)(*((void *)&v24 + 1) + 8LL);
          do
            unint64_t v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }

        if (SHIBYTE(v19) < 0) {
          operator delete((void *)__p);
        }
      }

      if (SHIBYTE(v28) < 0) {
        operator delete((void *)v27);
      }
      v3 += 11;
    }

    while (v3 != v4);
  }

- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWifiData>)convertAPToWifiData:(AccessPoint *)a3
{
  __int128 v5 = v3;
  __int128 v6 = (CLBarometerCalibrationWifiData *)sub_100ED8E54(v3);
  uint64_t v8 = *v5;
  *(void *)(v8 + 8) = a3->var0.var0;
  *(_DWORD *)(v8 + 16) = a3->var1.var0;
  *(_DWORD *)(v8 + 24) = a3->var1.__r_.var0;
  if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0)
  {
    __int128 v6 = (CLBarometerCalibrationWifiData *)sub_1010DD48C( __p,  a3->var1.__r_.__value_.var0.var1.__data_,  a3->var1.__r_.__value_.var0.var1.__size_);
    uint64_t v8 = *v5;
  }

  else
  {
    *(_OWORD *)__int128 __p = *(_OWORD *)a3->var1.__r_.__value_.var0.var0.__data_;
    uint64_t v11 = *((void *)&a3->var1.__r_.__value_.var0.var1 + 2);
  }

  __int128 v9 = (void *)HIBYTE(v11);
  if (v11 < 0) {
    __int128 v9 = __p[1];
  }
  *(_BYTE *)(v8 + 20) = v9 == 0LL;
  if (SHIBYTE(v11) < 0)
  {
    operator delete(__p[0]);
    uint64_t v8 = *v5;
  }

  *(void *)uint64_t v8 = a3[1].var1.__r_.__value_.var0.var1.__data_;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)dealloc
{
  unint64_t value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }

  self->_wifiServiceProxy = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLBarometerCalibrationSourceWifi;
  -[CLBarometerCalibrationSource dealloc](&v4, "dealloc");
}

- (void)writeWifiAPToJson:(id)a3 withData:(const void *)a4
{
  __int128 v5 = -[NSOutputStream initToFileAtPath:append:]( objc_alloc(&OBJC_CLASS___NSOutputStream),  "initToFileAtPath:append:",  a3,  1LL);
  -[NSOutputStream open](v5, "open");
  std::string::size_type v25 = 0LL;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = *((void *)a4 + 1);
  if (*(void *)a4 != v7)
  {
    double v8 = Current;
    uint64_t v9 = *(void *)a4 + 8LL;
    do
    {
      uint64_t v11 = v9 - 8;
      uint64_t v10 = *(void *)(v9 - 8);
      *(void *)buf = v10;
      if (*(char *)(v9 + 23) < 0)
      {
        sub_1010DD48C(&buf[8], *(void **)v9, *(void *)(v9 + 8));
        uint64_t v10 = *(void *)buf;
      }

      else
      {
        __int128 v12 = *(_OWORD *)v9;
        uint64_t v27 = *(void *)(v9 + 16);
        *(_OWORD *)&buf[8] = v12;
      }

      __int128 v13 = *(_OWORD *)(v9 + 24);
      __int128 v14 = *(_OWORD *)(v9 + 40);
      __int128 v15 = *(_OWORD *)(v9 + 56);
      uint64_t v31 = *(void *)(v9 + 72);
      __int128 v29 = v14;
      __int128 v30 = v15;
      __int128 v28 = v13;
      v33[0] = @"mac";
      uint64_t v24 = v10;
      sub_1007EC454(&v32);
      if ((v32.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v16 = &v32;
      }
      else {
        unint64_t v16 = (std::string *)v32.__r_.__value_.__r.__words[0];
      }
      v34[0] = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v16);
      v33[1] = @"channel";
      v34[1] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", DWORD2(v28));
      v33[2] = @"rssi";
      v34[2] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v28);
      v33[3] = @"hidden";
      if (SHIBYTE(v27) < 0)
      {
        sub_1010DD48C(__p, *(void **)&buf[8], *(unint64_t *)&buf[16]);
      }

      else
      {
        *(_OWORD *)__int128 __p = *(_OWORD *)&buf[8];
        uint64_t v23 = v27;
      }

      uint64_t v17 = (void *)HIBYTE(v23);
      if (v23 < 0) {
        uint64_t v17 = __p[1];
      }
      v34[3] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17 == 0LL);
      v33[4] = @"timestamp";
      v34[4] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *((double *)&v29 + 1));
      v33[5] = @"collectionTime";
      v34[5] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8);
      int v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  6LL);
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
      +[NSJSONSerialization writeJSONObject:toStream:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "writeJSONObject:toStream:options:error:",  v18,  v5,  8LL,  &v25);
      if (SHIBYTE(v27) < 0) {
        operator delete(*(void **)&buf[8]);
      }
      v9 += 88LL;
    }

    while (v11 + 88 != v7);
  }

  if (v25)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10188ADA0);
    }
    uint64_t v19 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unable to serialize dictionary data to json stream. Error: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10188ADA0);
      }
      LODWORD(v32.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v32.__r_.__value_.__r.__words + 4) = v25;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  16LL,  "Unable to serialize dictionary data to json stream. Error: %@",  &v32,  12);
      __int128 v21 = (char *)v20;
      sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLBarometerCalibrationSourceWifi writeWifiAPToJson:withData:]",  "%s\n",  v20);
      if (v21 != buf) {
        free(v21);
      }
    }
  }

  -[NSOutputStream close](v5, "close", Current);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0LL;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end