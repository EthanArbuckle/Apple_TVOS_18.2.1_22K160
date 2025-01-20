@interface CLElevationLocationFilter
- (BOOL)readyToFilter;
- (CLElevationLocationFilter)initWithWindowSize:(double)a3;
- (CLElevationLocationFilter)initWithWindowSize:(double)a3 andCadence:(double)a4 andVerticalAccuracyThreshold:(double)a5;
- (double)interpolateWithStartTime:(double)a3 andStartValue:(double)a4 andEndTime:(double)a5 andEndValue:(double)a6 atTargetTime:(double)a7;
- (id).cxx_construct;
- (unint64_t)_getElevationStartIndex:(id)a3;
- (void)_interpolatePressureValuesWithElevationArray:(id)a3;
- (void)aggregateFilteredLocations:(id)a3 andAddTo:(id)a4;
- (void)append:(id)a3;
- (void)dealloc;
- (void)fetchFilteredLocations:(id)a3 withElevationArray:(id)a4;
- (void)reset;
- (void)setReadyToFilter:(BOOL)a3;
@end

@implementation CLElevationLocationFilter

- (CLElevationLocationFilter)initWithWindowSize:(double)a3
{
  return -[CLElevationLocationFilter initWithWindowSize:andCadence:andVerticalAccuracyThreshold:]( self,  "initWithWindowSize:andCadence:andVerticalAccuracyThreshold:",  a3,  a3 * 0.5,  v7);
}

- (CLElevationLocationFilter)initWithWindowSize:(double)a3 andCadence:(double)a4 andVerticalAccuracyThreshold:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLElevationLocationFilter;
  v8 = -[CLElevationLocationFilter init](&v12, "init");
  if (v8)
  {
    v8->_locationBuffer = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v8->_windowSize = a3;
    v8->_cadence = a4;
    v8->_verticalAccuracyThreshold = a5;
    v8->_firstUnfilteredLocationTime = 1.79769313e308;
    v8->_readyToFilter = 0;
    unsigned __int8 v10 = 0;
    sub_1012049AC(v11, "ElevationVerbose", &v10, 0);
    v8->_isVerboseLogging = v11[1];
  }

  return v8;
}

- (void)dealloc
{
  self->_locationBuffer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLElevationLocationFilter;
  -[CLElevationLocationFilter dealloc](&v3, "dealloc");
}

- (void)reset
{
  self->_deltaElevationsInWindow.__end_ = self->_deltaElevationsInWindow.__begin_;
  self->_verticalAccuraciesInWindow.__end_ = self->_verticalAccuraciesInWindow.__begin_;
  self->_firstUnfilteredLocationTime = 1.79769313e308;
  self->_readyToFilter = 0;
}

