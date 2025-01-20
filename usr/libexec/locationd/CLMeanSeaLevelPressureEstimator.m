@interface CLMeanSeaLevelPressureEstimator
- (BOOL)firstRefreshAfterVisit;
- (BOOL)gaussianProcess:(id)a3 withMslpArray:(id)a4 withType:(unint64_t)a5;
- (BOOL)getLastPressureSample:(double *)a3;
- (BOOL)inVisitStatus;
- (BOOL)isValidMslp:(id)a3;
- (BOOL)updateHistoricalMslpArray:(id)a3 from:(int)a4;
- (BOOL)updateLastSampleInMeanSeaLevelPressureArray;
- (CLMeanSeaLevelPressureEstimator)initWithContextManager:(id)a3 andUniverse:(id)a4 andDelegate:(id)a5 andBuffers:(void *)a6;
- (double)cumulativeStartTime;
- (double)currentLatitude;
- (double)currentLongitude;
- (double)currentPressure;
- (double)exitVisitTimestamp;
- (double)lastRefreshTimestamp;
- (double)maxPressure;
- (double)minPressure;
- (id).cxx_construct;
- (id)getEstimatedMeanSeaLevelPressure;
- (int)getMeanSeaLevelArrayCount;
- (int)numberOfRebaseBtwRefresh;
- (int)numberOfTrackEndedBtwRefresh;
- (void)cleanHistoricalMslpArrayForForceRebase:(id)a3;
- (void)clearInVisitRebasedMslpInPlist;
- (void)clearMeanSeaLevelPressureArrayInPlist;
- (void)clearRecentMeanSeaLevelPressureArrayInPlist;
- (void)dealloc;
- (void)getAndSendCurrentEstimateMeanSeaLevelPressureFrom:(int)a3;
- (void)getLastHistoricalMeanSeaLevelPressureData:(double *)a3;
- (void)getMslpDriftRate:(double *)a3 withLastMslp:(double)a4;
- (void)onMslp:(const CMMeanSeaLevelPressure *)a3;
- (void)printMeanSeaLevelPressureArray:(id)a3 withPrePhrase:()basic_string<char;
- (void)printMeanSeaLevelPressureElement:(id)a3 withPrePhrase:()basic_string<char;
- (void)refreshHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4;
- (void)resetInVisitRebasedMslp;
- (void)retrieveMeanSeaLevelPressureEstimatorState;
- (void)saveInVisitRebasedMslpToPlist;
- (void)saveInVisitStateToPlist;
- (void)saveMeanSeaLevelPressureArrayToPlist;
- (void)saveRecentMeanSeaLevelPressureArrayToPlist;
- (void)sentRefreshMslpAnalyticsWithAltitudeCorrection:(double)a3 uncertaintyBeforeCurrentRefresh:(double)a4 uncertaintyAfterCurrentRefresh:(double)a5 refreshDuration:(double)a6 xpcWaitingTime:(double)a7 timeDiffBtwRefresh:(double)a8 pressureDelta:(double)a9;
- (void)setCumulativeStartTime:(double)a3;
- (void)setCurrentLatitude:(double)a3;
- (void)setCurrentLongitude:(double)a3;
- (void)setCurrentPressure:(double)a3;
- (void)setExitVisitTimestamp:(double)a3;
- (void)setFirstRefreshAfterVisit:(BOOL)a3;
- (void)setInVisitStatus:(BOOL)a3;
- (void)setLastRefreshTimestamp:(double)a3;
- (void)setMaxPressure:(double)a3;
- (void)setMinPressure:(double)a3;
- (void)setNumberOfRebaseBtwRefresh:(int)a3;
- (void)setNumberOfTrackEndedBtwRefresh:(int)a3;
- (void)updateInVisitRebasedMslp:(id)a3;
- (void)updateUncertinatyAndSendCurrentEstimateMslpFrom:(int)a3;
- (void)writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:(double)a3;
@end

@implementation CLMeanSeaLevelPressureEstimator

- (CLMeanSeaLevelPressureEstimator)initWithContextManager:(id)a3 andUniverse:(id)a4 andDelegate:(id)a5 andBuffers:(void *)a6
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CLMeanSeaLevelPressureEstimator;
  v10 = -[CLMeanSeaLevelPressureEstimator init](&v23, "init");
  uint64_t v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_universe = (CLIntersiloUniverse *)a4;
    v10->_delegate = (CLBarometerCalibrationContextClient *)a5;
    v10->_dataBuffers = a6;
    v10->_meanSeaLevelPressureArray = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v11 + 40) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *(void *)(v11 + 64) = objc_alloc_init(&OBJC_CLASS___CLMeanSeaLevelPressureData);
    *(void *)(v11 + 48) = a3;
    *(_BYTE *)(v11 + 72) = 0;
    *(void *)(v11 + 120) = 0LL;
    *(void *)(v11 + 128) = 0LL;
    int64x2_t v12 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(void *)(v11 + 232) = 0LL;
    *(int64x2_t *)(v11 + 80) = v12;
    *(int64x2_t *)(v11 + 96) = v12;
    *(void *)(v11 + 264) = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)(v11 + 272) = 0LL;
    *(_WORD *)(v11 + 248) = 0;
    *(void *)(v11 + 112) = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)(v11 + 252) = -1LL;
    *(_DWORD *)(v11 + 224) = -1;
    *(int64x2_t *)(v11 + 192) = v12;
    *(int64x2_t *)(v11 + 208) = v12;
    *(_DWORD *)v22 = 1155596288;
    sub_101206C88(buf, "RateToRefreshHistoricalMeanSeaLevelPressure", v22, 0);
    *(double *)(v11 + 184) = v25;
    v22[0] = 0;
    sub_1012049AC(buf, "MeanSeaLevelPressureLogInitialArray", v22, 0);
    *(_BYTE *)(v11 + 176) = buf[1];
    *(_DWORD *)v22 = 1137180672;
    sub_101206C88(buf, "gpVerticalScale_historicalMslp", v22, 0);
    *(float *)(v11 + 140) = v25;
    *(_DWORD *)v22 = 1132068864;
    sub_101206C88(buf, "gpVerticalScale_recentMslp", v22, 0);
    *(float *)(v11 + 136) = v25;
    *(_DWORD *)v22 = 1079194419;
    sub_101206C88(buf, "gpHorizontalScale_historicalMslpOutVisit", v22, 0);
    *(double *)(v11 + 144) = v25;
    *(_DWORD *)v22 = 1056964608;
    sub_101206C88(buf, "gpHorizontalScale_historicalMslpInVisit", v22, 0);
    *(double *)(v11 + 152) = v25;
    *(_DWORD *)v22 = 1056964608;
    sub_101206C88(buf, "gpHorizontalScale_recentMslpInVisit", v22, 0);
    *(double *)(v11 + 160) = v25;
    *(_DWORD *)v22 = 1045220557;
    sub_101206C88(buf, "gpHorizontalScale_recentMslpOutVisit", v22, 0);
    *(double *)(v11 + 168) = v25;
    [(id)v11 retrieveMeanSeaLevelPressureEstimatorState];
    if (![*(id *)(v11 + 32) count] && !objc_msgSend(*(id *)(v11 + 40), "count"))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      v13 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "locationd starts and no historical data retrieved from plist, refreshing mean sea level array.",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        *(_WORD *)v22 = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "locationd starts and no historical data retrieved from plist, refreshing mean sea level array.",  v22,  2);
        v21 = (uint8_t *)v20;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator initWithContextManager:andUniverse:andDelegate:andBuffers:]",  "%s\n",  v20);
        if (v21 != buf) {
          free(v21);
        }
      }

      double Current = CFAbsoluteTimeGetCurrent();
      [(id)v11 refreshHistoricalMeanSeaLevelPressureWithStartTime:Current + -10800.0 andEndTime:CFAbsoluteTimeGetCurrent()];
    }

    id v15 = [*(id *)(v11 + 8) silo];
    v16 = operator new(0x38uLL);
    sub_10100C618(v16, v15, (uint64_t)sub_10100309C, v11, 0LL);
    uint64_t v17 = *(void *)(v11 + 240);
    *(void *)(v11 + 240) = v16;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
    }
    if (sub_1008FA854(0))
    {
      uint64_t v18 = sub_1008FA854(0);
      sub_1006DCB40(v18, 48, *(void *)(v11 + 240), -1.0);
    }
  }

  return (CLMeanSeaLevelPressureEstimator *)v11;
}

