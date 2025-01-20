@interface CLWaterTemperatureEstimator
- (BOOL)coefficientsUpdated;
- (CLWaterTemperatureEstimator)init;
- (float)waterTempEst;
- (float)waterTempUncertainty;
- (id).cxx_construct;
- (void)getEnclosureMaterial;
- (void)setWaterTempCoefficients;
- (void)setWaterTempEst:(float)a3;
- (void)setWaterTempUncertainty:(float)a3;
- (void)updateWithTDot:(const float *)a3 andTempMeasurement:(const float *)a4;
@end

@implementation CLWaterTemperatureEstimator

- (CLWaterTemperatureEstimator)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLWaterTemperatureEstimator;
  v2 = -[CLWaterTemperatureEstimator init](&v8, "init");
  if (v2)
  {
    unsigned __int8 v6 = 0;
    sub_1012049AC(v7, "LogWatchEnclosureMaterial", &v6, 0);
    v2->_logEnclosureMaterial = v7[1];
    v3 = (float *)qword_10199DBD8;
    unint64_t v4 = (unint64_t)(qword_10199DBE0 - qword_10199DBD8) >> 2;
    v2->_enclosureMaterial = 0;
    v2->_numTDotBins = v4;
    v2->_binWidth = v3[1] - *v3;
    v2->_numTErrorBins = -1;
    -[CLWaterTemperatureEstimator getEnclosureMaterial](v2, "getEnclosureMaterial");
    -[CLWaterTemperatureEstimator setWaterTempCoefficients](v2, "setWaterTempCoefficients");
  }

  return v2;
}

- (void)updateWithTDot:(const float *)a3 andTempMeasurement:(const float *)a4
{
  *(float *)&double v4 = *a4;
  -[CLWaterTemperatureEstimator setWaterTempEst:](self, "setWaterTempEst:", v4);
  LODWORD(v8) = 5.0;
  -[CLWaterTemperatureEstimator setWaterTempUncertainty:](self, "setWaterTempUncertainty:", v8);
  if (-[CLWaterTemperatureEstimator coefficientsUpdated](self, "coefficientsUpdated"))
  {
    *(float *)&double v9 = *a3;
    if (*a3 >= *(float *)qword_10199DBD8 && *(float *)&v9 <= *(float *)(qword_10199DBD8 + 4LL * self->_numTDotBins - 4))
    {
      unsigned int v10 = llroundf((float)(*(float *)&v9 - *(float *)qword_10199DBD8) / self->_binWidth);
      *(float *)&double v9 = *a4 - self->_tempCoefficients.deltaTemp.__begin_[v10];
      -[CLWaterTemperatureEstimator setWaterTempEst:](self, "setWaterTempEst:", v9);
      *(float *)&double v11 = self->_tempCoefficients.tempUncertainty.__begin_[v10];
      -[CLWaterTemperatureEstimator setWaterTempUncertainty:](self, "setWaterTempUncertainty:", v11);
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10187DA58);
  }
  v12 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    double v13 = *a4;
    double v14 = *a3;
    -[CLWaterTemperatureEstimator waterTempEst](self, "waterTempEst");
    double v16 = v15;
    -[CLWaterTemperatureEstimator waterTempUncertainty](self, "waterTempUncertainty");
    *(_DWORD *)buf = 134218752;
    double v36 = v13;
    __int16 v37 = 2048;
    double v38 = v14;
    __int16 v39 = 2048;
    double v40 = v16;
    __int16 v41 = 2048;
    double v42 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "tdot estimator, temp, %f, tdot, %f, est temp, %f, est uncertainty, %f",  buf,  0x2Au);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187DA58);
    }
    uint64_t v18 = qword_1019346A8;
    double v19 = *a4;
    double v20 = *a3;
    -[CLWaterTemperatureEstimator waterTempEst](self, "waterTempEst");
    double v22 = v21;
    -[CLWaterTemperatureEstimator waterTempUncertainty](self, "waterTempUncertainty");
    int v27 = 134218752;
    double v28 = v19;
    __int16 v29 = 2048;
    double v30 = v20;
    __int16 v31 = 2048;
    double v32 = v22;
    __int16 v33 = 2048;
    double v34 = v23;
    LODWORD(v26) = 42;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v18,  2LL,  "tdot estimator, temp, %f, tdot, %f, est temp, %f, est uncertainty, %f",  COERCE_DOUBLE(&v27),  v26);
    v25 = (uint8_t *)v24;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWaterTemperatureEstimator updateWithTDot:andTempMeasurement:]",  "%s\n",  v24);
    if (v25 != buf) {
      free(v25);
    }
  }

