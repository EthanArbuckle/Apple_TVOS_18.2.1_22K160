@interface NIServerAnalyticsManager
- (BOOL)_isPDRAvailable:(PDRInput *)a3;
- (BOOL)_isSemiStaticFromVIO:(optional<nearby:(optional<nearby:(double)a5 :algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 ::;
- (NIServerAnalyticsManager)initWithBundleIdentifier:(id)a3;
- (VectorAggregateErrors)_calculateErrorStatsFromVector:(SEL)a3;
- (double)_deltaDistanceFromVIOPoses:(optional<nearby:(optional<nearby::algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 :;
- (double)_finderTimeFromFirstPoseTo:(double)a3;
- (id).cxx_construct;
- (id)_algorithmSourceToString:(int)a3;
- (void)_calculateAndLogErrorsFromIODeltaP:(NIServerAnalyticsManager *)self vioDeltaP:(SEL)a2 vioPos:;
- (void)_calculateIOMetrics:(double)a3;
- (void)_calculatePoseSplicingMetrics;
- (void)_calculateStraightLineDistance;
- (void)_onVIOReset;
- (void)_sessionStoppedWithTimestamp:(double)a3;
- (void)_submitFindingSessionEndStats;
- (void)_updateAlignedPDRMetrics:(const void *)a3;
- (void)_updateMinMaxRangeAndRSSI:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5;
- (void)_updateUserMovedDistanceWithPose:(const void *)a3 lastPoseInfo:(void *)a4;
- (void)appBecameNotVisibleWithTimestamp:(double)a3;
- (void)appBecameVisibleWithTimestamp:(double)a3;
- (void)backgroundContinuationDiscoveryTimeout;
- (void)backgroundContinuationInteractionTimeout;
- (void)dealloc;
- (void)lifecycleTimeoutAfterTrackingForDiscoveryToken:(id)a3;
- (void)lifecycleTimeoutBeforeTrackingForDiscoveryToken:(id)a3;
- (void)nearbyObjectUpdated:(id)a3;
- (void)sessionInterruptedWithTimestamp:(double)a3;
- (void)sessionInvalidatedWithTimestamp:(double)a3;
- (void)sessionPausedWithTimestamp:(double)a3;
- (void)sessionSuccessfullyRanWithConfig:(id)a3 withTimestamp:(double)a4;
- (void)updateWithAcquisitionReason:(int)a3;
- (void)updateWithFindeePeerData:(const void *)a3;
- (void)updateWithFinderPeerData:(const void *)a3;
- (void)updateWithMissedRange;
- (void)updateWithPDR:(const void *)a3;
- (void)updateWithPeerDeviceType:(BOOL)a3;
- (void)updateWithPeerLocationFromFMF;
- (void)updateWithPose:(const void *)a3;
- (void)updateWithRangeResult:(RangeResult *)a3;
- (void)updateWithSASolution:(Solution *)a3;
- (void)updateWithSelfLocation:(const LocationInput *)a3;
- (void)updateWithSolution:(const void *)a3;
- (void)updateWithSuccessfulRange:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5;
- (void)updateWithVIOPose:(Pose *)a3;
@end

@implementation NIServerAnalyticsManager

- (NIServerAnalyticsManager)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NIServerAnalyticsManager;
  v6 = -[NIServerAnalyticsManager init](&v25, "init");
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    bundleIdentifier = v8->_bundleIdentifier;
    if (bundleIdentifier)
    {
      sub_1000065CC(&v23, (char *)-[NSString UTF8String](bundleIdentifier, "UTF8String"));
      p_bundleIdAsStdString = (void **)&v7->_bundleIdAsStdString;
      uint64_t v11 = v24;
      *(_OWORD *)p_bundleIdAsStdString = v23;
      *((void *)&v7->_bundleIdAsStdString.__r_.__value_.var0.var1 + 2) = v11;
    }

    else
    {
      std::string::assign((std::string *)&v7->_bundleIdAsStdString, "");
    }

    LOBYTE(v8->_bundleIdAsStdString.__r_.var0) = 0;
    v8->_bundleIdAsStdString.var0 = 0LL;
    v8->_isRunning = 1;
    *(void *)&v8->_isVisible = 0LL;
    v8->_visibilityUpdateTimestamp = 0.0;
    v8->_runTimestamp = 0.0;
    LOBYTE(v8->_timeSpentVisible) = 0;
    *(_OWORD *)&v8->_timeSpentNotVisible = 0u;
    *(_OWORD *)&v8->_firstDistance = 0u;
    double maxDistance = v8->_maxDistance;
    *(void *)&v8->_double maxDistance = @"None";

    double minDistance = v8->_minDistance;
    *(void *)&v8->_double minDistance = @"None";

    LODWORD(v8->_lifecycleTimeoutType) = 0;
    v8->_backgroundContinuationTimeoutType = 0LL;
    *(void *)((char *)&v8->_sessionType + 1) = 0LL;
    BYTE1(v8->_backgroundMode) = 0;
    *(void *)&v8->_hasHorizontallyConverged = 0LL;
    *(void *)&v8->_lastVIOPosition[6] = 0LL;
    *(void *)&v8->_isCameraAssistanceEnabled = 0LL;
    __asm { FMOV            V0.2D, #-1.0 }

    *(_OWORD *)&v8->_lastVIOPosition[14] = _Q0;
    *(_OWORD *)&v8->_distanceMovedToHorizontalConvergence = _Q0;
    __int128 v21 = _Q0;
    *(_OWORD *)&v8->_totalDistanceMoved = _Q0;
    v8->_rangeAtVerticalConvergence = -1.0;
    v8->_timeToHorizontalConvergence = 0.0;
    LODWORD(v8->_timeToVerticalConvergence) = 0;
    *(void *)&v8->_numberOfInvalidPose = 0xBFF0000000000000LL;
    v8->_timeAtLastLocationUpdate = -1.0;
    if (*((_BYTE *)&v8->_numberOfLostVerticalConvergence + 4)) {
      *((_BYTE *)&v8->_numberOfLostVerticalConvergence + 4) = 0;
    }
    *(_OWORD *)&v7->_timeLocationFromLOIOverride = 0u;
    *(_OWORD *)&v7->_timeLocationFromPipeline = 0u;
    *(_OWORD *)&v7->_timeLocationFromCompensated = 0u;
    *(_OWORD *)&v7->_timeLocationFromGPSCoarse = 0u;
    *(_OWORD *)&v7->_lastLocationType.var0.__null_state_ = 0u;
    *(_OWORD *)&v7->_timeLocationFromAccessory = 0u;
    *(void *)&__int128 v19 = -1LL;
    *((void *)&v19 + 1) = -1LL;
    *(_OWORD *)&v7->_timeLocationFromWiFi = v19;
    *(_OWORD *)&v7->_numberOfPeerData = v19;
    *(_OWORD *)&v7->_numberOfLocationFromPeerData = v19;
    *(void *)&v8->_numberOfWalkingOrkUnknown = 0xBFF0000000000000LL;
    *(void *)&v8->_numberOfMissedRanges = 0xBFF0000000000000LL;
    if (BYTE4(v8->_timeAtFirstPeerData)) {
      BYTE4(v8->_timeAtFirstPeerData) = 0;
    }
    *(_OWORD *)&v8->_timeAtLastBoundedDisplacementUpdate = 0u;
    *(_OWORD *)&v8->_timeFindeeWasSlowlyMoving = 0u;
    *(_OWORD *)&v8->_timeFindeeWasWalkingOrUnknown = xmmword_10040C8B0;
    *(_OWORD *)&v8->_pdrTimeAtFirstPDRUpdate = xmmword_10040C8B0;
    LOBYTE(v8->_pdrTimeAtLastPDRUpdate) = 0;
    v8->_timePeerLocationFromFindeeData = -1.0;
    *(_OWORD *)&v8->_timeAtLastLocationFromFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstValidPose = v21;
    *(_OWORD *)&v8->_timeAtFirstOutputRange = v21;
    *(_OWORD *)&v8->_timeAtFirstFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstSelfLocation = v21;
    *(_OWORD *)&v8->_timeAtFirstPeerLocationFromFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstPDRFromFindeeData = v21;
    v8->_timeAtFirstDeltaVelocityFromFindeeData = -1.0;
    v8->_timeAtFirstStaticFromFindeeData = 0.0;
    LODWORD(v8->_timeAtEndOfSession) = 0;
    *(double *)((char *)&v7->_timeAtEndOfSession + 4) = NAN;
    *(void *)&v7->_firstOutputRangeAlgorithmSource = -1LL;
    *(void *)&v7->_numberOfArrowRevokes = -1LL;
    LOWORD(v8->_numberOfSolutions) = 0;
    BYTE2(v8->_numberOfSolutions) = 0;
    if (v8->_anon_3a8[56]) {
      v8->_anon_3a8[56] = 0;
    }
    -[NIServerAnalyticsManager _onVIOReset](v8, "_onVIOReset", v21);
    if (v8->_anon_9d8[169]) {
      v8->_anon_9d8[169] = 0;
    }
    if (v8->_anon_9d8[171]) {
      v8->_anon_9d8[171] = 0;
    }
    *(void *)&v8->_anon_9d8[176] = 0LL;
    *(void *)&v8->_isFinderAPhone.var0.__null_state_ = 0xBFF0000000000000LL;
    *(_OWORD *)&v7->_timePDRAndVIOWasAvailable = 0u;
    if (v8->_anon_af8[56]) {
      v8->_anon_af8[56] = 0;
    }
    *(_OWORD *)&v8->_anon_af8[72] = v22;
    *(_OWORD *)&v8->_pathLengthError = v22;
    *(_OWORD *)&v8->_radialDisplacementError = v22;
    *(_OWORD *)&v8->_stdSpeedFromVIO = 0uLL;
    *(_OWORD *)&v8->_timeSSFromVIO = 0uLL;
    *(_OWORD *)&v8->_timeSSFromIOAndSSFromVIO = v22;
    *(_OWORD *)&v8->_pdrSSDetectionTruePositiveRate = v22;
    *(_OWORD *)&v8->_percentTimeSSFromVIO = 0uLL;
    v8->_runningMeanSpeedFromVIO = NAN;
    v8->_m2 = -1.0;
    *(_OWORD *)&v8->_acquisitionReason = 0uLL;
    v8->_firstNBRSSI = -1.0;
    *(_OWORD *)&v7->_firstUWBRSSI = 0uLL;
    v8->_lastNBRSSI = -1.79769313e308;
    *(int64x2_t *)&v8->_lastUWBRSSI = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v8->_maxNBRSSI = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v8->_minDistance_finding = xmmword_10040C8C0;
    *(_OWORD *)&v8->_minUWBRSSI = xmmword_10040C8C0;
    v8->_minYCoordinateFinder = 1.79769313e308;
    LOWORD(v8->_maxYCoordinateFindee) = 0;
    if (LOBYTE(v8->_minYCoordinateFindee)) {
      LOBYTE(v8->_minYCoordinateFindee) = 0;
    }
    *(_OWORD *)&v7->_didFinderChangeFloor = 0u;
    v8->_firstRawRangeValue = -1.79769313e308;
    *(_OWORD *)&v8->_currentRawRangeValue = xmmword_10040C8D0;
    v8->_minRawRangeValue = -1.0;
    LODWORD(v8->_timeAtFirstIOPose.var0.__val_) = 0;
    v8->_deltaVSourceTime = 0.0;
    v7->_lastSolutionTime = 0u;
    *(_OWORD *)&v7->_vioAvailableTime = 0u;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIServerAnalyticsManager;
  -[NIServerAnalyticsManager dealloc](&v3, "dealloc");
}

- (void)sessionSuccessfullyRanWithConfig:(id)a3 withTimestamp:(double)a4
{
  id v7 = a3;
  if (!v7)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v66 handleFailureInMethod:a2, self, @"NIServerAnalyticsManager.mm", 620, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }

  v8 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = bundleIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    __int16 v74 = 2048;
    double v75 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] sessionSuccessfullyRanWithConfig: %@ withTimestamp: %f [s]",  buf,  0x20u);
  }

  if (LOBYTE(self->_bundleIdAsStdString.__r_.var0))
  {
    v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] Session is already running. Stop it first.",  buf,  0xCu);
    }

    -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a4);
    LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 0;
  }

  LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 1;
  *(double *)&self->_bundleIdAsStdString.var0 = a4;
  self->_runTimestamp = a4;
  *(void *)&self->_isVisible = 0LL;
  self->_visibilityUpdateTimestamp = 0.0;
  LOBYTE(self->_timeSpentVisible) = 0;
  *(_OWORD *)&self->_timeSpentNotVisible = 0u;
  *(_OWORD *)&self->_firstDistance = 0u;
  double maxDistance = self->_maxDistance;
  *(void *)&self->_double maxDistance = @"None";

  double minDistance = self->_minDistance;
  *(void *)&self->_double minDistance = @"None";

  *(int *)((char *)&self->_sessionType + 6) = 0;
  *(int *)((char *)&self->_sessionType + 3) = 0;
  *(void *)&self->_hasHorizontallyConverged = 0LL;
  *(void *)&self->_lastVIOPosition[6] = 0LL;
  *(void *)&self->_isCameraAssistanceEnabled = 0LL;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)&self->_lastVIOPosition[14] = _Q0;
  *(_OWORD *)&self->_distanceMovedToHorizontalConvergence = _Q0;
  __int128 v67 = _Q0;
  *(_OWORD *)&self->_totalDistanceMoved = _Q0;
  self->_rangeAtVerticalConvergence = -1.0;
  self->_timeToHorizontalConvergence = 0.0;
  LODWORD(self->_timeToVerticalConvergence) = 0;
  *(void *)&self->_numberOfInvalidPose = 0xBFF0000000000000LL;
  self->_timeAtLastLocationUpdate = -1.0;
  if (*((_BYTE *)&self->_numberOfLostVerticalConvergence + 4)) {
    *((_BYTE *)&self->_numberOfLostVerticalConvergence + 4) = 0;
  }
  *(_OWORD *)&self->_timeLocationFromLOIOverride = 0u;
  *(_OWORD *)&self->_timeLocationFromPipeline = 0u;
  *(_OWORD *)&self->_timeLocationFromCompensated = 0u;
  *(_OWORD *)&self->_timeLocationFromGPSCoarse = 0u;
  *(_OWORD *)&self->_lastLocationType.var0.__null_state_ = 0u;
  *(_OWORD *)&self->_timeLocationFromAccessory = 0u;
  *(void *)&__int128 v19 = -1LL;
  *((void *)&v19 + 1) = -1LL;
  *(_OWORD *)&self->_timeLocationFromWiFi = v19;
  *(_OWORD *)&self->_numberOfPeerData = v19;
  *(_OWORD *)&self->_numberOfLocationFromPeerData = v19;
  *(void *)&self->_numberOfWalkingOrkUnknown = 0xBFF0000000000000LL;
  *(void *)&self->_numberOfMissedRanges = 0xBFF0000000000000LL;
  if (BYTE4(self->_timeAtFirstPeerData)) {
    BYTE4(self->_timeAtFirstPeerData) = 0;
  }
  *(_OWORD *)&self->_timeAtLastBoundedDisplacementUpdate = 0uLL;
  *(_OWORD *)&self->_timeFindeeWasSlowlyMoving = 0uLL;
  *(_OWORD *)&self->_timeFindeeWasWalkingOrUnknown = xmmword_10040C8B0;
  *(_OWORD *)&self->_pdrTimeAtFirstPDRUpdate = xmmword_10040C8B0;
  LOBYTE(self->_pdrTimeAtLastPDRUpdate) = 0;
  self->_timePeerLocationFromFindeeData = -1.0;
  *(_OWORD *)&self->_timeAtLastLocationFromFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstValidPose = _Q0;
  *(_OWORD *)&self->_timeAtFirstFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstSelfLocation = _Q0;
  *(_OWORD *)&self->_timeAtFirstPeerLocationFromFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstPDRFromFindeeData = _Q0;
  self->_timeAtFirstDeltaVelocityFromFindeeData = -1.0;
  self->_timeAtFirstStaticFromFindeeData = 0.0;
  LODWORD(self->_timeAtEndOfSession) = 0;
  *(double *)((char *)&self->_timeAtEndOfSession + 4) = NAN;
  *(void *)&self->_firstOutputRangeAlgorithmSource = -1LL;
  *(void *)&self->_numberOfArrowRevokes = -1LL;
  LOWORD(self->_numberOfSolutions) = 0;
  BYTE2(self->_numberOfSolutions) = 0;
  if (self->_anon_3a8[56]) {
    self->_anon_3a8[56] = 0;
  }
  -[NIServerAnalyticsManager _onVIOReset](self, "_onVIOReset");
  if (self->_anon_9d8[169]) {
    self->_anon_9d8[169] = 0;
  }
  if (self->_anon_9d8[171]) {
    self->_anon_9d8[171] = 0;
  }
  *(void *)&self->_anon_9d8[176] = 0LL;
  *(void *)&self->_isFinderAPhone.var0.__null_state_ = 0xBFF0000000000000LL;
  *(_OWORD *)&self->_timePDRAndVIOWasAvailable = 0u;
  if (self->_anon_af8[56]) {
    self->_anon_af8[56] = 0;
  }
  *(_OWORD *)&self->_anon_af8[72] = v67;
  *(_OWORD *)&self->_pathLengthError = v67;
  *(_OWORD *)&self->_radialDisplacementError = v67;
  *(_OWORD *)&self->_stdSpeedFromVIO = 0uLL;
  *(_OWORD *)&self->_timeSSFromVIO = 0uLL;
  *(_OWORD *)&self->_timeSSFromIOAndSSFromVIO = v67;
  *(_OWORD *)&self->_pdrSSDetectionTruePositiveRate = v67;
  *(_OWORD *)&self->_percentTimeSSFromVIO = 0uLL;
  self->_runningMeanSpeedFromVIO = NAN;
  self->_m2 = -1.0;
  *(_OWORD *)&self->_acquisitionReason = 0uLL;
  self->_firstNBRSSI = -1.0;
  *(_OWORD *)&self->_firstUWBRSSI = 0uLL;
  self->_lastNBRSSI = -1.79769313e308;
  *(int64x2_t *)&self->_lastUWBRSSI = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  *(int64x2_t *)&self->_maxNBRSSI = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(_OWORD *)&self->_minDistance_finding = xmmword_10040C8C0;
  *(_OWORD *)&self->_minUWBRSSI = xmmword_10040C8C0;
  self->_minYCoordinateFinder = 1.79769313e308;
  LOWORD(self->_maxYCoordinateFindee) = 0;
  if (LOBYTE(self->_minYCoordinateFindee)) {
    LOBYTE(self->_minYCoordinateFindee) = 0;
  }
  LODWORD(self->_lifecycleTimeoutType) = 0;
  p_lifecycleTimeoutType = &self->_lifecycleTimeoutType;
  *(_OWORD *)&self->_didFinderChangeFloor = 0u;
  self->_firstRawRangeValue = -1.79769313e308;
  *(_OWORD *)&self->_currentRawRangeValue = xmmword_10040C8D0;
  self->_minRawRangeValue = -1.0;
  self->_backgroundContinuationTimeoutType = 0LL;
  p_backgroundContinuationTimeoutType = &self->_backgroundContinuationTimeoutType;
  *(_DWORD *)((char *)&self->_backgroundContinuationTimeoutType + 7) = 0;
  uint64_t v23 = objc_opt_class(v7, v20);
  if (v23 == objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v24))
  {
    *(_DWORD *)p_lifecycleTimeoutType = 1;
    id v31 = v7;
    *p_backgroundContinuationTimeoutType = (NSString *)[v31 backgroundMode];
    LOBYTE(self->_sessionType) = [v31 _internalIsCameraAssistanceEnabled];

    goto LABEL_35;
  }

  uint64_t v26 = objc_opt_class(v7, v25);
  if (v26 == objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v27))
  {
    *(_DWORD *)p_lifecycleTimeoutType = 2;
    id v32 = v7;
    *p_backgroundContinuationTimeoutType = (NSString *)[v32 backgroundMode];
    LOBYTE(self->_sessionType) = [v32 _internalIsCameraAssistanceEnabled];
    id v33 = objc_claimAutoreleasedReturnValue([v32 accessoryConfigData]);
    id v34 = [v33 bytes];

    v35 = (void *)objc_claimAutoreleasedReturnValue([v32 accessoryConfigData]);
    id v36 = [v35 length];
    v70 = 0LL;
    v71 = 0LL;
    uint64_t v72 = 0LL;
    sub_100030B3C(&v70, v34, (uint64_t)v36 + (void)v34, (size_t)v36);

    v37 = v70;
    size_t v38 = v71 - (_BYTE *)v70;
    if ((unint64_t)(v71 - (_BYTE *)v70) >= 0x14)
    {
      uint64_t v54 = 0LL;
      unsigned int v55 = (unsigned __int16)*v70;
      BOOL v56 = !v70[1] && v55 == 1;
      BOOL v57 = v70[1] && v55 == 1;
      unsigned int v58 = (unsigned __int16)v70[8];
      uint64_t v59 = (unsigned __int16)v70[9];
      while (__PAIR64__(v59, v58) != __PAIR64__( (unsigned __int16)word_10040C980[v54 + 1],  (unsigned __int16)word_10040C980[v54]))
      {
        v54 += 2LL;
        if (v54 == 6)
        {
          int v60 = 0;
          goto LABEL_64;
        }
      }

      int v60 = 1;
LABEL_64:
      BOOL v61 = v58 == 1 && v59 > 2;
      int v62 = v61;
      int v63 = v58 <= 1 ? v62 : 1;
      int v64 = v55 > 1 || v56;
      if ((v64 | v57) == 1 && v60 | v63)
      {
        if (v60)
        {
        }

        else if (v63)
        {
          size_t v38 = 39LL;
        }

        else
        {
          size_t v38 = 0LL;
        }

        *(_DWORD *)buf = 0;
        *(_DWORD *)&buf[16] = 0;
        int v77 = 0;
        *(void *)&buf[5] = 0LL;
        *(_WORD *)&buf[13] = 0;
        memcpy(buf, v70, v38);
        char v65 = buf[4];
        if (buf[4] <= 0x14u
          && ((1 << buf[4]) & 0x100401) != 0
          && v76 <= 1u
          && BYTE2(v77) <= 1u
          && HIBYTE(v77) <= 8u
          && ((1 << SHIBYTE(v77)) & 0x10D) != 0)
        {
          BYTE1(self->_sessionType) = 1;
          BYTE2(self->_sessionType) = v65;
        }
      }
    }

    if (!v37)
    {
LABEL_34:

      goto LABEL_35;
    }

- (void)sessionPausedWithTimestamp:(double)a3
{
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 138412546;
    v8 = bundleIdentifier;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] sessionPausedWithTimestamp: %f [s]",  (uint8_t *)&v7,  0x16u);
  }

  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a3);
}

