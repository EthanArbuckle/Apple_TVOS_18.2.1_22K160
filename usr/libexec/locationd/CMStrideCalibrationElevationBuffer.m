@interface CMStrideCalibrationElevationBuffer
- (id).cxx_construct;
- (void)ageOutElevationArray;
- (void)feedElevationData:(const NotificationData *)a3;
- (void)updateGradient:(id)a3;
@end

@implementation CMStrideCalibrationElevationBuffer

- (void)ageOutElevationArray
{
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t value = self->fElevationWindow.__size_.__value_;
  if (value)
  {
    double v5 = Current;
    do
    {
      if (v5
         - (*(CLElevationChangeEntry **)((char *)self->fElevationWindow.__map_.__begin_
                                       + ((self->fElevationWindow.__start_ >> 3) & 0x1FFFFFFFFFFFFFF8LL)))[self->fElevationWindow.__start_ & 0x3F].var1 <= 600.0)
        break;
      ++self->fElevationWindow.__start_;
      self->fElevationWindow.__size_.__value_ = value - 1;
      sub_1002D6E20((uint64_t)&self->fElevationWindow, 1);
      unint64_t value = self->fElevationWindow.__size_.__value_;
    }

    while (value);
  }

- (void)feedElevationData:(const NotificationData *)a3
{
  if (qword_101934510 != -1) {
    dispatch_once(&qword_101934510, &stru_101889830);
  }
  double v5 = (os_log_s *)qword_101934518;
  if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *((void *)a3 + 1);
    int v8 = *((_DWORD *)a3 + 4);
    int v9 = *((_DWORD *)a3 + 5);
    *(_DWORD *)buf = 134218752;
    uint64_t v26 = v6;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 1024;
    int v30 = v8;
    __int16 v31 = 1024;
    int v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Elevation, %f, %f, %d, %d", buf, 0x22u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934510 != -1) {
      dispatch_once(&qword_101934510, &stru_101889830);
    }
    uint64_t v10 = *(void *)a3;
    uint64_t v11 = *((void *)a3 + 1);
    int v12 = *((_DWORD *)a3 + 4);
    int v13 = *((_DWORD *)a3 + 5);
    int v17 = 134218752;
    uint64_t v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 1024;
    int v22 = v12;
    __int16 v23 = 1024;
    int v24 = v13;
    LODWORD(v16) = 34;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934518,  2LL,  "Elevation, %f, %f, %d, %d",  COERCE_DOUBLE(&v17),  v16);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrationElevationBuffer feedElevationData:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  -[CMStrideCalibrationElevationBuffer ageOutElevationArray](self, "ageOutElevationArray");
  sub_100E88940(&self->fElevationWindow.__map_.__first_, (__int128 *)a3);
}