- (void)getEnclosureMaterial
{
  int v3 = MGGetSInt32Answer(@"AtmPEO/j+Pdr8+WKxv4Aaw", 0LL);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_10187DA58);
  }
  double v4 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device enclosure material is %u", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187DA58);
    }
    v14[0] = 67109120;
    v14[1] = v3;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "device enclosure material is %u",  v14);
    double v9 = (uint8_t *)v8;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWaterTemperatureEstimator getEnclosureMaterial]", "%s\n", v8);
    if (v9 != buf) {
      free(v9);
    }
  }

  if (v3) {
    self->_uint64_t enclosureMaterial = v3;
  }
  if (self->_logEnclosureMaterial)
  {
    sub_101125260(buf);
    sub_10113A248(buf);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v13 |= 1u;
    CFAbsoluteTime v11 = Current;
    uint64_t v6 = v12;
    uint64_t enclosureMaterial = self->_enclosureMaterial;
    *(_BYTE *)(v12 + 24) |= 1u;
    *(void *)(v6 + 8) = enclosureMaterial;
    if (qword_1019A1D00 != -1) {
      dispatch_once(&qword_1019A1D00, &stru_10187DA78);
    }
    if (qword_1019A1D08) {
      sub_1011CF3D0(qword_1019A1D08, (uint64_t)buf);
    }
    sub_101127D00((PB::Base *)buf);
  }

- (void)setWaterTempCoefficients
{
  int v3 = sub_1004F2690();
  *(_DWORD *)buf = self->_enclosureMaterial;
  *(_DWORD *)v45 = v3;
  double v4 = sub_100CDA75C(qword_10199DC50, (int *)buf);
  if (v4)
  {
    uint64_t v5 = v4[3];
    if (&self->_tempCoefficients != (CLWaterTemperatureCoefficients *)v5)
    {
      sub_10004C5F8( (char *)&self->_tempCoefficients,  *(char **)v5,  *(void *)(v5 + 8),  (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
      sub_10004C5F8( (char *)&self->_tempCoefficients.tempUncertainty,  *(char **)(v5 + 24),  *(void *)(v5 + 32),  (uint64_t)(*(void *)(v5 + 32) - *(void *)(v5 + 24)) >> 2);
    }

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187DA58);
    }
    uint64_t v6 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      *(CFAbsoluteTime *)v45 = Current;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "temperature coefficients updated,timestamp,%f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187DA58);
      }
      uint64_t v8 = qword_1019346A8;
      *(_DWORD *)__int16 v37 = 134217984;
      *(void *)&v37[4] = CFAbsoluteTimeGetCurrent();
      double v9 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "temperature coefficients updated,timestamp,%f",  COERCE_DOUBLE(v37));
      CFAbsoluteTime v11 = v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v9);