- (void)sessionInterruptedWithTimestamp:(double)a3
{
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 138412546;
    v8 = bundleIdentifier;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] sessionInterruptedWithTimestamp: %f [s]",  (uint8_t *)&v7,  0x16u);
  }

  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a3);
}

- (void)sessionInvalidatedWithTimestamp:(double)a3
{
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 138412546;
    v8 = bundleIdentifier;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] sessionInvalidatedWithTimestamp: %f [s]",  (uint8_t *)&v7,  0x16u);
  }

  -[NIServerAnalyticsManager _sessionStoppedWithTimestamp:](self, "_sessionStoppedWithTimestamp:", a3);
}

- (void)appBecameVisibleWithTimestamp:(double)a3
{
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v9 = 138412546;
    double v10 = bundleIdentifier;
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] appBecameVisibleWithTimestamp: %f [s]",  (uint8_t *)&v9,  0x16u);
  }

  if (self->_isRunning)
  {
    int v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      v8 = self->_bundleIdentifier;
      int v9 = 138412290;
      double v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] App already visible. Ignore duplicate call.",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    self->_visibilityUpdateTimestamp = self->_visibilityUpdateTimestamp + a3 - self->_runTimestamp;
    self->_runTimestamp = a3;
    self->_isRunning = 1;
  }

- (void)appBecameNotVisibleWithTimestamp:(double)a3
{
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v10 = 138412546;
    __int16 v11 = bundleIdentifier;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] appBecameNotVisibleWithTimestamp: %f [s]",  (uint8_t *)&v10,  0x16u);
  }

  if (self->_isRunning)
  {
    double v7 = *(double *)&self->_isVisible + a3 - self->_runTimestamp;
    self->_runTimestamp = a3;
    *(double *)&self->_isVisible = v7;
    self->_isRunning = 0;
  }

  else
  {
    v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v9 = self->_bundleIdentifier;
      int v10 = 138412290;
      __int16 v11 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] App already not visible. Ignore duplicate call.",  (uint8_t *)&v10,  0xCu);
    }
  }

- (void)updateWithRangeResult:(RangeResult *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (!HIBYTE(self->_sessionType))
    {
      HIBYTE(self->_sessionType) = 1;
      *(double *)&self->_lastVIOPosition[6] = a3->var1;
    }
  }

- (void)updateWithVIOPose:(Pose *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (a3[1].source.var0.__val_ == 2)
    {
      if (!*((_BYTE *)&self->_sessionType + 6)) {
        *((_BYTE *)&self->_sessionType + 6) = 1;
      }
      optional<double> lightEstimate = a3[1].lightEstimate;
      if (*((_BYTE *)&self->_sessionType + 7))
      {
        float32x4_t v4 = vsubq_f32(*(float32x4_t *)&self->_isCameraAssistanceEnabled, (float32x4_t)lightEstimate);
        float32x4_t v5 = vmulq_f32(v4, v4);
        self->_distanceMovedToHorizontalConvergence = self->_distanceMovedToHorizontalConvergence
                                                    + sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2),  vaddq_f32( v5,  (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
      }

      else
      {
        *((_BYTE *)&self->_sessionType + 7) = 1;
        self->_distanceMovedToHorizontalConvergence = 0.0;
      }
    }

    else
    {
      if (!*((_BYTE *)&self->_sessionType + 6)) {
        return;
      }
      ++LODWORD(self->_timeToHorizontalConvergence);
      *((_BYTE *)&self->_sessionType + 6) = 0;
      optional<double> lightEstimate = (optional<double>)0LL;
    }

    *(optional<double> *)&self->_isCameraAssistanceEnabled = lightEstimate;
  }

- (void)updateWithSASolution:(Solution *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (a3->var2.__engaged_)
    {
      if (!*((_BYTE *)&self->_sessionType + 4)) {
        *((_BYTE *)&self->_sessionType + 4) = 1;
      }
      if (!LOBYTE(self->_backgroundMode))
      {
        LOBYTE(self->_backgroundMode) = 1;
        if (!a3->var1.var1) {
          sub_10038AB8C();
        }
        self->_rangeAtHorizontalConvergence = a3->var1.var0.var1.var1 - *(double *)&self->_lastVIOPosition[6];
        self->_distanceMovedToVerticalConvergence = a3->var1.var0.var1.var2;
        *(double *)&self->_lastVIOPosition[14] = self->_distanceMovedToHorizontalConvergence;
      }
    }

    else if (*((_BYTE *)&self->_sessionType + 4))
    {
      *((_BYTE *)&self->_sessionType + 4) = 0;
      ++HIDWORD(self->_timeToHorizontalConvergence);
    }

    if (a3->var0.var0 == 1)
    {
      if (!*((_BYTE *)&self->_sessionType + 5)) {
        *((_BYTE *)&self->_sessionType + 5) = 1;
      }
      if (!BYTE1(self->_backgroundMode))
      {
        BYTE1(self->_backgroundMode) = 1;
        if (!a3->var1.var1) {
          sub_10038AB64();
        }
        self->_rangeAtVerticalConvergence = a3->var1.var0.var1.var1 - *(double *)&self->_lastVIOPosition[6];
        self->_totalDistanceMoved = a3->var1.var0.var1.var2;
        self->_firstRangeMeasurementTime = self->_distanceMovedToHorizontalConvergence;
      }
    }

    else if (*((_BYTE *)&self->_sessionType + 5))
    {
      *((_BYTE *)&self->_sessionType + 5) = 0;
      ++LODWORD(self->_timeToVerticalConvergence);
    }
  }

- (void)updateWithPeerDeviceType:(BOOL)a3
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    uint64_t v4 = 2706LL;
  }

  else
  {
    if (lifecycleTimeoutType != 3) {
      return;
    }
    uint64_t v4 = 2704LL;
  }

  *(_WORD *)((char *)&self->super.isa + v4) = a3 | 0x100;
}

