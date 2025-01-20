@interface TMTimeSynthesizer
+ (BOOL)supportsSecureCoding;
+ (id)newSynthesizerFromDataRepresentation:(id)a3;
- (BOOL)intersects:(id)a3;
- (BOOL)isRunning;
- (NSString)lastInputSource;
- (NSString)name;
- (TMTime)lastQualityTime;
- (TMTimeSynthesizer)initWithClockAccuracy:(double)a3 noiseDensity:(double)a4 name:(id)a5;
- (TMTimeSynthesizer)initWithCoder:(id)a3;
- (double)rtcWhenBeyondUncertainty:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)synthesizedTimeAtLastRTC;
- (id)timeAtRtc:(double)a3;
- (void)dealloc;
- (void)displayLastQualityTime;
- (void)encodeWithCoder:(id)a3;
- (void)inflateHistoricalDataBy:(double)a3;
- (void)reset;
- (void)setLastInputSource:(id)a3;
- (void)setLastQualityTime:(id)a3;
- (void)setName:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)update:(id)a3 withError:(id *)a4;
@end

@implementation TMTimeSynthesizer

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend( objc_alloc((Class)objc_opt_class(self)),  "initWithClockAccuracy:noiseDensity:name:",  -[TMTimeSynthesizer name](self, "name"),  self->_xoAccuracy,  self->_clkSg);
  objc_msgSend(v4, "setRunning:", -[TMTimeSynthesizer isRunning](self, "isRunning"));
  *((void *)v4 + 1) = *(void *)&self->_rtc;
  *((void *)v4 + 2) = *(void *)&self->_utc;
  *((void *)v4 + 3) = *(void *)&self->_rateSf;
  *((void *)v4 + 6) = *(void *)&self->_utc_var;
  *((void *)v4 + 7) = *(void *)&self->_sf_var;
  *((void *)v4 + 8) = *(void *)&self->_utc_sf_cov;
  *((void *)v4 + 4) = *(void *)&self->_smoothedSf;
  *((_DWORD *)v4 + 26) = self->_measNumber;
  objc_msgSend(v4, "setLastQualityTime:", -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime"));
  objc_msgSend(v4, "setLastInputSource:", -[TMTimeSynthesizer lastInputSource](self, "lastInputSource"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TMTimeSynthesizer)initWithCoder:(id)a3
{
  id v4 = -[TMTimeSynthesizer init](self, "init");
  if (v4)
  {
    -[TMTimeSynthesizer setName:]( v4,  "setName:",  [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"name"]);
    -[TMTimeSynthesizer setRunning:](v4, "setRunning:", [a3 decodeBoolForKey:@"running"]);
    [a3 decodeDoubleForKey:@"rtc"];
    v4->_rtc = v5;
    [a3 decodeDoubleForKey:@"utc"];
    v4->_utc = v6;
    [a3 decodeDoubleForKey:@"rateSf"];
    v4->_rateSf = v7;
    [a3 decodeDoubleForKey:@"utc_var"];
    v4->_utc_var = v8;
    [a3 decodeDoubleForKey:@"sf_var"];
    v4->_sf_var = v9;
    [a3 decodeDoubleForKey:@"utc_sf_cov"];
    v4->_utc_sf_cov = v10;
    [a3 decodeDoubleForKey:@"xoAccuracy"];
    v4->_xoAccuracy = v11;
    [a3 decodeDoubleForKey:@"clkSg"];
    v4->_clkSg = v12;
    [a3 decodeDoubleForKey:@"smoothedSf"];
    v4->_smoothedSf = v13;
    v4->_measNumber = [a3 decodeIntForKey:@"measNumber"];
    -[TMTimeSynthesizer setLastQualityTime:]( v4,  "setLastQualityTime:",  [a3 decodeObjectOfClass:objc_opt_class(TMTime) forKey:@"lastQualityTime"]);
    -[TMTimeSynthesizer setLastInputSource:]( v4,  "setLastInputSource:",  [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"lastInputSource"]);
    -[TMTimeSynthesizer displayLastQualityTime](v4, "displayLastQualityTime");
    v4->_lastRtcForSmoothSf = 0.0;
  }

  return v4;
}

+ (id)newSynthesizerFromDataRepresentation:(id)a3
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"TMTimeSynthesizer+Caching.m",  92LL,  @"Invalid parameter not satisfying: %@",  @"data");
  }
  uint64_t v15 = 0LL;
  id v4 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  a3,  &v15);
  uint64_t v5 = v15;
  if (v15)
  {
    double v6 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B9A4(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  id v13 =  -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___TMTimeSynthesizer),  NSKeyedArchiveRootObjectKey);
  -[NSKeyedUnarchiver finishDecoding](v4, "finishDecoding");

  return v13;
}

