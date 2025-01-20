@interface iAP2KalmanFilter
- (BOOL)updateMeasurementNoiseEstimate:(double)a3;
- (iAP2KalmanFilter)initWithReseedTimeout:(double)a3 AndCountForNoiseTraining:(unint64_t)a4;
- (int)iAP2KalmanFilterUpdateDeviceTime:(double)a3 Offset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
- (void)dealloc;
- (void)reseedWithInternalTime:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
- (void)reset;
- (void)resetWithInternalTimeSecs:(double)a3 RawOffset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6;
@end

@implementation iAP2KalmanFilter

- (iAP2KalmanFilter)initWithReseedTimeout:(double)a3 AndCountForNoiseTraining:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___iAP2KalmanFilter;
  v6 = -[iAP2KalmanFilter init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->fIsMeasurementNoiseTrained = 0;
    *(_OWORD *)&v6->f_P = xmmword_100016360;
    v6->fLastInternalTime = -1.0;
    v6->fTimeout = a3;
    v6->fMeasurementVar = 0.0;
    v6->fMinCountForMeasNoiseTraining = a4;
    v6->fOffsetHistory = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  return v7;
}

- (void)reset
{
  self->fMeasurementVar = 0.0;
  *(_WORD *)&self->fIsMeasurementNoiseTrained = 0;
  *(_OWORD *)&self->f_P = xmmword_100016360;
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
  uint64_t v5 = (char *)-[NSMutableArray count](self->fOffsetHistory, "count");
  sub_10000D5FC("HistorySize = %d", v6, v7, v8, v9, v10, v11, v12, (char)v5);
  -[NSMutableArray addObject:]( self->fOffsetHistory,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  BOOL v14 = (unint64_t)v5 > 1 && (unint64_t)v5 >= self->fMinCountForMeasNoiseTraining;
  if (v14)
  {
    v15 = 0LL;
    double v16 = 0.0;
    do
    {
      objc_msgSend(-[NSMutableArray objectAtIndex:](self->fOffsetHistory, "objectAtIndex:", v15), "doubleValue");
      double v16 = v16 + v24;
      ++v15;
    }

    while (v5 != v15);
    sub_10000D5FC("sumx = %.3lf\n", v17, v18, v19, v20, v21, v22, v23, SLOBYTE(v16));
    v25 = 0LL;
    double v26 = v16 / (double)(unint64_t)v5;
    double v27 = 0.0;
    do
    {
      objc_msgSend(-[NSMutableArray objectAtIndex:](self->fOffsetHistory, "objectAtIndex:", v25), "doubleValue");
      double v27 = v27 + (v35 - v26) * (v35 - v26);
      ++v25;
    }

    while (v5 != v25);
    sub_10000D5FC("sumx2 = %.3lf\n", v28, v29, v30, v31, v32, v33, v34, SLOBYTE(v27));
    self->fMeasurementVar = v27 / ((double)(unint64_t)v5 + -1.0);
    self->fIsMeasurementNoiseTrained = 1;
    -[NSMutableArray removeAllObjects](self->fOffsetHistory, "removeAllObjects");
  }

  return v14;
}

- (int)iAP2KalmanFilterUpdateDeviceTime:(double)a3 Offset:(double)a4 FilteredOffset:(double *)a5 OffsetUncertainty:(double *)a6
{
  if (self->fIsMeasurementNoiseTrained) {
    goto LABEL_2;
  }
  if (!-[iAP2KalmanFilter updateMeasurementNoiseEstimate:](self, "updateMeasurementNoiseEstimate:", a4))
  {
LABEL_12:
    int result = 0;
    *a5 = a4;
    *a6 = 7200.0;
    self->fLastInternalTime = a3;
    return result;
  }

  sub_10000D5FC("Measurement Variance %.3lf\n", v17, v18, v19, v20, v21, v22, v23, *(void *)&self->fMeasurementVar);
  double fMeasurementVar = self->fMeasurementVar;
  if (fMeasurementVar <= 0.0 || fMeasurementVar >= 0.25)
  {
    sub_10000D5FC( "Unacceptable,time offset measurement variance(s^2),%.3lf\n",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  *(void *)&self->fMeasurementVar);
    self->fIsMeasurementNoiseTrained = 0;
    goto LABEL_12;
  }

  sub_10000D5FC( "Estimated,time offset measurement variance(s^2),%.3lf\n",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  *(void *)&self->fMeasurementVar);
LABEL_2:
  if (!self->fIsSeeded || (double v15 = a3 - self->fLastInternalTime, v15 > self->fTimeout))
  {
    -[iAP2KalmanFilter reseedWithInternalTime:RawOffset:FilteredOffset:OffsetUncertainty:]( self,  "reseedWithInternalTime:RawOffset:FilteredOffset:OffsetUncertainty:",  a5,  a6,  a3,  a4);
    return 0;
  }

  self->fLastInternalTime = a3;
  double v33 = self->fMeasurementVar;
  double f_P = self->f_P;
  if (v33 + f_P <= 0.0)
  {
    -[iAP2KalmanFilter resetWithInternalTimeSecs:RawOffset:FilteredOffset:OffsetUncertainty:]( self,  "resetWithInternalTimeSecs:RawOffset:FilteredOffset:OffsetUncertainty:",  a5,  a6,  a3,  a4);
    sub_10000D5FC("Unexpected,state plus measurement covariance < 0.\n", v39, v40, v41, v42, v43, v44, v45, v73);
    return 0;
  }

  double fFilterOffsetEstimate = self->fFilterOffsetEstimate;
  double v36 = a4 - fFilterOffsetEstimate;
  double v37 = v36 * v36 / (v33 + f_P);
  if (v37 <= 20.25)
  {
    double v38 = v15 * 0.00005625;
    if (v37 > 9.0) {
      double v33 = v33 + v33;
    }
  }

  else if (v36 <= 7200.0)
  {
    double v38 = v36 * v36;
  }

  else
  {
    double v38 = 51840000.0;
  }

  double v46 = f_P + v38;
  self->double f_P = v46;
  double v47 = v46 / (v33 + v46);
  sub_10000D5FC( "fFilterOffsetPrior = %.3lf K = %.3lf v = %.3lf",  (uint64_t)a2,  (uint64_t)a5,  (uint64_t)a6,  v6,  v7,  v8,  v9,  SLOBYTE(fFilterOffsetEstimate));
  self->double fFilterOffsetEstimate = fFilterOffsetEstimate + v47 * v36;
  double v74 = fFilterOffsetEstimate + v47 * v36;
  sub_10000D5FC("double fFilterOffsetEstimate = %.3lf", v48, v49, v50, v51, v52, v53, v54, SLOBYTE(v74));
  double v62 = (1.0 - v47) * self->f_P;
  self->double f_P = v62;
  double v63 = sqrt(v62);
  if (v62 >= 0.00000225) {
    double v64 = v63;
  }
  else {
    double v64 = 0.00000225;
  }
  *a6 = v64;
  double v65 = self->fFilterOffsetEstimate;
  *a5 = v65;
  sub_10000D5FC("filteredOffsetSecs = %.3lf", v55, v56, v57, v58, v59, v60, v61, SLOBYTE(v65));
  sub_10000D5FC( "internalTimeSecs,%.6lf,rawOffset,%.6lf,filteredOffsetSecs,%.6lf,offsetUncertaintySecs,%.6lf,R,%.6lf,Q,%.6lf,v,%.6lf,vtest2,%.6lf\n",  v66,  v67,  v68,  v69,  v70,  v71,  v72,  SLOBYTE(a3));
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___iAP2KalmanFilter;
  -[iAP2KalmanFilter dealloc](&v3, "dealloc");
}

@end