- (void)dealloc
{
  self->_meanSeaLevelPressureArray = 0LL;
  self->_recentMeanSeaLevelPressureArray = 0LL;

  self->_elevationProfileContextManager = 0LL;
  self->_currentEstimateMslp = 0LL;

  self->_inVisitRebasedMslp = 0LL;
  if (sub_1008FA854(0))
  {
    uint64_t v3 = sub_1008FA854(0);
    sub_1006DD2A0(v3, 48, (uint64_t)self->_mslpDispatcher.__ptr_.__value_);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLMeanSeaLevelPressureEstimator;
  -[CLMeanSeaLevelPressureEstimator dealloc](&v4, "dealloc");
}

- (int)getMeanSeaLevelArrayCount
{
  unsigned int v3 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
  return -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count") + v3;
}

- (void)printMeanSeaLevelPressureArray:(id)a3 withPrePhrase:()basic_string<char
{
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v63;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v63 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
        [v9 timestamp];
        std::to_string(&v71, v10);
        uint64_t v11 = std::string::insert(&v71, 0LL, ", ");
        __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = v11->__r_.__value_.__l.__cap_;
        *(_OWORD *)__p = v12;
        v11->__r_.__value_.__l.__size_ = 0LL;
        v11->__r_.__value_.__l.__cap_ = 0LL;
        v11->__r_.__value_.__r.__words[0] = 0LL;
        if (__p[23] >= 0) {
          v13 = __p;
        }
        else {
          v13 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v14 = __p[23];
        }
        else {
          std::string::size_type v14 = *(void *)&__p[8];
        }
        std::string::append(&v69, v13, v14);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        [v9 meanSeaLevelPressure];
        std::to_string(&v71, v15);
        v16 = std::string::insert(&v71, 0LL, ", ");
        __int128 v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = v16->__r_.__value_.__l.__cap_;
        *(_OWORD *)__p = v17;
        v16->__r_.__value_.__l.__size_ = 0LL;
        v16->__r_.__value_.__l.__cap_ = 0LL;
        v16->__r_.__value_.__r.__words[0] = 0LL;
        if (__p[23] >= 0) {
          uint64_t v18 = __p;
        }
        else {
          uint64_t v18 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v19 = __p[23];
        }
        else {
          std::string::size_type v19 = *(void *)&__p[8];
        }
        std::string::append(&v68, v18, v19);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        [v9 uncertainty];
        std::to_string(&v71, v20);
        v21 = std::string::insert(&v71, 0LL, ", ");
        __int128 v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = v21->__r_.__value_.__l.__cap_;
        *(_OWORD *)__p = v22;
        v21->__r_.__value_.__l.__size_ = 0LL;
        v21->__r_.__value_.__l.__cap_ = 0LL;
        v21->__r_.__value_.__r.__words[0] = 0LL;
        if (__p[23] >= 0) {
          objc_super v23 = __p;
        }
        else {
          objc_super v23 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v24 = __p[23];
        }
        else {
          std::string::size_type v24 = *(void *)&__p[8];
        }
        std::string::append(&v67, v23, v24);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        [v9 pressureMeasurement];
        std::to_string(&v71, v25);
        v26 = std::string::insert(&v71, 0LL, ", ");
        __int128 v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
        *(void *)&__p[16] = v26->__r_.__value_.__l.__cap_;
        *(_OWORD *)__p = v27;
        v26->__r_.__value_.__l.__size_ = 0LL;
        v26->__r_.__value_.__l.__cap_ = 0LL;
        v26->__r_.__value_.__r.__words[0] = 0LL;
        if (__p[23] >= 0) {
          v28 = __p;
        }
        else {
          v28 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v29 = __p[23];
        }
        else {
          std::string::size_type v29 = *(void *)&__p[8];
        }
        std::string::append(&v66, v28, v29);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }

    while (v6);
  }

  id v30 = [a3 count];
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  v31 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "count";
    *(_WORD *)&__p[12] = 2048;
    *(void *)&__p[14] = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "mean sea level pressure array,%s,%lu",  __p,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)"count";
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v30;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "mean sea level pressure array,%s,%lu",  (const char *)&v71,  22);
    v45 = (char *)v44;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]",  "%s\n",  v44);
    if (v45 != __p) {
      free(v45);
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  v32 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    data = a4;
    v34 = &v69;
    if ((v69.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v34 = (std::string *)v69.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = data;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s timestamps%s", __p, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    v46 = a4;
    v47 = &v69;
    if ((v69.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v47 = (std::string *)v69.__r_.__value_.__r.__words[0];
    }
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)v46;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v47;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "%s timestamps%s",  (const char *)&v71,  v61);
    v49 = (char *)v48;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]",  "%s\n",  v48);
    if (v49 != __p) {
      free(v49);
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  v35 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    v36 = a4;
    v37 = &v68;
    if ((v68.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v37 = (std::string *)v68.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = v36;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s pressures%s", __p, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    v50 = a4;
    v51 = &v68;
    if ((v68.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v51 = (std::string *)v68.__r_.__value_.__r.__words[0];
    }
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)v50;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v51;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "%s pressures%s",  (const char *)&v71,  v61);
    v53 = (char *)v52;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]",  "%s\n",  v52);
    if (v53 != __p) {
      free(v53);
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  v38 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    v39 = a4;
    v40 = &v67;
    if ((v67.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v40 = (std::string *)v67.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = v39;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s uncertainties%s", __p, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    v54 = a4;
    v55 = &v67;
    if ((v67.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v55 = (std::string *)v67.__r_.__value_.__r.__words[0];
    }
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)v54;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v55;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "%s uncertainties%s",  (const char *)&v71,  v61);
    v57 = (char *)v56;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]",  "%s\n",  v56);
    if (v57 != __p) {
      free(v57);
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  v41 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    v42 = a4;
    v43 = &v66;
    if ((v66.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v43 = (std::string *)v66.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = v42;
    *(_WORD *)&__p[12] = 2080;
    *(void *)&__p[14] = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s pressureMeasurements%s", __p, 0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    v58 = &v66;
    if ((v66.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v58 = (std::string *)v66.__r_.__value_.__r.__words[0];
    }
    LODWORD(v71.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v71.__r_.__value_.__r.__words + 4) = (std::string::size_type)a4;
    WORD2(v71.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v71.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v58;
    LODWORD(v61) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "%s pressureMeasurements%s",  (const char *)&v71,  v61);
    v60 = (char *)v59;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]",  "%s\n",  v59);
    if (v60 != __p) {
      free(v60);
    }
  }

- (void)printMeanSeaLevelPressureElement:(id)a3 withPrePhrase:()basic_string<char
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  id v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    data = a4;
    [a3 meanSeaLevelPressure];
    uint64_t v9 = v8;
    [a3 uncertainty];
    uint64_t v11 = v10;
    [a3 timestamp];
    *(_DWORD *)buf = 136316674;
    v36 = data;
    __int16 v37 = 2080;
    v38 = "meanSeaLevelPressure";
    __int16 v39 = 2048;
    uint64_t v40 = v9;
    __int16 v41 = 2080;
    v42 = "uncertainty";
    __int16 v43 = 2048;
    uint64_t v44 = v11;
    __int16 v45 = 2080;
    v46 = "timestamp";
    __int16 v47 = 2048;
    uint64_t v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s,%s,%f,%s,%f,%s,%f", buf, 0x48u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v13 = qword_1019346A8;
    [a3 meanSeaLevelPressure];
    uint64_t v15 = v14;
    [a3 uncertainty];
    uint64_t v17 = v16;
    [a3 timestamp];
    int v21 = 136316674;
    __int128 v22 = a4;
    __int16 v23 = 2080;
    std::string::size_type v24 = "meanSeaLevelPressure";
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    __int16 v27 = 2080;
    v28 = "uncertainty";
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    __int16 v31 = 2080;
    v32 = "timestamp";
    __int16 v33 = 2048;
    uint64_t v34 = v18;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  0LL,  "%s,%s,%f,%s,%f,%s,%f",  (const char *)&v21,  72);
    double v20 = (uint8_t *)v19;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:]",  "%s\n",  v19);
    if (v20 != buf) {
      free(v20);
    }
  }

- (BOOL)updateLastSampleInMeanSeaLevelPressureArray
{
  id v3 = -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count");
  if (v3)
  {
    objc_super v4 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    -[CLMeanSeaLevelPressureData setTimestamp:](v4, "setTimestamp:");
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_1010DDBC0(__p, "recent mean sea level pressure array for Gaussian process:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( self,  "printMeanSeaLevelPressureArray:withPrePhrase:",  recentMeanSeaLevelPressureArray,  __p);
    if (SHIBYTE(v38) < 0) {
      operator delete(__p[0]);
    }
    if (-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]( self,  "gaussianProcess:withMslpArray:withType:",  v4,  self->_recentMeanSeaLevelPressureArray,  0LL))
    {
      if ((unint64_t)-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count") >= 0xF)
      {
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v7 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(-[NSMutableArray firstObject](self->_meanSeaLevelPressureArray, "firstObject"), "timestamp");
          *(_DWORD *)buf = 134217984;
          v56 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "remove the oldest mean sea level pressure,timestamp,%f",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_101894348);
          }
          uint64_t v30 = qword_1019346A8;
          objc_msgSend(-[NSMutableArray firstObject](self->_meanSeaLevelPressureArray, "firstObject"), "timestamp");
          int v39 = 134217984;
          uint64_t v40 = v31;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v30,  0LL,  "remove the oldest mean sea level pressure,timestamp,%f",  COERCE_DOUBLE(&v39));
          __int16 v33 = (uint8_t *)v32;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]",  "%s\n",  v32);
          if (v33 != buf) {
            free(v33);
          }
        }

        -[NSMutableArray removeObjectAtIndex:](self->_meanSeaLevelPressureArray, "removeObjectAtIndex:", 0LL);
      }

      -[NSMutableArray addObject:](self->_meanSeaLevelPressureArray, "addObject:", v4);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      uint64_t v9 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureData timestamp](v4, "timestamp");
        double v11 = v10;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v4, "meanSeaLevelPressure");
        uint64_t v13 = v12;
        -[CLMeanSeaLevelPressureData uncertainty](v4, "uncertainty");
        uint64_t v15 = v14;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v4, "pressureMeasurement");
        *(_DWORD *)buf = 136316930;
        v56 = "timestamp";
        __int16 v57 = 2048;
        CFAbsoluteTime v58 = v11;
        __int16 v59 = 2080;
        v60 = "meanSeaLevelPressure";
        __int16 v61 = 2048;
        uint64_t v62 = v13;
        __int16 v63 = 2080;
        __int128 v64 = "uncertainty";
        __int16 v65 = 2048;
        uint64_t v66 = v15;
        __int16 v67 = 2080;
        std::string v68 = "measurePressure";
        __int16 v69 = 2048;
        uint64_t v70 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "add temporary mslp to mslp array,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x52u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v20 = qword_1019346A8;
        -[CLMeanSeaLevelPressureData timestamp](v4, "timestamp");
        double v22 = v21;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v4, "meanSeaLevelPressure");
        uint64_t v24 = v23;
        -[CLMeanSeaLevelPressureData uncertainty](v4, "uncertainty");
        uint64_t v26 = v25;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v4, "pressureMeasurement");
        int v39 = 136316930;
        uint64_t v40 = "timestamp";
        __int16 v41 = 2048;
        CFAbsoluteTime v42 = v22;
        __int16 v43 = 2080;
        uint64_t v44 = "meanSeaLevelPressure";
        __int16 v45 = 2048;
        uint64_t v46 = v24;
        __int16 v47 = 2080;
        uint64_t v48 = "uncertainty";
        __int16 v49 = 2048;
        uint64_t v50 = v26;
        __int16 v51 = 2080;
        v52 = "measurePressure";
        __int16 v53 = 2048;
        uint64_t v54 = v27;
        LODWORD(v35) = 82;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "add temporary mslp to mslp array,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v39,  v35,  v36,  *(double *)__p,  (const char *)__p[1],  v38);
        __int16 v29 = (uint8_t *)v28;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]",  "%s\n",  v28);
        if (v29 != buf) {
          free(v29);
        }
      }

      LOBYTE(v3) = 1;
    }

    else
    {
      -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");
      -[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist]( self,  "clearRecentMeanSeaLevelPressureArrayInPlist");
      self->_cumulativeStartTime = 1.79769313e308;
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      uint64_t v17 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "timestamp";
        __int16 v57 = 2048;
        CFAbsoluteTime v58 = Current;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "fail to query temporary mslp from recent mslp array,%s,%f",  buf,  0x16u);
      }

      LODWORD(v3) = sub_1002921D0(115, 2);
      if ((_DWORD)v3)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        int v39 = 136315394;
        uint64_t v40 = "timestamp";
        __int16 v41 = 2048;
        CFAbsoluteTime v42 = Current;
        LODWORD(v35) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "fail to query temporary mslp from recent mslp array,%s,%f",  (const char *)&v39,  v35);
        std::string::size_type v19 = (uint8_t *)v18;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]",  "%s\n",  v18);
        if (v19 != buf) {
          free(v19);
        }
        LOBYTE(v3) = 0;
      }
    }
  }

  return (char)v3;
}

- (id)getEstimatedMeanSeaLevelPressure
{
  id v3 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  -[CLMeanSeaLevelPressureData setTimestamp:](v3, "setTimestamp:");
  unsigned int v5 = -[CLMeanSeaLevelPressureEstimator updateLastSampleInMeanSeaLevelPressureArray]( self,  "updateLastSampleInMeanSeaLevelPressureArray");
  meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
  sub_1010DDBC0(__p, "mean sea level pressure array for Gaussian process:");
  -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( self,  "printMeanSeaLevelPressureArray:withPrePhrase:",  meanSeaLevelPressureArray,  __p);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (!-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
  {
    -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v3, "setMeanSeaLevelPressure:", 101325.0);
    -[CLMeanSeaLevelPressureData setUncertainty:](v3, "setUncertainty:", 6000.0);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v9 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "mean sea level pressure array is empty.",  buf,  2u);
    }

    if (!sub_1002921D0(115, 2)) {
      return v3;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    LOWORD(v21) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "mean sea level pressure array is empty.",  &v21,  2);
    double v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]",  "%s\n",  v10);
LABEL_29:
    if (v11 != buf) {
      free(v11);
    }
    return v3;
  }

  if (-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]( self,  "gaussianProcess:withMslpArray:withType:",  v3,  self->_meanSeaLevelPressureArray,  1LL))
  {
    if (v5)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      uint64_t v7 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject"), "timestamp");
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime v24 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "remove temporary mslp from mslp array,timestamp,%f",  buf,  0xCu);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v15 = qword_1019346A8;
        objc_msgSend(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject"), "timestamp");
        int v21 = 134217984;
        CFAbsoluteTime v22 = v16;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v15,  0LL,  "remove temporary mslp from mslp array,timestamp,%f",  COERCE_DOUBLE(&v21));
        uint64_t v18 = (uint8_t *)v17;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]",  "%s\n",  v17);
        if (v18 != buf) {
          free(v18);
        }
      }

      -[NSMutableArray removeLastObject](self->_meanSeaLevelPressureArray, "removeLastObject");
    }

    return v3;
  }

  -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");
  -[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist]( self,  "clearRecentMeanSeaLevelPressureArrayInPlist");
  -[NSMutableArray removeAllObjects](self->_meanSeaLevelPressureArray, "removeAllObjects");
  -[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist]( self,  "clearMeanSeaLevelPressureArrayInPlist");
  self->_cumulativeStartTime = 1.79769313e308;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  uint64_t v12 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v24 = Current;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "fail to query mslp from mslp array,timestamp,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    int v21 = 134217984;
    CFAbsoluteTime v22 = Current;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "fail to query mslp from mslp array,timestamp,%f",  COERCE_DOUBLE(&v21));
    double v11 = (uint8_t *)v14;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]",  "%s\n",  v14);
    goto LABEL_29;
  }

  return v3;
}