- (id)dataRepresentation
{
  uint64_t v12 = 0LL;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v12);
  uint64_t v3 = v12;
  if (v12)
  {
    id v4 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001BA08(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v2;
}

- (BOOL)intersects:(id)a3
{
  id v4 = -[TMTimeSynthesizer synthesizedTimeAtLastRTC](self, "synthesizedTimeAtLastRTC");
  objc_msgSend(a3, "rtc_s");
  objc_msgSend(v4, "propagatedTimeAtRTC:");
  double v6 = v5;
  objc_msgSend(v4, "utcUnc_s");
  double v8 = v7;
  objc_msgSend(a3, "rtc_s");
  double v10 = v9;
  objc_msgSend(v4, "rtc_s");
  double v12 = sub_1000078B4(v8, vabdd_f64(v10, v11));
  objc_msgSend(a3, "utc_s");
  double v14 = v13;
  objc_msgSend(a3, "utcUnc_s");
  double v16 = v15;
  id v17 = [a3 source];
  if (v12 <= 0.0 || v16 <= 0.0) {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "BOOL _timesIntersect(CFAbsoluteTime, CFTimeInterval, NSString *, CFAbsoluteTime, CFTimeInterval)"),  @"TMTimeSynthesizer+Clamping.m",  16LL,  @"Negative uncertainty");
  }
  BOOL v18 = v6 + v12 - (v14 - v16) >= 0.0 && v14 + v16 - (v6 - v12) >= 0.0;
  if (!v18)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100015578;
    v20[3] = &unk_1000293C0;
    *(double *)&v20[5] = v14 + v16 - (v6 - v12);
    *(double *)&v20[6] = v6 + v12 - (v14 - v16);
    v20[4] = v17;
    *(double *)&v20[7] = v16;
    *(double *)&v20[8] = v12;
    AnalyticsSendEventLazy(@"com.apple.timed.STFClampReject", v20);
  }

  return v18;
}

- (void)inflateHistoricalDataBy:(double)a3
{
  double v5 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    double utc_var = self->_utc_var;
    double utc_sf_cov = self->_utc_sf_cov;
    int v12 = 138413058;
    double v13 = name;
    __int16 v14 = 2048;
    double v15 = a3;
    __int16 v16 = 2048;
    double v17 = utc_var;
    __int16 v18 = 2048;
    double v19 = utc_sf_cov;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%@,Inflate,inflation_s,%lf,utcVar,%lf,sfCovar,%lf",  (uint8_t *)&v12,  0x2Au);
  }

  if (a3 != 0.0)
  {
    double v9 = -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime");
    double v10 = v9;
    if (v9)
    {
      -[TMTime utcUnc_s](v9, "utcUnc_s");
      -[TMTime setUtcUnc_s:](v10, "setUtcUnc_s:", v11 + a3);
    }

    self->_double utc_var = self->_utc_var + a3 * (a3 + sqrt(self->_utc_var) * 2.0);
    self->_double utc_sf_cov = 0.0;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMTimeSynthesizer;
  -[TMTimeSynthesizer dealloc](&v3, "dealloc");
}

