@interface CLPressureStatsCollector
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPressureStatsCollector)init;
- (id).cxx_construct;
- (int)getFlightOfStairsIn24Hr;
- (void)beginService;
- (void)cleanCache;
- (void)disableCollection;
- (void)displayCache;
- (void)enableCollection;
- (void)endService;
- (void)onDaemonStatus:(const int *)a3 data:(const NotificationData *)a4;
- (void)onPressureData:(const Sample *)a3;
- (void)reset;
- (void)saveFeaturesToCache:(id *)a3;
- (void)sendCAMetric:(id *)a3;
- (void)submitAWDMetric;
@end

@implementation CLPressureStatsCollector

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999C50 != -1) {
    dispatch_once(&qword_101999C50, &stru_1018666D0);
  }
  return (id)qword_101999C48;
}

+ (BOOL)isSupported
{
  if (qword_101999C60 != -1) {
    dispatch_once(&qword_101999C60, &stru_1018666F0);
  }
  return byte_101999C58;
}

- (CLPressureStatsCollector)init
{
  uint64_t v16 = 86400 * ((uint64_t)CFAbsoluteTimeGetCurrent() / 86400) + 86400;
  uint64_t v3 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v3 + 936LL))(v3);
  uint64_t v4 = sub_1002F8DDC();
  if (byte_101999C47 >= 0) {
    unint64_t v5 = (const char *)&qword_101999C30;
  }
  else {
    unint64_t v5 = (const char *)qword_101999C30;
  }
  if ((sub_1002A7F54(v4, v5, &v16) & 1) == 0)
  {
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101866710);
    }
    v6 = (os_log_s *)qword_1019345B8;
    if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345B0 != -1) {
        dispatch_once(&qword_1019345B0, &stru_101866710);
      }
      __int16 v15 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.",  &v15,  2);
      v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector init]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    uint64_t v7 = sub_1002F8DDC();
    if (byte_101999C47 >= 0) {
      v8 = (const char *)&qword_101999C30;
    }
    else {
      v8 = (const char *)qword_101999C30;
    }
    sub_1002AC4EC(v7, v8, &v16);
    uint64_t v9 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v9 + 944LL))(v9);
    uint64_t v10 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v10 + 936LL))(v10);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CLPressureStatsCollector;
  return -[CLPressureStatsCollector initWithInboundProtocol:outboundProtocol:]( &v14,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLPressureStatsCollectorProtocol,  &OBJC_PROTOCOL___CLPressureStatsCollectorClientProtocol);
}

- (void)beginService
{
  uint64_t v3 = v9;
  uint64_t v9 = 0LL;
  value = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    unint64_t v5 = v9;
    uint64_t v9 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->fStatusClient.__ptr_.__value_ + 2) register:*((void *)self->fStatusClient.__ptr_.__value_ + 1) forNotification:7 registrationInfo:0];
  if (sub_1005BDE54())
  {
    id v6 = objc_msgSend(-[CLPressureStatsCollector universe](self, "universe"), "silo");
    uint64_t v7 = (Dispatcher *)operator new(0x38uLL);
    sub_10122121C(v7, v6, (uint64_t)sub_1009DDD64, (uint64_t)self, 0LL);
    v8 = self->fPressureDispatcher.__ptr_.__value_;
    self->fPressureDispatcher.__ptr_.__value_ = v7;
    if (v8) {
      (*(void (**)(Dispatcher *))(*(void *)v8 + 8LL))(v8);
    }
  }

  self->fCharging = 0;
  self->fAllowLogging = 0;
}

- (void)endService
{
}