- (BOOL)gaussianProcess:(id)a3 withMslpArray:(id)a4 withType:(unint64_t)a5
{
  double v165 = v7;
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  double v8 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(objc_msgSend(a4, "firstObject"), "timestamp");
    uint64_t v10 = v9;
    objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
    *(_DWORD *)buf = 136316418;
    v230 = "queryTimestamp";
    __int16 v231 = 2048;
    double v232 = v165;
    __int16 v233 = 2080;
    v234 = "firstTimestampInArray";
    __int16 v235 = 2048;
    uint64_t v236 = v10;
    __int16 v237 = 2080;
    v238 = "lastTimestampInArray";
    __int16 v239 = 2048;
    uint64_t v240 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "interpolating or extrapolating the mean sea level pressure,%s,%f,%s,%f,%s,%f",  buf,  0x3Eu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v120 = qword_1019346A8;
    objc_msgSend(objc_msgSend(a4, "firstObject"), "timestamp");
    uint64_t v122 = v121;
    objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp");
    *(_DWORD *)v211 = 136316418;
    v212 = "queryTimestamp";
    __int16 v213 = 2048;
    *(double *)v214 = v165;
    *(_WORD *)&v214[8] = 2080;
    *(void *)&v214[10] = "firstTimestampInArray";
    *(_WORD *)&v214[18] = 2048;
    *(void *)&v214[20] = v122;
    *(_WORD *)&v214[28] = 2080;
    *(void *)&v214[30] = "lastTimestampInArray";
    *(_WORD *)&v214[38] = 2048;
    *(void *)&v214[40] = v123;
    LODWORD(v126) = 62;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v120,  0LL,  "interpolating or extrapolating the mean sea level pressure,%s,%f,%s,%f,%s,%f",  (const char *)v211,  v126,  v127,  v128,  v130,  v131);
    v125 = (uint8_t *)v124;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]",  "%s\n",  v124);
    if (v125 != buf) {
      free(v125);
    }
  }

  double v184 = 1.79769313e308;
  if (-[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v184))
  {
    [a3 setPressureMeasurement:v184];
  }

  else
  {
    objc_msgSend(objc_msgSend(a4, "lastObject"), "pressureMeasurement");
    objc_msgSend(a3, "setPressureMeasurement:");
    objc_msgSend(objc_msgSend(a4, "lastObject"), "pressureMeasurement");
    double v184 = v12;
  }

  int v13 = [a4 count];
  int v157 = v13;
  double v183 = 0.0;
  int64_t v14 = v13;
  if (v13 <= 0)
  {
    double v32 = 0.0;
    double v163 = 0.0 / (double)v13;
  }

  else
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = v13;
    double v17 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    do
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "meanSeaLevelPressure");
      double v21 = v20;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "meanSeaLevelPressure");
      double v23 = v22;
      uint64_t v24 = v15 + 1;
      if (v15 + 1 < v14)
      {
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15 + 1), "meanSeaLevelPressure");
        double v26 = v25;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "meanSeaLevelPressure");
        double v28 = v27;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15 + 1), "timestamp");
        double v30 = v29;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v15), "timestamp");
        double v19 = v19 + vabdd_f64(v26, v28) / (v30 - v31);
      }

      double v17 = v17 + v21;
      double v18 = v18 + v23 * v23;
      ++v15;
    }

    while (v16 != v24);
    double v32 = 0.0;
    double v163 = v17 / (double)v157;
    if (v157 > 1)
    {
      double v32 = sqrt(v18 / (double)v157 - v17 / (double)v157 * (v17 / (double)v157));
      double v183 = v19 / (double)(v157 - 1) / 0.000277777785;
    }
  }

  objc_msgSend(objc_msgSend(a4, "lastObject"), "meanSeaLevelPressure");
  -[CLMeanSeaLevelPressureEstimator getMslpDriftRate:withLastMslp:](self, "getMslpDriftRate:withLastMslp:", &v183);
  bzero(buf, 0x708uLL);
  if (a5)
  {
    double gpMinVertScale_historical = v32 * 4.0;
    uint64_t v34 = self;
    uint64_t v35 = 19LL;
    if (!self->_inVisitStatus) {
      uint64_t v35 = 18LL;
    }
    if (gpMinVertScale_historical < self->_gpMinVertScale_historical) {
      double gpMinVertScale_historical = self->_gpMinVertScale_historical;
    }
  }

  else
  {
    uint64_t v34 = self;
    uint64_t v35 = 20LL;
    if (!self->_inVisitStatus) {
      uint64_t v35 = 21LL;
    }
    double gpMinVertScale_historical = self->_gpMinVertScale_recent;
  }

  double v36 = 0.5 / (*(double *)&(&v34->super.isa)[v35] * *(double *)&(&v34->super.isa)[v35]);
  double v37 = gpMinVertScale_historical * gpMinVertScale_historical;
  if (v157 < 1)
  {
    double v164 = 1.79769313e308;
LABEL_61:
    unint64_t v87 = v14;
    do
    {
      *(void *)sub_101005F40((uint64_t)buf, v87, v87) = 0x3FF0000000000000LL;
      ++v87;
    }

    while (v87 != 15);
    goto LABEL_63;
  }

  unint64_t v38 = 0LL;
  double v164 = 1.79769313e308;
  do
  {
    for (unint64_t i = 0LL; i != v157; ++i)
    {
      id v40 = [a4 objectAtIndexedSubscript:v38];
      if (v38 == i)
      {
        [v40 uncertainty];
        double v42 = v41;
        __int16 v43 = (double *)sub_101005F40((uint64_t)buf, v38, v38);
        double v44 = v42 * v42 + v37 * 2.0;
      }

      else
      {
        [v40 timestamp];
        double v46 = v45;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", i), "timestamp");
        double v48 = v47;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "pressureMeasurement");
        double v50 = v49;
        objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", i), "pressureMeasurement");
        double v52 = v51;
        double v53 = exp(v36 * -((v46 * 0.000277777785 - v48 * 0.000277777785) * (v46 * 0.000277777785 - v48 * 0.000277777785)));
        *(double *)sub_101005F40((uint64_t)buf, v38, i) = v37 * v53;
        double v54 = exp(v36 * -((v50 / 1000.0 - v52 / 1000.0) * (v50 / 1000.0 - v52 / 1000.0)));
        __int16 v43 = (double *)sub_101005F40((uint64_t)buf, v38, i);
        double v44 = *v43 + v37 * v54;
      }

      double *v43 = v44;
    }

    double v55 = v184;
    float v169 = 0.0;
    if (v184 != 1.79769313e308)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38, v184), "pressureMeasurement");
      double v55 = v56 - v184;
      *(float *)&double v55 = v55;
      *(float *)&double v55 = fabsf(*(float *)&v55);
      float v169 = *(float *)&v55;
    }

    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38, v55), "pressureMeasurement");
    *(float *)&double v57 = v57;
    float v167 = sub_100FAE134(*(float *)&v57);
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "pressureMeasurement");
    double v59 = v58;
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "meanSeaLevelPressure");
    float v60 = v59;
    float v62 = v61;
    sub_100FAE09C(v60, v62);
    float v64 = v63;
    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "timestamp");
    double v66 = v65;
    double v67 = v183;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    float v68 = (float)((float)(v169 * v167) / v64) * (float)((float)(v169 * v167) / v64);
    double v69 = vabdd_f64(v66, v165);
    float v70 = v67 * v69 * 0.000277777785 * (v67 * v69 * 0.000277777785);
    std::string v71 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double v72 = v183;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "uncertainty");
      *(_DWORD *)v211 = 136318978;
      v212 = "index";
      __int16 v213 = 1024;
      *(_DWORD *)v214 = v38;
      *(_WORD *)&v214[4] = 2080;
      *(void *)&v214[6] = "deltaPressure";
      *(_WORD *)&v214[14] = 2048;
      *(double *)&v214[16] = v169;
      *(_WORD *)&v214[24] = 2080;
      *(void *)&v214[26] = "uncDueToElevation";
      *(_WORD *)&v214[34] = 2048;
      *(double *)&v214[36] = v68;
      *(_WORD *)&v214[44] = 2080;
      *(void *)&v214[46] = "slopeDiffDElevationDPressure";
      *(_WORD *)&v214[54] = 2048;
      *(double *)&v214[56] = v167;
      *(_WORD *)&v214[64] = 2080;
      *(void *)&v214[66] = "dhdpb";
      __int16 v215 = 2048;
      double v216 = v64;
      __int16 v217 = 2080;
      v218 = "uncDueToWeather";
      __int16 v219 = 2048;
      double v220 = v70;
      __int16 v221 = 2080;
      v222 = "aveRateInSec";
      __int16 v223 = 2048;
      double v224 = v72 * 0.000277777785;
      __int16 v225 = 2080;
      v226 = "uncSquare";
      __int16 v227 = 2048;
      double v228 = v73 * v73;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "uncertainty term,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  v211,  0x9Eu);
    }

    double v74 = v68;
    double v75 = v70;
    if (sub_1002921D0(115, 2))
    {
      bzero(v211, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      double v76 = v74;
      uint64_t v80 = qword_1019346A8;
      double v81 = v183;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "uncertainty");
      *(_DWORD *)v201 = 136318978;
      *(void *)&v201[4] = "index";
      *(_WORD *)&v201[12] = 1024;
      *(_DWORD *)&v201[14] = v38;
      *(_WORD *)&v201[18] = 2080;
      *(void *)&v201[20] = "deltaPressure";
      *(_WORD *)&v201[28] = 2048;
      *(double *)&v201[30] = v169;
      *(_WORD *)&v201[38] = 2080;
      *(void *)&v201[40] = "uncDueToElevation";
      *(_WORD *)v202 = 2048;
      *(double *)&v202[2] = v76;
      *(_WORD *)&v202[10] = 2080;
      *(void *)&v202[12] = "slopeDiffDElevationDPressure";
      *(_WORD *)&v202[20] = 2048;
      *(double *)&v202[22] = v167;
      *(_WORD *)&v202[30] = 2080;
      *(void *)v203 = "dhdpb";
      *(_WORD *)&v203[8] = 2048;
      *(double *)&v203[10] = v64;
      *(_WORD *)&v203[18] = 2080;
      *(void *)&v203[20] = "uncDueToWeather";
      *(_WORD *)&v203[28] = 2048;
      *(double *)&v203[30] = v75;
      *(_WORD *)&v203[38] = 2080;
      v204 = "aveRateInSec";
      __int16 v205 = 2048;
      double v206 = v81 * 0.000277777785;
      __int16 v207 = 2080;
      v208 = "uncSquare";
      __int16 v209 = 2048;
      double v210 = v82 * v82;
      _os_log_send_and_compose_impl( 2LL,  0LL,  v211,  1628LL,  &_mh_execute_header,  v80,  0LL,  "uncertainty term,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f",  v201,  158,  v127,  v128,  v130,  v131,  v133,  v135,  v137,  v139,  v141,  v143,  v145,  v147,  v149,  v151);
      v84 = (uint8_t *)v83;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]",  "%s\n",  v83);
      if (v84 != v211) {
        free(v84);
      }
    }

    else
    {
      double v76 = v74;
    }

    objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", v38), "uncertainty");
    double v78 = v77 * v77 + v76 + v75;
    if (v78 < v164)
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      v79 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v211 = 136315906;
        v212 = "index";
        __int16 v213 = 1024;
        *(_DWORD *)v214 = v38;
        *(_WORD *)&v214[4] = 2080;
        *(void *)&v214[6] = "minUncSquare";
        *(_WORD *)&v214[14] = 2048;
        *(double *)&v214[16] = v78;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "minimum unc,%s,%d,%s,%f", v211, 0x26u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(v211, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        *(_DWORD *)v201 = 136315906;
        *(void *)&v201[4] = "index";
        *(_WORD *)&v201[12] = 1024;
        *(_DWORD *)&v201[14] = v38;
        *(_WORD *)&v201[18] = 2080;
        *(void *)&v201[20] = "minUncSquare";
        *(_WORD *)&v201[28] = 2048;
        *(double *)&v201[30] = v78;
        _os_log_send_and_compose_impl( 2LL,  0LL,  v211,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "minimum unc,%s,%d,%s,%f",  v201,  38,  v127,  v128);
        v86 = (uint8_t *)v85;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]",  "%s\n",  v85);
        if (v86 != v211) {
          free(v86);
        }
      }

      double v164 = v78;
    }

    ++v38;
  }

  while (v38 != v157);
  if (v157 < 15) {
    goto LABEL_61;
  }
