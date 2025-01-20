@interface CLElevationThresholdManager
- (BOOL)removeClient:(id)a3;
- (BOOL)updateWithAltitude:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6;
- (CLElevationThresholdManager)init;
- (id).cxx_construct;
- (multimap<float,)getElevationThresholdProxyMap;
- (void)clearShouldAlert;
- (void)initializeThresholdsGivenAltitude:(float)a3 andAccuracy:(float)a4;
- (void)insertClient:(id)a3 withThreshold:(float)a4;
- (void)sendAnalyticsEventForId:(id)a3;
- (void)thresholdBoundsForElevation:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6;
- (void)thresholdUpdated:(ThresholdClient *)a3 initialized:(BOOL)a4 above:(BOOL)a5;
- (void)updateAnalyticsWithAltitude:(float)a3;
- (void)updateInitializedThresholdsWithAltitude:(float)a3;
@end

@implementation CLElevationThresholdManager

- (CLElevationThresholdManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLElevationThresholdManager;
  v2 = -[CLElevationThresholdManager init](&v6, "init");
  if (v2)
  {
    sub_101206C88(v4, "ElevationThresholdHysteresisBand", dword_10130CEC8, 0);
    v2->_hysteresisBand = v5;
  }

  return v2;
}

- (void)thresholdBoundsForElevation:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6
{
  if (self->_elevationThresholdMap.__tree_.__pair3_.__value_)
  {
    begin_node = (CLElevationThresholdManager *)self->_elevationThresholdMap.__tree_.__begin_node_;
    p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
    if (begin_node != (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_)
    {
      v11 = (float *)self->_elevationThresholdMap.__tree_.__begin_node_;
      do
      {
        if (a4 < 100.0)
        {
          float v12 = v11[8];
          if (v12 < a3)
          {
            if (*((_BYTE *)v11 + 40)) {
              *a6 = v12;
            }
          }
        }

        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)v11 + 1);
        if (left)
        {
          do
          {
            v14 = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
          }

          while (left);
        }

        else
        {
          do
          {
            v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)v11 + 2);
            BOOL v15 = v14->__value_.__left_ == v11;
            v11 = (float *)v14;
          }

          while (!v15);
        }

        v11 = (float *)v14;
      }

      while (v14 != p_pair1);
      do
      {
        v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)p_pair1->__value_.__left_;
        if (a4 < 100.0)
        {
          v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
          v18 = p_pair1;
          if (v16)
          {
            do
            {
              v19 = v17;
              v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v17[1];
            }

            while (v17);
          }

          else
          {
            do
            {
              v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v18[2].__value_.__left_;
              BOOL v15 = *v19 == v18;
              v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v19;
            }

            while (v15);
          }

          if (*((float *)v19 + 8) > a3)
          {
            v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
            v21 = p_pair1;
            if (v16)
            {
              do
              {
                v22 = v20;
                v20 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v20[1];
              }

              while (v20);
            }

            else
            {
              do
              {
                v22 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v21[2].__value_.__left_;
                BOOL v15 = *v22 == v21;
                v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v22;
              }

              while (v15);
            }

            if (*((_BYTE *)v22 + 40))
            {
              v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)p_pair1->__value_.__left_;
              v24 = p_pair1;
              if (v16)
              {
                do
                {
                  v25 = v23;
                  v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v23[1];
                }

                while (v23);
              }

              else
              {
                do
                {
                  v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> **)v24[2].__value_.__left_;
                  BOOL v15 = *v25 == v24;
                  v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v25;
                }

                while (v15);
              }

              *a5 = *((float *)v25 + 8);
            }
          }
        }

        if (v16)
        {
          do
          {
            v26 = v16;
            v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v16[1].__value_.__left_;
          }

          while (v16);
        }

        else
        {
          do
          {
            v26 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)p_pair1[2].__value_.__left_;
            BOOL v15 = v26->__value_.__left_ == p_pair1;
            p_pair1 = v26;
          }

          while (v15);
        }

        p_pair1 = v26;
      }

      while (v26 != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node);
    }

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101847AF0);
    }
    v27 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
    {
      double v28 = *a6;
      double v29 = *a5;
      *(_DWORD *)buf = 134218496;
      double v42 = a3;
      __int16 v43 = 2048;
      double v44 = v28;
      __int16 v45 = 2048;
      double v46 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "currentAltitude,%f,thresholdLowerBound,%f,thresholdUpperBound,%f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101847AF0);
      }
      double v30 = *a6;
      double v31 = *a5;
      int v35 = 134218496;
      double v36 = a3;
      __int16 v37 = 2048;
      double v38 = v30;
      __int16 v39 = 2048;
      double v40 = v31;
      LODWORD(v34) = 32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "currentAltitude,%f,thresholdLowerBound,%f,thresholdUpperBound,%f",  COERCE_DOUBLE(&v35),  v34);
      v33 = (uint8_t *)v32;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationThresholdManager thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:]",  "%s\n",  v32);
      if (v33 != buf) {
        free(v33);
      }
    }
  }