- (void)enableCollection
{
  if (sub_1005BDE54())
  {
    uint64_t v3 = sub_1005BDE54();
    sub_1006DCB40(v3, 0, (uint64_t)self->fPressureDispatcher.__ptr_.__value_, 0.0399999991);
  }

- (void)disableCollection
{
  if (sub_1005BDE54())
  {
    uint64_t v3 = sub_1005BDE54();
    sub_1006DD2A0(v3, 0, (uint64_t)self->fPressureDispatcher.__ptr_.__value_);
  }

- (void)onPressureData:(const Sample *)a3
{
  p_fK2Detector = &self->fK2Detector;
  sub_100DE9A60((uint64_t)p_fK2Detector, (uint64_t)p_fK2Detector, a3->var1.var0 * 1000.0);
  sub_100DE9A60((uint64_t)p_fK2Detector, (uint64_t)&p_fK2Detector->fBufTemperatureRaw, a3->var1.var1);
  p_fSlopeEstimator = &self->fSlopeEstimator;
  sub_10082210C((uint64_t)&self->fSlopeEstimator, (__n128 *)a3);
  sub_100DEA088((uint64_t)p_fK2Detector, a3->var1.var0);
  sub_100DEA0A4((uint64_t)p_fK2Detector, a3->var1.var1);
  if (sub_100DE9A18((uint64_t)p_fK2Detector))
  {
    sub_100DE9E54(p_fK2Detector);
    begin = p_fK2Detector->fFeatures.__begin_;
    end = p_fK2Detector->fFeatures.__end_;
    if ((int)(-1431655765 * ((unint64_t)(end - (_BYTE *)begin) >> 3)) >= 301)
    {
      v58 = self;
      __p = 0LL;
      v78 = 0LL;
      v79 = 0LL;
      v74 = 0LL;
      v75 = 0LL;
      v76 = 0LL;
      if (end != (_BYTE *)begin)
      {
        unint64_t v9 = 0LL;
        do
        {
          uint64_t v10 = (_DWORD *)begin[3 * v9];
          v11 = v78;
          if (v78 >= v79)
          {
            v13 = (char *)__p;
            uint64_t v14 = (v78 - (_BYTE *)__p) >> 2;
            unint64_t v15 = v14 + 1;
            uint64_t v16 = v79 - (_BYTE *)__p;
            if ((v79 - (_BYTE *)__p) >> 1 > v15) {
              unint64_t v15 = v16 >> 1;
            }
            else {
              unint64_t v17 = v15;
            }
            if (v17)
            {
              v18 = (char *)sub_10000956C((uint64_t)&v79, v17);
              v13 = (char *)__p;
              v11 = v78;
            }

            else
            {
              v18 = 0LL;
            }

            v19 = &v18[4 * v14];
            *(_DWORD *)v19 = *v10;
            v12 = v19 + 4;
            while (v11 != v13)
            {
              int v20 = *((_DWORD *)v11 - 1);
              v11 -= 4;
              *((_DWORD *)v19 - 1) = v20;
              v19 -= 4;
            }

            __p = v19;
            v78 = v12;
            v79 = &v18[4 * v17];
            if (v13) {
              operator delete(v13);
            }
          }

          else
          {
            *(_DWORD *)v78 = *v10;
            v12 = v11 + 4;
          }

          v78 = v12;
          uint64_t v21 = *((void *)p_fK2Detector->fFeatures.__begin_ + 3 * v9);
          v22 = v75;
          if (v75 >= v76)
          {
            v24 = (char *)v74;
            uint64_t v25 = (v75 - (_BYTE *)v74) >> 2;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 62) {
LABEL_85:
            }
              sub_100007008();
            uint64_t v27 = v76 - (_BYTE *)v74;
            if ((v76 - (_BYTE *)v74) >> 1 > v26) {
              unint64_t v26 = v27 >> 1;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28)
            {
              v29 = (char *)sub_10000956C((uint64_t)&v76, v28);
              v24 = (char *)v74;
              v22 = v75;
            }

            else
            {
              v29 = 0LL;
            }

            v30 = &v29[4 * v25];
            *(_DWORD *)v30 = *(_DWORD *)(v21 + 4);
            v23 = v30 + 4;
            while (v22 != v24)
            {
              int v31 = *((_DWORD *)v22 - 1);
              v22 -= 4;
              *((_DWORD *)v30 - 1) = v31;
              v30 -= 4;
            }

            v74 = v30;
            v75 = v23;
            v76 = &v29[4 * v28];
            if (v24) {
              operator delete(v24);
            }
          }

          else
          {
            *(_DWORD *)v75 = *(_DWORD *)(v21 + 4);
            v23 = v22 + 4;
          }

          v75 = v23;
          ++v9;
          begin = p_fK2Detector->fFeatures.__begin_;
        }

        while (0xAAAAAAAAAAAAAAABLL * (((char *)p_fK2Detector->fFeatures.__end_ - (char *)begin) >> 3) > v9);
      }

      float v32 = sub_1009DE744((uint64_t)&__p);
      float v33 = sub_1009DE744((uint64_t)&v74);
      sub_100821840((uint64_t)p_fSlopeEstimator, 2, (uint64_t)v71);
      v34 = v58;
      *(_DWORD *)((char *)v70 + 3) = 0;
      v70[0] = 0;
      float v35 = sub_100DEA0C0((uint64_t)p_fK2Detector);
      float v36 = sub_100DEA0CC((uint64_t)p_fK2Detector);
      int v37 = v71[0];
      int v38 = v71[1];
      unsigned int v39 = -[CLPressureStatsCollector getFlightOfStairsIn24Hr](v58, "getFlightOfStairsIn24Hr");
      sub_1004F2598();
      sub_1004F6004((uint64_t)&__str);
      std::string::basic_string(&v80, &__str, 3uLL, 2uLL, (std::allocator<char> *)&v64);
      __int128 v40 = *(_OWORD *)&v80.__r_.__value_.__l.__data_;
      v70[0] = v80.__r_.__value_.__r.__words[2];
      *(_DWORD *)((char *)v70 + 3) = *(_DWORD *)((char *)&v80.__r_.__value_.__r.__words[2] + 3);
      int size = (char)v80.__r_.__value_.__s.__size_;
      v80.__r_.__value_.__s.__size_ = 0;
      v80.__r_.__value_.__s.__data_[0] = 0;
      char v42 = v72;
      *(float *)v65 = v32;
      *(float *)&v65[1] = v33;
      *(float *)&v65[2] = v35;
      *(float *)&v65[3] = v36;
      v65[4] = v37;
      v65[5] = v38;
      v65[6] = v39;
      if (size < 0)
      {
        sub_1010DD48C(&v66, (void *)v40, *((unint64_t *)&v40 + 1));
      }

      else
      {
        __int128 v66 = v40;
        *(_DWORD *)v67 = v70[0];
        *(_DWORD *)&v67[3] = *(_DWORD *)((char *)v70 + 3);
        char v68 = size;
      }

      char v69 = v42;
      -[CLPressureStatsCollector saveFeaturesToCache:](v58, "saveFeaturesToCache:", v65);
      if (v68 < 0) {
        operator delete((void *)v66);
      }
      -[CLPressureStatsCollector submitAWDMetric](v58, "submitAWDMetric");
      uint64_t Current = (uint64_t)CFAbsoluteTimeGetCurrent();
      int64_t v64 = 86400 * (Current / 86400) + 86400;
      uint64_t v44 = sub_1002F8DDC();
      if (byte_101999C47 >= 0) {
        v45 = (const char *)&qword_101999C30;
      }
      else {
        v45 = (const char *)qword_101999C30;
      }
      if (sub_1002A7F54(v44, v45, &v64))
      {
        sub_1009E0348((unsigned __int8 *)&v80, "PressureStatsCAEnabledTimestamp", &v64, 0);
        int64_t v64 = v80.__r_.__value_.__l.__size_;
        if (qword_1019345B0 != -1) {
          dispatch_once(&qword_1019345B0, &stru_101866710);
        }
        v46 = (os_log_s *)qword_1019345B8;
        if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v80.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)v80.__r_.__value_.__r.__words + 4) = Current;
          WORD2(v80.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v80.__r_.__value_.__r.__words[1] + 6) = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] currentTime,%ld,CAEnabledTime,%ld",  (uint8_t *)&v80,  0x16u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(&v80, 0x65CuLL);
          if (qword_1019345B0 != -1) {
            dispatch_once(&qword_1019345B0, &stru_101866710);
          }
          LODWORD(__str.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = Current;
          WORD2(__str.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) = v64;
          _os_log_send_and_compose_impl( 2LL,  0LL,  &v80,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] currentTime,%ld,CAEnabledTime,%ld",  &__str,  22);
          v57 = (std::string *)v56;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector onPressureData:]", "%s\n", v56);
          if (v57 != &v80) {
            free(v57);
          }
          v34 = v58;
        }

        if (v64 < Current)
        {
          *(float *)v59 = v32;
          *(float *)&v59[1] = v33;
          *(float *)&v59[2] = v35;
          *(float *)&v59[3] = v36;
          v59[4] = v37;
          v59[5] = v38;
          v59[6] = v39;
          if (size < 0)
          {
            sub_1010DD48C(&v60, (void *)v40, *((unint64_t *)&v40 + 1));
          }

          else
          {
            __int128 v60 = v40;
            *(_DWORD *)v61 = v70[0];
            *(_DWORD *)&v61[3] = *(_DWORD *)((char *)v70 + 3);
            char v62 = size;
          }

          char v63 = v42;
          -[CLPressureStatsCollector sendCAMetric:](v34, "sendCAMetric:", v59);
          if (v62 < 0) {
            operator delete((void *)v60);
          }
        }
      }

      else
      {
        if (qword_1019345B0 != -1) {
          dispatch_once(&qword_1019345B0, &stru_101866710);
        }
        v47 = (os_log_s *)qword_1019345B8;
        if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v80.__r_.__value_.__l.__data_) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.",  (uint8_t *)&v80,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(&v80, 0x65CuLL);
          if (qword_1019345B0 != -1) {
            dispatch_once(&qword_1019345B0, &stru_101866710);
          }
          LOWORD(__str.__r_.__value_.__l.__data_) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  &v80,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.",  &__str,  2);
          v49 = (std::string *)v48;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector onPressureData:]", "%s\n", v48);
          if (v49 != &v80) {
            free(v49);
          }
          v34 = v58;
        }
      }

      CFAbsoluteTime v50 = CFAbsoluteTimeGetCurrent();
      int64_t v64 = (uint64_t)v50 + 86400 + 86400 * ((uint64_t)v50 / 86400) - (uint64_t)v50;
      uint64_t v51 = sub_1002F8DDC();
      (*(void (**)(uint64_t))(*(void *)v51 + 936LL))(v51);
      uint64_t v52 = sub_1002F8DDC();
      if (byte_101999C47 >= 0) {
        v53 = (const char *)&qword_101999C30;
      }
      else {
        v53 = (const char *)qword_101999C30;
      }
      sub_1002AC4EC(v52, v53, &v64);
      uint64_t v54 = sub_1002F8DDC();
      (*(void (**)(uint64_t))(*(void *)v54 + 944LL))(v54);
      uint64_t v55 = sub_1002F8DDC();
      (*(void (**)(uint64_t))(*(void *)v55 + 936LL))(v55);
      -[CLPressureStatsCollector reset](v34, "reset");
      if (size < 0) {
        operator delete((void *)v40);
      }
      sub_100210578(v73);
      if (v74)
      {
        v75 = (char *)v74;
        operator delete(v74);
      }

      if (__p)
      {
        v78 = (char *)__p;
        operator delete(__p);
      }
    }
  }