LABEL_63:
  sub_10100629C((uint64_t)v182, (uint64_t)buf);
  for (int64_t j = 0LL; j != 15; ++j)
  {
    if (j >= v14)
    {
      *(void *)sub_1010065D0((uint64_t)v201, j) = 0LL;
      double v97 = 0.0;
    }

    else
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", j), "timestamp");
      double v90 = v89;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", j), "pressureMeasurement");
      double v92 = v91;
      double v93 = exp(v36 * -((v90 * -0.000277777785 + v165 * 0.000277777785) * (v90 * -0.000277777785 + v165 * 0.000277777785)));
      *(double *)sub_1010065D0((uint64_t)v201, j) = v37 * v93;
      double v94 = exp(v36 * -((v184 / 1000.0 - v92 / 1000.0) * (v184 / 1000.0 - v92 / 1000.0)));
      v95 = (double *)sub_1010065D0((uint64_t)v201, j);
      double *v95 = *v95 + v37 * v94;
      objc_msgSend(objc_msgSend(a4, "objectAtIndexedSubscript:", j), "meanSeaLevelPressure");
      double v97 = v96 - v163;
    }

    *(double *)sub_1010065D0((uint64_t)v173, j) = v97;
  }

  __int128 v174 = *(_OWORD *)v201;
  __int128 v175 = *(_OWORD *)&v201[16];
  __int128 v176 = *(_OWORD *)&v201[32];
  __int128 v177 = *(_OWORD *)v202;
  __int128 v178 = *(_OWORD *)&v202[16];
  __int128 v179 = *(_OWORD *)v203;
  __int128 v180 = *(_OWORD *)&v203[16];
  double v181 = *(double *)&v203[32];
  sub_1010067A8((uint64_t)v182, (uint64_t)&v174);
  double v98 = v181;
  double v146 = *((double *)&v180 + 1);
  double v148 = *(double *)&v180;
  double v150 = *((double *)&v179 + 1);
  double v152 = *(double *)&v179;
  double v153 = *((double *)&v178 + 1);
  double v154 = *(double *)&v178;
  double v155 = *((double *)&v177 + 1);
  double v156 = *(double *)&v177;
  double v158 = *((double *)&v176 + 1);
  double v160 = *(double *)&v176;
  double v162 = *((double *)&v175 + 1);
  double v166 = *(double *)&v175;
  double v168 = *((double *)&v174 + 1);
  double v170 = *(double *)&v174;
  double v142 = *(double *)&v201[8];
  double v144 = *(double *)v201;
  double v138 = *(double *)&v201[24];
  double v140 = *(double *)&v201[16];
  v134 = *(const char **)&v201[40];
  double v136 = *(double *)&v201[32];
  __int128 v99 = *(_OWORD *)v202;
  double v132 = *(double *)v202;
  double v129 = *(double *)&v202[16];
  double v100 = *(double *)&v202[24];
  __int128 v101 = *(_OWORD *)v203;
  double v102 = *(double *)&v203[16];
  double v103 = *(double *)&v203[24];
  double v104 = *(double *)&v203[32];
  objc_msgSend( a3,  "setMeanSeaLevelPressure:",  &v203[32],  v163 + v181 * v173[14] + 0.0 + *((double *)&v180 + 1) * v173[13] + *(double *)&v180 * v173[12] + *((double *)&v179 + 1) * v173[11] + *(double *)&v179 * v173[10] + *((double *)&v178 + 1) * v173[9] + *(double *)&v178 * v173[8] + *((double *)&v177 + 1) * v173[7] + *(double *)&v177 * v173[6] + *((double *)&v176 + 1) * v173[5] + *(double *)&v176 * v173[4] + *((double *)&v175 + 1) * v173[3] + *(double *)&v175 * v173[2] + *((double *)&v174 + 1) * v173[1] + *(double *)&v174 * v173[0]);
  double v105 = v164 + v37 * 2.0;
  double v106 = v98 * v104
       + 0.0
       + v146 * v103
       + v148 * v102
       + v150 * *((double *)&v101 + 1)
       + v152 * *(double *)&v101
       + v153 * v100
       + v154 * v129
       + v155 * *((double *)&v99 + 1)
       + v156 * v132
       + v158 * *(double *)&v134
       + v160 * v136
       + v162 * v138
       + v166 * v140
       + v168 * v142
       + v170 * v144;
  if (v105 <= v106)
  {
    [a3 setUncertainty:sqrt(v105)];
  }

  else
  {
    [a3 setUncertainty:sqrt(v105 - v106)];
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    v107 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      [a3 uncertainty];
      uint64_t v109 = v108;
      [a3 meanSeaLevelPressure];
      *(_DWORD *)v211 = 136316930;
      v212 = "uncertainty";
      __int16 v213 = 2048;
      *(void *)v214 = v109;
      *(_WORD *)&v214[8] = 2080;
      *(void *)&v214[10] = "mslp";
      *(_WORD *)&v214[18] = 2048;
      *(void *)&v214[20] = v110;
      *(_WORD *)&v214[28] = 2080;
      *(void *)&v214[30] = "queriedAprioriVerticalScale";
      *(_WORD *)&v214[38] = 2048;
      *(double *)&v214[40] = v105;
      *(_WORD *)&v214[48] = 2080;
      *(void *)&v214[50] = "uncertaintyUpdate";
      *(_WORD *)&v214[58] = 2048;
      *(double *)&v214[60] = v106;
      _os_log_impl( (void *)&_mh_execute_header,  v107,  OS_LOG_TYPE_DEFAULT,  "query information,%s,%f,%s,%f,%s,%f,%s,%f",  v211,  0x52u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(v211, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      uint64_t v111 = qword_1019346A8;
      [a3 uncertainty];
      uint64_t v113 = v112;
      [a3 meanSeaLevelPressure];
      int v185 = 136316930;
      v186 = "uncertainty";
      __int16 v187 = 2048;
      uint64_t v188 = v113;
      __int16 v189 = 2080;
      v190 = "mslp";
      __int16 v191 = 2048;
      uint64_t v192 = v114;
      __int16 v193 = 2080;
      v194 = "queriedAprioriVerticalScale";
      __int16 v195 = 2048;
      double v196 = v105;
      __int16 v197 = 2080;
      v198 = "uncertaintyUpdate";
      __int16 v199 = 2048;
      double v200 = v106;
      LODWORD(v126) = 82;
      _os_log_send_and_compose_impl( 2LL,  0LL,  v211,  1628LL,  &_mh_execute_header,  v111,  0LL,  "query information,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v185,  v126,  v127,  v129,  *((const char **)&v99 + 1),  v132,  v134,  v136);
      v116 = (uint8_t *)v115;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator gaussianProcess:withMslpArray:withType:]",  "%s\n",  v115);
      if (v116 != v211) {
        free(v116);
      }
    }
  }

  [a3 meanSeaLevelPressure];
  [a3 uncertainty];
  [a3 meanSeaLevelPressure];
  if (v117 <= 115000.0 && ([a3 meanSeaLevelPressure], v118 >= 80000.0))
  {
    sub_1010DDBC0(__p, "extrapolate or interpolate the mean sea level pressure:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:]( self,  "printMeanSeaLevelPressureElement:withPrePhrase:",  a3,  __p);
    if (v172 < 0) {
      operator delete(__p[0]);
    }
    return 1;
  }

  else
  {
    [a3 setMeanSeaLevelPressure:101325.0];
    [a3 setUncertainty:6000.0];
    return 0;
  }

- (BOOL)getLastPressureSample:(double *)a3
{
  if (!v24)
  {
LABEL_16:
    BOOL v15 = 0;
    goto LABEL_23;
  }

  unsigned int v5 = *(std::__shared_weak_count **)(*(void *)(v22 + (((unint64_t)(v24 + v23 - 1) >> 5) & 0x7FFFFFFFFFFFFF8LL))
  if (*((void *)&v4 + 1))
  {
    id v6 = (unint64_t *)(*((void *)&v4 + 1) + 8LL);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  uint64_t v8 = v4;
  double v9 = *(double *)v4;
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  double v11 = vabdd_f64(v9, Current);
  double v12 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "time difference from the last pressure,sample,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    int v25 = 134217984;
    double v26 = v11;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  2LL,  "time difference from the last pressure,sample,%f",  COERCE_DOUBLE(&v25));
    double v20 = (uint8_t *)v19;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMeanSeaLevelPressureEstimator getLastPressureSample:]", "%s\n", v19);
    if (v20 != buf) {
      free(v20);
    }
  }

  if (v11 > 720.0)
  {
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        unint64_t v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }

    goto LABEL_16;
  }

  *a3 = *(double *)(v8 + 8) * 1000.0;
  if (v5)
  {
    uint64_t v16 = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  BOOL v15 = 1;
LABEL_23:
  sub_10049108C(&v21);
  return v15;
}

- (void)getMslpDriftRate:(double *)a3 withLastMslp:(double)a4
{
  if (-[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v11))
  {
    double v6 = v11;
  }

  else
  {
    double v11 = a4;
    double v6 = a4;
  }

  float v7 = v6;
  BOOL v8 = sub_100FADFE8(v7, 101320.0) < 3000.0;
  double v9 = 180.0;
  if (v8) {
    double v9 = 100.0;
  }
  double v10 = v9 * a4 / v11;
  if (*a3 > v10) {
    double v10 = *a3;
  }
  *a3 = v10;
}

- (void)refreshHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4
{
  if (!-[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v19)) {
    double v19 = 101325.0;
  }
  if (self->_inVisitStatus && (float v7 = v19, sub_100FADFE8(v7, 101320.0) < 3000.0))
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    BOOL v8 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "refresh withdrawn due to in-visit.", buf, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "refresh withdrawn due to in-visit.",  &v20,  2);
LABEL_32:
      double v12 = (uint8_t *)v9;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]",  "%s\n",  v9);
      if (v12 != buf) {
        free(v12);
      }
    }
  }

  else if (self->_lastRefreshTimestamp == 1.79769313e308 {
         || CFAbsoluteTimeGetCurrent() - self->_lastRefreshTimestamp >= self->_rateToRefreshHistoricalMeanSeaLevelPressure)
  }
  {
    if (-[CLContextManagerElevationProfileBase registeredXPCTaskMSLP]( self->_elevationProfileContextManager,  "registeredXPCTaskMSLP"))
    {
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      double v11 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "delay registration of XPC task for mslp estimation",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        LOWORD(v20) = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "delay registration of XPC task for mslp estimation",  &v20,  2);
        goto LABEL_32;
      }
    }

    else
    {
      self->_lastRefreshTimestamp = CFAbsoluteTimeGetCurrent();
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      int v13 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v25 = a3;
        __int16 v26 = 2048;
        double v27 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "calling refreshing mean sea level pressure,startTimestamp,%f,endTimestamp,%f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        int v20 = 134218240;
        double v21 = a3;
        __int16 v22 = 2048;
        double v23 = a4;
        LODWORD(v17) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "calling refreshing mean sea level pressure,startTimestamp,%f,endTimestamp,%f",  COERCE_DOUBLE(&v20),  v17);
        uint64_t v16 = (uint8_t *)v15;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:]",  "%s\n",  v15);
        if (v16 != buf) {
          free(v16);
        }
      }

      elevationProfileContextManager = self->_elevationProfileContextManager;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1010073B4;
      v18[3] = &unk_101894300;
      v18[4] = self;
      *(double *)&v18[5] = a4;
      *(double *)&v18[6] = a3;
      -[CLContextManagerElevationProfileBase getHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:]( elevationProfileContextManager,  "getHistoricalMeanSeaLevelPressureWithStartTime:andEndTime:andCompletionBlock:",  v18,  a3,  a4);
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    double v10 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "refresh withdrawn due to the last refresh event is finished within the past 30 mins.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      LOWORD(v20) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "refresh withdrawn due to the last refresh event is finished within the past 30 mins.",  &v20,  2);
      goto LABEL_32;
    }
  }