- (void)updateWithFindeePeerData:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) != 3) {
    return;
  }
  int timeLocationFromWiFi_low = LODWORD(self->_timeLocationFromWiFi);
  BOOL v6 = __CFADD__(timeLocationFromWiFi_low, 1);
  int v7 = timeLocationFromWiFi_low + 1;
  if (v6) {
    int v7 = 1;
  }
  LODWORD(self->_timeLocationFromWiFi) = v7;
  if (*(double *)&self->_numberOfWalkingOrkUnknown == -1.0)
  {
    *(double *)&self->_numberOfWalkingOrkUnknown = sub_100023CC4();
    if (!*((_BYTE *)a3 + 16)) {
      goto LABEL_40;
    }
    LODWORD(self->_timeAtFirstPeerData) = *((_DWORD *)a3 + 2);
    BYTE4(self->_timeAtFirstPeerData) = 1;
    *(double *)&self->_numberOfMissedRanges = sub_100023CC4();
    if (*((_BYTE *)a3 + 72))
    {
      HIDWORD(self->_maxYCoordinateFindee) = *((_DWORD *)a3 + 10);
      LOBYTE(self->_minYCoordinateFindee) = 1;
    }
  }

  if (*((_BYTE *)a3 + 16))
  {
    int timeLocationFromWiFi_high = HIDWORD(self->_timeLocationFromWiFi);
    BOOL v6 = __CFADD__(timeLocationFromWiFi_high, 1);
    int v9 = timeLocationFromWiFi_high + 1;
    if (v6) {
      int v9 = 1;
    }
    HIDWORD(self->_timeLocationFromWiFi) = v9;
    uint64_t v10 = *((int *)a3 + 2);
    if (v10 <= 2)
    {
      uint64_t v11 = qword_10040C9A8[v10];
      int v12 = *(_DWORD *)((char *)&self->super.isa + v11);
      BOOL v6 = __CFADD__(v12, 1);
      int v13 = v12 + 1;
      if (v6) {
        int v13 = 1;
      }
      *(_DWORD *)((char *)&self->super.isa + v11) = v13;
    }

    if (BYTE4(self->_timeAtFirstPeerData))
    {
      unsigned int timeAtFirstPeerData_low = LODWORD(self->_timeAtFirstPeerData);
      if (timeAtFirstPeerData_low <= 2)
      {
        uint64_t v15 = qword_10040C990[timeAtFirstPeerData_low];
        *(double *)((char *)&self->super.isa + v15) = *(double *)((char *)&self->super.isa + v15)
                                                    + sub_100023CC4()
                                                    - *(double *)&self->_numberOfMissedRanges;
        LODWORD(self->_timeAtFirstPeerData) = timeAtFirstPeerData_low;
        BYTE4(self->_timeAtFirstPeerData) = 1;
      }

      *(double *)&self->_numberOfMissedRanges = sub_100023CC4();
      goto LABEL_22;
    }

- (void)updateWithMissedRange
{
  if (LODWORD(self->_lifecycleTimeoutType) == 3)
  {
    int numberOfSlowlyMoving = self->_numberOfSlowlyMoving;
    BOOL v3 = __CFADD__(numberOfSlowlyMoving, 1);
    int v4 = numberOfSlowlyMoving + 1;
    if (v3) {
      int v4 = 1;
    }
    self->_int numberOfSlowlyMoving = v4;
  }

- (void)_calculateAndLogErrorsFromIODeltaP:(NIServerAnalyticsManager *)self vioDeltaP:(SEL)a2 vioPos:
{
  float32x4_t v5 = v4;
  BOOL v6 = v3;
  uint64_t v7 = v2;
  double v9 = sub_100023CC4();
  float v10 = atan2f( vmlas_n_f32( (float)-COERCE_FLOAT(*(void *)(v7 + 8)) * COERCE_FLOAT(*v6),  COERCE_FLOAT(v6->i64[1]),  COERCE_FLOAT(*(_OWORD *)v7)),  vmlas_n_f32( vmuls_lane_f32(COERCE_FLOAT(*(void *)(v7 + 8)), *v6, 2),  COERCE_FLOAT(*v6),  COERCE_FLOAT(*(_OWORD *)v7)))
      * 57.2957795;
  int v11 = BYTE4(self->_pointToPointErrorHistory.__end_);
  else {
    float v12 = 0.0;
  }
  *(float *)&self->_pointToPointErrorHistory.__end_ = v10;
  BYTE4(self->_pointToPointErrorHistory.__end_) = 1;
  value = self->_angleErrorHistory.__end_cap_.__value_;
  end = self->_angleErrorHistory.__end_;
  uint64_t v15 = (char *)value - (char *)end;
  if ((unint64_t)((char *)value - (char *)end) <= 0x4AF)
  {
    uint64_t v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
    if ((unint64_t)v16 - *(void *)&self->_timeOfLastPDRUpdate.var0.__val_ <= 0x4AF
      && v9 - *(double *)&self->_pointToPointErrorHistory.__end_cap_.__value_ >= 0.5
      && (float *)((char *)self->_deltaAngleErrorHistory.__end_cap_.__value_
                 - (char *)self->_deltaAngleErrorHistory.__end_) <= (float *)0x4AF)
    {
      if (v11)
      {
        begin = self->_deltaAngleErrorHistory.__begin_;
        if (value >= begin)
        {
          uint64_t v19 = v15 >> 2;
          uint64_t v20 = (char *)begin - (char *)end;
          else {
            uint64_t v21 = v20 >> 1;
          }
          else {
            unint64_t v22 = v21;
          }
          uint64_t v23 = (char *)sub_100031724((uint64_t)&self->_deltaAngleErrorHistory, v22);
          uint64_t v24 = self->_angleErrorHistory.__end_cap_.__value_;
          uint64_t v25 = self->_angleErrorHistory.__end_;
          uint64_t v26 = (float *)&v23[4 * v19];
          uint64_t v28 = (float *)&v23[4 * v27];
          *uint64_t v26 = v12;
          int v18 = v26 + 1;
          while (v24 != v25)
          {
            int v29 = *((_DWORD *)v24-- - 1);
            *((_DWORD *)v26-- - 1) = v29;
          }

          self->_angleErrorHistory.__end_ = v26;
          self->_angleErrorHistory.__end_cap_.__value_ = v18;
          self->_deltaAngleErrorHistory.__begin_ = v28;
          if (v25) {
            operator delete(v25);
          }
        }

        else
        {
          float *value = v12;
          int v18 = value + 1;
        }

        self->_angleErrorHistory.__end_cap_.__value_ = v18;
        uint64_t v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
      }

      int v30 = self->_angleErrorHistory.__begin_;
      if (v16 >= v30)
      {
        double val = self->_timeOfLastPDRUpdate.var0.__val_;
        uint64_t v33 = ((uint64_t)v16 - *(void *)&val) >> 2;
        unint64_t v34 = (unint64_t)v30 - *(void *)&val;
        unint64_t v35 = ((uint64_t)v30 - *(void *)&val) >> 1;
        if (v35 <= v33 + 1) {
          unint64_t v35 = v33 + 1;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v36 = v35;
        }
        if (v36)
        {
          v37 = (char *)sub_100031724((uint64_t)&self->_angleErrorHistory, v36);
          uint64_t v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
          double val = self->_timeOfLastPDRUpdate.var0.__val_;
        }

        else
        {
          v37 = 0LL;
        }

        size_t v38 = (float *)&v37[4 * v33];
        unsigned __int8 v39 = (float *)&v37[4 * v36];
        *size_t v38 = v10;
        id v31 = v38 + 1;
        while (v16 != *(float **)&val)
        {
          int v40 = *((_DWORD *)v16-- - 1);
          *((_DWORD *)v38-- - 1) = v40;
        }

        *(void *)&self->_timeOfLastPDRUpdate.var0.__val_ = v38;
        *(void *)&self->_timeOfLastPDRUpdate.__engaged_ = v31;
        self->_angleErrorHistory.__begin_ = v39;
        if (val != 0.0) {
          operator delete(*(void **)&val);
        }
      }

      else
      {
        *uint64_t v16 = v10;
        id v31 = v16 + 1;
      }

      *(void *)&self->_timeOfLastPDRUpdate.__engaged_ = v31;
      double deltaVSourceTime = self->_deltaVSourceTime;
      if (deltaVSourceTime <= 0.0)
      {
LABEL_57:
        *(double *)&self->_pointToPointErrorHistory.__end_cap_.__value_ = v9;
        return;
      }

      float32x4_t v42 = vsubq_f32(*(float32x4_t *)&self->_anon_dc8[56], *v5);
      float32x4_t v43 = vmulq_f32(v42, v42);
      float v44 = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2),  vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0])
          / deltaVSourceTime;
      v45 = self->_deltaAngleErrorHistory.__end_cap_.__value_;
      v46 = self->_pointToPointErrorHistory.__begin_;
      if (v45 < v46)
      {
        float *v45 = v44;
        v47 = v45 + 1;
LABEL_56:
        self->_deltaAngleErrorHistory.__end_cap_.__value_ = v47;
        goto LABEL_57;
      }

      v48 = self->_deltaAngleErrorHistory.__end_;
      uint64_t v49 = v45 - v48;
      if (!((unint64_t)(v49 + 1) >> 62))
      {
        unint64_t v50 = (char *)v46 - (char *)v48;
        unint64_t v51 = ((char *)v46 - (char *)v48) >> 1;
        if (v51 <= v49 + 1) {
          unint64_t v51 = v49 + 1;
        }
        if (v50 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v51;
        }
        if (v52)
        {
          id v53 = (char *)sub_100031724((uint64_t)&self->_pointToPointErrorHistory, v52);
          v45 = self->_deltaAngleErrorHistory.__end_cap_.__value_;
          v48 = self->_deltaAngleErrorHistory.__end_;
        }

        else
        {
          id v53 = 0LL;
        }

        uint64_t v54 = (float *)&v53[4 * v49];
        unsigned int v55 = (float *)&v53[4 * v52];
        *uint64_t v54 = v44;
        v47 = v54 + 1;
        while (v45 != v48)
        {
          int v56 = *((_DWORD *)v45-- - 1);
          *((_DWORD *)v54-- - 1) = v56;
        }

        self->_deltaAngleErrorHistory.__end_ = v54;
        self->_deltaAngleErrorHistory.__end_cap_.__value_ = v47;
        self->_pointToPointErrorHistory.__begin_ = v55;
        if (v48) {
          operator delete(v48);
        }
        goto LABEL_56;
      }

- (void)_updateAlignedPDRMetrics:(const void *)a3
{
  double v5 = sub_100023CB0();
  double v6 = sub_100023CC4();
  double v7 = *(double *)a3 + v6 - v5;
  if (!LOBYTE(self->_vioPathLength) && *((_BYTE *)a3 + 32) && *((_BYTE *)a3 + 48) != 0)
  {
    float64x2_t v9 = *(float64x2_t *)((char *)a3 + 24);
    v9.f64[1] = *((float64_t *)a3 + 5);
    *(float32x2_t *)&v9.f64[0] = vcvt_f32_f64(v9);
    if (sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v9.f64[0], *(float32x2_t *)&v9.f64[0]))) / 0.1 > 0.15)
    {
      self->_noOdometryAvailableTime = v6;
      LOBYTE(self->_vioPathLength) = 1;
    }
  }

  sub_10030CB34((uint64_t)&self->_rangeAtFirstArrow, (uint64_t)a3, (uint64_t)&v28, v7);
  int v10 = sub_10030C71C((uint64_t)&self->_rangeAtFirstArrow);
  v11.n128_f64[0] = v7;
  sub_10030CAC4(&self->_rangeAtFirstArrow, (uint64_t)v25, v11);
  if (v10 != 5)
  {
    LODWORD(self->_timeAtFirstIOPose.var0.__val_) = v10;
    return;
  }

  if (LODWORD(self->_timeAtFirstIOPose.var0.__val_) == 5)
  {
    v23.i8[0] = 0;
    char v24 = 0;
    if (!v27) {
      return;
    }
LABEL_18:
    float32x4_t v12 = vsubq_f32(v26, *(float32x4_t *)self->_integratedPDRVIOFrame);
    char v22 = 1;
    float32x4_t v21 = v12;
    int null_state = self->_previousAdjustedRotatedVioPosition.var0.__null_state_;
    double v14 = 0.0;
    if (self->_previousAdjustedRotatedVioPosition.var0.__null_state_)
    {
      int null_state = self->_anon_e42[22];
      if (self->_anon_e42[22])
      {
        float32x4_t v15 = vsubq_f32(v12, *(float32x4_t *)&self->_previousVioIsNotAvailable);
        int null_state = 1;
        char v24 = 1;
        float32x4_t v23 = v15;
        double v16 = v7 - *(double *)&self->_anon_e42[14];
        if (v16 <= 0.0)
        {
          int v18 = 0;
          double v14 = 0.0;
          goto LABEL_23;
        }

        float32x4_t v17 = vmulq_f32(v15, v15);
        *(double *)v17.i64 = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2),  vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
        double v14 = *(double *)v17.i64 / v16;
        self->_double deltaVSourceTime = self->_deltaVSourceTime + *(double *)v17.i64;
      }
    }

    *(float32x4_t *)&self->_previousVioIsNotAvailable = v21;
    self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = v22;
    *(double *)&self->_anon_e42[14] = v7;
    self->_anon_e42[22] = 1;
    int v18 = null_state;