- (void)onDaemonStatus:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 7)
  {
    int v5 = *((unsigned __int8 *)a4 + 9);
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101866710);
    }
    id v6 = (os_log_s *)qword_1019345B8;
    if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)unint64_t v28 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] charging,%d",  buf,  8u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345B0 != -1) {
        dispatch_once(&qword_1019345B0, &stru_101866710);
      }
      int v23 = 67109120;
      LODWORD(v24) = v5;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] charging,%d",  &v23);
      v18 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v17);
      if (v18 != buf) {
        free(v18);
      }
    }

    if (v5 != self->fCharging)
    {
      self->fCharging = v5;
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v8 = sub_1002F8DDC();
      (*(void (**)(uint64_t))(*(void *)v8 + 936LL))(v8);
      if (self->fCharging)
      {
        double v22 = 0.0;
        uint64_t v9 = sub_1002F8DDC();
        if (byte_101999B57 >= 0) {
          uint64_t v10 = (const char *)&qword_101999B40;
        }
        else {
          uint64_t v10 = (const char *)qword_101999B40;
        }
        sub_1002A82BC(v9, v10, &v22);
        uint64_t v11 = (uint64_t)(Current - v22);
        sub_1009E0348(buf, "PressureStatsMinLoggingWinInSec", &qword_101343208, 0);
        uint64_t v12 = *(void *)&v28[4];
        if (qword_1019345B0 != -1) {
          dispatch_once(&qword_1019345B0, &stru_101866710);
        }
        v13 = (os_log_s *)qword_1019345B8;
        if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)unint64_t v28 = v11;
          *(_WORD *)&v28[8] = 2048;
          *(void *)&v28[10] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] timeSinceLastUpdate,%ld,minLoggingWinInSec,%ld",  buf,  0x16u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019345B0 != -1) {
            dispatch_once(&qword_1019345B0, &stru_101866710);
          }
          int v23 = 134218240;
          uint64_t v24 = v11;
          __int16 v25 = 2048;
          uint64_t v26 = v12;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] timeSinceLastUpdate,%ld,minLoggingWinInSec,%ld",  &v23,  22);
          int v20 = (uint8_t *)v19;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v19);
          if (v20 != buf) {
            free(v20);
          }
        }

        if (v12 <= v11)
        {
          self->fAllowLogging = 1;
          -[CLPressureStatsCollector enableCollection](self, "enableCollection");
          if (qword_1019345B0 != -1) {
            dispatch_once(&qword_1019345B0, &stru_101866710);
          }
          uint64_t v14 = (os_log_s *)qword_1019345B8;
          if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] Collection enabled",  buf,  2u);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019345B0 != -1) {
              dispatch_once(&qword_1019345B0, &stru_101866710);
            }
            LOWORD(v23) = 0;
            LODWORD(v21) = 2;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] Collection enabled",  &v23,  v21);
            uint64_t v16 = (uint8_t *)v15;
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v15);
            if (v16 != buf) {
              free(v16);
            }
          }
        }
      }

      else if (self->fAllowLogging)
      {
        -[CLPressureStatsCollector reset](self, "reset");
      }
    }
  }