LABEL_31:
      if (v11 != buf) {
        free(v11);
      }
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187DA58);
    }
    uint64_t v12 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_FAULT))
    {
      CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134217984;
      *(CFAbsoluteTime *)v45 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "temperature coefficients not found,using defaults for replay,timestamp,%f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187DA58);
      }
      uint64_t v33 = qword_1019346A8;
      *(_DWORD *)__int16 v37 = 134217984;
      *(void *)&v37[4] = CFAbsoluteTimeGetCurrent();
      double v34 = _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v33,  17LL,  "temperature coefficients not found,using defaults for replay,timestamp,%f",  COERCE_DOUBLE(v37));
      CFAbsoluteTime v11 = v35;
      sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v34);
      goto LABEL_31;
    }
  }

  self->_numTErrorBins = (unint64_t)((char *)self->_tempCoefficients.deltaTemp.__end_
                                          - (char *)self->_tempCoefficients.deltaTemp.__begin_) >> 2;
  if (-[CLWaterTemperatureEstimator coefficientsUpdated](self, "coefficientsUpdated"))
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_10187DA58);
    }
    double v14 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      begin = self->_tempCoefficients.deltaTemp.__begin_;
      end = self->_tempCoefficients.deltaTemp.__end_;
      uint64_t v17 = end - begin;
      double v18 = *begin;
      double v19 = *(end - 1);
      double v20 = *(float *)qword_10199DBD8;
      double v21 = *(float *)(qword_10199DBE0 - 4);
      LODWORD(end) = self->_enclosureMaterial;
      LODWORD(begin) = self->_numTDotBins;
      double binWidth = self->_binWidth;
      *(_DWORD *)buf = 67110912;
      *(_DWORD *)v45 = (_DWORD)end;
      *(_WORD *)&v45[4] = 2048;
      *(void *)&v45[6] = v17;
      __int16 v46 = 2048;
      double v47 = v18;
      __int16 v48 = 2048;
      double v49 = v19;
      __int16 v50 = 2048;
      double v51 = v20;
      __int16 v52 = 2048;
      double v53 = v21;
      __int16 v54 = 1024;
      int v55 = (int)begin;
      __int16 v56 = 2048;
      double v57 = binWidth;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "enclosure details,material,%u,deltaTempCount,%zu,firstDeltaTemp,%f,lastDeltaTemp,%f,firstTDot,%f,lastTDot,%f,num Bins,%d,binWidth,%f",  buf,  0x4Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_10187DA58);
      }
      v24 = self->_tempCoefficients.deltaTemp.__begin_;
      float v23 = self->_tempCoefficients.deltaTemp.__end_;
      uint64_t v25 = v23 - v24;
      double v26 = *v24;
      double v27 = *(v23 - 1);
      double v28 = *(float *)qword_10199DBD8;
      double v29 = *(float *)(qword_10199DBE0 - 4);
      LODWORD(v23) = self->_enclosureMaterial;
      LODWORD(v24) = self->_numTDotBins;
      double v30 = self->_binWidth;
      *(_DWORD *)__int16 v37 = 67110912;
      *(_DWORD *)&v37[4] = (_DWORD)v23;
      *(_WORD *)&v37[8] = 2048;
      *(void *)&v37[10] = v25;
      *(_WORD *)&v37[18] = 2048;
      *(double *)&v37[20] = v26;
      *(_WORD *)&v37[28] = 2048;
      *(_WORD *)&v37[30] = LOWORD(v27);
      __int16 v38 = 2048;
      double v39 = v29;
      __int16 v40 = 1024;
      int v41 = (int)v24;
      __int16 v42 = 2048;
      double v43 = v30;
      LODWORD(v36) = 74;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "enclosure details,material,%u,deltaTempCount,%zu,firstDeltaTemp,%f,lastDeltaTemp,%f,firstTDot,%f,lastTDot,%f,num Bins,%d,binWidth,%f",  v37,  v36,  *(double *)v37,  *(double *)&v37[8],  *(double *)&v37[16],  *(double *)&v37[24],  *(void *)&v27 >> 16,  v28);
      double v32 = (uint8_t *)v31;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLWaterTemperatureEstimator setWaterTempCoefficients]", "%s\n", v31);
      if (v32 != buf) {
        free(v32);
      }
    }
  }

- (BOOL)coefficientsUpdated
{
  return self->_numTErrorBins == self->_numTDotBins;
}

- (float)waterTempEst
{
  return self->_waterTempEst;
}

- (void)setWaterTempEst:(float)a3
{
  self->_waterTempEst = a3;
}

- (float)waterTempUncertainty
{
  return self->_waterTempUncertainty;
}

- (void)setWaterTempUncertainty:(float)a3
{
  self->_waterTempUncertainty = a3;
}

- (void).cxx_destruct
{
  begin = self->_tempCoefficients.tempUncertainty.__begin_;
  if (begin)
  {
    self->_tempCoefficients.tempUncertainty.__end_ = begin;
    operator delete(begin);
  }

  double v4 = self->_tempCoefficients.deltaTemp.__begin_;
  if (v4)
  {
    self->_tempCoefficients.deltaTemp.__end_ = v4;
    operator delete(v4);
  }

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end