- (TMTimeSynthesizer)initWithClockAccuracy:(double)a3 noiseDensity:(double)a4 name:(id)a5
{
  double v8 = -[TMTimeSynthesizer init](self, "init");
  double v9 = v8;
  if (v8)
  {
    -[TMTimeSynthesizer reset](v8, "reset");
    v9->_clkSg = a4;
    v9->_xoAccuracy = a3;
    __asm { FMOV            V0.2D, #1.0 }

    *(_OWORD *)&v9->_rateSf = _Q0;
    v9->_lastRtcForSmoothSf = 0.0;
    -[TMTimeSynthesizer setName:](v9, "setName:", a5);
    v9->_lastInputSource = 0LL;
    -[TMTimeSynthesizer displayLastQualityTime](v9, "displayLastQualityTime");
  }

  return v9;
}

- (void)displayLastQualityTime
{
  objc_super v3 = -[TMTimeSynthesizer lastQualityTime](self, "lastQualityTime");
  uint64_t v4 = qword_100033900;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      name = self->_name;
      double v7 = -[TMTime source](v3, "source");
      -[TMTime rtc_s](v3, "rtc_s");
      uint64_t v9 = v8;
      -[TMTime utc_s](v3, "utc_s");
      uint64_t v11 = v10;
      -[TMTime utcUnc_s](v3, "utcUnc_s");
      int v17 = 138413314;
      __int16 v18 = name;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      double v13 = "%@,lastQualityTime,Src,%@,Rtc,%.6lf,Utc,%.6lf,Unc,%.6lf";
      __int16 v14 = (os_log_s *)v4;
      uint32_t v15 = 52;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
    }
  }

  else if (v5)
  {
    __int16 v16 = self->_name;
    int v17 = 138412290;
    __int16 v18 = v16;
    double v13 = "%@,lastQualityTime,Empty";
    __int16 v14 = (os_log_s *)v4;
    uint32_t v15 = 12;
    goto LABEL_6;
  }
}

- (id)timeAtRtc:(double)a3
{
  BOOL v5 = sub_1000170F0((uint64_t)self, a3);
  if (v5)
  {
    double v6 = v5;
    double v7 = a3 - self->_rtc;
    -[TMTimeSynthesizerStates utc](v5, "utc");
    double v9 = v8 - self->_utc;
    if (v7 <= v9) {
      double v10 = v9 - v7;
    }
    else {
      double v10 = v7 - v9;
    }
    uint64_t v11 = sub_1000170F0((uint64_t)self, self->_rtc);
    BOOL v12 = v7 >= 0.0 && v10 <= 1.0;
    if (!v12 || (-[TMTimeSynthesizerStates utc_var](v6, "utc_var"), v10 > sqrt(v13) * 50.0))
    {
      __int16 v14 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        double lastTimeRtc = self->_lastTimeRtc;
        double rtc = self->_rtc;
        int v24 = 138414082;
        __int16 v25 = name;
        __int16 v26 = 2112;
        v27 = v11;
        __int16 v28 = 2112;
        v29 = v6;
        __int16 v30 = 2048;
        double v31 = v7;
        __int16 v32 = 2048;
        double v33 = v9;
        __int16 v34 = 2048;
        double v35 = v10;
        __int16 v36 = 2048;
        double v37 = lastTimeRtc;
        __int16 v38 = 2048;
        double v39 = rtc;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@,WrongPredictState,Current,%@,PredictState,%@,dRtc,%.3lf,dUtc,%.3lf,ddtc,%.3lf,lastRtc,%.3lf,rtc,%.3lf",  (uint8_t *)&v24,  0x52u);
      }
    }

    __int16 v18 = objc_alloc_init(&OBJC_CLASS___TMTime);
    -[TMTimeSynthesizerStates rtc](v6, "rtc");
    -[TMTime setRtc_s:](v18, "setRtc_s:");
    -[TMTimeSynthesizerStates utc](v6, "utc");
    -[TMTime setUtc_s:](v18, "setUtc_s:");
    -[TMTimeSynthesizerStates utc_var](v6, "utc_var");
    -[TMTime setUtcUnc_s:](v18, "setUtcUnc_s:", sqrt(v19));
    -[TMTimeSynthesizerStates rateSf](v6, "rateSf");
    -[TMTime setSf:](v18, "setSf:");
    -[TMTimeSynthesizerStates sf_var](v6, "sf_var");
    -[TMTime setSfUnc:](v18, "setSfUnc:", sqrt(v20));
    -[TMTime setSynthesized:](v18, "setSynthesized:", 1LL);
    -[TMTime setSource:](v18, "setSource:", @"TMTimeSynthesizer");
    -[TMTime setReliability:](v18, "setReliability:", sub_100016C14(self, v18));
  }

  else
  {
    __int16 v21 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = self->_name;
      int v24 = 138412290;
      __int16 v25 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%@, Filter Not Available for timeAtRtc",  (uint8_t *)&v24,  0xCu);
    }

    return 0LL;
  }

  return v18;
}