- (int)getFlightOfStairsIn24Hr
{
  *(void *)&double v3 = objc_opt_class(&OBJC_CLASS___MCProfileConnection).n128_u64[0];
  if (v4
    && objc_msgSend( +[MCProfileConnection sharedConnection]( MCProfileConnection,  "sharedConnection",  v3),  "isHealthDataSubmissionAllowed"))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v8 = CFAbsoluteTimeGetCurrent() + -86400.0;
    id v5 = objc_msgSend( objc_msgSend(-[CLPressureStatsCollector universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLStepCountNotifier");
    if (v5)
    {
      [v5 syncgetQueryStartTime:&v8 andStopTime:&Current];
      LODWORD(v5) = v7;
    }
  }

  else
  {
    LODWORD(v5) = 0x7FFFFFFF;
  }

  return (int)v5;
}

- (void)reset
{
  self->fCharging = 0;
  self->fAllowLogging = 0;
  -[CLPressureStatsCollector disableCollection](self, "disableCollection");
}

- (void)saveFeaturesToCache:(id *)a3
{
  uint64_t v4 = sub_1002F8DDC();
  if (byte_101999B57 >= 0) {
    id v5 = (const char *)&qword_101999B40;
  }
  else {
    id v5 = (const char *)qword_101999B40;
  }
  *(double *)buf = CFAbsoluteTimeGetCurrent();
  sub_1002AC7B8(v4, v5, buf);
  uint64_t v6 = sub_1002F8DDC();
  if (byte_101999B6F >= 0) {
    int v7 = (const char *)&qword_101999B58;
  }
  else {
    int v7 = (const char *)qword_101999B58;
  }
  *(double *)buf = a3->var0;
  sub_1002AE674(v6, v7, buf);
  uint64_t v8 = sub_1002F8DDC();
  if (byte_101999B87 >= 0) {
    uint64_t v9 = (const char *)&qword_101999B70;
  }
  else {
    uint64_t v9 = (const char *)qword_101999B70;
  }
  *(double *)buf = a3->var1;
  sub_1002AE674(v8, v9, buf);
  uint64_t v10 = sub_1002F8DDC();
  if (byte_101999B9F >= 0) {
    uint64_t v11 = (const char *)&qword_101999B88;
  }
  else {
    uint64_t v11 = (const char *)qword_101999B88;
  }
  *(double *)buf = a3->var2;
  sub_1002AE674(v10, v11, buf);
  uint64_t v12 = sub_1002F8DDC();
  if (byte_101999BB7 >= 0) {
    v13 = (const char *)&qword_101999BA0;
  }
  else {
    v13 = (const char *)qword_101999BA0;
  }
  *(double *)buf = a3->var3;
  sub_1002AE674(v12, v13, buf);
  uint64_t v14 = sub_1002F8DDC();
  if (byte_101999BE7 >= 0) {
    unint64_t v15 = (const char *)&qword_101999BD0;
  }
  else {
    unint64_t v15 = (const char *)qword_101999BD0;
  }
  *(double *)buf = a3->var5;
  sub_1002AE674(v14, v15, buf);
  uint64_t v16 = sub_1002F8DDC();
  if (byte_101999BCF >= 0) {
    unint64_t v17 = (const char *)&qword_101999BB8;
  }
  else {
    unint64_t v17 = (const char *)qword_101999BB8;
  }
  *(double *)buf = a3->var4;
  sub_1002AE674(v16, v17, buf);
  uint64_t v18 = sub_1002F8DDC();
  if (byte_101999BFF >= 0) {
    v19 = (const char *)&qword_101999BE8;
  }
  else {
    v19 = (const char *)qword_101999BE8;
  }
  sub_1002AE0DC(v18, v19, &a3->var6);
  uint64_t v20 = sub_1002F8DDC();
  if (byte_101999C17 >= 0) {
    uint64_t v21 = (const char *)&qword_101999C00;
  }
  else {
    uint64_t v21 = (const char *)qword_101999C00;
  }
  sub_1002AEC14(v20, v21, a3->var7.__r_.__value_.var0.var0.__data_);
  uint64_t v22 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v22 + 944LL))(v22);
  uint64_t v23 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v23 + 936LL))(v23);
  if (qword_1019345B0 != -1) {
    dispatch_once(&qword_1019345B0, &stru_101866710);
  }
  uint64_t v24 = (os_log_s *)qword_1019345B8;
  if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] A new record saved to cache.plist",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101866710);
    }
    v27[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] A new record saved to cache.plist",  v27,  2);
    uint64_t v26 = (uint8_t *)v25;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector saveFeaturesToCache:]", "%s\n", v25);
    if (v26 != buf) {
      free(v26);
    }
  }