- (void)sentRefreshMslpAnalyticsWithAltitudeCorrection:(double)a3 uncertaintyBeforeCurrentRefresh:(double)a4 uncertaintyAfterCurrentRefresh:(double)a5 refreshDuration:(double)a6 xpcWaitingTime:(double)a7 timeDiffBtwRefresh:(double)a8 pressureDelta:(double)a9
{
  if (self->_latitudeAfterRefresh != 1.79769313e308)
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    double v17 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double latitudeAfterRefresh = self->_latitudeAfterRefresh;
      double longitudeAfterRefresh = self->_longitudeAfterRefresh;
      double currentLatitude = self->_currentLatitude;
      double currentLongitude = self->_currentLongitude;
      *(_DWORD *)buf = 134218752;
      double v117 = *(const char **)&latitudeAfterRefresh;
      __int16 v118 = 2048;
      double v119 = longitudeAfterRefresh;
      __int16 v120 = 2048;
      uint64_t v121 = *(const char **)&currentLatitude;
      __int16 v122 = 2048;
      double v123 = currentLongitude;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "refresh traveling distance location,lastLat,%f,lastLon,%f,currLat,%f,currLon,%f",  buf,  0x2Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      double v31 = self->_latitudeAfterRefresh;
      double v32 = self->_longitudeAfterRefresh;
      double v33 = self->_currentLatitude;
      double v34 = self->_currentLongitude;
      int v60 = 134218752;
      double v61 = *(const char **)&v31;
      __int16 v62 = 2048;
      double v63 = v32;
      __int16 v64 = 2048;
      double v65 = *(const char **)&v33;
      __int16 v66 = 2048;
      double v67 = v34;
      LODWORD(v45) = 42;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "refresh traveling distance location,lastLat,%f,lastLon,%f,currLat,%f,currLon,%f",  COERCE_DOUBLE(&v60),  v45,  *(double *)&v46,  *(double *)&v47);
      double v36 = (uint8_t *)v35;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator sentRefreshMslpAnalyticsWithAltitudeCorrection:uncertaintyBeforeCurrentRefresh :uncertaintyAfterCurrentRefresh:refreshDuration:xpcWaitingTime:timeDiffBtwRefresh:pressureDelta:]",  "%s\n",  v35);
      if (v36 != buf) {
        free(v36);
      }
    }

    double v22 = sub_100D2EC74( self->_latitudeAfterRefresh,  self->_longitudeAfterRefresh,  self->_currentLatitude,  self->_currentLongitude);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    double v23 = fabs(v22);
    uint64_t v24 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = self->_maxPressure - self->_minPressure;
      int numberOfRebaseBtwRefresh = self->_numberOfRebaseBtwRefresh;
      int numberOfTrackEndedBtwRefresh = self->_numberOfTrackEndedBtwRefresh;
      int numberOfWeatherUpdate = self->_numberOfWeatherUpdate;
      double uncertaintyAfterRefresh = self->_uncertaintyAfterRefresh;
      BOOL firstRefreshAfterVisit = self->_firstRefreshAfterVisit;
      *(_DWORD *)buf = 136322050;
      double v117 = "altitudeCorrection";
      __int16 v118 = 2048;
      double v119 = a3;
      __int16 v120 = 2080;
      uint64_t v121 = "minMaxPressureDelta";
      __int16 v122 = 2048;
      double v123 = v25;
      __int16 v124 = 2080;
      v125 = "pressureDelta";
      __int16 v126 = 2048;
      double v127 = a9;
      __int16 v128 = 2080;
      double v129 = "numberOfRebase";
      __int16 v130 = 1024;
      int v131 = numberOfRebaseBtwRefresh;
      __int16 v132 = 2080;
      v133 = "numberOfTrackEnded";
      __int16 v134 = 1024;
      int v135 = numberOfTrackEndedBtwRefresh;
      __int16 v136 = 2080;
      v137 = "numberOfWeatherUpdate";
      __int16 v138 = 1024;
      int v139 = numberOfWeatherUpdate;
      __int16 v140 = 2080;
      v141 = "refreshDuration";
      __int16 v142 = 2048;
      double v143 = a6;
      __int16 v144 = 2080;
      v145 = "timeDiffBtwRefresh";
      __int16 v146 = 2048;
      double v147 = a8;
      __int16 v148 = 2080;
      v149 = "travelingDistance";
      __int16 v150 = 2048;
      double v151 = v23;
      __int16 v152 = 2080;
      double v153 = "uncertaintyAfterFormerRefresh";
      __int16 v154 = 2048;
      double v155 = uncertaintyAfterRefresh;
      __int16 v156 = 2080;
      int v157 = "uncertaintyAfterLatterRefresh";
      __int16 v158 = 2048;
      double v159 = a5;
      __int16 v160 = 2080;
      v161 = "uncertaintyBeforeLatterRefresh";
      __int16 v162 = 2048;
      double v163 = a4;
      __int16 v164 = 2080;
      double v165 = "xpcWaitingTime";
      __int16 v166 = 2048;
      double v167 = a7;
      __int16 v168 = 2080;
      float v169 = "firstRefreshAfterVisit";
      __int16 v170 = 1024;
      BOOL v171 = firstRefreshAfterVisit;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "sent refresh mslp event to CoreAnalytics,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d",  buf,  0x10Au);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      double v37 = self->_maxPressure - self->_minPressure;
      int v38 = self->_numberOfRebaseBtwRefresh;
      int v39 = self->_numberOfTrackEndedBtwRefresh;
      int v40 = self->_numberOfWeatherUpdate;
      double v41 = self->_uncertaintyAfterRefresh;
      BOOL v42 = self->_firstRefreshAfterVisit;
      int v60 = 136322050;
      double v61 = "altitudeCorrection";
      __int16 v62 = 2048;
      double v63 = a3;
      __int16 v64 = 2080;
      double v65 = "minMaxPressureDelta";
      __int16 v66 = 2048;
      double v67 = v37;
      __int16 v68 = 2080;
      double v69 = "pressureDelta";
      __int16 v70 = 2048;
      double v71 = a9;
      __int16 v72 = 2080;
      double v73 = "numberOfRebase";
      __int16 v74 = 1024;
      int v75 = v38;
      __int16 v76 = 2080;
      double v77 = "numberOfTrackEnded";
      __int16 v78 = 1024;
      int v79 = v39;
      __int16 v80 = 2080;
      double v81 = "numberOfWeatherUpdate";
      __int16 v82 = 1024;
      int v83 = v40;
      __int16 v84 = 2080;
      v85 = "refreshDuration";
      __int16 v86 = 2048;
      double v87 = a6;
      __int16 v88 = 2080;
      double v89 = "timeDiffBtwRefresh";
      __int16 v90 = 2048;
      double v91 = a8;
      __int16 v92 = 2080;
      double v93 = "travelingDistance";
      __int16 v94 = 2048;
      double v95 = v23;
      __int16 v96 = 2080;
      double v97 = "uncertaintyAfterFormerRefresh";
      __int16 v98 = 2048;
      double v99 = v41;
      __int16 v100 = 2080;
      __int128 v101 = "uncertaintyAfterLatterRefresh";
      __int16 v102 = 2048;
      double v103 = a5;
      __int16 v104 = 2080;
      double v105 = "uncertaintyBeforeLatterRefresh";
      __int16 v106 = 2048;
      double v107 = a4;
      __int16 v108 = 2080;
      uint64_t v109 = "xpcWaitingTime";
      __int16 v110 = 2048;
      double v111 = a7;
      __int16 v112 = 2080;
      uint64_t v113 = "firstRefreshAfterVisit";
      __int16 v114 = 1024;
      BOOL v115 = v42;
      LODWORD(v45) = 266;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "sent refresh mslp event to CoreAnalytics,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d",  (const char *)&v60,  v45,  v46,  *(double *)&v47,  (const char *)v48,  *(double *)&v49,  v50,  (_DWORD)v51,  *(const char **)&v52,  LODWORD(v53),  *(const char **)&v54,  LODWORD(v55),  *(const char **)&v56,  v57,  *(const char **)&v58,  v59);
      double v44 = (uint8_t *)v43;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator sentRefreshMslpAnalyticsWithAltitudeCorrection:uncertaintyBeforeCurrentRefresh :uncertaintyAfterCurrentRefresh:refreshDuration:xpcWaitingTime:timeDiffBtwRefresh:pressureDelta:]",  "%s\n",  v43);
      if (v44 != buf) {
        free(v44);
      }
    }

    double v47 = _NSConcreteStackBlock;
    uint64_t v48 = 3221225472LL;
    double v49 = sub_1010083B8;
    double v50 = (const char *)&unk_101894328;
    double v51 = self;
    double v52 = a3;
    double v53 = a9;
    double v54 = a6;
    double v55 = a8;
    double v56 = v23;
    double v57 = a5;
    double v58 = a4;
    double v59 = a7;
    AnalyticsSendEventLazy(@"com.apple.Motion.Altimeter.RefreshMslp", &v47);
  }

- (void)getAndSendCurrentEstimateMeanSeaLevelPressureFrom:(int)a3
{
  uint64_t v3 = *(void *)&a3;

  self->_currentEstimateMslp = (CLMeanSeaLevelPressureData *) -[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]( self,  "getEstimatedMeanSeaLevelPressure");
  -[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:]( self,  "updateUncertinatyAndSendCurrentEstimateMslpFrom:",  v3);
}

- (void)updateUncertinatyAndSendCurrentEstimateMslpFrom:(int)a3
{
  if (self->_inVisitStatus)
  {
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
    if (v5 != 1.79769313e308)
    {
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      if (v6 != 1.79769313e308)
      {
        -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
        double v8 = v7;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
        double v10 = v9;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        double v12 = vabdd_f64(v10, v11);
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        double v14 = v12 + v13;
        if (v14 >= v8) {
          double v14 = v8;
        }
        -[CLMeanSeaLevelPressureData setUncertainty:](self->_currentEstimateMslp, "setUncertainty:", v14);
      }
    }
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  BOOL v15 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
    uint64_t v17 = v16;
    -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
    uint64_t v19 = v18;
    -[CLMeanSeaLevelPressureData timestamp](self->_currentEstimateMslp, "timestamp");
    *(_DWORD *)buf = 136316930;
    double v52 = "meanSeaLevelPressure";
    __int16 v53 = 2048;
    uint64_t v54 = v17;
    __int16 v55 = 2080;
    double v56 = "uncertainty";
    __int16 v57 = 2048;
    uint64_t v58 = v19;
    __int16 v59 = 2080;
    int v60 = "timestamp";
    __int16 v61 = 2048;
    uint64_t v62 = v20;
    __int16 v63 = 2080;
    __int16 v64 = "resetInVisitReference";
    __int16 v65 = 1024;
    BOOL v66 = a3 != 1;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "current estimate mean sea level pressure sent to AOP,%s,%f,%s,%f,%s,%f,%s,%d",  buf,  0x4Eu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v26 = qword_1019346A8;
    -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
    uint64_t v28 = v27;
    -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
    uint64_t v30 = v29;
    -[CLMeanSeaLevelPressureData timestamp](self->_currentEstimateMslp, "timestamp");
    int v35 = 136316930;
    double v36 = "meanSeaLevelPressure";
    __int16 v37 = 2048;
    uint64_t v38 = v28;
    __int16 v39 = 2080;
    int v40 = "uncertainty";
    __int16 v41 = 2048;
    uint64_t v42 = v30;
    __int16 v43 = 2080;
    double v44 = "timestamp";
    __int16 v45 = 2048;
    uint64_t v46 = v31;
    __int16 v47 = 2080;
    uint64_t v48 = "resetInVisitReference";
    __int16 v49 = 1024;
    BOOL v50 = a3 != 1;
    LODWORD(v34) = 78;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v26,  0LL,  "current estimate mean sea level pressure sent to AOP,%s,%f,%s,%f,%s,%f,%s,%d",  (const char *)&v35,  v34);
    double v33 = (uint8_t *)v32;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:]",  "%s\n",  v32);
    if (v33 != buf) {
      free(v33);
    }
  }

  uint64_t v21 = sub_1008FA854(0);
  -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_currentEstimateMslp, "meanSeaLevelPressure");
  float v23 = v22;
  -[CLMeanSeaLevelPressureData uncertainty](self->_currentEstimateMslp, "uncertainty");
  float v25 = v24;
  (*(void (**)(uint64_t, BOOL, float, float))(*(void *)(v21 + 112) + 64LL))(v21 + 112, a3 != 1, v23, v25);
}