- (void)insertClient:(id)a3 withThreshold:(float)a4
{
  *(float *)buf = a4;
  *(_WORD *)&buf[8] = 0;
  *(void *)&buf[16] = a3;
  LOBYTE(v28) = 0;
  sub_100658034((uint64_t **)&self->_elevationThresholdMap, buf);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_;
  v7 = left;
  if (!left) {
    goto LABEL_12;
  }
  v10 = p_pair1;
  do
  {
    unint64_t v11 = (unint64_t)v7[4].__value_.__left_;
    _CF = v11 >= (unint64_t)a3;
    else {
      v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)&v7[1];
    }
    if (_CF) {
      v10 = v7;
    }
    v7 = *v13;
  }

  while (*v13);
  if (v10 == p_pair1 || v10[4].__value_.__left_ > a3)
  {
LABEL_12:
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(void *)buf = a3;
    __asm { FMOV            V1.2D, #-1.0 }

    *(_OWORD *)&buf[8] = _Q1;
    unint64_t v28 = 0xBFF0000000000000LL;
    double v29 = a4;
    CFAbsoluteTime v30 = Current;
    sub_1006580C8((uint64_t **)&p_pair1[-1], (unint64_t *)buf, buf);
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101847AF0);
  }
  v19 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "threshold client registered,client,%p,threshold,%f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101847AF0);
    }
    int v23 = 134218240;
    id v24 = a3;
    __int16 v25 = 2048;
    double v26 = a4;
    LODWORD(v22) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "threshold client registered,client,%p,threshold,%f",  &v23,  v22);
    v21 = (char *)v20;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLElevationThresholdManager insertClient:withThreshold:]", "%s\n", v20);
    if (v21 != buf) {
      free(v21);
    }
  }

- (BOOL)removeClient:(id)a3
{
  p_elevationThresholdMap = (uint64_t **)&self->_elevationThresholdMap;
  begin_node = (CLElevationThresholdManager *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node == (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_)
  {
    int v7 = 0;
  }

  else
  {
    int v7 = 0;
    do
    {
      if ([begin_node->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_ isEqual:a3])
      {
        v8 = sub_1000087E8(p_elevationThresholdMap, (uint64_t *)begin_node);
        operator delete(begin_node);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101847AF0);
        }
        v9 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "threshold client removed,client,%p",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_101847AF0);
          }
          int v16 = 134217984;
          id v17 = a3;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "threshold client removed,client,%p",  &v16);
          v13 = (char *)v12;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLElevationThresholdManager removeClient:]", "%s\n", v12);
          if (v13 != buf) {
            free(v13);
          }
        }

        ++v7;
        begin_node = (CLElevationThresholdManager *)v8;
      }

      else
      {
        isa = (CLElevationThresholdManager *)begin_node->_elevationThresholdMap.__tree_.__begin_node_;
        if (isa)
        {
          do
          {
            begin_node = isa;
            isa = (CLElevationThresholdManager *)isa->super.isa;
          }

          while (isa);
        }

        else
        {
          do
          {
            unint64_t v11 = (objc_class *)begin_node;
            begin_node = (CLElevationThresholdManager *)begin_node->_elevationThresholdMap.__tree_.__pair1_.__value_.__left_;
          }

          while (begin_node->super.isa != v11);
        }
      }
    }

    while (begin_node != (CLElevationThresholdManager *)p_pair1);
  }

  *(void *)buf = a3;
  sub_1004C40E4((uint64_t)&self->_elevationThresholdClientAnalyticsMap, (unint64_t *)buf);
  return v7 > 0;
}

- (multimap<float,)getElevationThresholdProxyMap
{
  return (multimap<float, CLBarometerCalibration_Types::ThresholdClient, std::less<float>, std::allocator<std::pair<const float, CLBarometerCalibration_Types::ThresholdClient>>> *)sub_100658188((uint64_t)retstr, (uint64_t)&self->_elevationThresholdMap);
}