- (void)cleanCache
{
  uint64_t v2 = sub_1002F8DDC();
  if (byte_101999B6F >= 0) {
    double v3 = (const char *)&qword_101999B58;
  }
  else {
    double v3 = (const char *)qword_101999B58;
  }
  sub_1002A667C(v2, v3, 0xFFFFFFFFLL);
  uint64_t v4 = sub_1002F8DDC();
  if (byte_101999B87 >= 0) {
    id v5 = (const char *)&qword_101999B70;
  }
  else {
    id v5 = (const char *)qword_101999B70;
  }
  sub_1002A667C(v4, v5, 0xFFFFFFFFLL);
  uint64_t v6 = sub_1002F8DDC();
  if (byte_101999B9F >= 0) {
    int v7 = (const char *)&qword_101999B88;
  }
  else {
    int v7 = (const char *)qword_101999B88;
  }
  sub_1002A667C(v6, v7, 0xFFFFFFFFLL);
  uint64_t v8 = sub_1002F8DDC();
  if (byte_101999BB7 >= 0) {
    uint64_t v9 = (const char *)&qword_101999BA0;
  }
  else {
    uint64_t v9 = (const char *)qword_101999BA0;
  }
  sub_1002A667C(v8, v9, 0xFFFFFFFFLL);
  uint64_t v10 = sub_1002F8DDC();
  if (byte_101999BE7 >= 0) {
    uint64_t v11 = (const char *)&qword_101999BD0;
  }
  else {
    uint64_t v11 = (const char *)qword_101999BD0;
  }
  sub_1002A667C(v10, v11, 0xFFFFFFFFLL);
  uint64_t v12 = sub_1002F8DDC();
  if (byte_101999BCF >= 0) {
    v13 = (const char *)&qword_101999BB8;
  }
  else {
    v13 = (const char *)qword_101999BB8;
  }
  sub_1002A667C(v12, v13, 0xFFFFFFFFLL);
  uint64_t v14 = sub_1002F8DDC();
  if (byte_101999BFF >= 0) {
    unint64_t v15 = (const char *)&qword_101999BE8;
  }
  else {
    unint64_t v15 = (const char *)qword_101999BE8;
  }
  sub_1002A667C(v14, v15, 0xFFFFFFFFLL);
  uint64_t v16 = sub_1002F8DDC();
  if (byte_101999C17 >= 0) {
    unint64_t v17 = (const char *)&qword_101999C00;
  }
  else {
    unint64_t v17 = (const char *)qword_101999C00;
  }
  sub_1002A667C(v16, v17, 0xFFFFFFFFLL);
  uint64_t v18 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v18 + 944LL))(v18);
  uint64_t v19 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v19 + 936LL))(v19);
  if (qword_1019345B0 != -1) {
    dispatch_once(&qword_1019345B0, &stru_101866710);
  }
  uint64_t v20 = (os_log_s *)qword_1019345B8;
  if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] cache.plist reset",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101866710);
    }
    v23[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] cache.plist reset",  v23,  2);
    uint64_t v22 = (uint8_t *)v21;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector cleanCache]", "%s\n", v21);
    if (v22 != buf) {
      free(v22);
    }
  }

- (void)displayCache
{
  uint64_t v29 = 0x47EFFFFFE0000000LL;
  uint64_t v30 = 0x47EFFFFFE0000000LL;
  uint64_t v27 = 0x47EFFFFFE0000000LL;
  uint64_t v28 = 0x47EFFFFFE0000000LL;
  uint64_t v25 = 0x47EFFFFFE0000000LL;
  uint64_t v26 = 0x47EFFFFFE0000000LL;
  int v24 = 0x7FFFFFFF;
  sub_1010DDBC0(&__p, "");
  uint64_t v2 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v2 + 936LL))(v2);
  uint64_t v3 = sub_1002F8DDC();
  if (byte_101999B6F >= 0) {
    uint64_t v4 = (const char *)&qword_101999B58;
  }
  else {
    uint64_t v4 = (const char *)qword_101999B58;
  }
  int v5 = sub_1002AF124(v3, v4);
  if (v5 >= 1)
  {
    int v6 = 0;
    do
    {
      uint64_t v7 = sub_1002F8DDC();
      if (byte_101999B6F >= 0) {
        uint64_t v8 = (const char *)&qword_101999B58;
      }
      else {
        uint64_t v8 = (const char *)qword_101999B58;
      }
      sub_1002A82BC(v7, v8, &v30);
      uint64_t v9 = sub_1002F8DDC();
      if (byte_101999B87 >= 0) {
        uint64_t v10 = (const char *)&qword_101999B70;
      }
      else {
        uint64_t v10 = (const char *)qword_101999B70;
      }
      sub_1002A82BC(v9, v10, &v29);
      uint64_t v11 = sub_1002F8DDC();
      if (byte_101999B9F >= 0) {
        uint64_t v12 = (const char *)&qword_101999B88;
      }
      else {
        uint64_t v12 = (const char *)qword_101999B88;
      }
      sub_1002A82BC(v11, v12, &v28);
      uint64_t v13 = sub_1002F8DDC();
      if (byte_101999BB7 >= 0) {
        uint64_t v14 = (const char *)&qword_101999BA0;
      }
      else {
        uint64_t v14 = (const char *)qword_101999BA0;
      }
      sub_1002A82BC(v13, v14, &v27);
      uint64_t v15 = sub_1002F8DDC();
      if (byte_101999BE7 >= 0) {
        uint64_t v16 = (const char *)&qword_101999BD0;
      }
      else {
        uint64_t v16 = (const char *)qword_101999BD0;
      }
      sub_1002A82BC(v15, v16, &v26);
      uint64_t v17 = sub_1002F8DDC();
      if (byte_101999BCF >= 0) {
        uint64_t v18 = (const char *)&qword_101999BB8;
      }
      else {
        uint64_t v18 = (const char *)qword_101999BB8;
      }
      sub_1002A82BC(v17, v18, &v25);
      uint64_t v19 = sub_1002F8DDC();
      if (byte_101999BFF >= 0) {
        uint64_t v20 = (const char *)&qword_101999BE8;
      }
      else {
        uint64_t v20 = (const char *)qword_101999BE8;
      }
      sub_1002A7CB0(v19, v20, &v24);
      uint64_t v21 = sub_1002F8DDC();
      if (byte_101999C17 >= 0) {
        uint64_t v22 = (const char *)&qword_101999C00;
      }
      else {
        uint64_t v22 = (const char *)qword_101999C00;
      }
      sub_1002A8560(v21, v22, &__p);
      ++v6;
    }

    while (v5 != v6);
  }