LABEL_23:
    if (v29)
    {
      float32x4_t v19 = v28;
      *(float32x4_t *)&self->_anon_dc8[56] = vaddq_f32(v28, *(float32x4_t *)&self->_anon_dc8[56]);
      if (v18)
      {
        if (null_state)
        {
          float32x4_t v20 = vmulq_f32(v19, v19);
          if (sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2),  vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0])
             / 0.1 > 0.15
            && v14 > 0.15)
          {
            -[NIServerAnalyticsManager _calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:]( self,  "_calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:",  &v28,  &v23,  &v21);
          }
        }
      }
    }

    return;
  }

  *(_OWORD *)&self->_anon_dc8[56] = 0u;
  self->_double deltaVSourceTime = 0.0;
  if (self->_previousAdjustedRotatedVioPosition.var0.__null_state_) {
    self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = 0;
  }
  if (v27)
  {
    *(float32x4_t *)self->_integratedPDRVIOFrame = v26;
    LODWORD(self->_timeAtFirstIOPose.var0.__val_) = 5;
    v23.i8[0] = 0;
    char v24 = 0;
    goto LABEL_18;
  }

- (void)updateWithPDR:(const void *)a3
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    -[NIServerAnalyticsManager _updateAlignedPDRMetrics:](self, "_updateAlignedPDRMetrics:", a3);
    double v6 = *(double *)&self->_isFinderAPhone.var0.__null_state_;
    if (v6 == -1.0)
    {
      double v6 = *(double *)a3;
      *(void *)&self->_isFinderAPhone.var0.__null_state_ = *(void *)a3;
    }

    double v7 = *(double *)a3;
    __int128 v8 = *((_OWORD *)a3 + 7);
    v53[6] = *((_OWORD *)a3 + 6);
    v53[7] = v8;
    __int128 v9 = *((_OWORD *)a3 + 9);
    v53[8] = *((_OWORD *)a3 + 8);
    v53[9] = v9;
    __int128 v10 = *((_OWORD *)a3 + 3);
    v53[2] = *((_OWORD *)a3 + 2);
    v53[3] = v10;
    __int128 v11 = *((_OWORD *)a3 + 5);
    v53[4] = *((_OWORD *)a3 + 4);
    v53[5] = v11;
    __int128 v12 = *((_OWORD *)a3 + 1);
    v53[0] = *(_OWORD *)a3;
    v53[1] = v12;
    if (!-[NIServerAnalyticsManager _isPDRAvailable:](self, "_isPDRAvailable:", v53)
      || !BYTE2(self->_numberOfSolutions))
    {
      goto LABEL_33;
    }

    double v13 = v7 - v6;
    *(double *)&self->_anon_9d8[176] = v13 + *(double *)&self->_anon_9d8[176];
    double pdrSSDetectionFalsePositiveRate = self->_pdrSSDetectionFalsePositiveRate;
    if (pdrSSDetectionFalsePositiveRate == -1.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = pdrSSDetectionFalsePositiveRate + 1.0;
    }
    self->_double pdrSSDetectionFalsePositiveRate = v15;
    if (!*((_BYTE *)a3 + 32) || !*((_BYTE *)a3 + 48)) {
      goto LABEL_35;
    }
    double v16 = sqrt(*((double *)a3 + 5) * *((double *)a3 + 5) + *((double *)a3 + 3) * *((double *)a3 + 3));
    self->_timePDRAndVIOWasAvailable = self->_timePDRAndVIOWasAvailable + v16;
    __int128 v17 = *(_OWORD *)&self->_anon_3a8[40];
    v58[6] = *(_OWORD *)&self->_anon_3a8[24];
    v58[7] = v17;
    v58[8] = *(_OWORD *)&self->_anon_3a8[56];
    __int128 v18 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
    v58[2] = self->_lastPose.var0.__val_.lightEstimate;
    v58[3] = v18;
    __int128 v19 = *(_OWORD *)&self->_anon_3a8[8];
    v58[4] = *(_OWORD *)&self->_lastPose.__engaged_;
    v58[5] = v19;
    __int128 v20 = *(_OWORD *)&self->_lastPose.var0.__null_state_;
    v58[0] = *(_OWORD *)&self->_anon_318[72];
    v58[1] = v20;
    __int128 v21 = *(_OWORD *)&self->_anon_af8[8];
    __int128 v22 = *(_OWORD *)&self->_anon_af8[40];
    v57[6] = *(_OWORD *)&self->_anon_af8[24];
    v57[7] = v22;
    v57[8] = *(_OWORD *)&self->_anon_af8[56];
    __int128 v23 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_;
    __int128 v24 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_;
    v57[2] = self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate;
    v57[3] = v24;
    v57[4] = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_;
    v57[5] = v21;
    v57[0] = *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable;
    v57[1] = v23;
    -[NIServerAnalyticsManager _deltaDistanceFromVIOPoses::](self, "_deltaDistanceFromVIOPoses::", v58, v57);
    self->_timeAtLastIOUpdate = v25 + self->_timeAtLastIOUpdate;
    if (v13 <= 0.0)
    {
      BOOL v30 = 0;
    }

    else
    {
      double v26 = v25 / v13;
      double percentTimeSSFromVIO = self->_percentTimeSSFromVIO;
      double v28 = v26 - percentTimeSSFromVIO;
      double v29 = percentTimeSSFromVIO + (v26 - percentTimeSSFromVIO) / self->_pdrSSDetectionFalsePositiveRate;
      self->_double percentTimeSSFromVIO = v29;
      self->_numberOfPDRUpdates = self->_numberOfPDRUpdates + v28 * (v26 - v29);
      BOOL v30 = v16 / v13 == 0.0;
    }

    __int128 v39 = *(_OWORD *)&self->_anon_3a8[40];
    v56[6] = *(_OWORD *)&self->_anon_3a8[24];
    v56[7] = v39;
    v56[8] = *(_OWORD *)&self->_anon_3a8[56];
    __int128 v40 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
    v56[2] = self->_lastPose.var0.__val_.lightEstimate;
    v56[3] = v40;
    __int128 v41 = *(_OWORD *)&self->_anon_3a8[8];
    v56[4] = *(_OWORD *)&self->_lastPose.__engaged_;
    v56[5] = v41;
    __int128 v42 = *(_OWORD *)&self->_lastPose.var0.__null_state_;
    v56[0] = *(_OWORD *)&self->_anon_318[72];
    v56[1] = v42;
    __int128 v43 = *(_OWORD *)&self->_anon_af8[40];
    v55[6] = *(_OWORD *)&self->_anon_af8[24];
    v55[7] = v43;
    v55[8] = *(_OWORD *)&self->_anon_af8[56];
    __int128 v44 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_;
    v55[2] = self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate;
    v55[3] = v44;
    __int128 v45 = *(_OWORD *)&self->_anon_af8[8];
    v55[4] = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_;
    v55[5] = v45;
    __int128 v46 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_;
    v55[0] = *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable;
    v55[1] = v46;
    unsigned int v47 = -[NIServerAnalyticsManager _isSemiStaticFromVIO:::](self, "_isSemiStaticFromVIO:::", v56, v55, v13);
    if (v30)
    {
      if (v47)
      {
        self->_timeSSFromVIO = v13 + self->_timeSSFromVIO;
LABEL_29:
        uint64_t v48 = 368LL;
LABEL_32:
        *(double *)&(&self->super.isa)[v48] = v13 + *(double *)&(&self->super.isa)[v48];
LABEL_33:
        __int128 v49 = *(_OWORD *)&self->_lastPose.__engaged_;
        *(_OWORD *)&self->_anon_af8[8] = *(_OWORD *)&self->_anon_3a8[8];
        __int128 v50 = *(_OWORD *)&self->_anon_3a8[40];
        *(_OWORD *)&self->_anon_af8[24] = *(_OWORD *)&self->_anon_3a8[24];
        *(_OWORD *)&self->_anon_af8[40] = v50;
        __int128 v51 = *(_OWORD *)&self->_anon_318[72];
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
        __int128 v52 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
        self->_vioPoseAtLastPDRUpdate.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_ = v52;
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_ = v49;
        self->_anon_af8[56] = self->_anon_3a8[56];
        *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable = v51;
        self->_pdrTimeAtFirstPDRUpdate = *(double *)a3;
        *(void *)&self->_isFinderAPhone.var0.__null_state_ = *(void *)a3;
        return;
      }

      self->_timeNotSSFromVIO = v13 + self->_timeNotSSFromVIO;
    }

    else if ((v47 & 1) != 0)
    {
      goto LABEL_29;
    }

    uint64_t v48 = 369LL;
    goto LABEL_32;
  }

  if (lifecycleTimeoutType == 3)
  {
    if (self->_timeFindeeWasWalkingOrUnknown == -1.0)
    {
      self->_timeFindeeWasWalkingOrUnknown = *(double *)a3;
LABEL_23:
      self->_pdrTimeAtFirstPDRUpdate = *(double *)a3;
      return;
    }

    int pdrTimeAtLastPDRUpdate_low = LOBYTE(self->_pdrTimeAtLastPDRUpdate);
    __int128 v32 = *((_OWORD *)a3 + 7);
    v54[6] = *((_OWORD *)a3 + 6);
    v54[7] = v32;
    __int128 v33 = *((_OWORD *)a3 + 9);
    v54[8] = *((_OWORD *)a3 + 8);
    v54[9] = v33;
    __int128 v34 = *((_OWORD *)a3 + 3);
    v54[2] = *((_OWORD *)a3 + 2);
    v54[3] = v34;
    __int128 v35 = *((_OWORD *)a3 + 5);
    v54[4] = *((_OWORD *)a3 + 4);
    v54[5] = v35;
    __int128 v36 = *((_OWORD *)a3 + 1);
    v54[0] = *(_OWORD *)a3;
    v54[1] = v36;
    if (!-[NIServerAnalyticsManager _isPDRAvailable:](self, "_isPDRAvailable:", v54)) {
      goto LABEL_23;
    }
    LOBYTE(self->_pdrTimeAtLastPDRUpdate) = 1;
    if (*((_BYTE *)a3 + 32) && *((_BYTE *)a3 + 48))
    {
      double v37 = sqrt(*((double *)a3 + 5) * *((double *)a3 + 5) + *((double *)a3 + 3) * *((double *)a3 + 3));
      if (pdrTimeAtLastPDRUpdate_low)
      {
        double v38 = *(double *)a3 - self->_pdrTimeAtFirstPDRUpdate;
        if (v37 / v38 < 0.1) {
          self->_distanceTraveledFromPDR = v38 + self->_distanceTraveledFromPDR;
        }
      }

      self->_timeToSessionEnd = v37 + self->_timeToSessionEnd;
      goto LABEL_23;
    }

- (void)updateWithSuccessfulRange:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    -[NIServerAnalyticsManager _updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:]( self,  "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:",  *(void *)&a5.var0.__val_,  *(void *)&a5.__engaged_,  a3,  a4);
    if (self->_timeAtArmsLength == -1.0) {
      self->_timeAtArmsLength = sub_100023CC4();
    }
    int numberOfArrowAvailabilityAfterFirstArrow = self->_numberOfArrowAvailabilityAfterFirstArrow;
    BOOL v8 = __CFADD__(numberOfArrowAvailabilityAfterFirstArrow, 1);
    int v11 = numberOfArrowAvailabilityAfterFirstArrow + 1;
    if (v8) {
      int v11 = 1;
    }
    self->_int numberOfArrowAvailabilityAfterFirstArrow = v11;
  }

  else if (lifecycleTimeoutType == 3)
  {
    int numberOfVIOFromPeerData = self->_numberOfVIOFromPeerData;
    BOOL v8 = __CFADD__(numberOfVIOFromPeerData, 1);
    int v9 = numberOfVIOFromPeerData + 1;
    if (v8) {
      int v9 = 1;
    }
    self->_int numberOfVIOFromPeerData = v9;
    -[NIServerAnalyticsManager _updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:]( self,  "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:",  *(void *)&a5.var0.__val_,  *(void *)&a5.__engaged_,  a3,  a4);
  }

- (void)updateWithSelfLocation:(const LocationInput *)a3
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 3)
  {
    int var11 = a3->var11;
    double timeAtLastLocationUpdate = self->_timeAtLastLocationUpdate;
    double v7 = sub_100023CC4();
    if (timeAtLastLocationUpdate == -1.0)
    {
      self->_double timeAtLastLocationUpdate = v7;
    }

    else
    {
      if (!*((_BYTE *)&self->_numberOfLostVerticalConvergence + 4)) {
        sub_100006080();
      }
      switch(self->_numberOfLostVerticalConvergence)
      {
        case 0:
          double v9 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v9 > 10.0) {
            double v9 = 10.0;
          }
          self->_timeLocationFromMCC = self->_timeLocationFromMCC + v9;
          break;
        case 1:
          double v10 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v10 > 10.0) {
            double v10 = 10.0;
          }
          self->_timeLocationFromCell = self->_timeLocationFromCell + v10;
          break;
        case 3:
          double v12 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v12 > 10.0) {
            double v12 = 10.0;
          }
          *(double *)&self->_lastLocationType = *(double *)&self->_lastLocationType + v12;
          break;
        case 4:
          double v13 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v13 > 10.0) {
            double v13 = 10.0;
          }
          self->_timeLocationFromPipeline = self->_timeLocationFromPipeline + v13;
          break;
        case 6:
        case 0xA:
          double v8 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v8 > 10.0) {
            double v8 = 10.0;
          }
          self->_timeAtFirstLocationUpdate = self->_timeAtFirstLocationUpdate + v8;
          break;
        case 7:
          double v14 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v14 > 10.0) {
            double v14 = 10.0;
          }
          self->_timeLocationFromGPS = self->_timeLocationFromGPS + v14;
          break;
        case 8:
          double v15 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v15 > 10.0) {
            double v15 = 10.0;
          }
          self->_timeLocationFromLAC = self->_timeLocationFromLAC + v15;
          break;
        case 9:
          double v16 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v16 > 10.0) {
            double v16 = 10.0;
          }
          self->_timeLocationFromCompensated = self->_timeLocationFromCompensated + v16;
          break;
        case 0xB:
          double v17 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v17 > 10.0) {
            double v17 = 10.0;
          }
          self->_timeLocationFromUnknown = self->_timeLocationFromUnknown + v17;
          break;
        case 0xC:
          double v18 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v18 > 10.0) {
            double v18 = 10.0;
          }
          self->_timeLocationFromAccessory = self->_timeLocationFromAccessory + v18;
          break;
        case 0xD:
          double v19 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v19 > 10.0) {
            double v19 = 10.0;
          }
          self->_timeLocationFromGPSCoarse = self->_timeLocationFromGPSCoarse + v19;
          break;
        default:
          int v11 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_10038ABB4(v11);
          }
          break;
      }
    }

    self->_numberOfLostVerticalConvergence = var11;
    *((_BYTE *)&self->_numberOfLostVerticalConvergence + 4) = 1;
    *(double *)&self->_numberOfInvalidPose = sub_100023CC4();
  }

  else if (lifecycleTimeoutType == 4 && self->_timeAtFirstFindeeData == -1.0)
  {
    self->_timeAtFirstFindeeData = sub_100023CC4();
  }