- (void)append:(id)a3
{
  double v6 = v5;
  [a3 longitude];
  double v8 = v7;
  [a3 horizontalAccuracy];
  float v9 = v6;
  float v10 = v8;
  float v12 = v11;
  if (sub_100FAE1F4(v9, v10, v12))
  {
    if (self->_firstUnfilteredLocationTime == 1.79769313e308)
    {
      [a3 timestamp];
      self->_firstUnfilteredLocationTime = v13;
    }

    v14 = objc_alloc_init(&OBJC_CLASS___CLLocationFilterEntry);
    [a3 timestamp];
    -[CLLocationDBEntry setTimestamp:](v14, "setTimestamp:");
    [a3 elevation];
    -[CLLocationDBEntry setElevation:](v14, "setElevation:");
    [a3 verticalAccuracy];
    -[CLLocationDBEntry setVerticalAccuracy:](v14, "setVerticalAccuracy:");
    [a3 latitude];
    -[CLLocationDBEntry setLatitude:](v14, "setLatitude:");
    [a3 longitude];
    -[CLLocationDBEntry setLongitude:](v14, "setLongitude:");
    -[NSMutableArray addObject:](self->_locationBuffer, "addObject:", v14);

    [a3 timestamp];
    if (v15 - self->_firstUnfilteredLocationTime > self->_cadence) {
      self->_readyToFilter = 1;
    }
  }

- (void)fetchFilteredLocations:(id)a3 withElevationArray:(id)a4
{
  self->_readyToFilter = 0;
  if ([a4 count])
  {
    -[CLElevationLocationFilter _interpolatePressureValuesWithElevationArray:]( self,  "_interpolatePressureValuesWithElevationArray:",  a4);
    if (-[NSMutableArray count](self->_locationBuffer, "count"))
    {
      begin = self->_deltaElevationsInWindow.__begin_;
      end = self->_deltaElevationsInWindow.__end_;
      float v9 = begin + 1;
      double v10 = *begin;
      if (begin != end && v9 != end)
      {
        double v11 = *begin;
        float v12 = begin + 1;
        double v13 = self->_deltaElevationsInWindow.__begin_;
        v14 = begin + 1;
        do
        {
          double v15 = *v14++;
          double v16 = v15;
          if (v11 < v15)
          {
            double v11 = v16;
            double v13 = v12;
          }

          float v12 = v14;
        }

        while (v14 != end);
        double v17 = *v13;
        v18 = begin + 1;
        do
        {
          double v19 = *v18++;
          double v20 = v19;
          if (v19 < v10)
          {
            double v10 = v20;
            begin = v9;
          }

          float v9 = v18;
        }

        while (v18 != end);
        double v10 = v17;
      }

      double v21 = *begin;
      v22 = self->_verticalAccuraciesInWindow.__begin_;
      v23 = self->_verticalAccuraciesInWindow.__end_;
      v24 = v22 + 1;
      if (v22 != v23 && v24 != v23)
      {
        double v26 = *v22;
        v27 = v22 + 1;
        do
        {
          double v28 = *v27++;
          double v29 = v28;
          if (v28 < v26)
          {
            double v26 = v29;
            v22 = v24;
          }

          v24 = v27;
        }

        while (v27 != v23);
      }

      double verticalAccuracyThreshold = *v22;
      if (self->_verticalAccuracyThreshold < *v22) {
        double verticalAccuracyThreshold = self->_verticalAccuracyThreshold;
      }
      if (v10 - v21 >= verticalAccuracyThreshold)
      {
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        __int128 v57 = 0u;
        __int128 v58 = 0u;
        locationBuffer = self->_locationBuffer;
        id v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationBuffer,  "countByEnumeratingWithState:objects:count:",  &v57,  v66,  16LL);
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v58;
          while (2)
          {
            for (i = 0LL; i != v50; i = (char *)i + 1)
            {
              if (*(void *)v58 != v51) {
                objc_enumerationMutation(locationBuffer);
              }
              v53 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
              [v53 timestamp];
              if (v54 > self->_firstUnfilteredLocationTime + self->_cadence)
              {
                v55 = v53;
LABEL_58:
                [v55 timestamp];
                self->_firstUnfilteredLocationTime = v56;
                return;
              }
            }

            id v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationBuffer,  "countByEnumeratingWithState:objects:count:",  &v57,  v66,  16LL);
            if (v50) {
              continue;
            }
            break;
          }
        }
      }

      else
      {
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        v31 = self->_locationBuffer;
        id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v61,  v67,  16LL);
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v62;
          while (2)
          {
            for (j = 0LL; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v62 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)j);
              [v36 timestamp];
              if (v37 >= self->_firstUnfilteredLocationTime)
              {
                [v36 timestamp];
                if (v38 > self->_firstUnfilteredLocationTime + self->_cadence)
                {
                  v55 = v36;
                  goto LABEL_58;
                }

                [v36 elevation];
                float v40 = v39;
                [v36 interpPressure];
                float v42 = v41;
                float v43 = sub_100FAE05C(v40, v42);
                if (v43 >= 80000.0 && v43 <= 115000.0)
                {
                  v44 = objc_alloc_init(&OBJC_CLASS___CLLocationDBEntry);
                  [v36 timestamp];
                  -[CLLocationDBEntry setTimestamp:](v44, "setTimestamp:");
                  [v36 elevation];
                  -[CLLocationDBEntry setElevation:](v44, "setElevation:");
                  [v36 verticalAccuracy];
                  -[CLLocationDBEntry setVerticalAccuracy:](v44, "setVerticalAccuracy:");
                  [v36 interpPressure];
                  -[CLLocationDBEntry setInterpPressure:](v44, "setInterpPressure:");
                  [v36 latitude];
                  -[CLLocationDBEntry setLatitude:](v44, "setLatitude:");
                  [v36 longitude];
                  -[CLLocationDBEntry setLongitude:](v44, "setLongitude:");
                  [a3 addObject:v44];
                }
              }
            }

            id v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v31,  "countByEnumeratingWithState:objects:count:",  &v61,  v67,  16LL);
            if (v33) {
              continue;
            }
            break;
          }
        }
      }
    }
  }

  else
  {
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101872C80);
    }
    v45 = (os_log_s *)qword_1019345B8;
    if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "warning: location filter requires a non-empty elevationArray",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345B0 != -1) {
        dispatch_once(&qword_1019345B0, &stru_101872C80);
      }
      v65[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  2LL,  "warning: location filter requires a non-empty elevationArray",  v65,  2);
      v47 = (uint8_t *)v46;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationLocationFilter fetchFilteredLocations:withElevationArray:]",  "%s\n",  v46);
      if (v47 != buf) {
        free(v47);
      }
    }
  }