- (void)updateGradient:(id)a3
{
  if ([a3 gradientValidity] == (id)-1)
  {
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "track"), "start"), "timeIntervalSinceReferenceDate");
    double v6 = v5;
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "track"), "stop"), "timeIntervalSinceReferenceDate");
    unint64_t start = self->fElevationWindow.__start_;
    begin = self->fElevationWindow.__map_.__begin_;
    end = self->fElevationWindow.__map_.__end_;
    uint64_t v11 = (char *)&begin[start >> 6];
    if (end == begin)
    {
      unint64_t v12 = 0LL;
      unint64_t v15 = 0LL;
      unint64_t v13 = self->fElevationWindow.__size_.__value_ + start;
      v14 = (char *)&begin[v13 >> 6];
    }

    else
    {
      unint64_t v12 = *(void *)v11 + ((self->fElevationWindow.__start_ & 0x3F) << 6);
      unint64_t v13 = self->fElevationWindow.__size_.__value_ + start;
      v14 = (char *)&begin[v13 >> 6];
      unint64_t v15 = *(void *)v14 + ((v13 & 0x3F) << 6);
    }

    if (v15 != v12)
    {
      uint64_t v16 = ((uint64_t)(v15 - *(void *)v14) >> 6) + 8 * (v14 - v11);
      unint64_t v17 = v16 - ((uint64_t)(v12 - *(void *)v11) >> 6);
      if (v16 != (uint64_t)(v12 - *(void *)v11) >> 6)
      {
        uint64_t v18 = &begin[start >> 6];
        do
        {
          unint64_t v19 = v17 >> 1;
          if (v17 == 1)
          {
            unint64_t v20 = v12;
            __int16 v21 = v18;
          }

          else
          {
            uint64_t v22 = v19 + ((uint64_t)(v12 - (void)*v18) >> 6);
            if (v22 < 1)
            {
              unint64_t v23 = 63 - v22;
              LOBYTE(v22) = ~(63 - v22);
              __int16 v21 = &v18[-(v23 >> 6)];
            }

            else
            {
              __int16 v21 = &v18[(unint64_t)v22 >> 6];
            }

            unint64_t v20 = (unint64_t)&(*v21)[(unint64_t)(v22 & 0x3F)];
          }

          if (*(double *)(v20 + 8) < v6)
          {
            unint64_t v12 = v20 + 64;
            if (v20 + 64 - (void)*v21 == 4096)
            {
              unint64_t v24 = (unint64_t)v21[1];
              ++v21;
              unint64_t v12 = v24;
            }

            unint64_t v19 = v17 + ~v19;
            uint64_t v18 = v21;
          }

          unint64_t v17 = v19;
        }

        while (v19);
      }
    }

    if (end == begin)
    {
      unint64_t v25 = 0LL;
      unint64_t v26 = 0LL;
    }

    else
    {
      unint64_t v25 = *(void *)v11 + ((self->fElevationWindow.__start_ & 0x3F) << 6);
      unint64_t v26 = *(void *)v14 + ((v13 & 0x3F) << 6);
    }

    if (v26 != v25)
    {
      uint64_t v27 = ((uint64_t)(v26 - *(void *)v14) >> 6) + 8 * (v14 - v11);
      unint64_t v28 = v27 - ((uint64_t)(v25 - *(void *)v11) >> 6);
      if (v27 != (uint64_t)(v25 - *(void *)v11) >> 6)
      {
        do
        {
          unint64_t v29 = v28 >> 1;
          if (v28 == 1)
          {
            unint64_t v30 = v25;
            __int16 v31 = v11;
          }

          else
          {
            uint64_t v32 = v29 + ((uint64_t)(v25 - *(void *)v11) >> 6);
            if (v32 < 1)
            {
              unint64_t v33 = 63 - v32;
              LOBYTE(v32) = ~(63 - v32);
              __int16 v31 = &v11[-8 * (v33 >> 6)];
            }

            else
            {
              __int16 v31 = &v11[8 * ((unint64_t)v32 >> 6)];
            }

            unint64_t v30 = *(void *)v31 + ((unint64_t)(v32 & 0x3F) << 6);
          }

          if (*(double *)(v30 + 8) < v7)
          {
            unint64_t v25 = v30 + 64;
            if (v30 + 64 - *(void *)v31 == 4096)
            {
              unint64_t v34 = *((void *)v31 + 1);
              v31 += 8;
              unint64_t v25 = v34;
            }

            unint64_t v29 = v28 + ~v29;
            uint64_t v11 = v31;
          }

          unint64_t v28 = v29;
        }

        while (v29);
      }
    }

    if (end == begin)
    {
      if (!v12) {
        return;
      }
      unint64_t v35 = 0LL;
    }

    else
    {
      unint64_t v35 = *(void *)v14 + ((v13 & 0x3F) << 6);
      if (v35 == v12) {
        return;
      }
    }

    if (v35 != v25)
    {
      unsigned int v36 = *(_DWORD *)(v25 + 16) - *(_DWORD *)(v12 + 16);
      unsigned int v37 = *(_DWORD *)(v25 + 20) - *(_DWORD *)(v12 + 20);
      objc_msgSend(objc_msgSend(a3, "track"), "distanceGps");
      [a3 setGradient:((double)v36 - (double)v37) / v38];
      if (qword_101934510 != -1) {
        dispatch_once(&qword_101934510, &stru_101889830);
      }
      v39 = (os_log_s *)qword_101934518;
      if (os_log_type_enabled((os_log_t)qword_101934518, OS_LOG_TYPE_DEBUG))
      {
        if ([a3 gradientValidity]) {
          v40 = "Success";
        }
        else {
          v40 = "Fail";
        }
        *(_DWORD *)buf = 136315906;
        v54 = v40;
        __int16 v55 = 2080;
        id v56 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
        __int16 v57 = 1024;
        unsigned int v58 = v36;
        __int16 v59 = 1024;
        unsigned int v60 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "TrackCalibration,%s,CalData,%s,ElevationAscended,%d,ElevationDescended,%d",  buf,  0x22u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934510 != -1) {
          dispatch_once(&qword_101934510, &stru_101889830);
        }
        uint64_t v41 = qword_101934518;
        if ([a3 gradientValidity]) {
          v42 = "Success";
        }
        else {
          v42 = "Fail";
        }
        int v45 = 136315906;
        v46 = v42;
        __int16 v47 = 2080;
        id v48 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
        __int16 v49 = 1024;
        unsigned int v50 = v36;
        __int16 v51 = 1024;
        unsigned int v52 = v37;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v41,  2LL,  "TrackCalibration,%s,CalData,%s,ElevationAscended,%d,ElevationDescended,%d",  (const char *)&v45,  34);
        v44 = (uint8_t *)v43;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CMStrideCalibrationElevationBuffer updateGradient:]", "%s\n", v43);
        if (v44 != buf) {
          free(v44);
        }
      }
    }
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end