- (void)initializeThresholdsGivenAltitude:(float)a3 andAccuracy:(float)a4
{
  begin_node = (float *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node != (float *)&self->_elevationThresholdMap.__tree_.__pair1_)
  {
    double v8 = a3;
    *(void *)&__int128 v9 = 134219008LL;
    __int128 v29 = v9;
    do
    {
      float v10 = begin_node[8];
      float hysteresisBand = self->_hysteresisBand;
      BOOL v12 = v10 <= (float)(hysteresisBand + a3) && v10 >= (float)(a3 - hysteresisBand);
      if (!*((_BYTE *)begin_node + 40) && !v12)
      {
        -[CLElevationThresholdManager thresholdUpdated:initialized:above:](self, "thresholdUpdated:initialized:above:");
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101847AF0);
        }
        v13 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          double v15 = begin_node[8];
          double v16 = self->_hysteresisBand;
          int v17 = *((unsigned __int8 *)begin_node + 40);
          *(_DWORD *)buf = v29;
          CFAbsoluteTime v41 = Current;
          __int16 v42 = 2048;
          double v43 = v15;
          __int16 v44 = 2048;
          double v45 = v8;
          __int16 v46 = 2048;
          double v47 = v16;
          __int16 v48 = 1024;
          int v49 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "threshold initialized,timestamp,%f,threshold,%f,altitude,%f,hysteresis,%f,initialized,%d",  buf,  0x30u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_101847AF0);
          }
          uint64_t v21 = qword_1019346A8;
          CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
          double v23 = begin_node[8];
          double v24 = self->_hysteresisBand;
          int v25 = *((unsigned __int8 *)begin_node + 40);
          int v30 = v29;
          CFAbsoluteTime v31 = v22;
          __int16 v32 = 2048;
          double v33 = v23;
          __int16 v34 = 2048;
          double v35 = v8;
          __int16 v36 = 2048;
          double v37 = v24;
          __int16 v38 = 1024;
          int v39 = v25;
          LODWORD(v28) = 48;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v21,  0LL,  "threshold initialized,timestamp,%f,threshold,%f,altitude,%f,hysteresis,%f,initialized,%d",  COERCE_DOUBLE(&v30),  v28,  *(double *)&v29,  *((double *)&v29 + 1));
          v27 = (uint8_t *)v26;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationThresholdManager initializeThresholdsGivenAltitude:andAccuracy:]",  "%s\n",  v26);
          if (v27 != buf) {
            free(v27);
          }
        }
      }

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)begin_node + 1);
      if (left)
      {
        do
        {
          v19 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
        }

        while (left);
      }

      else
      {
        do
        {
          v19 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)*((void *)begin_node + 2);
          BOOL v20 = v19->__value_.__left_ == begin_node;
          begin_node = (float *)v19;
        }

        while (!v20);
      }

      begin_node = (float *)v19;
    }

    while (v19 != p_pair1);
  }