- (void)updateWithAcquisitionReason:(int)a3
{
  if ((LODWORD(self->_lifecycleTimeoutType) - 3) <= 1)
  {
    LODWORD(self->_runningMeanSpeedFromVIO) = a3;
    int v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  LODWORD(self->_runningMeanSpeedFromVIO)));
    -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"AcquisitionReason");

    id v6 = -[NSMutableDictionary mutableCopy](v4, "mutableCopy");
    double v7 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      *(_DWORD *)buf = 138412802;
      double v14 = bundleIdentifier;
      __int16 v15 = 2112;
      double v16 = @"com.apple.nearbyinteraction.findingsession.begin";
      __int16 v17 = 2112;
      double v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] send analytics event %@:\n%@\n",  buf,  0x20u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002B200;
    v11[3] = &unk_1007A2298;
    id v10 = v6;
    id v12 = v10;
    AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.findingsession.begin", v11);
  }

- (void)updateWithPose:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    double v5 = sub_100023CC4();
    if (BYTE2(self->_numberOfSolutions)) {
      BOOL v6 = *((_DWORD *)a3 + 20) == 2;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      double v7 = v5;
      if (self->_timePeerLocationFromFindeeData == -1.0)
      {
        self->_timePeerLocationFromFindeeData = v5;
        self->_maxRawRangeValue = self->_firstNBRSSI;
      }

      __int128 v8 = *((_OWORD *)a3 + 5);
      v118[4] = *((_OWORD *)a3 + 4);
      __int128 v119 = v8;
      __int128 v9 = *((_OWORD *)a3 + 7);
      __int128 v120 = *((_OWORD *)a3 + 6);
      __int128 v121 = v9;
      __int128 v10 = *((_OWORD *)a3 + 1);
      v118[0] = *(_OWORD *)a3;
      v118[1] = v10;
      __int128 v11 = *((_OWORD *)a3 + 3);
      v118[2] = *((_OWORD *)a3 + 2);
      v118[3] = v11;
      if (BYTE1(self->_numberOfSolutions)) {
        LODWORD(v119) = 1;
      }
      sub_10030D41C((uint64_t)&self->_rangeAtFirstArrow, (uint64_t)v118, (uint64_t)&v117);
      if (*((_DWORD *)a3 + 20) == 2)
      {
        BYTE2(self->_numberOfSolutions) = 1;
        double minUWBRSSI = *((float *)a3 + 17);
        double minNBRSSI = self->_minNBRSSI;
        if (minNBRSSI <= minUWBRSSI) {
          double minNBRSSI = *((float *)a3 + 17);
        }
        self->_double minNBRSSI = minNBRSSI;
        if (self->_minUWBRSSI < minUWBRSSI) {
          double minUWBRSSI = self->_minUWBRSSI;
        }
        self->_double minUWBRSSI = minUWBRSSI;
        LOBYTE(self->_maxYCoordinateFindee) |= minNBRSSI - minUWBRSSI > 2.5;
        if (self->_timeAtLastLocationFromFindeeData == -1.0)
        {
          self->_timeAtLastLocationFromFindeeData = v7;
          p_numberOfVIOResets = &self->_numberOfVIOResets;
          __int128 v15 = *(_OWORD *)a3;
          __int128 v16 = *((_OWORD *)a3 + 1);
          __int128 v17 = *((_OWORD *)a3 + 3);
          if (self->_anon_318[56])
          {
            self->_firstPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstPose.var0.__val_.source.var0.__null_state_ = v17;
            *(_OWORD *)p_numberOfVIOResets = v15;
            *(_OWORD *)&self->_firstPose.var0.__null_state_ = v16;
            __int128 v18 = *((_OWORD *)a3 + 4);
            __int128 v19 = *((_OWORD *)a3 + 5);
            __int128 v20 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_318[40] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_318[8] = v19;
            *(_OWORD *)&self->_anon_318[24] = v20;
            *(_OWORD *)&self->_firstPose.__engaged_ = v18;
          }

          else
          {
            self->_firstPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstPose.var0.__val_.source.var0.__null_state_ = v17;
            *(_OWORD *)p_numberOfVIOResets = v15;
            *(_OWORD *)&self->_firstPose.var0.__null_state_ = v16;
            __int128 v24 = *((_OWORD *)a3 + 4);
            __int128 v25 = *((_OWORD *)a3 + 5);
            __int128 v26 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_318[24] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_318[40] = v26;
            *(_OWORD *)&self->_firstPose.__engaged_ = v24;
            *(_OWORD *)&self->_anon_318[8] = v25;
            self->_anon_318[56] = 1;
          }

          p_firstOutputRangeStraightLineDistance = &self->_firstOutputRangeStraightLineDistance;
          __int128 v28 = *(_OWORD *)a3;
          __int128 v29 = *((_OWORD *)a3 + 1);
          __int128 v30 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance))
          {
            self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v30;
            *(_OWORD *)p_firstOutputRangeStraightLineDistance = v28;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v29;
            __int128 v31 = *((_OWORD *)a3 + 4);
            __int128 v32 = *((_OWORD *)a3 + 5);
            __int128 v33 = *((_OWORD *)a3 + 6);
            self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v32;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v33;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.__engaged_ = v31;
          }

          else
          {
            self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v30;
            *(_OWORD *)p_firstOutputRangeStraightLineDistance = v28;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v29;
            __int128 v34 = *((_OWORD *)a3 + 4);
            __int128 v35 = *((_OWORD *)a3 + 5);
            __int128 v36 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v36;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.__engaged_ = v34;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v35;
            LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 1;
          }

          double v37 = &self->_anon_648[168];
          __int128 v38 = *(_OWORD *)a3;
          __int128 v39 = *((_OWORD *)a3 + 1);
          __int128 v40 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance))
          {
            self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v40;
            *(_OWORD *)double v37 = v38;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v39;
            __int128 v41 = *((_OWORD *)a3 + 4);
            __int128 v42 = *((_OWORD *)a3 + 5);
            __int128 v43 = *((_OWORD *)a3 + 6);
            self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v42;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v43;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.__engaged_ = v41;
          }

          else
          {
            self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v40;
            *(_OWORD *)double v37 = v38;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v39;
            __int128 v44 = *((_OWORD *)a3 + 4);
            __int128 v45 = *((_OWORD *)a3 + 5);
            __int128 v46 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v46;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.__engaged_ = v44;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v45;
            LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 1;
          }

          unsigned int v47 = &self->_anon_778[168];
          __int128 v48 = *(_OWORD *)a3;
          __int128 v49 = *((_OWORD *)a3 + 1);
          __int128 v50 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_armsReachUserMovedDistance.traveledDistance))
          {
            self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v50;
            *(_OWORD *)unsigned int v47 = v48;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v49;
            __int128 v51 = *((_OWORD *)a3 + 4);
            __int128 v52 = *((_OWORD *)a3 + 5);
            __int128 v53 = *((_OWORD *)a3 + 6);
            self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v52;
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v53;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.__engaged_ = v51;
          }

          else
          {
            self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v50;
            *(_OWORD *)unsigned int v47 = v48;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v49;
            __int128 v54 = *((_OWORD *)a3 + 4);
            __int128 v55 = *((_OWORD *)a3 + 5);
            __int128 v56 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v56;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.__engaged_ = v54;
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v55;
            LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 1;
          }

          BOOL v57 = &self->_anon_8a8[168];
          __int128 v58 = *(_OWORD *)a3;
          __int128 v59 = *((_OWORD *)a3 + 1);
          __int128 v60 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_totalUserMovedDistance.traveledDistance))
          {
            self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v60;
            *(_OWORD *)BOOL v57 = v58;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v59;
            __int128 v61 = *((_OWORD *)a3 + 4);
            __int128 v62 = *((_OWORD *)a3 + 5);
            __int128 v63 = *((_OWORD *)a3 + 6);
            self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v62;
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v63;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.__engaged_ = v61;
          }

          else
          {
            self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v60;
            *(_OWORD *)BOOL v57 = v58;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v59;
            __int128 v64 = *((_OWORD *)a3 + 4);
            __int128 v65 = *((_OWORD *)a3 + 5);
            __int128 v66 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v66;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.__engaged_ = v64;
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v65;
            LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 1;
          }

          __int128 v67 = &self->_anon_648[8];
          __int128 v68 = *(_OWORD *)a3;
          __int128 v69 = *((_OWORD *)a3 + 1);
          __int128 v70 = *((_OWORD *)a3 + 3);
          if (self->_anon_648[136])
          {
            *(_OWORD *)&self->_anon_648[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_648[56] = v70;
            *(_OWORD *)__int128 v67 = v68;
            *(_OWORD *)&self->_anon_648[24] = v69;
            __int128 v71 = *((_OWORD *)a3 + 4);
            __int128 v72 = *((_OWORD *)a3 + 5);
            __int128 v73 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_648[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_648[88] = v72;
            *(_OWORD *)&self->_anon_648[104] = v73;
            *(_OWORD *)&self->_anon_648[72] = v71;
          }

          else
          {
            *(_OWORD *)&self->_anon_648[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_648[56] = v70;
            *(_OWORD *)__int128 v67 = v68;
            *(_OWORD *)&self->_anon_648[24] = v69;
            __int128 v74 = *((_OWORD *)a3 + 4);
            __int128 v75 = *((_OWORD *)a3 + 5);
            __int128 v76 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_648[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_648[120] = v76;
            *(_OWORD *)&self->_anon_648[72] = v74;
            *(_OWORD *)&self->_anon_648[88] = v75;
            self->_anon_648[136] = 1;
          }

          int v77 = &self->_anon_778[8];
          __int128 v78 = *(_OWORD *)a3;
          __int128 v79 = *((_OWORD *)a3 + 1);
          __int128 v80 = *((_OWORD *)a3 + 3);
          if (self->_anon_778[136])
          {
            *(_OWORD *)&self->_anon_778[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_778[56] = v80;
            *(_OWORD *)int v77 = v78;
            *(_OWORD *)&self->_anon_778[24] = v79;
            __int128 v81 = *((_OWORD *)a3 + 4);
            __int128 v82 = *((_OWORD *)a3 + 5);
            __int128 v83 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_778[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_778[88] = v82;
            *(_OWORD *)&self->_anon_778[104] = v83;
            *(_OWORD *)&self->_anon_778[72] = v81;
          }

          else
          {
            *(_OWORD *)&self->_anon_778[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_778[56] = v80;
            *(_OWORD *)int v77 = v78;
            *(_OWORD *)&self->_anon_778[24] = v79;
            __int128 v84 = *((_OWORD *)a3 + 4);
            __int128 v85 = *((_OWORD *)a3 + 5);
            __int128 v86 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_778[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_778[120] = v86;
            *(_OWORD *)&self->_anon_778[72] = v84;
            *(_OWORD *)&self->_anon_778[88] = v85;
            self->_anon_778[136] = 1;
          }

          v87 = &self->_anon_8a8[8];
          __int128 v88 = *(_OWORD *)a3;
          __int128 v89 = *((_OWORD *)a3 + 1);
          __int128 v90 = *((_OWORD *)a3 + 3);
          if (self->_anon_8a8[136])
          {
            *(_OWORD *)&self->_anon_8a8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_8a8[56] = v90;
            *(_OWORD *)v87 = v88;
            *(_OWORD *)&self->_anon_8a8[24] = v89;
            __int128 v91 = *((_OWORD *)a3 + 4);
            __int128 v92 = *((_OWORD *)a3 + 5);
            __int128 v93 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_8a8[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_8a8[88] = v92;
            *(_OWORD *)&self->_anon_8a8[104] = v93;
            *(_OWORD *)&self->_anon_8a8[72] = v91;
          }

          else
          {
            *(_OWORD *)&self->_anon_8a8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_8a8[56] = v90;
            *(_OWORD *)v87 = v88;
            *(_OWORD *)&self->_anon_8a8[24] = v89;
            __int128 v94 = *((_OWORD *)a3 + 4);
            __int128 v95 = *((_OWORD *)a3 + 5);
            __int128 v96 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_8a8[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_8a8[120] = v96;
            *(_OWORD *)&self->_anon_8a8[72] = v94;
            *(_OWORD *)&self->_anon_8a8[88] = v95;
            self->_anon_8a8[136] = 1;
          }

          v97 = &self->_anon_9d8[8];
          __int128 v98 = *(_OWORD *)a3;
          __int128 v99 = *((_OWORD *)a3 + 1);
          __int128 v100 = *((_OWORD *)a3 + 3);
          if (self->_anon_9d8[136])
          {
            *(_OWORD *)&self->_anon_9d8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_9d8[56] = v100;
            *(_OWORD *)v97 = v98;
            *(_OWORD *)&self->_anon_9d8[24] = v99;
            __int128 v101 = *((_OWORD *)a3 + 4);
            __int128 v102 = *((_OWORD *)a3 + 5);
            __int128 v103 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_9d8[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_9d8[88] = v102;
            *(_OWORD *)&self->_anon_9d8[104] = v103;
            *(_OWORD *)&self->_anon_9d8[72] = v101;
          }

          else
          {
            *(_OWORD *)&self->_anon_9d8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_9d8[56] = v100;
            *(_OWORD *)v97 = v98;
            *(_OWORD *)&self->_anon_9d8[24] = v99;
            __int128 v104 = *((_OWORD *)a3 + 4);
            __int128 v105 = *((_OWORD *)a3 + 5);
            __int128 v106 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_9d8[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_9d8[120] = v106;
            *(_OWORD *)&self->_anon_9d8[72] = v104;
            *(_OWORD *)&self->_anon_9d8[88] = v105;
            self->_anon_9d8[136] = 1;
          }

          *(void *)&self->_anon_648[152] = 0LL;
          *(void *)&self->_anon_778[152] = 0LL;
          *(void *)&self->_anon_8a8[152] = 0LL;
          *(void *)&self->_anon_9d8[152] = 0LL;
        }

        if (self->_timeAtFirstPose == -1.0) {
          -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:]( self,  "_updateUserMovedDistanceWithPose:lastPoseInfo:",  a3,  &self->_firstOutputRangeStraightLineDistance);
        }
        if (self->_timeAtFirstValidPose == -1.0) {
          -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:]( self,  "_updateUserMovedDistanceWithPose:lastPoseInfo:",  a3,  &self->_anon_648[168]);
        }
        if (self->_timeAtFirstArrow == -1.0) {
          -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:]( self,  "_updateUserMovedDistanceWithPose:lastPoseInfo:",  a3,  &self->_anon_778[168]);
        }
        -[NIServerAnalyticsManager _updateUserMovedDistanceWithPose:lastPoseInfo:]( self,  "_updateUserMovedDistanceWithPose:lastPoseInfo:",  a3,  &self->_anon_8a8[168]);
      }

      v107 = &self->_anon_318[72];
      __int128 v108 = *(_OWORD *)a3;
      __int128 v109 = *((_OWORD *)a3 + 1);
      __int128 v110 = *((_OWORD *)a3 + 3);
      if (self->_anon_3a8[56])
      {
        self->_lastPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
        *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_ = v110;
        *(_OWORD *)v107 = v108;
        *(_OWORD *)&self->_lastPose.var0.__null_state_ = v109;
        __int128 v111 = *((_OWORD *)a3 + 4);
        __int128 v112 = *((_OWORD *)a3 + 5);
        __int128 v113 = *((_OWORD *)a3 + 6);
        *(void *)&self->_anon_3a8[40] = *((void *)a3 + 14);
        *(_OWORD *)&self->_anon_3a8[8] = v112;
        *(_OWORD *)&self->_anon_3a8[24] = v113;
        *(_OWORD *)&self->_lastPose.__engaged_ = v111;
      }

      else
      {
        self->_lastPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
        *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_ = v110;
        *(_OWORD *)v107 = v108;
        *(_OWORD *)&self->_lastPose.var0.__null_state_ = v109;
        __int128 v114 = *((_OWORD *)a3 + 4);
        __int128 v115 = *((_OWORD *)a3 + 5);
        __int128 v116 = *((_OWORD *)a3 + 7);
        *(_OWORD *)&self->_anon_3a8[24] = *((_OWORD *)a3 + 6);
        *(_OWORD *)&self->_anon_3a8[40] = v116;
        *(_OWORD *)&self->_lastPose.__engaged_ = v114;
        *(_OWORD *)&self->_anon_3a8[8] = v115;
        self->_anon_3a8[56] = 1;
      }
    }

    else
    {
      int armsReachAlgorithmSource = self->_armsReachAlgorithmSource;
      BOOL v22 = __CFADD__(armsReachAlgorithmSource, 1);
      int v23 = armsReachAlgorithmSource + 1;
      if (v22) {
        int v23 = 1;
      }
      self->_int armsReachAlgorithmSource = v23;
      -[NIServerAnalyticsManager _onVIOReset](self, "_onVIOReset", v5);
      BYTE2(self->_numberOfSolutions) = 0;
      self->_maxYCoordinateFinder = -1.79769313e308;
      self->_minYCoordinateFinder = 1.79769313e308;
    }
  }

- (void)_updateUserMovedDistanceWithPose:(const void *)a3 lastPoseInfo:(void *)a4
{
  if (*((_BYTE *)a4 + 128) && *((_BYTE *)a4 + 272))
  {
    float32x4_t v4 = *((float32x4_t *)a3 + 4);
    float32x4_t v5 = vsubq_f32(*((float32x4_t *)a4 + 4), v4);
    float32x4_t v6 = vmulq_f32(v5, v5);
    float v7 = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2),  vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    float32x4_t v8 = vsubq_f32(*((float32x4_t *)a4 + 13), v4);
    float32x4_t v9 = vmulq_f32(v8, v8);
    float v10 = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2),  vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]);
    if (v7 > 0.5 && v10 > 0.5)
    {
      *((double *)a4 + 36) = *((double *)a4 + 36) + v7;
      __int128 v12 = *((_OWORD *)a4 + 3);
      *((_OWORD *)a4 + 11) = *((_OWORD *)a4 + 2);
      *((_OWORD *)a4 + 12) = v12;
      *((_BYTE *)a4 + 272) = *((_BYTE *)a4 + 128);
      __int128 v13 = *((_OWORD *)a4 + 7);
      *((_OWORD *)a4 + 15) = *((_OWORD *)a4 + 6);
      *((_OWORD *)a4 + 16) = v13;
      __int128 v14 = *((_OWORD *)a4 + 5);
      *((_OWORD *)a4 + 13) = *((_OWORD *)a4 + 4);
      *((_OWORD *)a4 + 14) = v14;
      __int128 v15 = *((_OWORD *)a4 + 1);
      *((_OWORD *)a4 + 9) = *(_OWORD *)a4;
      *((_OWORD *)a4 + 10) = v15;
      __int128 v16 = *(_OWORD *)a3;
      __int128 v17 = *((_OWORD *)a3 + 1);
      __int128 v18 = *((_OWORD *)a3 + 3);
      *((_OWORD *)a4 + 2) = *((_OWORD *)a3 + 2);
      *((_OWORD *)a4 + 3) = v18;
      *(_OWORD *)a4 = v16;
      *((_OWORD *)a4 + 1) = v17;
      __int128 v19 = *((_OWORD *)a3 + 4);
      __int128 v20 = *((_OWORD *)a3 + 5);
      __int128 v21 = *((_OWORD *)a3 + 6);
      *((void *)a4 + 14) = *((void *)a3 + 14);
      *((_OWORD *)a4 + 5) = v20;
      *((_OWORD *)a4 + 6) = v21;
      *((_OWORD *)a4 + 4) = v19;
    }
  }

- (void)updateWithFinderPeerData:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) != 4) {
    return;
  }
  double v5 = sub_100023CC4();
  if (*(double *)&self->_numberOfWalkingOrkUnknown == -1.0)
  {
    *(double *)&self->_numberOfWalkingOrkUnknown = v5;
    if (*((_BYTE *)a3 + 72))
    {
      HIDWORD(self->_maxYCoordinateFindee) = *((_DWORD *)a3 + 10);
      LOBYTE(self->_minYCoordinateFindee) = 1;
    }
  }

  if (*((_BYTE *)a3 + 72))
  {
    int v6 = *((_DWORD *)a3 + 10);
    if (self->_timeAtFirstPeerLocationFromFindeeData == -1.0 && v6 == 1)
    {
      p_timeAtFirstPeerLocationFromFindeeData = &self->_timeAtFirstPeerLocationFromFindeeData;
    }

    else
    {
      if (self->_timeAtFirstPeerLocationFromFMF != -1.0 || v6 != 0) {
        goto LABEL_19;
      }
      p_timeAtFirstPeerLocationFromFindeeData = &self->_timeAtFirstPeerLocationFromFMF;
    }

    double *p_timeAtFirstPeerLocationFromFindeeData = v5;
LABEL_19:
    if (LOBYTE(self->_minYCoordinateFindee) && HIDWORD(self->_maxYCoordinateFindee) == v6)
    {
      double minYCoordinateFinder = *((double *)a3 + 8);
      double maxYCoordinateFinder = self->_maxYCoordinateFinder;
      if (minYCoordinateFinder >= maxYCoordinateFinder) {
        double maxYCoordinateFinder = *((double *)a3 + 8);
      }
      self->_double maxYCoordinateFinder = maxYCoordinateFinder;
      if (self->_minYCoordinateFinder < minYCoordinateFinder) {
        double minYCoordinateFinder = self->_minYCoordinateFinder;
      }
      self->_double minYCoordinateFinder = minYCoordinateFinder;
      BYTE1(self->_maxYCoordinateFindee) |= vabdd_f64(maxYCoordinateFinder, minYCoordinateFinder) > 2.5;
      if (!*((_BYTE *)a3 + 72)) {
        sub_100006080();
      }
    }

    else
    {
      self->_double maxYCoordinateFinder = -1.79769313e308;
      self->_double minYCoordinateFinder = 1.79769313e308;
    }

    HIDWORD(self->_maxYCoordinateFindee) = v6;
    LOBYTE(self->_minYCoordinateFindee) = 1;
    goto LABEL_29;
  }

  self->_double maxYCoordinateFinder = -1.79769313e308;
  self->_double minYCoordinateFinder = 1.79769313e308;