- (void)getLastHistoricalMeanSeaLevelPressureData:(double *)a3
{
  if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
  {
    objc_msgSend(-[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject"), "timestamp");
    *(void *)a3 = v5;
    id v6 = -[NSMutableArray lastObject](self->_meanSeaLevelPressureArray, "lastObject");
    sub_1010DDBC0(__p, "get last mean sea level pressure");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureElement:withPrePhrase:]( self,  "printMeanSeaLevelPressureElement:withPrePhrase:",  v6,  __p);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
  }

- (void)cleanHistoricalMslpArrayForForceRebase:(id)a3
{
  uint64_t v4 = 0x7FEFFFFFFFFFFFFFLL;
  if (-[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:", a3)
    && -[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v4))
  {
    if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count")) {
      -[NSMutableArray removeAllObjects](self->_meanSeaLevelPressureArray, "removeAllObjects");
    }
    if (-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count")) {
      -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");
    }
    -[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist]( self,  "clearMeanSeaLevelPressureArrayInPlist");
    self->_cumulativeStartTime = 1.79769313e308;
  }

- (BOOL)isValidMslp:(id)a3
{
  if (v4 > 6000.0) {
    objc_msgSend(a3, "setUncertainty:");
  }
  [a3 timestamp];
  if (v5 == 1.79769313e308) {
    return 0;
  }
  [a3 meanSeaLevelPressure];
  if (v6 > 115000.0) {
    return 0;
  }
  [a3 meanSeaLevelPressure];
  if (v7 < 80000.0) {
    return 0;
  }
  [a3 uncertainty];
  return v9 > 0.0;
}

- (BOOL)updateHistoricalMslpArray:(id)a3 from:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v103 = 1.79769313e308;
  unsigned int v7 = -[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:");
  if (!v7) {
    return v7;
  }
  unsigned int v7 = -[CLMeanSeaLevelPressureEstimator getLastPressureSample:](self, "getLastPressureSample:", &v103);
  if (!v7) {
    return v7;
  }
  if (self->_cumulativeStartTime == 1.79769313e308
    || ([a3 timestamp], v8 - self->_cumulativeStartTime > 0.0))
  {
    [a3 setPressureMeasurement:v103];
    if (!(_DWORD)v4 && self->_inVisitStatus) {
      -[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp](self, "resetInVisitRebasedMslp");
    }
    double Current = CFAbsoluteTimeGetCurrent();
    int v10 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
    id v92 = -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count");
    if (self->_cumulativeStartTime == 1.79769313e308)
    {
      if ((int)v92 < 1)
      {
LABEL_49:
        [a3 timestamp];
        self->_double cumulativeStartTime = v50;
        goto LABEL_50;
      }

      objc_msgSend(-[NSMutableArray firstObject](self->_recentMeanSeaLevelPressureArray, "firstObject"), "timestamp");
      self->_double cumulativeStartTime = v11;
    }

    else if ((int)v92 < 1)
    {
      goto LABEL_50;
    }

    [a3 timestamp];
    if (v20 - self->_cumulativeStartTime > 900.0)
    {
      if (v10 >= 15)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_meanSeaLevelPressureArray, "removeObjectAtIndex:", 0LL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v21 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v124 = "mslpArrayCount";
          __int16 v125 = 1024;
          *(_DWORD *)__int16 v126 = v10 - 1;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "remove the oldest mean sea level pressure,%s,%d",  buf,  0x12u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_101894348);
          }
          int v104 = 136315394;
          double v105 = "mslpArrayCount";
          __int16 v106 = 1024;
          *(_DWORD *)double v107 = v10 - 1;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "remove the oldest mean sea level pressure,%s,%d",  (const char *)&v104,  18);
          __int16 v88 = (uint8_t *)v87;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]",  "%s\n",  v87);
          if (v88 != buf) {
            free(v88);
          }
        }
      }

      double v22 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
      id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( recentMeanSeaLevelPressureArray,  "countByEnumeratingWithState:objects:count:",  &v99,  v122,  16LL);
      if (v24)
      {
        uint64_t v25 = *(void *)v100;
        double v26 = 0.0;
        double v27 = 0.0;
        double v28 = 0.0;
        double v29 = 0.0;
        do
        {
          for (unint64_t i = 0LL; i != v24; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v100 != v25) {
              objc_enumerationMutation(recentMeanSeaLevelPressureArray);
            }
            uint64_t v31 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
            [v31 timestamp];
            double v33 = v32;
            [v31 meanSeaLevelPressure];
            double v35 = v34;
            [v31 uncertainty];
            double v37 = v36;
            [v31 pressureMeasurement];
            double v29 = v29 + v33;
            double v28 = v28 + v35;
            double v27 = v27 + v37;
            double v26 = v26 + v38;
          }

          id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( recentMeanSeaLevelPressureArray,  "countByEnumeratingWithState:objects:count:",  &v99,  v122,  16LL);
        }

        while (v24);
      }

      else
      {
        double v26 = 0.0;
        double v27 = 0.0;
        double v28 = 0.0;
        double v29 = 0.0;
      }

      -[CLMeanSeaLevelPressureData setTimestamp:]( v22,  "setTimestamp:",  v29 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:]( v22,  "setMeanSeaLevelPressure:",  v28 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[CLMeanSeaLevelPressureData setUncertainty:]( v22,  "setUncertainty:",  v27 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[CLMeanSeaLevelPressureData setPressureMeasurement:]( v22,  "setPressureMeasurement:",  v26 / (double)(unint64_t)-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"));
      -[NSMutableArray addObject:](self->_meanSeaLevelPressureArray, "addObject:", v22);
      double lastTimestampSavedMslpForRecovery = self->_lastTimestampSavedMslpForRecovery;
      if (lastTimestampSavedMslpForRecovery == 1.79769313e308
        || vabdd_f64(Current, lastTimestampSavedMslpForRecovery) > 180.0)
      {
        -[CLMeanSeaLevelPressureEstimator saveMeanSeaLevelPressureArrayToPlist]( self,  "saveMeanSeaLevelPressureArrayToPlist");
      }

      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      int v40 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v41 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v22, "meanSeaLevelPressure");
        uint64_t v43 = v42;
        -[CLMeanSeaLevelPressureData uncertainty](v22, "uncertainty");
        uint64_t v45 = v44;
        -[CLMeanSeaLevelPressureData timestamp](v22, "timestamp");
        uint64_t v47 = v46;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v22, "pressureMeasurement");
        *(_DWORD *)buf = 136317442;
        __int16 v124 = "count";
        __int16 v125 = 1024;
        *(_DWORD *)__int16 v126 = v41;
        *(_WORD *)&v126[4] = 2080;
        *(void *)&v126[6] = "meanSeaLevelPressure";
        __int16 v127 = 2048;
        uint64_t v128 = v43;
        __int16 v129 = 2080;
        __int16 v130 = "uncertainty";
        __int16 v131 = 2048;
        uint64_t v132 = v45;
        __int16 v133 = 2080;
        __int16 v134 = "timestamp";
        __int16 v135 = 2048;
        uint64_t v136 = v47;
        __int16 v137 = 2080;
        __int16 v138 = "measurePressure";
        __int16 v139 = 2048;
        uint64_t v140 = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "add mslp to mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f",  buf,  0x62u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v76 = qword_1019346A8;
        unsigned int v77 = -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](v22, "meanSeaLevelPressure");
        uint64_t v79 = v78;
        -[CLMeanSeaLevelPressureData uncertainty](v22, "uncertainty");
        uint64_t v81 = v80;
        -[CLMeanSeaLevelPressureData timestamp](v22, "timestamp");
        uint64_t v83 = v82;
        -[CLMeanSeaLevelPressureData pressureMeasurement](v22, "pressureMeasurement");
        int v104 = 136317442;
        double v105 = "count";
        __int16 v106 = 1024;
        *(_DWORD *)double v107 = v77;
        *(_WORD *)&v107[4] = 2080;
        *(void *)&v107[6] = "meanSeaLevelPressure";
        __int16 v108 = 2048;
        uint64_t v109 = v79;
        __int16 v110 = 2080;
        double v111 = "uncertainty";
        __int16 v112 = 2048;
        uint64_t v113 = v81;
        __int16 v114 = 2080;
        BOOL v115 = "timestamp";
        __int16 v116 = 2048;
        uint64_t v117 = v83;
        __int16 v118 = 2080;
        double v119 = "measurePressure";
        __int16 v120 = 2048;
        uint64_t v121 = v84;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v76,  0LL,  "add mslp to mslp array,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f",  (const char *)&v104,  98,  v91,  *(double *)&v92,  (const char *)v93,  v94,  v95,  *(double *)&__p,  v97,  v98);
        __int16 v86 = (uint8_t *)v85;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]",  "%s\n",  v85);
        if (v86 != buf) {
          free(v86);
        }
      }

      meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
      sub_1010DDBC0(&__p, "mean sea level pressure array updates to:");
      -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( self,  "printMeanSeaLevelPressureArray:withPrePhrase:",  meanSeaLevelPressureArray,  &__p);
      if (SHIBYTE(v98) < 0) {
        operator delete(__p);
      }
      -[NSMutableArray removeAllObjects](self->_recentMeanSeaLevelPressureArray, "removeAllObjects");

      goto LABEL_49;
    }

- (void)updateInVisitRebasedMslp:(id)a3
{
  if (-[CLMeanSeaLevelPressureEstimator isValidMslp:](self, "isValidMslp:"))
  {
    [a3 meanSeaLevelPressure];
    -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](self->_inVisitRebasedMslp, "setMeanSeaLevelPressure:");
    [a3 uncertainty];
    -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:");
    [a3 timestamp];
    -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:");
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    double v5 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
      uint64_t v7 = v6;
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      uint64_t v9 = v8;
      -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
      *(_DWORD *)buf = 134218496;
      uint64_t v27 = v7;
      __int16 v28 = 2048;
      uint64_t v29 = v9;
      __int16 v30 = 2048;
      uint64_t v31 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "in visit rebased location mean sea level pressure sample,meanSeaLevelPressure,%f,uncertainty,%f,timestamp,%f",  buf,  0x20u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      uint64_t v11 = qword_1019346A8;
      -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
      uint64_t v13 = v12;
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      uint64_t v15 = v14;
      -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
      int v20 = 134218496;
      uint64_t v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = v16;
      LODWORD(v19) = 32;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  0LL,  "in visit rebased location mean sea level pressure sample,meanSeaLevelPressure,%f,uncertainty,%f,timestamp,%f",  COERCE_DOUBLE(&v20),  v19);
      uint64_t v18 = (uint8_t *)v17;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMeanSeaLevelPressureEstimator updateInVisitRebasedMslp:]", "%s\n", v17);
      if (v18 != buf) {
        free(v18);
      }
    }

    -[CLMeanSeaLevelPressureEstimator saveInVisitRebasedMslpToPlist](self, "saveInVisitRebasedMslpToPlist");
  }

- (void)writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:(double)a3
{
  if (self->_logInitialHistoricalMeanSeaLevelPressure
    && -[NSMutableArray count](self->_meanSeaLevelPressureArray, "count"))
  {
    sub_101125260(v22);
    v24 |= 1u;
    *(double *)&v22[77] = a3;
    sub_10113A1A0(v22);
    double v5 = (char *)-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count");
    sub_1000071F0(&v20, (unint64_t)v5);
    sub_1000071F0(&v18, (unint64_t)v5);
    sub_1000071F0(&__p, (unint64_t)v5);
    if (v5)
    {
      for (unint64_t i = 0LL; i != v5; ++i)
      {
        objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:](self->_meanSeaLevelPressureArray, "objectAtIndexedSubscript:", i),  "timestamp");
        *((void *)v20 + (void)i) = v7;
        objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:](self->_meanSeaLevelPressureArray, "objectAtIndexedSubscript:", i),  "meanSeaLevelPressure");
        *((void *)v18 + (void)i) = v8;
        objc_msgSend( -[NSMutableArray objectAtIndexedSubscript:](self->_meanSeaLevelPressureArray, "objectAtIndexedSubscript:", i),  "uncertainty");
        *((void *)__p + (void)i) = v9;
      }
    }

    uint64_t v10 = v23;
    if ((void **)(v23 + 32) != &v20)
    {
      sub_1000F9040((char *)(v23 + 32), (char *)v20, (uint64_t)v21, (v21 - (_BYTE *)v20) >> 3);
      uint64_t v10 = v23;
    }

    if ((void **)(v10 + 8) != &v18)
    {
      sub_1000F9040((char *)(v10 + 8), (char *)v18, (uint64_t)v19, (v19 - (_BYTE *)v18) >> 3);
      uint64_t v10 = v23;
    }

    if ((void **)(v10 + 56) != &__p)
    {
      sub_1000F9040((char *)(v10 + 56), (char *)__p, (uint64_t)v17, (v17 - (_BYTE *)__p) >> 3);
      uint64_t v10 = v23;
    }

    double lastRefreshTimestamp = self->_lastRefreshTimestamp;
    *(_BYTE *)(v10 + 88) |= 1u;
    *(double *)(v10 + 80) = lastRefreshTimestamp;
    if (qword_1019A1D00 != -1) {
      dispatch_once(&qword_1019A1D00, &stru_101894368);
    }
    if (qword_1019A1D08) {
      sub_1011CF3D0(qword_1019A1D08, (uint64_t)v22);
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v12 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "write initial mean sea level pressure array to msl.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      v15[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "write initial mean sea level pressure array to msl.",  v15,  2);
      uint64_t v14 = (uint8_t *)v13;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:]",  "%s\n",  v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    if (__p)
    {
      uint64_t v17 = __p;
      operator delete(__p);
    }

    if (v18)
    {
      double v19 = v18;
      operator delete(v18);
    }

    if (v20)
    {
      uint64_t v21 = v20;
      operator delete(v20);
    }

    sub_101127D00((PB::Base *)v22);
  }

- (void)onMslp:(const CMMeanSeaLevelPressure *)a3
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  double v5 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double var1 = a3->var1;
    double var2 = a3->var2;
    *(_DWORD *)buf = 134218496;
    CFAbsoluteTime v27 = Current;
    __int16 v28 = 2048;
    double v29 = var1;
    __int16 v30 = 2048;
    double v31 = var2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "mslp from aop,timestamp,%f,mslp,%f,uncertainty,%f",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v13 = qword_1019346A8;
    CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
    double v15 = a3->var1;
    double v16 = a3->var2;
    *(_DWORD *)uint64_t v21 = 134218496;
    *(CFAbsoluteTime *)&v21[4] = v14;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 2048;
    double v25 = v16;
    LODWORD(v20) = 32;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v13,  0LL,  "mslp from aop,timestamp,%f,mslp,%f,uncertainty,%f",  COERCE_DOUBLE(v21),  v20);
    uint64_t v18 = (uint8_t *)v17;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMeanSeaLevelPressureEstimator onMslp:]", "%s\n", v17);
    if (v18 != buf) {
      free(v18);
    }
  }

  uint64_t v9 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
  -[CLMeanSeaLevelPressureData setTimestamp:](v9, "setTimestamp:", a3->var0);
  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v9, "setMeanSeaLevelPressure:", a3->var1);
  -[CLMeanSeaLevelPressureData setUncertainty:](v9, "setUncertainty:", a3->var2);
  if (-[CLMeanSeaLevelPressureEstimator updateHistoricalMslpArray:from:]( self,  "updateHistoricalMslpArray:from:",  v9,  1LL))
  {
    ++self->_numberOfWeatherUpdate;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v10 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "mslp array is successfully updated from AOP weather estimate",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      *(_WORD *)uint64_t v21 = 0;
      LODWORD(v20) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "mslp array is successfully updated from AOP weather estimate",  v21,  *(void *)&v20,  *(void *)v21);
LABEL_28:
      double v19 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMeanSeaLevelPressureEstimator onMslp:]", "%s\n", v11);
      if (v19 != buf) {
        free(v19);
      }
    }
  }

  else
  {
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v12 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "mslp array fails to update from AOP weather estimate",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      *(_WORD *)uint64_t v21 = 0;
      LODWORD(v20) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "mslp array fails to update from AOP weather estimate",  v21,  *(void *)&v20,  *(void *)v21);
      goto LABEL_28;
    }
  }
}

- (void)resetInVisitRebasedMslp
{
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  uint64_t v3 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "reset in visit rebased Mslp,timestamp,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v4 = qword_1019346A8;
    int v7 = 134217984;
    CFAbsoluteTime v8 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v4,  0LL,  "reset in visit rebased Mslp,timestamp,%f",  COERCE_DOUBLE(&v7));
    uint64_t v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMeanSeaLevelPressureEstimator resetInVisitRebasedMslp]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