- (void)submitAWDMetric
{
  uint64_t v2 = sub_1002F8DDC();
  if (byte_101999B6F >= 0) {
    uint64_t v3 = (const char *)&qword_101999B58;
  }
  else {
    uint64_t v3 = (const char *)qword_101999B58;
  }
  int v105 = sub_1002AF124(v2, v3);
  if (v105 >= 7)
  {
    double v129 = 3.40282347e38;
    v130[0] = 3.40282347e38;
    double v127 = 3.40282347e38;
    double v128 = 3.40282347e38;
    double v125 = 3.40282347e38;
    double v126 = 3.40282347e38;
    int v124 = 0x7FFFFFFF;
    sub_1010DDBC0(&v123, "");
    v107[0] = 0;
    __int128 v109 = 0u;
    *(_OWORD *)v110 = 0u;
    __int128 v111 = 0u;
    *(_OWORD *)v112 = 0u;
    *(_OWORD *)v113 = 0u;
    __int128 v114 = 0u;
    *(_OWORD *)v115 = 0u;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    __int128 __p = 0u;
    __int128 v119 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    unint64_t v122 = 0LL;
    int v4 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v108 = Current;
    do
    {
      uint64_t v5 = sub_1002F8DDC();
      if (byte_101999B6F >= 0) {
        int v6 = (const char *)&qword_101999B58;
      }
      else {
        int v6 = (const char *)qword_101999B58;
      }
      sub_1002A82BC(v5, v6, v130);
      uint64_t v7 = sub_1002F8DDC();
      if (byte_101999B87 >= 0) {
        uint64_t v8 = (const char *)&qword_101999B70;
      }
      else {
        uint64_t v8 = (const char *)qword_101999B70;
      }
      sub_1002A82BC(v7, v8, &v129);
      uint64_t v9 = sub_1002F8DDC();
      if (byte_101999B9F >= 0) {
        uint64_t v10 = (const char *)&qword_101999B88;
      }
      else {
        uint64_t v10 = (const char *)qword_101999B88;
      }
      sub_1002A82BC(v9, v10, &v128);
      uint64_t v11 = sub_1002F8DDC();
      if (byte_101999BB7 >= 0) {
        uint64_t v12 = (const char *)&qword_101999BA0;
      }
      else {
        uint64_t v12 = (const char *)qword_101999BA0;
      }
      sub_1002A82BC(v11, v12, &v127);
      uint64_t v13 = sub_1002F8DDC();
      if (byte_101999BE7 >= 0) {
        uint64_t v14 = (const char *)&qword_101999BD0;
      }
      else {
        uint64_t v14 = (const char *)qword_101999BD0;
      }
      sub_1002A82BC(v13, v14, &v126);
      uint64_t v15 = sub_1002F8DDC();
      if (byte_101999BCF >= 0) {
        uint64_t v16 = (const char *)&qword_101999BB8;
      }
      else {
        uint64_t v16 = (const char *)qword_101999BB8;
      }
      sub_1002A82BC(v15, v16, &v125);
      uint64_t v17 = sub_1002F8DDC();
      if (byte_101999BFF >= 0) {
        uint64_t v18 = (const char *)&qword_101999BE8;
      }
      else {
        uint64_t v18 = (const char *)qword_101999BE8;
      }
      sub_1002A7CB0(v17, v18, &v124);
      uint64_t v19 = sub_1002F8DDC();
      if (byte_101999C17 >= 0) {
        uint64_t v20 = (const char *)&qword_101999C00;
      }
      else {
        uint64_t v20 = (const char *)qword_101999C00;
      }
      sub_1002A8560(v19, v20, &v123);
      float v21 = v126;
      uint64_t v22 = (char *)*((void *)&__p + 1);
      if (*((void *)&__p + 1) >= (unint64_t)v119)
      {
        int v24 = (char *)__p;
        uint64_t v25 = (uint64_t)(*((void *)&__p + 1) - __p) >> 2;
        unint64_t v26 = v25 + 1;
        uint64_t v27 = v119 - __p;
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          uint64_t v29 = (char *)sub_10000956C((uint64_t)&v119, v28);
          uint64_t v22 = (char *)*((void *)&__p + 1);
          int v24 = (char *)__p;
        }

        else
        {
          uint64_t v29 = 0LL;
        }

        uint64_t v30 = (float *)&v29[4 * v25];
        float *v30 = v21;
        uint64_t v23 = v30 + 1;
        while (v22 != v24)
        {
          int v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30-- - 1) = v31;
        }

        *(void *)&__int128 __p = v30;
        *((void *)&__p + 1) = v23;
        *(void *)&__int128 v119 = &v29[4 * v28];
        if (v24) {
          operator delete(v24);
        }
      }

      else
      {
        **((float **)&__p + 1) = v21;
        uint64_t v23 = (float *)(v22 + 4);
      }

      *((void *)&__p + 1) = v23;
      float v32 = v130[0];
      float v33 = (char *)v111;
      if ((unint64_t)v111 >= *((void *)&v111 + 1))
      {
        float v35 = (char *)v110[1];
        uint64_t v36 = (uint64_t)(v111 - (unint64_t)v110[1]) >> 2;
        unint64_t v37 = v36 + 1;
        int64_t v38 = *((void *)&v111 + 1) - (unint64_t)v110[1];
        else {
          unint64_t v39 = v37;
        }
        if (v39)
        {
          __int128 v40 = (char *)sub_10000956C((uint64_t)&v111 + 8, v39);
          float v35 = (char *)v110[1];
          float v33 = (char *)v111;
        }

        else
        {
          __int128 v40 = 0LL;
        }

        v41 = (float *)&v40[4 * v36];
        float *v41 = v32;
        v34 = v41 + 1;
        while (v33 != v35)
        {
          int v42 = *((_DWORD *)v33 - 1);
          v33 -= 4;
          *((_DWORD *)v41-- - 1) = v42;
        }

        v110[1] = v41;
        *(void *)&__int128 v111 = v34;
        *((void *)&v111 + 1) = &v40[4 * v39];
        if (v35) {
          operator delete(v35);
        }
      }

      else
      {
        *(float *)__int128 v111 = v32;
        v34 = (float *)(v33 + 4);
      }

      *(void *)&__int128 v111 = v34;
      float v43 = v129;
      uint64_t v44 = (char *)v112[1];
      if (v112[1] >= v113[0])
      {
        v46 = (char *)v112[0];
        int64_t v47 = ((char *)v112[1] - (char *)v112[0]) >> 2;
        unint64_t v48 = v47 + 1;
        int64_t v49 = (char *)v113[0] - (char *)v112[0];
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          uint64_t v51 = (char *)sub_10000956C((uint64_t)v113, v50);
          v46 = (char *)v112[0];
          uint64_t v44 = (char *)v112[1];
        }

        else
        {
          uint64_t v51 = 0LL;
        }

        uint64_t v52 = (float *)&v51[4 * v47];
        *uint64_t v52 = v43;
        v45 = v52 + 1;
        while (v44 != v46)
        {
          int v53 = *((_DWORD *)v44 - 1);
          v44 -= 4;
          *((_DWORD *)v52-- - 1) = v53;
        }

        v112[0] = v52;
        v112[1] = v45;
        v113[0] = &v51[4 * v50];
        if (v46) {
          operator delete(v46);
        }
      }

      else
      {
        *(float *)v112[1] = v43;
        v45 = v44 + 4;
      }

      v112[1] = v45;
      float v54 = v128;
      uint64_t v55 = (char *)v114;
      if ((unint64_t)v114 >= *((void *)&v114 + 1))
      {
        v57 = (char *)v113[1];
        uint64_t v58 = (uint64_t)(v114 - (unint64_t)v113[1]) >> 2;
        unint64_t v59 = v58 + 1;
        int64_t v60 = *((void *)&v114 + 1) - (unint64_t)v113[1];
        else {
          unint64_t v61 = v59;
        }
        if (v61)
        {
          char v62 = (char *)sub_10000956C((uint64_t)&v114 + 8, v61);
          v57 = (char *)v113[1];
          uint64_t v55 = (char *)v114;
        }

        else
        {
          char v62 = 0LL;
        }

        char v63 = (float *)&v62[4 * v58];
        *char v63 = v54;
        v56 = v63 + 1;
        while (v55 != v57)
        {
          int v64 = *((_DWORD *)v55 - 1);
          v55 -= 4;
          *((_DWORD *)v63-- - 1) = v64;
        }

        v113[1] = v63;
        *(void *)&__int128 v114 = v56;
        *((void *)&v114 + 1) = &v62[4 * v61];
        if (v57) {
          operator delete(v57);
        }
      }

      else
      {
        *(float *)__int128 v114 = v54;
        v56 = (float *)(v55 + 4);
      }

      *(void *)&__int128 v114 = v56;
      float v65 = v127;
      __int128 v66 = (char *)v115[1];
      if (v115[1] >= (void *)v116)
      {
        char v68 = (char *)v115[0];
        int64_t v69 = ((char *)v115[1] - (char *)v115[0]) >> 2;
        unint64_t v70 = v69 + 1;
        uint64_t v71 = v116 - (unint64_t)v115[0];
        else {
          unint64_t v72 = v70;
        }
        if (v72)
        {
          v73 = (char *)sub_10000956C((uint64_t)&v116, v72);
          char v68 = (char *)v115[0];
          __int128 v66 = (char *)v115[1];
        }

        else
        {
          v73 = 0LL;
        }

        v74 = (float *)&v73[4 * v69];
        float *v74 = v65;
        v67 = v74 + 1;
        while (v66 != v68)
        {
          int v75 = *((_DWORD *)v66 - 1);
          v66 -= 4;
          *((_DWORD *)v74-- - 1) = v75;
        }

        v115[0] = v74;
        v115[1] = v67;
        *(void *)&__int128 v116 = &v73[4 * v72];
        if (v68) {
          operator delete(v68);
        }
      }

      else
      {
        *(float *)v115[1] = v65;
        v67 = v66 + 4;
      }

      v115[1] = v67;
      float v76 = v125;
      v77 = (char *)v117;
      if ((unint64_t)v117 >= *((void *)&v117 + 1))
      {
        v79 = (char *)*((void *)&v116 + 1);
        uint64_t v80 = (uint64_t)(v117 - *((void *)&v116 + 1)) >> 2;
        unint64_t v81 = v80 + 1;
        uint64_t v82 = *((void *)&v117 + 1) - *((void *)&v116 + 1);
        else {
          unint64_t v83 = v81;
        }
        if (v83)
        {
          v84 = (char *)sub_10000956C((uint64_t)&v117 + 8, v83);
          v79 = (char *)*((void *)&v116 + 1);
          v77 = (char *)v117;
        }

        else
        {
          v84 = 0LL;
        }

        v85 = (float *)&v84[4 * v80];
        float *v85 = v76;
        v78 = v85 + 1;
        while (v77 != v79)
        {
          int v86 = *((_DWORD *)v77 - 1);
          v77 -= 4;
          *((_DWORD *)v85-- - 1) = v86;
        }

        *((void *)&v116 + 1) = v85;
        *(void *)&__int128 v117 = v78;
        *((void *)&v117 + 1) = &v84[4 * v83];
        if (v79) {
          operator delete(v79);
        }
      }

      else
      {
        *(float *)__int128 v117 = v76;
        v78 = (float *)(v77 + 4);
      }

      *(void *)&__int128 v117 = v78;
      int v87 = v124;
      v88 = (char *)v120;
      if ((unint64_t)v120 >= *((void *)&v120 + 1))
      {
        v90 = (char *)*((void *)&v119 + 1);
        uint64_t v91 = (uint64_t)(v120 - *((void *)&v119 + 1)) >> 2;
        unint64_t v92 = v91 + 1;
        uint64_t v93 = *((void *)&v120 + 1) - *((void *)&v119 + 1);
        else {
          unint64_t v94 = v92;
        }
        if (v94)
        {
          v95 = (char *)sub_10000956C((uint64_t)&v120 + 8, v94);
          v90 = (char *)*((void *)&v119 + 1);
          v88 = (char *)v120;
        }

        else
        {
          v95 = 0LL;
        }

        v96 = (int *)&v95[4 * v91];
        int *v96 = v87;
        v89 = v96 + 1;
        while (v88 != v90)
        {
          int v97 = *((_DWORD *)v88 - 1);
          v88 -= 4;
          *--v96 = v97;
        }

        *((void *)&v119 + 1) = v96;
        *(void *)&__int128 v120 = v89;
        *((void *)&v120 + 1) = &v95[4 * v94];
        if (v90) {
          operator delete(v90);
        }
      }

      else
      {
        *(_DWORD *)__int128 v120 = v124;
        v89 = v88 + 4;
      }

      *(void *)&__int128 v120 = v89;
      v98 = (_OWORD *)*((void *)&v121 + 1);
      if (*((void *)&v121 + 1) >= v122)
      {
        uint64_t v100 = sub_10112142C((uint64_t *)&v121, (__int128 *)&v123);
      }

      else
      {
        if ((char)v123.__r_.__value_.__s.__size_ < 0)
        {
          sub_1010DD48C(*((_BYTE **)&v121 + 1), v123.__r_.__value_.__l.__data_, v123.__r_.__value_.__l.__size_);
        }

        else
        {
          __int128 v99 = *(_OWORD *)&v123.__r_.__value_.__l.__data_;
          *(void *)(*((void *)&v121 + 1) + 16LL) = v123.__r_.__value_.__l.__cap_;
          _OWORD *v98 = v99;
        }

        uint64_t v100 = (uint64_t)v98 + 24;
      }

      *((void *)&v121 + 1) = v100;
      ++v4;
    }

    while (v4 != v105);
    -[CLPressureStatsCollector cleanCache](self, "cleanCache");
    uint64_t v101 = sub_1002F8DDC();
    if (byte_101999C2F >= 0) {
      v102 = (const char *)&qword_101999C18;
    }
    else {
      v102 = (const char *)qword_101999C18;
    }
    sub_1002AC7B8(v101, v102, &Current);
    uint64_t v103 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v103 + 944LL))(v103);
    sub_1009E0264((uint64_t)v107);
  }