LABEL_29:
  if (*((_BYTE *)a3 + 112) && self->_timeAtFirstPDRFromFindeeData == -1.0) {
    self->_timeAtFirstPDRFromFindeeData = v5;
  }
  if (*((_BYTE *)a3 + 16) && !*((_DWORD *)a3 + 2) && self->_timeAtFirstVIOFromFindeeData == -1.0) {
    self->_timeAtFirstVIOFromFindeeData = v5;
  }
  if (*((_BYTE *)a3 + 160))
  {
    if (self->_timeAtFirstSelfLocation == -1.0) {
      self->_timeAtFirstSelfLocation = v5;
    }
    if (self->_timeAtFirstRawUWBRange == -1.0) {
      self->_timeAtFirstRawUWBRange = v5;
    }
  }

  int numberOfArrowRevokes = self->_numberOfArrowRevokes;
  BOOL v13 = __CFADD__(numberOfArrowRevokes, 1);
  int v14 = numberOfArrowRevokes + 1;
  if (v13) {
    int v14 = 1;
  }
  self->_int numberOfArrowRevokes = v14;
}

- (void)updateWithSolution:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    double v5 = sub_100023CC4();
    if (*((_BYTE *)a3 + 360))
    {
      if (LOBYTE(self->_timeOfLastSplicedPoseErrorLogging))
      {
        uint64_t v6 = *((int *)a3 + 89);
        if (v6 <= 5) {
          *(double *)((char *)&self->super.isa + qword_10040C9C0[v6]) = v5
        }
                                                                      - *(double *)&self->_lastAngleError
                                                                      + *(double *)((char *)&self->super.isa
                                                                                  + qword_10040C9C0[v6]);
      }
    }

    if (self->_timePeerLocationFromFindeeData != -1.0)
    {
      if (LOBYTE(self->_numberOfSolutions) && !*((_BYTE *)a3 + 208) && self->_timeAtFirstArrow == -1.0)
      {
        int timeAtEndOfSession_high = HIDWORD(self->_timeAtEndOfSession);
        BOOL v8 = __CFADD__(timeAtEndOfSession_high, 1);
        int v9 = timeAtEndOfSession_high + 1;
        if (v8) {
          int v9 = 1;
        }
        HIDWORD(self->_timeAtEndOfSession) = v9;
      }

      BYTE1(self->_numberOfSolutions) = *((_BYTE *)a3 + 380);
      if (*((_BYTE *)a3 + 208))
      {
        LOBYTE(self->_numberOfSolutions) = 1;
        double timeAtFirstPose = self->_timeAtFirstPose;
        if (timeAtFirstPose == -1.0)
        {
          self->_double timeAtFirstPose = v5;
          if (*((_BYTE *)a3 + 368)) {
            int v11 = *((_DWORD *)a3 + 91);
          }
          else {
            int v11 = 0;
          }
          LODWORD(self->_timeAtFirstStaticFromFindeeData) = v11;
          if (*((_BYTE *)a3 + 192))
          {
            float v12 = *((float *)a3 + 6);
            if (v12 != 1.1755e-38) {
              self->_minRawRangeValue = v12;
            }
          }

          double timeAtFirstPose = v5;
          if (self->_timeAtLastLocationFromFindeeData != -1.0)
          {
            __int128 v13 = *(_OWORD *)&self->_lastPose.__engaged_;
            *(_OWORD *)&self->_anon_438[8] = *(_OWORD *)&self->_anon_3a8[8];
            __int128 v14 = *(_OWORD *)&self->_anon_3a8[40];
            *(_OWORD *)&self->_anon_438[24] = *(_OWORD *)&self->_anon_3a8[24];
            *(_OWORD *)&self->_anon_438[40] = v14;
            __int128 v15 = *(_OWORD *)&self->_anon_318[72];
            *(_OWORD *)&self->_firstArrowPose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
            __int128 v16 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
            self->_firstArrowPose.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
            *(_OWORD *)&self->_firstArrowPose.var0.__val_.source.var0.__null_state_ = v16;
            *(_OWORD *)&self->_firstArrowPose.__engaged_ = v13;
            unsigned __int8 v17 = self->_anon_3a8[56];
            *(_OWORD *)&self->_anon_3a8[72] = v15;
            double timeAtFirstPose = v5;
            self->_anon_438[56] = v17;
          }
        }

        if (timeAtFirstPose != -1.0 && self->_timeAtFirstArrow == -1.0)
        {
          int firstArrowAlgorithmSource = self->_firstArrowAlgorithmSource;
          BOOL v8 = __CFADD__(firstArrowAlgorithmSource, 1);
          int v19 = firstArrowAlgorithmSource + 1;
          if (v8) {
            int v19 = 1;
          }
          self->_int firstArrowAlgorithmSource = v19;
        }
      }

      else
      {
        LOBYTE(self->_numberOfSolutions) = 0;
      }

      if (*((_BYTE *)a3 + 192) && *((float *)a3 + 6) != 1.1755e-38)
      {
        if (self->_timeAtFirstValidPose == -1.0)
        {
          self->_timeAtFirstValidPose = v5;
          int v20 = *((_BYTE *)a3 + 368) ? *((_DWORD *)a3 + 91) : 0;
          HIDWORD(self->_timeAtFirstStaticFromFindeeData) = v20;
          if (self->_timeAtLastLocationFromFindeeData != -1.0)
          {
            __int128 v21 = *(_OWORD *)&self->_lastPose.__engaged_;
            *(_OWORD *)&self->_anon_558[8] = *(_OWORD *)&self->_anon_3a8[8];
            __int128 v22 = *(_OWORD *)&self->_anon_3a8[40];
            *(_OWORD *)&self->_anon_558[24] = *(_OWORD *)&self->_anon_3a8[24];
            *(_OWORD *)&self->_anon_558[40] = v22;
            __int128 v23 = *(_OWORD *)&self->_anon_318[72];
            *(_OWORD *)&self->_firstOutputRangePose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
            __int128 v24 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
            self->_firstOutputRangePose.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
            *(_OWORD *)&self->_firstOutputRangePose.var0.__val_.source.var0.__null_state_ = v24;
            *(_OWORD *)&self->_firstOutputRangePose.__engaged_ = v21;
            self->_anon_558[56] = self->_anon_3a8[56];
            *(_OWORD *)&self->_anon_4c8[72] = v23;
          }
        }

        if (self->_timeAtFirstArrow == -1.0)
        {
          if (!*((_BYTE *)a3 + 192)) {
            sub_100006080();
          }
          if (*((float *)a3 + 6) <= 2.0)
          {
            self->_timeAtFirstArrow = v5;
            int v25 = *((_BYTE *)a3 + 368) ? *((_DWORD *)a3 + 91) : 0;
            LODWORD(self->_timeAtEndOfSession) = v25;
            if (self->_timeAtLastLocationFromFindeeData != -1.0)
            {
              __int128 v26 = *(_OWORD *)&self->_lastPose.__engaged_;
              *(_OWORD *)&self->_anon_4c8[8] = *(_OWORD *)&self->_anon_3a8[8];
              __int128 v27 = *(_OWORD *)&self->_anon_3a8[40];
              *(_OWORD *)&self->_anon_4c8[24] = *(_OWORD *)&self->_anon_3a8[24];
              *(_OWORD *)&self->_anon_4c8[40] = v27;
              __int128 v28 = *(_OWORD *)&self->_anon_318[72];
              *(_OWORD *)&self->_armsReachPose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
              __int128 v29 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
              self->_armsReachPose.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
              *(_OWORD *)&self->_armsReachPose.var0.__val_.source.var0.__null_state_ = v29;
              *(_OWORD *)&self->_armsReachPose.__engaged_ = v26;
              self->_anon_4c8[56] = self->_anon_3a8[56];
              *(_OWORD *)&self->_anon_438[72] = v28;
            }
          }
        }
      }

      if (self->_timeAtFirstPose != -1.0 && self->_timeAtFirstArrow == -1.0)
      {
        int firstOutputRangeAlgorithmSource = self->_firstOutputRangeAlgorithmSource;
        BOOL v8 = __CFADD__(firstOutputRangeAlgorithmSource, 1);
        int v31 = firstOutputRangeAlgorithmSource + 1;
        if (v8) {
          int v31 = 1;
        }
        self->_int firstOutputRangeAlgorithmSource = v31;
      }
    }

    *(double *)&self->_lastAngleError = v5;
    LOBYTE(self->_timeOfLastSplicedPoseErrorLogging) = 1;
  }