- (void)clearInVisitRebasedMslpInPlist
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A667C(v2, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", 0xFFFFFFFFLL);
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A667C(v3, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", 0xFFFFFFFFLL);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A667C(v4, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", 0xFFFFFFFFLL);
  uint64_t v5 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v5 + 944LL))(v5);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  uint64_t v6 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "clear visit rebase location to plist,timestamp,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v7 = qword_1019346A8;
    int v10 = 134217984;
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v7,  0LL,  "clear visit rebase location to plist,timestamp,%f",  COERCE_DOUBLE(&v10));
    uint64_t v9 = (uint8_t *)v8;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator clearInVisitRebasedMslpInPlist]",  "%s\n",  v8);
    if (v9 != buf) {
      free(v9);
    }
  }

- (void)clearMeanSeaLevelPressureArrayInPlist
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A66DC(v2);
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A66DC(v3);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A66DC(v4);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A66DC(v5);
  uint64_t v6 = sub_1002F8DDC();
  sub_1002A667C(v6, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", 0xFFFFFFFFLL);
  uint64_t v7 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v7 + 944LL))(v7);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  CFAbsoluteTime v8 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "clear mean sea level pressure in plist,timestamp,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v9 = qword_1019346A8;
    int v12 = 134217984;
    CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "clear mean sea level pressure in plist,timestamp,%f",  COERCE_DOUBLE(&v12));
    CFAbsoluteTime v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist]",  "%s\n",  v10);
    if (v11 != buf) {
      free(v11);
    }
  }

- (void)clearRecentMeanSeaLevelPressureArrayInPlist
{
  uint64_t v2 = sub_1002F8DDC();
  sub_1002A66DC(v2);
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A66DC(v3);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A66DC(v4);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A66DC(v5);
  uint64_t v6 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v6 + 944LL))(v6);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  uint64_t v7 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "clear recent mean sea level pressure in plist,timestamp,%f",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v8 = qword_1019346A8;
    int v11 = 134217984;
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent();
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  0LL,  "clear recent mean sea level pressure in plist,timestamp,%f",  COERCE_DOUBLE(&v11));
    int v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator clearRecentMeanSeaLevelPressureArrayInPlist]",  "%s\n",  v9);
    if (v10 != buf) {
      free(v10);
    }
  }

- (void)saveMeanSeaLevelPressureArrayToPlist
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count")
    && self->_lastRefreshTimestamp != 1.79769313e308)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    double v25 = self;
    double v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
    sub_1010DDBC0(__p, "save mean sea level array to cache:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( v25,  "printMeanSeaLevelPressureArray:withPrePhrase:",  meanSeaLevelPressureArray,  __p);
    if (v32 < 0) {
      operator delete(__p[0]);
    }
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v8 = v25->_meanSeaLevelPressureArray;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v27,  v37,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          CFAbsoluteTime v12 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          [v12 timestamp];
          -[NSMutableArray addObject:]( v4,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v12 meanSeaLevelPressure];
          -[NSMutableArray addObject:]( v5,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v12 uncertainty];
          -[NSMutableArray addObject:]( v6,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v12 pressureMeasurement];
          -[NSMutableArray addObject:]( v26,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v27,  v37,  16LL);
      }

      while (v9);
    }

    -[CLMeanSeaLevelPressureEstimator clearMeanSeaLevelPressureArrayInPlist]( v25,  "clearMeanSeaLevelPressureArrayInPlist");
    uint64_t v13 = sub_1002F8DDC();
    sub_1002AB3DC(v13);
    uint64_t v14 = sub_1002F8DDC();
    sub_1002AB3DC(v14);
    uint64_t v15 = sub_1002F8DDC();
    sub_1002AB3DC(v15);
    uint64_t v16 = sub_1002F8DDC();
    sub_1002AB3DC(v16);
    uint64_t v17 = sub_1002F8DDC();
    p_double lastRefreshTimestamp = (CLMeanSeaLevelPressureEstimator *)&v25->_lastRefreshTimestamp;
    sub_1002AC7B8(v17, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", &v25->_lastRefreshTimestamp);
    uint64_t v19 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v19 + 944LL))(v19);
    v25->_double lastTimestampSavedMslpForRecovery = Current;

    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    double v20 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      Class isa = p_lastRefreshTimestamp->super.isa;
      *(_DWORD *)buf = 134217984;
      Class v36 = isa;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "save the latest refresh time to plist,%f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      Class v22 = p_lastRefreshTimestamp->super.isa;
      int v33 = 134217984;
      Class v34 = v22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "save the latest refresh time to plist,%f",  COERCE_DOUBLE(&v33));
      __int16 v24 = (uint8_t *)v23;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator saveMeanSeaLevelPressureArrayToPlist]",  "%s\n",  v23);
      if (v24 != buf) {
        free(v24);
      }
    }
  }

- (void)saveRecentMeanSeaLevelPressureArrayToPlist
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (-[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"))
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v18 = self;
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_1010DDBC0(__p, "save recent mean sea level array to cache:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( v18,  "printMeanSeaLevelPressureArray:withPrePhrase:",  recentMeanSeaLevelPressureArray,  __p);
    if (v26 < 0) {
      operator delete(__p[0]);
    }
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    obint64_t j = v18->_recentMeanSeaLevelPressureArray;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL,  v18);
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          CFAbsoluteTime v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          [v12 timestamp];
          -[NSMutableArray addObject:]( v4,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v12 meanSeaLevelPressure];
          -[NSMutableArray addObject:]( v5,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v12 uncertainty];
          -[NSMutableArray addObject:]( v6,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v12 pressureMeasurement];
          -[NSMutableArray addObject:]( v7,  "addObject:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        }

        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v21,  v27,  16LL);
      }

      while (v9);
    }

    [v19 clearRecentMeanSeaLevelPressureArrayInPlist];
    uint64_t v13 = sub_1002F8DDC();
    sub_1002AB3DC(v13);
    uint64_t v14 = sub_1002F8DDC();
    sub_1002AB3DC(v14);
    uint64_t v15 = sub_1002F8DDC();
    sub_1002AB3DC(v15);
    uint64_t v16 = sub_1002F8DDC();
    sub_1002AB3DC(v16);
    uint64_t v17 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v17 + 944LL))(v17);
    *((CFAbsoluteTime *)v19 + 13) = Current;
  }

- (void)saveInVisitRebasedMslpToPlist
{
  if (v3 != 1.79769313e308)
  {
    -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
    if (v4 != 1.79769313e308)
    {
      -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
      if (v5 != 1.79769313e308)
      {
        -[CLMeanSeaLevelPressureEstimator clearInVisitRebasedMslpInPlist](self, "clearInVisitRebasedMslpInPlist");
        uint64_t v6 = sub_1002F8DDC();
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        *(void *)buf = v7;
        sub_1002AC7B8(v6, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", buf);
        uint64_t v8 = sub_1002F8DDC();
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        *(void *)buf = v9;
        sub_1002AC7B8(v8, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", buf);
        uint64_t v10 = sub_1002F8DDC();
        -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
        *(void *)buf = v11;
        sub_1002AC7B8(v10, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", buf);
        uint64_t v12 = sub_1002F8DDC();
        (*(void (**)(uint64_t))(*(void *)v12 + 944LL))(v12);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v13 = (os_log_s *)qword_1019346A8;
        if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
        {
          -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
          uint64_t v15 = v14;
          -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
          uint64_t v17 = v16;
          -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
          *(_DWORD *)buf = 134218496;
          *(void *)&uint8_t buf[4] = v15;
          __int16 v35 = 2048;
          uint64_t v36 = v17;
          __int16 v37 = 2048;
          uint64_t v38 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "save visit rebased mean sea level pressure to plist,mslp,%f,uncertainty,%f,timestamp,%f",  buf,  0x20u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1019346A0 != -1) {
            dispatch_once(&qword_1019346A0, &stru_101894348);
          }
          uint64_t v19 = qword_1019346A8;
          -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
          uint64_t v21 = v20;
          -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
          uint64_t v23 = v22;
          -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
          int v28 = 134218496;
          uint64_t v29 = v21;
          __int16 v30 = 2048;
          uint64_t v31 = v23;
          __int16 v32 = 2048;
          uint64_t v33 = v24;
          LODWORD(v27) = 32;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v19,  0LL,  "save visit rebased mean sea level pressure to plist,mslp,%f,uncertainty,%f,timestamp,%f",  COERCE_DOUBLE(&v28),  v27);
          char v26 = (char *)v25;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator saveInVisitRebasedMslpToPlist]",  "%s\n",  v25);
          if (v26 != buf) {
            free(v26);
          }
        }
      }
    }
  }

- (void)saveInVisitStateToPlist
{
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A667C(v3, "CLMeanSeaLevelPressureEstimator_InVisitStatus", 0xFFFFFFFFLL);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A667C(v4, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", 0xFFFFFFFFLL);
  uint64_t v5 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v5 + 944LL))(v5);
  uint64_t v6 = sub_1002F8DDC();
  p_inVisitStatus = &self->_inVisitStatus;
  sub_1002AB3FC(v6, "CLMeanSeaLevelPressureEstimator_InVisitStatus", &self->_inVisitStatus);
  uint64_t v8 = sub_1002F8DDC();
  p_exitVisitTimestamp = &self->_exitVisitTimestamp;
  sub_1002AC7B8(v8, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", p_exitVisitTimestamp);
  uint64_t v10 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v10 + 944LL))(v10);
  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  uint64_t v11 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = *p_inVisitStatus;
    uint64_t v13 = *(void *)p_exitVisitTimestamp;
    *(_DWORD *)buf = 67109376;
    BOOL v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "save visit to plist,inVisitStatus,%d,exitVisitTimestamp,%f",  buf,  0x12u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    BOOL v14 = *p_inVisitStatus;
    uint64_t v15 = *(void *)p_exitVisitTimestamp;
    v19[0] = 67109376;
    v19[1] = v14;
    __int16 v20 = 2048;
    uint64_t v21 = v15;
    LODWORD(v18) = 18;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "save visit to plist,inVisitStatus,%d,exitVisitTimestamp,%f",  v19,  v18);
    uint64_t v17 = (uint8_t *)v16;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMeanSeaLevelPressureEstimator saveInVisitStateToPlist]", "%s\n", v16);
    if (v17 != buf) {
      free(v17);
    }
  }