- (void)aggregateFilteredLocations:(id)a3 andAddTo:(id)a4
{
  if ([a3 count])
  {
    double v6 = objc_alloc_init(&OBJC_CLASS___CLLocationDBEntry);
    -[CLLocationDBEntry setTimestamp:](v6, "setTimestamp:", 0.0);
    -[CLLocationDBEntry setElevation:](v6, "setElevation:", 0.0);
    -[CLLocationDBEntry setVerticalAccuracy:](v6, "setVerticalAccuracy:", 0.0);
    -[CLLocationDBEntry setInterpPressure:](v6, "setInterpPressure:", 0.0);
    -[CLLocationDBEntry setLatitude:](v6, "setLatitude:", 0.0);
    -[CLLocationDBEntry setLongitude:](v6, "setLongitude:", 0.0);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(a3);
          }
          double v11 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
          [v11 timestamp];
          double v13 = v12;
          -[CLLocationDBEntry timestamp](v6, "timestamp");
          -[CLLocationDBEntry setTimestamp:](v6, "setTimestamp:", v13 + v14);
          [v11 elevation];
          double v16 = v15;
          -[CLLocationDBEntry elevation](v6, "elevation");
          -[CLLocationDBEntry setElevation:](v6, "setElevation:", v16 + v17);
          [v11 verticalAccuracy];
          double v19 = v18;
          -[CLLocationDBEntry verticalAccuracy](v6, "verticalAccuracy");
          -[CLLocationDBEntry setVerticalAccuracy:](v6, "setVerticalAccuracy:", v19 + v20);
          [v11 interpPressure];
          double v22 = v21;
          -[CLLocationDBEntry interpPressure](v6, "interpPressure");
          -[CLLocationDBEntry setInterpPressure:](v6, "setInterpPressure:", v22 + v23);
          [v11 latitude];
          double v25 = v24;
          -[CLLocationDBEntry latitude](v6, "latitude");
          -[CLLocationDBEntry setLatitude:](v6, "setLatitude:", v25 + v26);
          [v11 longitude];
          double v28 = v27;
          -[CLLocationDBEntry longitude](v6, "longitude");
          -[CLLocationDBEntry setLongitude:](v6, "setLongitude:", v28 + v29);
        }

        id v8 = [a3 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }

      while (v8);
    }

    id v30 = [a3 count];
    -[CLLocationDBEntry timestamp](v6, "timestamp");
    -[CLLocationDBEntry setTimestamp:](v6, "setTimestamp:", v31 / (double)(unint64_t)v30);
    id v32 = [a3 count];
    -[CLLocationDBEntry elevation](v6, "elevation");
    -[CLLocationDBEntry setElevation:](v6, "setElevation:", v33 / (double)(unint64_t)v32);
    id v34 = [a3 count];
    -[CLLocationDBEntry verticalAccuracy](v6, "verticalAccuracy");
    -[CLLocationDBEntry setVerticalAccuracy:](v6, "setVerticalAccuracy:", v35 / (double)(unint64_t)v34);
    id v36 = [a3 count];
    -[CLLocationDBEntry interpPressure](v6, "interpPressure");
    -[CLLocationDBEntry setInterpPressure:](v6, "setInterpPressure:", v37 / (double)(unint64_t)v36);
    id v38 = [a3 count];
    -[CLLocationDBEntry latitude](v6, "latitude");
    -[CLLocationDBEntry setLatitude:](v6, "setLatitude:", v39 / (double)(unint64_t)v38);
    id v40 = [a3 count];
    -[CLLocationDBEntry longitude](v6, "longitude");
    -[CLLocationDBEntry setLongitude:](v6, "setLongitude:", v41 / (double)(unint64_t)v40);
    [a4 addObject:v6];
  }