- (void)updateWithPeerLocationFromFMF
{
  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    double v3 = sub_100023CC4();
    if (self->_timeAtFirstRawUWBRange == -1.0) {
      self->_timeAtFirstRawUWBRange = v3;
    }
    if (self->_timeAtFirstPeerLocation == -1.0) {
      self->_timeAtFirstPeerLocation = v3;
    }
  }

- (void)nearbyObjectUpdated:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v14 = 138412546;
    __int128 v15 = bundleIdentifier;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] nearbyObjectUpdated: %@",  (uint8_t *)&v14,  0x16u);
  }

  [v4 distance];
  if (v7 == NINearbyObjectDistanceNotAvailable)
  {
    BOOL v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v9 = self->_bundleIdentifier;
      int v14 = 138412290;
      __int128 v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] nearby object does not contain distance",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    [v4 distance];
    double v11 = v10;
    if (LOBYTE(self->_timeSpentVisible))
    {
      double firstDistance = self->_firstDistance;
      double lastDistance = self->_lastDistance;
      if (firstDistance <= v11) {
        double firstDistance = v11;
      }
      *(double *)&self->_receivedDistance = v11;
      self->_double firstDistance = firstDistance;
      if (lastDistance < v11) {
        double v11 = lastDistance;
      }
      self->_double lastDistance = v11;
    }

    else
    {
      self->_timeSpentNotVisible = v11;
      *(double *)&self->_receivedDistance = v11;
      self->_double firstDistance = v11;
      self->_double lastDistance = v11;
      LOBYTE(self->_timeSpentVisible) = 1;
    }
  }
}

- (void)lifecycleTimeoutBeforeTrackingForDiscoveryToken:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v8 = 138412546;
    int v9 = bundleIdentifier;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] lifecycleTimeoutBeforeTrackingForDiscoveryToken: %@",  (uint8_t *)&v8,  0x16u);
  }

  double maxDistance = self->_maxDistance;
  *(void *)&self->_double maxDistance = @"Before Tracking";
}

- (void)lifecycleTimeoutAfterTrackingForDiscoveryToken:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v8 = 138412546;
    int v9 = bundleIdentifier;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] lifecycleTimeoutAfterTrackingForDiscoveryToken: %@",  (uint8_t *)&v8,  0x16u);
  }

  double maxDistance = self->_maxDistance;
  *(void *)&self->_double maxDistance = @"After Tracking";
}

- (void)backgroundContinuationDiscoveryTimeout
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v6 = 138412290;
    float v7 = bundleIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] backgroundContinuationDiscoveryTimeout",  (uint8_t *)&v6,  0xCu);
  }

  double minDistance = self->_minDistance;
  *(void *)&self->_double minDistance = @"Discovery";
}

- (void)backgroundContinuationInteractionTimeout
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v6 = 138412290;
    float v7 = bundleIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] backgroundContinuationInteractionTimeout",  (uint8_t *)&v6,  0xCu);
  }

  double minDistance = self->_minDistance;
  *(void *)&self->_double minDistance = @"Interaction";
}

- (void)_updateMinMaxRangeAndRSSI:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5
{
  if (self->_m2 == -1.0)
  {
    self->_m2 = a3;
    self->_firstDistance_finding = a4;
  }

  if (self->_firstUWBRSSI == 0.0 && a5.__engaged_)
  {
    *(double *)&self->_acquisitionReason = a5.var0.__val_;
    self->_firstUWBRSSI = a5.var0.__val_;
  }

  self->_firstNBRSSI = a3;
  double lastNBRSSI = self->_lastNBRSSI;
  if (lastNBRSSI <= a3) {
    double lastNBRSSI = a3;
  }
  self->_double lastNBRSSI = lastNBRSSI;
  double minDistance_finding = self->_minDistance_finding;
  if (minDistance_finding >= a4) {
    double minDistance_finding = a4;
  }
  self->_double minDistance_finding = minDistance_finding;
  int8x16_t v8 = *(int8x16_t *)&self->_maxDistance_finding;
  v9.f64[0] = self->_maxDistance_finding;
  v9.f64[1] = a3;
  v10.f64[1] = self->_maxNBRSSI;
  v10.f64[0] = a4;
  self->_lastDistance_finding = a4;
  int8x16_t v11 = (int8x16_t)vcgtq_f64(v9, v10);
  v9.f64[0] = a4;
  *(int8x16_t *)&self->_maxDistance_finding = vbslq_s8(v11, v8, (int8x16_t)v9);
  if (a5.__engaged_)
  {
    double val = a5.var0.__val_;
    self->_firstUWBRSSI = a5.var0.__val_;
    double maxUWBRSSI = self->_maxUWBRSSI;
    if (maxUWBRSSI >= a5.var0.__val_) {
      double maxUWBRSSI = a5.var0.__val_;
    }
    self->_double maxUWBRSSI = maxUWBRSSI;
    if (self->_lastUWBRSSI > a5.var0.__val_) {
      double val = self->_lastUWBRSSI;
    }
    self->_lastUWBRSSI = val;
  }

- (double)_finderTimeFromFirstPoseTo:(double)a3
{
  double v3 = -1.0;
  if (a3 != -1.0)
  {
    double timePeerLocationFromFindeeData = self->_timePeerLocationFromFindeeData;
    if (timePeerLocationFromFindeeData != -1.0) {
      return a3 - timePeerLocationFromFindeeData;
    }
  }

  return v3;
}

- (id)_algorithmSourceToString:(int)a3
{
  else {
    return off_1007A2AB8[a3];
  }
}

- (void)_calculateStraightLineDistance
{
  if (self->_anon_318[56])
  {
    float32x4_t v2 = *(float32x4_t *)&self->_firstPose.__engaged_;
    if (self->_anon_438[56])
    {
      float32x4_t v3 = vsubq_f32(v2, *(float32x4_t *)&self->_firstArrowPose.__engaged_);
      float32x4_t v4 = vmulq_f32(v3, v3);
      *(double *)&self->_anon_558[72] = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2),  vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).f32[0]);
    }

    if (self->_anon_558[56])
    {
      float32x4_t v5 = vsubq_f32(v2, *(float32x4_t *)&self->_firstOutputRangePose.__engaged_);
      float32x4_t v6 = vmulq_f32(v5, v5);
      self->_firstArrowStraightLineDistance = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2),  vaddq_f32( v6,  (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    }

    if (self->_anon_4c8[56])
    {
      float32x4_t v7 = vsubq_f32(v2, *(float32x4_t *)&self->_armsReachPose.__engaged_);
      float32x4_t v8 = vmulq_f32(v7, v7);
      *(double *)&self->_anon_558[80] = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2),  vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0]);
    }

    if (self->_anon_3a8[56])
    {
      float32x4_t v9 = vsubq_f32( *(float32x4_t *)&self->_firstPose.var0.__val_.source.var0.__null_state_,  *(float32x4_t *)&self->_lastPose.var0.__val_.source.var0.__null_state_);
      *(double *)&self->_anon_af8[80] = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v9, v9)));
    }
  }

  else
  {
    float64x2_t v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int8x16_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "#ni-ca,Unable to calculate straight line distance between finder and findee (first pose doesn't have value)",  v11,  2u);
    }
  }