- (void)thresholdUpdated:(ThresholdClient *)a3 initialized:(BOOL)a4 above:(BOOL)a5
{
  if (a3->var0 != a4 || a3->var1 != a5)
  {
    a3->var0 = a4;
    a3->var1 = a5;
    a3->var3 = 1;
  }

- (BOOL)updateWithAltitude:(float)a3 andAccuracy:(float)a4 upperBound:(float *)a5 lowerBound:(float *)a6
{
  *(float *)&double v11 = a3;
  -[CLElevationThresholdManager updateAnalyticsWithAltitude:](self, "updateAnalyticsWithAltitude:", v11);
  *(float *)&double v12 = a3;
  -[CLElevationThresholdManager updateInitializedThresholdsWithAltitude:]( self,  "updateInitializedThresholdsWithAltitude:",  v12);
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  -[CLElevationThresholdManager initializeThresholdsGivenAltitude:andAccuracy:]( self,  "initializeThresholdsGivenAltitude:andAccuracy:",  v13,  v14);
  *(float *)&double v15 = a3;
  *(float *)&double v16 = a4;
  -[CLElevationThresholdManager thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:]( self,  "thresholdBoundsForElevation:andAccuracy:upperBound:lowerBound:",  a5,  a6,  v15,  v16);
  if (*a5 == self->_currentElevationThreshold.upper && *a6 == self->_currentElevationThreshold.lower) {
    return 0;
  }
  self->_currentElevationThreshold.upper = *a5;
  self->_currentElevationThreshold.lower = *a6;
  return 1;
}

- (void)updateInitializedThresholdsWithAltitude:(float)a3
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)self->_elevationThresholdMap.__tree_.__begin_node_;
  p_pair1 = &self->_elevationThresholdMap.__tree_.__pair1_;
  if (begin_node != &self->_elevationThresholdMap.__tree_.__pair1_)
  {
    p_elevationThresholdClientAnalyticsMap = &self->_elevationThresholdClientAnalyticsMap;
    do
    {
      float v8 = *(float *)&begin_node[4].__value_.__left_;
      if (BYTE1(begin_node[5].__value_.__left_) != v8 < a3 && LOBYTE(begin_node[5].__value_.__left_))
      {
        -[CLElevationThresholdManager thresholdUpdated:initialized:above:]( self,  "thresholdUpdated:initialized:above:",  &begin_node[5],  0LL,  v8 < a3);
        -[CLElevationThresholdManager sendAnalyticsEventForId:]( self,  "sendAnalyticsEventForId:",  begin_node[6].__value_.__left_);
        sub_1004C40E4((uint64_t)p_elevationThresholdClientAnalyticsMap, (unint64_t *)&begin_node[6]);
      }

      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          float v10 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)left->__value_.__left_;
        }

        while (left);
      }

      else
      {
        do
        {
          float v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }

        while (!v11);
      }

      begin_node = v10;
    }

    while (v10 != p_pair1);
  }

- (void)clearShouldAlert
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)self->_elevationThresholdMap.__tree_.__begin_node_;
  if (begin_node != &self->_elevationThresholdMap.__tree_.__pair1_)
  {
    do
    {
      LOBYTE(begin_node[7].__value_.__left_) = 0;
      left = (CLElevationThresholdManager *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v4 = left;
          left = (CLElevationThresholdManager *)left->super.isa;
        }

        while (left);
      }

      else
      {
        do
        {
          v4 = (CLElevationThresholdManager *)begin_node[2].__value_.__left_;
          BOOL v5 = v4->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v4;
        }

        while (!v5);
      }

      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<float, CLBarometerCalibration_Types::ThresholdClient>, void *>>> *)v4;
    }

    while (v4 != (CLElevationThresholdManager *)&self->_elevationThresholdMap.__tree_.__pair1_);
  }

- (void)updateAnalyticsWithAltitude:(float)a3
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__begin_node_;
  if (begin_node != &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_)
  {
    double v4 = a3;
    do
    {
      double v5 = vabdd_f64(v4, *(double *)&begin_node[8].__value_.__left_);
      *(double *)&begin_node[7].__value_.__left_ = v5;
      left = (CLElevationThresholdManager *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          int v7 = left;
          left = (CLElevationThresholdManager *)left->super.isa;
        }

        while (left);
      }

      else
      {
        do
        {
          int v7 = (CLElevationThresholdManager *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)v7;
        }

        while (!v8);
      }

      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)v7;
    }

    while (v7 != (CLElevationThresholdManager *)&self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_);
  }

