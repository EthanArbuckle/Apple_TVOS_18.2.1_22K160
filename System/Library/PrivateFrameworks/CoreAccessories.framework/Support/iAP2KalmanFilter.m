@interface iAP2KalmanFilter
- (BOOL)updateMeasurementNoiseEstimate:(double)a3;
- (iAP2KalmanFilter)initWithReseedTimeout:(double)a3 AndCountForNoiseTraining:(unint64_t)a4;
- (int)iAP2KalmanFilterUpdateDeviceTime:(double)a3 Offset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
- (void)reseedWithInternalTime:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
- (void)reset;
- (void)resetWithInternalTimeSecs:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
@end

@implementation iAP2KalmanFilter

- (iAP2KalmanFilter)initWithReseedTimeout:(double)a3 AndCountForNoiseTraining:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___iAP2KalmanFilter;
  v6 = -[iAP2KalmanFilter init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->fIsMeasurementNoiseTrained = 0;
    *(_OWORD *)&v6->f_P = xmmword_10019E0B0;
    v6->fLastInternalTime = -1.0;
    v6->fTimeout = a3;
    v6->fMeasurementVar = 0.0;
    v6->fMinCountForMeasNoiseTraining = a4;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    fOffsetHistory = v7->fOffsetHistory;
    v7->fOffsetHistory = v8;
  }

  return v7;
}

- (void)reset
{
  if ((_iAP2LogEnableMask & 1) != 0)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 20;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v5 = (os_log_s *)&_os_log_default;
      id v4 = &_os_log_default;
    }

    else
    {
      v5 = (os_log_s *)*(id *)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ERROR: Resetting Kalman Filter", v6, 2u);
    }
  }

  self->fMeasurementVar = 0.0;
  *(_WORD *)&self->fIsMeasurementNoiseTrained = 0;
  *(_OWORD *)&self->f_P = xmmword_10019E0B0;
  self->fLastInternalTime = -1.0;
}

- (void)resetWithInternalTimeSecs:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  self->fIsMeasurementNoiseTrained = 0;
  -[iAP2KalmanFilter reseedWithInternalTime:RawOffset:FilteredOffset:OffsetUncertainty:]( self,  "reseedWithInternalTime:RawOffset:FilteredOffset:OffsetUncertainty:",  a5,  a6,  a3,  a4);
}

- (void)reseedWithInternalTime:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  self->fFilterOffsetEstimate = a4;
  self->f_P = 51840000.0;
  *a6 = 7200.0;
  *a5 = self->fFilterOffsetEstimate;
  self->fIsSeeded = 1;
  self->fLastInternalTime = a3;
}

- (BOOL)updateMeasurementNoiseEstimate:(double)a3
{
  v5 = (char *)-[NSMutableArray count](self->fOffsetHistory, "count");
  if ((_iAP2LogEnableMask & 4) != 0)
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 20;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v8 = (os_log_s *)&_os_log_default;
      id v7 = &_os_log_default;
    }

    else
    {
      v8 = (os_log_s *)*(id *)(gLogObjects + 152);
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[iAP2KalmanFilter updateMeasurementNoiseEstimate:].cold.5((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  fOffsetHistory = self->fOffsetHistory;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  -[NSMutableArray addObject:](fOffsetHistory, "addObject:", v16);

  BOOL v18 = (unint64_t)v5 > 1 && (unint64_t)v5 >= self->fMinCountForMeasNoiseTraining;
  if (v18)
  {
    v19 = 0LL;
    double v20 = 0.0;
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->fOffsetHistory, "objectAtIndex:", v19));
      [v21 doubleValue];
      double v23 = v22;

      double v20 = v20 + v23;
      ++v19;
    }

    while (v5 != v19);
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        v24 = (os_log_s *)*(id *)(gLogObjects + 152);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v24 = (os_log_s *)&_os_log_default;
        id v25 = &_os_log_default;
      }

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter updateMeasurementNoiseEstimate:].cold.3(v24, v26, v27, v28, v29, v30, v31, v32);
      }
    }

    uint64_t v33 = 0LL;
    double v34 = (double)(unint64_t)v5;
    double v35 = v20 / (double)(unint64_t)v5;
    else {
      uint64_t v36 = (uint64_t)v5;
    }
    double v37 = 0.0;
    do
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->fOffsetHistory, "objectAtIndex:", v33));
      [v38 doubleValue];
      double v40 = v39 - v35;

      double v37 = v37 + v40 * v40;
      ++v33;
    }

    while (v36 != v33);
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        v41 = (os_log_s *)*(id *)(gLogObjects + 152);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v41 = (os_log_s *)&_os_log_default;
        id v42 = &_os_log_default;
      }

      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter updateMeasurementNoiseEstimate:].cold.1(v41, v43, v44, v45, v46, v47, v48, v49);
      }
    }

    self->fMeasurementVar = v37 / (v34 + -1.0);
    self->fIsMeasurementNoiseTrained = 1;
    -[NSMutableArray removeAllObjects](self->fOffsetHistory, "removeAllObjects");
  }

  return v18;
}

- (int)iAP2KalmanFilterUpdateDeviceTime:(double)a3 Offset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  if (self->fIsMeasurementNoiseTrained) {
    goto LABEL_2;
  }
  if (-[iAP2KalmanFilter updateMeasurementNoiseEstimate:](self, "updateMeasurementNoiseEstimate:", a4))
  {
    if ((_iAP2LogEnableMask & 4) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 20)
      {
        uint64_t v13 = (os_log_s *)*(id *)(gLogObjects + 152);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v13 = (os_log_s *)&_os_log_default;
        id v25 = &_os_log_default;
      }

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:].cold.13();
      }
    }

    double fMeasurementVar = self->fMeasurementVar;
    if (fMeasurementVar > 0.0 && fMeasurementVar < 0.25)
    {
      if ((_iAP2LogEnableMask & 4) != 0)
      {
        if (gLogObjects && gNumLogObjects >= 20)
        {
          uint64_t v29 = (os_log_s *)*(id *)(gLogObjects + 152);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          uint64_t v29 = (os_log_s *)&_os_log_default;
          id v38 = &_os_log_default;
        }

        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[iAP2KalmanFilter iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:].cold.9();
        }
      }

- (void).cxx_destruct
{
}

  ;
}

- (void)updateMeasurementNoiseEstimate:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a1, a3, "sumx2 = %.3lf\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)updateMeasurementNoiseEstimate:(uint64_t)a3 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a1, a3, "sumx = %.3lf\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)updateMeasurementNoiseEstimate:(uint64_t)a3 .cold.5( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, a2, a3, "HistorySize = %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.2()
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v0, v1, "filteredOffsetSecs = %.3lf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.4()
{
  OUTLINED_FUNCTION_3_2((void *)&_mh_execute_header, v0, v1, "double fFilterOffsetEstimate = %.3lf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iAP2KalmanFilterUpdateDeviceTime:(os_log_t)log Offset:FilteredOffset:OffsetUncertainty:.cold.7( os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Unexpected,state plus measurement covariance < 0.\n",  v1,  2u);
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.9()
{
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.11()
{
}

- (void)iAP2KalmanFilterUpdateDeviceTime:Offset:FilteredOffset:OffsetUncertainty:.cold.13()
{
}

@end