- (void)retrieveMeanSeaLevelPressureEstimatorState
{
  double v91 = 0.0;
  double v92 = 1.79769313e308;
  double v89 = 1.79769313e308;
  double v90 = 1.79769313e308;
  double v88 = 1.79769313e308;
  BOOL v87 = 0;
  uint64_t v3 = sub_1002F8DDC();
  sub_1002A82BC(v3, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslp", &v90);
  uint64_t v4 = sub_1002F8DDC();
  sub_1002A82BC(v4, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpUncertainty", &v89);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A82BC(v5, "CLMeanSeaLevelPressureEstimator_InVisitRebasedMslpTimestamp", &v88);
  uint64_t v6 = sub_1002F8DDC();
  sub_1002A6F64(v6, "CLMeanSeaLevelPressureEstimator_InVisitStatus", &v87);
  uint64_t v7 = sub_1002F8DDC();
  sub_1002A82BC(v7, "CLMeanSeaLevelPressureEstimator_ExitVisitTimestamp", &v91);
  uint64_t v8 = sub_1002F8DDC();
  sub_1002A82BC(v8, "CLMeanSeaLevelPressureEstimator_ArrayRefreshTimestamp", &v92);
  uint64_t v9 = sub_1002F8DDC();
  sub_1002AA610(v9, @"CLMeanSeaLevelPressureEstimator_MslpArray", (CFTypeRef *)&v86);
  uint64_t v10 = sub_1002F8DDC();
  sub_1002AA610(v10, @"CLMeanSeaLevelPressureEstimator_MslpUncertaintyArray", &v85);
  uint64_t v11 = sub_1002F8DDC();
  sub_1002AA610(v11, @"CLMeanSeaLevelPressureEstimator_MslpTimestampArray", &v84);
  uint64_t v12 = sub_1002F8DDC();
  sub_1002AA610(v12, @"CLMeanSeaLevelPressureEstimator_PressureMeasurementArray", &v83);
  uint64_t v13 = sub_1002F8DDC();
  sub_1002AA610(v13, @"CLMeanSeaLevelPressureEstimator_RecentMslpArray", (CFTypeRef *)&v82);
  uint64_t v14 = sub_1002F8DDC();
  sub_1002AA610(v14, @"CLMeanSeaLevelPressureEstimator_RecentMslpUncertaintyArray", &v81);
  uint64_t v15 = sub_1002F8DDC();
  sub_1002AA610(v15, @"CLMeanSeaLevelPressureEstimator_RecentMslpTimestampArray", &v80);
  uint64_t v16 = sub_1002F8DDC();
  sub_1002AA610(v16, @"CLMeanSeaLevelPressureEstimator_RecentPressureMeasurementArray", &v79);
  if (v92 == 1.79769313e308
    || (uint64_t v17 = v86) == 0LL
    || (double v18 = (void *)v85) == 0LL
    || (uint64_t v19 = (void *)v84) == 0LL
    || (__int16 v20 = (void *)v83) == 0LL)
  {
LABEL_53:
    self->_double exitVisitTimestamp = v91;
    self->_BOOL inVisitStatus = v87;
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v47 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL inVisitStatus = self->_inVisitStatus;
      double exitVisitTimestamp = self->_exitVisitTimestamp;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)double v98 = inVisitStatus;
      *(_WORD *)&v98[4] = 2048;
      *(double *)&v98[6] = exitVisitTimestamp;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "retrieve invisit state,inVisitStatus,%d,exitVisitTimestamp,%f",  buf,  0x12u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      BOOL v65 = self->_inVisitStatus;
      double v66 = self->_exitVisitTimestamp;
      int v93 = 67109376;
      *(_DWORD *)double v94 = v65;
      *(_WORD *)&v94[4] = 2048;
      *(double *)&v94[6] = v66;
      LODWORD(v74) = 18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "retrieve invisit state,inVisitStatus,%d,exitVisitTimestamp,%f",  &v93,  v74);
      uint64_t v68 = (uint8_t *)v67;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]",  "%s\n",  v67);
      if (v68 != buf) {
        free(v68);
      }
    }

    inVisitRebasedMslp = self->_inVisitRebasedMslp;
    if (!self->_inVisitStatus || v90 == 1.79769313e308 || v89 == 1.79769313e308 || v88 == 1.79769313e308)
    {
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:]( inVisitRebasedMslp,  "setMeanSeaLevelPressure:",  1.79769313e308);
      -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:", 1.79769313e308);
      -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:", 1.79769313e308);
    }

    else
    {
      -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](inVisitRebasedMslp, "setMeanSeaLevelPressure:", v90, v88);
      -[CLMeanSeaLevelPressureData setUncertainty:](self->_inVisitRebasedMslp, "setUncertainty:", v89);
      -[CLMeanSeaLevelPressureData setTimestamp:](self->_inVisitRebasedMslp, "setTimestamp:", v88);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      double v51 = (os_log_s *)qword_1019346A8;
      if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
      {
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        uint64_t v53 = v52;
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        uint64_t v55 = v54;
        -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
        *(_DWORD *)buf = 134218496;
        *(void *)double v98 = v53;
        *(_WORD *)&v98[8] = 2048;
        *(void *)&v98[10] = v55;
        __int16 v99 = 2048;
        uint64_t v100 = v56;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "retrieve invisit rebase mslp,inVisitRebasedMslp,%f,inVisitRebasedMslpUnc,%f,inVisitRebasedMslpTime,%f",  buf,  0x20u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019346A0 != -1) {
          dispatch_once(&qword_1019346A0, &stru_101894348);
        }
        uint64_t v57 = qword_1019346A8;
        -[CLMeanSeaLevelPressureData meanSeaLevelPressure](self->_inVisitRebasedMslp, "meanSeaLevelPressure");
        uint64_t v59 = v58;
        -[CLMeanSeaLevelPressureData uncertainty](self->_inVisitRebasedMslp, "uncertainty");
        uint64_t v61 = v60;
        -[CLMeanSeaLevelPressureData timestamp](self->_inVisitRebasedMslp, "timestamp");
        int v93 = 134218496;
        *(void *)double v94 = v59;
        *(_WORD *)&v94[8] = 2048;
        *(void *)&v94[10] = v61;
        __int16 v95 = 2048;
        uint64_t v96 = v62;
        LODWORD(v74) = 32;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v57,  0LL,  "retrieve invisit rebase mslp,inVisitRebasedMslp,%f,inVisitRebasedMslpUnc,%f,inVisitRebasedMslpTime,%f",  COERCE_DOUBLE(&v93),  v74,  *(double *)v75);
        unsigned int v64 = (uint8_t *)v63;
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]",  "%s\n",  v63);
        if (v64 != buf) {
          free(v64);
        }
      }
    }

    if (-[NSMutableArray count](self->_meanSeaLevelPressureArray, "count")
      || -[NSMutableArray count](self->_recentMeanSeaLevelPressureArray, "count"))
    {
      -[CLMeanSeaLevelPressureEstimator updateUncertinatyAndSendCurrentEstimateMslpFrom:]( self,  "updateUncertinatyAndSendCurrentEstimateMslpFrom:",  0LL);
    }

    return;
  }

  int v21 = objc_msgSend(v86, "count", v92);
  unsigned int v22 = [v18 count];
  unsigned int v23 = [v19 count];
  unsigned int v24 = [v20 count];
  if (v21 == v22 && v21 == v23 && v22 == v23 && v24 == v23 && v24 == v22 && v24 == v21)
  {
    self->_double lastRefreshTimestamp = v92;
    if (v21 >= 1)
    {
      uint64_t v25 = 0LL;
      uint64_t v26 = v21;
      do
      {
        double v27 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
        objc_msgSend(objc_msgSend(v19, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setTimestamp:](v27, "setTimestamp:");
        objc_msgSend(objc_msgSend(v17, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v27, "setMeanSeaLevelPressure:");
        objc_msgSend(objc_msgSend(v18, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setUncertainty:](v27, "setUncertainty:");
        objc_msgSend(objc_msgSend(v20, "objectAtIndexedSubscript:", v25), "doubleValue");
        -[CLMeanSeaLevelPressureData setPressureMeasurement:](v27, "setPressureMeasurement:");
        -[NSMutableArray addObject:](self->_meanSeaLevelPressureArray, "addObject:", v27);

        ++v25;
      }

      while (v26 != v25);
    }

    int v28 = v82;
    if (v82)
    {
      uint64_t v29 = (void *)v81;
      if (v81)
      {
        __int16 v30 = (void *)v80;
        if (v80)
        {
          uint64_t v31 = (void *)v79;
          if (v79)
          {
            int v32 = [v82 count];
            unsigned int v33 = [v29 count];
            unsigned int v34 = [v30 count];
            unsigned int v35 = [v31 count];
            if (v32 == v33 && v32 == v34 && v33 == v34 && v35 == v34 && v35 == v33 && v35 == v32)
            {
              if (v32 >= 1)
              {
                uint64_t v36 = 0LL;
                uint64_t v37 = v32;
                do
                {
                  uint64_t v38 = objc_opt_new(&OBJC_CLASS___CLMeanSeaLevelPressureData);
                  objc_msgSend(objc_msgSend(v30, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setTimestamp:](v38, "setTimestamp:");
                  objc_msgSend(objc_msgSend(v28, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setMeanSeaLevelPressure:](v38, "setMeanSeaLevelPressure:");
                  objc_msgSend(objc_msgSend(v29, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setUncertainty:](v38, "setUncertainty:");
                  objc_msgSend(objc_msgSend(v31, "objectAtIndexedSubscript:", v36), "doubleValue");
                  -[CLMeanSeaLevelPressureData setPressureMeasurement:](v38, "setPressureMeasurement:");
                  -[NSMutableArray addObject:](self->_recentMeanSeaLevelPressureArray, "addObject:", v38);

                  ++v36;
                }

                while (v37 != v36);
              }
            }

            else
            {
              if (qword_1019346A0 != -1) {
                dispatch_once(&qword_1019346A0, &stru_101894348);
              }
              uint64_t v42 = (os_log_s *)qword_1019346A8;
              if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "the saved recent mean sea level pressure arrays have different sizes.",  buf,  2u);
              }

              if (sub_1002921D0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1019346A0 != -1) {
                  dispatch_once(&qword_1019346A0, &stru_101894348);
                }
                LOWORD(v93) = 0;
                _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "the saved recent mean sea level pressure arrays have different sizes.",  &v93,  2);
                double v73 = (uint8_t *)v72;
                sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]",  "%s\n",  v72);
                if (v73 != buf) {
                  free(v73);
                }
              }
            }
          }
        }
      }
    }

    meanSeaLevelPressureArray = self->_meanSeaLevelPressureArray;
    sub_1010DDBC0(__p, "retrieve mean sea level pressure array from plist:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( self,  "printMeanSeaLevelPressureArray:withPrePhrase:",  meanSeaLevelPressureArray,  __p);
    if (v78 < 0) {
      operator delete(__p[0]);
    }
    recentMeanSeaLevelPressureArray = self->_recentMeanSeaLevelPressureArray;
    sub_1010DDBC0(v75, "retrieve recent mean sea level pressure array from plist:");
    -[CLMeanSeaLevelPressureEstimator printMeanSeaLevelPressureArray:withPrePhrase:]( self,  "printMeanSeaLevelPressureArray:withPrePhrase:",  recentMeanSeaLevelPressureArray,  v75);
    if (v76 < 0) {
      operator delete(v75[0]);
    }
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    uint64_t v45 = (os_log_s *)qword_1019346A8;
    if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
    {
      double lastRefreshTimestamp = self->_lastRefreshTimestamp;
      *(_DWORD *)buf = 134217984;
      *(double *)double v98 = lastRefreshTimestamp;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "retrieve the latest array refresh time from plist,%f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346A0 != -1) {
        dispatch_once(&qword_1019346A0, &stru_101894348);
      }
      double v69 = self->_lastRefreshTimestamp;
      int v93 = 134217984;
      *(double *)double v94 = v69;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "retrieve the latest array refresh time from plist,%f",  COERCE_DOUBLE(&v93));
      uint64_t v71 = (uint8_t *)v70;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]",  "%s\n",  v70);
      if (v71 != buf) {
        free(v71);
      }
    }

    self->_currentEstimateMslp = (CLMeanSeaLevelPressureData *) -[CLMeanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure]( self,  "getEstimatedMeanSeaLevelPressure");
    -[CLMeanSeaLevelPressureEstimator writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:]( self,  "writeInitialHistoricalMeanSeaLevelPressureToMslwithTimestamp:",  CFAbsoluteTimeGetCurrent());
    goto LABEL_53;
  }

  if (qword_1019346A0 != -1) {
    dispatch_once(&qword_1019346A0, &stru_101894348);
  }
  __int16 v39 = (os_log_s *)qword_1019346A8;
  if (os_log_type_enabled((os_log_t)qword_1019346A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "the saved mean sea level pressure arrays have different sizes.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346A0 != -1) {
      dispatch_once(&qword_1019346A0, &stru_101894348);
    }
    LOWORD(v93) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346A8,  0LL,  "the saved mean sea level pressure arrays have different sizes.",  &v93,  2);
    unsigned int v41 = (uint8_t *)v40;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLMeanSeaLevelPressureEstimator retrieveMeanSeaLevelPressureEstimatorState]",  "%s\n",  v40);
    if (v41 != buf) {
      free(v41);
    }
  }

- (double)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(double)a3
{
  self->_double lastRefreshTimestamp = a3;
}

- (double)exitVisitTimestamp
{
  return self->_exitVisitTimestamp;
}

- (void)setExitVisitTimestamp:(double)a3
{
  self->_double exitVisitTimestamp = a3;
}

- (double)cumulativeStartTime
{
  return self->_cumulativeStartTime;
}

- (void)setCumulativeStartTime:(double)a3
{
  self->_double cumulativeStartTime = a3;
}

- (BOOL)inVisitStatus
{
  return self->_inVisitStatus;
}

- (void)setInVisitStatus:(BOOL)a3
{
  self->_BOOL inVisitStatus = a3;
}

- (double)currentLatitude
{
  return self->_currentLatitude;
}

- (void)setCurrentLatitude:(double)a3
{
  self->_double currentLatitude = a3;
}

- (double)currentLongitude
{
  return self->_currentLongitude;
}

- (void)setCurrentLongitude:(double)a3
{
  self->_double currentLongitude = a3;
}

- (double)currentPressure
{
  return self->_currentPressure;
}

- (void)setCurrentPressure:(double)a3
{
  self->_currentPressure = a3;
}

- (double)minPressure
{
  return self->_minPressure;
}

- (void)setMinPressure:(double)a3
{
  self->_minPressure = a3;
}

- (double)maxPressure
{
  return self->_maxPressure;
}

- (void)setMaxPressure:(double)a3
{
  self->_maxPressure = a3;
}

- (BOOL)firstRefreshAfterVisit
{
  return self->_firstRefreshAfterVisit;
}

- (void)setFirstRefreshAfterVisit:(BOOL)a3
{
  self->_BOOL firstRefreshAfterVisit = a3;
}

- (int)numberOfRebaseBtwRefresh
{
  return self->_numberOfRebaseBtwRefresh;
}

- (void)setNumberOfRebaseBtwRefresh:(int)a3
{
  self->_int numberOfRebaseBtwRefresh = a3;
}

- (int)numberOfTrackEndedBtwRefresh
{
  return self->_numberOfTrackEndedBtwRefresh;
}

- (void)setNumberOfTrackEndedBtwRefresh:(int)a3
{
  self->_int numberOfTrackEndedBtwRefresh = a3;
}

- (void).cxx_destruct
{
  value = self->_mslpDispatcher.__ptr_.__value_;
  self->_mslpDispatcher.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 30) = 0LL;
  return self;
}

@end