- (void)sendAnalyticsEventForId:(id)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> *)self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_elevationThresholdClientAnalyticsMap.__tree_.__pair1_;
  double v4 = left;
  if (left)
  {
    objc_super v6 = p_pair1;
    do
    {
      unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
      BOOL v8 = v7 >= (unint64_t)a3;
      else {
        __int128 v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<id, CLBarometerCalibration_Types::ThresholdAnalytics>, void *>>> **)&v4[1];
      }
      if (v8) {
        objc_super v6 = v4;
      }
      double v4 = *v9;
    }

    while (*v9);
    if (v6 != p_pair1 && v6[4].__value_.__left_ <= a3)
    {
      *(CFAbsoluteTime *)&v6[6].__value_.__left_ = CFAbsoluteTimeGetCurrent() - *(double *)&v6[9].__value_.__left_;
      double v10 = *(double *)&v6[5].__value_.__left_;
      int v49 = 0LL;
      uint64_t v50 = 0LL;
      __p = 0LL;
      sub_100007590(&__p, (const void *)qword_1019979E8, qword_1019979F0, (qword_1019979F0 - qword_1019979E8) >> 3);
      sub_100657A00((uint64_t)&__p, v51, v10);
      if (__p)
      {
        int v49 = __p;
        operator delete(__p);
      }

      double v11 = *(double *)&v6[7].__value_.__left_;
      __int16 v44 = 0LL;
      uint64_t v45 = 0LL;
      double v43 = 0LL;
      sub_100007590(&v43, (const void *)qword_1019979E8, qword_1019979F0, (qword_1019979F0 - qword_1019979E8) >> 3);
      sub_100657A00((uint64_t)&v43, v46, v11);
      if (v43)
      {
        __int16 v44 = v43;
        operator delete(v43);
      }

      double v12 = *(double *)&v6[6].__value_.__left_;
      int v39 = 0LL;
      uint64_t v40 = 0LL;
      __int16 v38 = 0LL;
      sub_100007590(&v38, (const void *)qword_101997A00, qword_101997A08, (qword_101997A08 - qword_101997A00) >> 3);
      sub_100657A00((uint64_t)&v38, v41, v12);
      if (v38)
      {
        int v39 = v38;
        operator delete(v38);
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101847AF0);
      }
      double v13 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double v15 = v6[4].__value_.__left_;
        double v16 = v6[5].__value_.__left_;
        v18 = v6[6].__value_.__left_;
        int v17 = v6[7].__value_.__left_;
        *(_DWORD *)buf = 134219008;
        CFAbsoluteTime v64 = Current;
        __int16 v65 = 2048;
        v66 = v15;
        __int16 v67 = 2048;
        v68 = v16;
        __int16 v69 = 2048;
        v70 = v17;
        __int16 v71 = 2048;
        v72 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "threshold crossing analytics,timestamp,%f,client,%p,deltaElevationToThreshold,%f,maxDeltaElevationToCrossing,% f,timeToCrossing,%f",  buf,  0x34u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101847AF0);
        }
        uint64_t v19 = qword_1019346A8;
        CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
        uint64_t v21 = v6[4].__value_.__left_;
        CFAbsoluteTime v22 = v6[5].__value_.__left_;
        double v24 = v6[6].__value_.__left_;
        double v23 = v6[7].__value_.__left_;
        int v53 = 134219008;
        CFAbsoluteTime v54 = v20;
        __int16 v55 = 2048;
        v56 = v21;
        __int16 v57 = 2048;
        v58 = v22;
        __int16 v59 = 2048;
        v60 = v23;
        __int16 v61 = 2048;
        v62 = v24;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  0LL,  "threshold crossing analytics,timestamp,%f,client,%p,deltaElevationToThreshold,%f,maxDeltaElevationToCrossing,% f,timeToCrossing,%f",  COERCE_DOUBLE(&v53),  52,  v27,  *(double *)&v28,  *(double *)&v29);
        double v26 = (uint8_t *)v25;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLElevationThresholdManager sendAnalyticsEventForId:]", "%s\n", v25);
        if (v26 != buf) {
          free(v26);
        }
      }

      double v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3321888768LL;
      int v30 = sub_100657D88;
      CFAbsoluteTime v31 = &unk_101847AC0;
      if (SHIBYTE(v52) < 0)
      {
        sub_1010DD48C(&v32, v51[0], (unint64_t)v51[1]);
      }

      else
      {
        __int128 v32 = *(_OWORD *)v51;
        uint64_t v33 = v52;
      }

      if (SHIBYTE(v47) < 0)
      {
        sub_1010DD48C(&v34, v46[0], (unint64_t)v46[1]);
      }

      else
      {
        __int128 v34 = *(_OWORD *)v46;
        uint64_t v35 = v47;
      }

      if (SHIBYTE(v42) < 0)
      {
        sub_1010DD48C(&v36, v41[0], (unint64_t)v41[1]);
      }

      else
      {
        __int128 v36 = *(_OWORD *)v41;
        uint64_t v37 = v42;
      }

      AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.ElevationThresholdAlert", &v28);
      if (SHIBYTE(v37) < 0) {
        operator delete((void *)v36);
      }
      if (SHIBYTE(v35) < 0) {
        operator delete((void *)v34);
      }
      if (SHIBYTE(v33) < 0) {
        operator delete((void *)v32);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete(v41[0]);
      }
      if (SHIBYTE(v47) < 0) {
        operator delete(v46[0]);
      }
      if (SHIBYTE(v52) < 0) {
        operator delete(v51[0]);
      }
    }
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0LL;
  *((void *)self + 2) = 0LL;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 5) = (char *)self + 48;
  *((void *)self + 8) = 0xFF7FFFFF7F7FFFFFLL;
  return self;
}

@end