- (id)synthesizedTimeAtLastRTC
{
  if (self->_running) {
    return -[TMTimeSynthesizer timeAtRtc:](self, "timeAtRtc:", self->_lastTimeRtc);
  }
  else {
    return 0LL;
  }
}

- (double)rtcWhenBeyondUncertainty:(double)a3
{
  if (self->_running && (double utc_var = self->_utc_var, a3 * a3 >= utc_var) && !self->_needTimeNow && self->_measNumber > 3)
  {
    double v5 = (self->_sf_var + self->_clkSg * 10800.0 / 3.0) * 1.0e12;
    double v6 = (self->_utc_sf_cov + self->_utc_sf_cov) * 1.0e12;
    double v7 = (sqrt((utc_var - a3 * a3) * 1.0e12 * (v5 * -4.0) + v6 * v6) - v6) / (v5 + v5);
    double v8 = (a3 - sqrt(utc_var)) / (self->_xoAccuracy * 0.5);
    if (v7 < v8) {
      double v8 = v7;
    }
    return self->_rtc + v8 * 0.75;
  }

  else
  {
    self->_needTimeNow = 0;
    return -INFINITY;
  }

- (void)reset
{
  self->_running = 0;
}

- (void)update:(id)a3 withError:(id *)a4
{
  self->_needTimeNow = 0;
  if ([a3 isSynthesized])
  {
    double v7 = (os_log_s *)qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      if (!a4) {
        return;
      }
      goto LABEL_4;
    }

    sub_10001BF00(v7);
    if (a4)
    {
LABEL_4:
      uint64_t v8 = 0LL;
LABEL_26:
      *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kTimedErrorDomain",  v8,  0LL);
    }
  }

  else
  {
    objc_msgSend(a3, "utcUnc_s");
    if (v9 >= 0.000001)
    {
      BOOL running = self->_running;
      objc_msgSend(a3, "rtc_s");
      if (running && rtc < self->_rtc) {
        double rtc = self->_rtc;
      }
      self->_double lastTimeRtc = rtc;
      ++self->_measNumber;
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"MobileLockdown"))
      {
        if (self->_running)
        {
          double v19 = (os_log_s *)qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            name = self->_name;
            objc_msgSend(a3, "rtc_s");
            uint64_t v22 = v21;
            objc_msgSend(a3, "utc_s");
            uint64_t v24 = v23;
            objc_msgSend(a3, "utcUnc_s");
            uint64_t v26 = v25;
            id v27 = [a3 source];
            double v28 = self->_rtc;
            *(_DWORD *)buf = 138413570;
            v150 = name;
            __int16 v151 = 2048;
            *(void *)v152 = v22;
            *(_WORD *)&v152[8] = 2048;
            *(void *)&v152[10] = v24;
            *(_WORD *)&v152[18] = 2048;
            *(void *)&v152[20] = v26;
            *(_WORD *)&v152[28] = 2112;
            *(void *)&v152[30] = v27;
            *(_WORD *)&v152[38] = 2048;
            *(double *)&v152[40] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@,ignoreMobileLockdown,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@,_rtc,%.6lf",  buf,  0x3Eu);
          }

          if (a4)
          {
            uint64_t v8 = 2LL;
            goto LABEL_26;
          }

          return;
        }
      }

      else if (self->_running)
      {
        objc_msgSend(a3, "rtc_s");
        if (v29 >= self->_rtc + -0.006)
        {
          objc_msgSend(a3, "rtc_s");
          if (v42 < self->_rtc) {
            double v42 = self->_rtc;
          }
          v43 = sub_1000170F0((uint64_t)self, v42);
          v147[0] = _NSConcreteStackBlock;
          v147[1] = 3221225472LL;
          v147[2] = sub_10001861C;
          v147[3] = &unk_1000294B8;
          v147[4] = v43;
          v147[5] = a3;
          v147[6] = self;
          AnalyticsSendEventLazy(@"com.apple.timed.TDTFUpdatePrediction", v147);
          objc_msgSend(a3, "utcUnc_s");
          double v45 = v44;
          objc_msgSend(a3, "utcUnc_s");
          double v47 = v46;
          -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
          double v49 = v48;
          objc_msgSend(a3, "utc_s");
          double v51 = v50;
          -[TMTimeSynthesizerStates utc](v43, "utc");
          double v53 = v51 - v52;
          -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
          double v55 = v54;
          objc_msgSend(a3, "utcUnc_s");
          double v57 = v56;
          objc_msgSend(a3, "utcUnc_s");
          double v59 = v55 + v57 * v58;
          double v60 = 3.0;
          if ((objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"TMLSSourceComputed") & 1) == 0)
          {
            if (objc_msgSend( objc_msgSend(a3, "source"),  "isEqualToString:",  @"TimeSourceGnssValidPos")) {
              double v60 = 10.0;
            }
            else {
              double v60 = 5.0;
            }
          }

          int v61 = sub_10001682C((uint64_t)TMTimeSynthesizer, [a3 source]);
          int v62 = v61;
          if (v53 * v53 <= v59 * (v60 * v60))
          {
            double v104 = v45 * v47 * 1000000.0;
            double v105 = v49 * 1000000.0;
            double v106 = v105 + v104;
            if (v61) {
              self->_unint64_t rejects = 0LL;
            }
            -[TMTimeSynthesizerStates rtc](v43, "rtc");
            self->_double rtc = v107;
            -[TMTimeSynthesizerStates utc](v43, "utc");
            self->_double utc = v108;
            -[TMTimeSynthesizerStates rateSf](v43, "rateSf");
            self->_double rateSf = v109;
            -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
            self->_double utc_var = v110;
            -[TMTimeSynthesizerStates sf_var](v43, "sf_var");
            self->_sf_var = v111;
            -[TMTimeSynthesizerStates utc_sf_cov](v43, "utc_sf_cov");
            self->_double utc_sf_cov = v112;
            double v113 = v104 / v106;
            -[TMTimeSynthesizerStates utc_sf_cov](v43, "utc_sf_cov");
            double v115 = v114 * 1000000.0 / v106;
            double v116 = self->_rateSf + v53 * v115;
            self->_double utc = self->_utc + v105 / v106 * v53;
            self->_double rateSf = v116;
            double utc_sf_cov = self->_utc_sf_cov;
            double v118 = self->_sf_var - utc_sf_cov * v115;
            if (v118 < 6.25e-14) {
              double v118 = 6.25e-14;
            }
            self->_double utc_var = v113 * self->_utc_var;
            self->_sf_var = v118;
            self->_double utc_sf_cov = v113 * utc_sf_cov;
            -[TMTimeSynthesizer setLastInputSource:](self, "setLastInputSource:", [a3 source]);
            sub_100016E14(self, a3);
            sub_1000176F0((uint64_t)self);
            v119 = (os_log_s *)qword_100033900;
            if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
            {
              v120 = self->_name;
              double v122 = self->_rtc;
              double utc = self->_utc;
              double rateSf = self->_rateSf;
              double v142 = sqrt(self->_sf_var);
              double v140 = sqrt(self->_utc_var);
              double v141 = sqrt(self->_utc_sf_cov);
              double v124 = log10(self->_clkSg);
              objc_msgSend(a3, "rtc_s");
              uint64_t v126 = v125;
              objc_msgSend(a3, "utc_s");
              uint64_t v128 = v127;
              objc_msgSend(a3, "utcUnc_s");
              uint64_t v130 = v129;
              id v131 = [a3 source];
              -[TMTimeSynthesizerStates utc](v43, "utc");
              uint64_t v133 = v132;
              -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
              double v135 = sqrt(v134);
              -[TMTimeSynthesizerStates rateSf](v43, "rateSf");
              uint64_t v137 = v136;
              -[TMTimeSynthesizerStates sf_var](v43, "sf_var");
              int measNumber = self->_measNumber;
              *(_DWORD *)buf = 138416386;
              v150 = v120;
              __int16 v151 = 2048;
              *(double *)v152 = v122;
              *(_WORD *)&v152[8] = 2048;
              *(double *)&v152[10] = utc;
              *(_WORD *)&v152[18] = 2048;
              *(double *)&v152[20] = v140;
              *(_WORD *)&v152[28] = 2048;
              *(double *)&v152[30] = rateSf;
              *(_WORD *)&v152[38] = 2048;
              *(double *)&v152[40] = v142;
              __int16 v153 = 2048;
              double v154 = v141;
              __int16 v155 = 2048;
              double v156 = v124;
              __int16 v157 = 2048;
              uint64_t v158 = v126;
              __int16 v159 = 2048;
              uint64_t v160 = v128;
              __int16 v161 = 2048;
              uint64_t v162 = v130;
              __int16 v163 = 2112;
              id v164 = v131;
              __int16 v165 = 2048;
              uint64_t v166 = v133;
              __int16 v167 = 2048;
              double v168 = v135;
              __int16 v169 = 2048;
              uint64_t v170 = v137;
              __int16 v171 = 2048;
              double v172 = sqrt(v139);
              __int16 v173 = 1024;
              int v174 = measNumber;
              _os_log_impl( (void *)&_mh_execute_header,  v119,  OS_LOG_TYPE_DEFAULT,  "%@,SynthesizedClock,rtc,%.6lf,utc,%.6lf,utcUnc,%.6lf,sf,%.8lf,sfUnc,%.8lf,utcSfCov,%.8lf,logNoise,%.6lf, timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@,predUtc,%.6lf,predUtcUnc,%.6lf,predSf,%.8lf,pred SfUnc,%.8lf,measNumber,%d",  buf,  0xA8u);
            }

            v143[0] = _NSConcreteStackBlock;
            v143[1] = 3221225472LL;
            v143[2] = sub_100018A48;
            v143[3] = &unk_100028F00;
            v143[4] = self;
            v143[5] = a3;
            AnalyticsSendEventLazy(@"com.apple.timed.TDTFSynthesizedClock", v143);
          }

          else
          {
            v63 = (os_log_s *)qword_100033900;
            if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
            {
              v64 = self->_name;
              unint64_t rejects = self->_rejects;
              -[TMTimeSynthesizerStates utc](v43, "utc");
              uint64_t v67 = v66;
              objc_msgSend(a3, "rtc_s");
              uint64_t v69 = v68;
              objc_msgSend(a3, "utc_s");
              uint64_t v71 = v70;
              objc_msgSend(a3, "utcUnc_s");
              double v73 = v72;
              double v74 = COERCE_DOUBLE([a3 source]);
              *(_DWORD *)buf = 138414082;
              v150 = v64;
              __int16 v151 = 2048;
              *(void *)v152 = rejects;
              *(_WORD *)&v152[8] = 2048;
              *(double *)&v152[10] = v53;
              *(_WORD *)&v152[18] = 2048;
              *(void *)&v152[20] = v67;
              *(_WORD *)&v152[28] = 2048;
              *(void *)&v152[30] = v69;
              *(_WORD *)&v152[38] = 2048;
              *(void *)&v152[40] = v71;
              __int16 v153 = 2048;
              double v154 = v73;
              __int16 v155 = 2112;
              double v156 = v74;
              _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "%@,RejectATime,rejects,%lu,innv,%.6lf,predTime,%.6lf,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@",  buf,  0x52u);
            }

            v146[0] = _NSConcreteStackBlock;
            v146[1] = 3221225472LL;
            v146[2] = sub_1000187D8;
            v146[3] = &unk_1000294E0;
            *(double *)&v146[6] = v53;
            v146[4] = self;
            v146[5] = a3;
            AnalyticsSendEventLazy(@"com.apple.timed.TDTFRejectATime", v146);
            if (a4) {
              *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kTimedErrorDomain",  4LL,  0LL);
            }
            if (v62)
            {
              unint64_t v75 = self->_rejects + 1;
              self->_unint64_t rejects = v75;
              self->_needTimeNow = 1;
              v76 = (os_log_s *)qword_100033900;
              if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
              {
                v77 = self->_name;
                objc_msgSend(a3, "rtc_s");
                uint64_t v79 = v78;
                objc_msgSend(a3, "utc_s");
                uint64_t v81 = v80;
                objc_msgSend(a3, "utcUnc_s");
                uint64_t v83 = v82;
                id v84 = [a3 source];
                *(_DWORD *)buf = 138413570;
                v150 = v77;
                __int16 v151 = 1024;
                *(_DWORD *)v152 = v75;
                *(_WORD *)&v152[4] = 2048;
                *(void *)&v152[6] = v79;
                *(_WORD *)&v152[14] = 2048;
                *(void *)&v152[16] = v81;
                *(_WORD *)&v152[24] = 2048;
                *(void *)&v152[26] = v83;
                *(_WORD *)&v152[34] = 2112;
                *(void *)&v152[36] = v84;
                _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "%@,RequestFastTime,Reject,number,%u,rtc,%.6lf,utc,%.6lf,uncertainty,%.6lf,source,%@",  buf,  0x3Au);
              }

              v145[0] = _NSConcreteStackBlock;
              v145[1] = 3221225472LL;
              v145[2] = sub_1000188C0;
              v145[3] = &unk_100028BA0;
              v145[4] = v43;
              AnalyticsSendEventLazy(@"com.apple.timed.TDTFRequestFastTime", v145);
              if (self->_rejects > 4
                || (-[TMTimeSynthesizerStates utc_var](v43, "utc_var"),
                    double v86 = v85,
                    objc_msgSend(a3, "utcUnc_s"),
                    double v88 = v87,
                    objc_msgSend(a3, "utcUnc_s"),
                    v86 > v88 * v89 * 16.0))
              {
                v90 = (os_log_s *)qword_100033900;
                if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
                {
                  v91 = self->_name;
                  unint64_t v92 = self->_rejects;
                  -[TMTimeSynthesizerStates utc](v43, "utc");
                  uint64_t v94 = v93;
                  -[TMTimeSynthesizerStates utc_var](v43, "utc_var");
                  double v96 = sqrt(v95);
                  objc_msgSend(a3, "rtc_s");
                  uint64_t v98 = v97;
                  objc_msgSend(a3, "utc_s");
                  uint64_t v100 = v99;
                  objc_msgSend(a3, "utcUnc_s");
                  double v102 = v101;
                  double v103 = COERCE_DOUBLE([a3 source]);
                  *(_DWORD *)buf = 138414082;
                  v150 = v91;
                  __int16 v151 = 2048;
                  *(void *)v152 = v92;
                  *(_WORD *)&v152[8] = 2048;
                  *(void *)&v152[10] = v94;
                  *(_WORD *)&v152[18] = 2048;
                  *(double *)&v152[20] = v96;
                  *(_WORD *)&v152[28] = 2048;
                  *(void *)&v152[30] = v98;
                  *(_WORD *)&v152[38] = 2048;
                  *(void *)&v152[40] = v100;
                  __int16 v153 = 2048;
                  double v154 = v102;
                  __int16 v155 = 2112;
                  double v156 = v103;
                  _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "%@,ResetSynthesizer,rejects,%lu,predTime,%.6lf,predTimeUtc,%.6lf,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@",  buf,  0x52u);
                }

                v144[0] = _NSConcreteStackBlock;
                v144[1] = 3221225472LL;
                v144[2] = sub_100018984;
                v144[3] = &unk_100028BA0;
                v144[4] = v43;
                AnalyticsSendEventLazy(@"com.apple.timed.TDTFResetDueToRejects", v144);
                sub_1000172E0(self, a3);
                if (a4)
                {
                  uint64_t v8 = 5LL;
                  goto LABEL_26;
                }
              }
            }
          }
        }

        else
        {
          __int16 v30 = (os_log_s *)qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            double v31 = self->_name;
            objc_msgSend(a3, "rtc_s");
            uint64_t v33 = v32;
            objc_msgSend(a3, "utc_s");
            uint64_t v35 = v34;
            objc_msgSend(a3, "utcUnc_s");
            uint64_t v37 = v36;
            id v38 = [a3 source];
            double v39 = self->_rtc;
            *(_DWORD *)buf = 138413570;
            v150 = v31;
            __int16 v151 = 2048;
            *(void *)v152 = v33;
            *(_WORD *)&v152[8] = 2048;
            *(void *)&v152[10] = v35;
            *(_WORD *)&v152[18] = 2048;
            *(void *)&v152[20] = v37;
            *(_WORD *)&v152[28] = 2112;
            *(void *)&v152[30] = v38;
            *(_WORD *)&v152[38] = 2048;
            *(double *)&v152[40] = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%@,RtcRollBack,rtc,%.6lf,utc,%.6lf,unc,%.6lf,source,%@,_rtc,%.6lf",  buf,  0x3Eu);
          }

          v148[0] = _NSConcreteStackBlock;
          v148[1] = 3221225472LL;
          v148[2] = sub_100018568;
          v148[3] = &unk_100028F00;
          v148[4] = self;
          v148[5] = a3;
          AnalyticsSendEventLazy(@"com.apple.timed.TDTFRtcRollback", v148);
          double v40 = self->_rtc;
          objc_msgSend(a3, "rtc_s");
          if (a4 && v40 - v41 > 3600.0)
          {
            uint64_t v8 = 3LL;
            goto LABEL_26;
          }
        }

        return;
      }

      sub_1000172E0(self, a3);
      return;
    }

    double v10 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_name;
      objc_msgSend(a3, "rtc_s");
      uint64_t v13 = v12;
      objc_msgSend(a3, "utc_s");
      uint64_t v15 = v14;
      objc_msgSend(a3, "utcUnc_s");
      *(_DWORD *)buf = 138413314;
      v150 = v11;
      __int16 v151 = 2048;
      *(void *)v152 = v13;
      *(_WORD *)&v152[8] = 2048;
      *(void *)&v152[10] = v15;
      *(_WORD *)&v152[18] = 2048;
      *(void *)&v152[20] = v16;
      *(_WORD *)&v152[28] = 2112;
      *(void *)&v152[30] = [a3 source];
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@,zeroTimeUncertainty,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@",  buf,  0x34u);
    }

    if (a4)
    {
      uint64_t v8 = 1LL;
      goto LABEL_26;
    }
  }

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_BOOL running = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (TMTime)lastQualityTime
{
  return (TMTime *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setLastQualityTime:(id)a3
{
}

- (NSString)lastInputSource
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setLastInputSource:(id)a3
{
}

@end