- (void)sendCAMetric:(id *)a3
{
  v19[0] = @"medianAbsDevOfTCO";
  *(float *)&double v3 = a3->var5;
  v20[0] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v3);
  v19[1] = @"meanAbsOfPressureError";
  *(float *)&double v5 = a3->var0;
  v20[1] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v5);
  v19[2] = @"varianceOfPressureError";
  *(float *)&double v6 = a3->var1;
  v20[2] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v6);
  v19[3] = @"deltaPressure";
  *(float *)&double v7 = a3->var2;
  v20[3] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v7);
  v19[4] = @"deltaTemperature";
  *(float *)&double v8 = a3->var3;
  v20[4] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v8);
  v19[5] = @"TCO";
  *(float *)&double v9 = a3->var4;
  v20[5] = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9);
  v19[6] = @"flightsOfStairsIn24Hr";
  v20[6] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3->var6);
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  7LL);
  if (qword_1019345B0 != -1) {
    dispatch_once(&qword_1019345B0, &stru_101866710);
  }
  uint64_t v11 = (os_log_s *)qword_1019345B8;
  if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "[CLPressureStatsCollector] Sending event, %{public}@",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101866710);
    }
    int v15 = 138543362;
    uint64_t v16 = v10;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "[CLPressureStatsCollector] Sending event, %{public}@",  &v15,  12);
    uint64_t v13 = (uint8_t *)v12;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPressureStatsCollector sendCAMetric:]", "%s\n", v12);
    if (v13 != buf) {
      free(v13);
    }
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1009E014C;
  v14[3] = &unk_101820740;
  v14[4] = v10;
  AnalyticsSendEventLazy(@"com.apple.Motion.PressureStats", v14);
}

- (void).cxx_destruct
{
  value = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  int v4 = self->fPressureDispatcher.__ptr_.__value_;
  self->fPressureDispatcher.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Dispatcher *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  self->fPressureDispatcher.__ptr_.__value_ = 0LL;
  self->fStatusClient.__ptr_.__value_ = 0LL;
  sub_100DE9988((uint64_t)&self->fK2Detector);
  sub_100821188((uint64_t)&self->fSlopeEstimator, 20, 55);
  return self;
}

@end