- (void)_interpolatePressureValuesWithElevationArray:(id)a3
{
  double v5 = -[CLElevationLocationFilter _getElevationStartIndex:](self, "_getElevationStartIndex:");
  if (v5 < (char *)[a3 count] - 1)
  {
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5), "pressure");
    *(float *)&double v6 = v6;
    float v7 = sub_100FADFE8(*(float *)&v6, 101320.0);
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5 + 1), "pressure");
    *(float *)&double v8 = v8;
    float v9 = sub_100FADFE8(*(float *)&v8, 101320.0);
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5), "timestamp");
    double v11 = v10;
    objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5 + 1), "timestamp");
    double v13 = v12;
    double v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    begin = self->_verticalAccuraciesInWindow.__begin_;
    p_verticalAccuraciesInWindow = &self->_verticalAccuraciesInWindow;
    p_deltaElevationsInWindow = &self->_deltaElevationsInWindow;
    self->_deltaElevationsInWindow.__end_ = self->_deltaElevationsInWindow.__begin_;
    self->_verticalAccuraciesInWindow.__end_ = begin;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    __int128 v97 = 0u;
    locationBuffer = self->_locationBuffer;
    id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( locationBuffer,  "countByEnumeratingWithState:objects:count:",  &v94,  v99,  16LL);
    if (!v17) {
      goto LABEL_85;
    }
    double v18 = v9;
    double v19 = v7;
    uint64_t v20 = *(void *)v95;
    p_end_cap = &self->_verticalAccuraciesInWindow.__end_cap_;
    v91 = &self->_deltaElevationsInWindow.__end_cap_;
    while (1)
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v95 != v20) {
          objc_enumerationMutation(locationBuffer);
        }
        double v22 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)i);
        [v22 timestamp];
        if (v23 >= self->_firstUnfilteredLocationTime)
        {
          [v22 timestamp];
          if (v13 < v32)
          {
            unint64_t v33 = (unint64_t)(v5 + 2);
            if (v5 + 2 >= [a3 count])
            {
              ++v5;
LABEL_20:
              double v19 = v18;
              double v11 = v13;
            }

            else
            {
              double v19 = v18;
              double v11 = v13;
              while (1)
              {
                objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v33), "timestamp");
                double v13 = v34;
                objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v33), "pressure");
                *(float *)&double v35 = v35;
                float v36 = sub_100FADFE8(*(float *)&v35, 101320.0);
                [v22 timestamp];
                double v18 = v36;
                if (v13 >= v37) {
                  break;
                }
                ++v33;
                double v19 = v18;
                double v11 = v13;
                if (v33 >= (unint64_t)[a3 count])
                {
                  double v5 = (char *)(v33 - 1);
                  goto LABEL_20;
                }
              }

              double v5 = (char *)(v33 - 1);
            }
          }

          objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5), "pressure");
          double v39 = v38;
          objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v5 + 1), "pressure");
          double v41 = v40;
          [v22 timestamp];
          -[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:]( self,  "interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:",  v11,  v39,  v13,  v41,  v42);
          objc_msgSend(v22, "setInterpPressure:");
          [v22 timestamp];
          -[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:]( self,  "interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:",  v11,  v19,  v13,  v18,  v43);
          double v45 = v44;
          [v22 elevation];
          [v22 setDeltaElevation:v46 - v45];
          -[NSMutableArray addObject:](v14, "addObject:", v22);
          [v22 deltaElevation];
          uint64_t v48 = v47;
          end = self->_deltaElevationsInWindow.__end_;
          value = self->_deltaElevationsInWindow.__end_cap_.__value_;
          if (end >= value)
          {
            v52 = p_deltaElevationsInWindow->__begin_;
            uint64_t v53 = end - p_deltaElevationsInWindow->__begin_;
            unint64_t v54 = v53 + 1;
            uint64_t v55 = (char *)value - (char *)v52;
            if (v55 >> 2 > v54) {
              unint64_t v54 = v55 >> 2;
            }
            else {
              unint64_t v56 = v54;
            }
            if (v56)
            {
              __int128 v57 = (char *)sub_1000071BC((uint64_t)v91, v56);
              v52 = self->_deltaElevationsInWindow.__begin_;
              end = self->_deltaElevationsInWindow.__end_;
            }

            else
            {
              __int128 v57 = 0LL;
            }

            __int128 v58 = (double *)&v57[8 * v53];
            *(void *)__int128 v58 = v48;
            uint64_t v51 = v58 + 1;
            while (end != v52)
            {
              uint64_t v59 = *((void *)end-- - 1);
              *((void *)v58-- - 1) = v59;
            }

            self->_deltaElevationsInWindow.__begin_ = v58;
            self->_deltaElevationsInWindow.__end_ = v51;
            self->_deltaElevationsInWindow.__end_cap_.__value_ = (double *)&v57[8 * v56];
            if (v52) {
              operator delete(v52);
            }
          }

          else
          {
            *(void *)end = v47;
            uint64_t v51 = end + 1;
          }

          self->_deltaElevationsInWindow.__end_ = v51;
          [v22 verticalAccuracy];
          uint64_t v61 = v60;
          __int128 v63 = self->_verticalAccuraciesInWindow.__end_;
          __int128 v62 = self->_verticalAccuraciesInWindow.__end_cap_.__value_;
          if (v63 < v62) {
            goto LABEL_40;
          }
          v65 = p_verticalAccuraciesInWindow->__begin_;
          uint64_t v66 = v63 - p_verticalAccuraciesInWindow->__begin_;
          unint64_t v67 = v66 + 1;
          uint64_t v68 = (char *)v62 - (char *)v65;
          if (v68 >> 2 > v67) {
            unint64_t v67 = v68 >> 2;
          }
          else {
            unint64_t v69 = v67;
          }
          if (v69)
          {
            v70 = (char *)sub_1000071BC((uint64_t)p_end_cap, v69);
            v65 = self->_verticalAccuraciesInWindow.__begin_;
            __int128 v63 = self->_verticalAccuraciesInWindow.__end_;
          }

          else
          {
            v70 = 0LL;
          }

          v71 = (double *)&v70[8 * v66];
          *(void *)v71 = v61;
          __int128 v64 = v71 + 1;
          while (v63 != v65)
          {
            uint64_t v72 = *((void *)v63-- - 1);
            *((void *)v71-- - 1) = v72;
          }