- (void)_onVIOReset
{
  if (self->_anon_648[136]) {
    self->_anon_648[136] = 0;
  }
  if (LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 0;
  }
  if (self->_anon_778[136]) {
    self->_anon_778[136] = 0;
  }
  if (LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 0;
  }
  *(void *)&self->_anon_648[152] = 0xBFF0000000000000LL;
  if (self->_anon_8a8[136]) {
    self->_anon_8a8[136] = 0;
  }
  if (LOBYTE(self->_armsReachUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 0;
  }
  *(void *)&self->_anon_8a8[152] = 0xBFF0000000000000LL;
  if (self->_anon_9d8[136]) {
    self->_anon_9d8[136] = 0;
  }
  if (LOBYTE(self->_totalUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 0;
  }
  *(void *)&self->_anon_9d8[152] = 0xBFF0000000000000LL;
  if (self->_anon_438[56]) {
    self->_anon_438[56] = 0;
  }
  if (self->_anon_558[56]) {
    self->_anon_558[56] = 0;
  }
  if (self->_anon_4c8[56]) {
    self->_anon_4c8[56] = 0;
  }
  if (self->_anon_318[56]) {
    self->_anon_318[56] = 0;
  }
  self->_firstArrowStraightLineDistance = -1.0;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)&self->_anon_558[72] = _Q0;
  *(void *)&self->_anon_af8[80] = 0xBFF0000000000000LL;
  *(_OWORD *)&self->_anon_dc8[56] = 0u;
  self->_double deltaVSourceTime = 0.0;
}

- (double)_deltaDistanceFromVIOPoses:(optional<nearby:(optional<nearby::algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 :
{
  double result = 0.0;
  if (a3[2].var0.__val_.lightEstimate.var0.__null_state_)
  {
    if (a4[2].var0.__val_.lightEstimate.var0.__null_state_)
    {
      float32x4_t v5 = vsubq_f32(*(float32x4_t *)&a4[1].var0.__val_.trackingState, *(float32x4_t *)&a3[1].var0.__val_.trackingState);
      float32x4_t v6 = vmulq_f32(v5, v5);
      return sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2),  vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    }
  }

  return result;
}

- (BOOL)_isSemiStaticFromVIO:(optional<nearby:(optional<nearby:(double)a5 :algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 ::
{
  if (!a3[2].var0.__val_.lightEstimate.var0.__null_state_) {
    return 0;
  }
  if (!a4[2].var0.__val_.lightEstimate.var0.__null_state_) {
    return 0;
  }
  __int128 v6 = *(_OWORD *)&a3[2].var0.__null_state_;
  v17[6] = *(_OWORD *)&a3[1].var0.__val_.odometryAvailability.var0.__null_state_;
  v17[7] = v6;
  v17[8] = a3[2].var0.__val_.lightEstimate;
  __int128 v7 = *(_OWORD *)&a3->__engaged_;
  v17[2] = *(_OWORD *)&a3->var0.__val_.source.var0.__null_state_;
  v17[3] = v7;
  __int128 v8 = *(_OWORD *)&a3[1].var0.__val_.lightEstimate.__engaged_;
  v17[4] = *(_OWORD *)&a3[1].var0.__val_.trackingState;
  v17[5] = v8;
  optional<double> lightEstimate = a3->var0.__val_.lightEstimate;
  v17[0] = *(_OWORD *)&a3->var0.__null_state_;
  v17[1] = lightEstimate;
  __int128 v10 = *(_OWORD *)&a4[2].var0.__null_state_;
  v16[6] = *(_OWORD *)&a4[1].var0.__val_.odometryAvailability.var0.__null_state_;
  v16[7] = v10;
  v16[8] = a4[2].var0.__val_.lightEstimate;
  __int128 v11 = *(_OWORD *)&a4->__engaged_;
  v16[2] = *(_OWORD *)&a4->var0.__val_.source.var0.__null_state_;
  v16[3] = v11;
  __int128 v12 = *(_OWORD *)&a4[1].var0.__val_.lightEstimate.__engaged_;
  v16[4] = *(_OWORD *)&a4[1].var0.__val_.trackingState;
  v16[5] = v12;
  optional<double> v13 = a4->var0.__val_.lightEstimate;
  v16[0] = *(_OWORD *)&a4->var0.__null_state_;
  v16[1] = v13;
  -[NIServerAnalyticsManager _deltaDistanceFromVIOPoses::](self, "_deltaDistanceFromVIOPoses::", v17, v16);
  return v14 / a5 < 0.15;
}

- (BOOL)_isPDRAvailable:(PDRInput *)a3
{
  return a3->deltaPosX.__engaged_ && a3->deltaPosY.__engaged_;
}

- (void)_calculateIOMetrics:(double)a3
{
  double timeAtLastIOUpdate = self->_timeAtLastIOUpdate;
  if (timeAtLastIOUpdate > 0.0) {
    *(double *)&self->_anon_af8[72] = (self->_timePDRAndVIOWasAvailable - timeAtLastIOUpdate) / timeAtLastIOUpdate;
  }
  double v4 = *(double *)&self->_anon_9d8[176];
  if (v4 <= 0.0)
  {
    double stdSpeedFromVIO = self->_stdSpeedFromVIO;
  }

  else
  {
    self->_radialDisplacementFromVIO = timeAtLastIOUpdate / v4;
    self->_meanSpeedFromVIO = (self->_timePDRAndVIOWasAvailable - timeAtLastIOUpdate) / v4;
    double stdSpeedFromVIO = self->_stdSpeedFromVIO;
    self->_pdrSSDetectionTruePositiveRate = stdSpeedFromVIO / v4;
  }

  if (stdSpeedFromVIO > 0.0) {
    self->_timeSSFromIOAndSSFromVIO = self->_timeSSFromVIO / stdSpeedFromVIO;
  }
  double meanSpeedFromVIOError = self->_meanSpeedFromVIOError;
  if (meanSpeedFromVIOError > 0.0) {
    self->_timeSSFromIOAndNotSSFromVIO = self->_timeNotSSFromVIO / meanSpeedFromVIOError;
  }
  double pdrSSDetectionFalsePositiveRate = self->_pdrSSDetectionFalsePositiveRate;
  if (pdrSSDetectionFalsePositiveRate > 2.0) {
    self->_radialDisplacementError = self->_numberOfPDRUpdates / pdrSSDetectionFalsePositiveRate;
  }
}

- (VectorAggregateErrors)_calculateErrorStatsFromVector:(SEL)a3
{
  end = a4->__end_;
  if (end == a4->__begin_) {
    sub_10038ABF4();
  }
  double result = (VectorAggregateErrors *)std::__sort<std::__less<float,float> &,float *>(a4->__begin_, end, &v21);
  begin = a4->__begin_;
  __int128 v8 = a4->__end_;
  uint64_t v10 = (char *)v8 - (char *)a4->__begin_;
  unint64_t v11 = v10 >> 2;
  unint64_t v12 = (unint64_t)(v10 >> 2) >> 1;
  if ((v10 & 4) != 0) {
    float v13 = begin[v12];
  }
  else {
    float v13 = (float)(begin[v12 - 1] + begin[v12]) * 0.5;
  }
  float v14 = begin[(int)((double)v11 * 0.95)];
  if (begin == v8)
  {
    float v18 = 0.0 / (float)v11;
    double v19 = 0.0;
  }

  else
  {
    float v15 = 0.0;
    __int16 v16 = a4->__begin_;
    do
    {
      float v17 = *v16++;
      float v15 = v15 + v17;
    }

    while (v16 != v8);
    float v18 = v15 / (float)v11;
    double v19 = 0.0;
    do
    {
      float v20 = *begin++;
      double v19 = v19 + (float)(v20 * v20);
    }

    while (begin != v8);
  }

  retstr->var0 = v18;
  retstr->var1 = sqrt(v19 / (double)v11 - (float)(v18 * v18));
  retstr->var2 = v13;
  retstr->var3 = v14;
  retstr->var4 = v11;
  return result;
}

- (void)_calculatePoseSplicingMetrics
{
  uint64_t v3 = *(void *)&self->_timeOfLastPDRUpdate.__engaged_;
  double val = self->_timeOfLastPDRUpdate.var0.__val_;
  unint64_t v5 = (v3 - *(void *)&val) >> 2;
  unint64_t v6 = v5 >> 1;
  if ((((_DWORD)v3 - LODWORD(val)) & 4) != 0) {
    float v7 = *(float *)(*(void *)&val + 4 * v6);
  }
  else {
    float v7 = (float)(*(float *)(*(void *)&val + 4 * v6 - 4) + *(float *)(*(void *)&val + 4 * v6)) * 0.5;
  }
  if (*(void *)&val == v3)
  {
    double v11 = 0.0;
    float v8 = 0.0;
  }

  else
  {
    float v8 = 0.0;
    double v9 = self->_timeOfLastPDRUpdate.var0.__val_;
    do
    {
      float v10 = **(float **)&v9;
      *(void *)&v9 += 4LL;
      float v8 = v8 + v10;
    }

    while (*(void *)&v9 != v3);
    double v11 = 0.0;
    double v12 = self->_timeOfLastPDRUpdate.var0.__val_;
    do
    {
      float v13 = **(float **)&v12;
      *(void *)&v12 += 4LL;
      double v11 = v11 + (float)(v13 * v13);
    }

    while (*(void *)&v12 != v3);
  }

  float v14 = *(float *)(*(void *)&val + 4LL * (int)((double)v5 * 0.95));
  float v15 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    float v16 = v8 / (float)v5;
    int v17 = 134218752;
    double v18 = v16;
    __int16 v19 = 2048;
    double v20 = sqrt(v11 / (double)v5 - (float)(v16 * v16));
    __int16 v21 = 2048;
    double v22 = v7;
    __int16 v23 = 2048;
    double v24 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ni-ca,DoT error, mean: %f, std: %f, median: %f, 95th: %f",  (uint8_t *)&v17,  0x2Au);
  }

- (void)_submitFindingSessionEndStats
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_m2));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"FirstDistance");

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_firstNBRSSI));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"LastDistance");

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)&self->_acquisitionReason));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"FirstNBRSSI");

  float v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_firstUWBRSSI));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"LastNBRSSI");

  float v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_maxUWBRSSI));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"MinNBRSSI");

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_lastUWBRSSI));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"MaxNBRSSI");

  float v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_firstDistance_finding));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, @"FirstUWBRSSI");

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_lastDistance_finding));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"LastUWBRSSI");

  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_minDistance_finding));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, @"MinUWBRSSI");

  float v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_maxDistance_finding));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v13, @"MaxUWBRSSI");

  if (LODWORD(self->_lifecycleTimeoutType) == 4) {
    float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  }
  else {
    float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
  }
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v14, @"RangingRole");

  id v15 = -[NSMutableDictionary mutableCopy](v3, "mutableCopy");
  float v16 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    *(_DWORD *)buf = 138412802;
    __int16 v23 = bundleIdentifier;
    __int16 v24 = 2112;
    int v25 = @"com.apple.nearbyinteraction.findingsession.end";
    __int16 v26 = 2112;
    __int128 v27 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "#ni-ca,[%@] send analytics event %@:\n%@\n",  buf,  0x20u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10002CD84;
  v20[3] = &unk_1007A2298;
  id v19 = v15;
  id v21 = v19;
  AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.findingsession.end", v20);
}

- (void)_sessionStoppedWithTimestamp:(double)a3
{
  if (!LOBYTE(self->_bundleIdAsStdString.__r_.var0))
  {
    id v21 = (os_log_s *)qword_1008000A0;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO)) {
      return;
    }
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = bundleIdentifier;
    __int16 v23 = "#ni-ca,[%@] Session already stopped. Ignore duplicate call.";
    goto LABEL_20;
  }

  LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 0;
  int64_t var0 = self->_bundleIdAsStdString.var0;
  double v6 = a3 - self->_runTimestamp;
  uint64_t v7 = 9LL;
  if (!self->_isRunning) {
    uint64_t v7 = 10LL;
  }
  *(double *)&(&self->super.isa)[v7] = *(double *)&(&self->super.isa)[v7] + v6;
  double timeAtLastLocationUpdate = self->_timeAtLastLocationUpdate;
  double pdrTimeAtFirstPDRUpdate = self->_pdrTimeAtFirstPDRUpdate;
  double timeFindeeWasWalkingOrUnknown = self->_timeFindeeWasWalkingOrUnknown;
  self->_timeFindeeWasStatic = a3 - *(double *)&self->_numberOfWalkingOrkUnknown;
  std::mutex::lock(&stru_1007F2500);
  --byte_1007F5168;
  p_int lifecycleTimeoutType = &self->_lifecycleTimeoutType;
  *(void *)buf = &self->_lifecycleTimeoutType;
  double v12 = sub_100030C30( (uint64_t)&xmmword_1007F5118,  (int *)&self->_lifecycleTimeoutType,  (uint64_t)&unk_1004242F8,  (_DWORD **)buf);
  --*((_BYTE *)v12 + 20);
  if (self->_bundleIdentifier)
  {
    if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
    {
      if (self->_bundleIdAsStdString.__r_.__value_.var0.var1.__size_) {
        goto LABEL_7;
      }
    }

    else if (*((_BYTE *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23))
    {
LABEL_7:
      *(void *)buf = &self->_bundleIdAsStdString;
      float v13 = sub_100030E50( (uint64_t)&xmmword_1007F5140,  (unsigned __int8 *)&self->_bundleIdAsStdString,  (uint64_t)&unk_1004242F8,  (__int128 **)buf);
      --v13[40];
      goto LABEL_8;
    }

    __assert_rtn( "-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]",  "NIServerAnalyticsManager.mm",  2075,  "!_bundleIdAsStdString.empty()");
  }

- (void).cxx_destruct
{
  end = self->_deltaAngleErrorHistory.__end_;
  if (end)
  {
    self->_deltaAngleErrorHistory.__end_cap_.__value_ = end;
    operator delete(end);
  }

  double v4 = self->_angleErrorHistory.__end_;
  if (v4)
  {
    self->_angleErrorHistory.__end_cap_.__value_ = v4;
    operator delete(v4);
  }

  double val = self->_timeOfLastPDRUpdate.var0.__val_;
  if (val != 0.0)
  {
    *(double *)&self->_timeOfLastPDRUpdate.__engaged_ = val;
    operator delete(*(void **)&val);
  }

  sub_100030A5C(&self->_pdrAligner._rotatedVioPoseHistory.__start_);
  sub_100030A5C(&self->_pdrAligner._poseHistory.__start_);
  objc_storeStrong((id *)&self->_minDistance, 0LL);
  objc_storeStrong((id *)&self->_maxDistance, 0LL);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0LL);
}

- (id).cxx_construct
{
  *(_OWORD *)self->_bundleIdAsStdString.__r_.__value_.var0.var0.__data_ = 0uLL;
  *((void *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 2) = 0LL;
  LOBYTE(self->_numberOfLostVerticalConvergence) = 0;
  *((_BYTE *)&self->_numberOfLostVerticalConvergence + 4) = 0;
  LOBYTE(self->_timeAtFirstPeerData) = 0;
  BYTE4(self->_timeAtFirstPeerData) = 0;
  LOBYTE(self->_numberOfVIOResets) = 0;
  self->_anon_318[56] = 0;
  self->_anon_318[72] = 0;
  self->_anon_3a8[56] = 0;
  self->_anon_3a8[72] = 0;
  self->_anon_438[56] = 0;
  self->_anon_438[72] = 0;
  self->_anon_4c8[56] = 0;
  self->_anon_4c8[72] = 0;
  self->_anon_558[56] = 0;
  LOBYTE(self->_firstOutputRangeStraightLineDistance) = 0;
  LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 0;
  self->_anon_648[8] = 0;
  self->_anon_648[136] = 0;
  self->_anon_648[168] = 0;
  LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 0;
  self->_anon_778[8] = 0;
  self->_anon_778[136] = 0;
  self->_anon_778[168] = 0;
  LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 0;
  self->_anon_8a8[8] = 0;
  self->_anon_8a8[136] = 0;
  self->_anon_8a8[168] = 0;
  LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 0;
  self->_anon_9d8[8] = 0;
  self->_anon_9d8[136] = 0;
  LOBYTE(self->_vioPathLengthWhenPDRIsAvailable) = 0;
  self->_anon_af8[56] = 0;
  BYTE4(self->_maxYCoordinateFindee) = 0;
  LOBYTE(self->_minYCoordinateFindee) = 0;
  *(_DWORD *)&self->_anon_9d8[168] = 0;
  sub_10030C724((uint64_t)&self->_rangeAtFirstArrow);
  self->_previousVioIsNotAvailable = 0;
  self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = 0;
  self->_anon_e42[14] = 0;
  self->_anon_e42[22] = 0;
  BYTE4(self->_pointToPointErrorHistory.__end_) = 0;
  self->_lastAngleError.var0.__null_state_ = 0;
  LOBYTE(self->_timeOfLastSplicedPoseErrorLogging) = 0;
  LOBYTE(self->_noOdometryAvailableTime) = 0;
  LOBYTE(self->_vioPathLength) = 0;
  self->_timeOfLastPDRUpdate = 0u;
  *(_OWORD *)&self->_angleErrorHistory.__begin_ = 0u;
  *(_OWORD *)&self->_angleErrorHistory.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_deltaAngleErrorHistory.__end_ = 0u;
  *(_OWORD *)((char *)&self->_deltaAngleErrorHistory.__end_cap_.__value_ + 1) = 0u;
  return self;
}

@end