- (double)interpolateWithStartTime:(double)a3 andStartValue:(double)a4 andEndTime:(double)a5 andEndValue:(double)a6 atTargetTime:(double)a7
{
  if (a3 <= a7 && a7 <= a5)
  {
    double v9 = a7 - a3;
    if (v9 != 0.0)
    {
      double v10 = a5 - a7;
      if (v10 == 0.0) {
        return a6;
      }
      else {
        return (v10 * a4 + v9 * a6) / (v9 + v10);
      }
    }
  }

  else
  {
    if (qword_1019345B0 != -1) {
      dispatch_once(&qword_1019345B0, &stru_101872C80);
    }
    double v8 = (os_log_s *)qword_1019345B8;
    if (os_log_type_enabled((os_log_t)qword_1019345B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "warning: startTime, targetTime & endTime should be ascending",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019345B0 != -1) {
        dispatch_once(&qword_1019345B0, &stru_101872C80);
      }
      v14[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345B8,  0LL,  "warning: startTime, targetTime & endTime should be ascending",  v14,  2);
      double v13 = (uint8_t *)v12;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLElevationLocationFilter interpolateWithStartTime:andStartValue:andEndTime:andEndValue:atTargetTime:]",  "%s\n",  v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    return 1.79769313e308;
  }

  return a4;
}

- (unint64_t)_getElevationStartIndex:(id)a3
{
  unint64_t v5 = (unint64_t)[a3 count];
  unint64_t v6 = v5 >> 1;
  if (v5 >= 2)
  {
    unint64_t v7 = v5;
    unint64_t v8 = 0LL;
    do
    {
      objc_msgSend(objc_msgSend(a3, "objectAtIndex:", v6), "timestamp");
      if (v9 > self->_firstUnfilteredLocationTime) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v8 = v6;
      }
      unint64_t v6 = (v8 + v7) >> 1;
    }

    while (v8 < v6);
  }

  return v6;
}

- (BOOL)readyToFilter
{
  return self->_readyToFilter;
}

- (void)setReadyToFilter:(BOOL)a3
{
  self->_readyToFilter = a3;
}

- (void).cxx_destruct
{
  begin = self->_verticalAccuraciesInWindow.__begin_;
  if (begin)
  {
    self->_verticalAccuraciesInWindow.__end_ = begin;
    operator delete(begin);
  }

  v4 = self->_deltaElevationsInWindow.__begin_;
  if (v4)
  {
    self->_deltaElevationsInWindow.__end_ = v4;
    operator delete(v4);
  }

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end