@interface NINearbyUpdatesEngine
- (AoARad)_convertFromPointingCoordinatesToSpatial:(const void *)a3;
- (BOOL)_shouldConsumeRoseSolution:(const void *)a3;
- (FindeeAlgorithmConfig)_getFindeeAlgorithmConfig;
- (NIConfiguration)configuration;
- (NINearbyUpdatesEngine)initWithConfiguration:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6 analyticsManager:(id)a7 protobufLogger:(shared_ptr<rose:(id *)a9 :protobuf::Logger>)a8 error:;
- (NINearbyUpdatesEngineDataSource)dataSource;
- (NINearbyUpdatesEngineDelegate)delegate;
- (NIServerAnalyticsManager)analyticsManager;
- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfig;
- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfigForPeerSessions;
- (double)_getRangeUncertaintyWhenBiasEstimateNotAvailable;
- (id).cxx_construct;
- (id)_configureForRegionMonitoring:(id)a3;
- (id)_consolidateInputToMLModel:(const void *)a3;
- (id)_handleRangeAndAoASolution:(const void *)a3;
- (id)_handleRangeOnlySolution:(const void *)a3;
- (id)configure:(id)a3;
- (id)nearbyObjectFromDeviceIdentifier:(unint64_t)a3;
- (id)nearbyObjectFromRangeResult:(const void *)a3;
- (id)nearbyObjectFromSolution:(const void *)a3;
- (id)nearbyObjectFromSolution:(const void *)a3 forPeer:(id)a4;
- (id)nearbyObjectFromToken:(id)a3;
- (id)niConvergenceStateFromSolution:(const void *)a3;
- (int)_setReadValidateDefaultsWriteForTypeOfPredictor;
- (set<NIRegionSizeCategory,)_getRegionSizeCategoriesFromRegions:(std:(NINearbyUpdatesEngine *)self :(SEL)a3 allocator<NIRegionSizeCategory>> *__return_ptr)retstr;
- (void)_configureRangeBiasEstimator;
- (void)_createDeviceFinderAlgoContainer;
- (void)_createFindeeAlgoContainer;
- (void)_createPeerFindingAlgoContainer;
- (void)_createPeopleFinderAlgoContainer;
- (void)_createSyntheticApertureAlgoContainer;
- (void)_handleBoundedRegionRange:(double)a3 forDevice:(unint64_t)a4 rangeResult:(optional<nearby::algorithms::common::RangeResult> *)a5;
- (void)_handleDeviceMonitorActivation:(BOOL)a3 forDevice:(unint64_t)a4 timestamp:(double)a5 regionSizeCategory:(int)a6 regions:(optional<std:(int)a8 :vector<nearby::algorithms::region_monitoring::Region>> *)a7 predictorType:;
- (void)_handleRegionChangeForDevice:(unint64_t)a3 currentRegion:(optional<nearby::algorithms::region_monitoring::Region> *)a4 prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:;
- (void)_handleWiFiRangeResults:(const void *)a3;
- (void)_sendTimeTupleToAlgorithms;
- (void)acceptAltimeterData:(const AltimeterInput *)a3;
- (void)acceptBluetoothSample:(const void *)a3 coarseEstimation:(BOOL)a4 regionCategory:(int64_t)a5;
- (void)acceptDeviceMotion:(const void *)a3;
- (void)acceptDeviceMotionInput:(const void *)a3;
- (void)acceptDevicePDRInput:(const void *)a3;
- (void)acceptDiscoveryEventForPeer:(id)a3;
- (void)acceptGnssSatelliteData:(const void *)a3;
- (void)acceptHeadingData:(const HeadingInput *)a3;
- (void)acceptMagneticFieldStrength:(double)a3;
- (void)acceptMotionActivity:(const MotionActivityInput *)a3;
- (void)acceptPedometerData:(const PedometerDataInput *)a3;
- (void)acceptPedometerEvent:(const PedometerEventInput *)a3;
- (void)acceptPeerData:(const void *)a3 fromPeer:(id)a4;
- (void)acceptPeerDeviceType:(BOOL)a3;
- (void)acceptPeerLocationData:(const LocationInput *)a3 forPeer:(id)a4;
- (void)acceptRoseSolution:(const void *)a3;
- (void)acceptRoseSolution:(const void *)a3 withProcessingOptions:(const AlgorithmProcessingOptions *)a4;
- (void)acceptSelfLocationData:(const LocationInput *)a3;
- (void)acceptUnsuccessfulRoseSolution:(const void *)a3;
- (void)acceptVisionInput:(id)a3;
- (void)acceptWatchOrientation:(const WatchOrientationInput *)a3;
- (void)acceptWiFiRangeResults:(const void *)a3;
- (void)clearStateForToken:(id)a3;
- (void)fillNearbyObject:(id)a3 fromRangeResult:(const void *)a4;
- (void)fillNearbyObject:(id)a3 fromSolution:(const void *)a4;
- (void)getPeerDataFromFindingContainerWithToken:(id)a3;
- (void)invalidate;
- (void)logSolution:(const void *)a3;
- (void)probeRegions;
- (void)processUWBResultForRegionMonitoring:(id)a3 roseSolution:(const void *)a4 processingOptions:(const AlgorithmProcessingOptions *)a5;
- (void)processUWBResultForSyntheticAperture:(id)a3 roseSolution:(const void *)a4;
- (void)provideFindingSolution:(id)a3;
- (void)reportAndLogNearbyObject:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFindingPeerToken:(id)a3;
@end

@implementation NINearbyUpdatesEngine

- (NINearbyUpdatesEngine)initWithConfiguration:(id)a3 queue:(id)a4 delegate:(id)a5 dataSource:(id)a6 analyticsManager:(id)a7 protobufLogger:(shared_ptr<rose:(id *)a9 :protobuf::Logger>)a8 error:
{
  v10 = v9;
  id v17 = a3;
  id v37 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_19:
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v34 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 192, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v33 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 191, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

  if (!v18) {
    goto LABEL_19;
  }
LABEL_3:
  if (v19) {
    goto LABEL_4;
  }
LABEL_20:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v35 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 193, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];

LABEL_4:
  if (!a8.__ptr_)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v36 handleFailureInMethod:a2, self, @"NIServerNearbyUpdatesEngine.mm", 196, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NINearbyUpdatesEngine;
  v21 = -[NINearbyUpdatesEngine init](&v40, "init");
  v22 = v21;
  v23 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_queue, a4);
    objc_storeWeak((id *)&v22->_configuration, v18);
    objc_storeWeak((id *)&v22->_previousNIObjectUpdate, v19);
    sub_100018E60(&v22->_protobufLogger.__ptr_, v10);
    objc_storeStrong((id *)&v22->_dataSource, a7);
    if (v19)
    {
      [v19 uniqueIdentifierForEngine:v23];
    }

    else
    {
      __int128 v38 = 0uLL;
      uint64_t v39 = 0LL;
    }

    p_uniqueIdentifier = (void **)&v22->_uniqueIdentifier;
    *(_OWORD *)p_uniqueIdentifier = v38;
    *((void *)&v22->_uniqueIdentifier.__r_.__value_.var0.var1 + 2) = v39;
    v23->_rangeMeasSourcePref = 0;
    v26 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    value = v23->_syntheticApertureFilter.__ptr_.__value_;
    v23->_syntheticApertureFilter.__ptr_.__value_ = (SyntheticApertureFilter *)v26;

    LOBYTE(v23->_convStateForObject) = 1;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    LOBYTE(v23->_cachedMagneticFieldStrength.var0.__val_.value) = [v28 BOOLForKey:@"NIFindingOnlySendKinematicPeerData"];

    *(_OWORD *)&v23->_findingLatencyBookkeeping.receivedFirstMeasurement = 0u;
    *(_OWORD *)&v23->_cachedMagneticFieldStrength.__engaged_ = 0u;
    double lastProcessTimeSeconds = v23->_findingLatencyBookkeeping.lastProcessTimeSeconds;
    v23->_findingLatencyBookkeeping.double lastProcessTimeSeconds = 0.0;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine configure:](v23, "configure:", v17));
    v31 = v30;
    if (v30)
    {
      v24 = 0LL;
      *(void *)a8.__ptr_ = v30;
    }

    else
    {
      v24 = v23;
    }
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

- (void)_configureRangeBiasEstimator
{
  LOBYTE(self->_convStateForObject) = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"NIHomeBypassResponderBiasEstimation"]);

  if (v4)
  {
    unsigned int v5 = [v3 BOOLForKey:@"NIHomeBypassResponderBiasEstimation"];
    LOBYTE(self->_convStateForObject) = v5;
    if (v5) {
      goto LABEL_3;
    }
  }

  else if (LOBYTE(self->_convStateForObject))
  {
LABEL_3:
    v6 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est Bypassing range bias estimation",  buf,  2u);
    }

    goto LABEL_17;
  }

  if (byte_1007FE147 >= 0) {
    v7 = &qword_1007FE130;
  }
  else {
    v7 = (uint64_t *)qword_1007FE130;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  if (byte_1007FE15F >= 0) {
    v9 = &qword_1007FE148;
  }
  else {
    v9 = (uint64_t *)qword_1007FE148;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  v11 = -[NIMLModelResourceFileHandler initWithResourceBundleDirectory:bundleName:]( objc_alloc(&OBJC_CLASS___NIMLModelResourceFileHandler),  "initWithResourceBundleDirectory:bundleName:",  v8,  v10);
  v12 = objc_alloc_init(&OBJC_CLASS___RangeBiasEstimatorSingleAntennaModel);
  value = self->_findingAlgorithmContainer.__ptr_.__value_;
  self->_findingAlgorithmContainer.__ptr_.__value_ = (NRBYFindingContainer *)v12;

  if ((-[NRBYFindingContainer configureWithResourceFileHandler:]( self->_findingAlgorithmContainer.__ptr_.__value_,  "configureWithResourceFileHandler:",  v11) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A5EA4();
    }
    LOBYTE(self->_convStateForObject) = 1;
  }

LABEL_17:
  ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    if (LOBYTE(self->_convStateForObject))
    {
      LOBYTE(v24[0]) = 0;
      char v25 = 0;
      sub_10023CA80((uint64_t)ptr, 0, 0LL, (uint64_t)v24);
      if (v25)
      {
        v15 = (void *)v24[0];
        if (v24[0])
        {
          v24[1] = v24[0];
LABEL_27:
          operator delete(v15);
        }
      }
    }

    else
    {
      *(void *)buf = 0LL;
      v22 = 0LL;
      uint64_t v23 = 0LL;
      sub_1002AE73C(buf, &unk_10042C7F0, (uint64_t)&xmmword_10042C848, 0xBuLL);
      v16 = self->_protobufLogger.__ptr_;
      id v18 = 0LL;
      uint64_t v19 = 0LL;
      __p = 0LL;
      sub_10011B560(&__p, *(const void **)buf, (uint64_t)v22, ((uint64_t)v22 - *(void *)buf) >> 3);
      char v20 = 1;
      sub_10023CA80((uint64_t)v16, 1, 0x100000002LL, (uint64_t)&__p);
      if (v20 && __p)
      {
        id v18 = __p;
        operator delete(__p);
      }

      v15 = *(void **)buf;
      if (*(void *)buf)
      {
        v22 = *(const void **)buf;
        goto LABEL_27;
      }
    }
  }
}

- (id)configure:(id)a3
{
  id v5 = a3;
  v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v57) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#nrby-eng,configure", (uint8_t *)&v57, 2u);
  }

  p_double accumulatedExcessSeconds = &self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
  objc_storeStrong((id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds, a3);
  double accumulatedExcessSeconds = self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NIHomeDeviceConfiguration, v9);
  if ((objc_opt_isKindOfClass(*(void *)&accumulatedExcessSeconds, v10) & 1) != 0)
  {
    -[NINearbyUpdatesEngine _configureRangeBiasEstimator](self, "_configureRangeBiasEstimator");
    id v12 = *(id *)p_accumulatedExcessSeconds;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 monitoredRegions]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _configureForRegionMonitoring:](self, "_configureForRegionMonitoring:", v13));

    self->_rangeMeasSourcePref = 1;
    goto LABEL_18;
  }

  id v15 = *(id *)p_accumulatedExcessSeconds;
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v11);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
  {
    v14 = 0LL;
    self->_rangeMeasSourcePref = 1;
    goto LABEL_18;
  }

  id v18 = *(id *)p_accumulatedExcessSeconds;
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v17);
  char isKindOfClass = objc_opt_isKindOfClass(v18, v19);
  id v22 = *(id *)p_accumulatedExcessSeconds;
  if ((isKindOfClass & 1) != 0)
  {
    id v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 debugParameters]);
    if (v24)
    {
      char v25 = (void *)objc_claimAutoreleasedReturnValue([v23 debugParameters]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"enableAdditionalUWBSignalFeatures"]);
      BOOL v27 = v26 == 0LL;

      if (!v27) {
        -[NINearbyUpdatesEngine _configureRangeBiasEstimator](self, "_configureRangeBiasEstimator");
      }
    }

    self->_rangeMeasSourcePref = 0;

    goto LABEL_15;
  }

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NIDevicePresenceConfiguration, v21);
  if ((objc_opt_isKindOfClass(v22, v28) & 1) == 0)
  {
LABEL_15:
    v14 = 0LL;
    goto LABEL_18;
  }

  id v29 = *(id *)p_accumulatedExcessSeconds;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 monitoredRegions]);
  BOOL v31 = v30 == 0LL;

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v29 innerBoundary]);
    v59[0] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue([v29 outerBoundary]);
    v59[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 2LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _configureForRegionMonitoring:](self, "_configureForRegionMonitoring:", v34));
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v29 monitoredRegions]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _configureForRegionMonitoring:](self, "_configureForRegionMonitoring:", v32));
  }

LABEL_18:
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v36 = [v35 BOOLForKey:@"ForcePeerFindingAlgorithms"];

  if (v36)
  {
    __int128 v38 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v57) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,ForcePeerFindingAlgorithms set.  ",  (uint8_t *)&v57,  2u);
    }
  }

  id v39 = *(id *)p_accumulatedExcessSeconds;
  uint64_t v40 = objc_opt_class(&OBJC_CLASS___NIFindingConfiguration, v37);
  if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
  {
    v41 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      p_uniqueIdentifier = &self->_uniqueIdentifier;
      int v57 = 136315138;
      v58 = p_uniqueIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,_configuration is NIFindingConfiguration. Unique identifier: %s",  (uint8_t *)&v57,  0xCu);
    }

    id v43 = *(id *)p_accumulatedExcessSeconds;
    if ([v43 isFinder])
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v45 = [v44 BOOLForKey:@"EnableDeviceFindingOnPhone"];

      if (v45)
      {
        v46 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v57) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,For rdar://102527413 (Test hook to use Wenda arrow interface on phone), enabling device finding on phone",  (uint8_t *)&v57,  2u);
        }
      }

      else
      {
        v56 = sub_100005150();
        if (sub_100320824(v56[144])) {
          -[NINearbyUpdatesEngine _createPeopleFinderAlgoContainer](self, "_createPeopleFinderAlgoContainer");
        }
      }
    }

    else
    {
      -[NINearbyUpdatesEngine _createFindeeAlgoContainer](self, "_createFindeeAlgoContainer");
    }
  }

  else if (([*(id *)p_accumulatedExcessSeconds _internalIsExtendedDistanceMeasurementEnabled] | v36) == 1)
  {
    -[NINearbyUpdatesEngine _createPeerFindingAlgoContainer](self, "_createPeerFindingAlgoContainer");
  }

  else if ([*(id *)p_accumulatedExcessSeconds _internalIsCameraAssistanceEnabled])
  {
    id v48 = *(id *)p_accumulatedExcessSeconds;
    uint64_t v49 = objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v47);
    if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0
      || (id v51 = *(id *)p_accumulatedExcessSeconds,
          uint64_t v52 = objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v50),
          (objc_opt_isKindOfClass(v51, v52) & 1) != 0))
    {
      v53 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        data = &self->_uniqueIdentifier;
        int v57 = 136315138;
        v58 = data;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,_configuration is NINearbyPeerConfiguration AND has camera assistance; but it does not have enhanced"
          " ranging or test mode enabled. Unique identifier: %s",
          (uint8_t *)&v57,
          0xCu);
      }

      -[NINearbyUpdatesEngine _createSyntheticApertureAlgoContainer](self, "_createSyntheticApertureAlgoContainer");
    }
  }

  return v14;
}

- (id)_configureForRegionMonitoring:(id)a3
{
  id v146 = a3;
  if ([v146 count])
  {
    v148 = self;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    regionDict = v148->_regionDict;
    v148->_regionDict = v4;

    memset(v186, 0, sizeof(v186));
    __int128 v182 = 0u;
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    __int128 v185 = 0u;
    id obj = v146;
    id v6 = [obj countByEnumeratingWithState:&v182 objects:v268 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v183;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v183 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v182 + 1) + 8LL * (void)i);
          uint64_t v10 = objc_alloc(&OBJC_CLASS___NIRegionKey);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
          id v12 = -[NIRegionKey initWithName:regionSizeCategory:]( v10,  "initWithName:regionSizeCategory:",  v11,  [v9 regionSizeCategory]);

          -[NSMutableDictionary setObject:forKey:](v148->_regionDict, "setObject:forKey:", v9, v12);
          id v13 = objc_claimAutoreleasedReturnValue([v9 name]);
          sub_1000065CC(v154, (char *)[v13 UTF8String]);
          [v9 radius];
          int v15 = v14;
          unsigned int v16 = [v9 regionSizeCategory];
          uint64_t v17 = (char *)[v9 preferredUpdateRate];
          else {
            int v18 = (_DWORD)v17 + 1;
          }
          uint64_t v19 = (char *)[v9 devicePresencePreset];
          else {
            int v20 = (_DWORD)v19 + 1;
          }
          if (SHIBYTE(v155[0]) < 0)
          {
            sub_1000063A8(__p, v154[0], (unint64_t)v154[1]);
          }

          else
          {
            *(_OWORD *)__p = *(_OWORD *)v154;
            *(void *)&__p[16] = v155[0];
          }

          *(_DWORD *)&__p[24] = v15;
          unsigned int v200 = v16;
          float v201 = *(float *)&v18;
          float v202 = *(float *)&v20;
          LOWORD(v203) = 0;
          sub_1002A54F8((uint64_t *)v186, (__int128 *)__p);
          if ((__p[23] & 0x80000000) != 0) {
            operator delete(*(void **)__p);
          }
          if (SHIBYTE(v155[0]) < 0) {
            operator delete(v154[0]);
          }
        }

        id v6 = [obj countByEnumeratingWithState:&v182 objects:v268 count:16];
      }

      while (v6);
    }

    uint64_t v21 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1003A5EFC((uint64_t)v267, (uint64_t)-[NSMutableDictionary count](v148->_regionDict, "count"), v21);
    }

    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    id v22 = v148->_regionDict;
    id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v178,  v266,  16LL);
    if (v23)
    {
      int v24 = 0;
      uint64_t v25 = *(void *)v179;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v179 != v25) {
            objc_enumerationMutation(v22);
          }
          BOOL v27 = *(void **)(*((void *)&v178 + 1) + 8LL * (void)j);
          uint64_t v28 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 description]);
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v148->_regionDict, "objectForKey:", v27));
            BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v30 description]);
            *(_DWORD *)__p = 67109634;
            *(_DWORD *)&__p[4] = v24 + (_DWORD)j;
            *(_WORD *)&__p[8] = 2112;
            *(void *)&__p[10] = v29;
            *(_WORD *)&__p[18] = 2112;
            *(void *)&__p[20] = v31;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "#nrby-eng,#region-class _regionDict (%d) key %@: %@",  __p,  0x1Cu);
          }
        }

        id v23 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v178,  v266,  16LL);
        v24 += (int)j;
      }

      while (v23);
    }

    v32 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      p_uniqueIdentifier = (__long *)&v148->_uniqueIdentifier;
      v34 = v148->_regionDict;
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = p_uniqueIdentifier;
      *(_WORD *)&__p[12] = 2112;
      *(void *)&__p[14] = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions _configureForRegionMonitoring. Unique identifier: %s. Regions: %@",  __p,  0x16u);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v143 = v35;
    [v35 doubleForKey:@"RegMonFilterAlphaOverride"];
    double v37 = v36;
    [v35 doubleForKey:@"RegMonHystEnterDistMOverride"];
    double v39 = v38;
    [v35 doubleForKey:@"RegMonHystExitDistMOverride"];
    double v41 = v40;
    [v35 doubleForKey:@"HandoffUserIntentScoreThresholdOverride"];
    double v43 = v42;
    unsigned int v142 = DWORD1(xmmword_1007FE178);
    float v44 = *(float *)&xmmword_1007FE178;
    float v45 = *((float *)&xmmword_1007FE178 + 3);
    float v46 = *((float *)&xmmword_1007FE178 + 2);
    uint64_t v47 = qword_1007FE188;
    __int128 v263 = unk_1007FE1B0;
    __int128 v264 = *(_OWORD *)&dword_1007FE1C0;
    uint64_t v265 = qword_1007FE1D0;
    __int128 v261 = unk_1007FE190;
    __int128 v262 = *(_OWORD *)&qword_1007FE1A0;
    if (v37 > 0.0 && v37 < 1.0)
    {
      id v48 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override regMonFilterAlphaOverride = %f",  __p,  0xCu);
      }

      float v44 = v37;
    }

    if (v39 > 0.0)
    {
      uint64_t v49 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v39;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override regMonHystEnterDistMOverride = %f",  __p,  0xCu);
      }

      float v45 = v39;
    }

    if (v41 > 0.0)
    {
      uint64_t v50 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override regMonHystExitDistMOverride = %f",  __p,  0xCu);
      }

      float v46 = v41;
    }

    if (v43 > 0.0)
    {
      id v51 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v43;
        _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override handoffUserIntentScoreThresholdOverride = %f",  __p,  0xCu);
      }

      uint64_t v47 = *(void *)&v43;
    }

    char v52 = byte_1007FE1D8;
    __int128 v259 = unk_1007FE239;
    v260[0] = *(__int128 *)((char *)&xmmword_1007FE248 + 1);
    *(void *)((char *)v260 + 15) = qword_1007FE258;
    __int128 v255 = unk_1007FE1F9;
    __int128 v256 = *(__int128 *)((char *)&xmmword_1007FE208 + 1);
    __int128 v257 = *(_OWORD *)((char *)&qword_1007FE218 + 1);
    __int128 v258 = *(__int128 *)((char *)&xmmword_1007FE228 + 1);
    __int128 v253 = unk_1007FE1D9;
    __int128 v254 = *(__int128 *)((char *)&xmmword_1007FE1E8 + 1);
    if ([v35 BOOLForKey:@"RegMonDisableRVKalmanFilter"])
    {
      v53 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__p = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override disabled rv kalman filters",  __p,  2u);
      }

      char v52 = 1;
    }

    sub_1002AEA60(v177, (uint64_t)&unk_1007FE160);
    uint64_t v141 = qword_1007FE260;
    double v54 = *(double *)&xmmword_1007FE268;
    __int128 v174 = *(__int128 *)((char *)&xmmword_1007FE268 + 8);
    __int128 v175 = unk_1007FE280;
    __int128 v176 = *(__int128 *)((char *)&xmmword_1007FE288 + 8);
    uint64_t v144 = *((void *)&xmmword_1007FE2A0 + 1);
    uint64_t v145 = xmmword_1007FE2A0;
    int8x8_t v55 = (int8x8_t)qword_1007FE2B0;
    v252[0] = *(__int128 *)((char *)&xmmword_1007FE2E0 + 8);
    v252[1] = *(_OWORD *)&qword_1007FE2F8;
    __int128 v250 = *(_OWORD *)&qword_1007FE2C8;
    __int128 v251 = unk_1007FE2D8;
    __int128 v249 = xmmword_1007FE2B8;
    [v35 doubleForKey:@"RegMonKalmanFilterHystUpperOverride"];
    float64_t v140 = v56;
    [v35 doubleForKey:@"RegMonKalmanFilterHystLowerOverride"];
    float64_t v139 = v57;
    int v58 = [v35 integerForKey:@"RegMonKalmanFilterNStartupMeasurementsOverride"];
    [v35 doubleForKey:@"RegMonKalmanFilterProcessStdOverride"];
    double v60 = v59;
    int v61 = [v35 integerForKey:@"RegMonKalmanFilterTimeoutSeconds"];
    if (v58 > 0)
    {
      v62 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v58;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override RegMonKalmanFilterNStartupMeasurementsOverride = %i",  __p,  8u);
      }

      uint64_t v145 = v58;
    }

    if (v60 > 0.0)
    {
      v63 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 134217984;
        *(double *)&__p[4] = v60;
        _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override RegMonKalmanFilterProcessStdOverride = %f",  __p,  0xCu);
      }

      double v54 = v60;
    }

    if (v61 >= 1)
    {
      v64 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__p = 67109120;
        *(_DWORD *)&__p[4] = v61;
        _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions #config-override RegMonKalmanFilterTimeoutSeconds = %i",  __p,  8u);
      }

      uint64_t v144 = v61;
    }

    int v65 = [v35 integerForKey:@"RegMonThresholdDetectorBufferSize"];
    *(_OWORD *)v154 = xmmword_1007FE308;
    sub_100201E2C(v155, (uint64_t)&unk_1007FE318);
    v156[0] = xmmword_1007FE330;
    *(_OWORD *)((char *)v156 + 12) = *(__int128 *)((char *)&xmmword_1007FE330 + 12);
    sub_100201F04((uint64_t)v157, &byte_1007FE350);
    __int128 v170 = xmmword_1007FE410;
    __int128 v171 = *(_OWORD *)&dword_1007FE420;
    __int128 v172 = xmmword_1007FE430;
    __int128 v166 = xmmword_1007FE3D0;
    __int128 v167 = unk_1007FE3E0;
    __int128 v168 = xmmword_1007FE3F0;
    __int128 v169 = xmmword_1007FE400;
    __int128 v162 = *(__int128 *)((char *)&xmmword_1007FE388 + 8);
    __int128 v163 = unk_1007FE3A0;
    __int128 v164 = *(__int128 *)((char *)&xmmword_1007FE3A8 + 8);
    __int128 v165 = xmmword_1007FE3C0;
    __int128 v160 = xmmword_1007FE370;
    uint64_t v173 = qword_1007FE440;
    __int128 v161 = *(_OWORD *)&byte_1007FE380;
    if (v65 >= 1) {
      LODWORD(v154[0]) = v65;
    }
    int v66 = [v35 integerForKey:@"RegMonBoundedRegionRangeEstimatorType"];
    if (v66 < 1)
    {
LABEL_86:
      double accumulatedExcessSeconds = v148->_findingLatencyBookkeeping.accumulatedExcessSeconds;
      uint64_t v72 = objc_opt_class(&OBJC_CLASS___NIDevicePresenceConfiguration, v67);
      char isKindOfClass = objc_opt_isKindOfClass(*(void *)&accumulatedExcessSeconds, v72);
      double v75 = v148->_findingLatencyBookkeeping.accumulatedExcessSeconds;
      if ((isKindOfClass & 1) != 0)
      {
        id v76 = *(id *)&v75;
        v77 = (void *)objc_claimAutoreleasedReturnValue([v76 token]);
        BOOL v78 = v77 == 0LL;

        if (!v78)
        {
          BYTE8(v160) = 1;
          LOBYTE(v161) = 0;
        }
      }

      else
      {
        uint64_t v79 = objc_opt_class(&OBJC_CLASS___NIHomeDeviceConfiguration, v74);
        if ((objc_opt_isKindOfClass(*(void *)&v75, v79) & 1) == 0
          || (v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( NSUserDefaults,  "standardUserDefaults")),  unsigned int v81 = [v80 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"],  v80,  !v81))
        {
LABEL_94:
          sub_1002AEA60((uint64_t *)__p, (uint64_t)v177);
          v82.f64[0] = v140;
          v82.f64[1] = v139;
          *(float *)&__p[24] = v44;
          unsigned int v200 = v142;
          float v201 = v46;
          float v202 = v45;
          uint64_t v203 = v47;
          __int128 v206 = v263;
          __int128 v207 = v264;
          int v208 = v265;
          __int128 v204 = v261;
          __int128 v205 = v262;
          char v209 = v52;
          __int128 v210 = v253;
          __int128 v214 = v257;
          __int128 v213 = v256;
          __int128 v212 = v255;
          __int128 v211 = v254;
          *(void *)&v217[15] = *(void *)((char *)v260 + 15);
          *(_OWORD *)v217 = v260[0];
          __int128 v216 = v259;
          __int128 v215 = v258;
          uint64_t v218 = v141;
          double v219 = v54;
          __int128 v220 = v174;
          __int128 v221 = v175;
          __int128 v222 = v176;
          uint64_t v223 = v145;
          uint64_t v224 = v144;
          int8x8_t v225 = vbsl_s8((int8x8_t)vmovn_s64(vcgtzq_f64(v82)), (int8x8_t)vcvt_f32_f64(v82), v55);
          __int128 v227 = v250;
          __int128 v228 = v251;
          v229[0] = v252[0];
          *(_OWORD *)((char *)v229 + 12) = *(_OWORD *)((char *)v252 + 12);
          __int128 v226 = v249;
          v229[2] = *(_OWORD *)v154;
          sub_100201E2C(v230, (uint64_t)v155);
          *(_OWORD *)((char *)v231 + 12) = *(_OWORD *)((char *)v156 + 12);
          v231[0] = v156[0];
          sub_100201F04((uint64_t)&v232, (__int128 *)v157);
          __int128 v245 = v170;
          __int128 v246 = v171;
          __int128 v247 = v172;
          uint64_t v248 = v173;
          __int128 v241 = v166;
          __int128 v242 = v167;
          __int128 v243 = v168;
          __int128 v244 = v169;
          __int128 v237 = v162;
          __int128 v238 = v163;
          __int128 v239 = v164;
          __int128 v240 = v165;
          __int128 v235 = v160;
          __int128 v236 = v161;
          HIDWORD(v148->_convStateForObject) = -[NINearbyUpdatesEngine _setReadValidateDefaultsWriteForTypeOfPredictor]( v148,  "_setReadValidateDefaultsWriteForTypeOfPredictor");
          sub_1002544D4(v153);
          std::string::size_type v83 = 0x3FDA3D70A3D70A3DLL;
          std::string::size_type v84 = 0x3FE199999999999ALL;
          switch(HIDWORD(v148->_convStateForObject))
          {
            case 0:
              v95 = (os_log_s *)(id)qword_1008000A0;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = 0xBFB999999999999ALL;
                _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor Using default user intent threshold value for (no AoA + no spatial gestures) predictor: %f",  (uint8_t *)&buf,  0xCu);
              }

              goto LABEL_109;
            case 1:
            case 3:
              sub_1002544D8((uint64_t)v153, (uint64_t)&buf);
              uint64_t v85 = 0LL;
              int v86 = v197;
              do
              {
                v87 = (void **)((char *)&buf.__r_.__value_.__l.__data_ + v85);
                v85 -= 32LL;
              }

              while (v85 != -64);
              v88 = (os_log_s *)(id)qword_1008000A0;
              v89 = v88;
              if (v86)
              {
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.__r_.__value_.__l.__data_) = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor Successfully obtained trained model weights filepath",  (uint8_t *)&buf,  2u);
                }

                v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
                v91 = (void *)objc_claimAutoreleasedReturnValue( [v90 objectForKey:@"SpatialGesturesIntentPredictorThresholdSingleAntenna"]);
                BOOL v92 = v91 == 0LL;

                if (v92)
                {
                  std::string::size_type v84 = 0x3FE199999999999ALL;
                }

                else
                {
                  [v90 doubleForKey:@"SpatialGesturesIntentPredictorThresholdSingleAntenna"];
                  std::string::size_type v84 = v93;
                  v94 = (os_log_s *)(id)qword_1008000A0;
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v84;
                    _os_log_impl( (void *)&_mh_execute_header,  v94,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor Setting user intent threshold value for spatial gestures singl e antenna predictor: %f",  (uint8_t *)&buf,  0xCu);
                  }
                }

                v96 = (void *)objc_claimAutoreleasedReturnValue( [v90 objectForKey:@"SpatialGesturesIntentPredictorThresholdDualAntenna"]);
                BOOL v97 = v96 == 0LL;

                if (v97)
                {
                  std::string::size_type v83 = 0x3FDA3D70A3D70A3DLL;
                }

                else
                {
                  [v90 doubleForKey:@"SpatialGesturesIntentPredictorThresholdDualAntenna"];
                  std::string::size_type v83 = v98;
                  v99 = (os_log_s *)(id)qword_1008000A0;
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v83;
                    _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor Setting user intent threshold value for spatial gestures dual antenna predictor: %f",  (uint8_t *)&buf,  0xCu);
                  }
                }
              }

              else
              {
                if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
                  sub_1003A5ED0();
                }

                HIDWORD(v148->_convStateForObject) = 0;
              }

              break;
            case 2:
              v95 = (os_log_s *)(id)qword_1008000A0;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = 0x3FE8000000000000LL;
                _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor Using default user intent threshold value for AoA predictor: %f",  (uint8_t *)&buf,  0xCu);
              }

- (int)_setReadValidateDefaultsWriteForTypeOfPredictor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_1007FE570);
  if ((v3 & 1) == 0 && __cxa_guard_acquire(&qword_1007FE570))
  {
    dword_1007FE568 = *((_DWORD *)sub_100005150() + 144);
    __cxa_guard_release(&qword_1007FE570);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"HandoffIntentPredictorType"]);

  if (!v4)
  {
    if (dword_1007FE568 > 99)
    {
      if (dword_1007FE568 > 199)
      {
      }

      else if ((dword_1007FE568 - 100) >= 0x16)
      {
        goto LABEL_3;
      }

      v8 = (os_log_s *)qword_1008000A0;
      int v7 = 0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#intentPredictorDefaultsWrite Intent predictor not enabled for this device type",  v18,  2u);
        int v7 = 0;
      }

      goto LABEL_29;
    }

    if (dword_1007FE568 < 0x18)
    {
      unsigned int v16 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#intentPredictorDefaultsWrite Intent predictor type for this device: Spatial Gestures",  buf,  2u);
      }

      int v7 = 3;
      goto LABEL_29;
    }
  }

- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfigForPeerSessions
{
  *(int64x2_t *)&retstr->double var8 = vdupq_n_s64(0x7FF0000000000000uLL);
  *(_OWORD *)&retstr->double var10 = 0u;
  *(_OWORD *)&retstr->double var12 = 0u;
  retstr->var18 = INFINITY;
  retstr->var19 = 1;
  v4 = (os_log_s *)qword_1008000A0;
  result = (PeopleFinderAlgorithmConfig *)os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)result)
  {
    double var10 = retstr->var10;
    double var11 = retstr->var11;
    double var12 = retstr->var12;
    double var13 = retstr->var13;
    double var8 = retstr->var8;
    double var9 = retstr->var9;
    int v12 = 134219264;
    double v13 = var8;
    __int16 v14 = 2048;
    double v15 = var10;
    __int16 v16 = 2048;
    double v17 = var11;
    __int16 v18 = 2048;
    double v19 = var12;
    __int16 v20 = 2048;
    double v21 = var13;
    __int16 v22 = 2048;
    double v23 = var9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,People-finder yield for peer session config set to maxUWBRange, %f, minUWBRangeRate, %f, rangeRateWindow , %f, groupFindingMinUWBRangeRate, %f, groupFindingRangeRateWindow, %f,  maxUWBRangeInFavorableGnssConditions, %f",  (uint8_t *)&v12,  0x3Eu);
  }

  return result;
}

- (PeopleFinderAlgorithmConfig)_getPeopleFinderAlgorithmConfig
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v92 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableCL"];
  unsigned __int8 v91 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisablePF"];
  unsigned __int8 v90 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableSA"];
  unsigned __int8 v89 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableSAWithFindeeVIO"];
  unsigned __int8 v5 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableSARangeOnly"];
  unsigned __int8 v6 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsEnableStraightPathFilter"];
  unsigned __int8 v7 = [v4 BOOLForKey:@"DisableUseOfRangesWithStatus7"];
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldMaxRange"];
  double v9 = v8;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldMaxRangeInFavorableGnssConditions"];
  double v11 = v10;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldMinUWBRangeRate"];
  double v13 = v12;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldRangeRateWindow"];
  double v15 = v14;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldGroupFindingMinUWBRangeRate"];
  double v17 = v16;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsYieldGroupFindingRangeRateWindow"];
  double v19 = v18;
  unsigned __int8 v20 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableRelaxedYieldCriteria"];
  unsigned int v94 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableStrictSABoxSpanRequirement"];
  unsigned int v93 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsDisableFinderIO"];
  [v4 doubleForKey:@"PeopleFinderMinSvTrackedToAvailableRatioForFavorableGnssConditions"];
  double v86 = v21;
  [v4 doubleForKey:@"PeopleFinderMinGnssSatelliteElevationDeg"];
  double v84 = v22;
  unsigned int v88 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsParticleFilterSeedWithCL"];
  unsigned int v23 = [v4 BOOLForKey:@"PeopleFinderAlgorithmsParticleFilterDisableSeedWithSA"];
  int64_t v87 = (int64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterNumParticles"];
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterPDRFrameRotationNoiseRads"];
  double v85 = v24;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterPDRScaleNoiseMuLognormal"];
  double v83 = v25;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterPDRScaleNoiseSigmaLognormal"];
  double v82 = v26;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterMultipathProcessVarianceScaling"];
  double v81 = v27;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterMultipathMeasurementStd"];
  double v80 = v28;
  [v4 doubleForKey:@"PeopleFinderAlgorithmsParticleFilterTrailingMeasurementStdThreshold"];
  double v79 = v29;
  uint64_t v30 = (uint64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterNLOSTimeoutSec"];
  uint64_t v31 = (uint64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterNoMeasurementTimeoutSec"];
  uint64_t v32 = (uint64_t)[v4 integerForKey:@"PeopleFinderAlgorithmsParticleFilterConservativeNLOSTimeoutSec"];
  [v4 doubleForKey:@"PeopleFindingFindButtonTimeoutSecondsOverride"];
  double v34 = v33;
  *(_OWORD *)&retstr->var7 = xmmword_10042C700;
  *(_OWORD *)&retstr->double var9 = xmmword_10042C710;
  __asm { FMOV            V0.2D, #2.0 }

  *(_OWORD *)&retstr->double var11 = _Q0;
  retstr->double var13 = 2.0;
  *(_WORD *)&retstr->var14.BOOL var0 = 0;
  retstr->var14.BOOL var2 = 0.05;
  retstr->var14.BOOL var3 = 20000LL;
  *(_OWORD *)&retstr->var14.BOOL var4 = xmmword_10042C720;
  *(_OWORD *)&retstr->var14.var6 = xmmword_10042C730;
  *(_OWORD *)&retstr->var14.double var8 = xmmword_10042C740;
  *(_OWORD *)&retstr->var14.double var10 = xmmword_10042C750;
  retstr->var16 = (GnssReliabilityIndicatorConfig)xmmword_10042C760;
  retstr->var18 = 10.0;
  retstr->var19 = 0;
  retstr->BOOL var0 = v92 ^ 1;
  retstr->BOOL var1 = v91 ^ 1;
  retstr->BOOL var2 = v90 ^ 1;
  retstr->BOOL var4 = v89 ^ 1;
  retstr->BOOL var3 = v5 ^ 1;
  retstr->var5 = v6;
  retstr->var6 = v7 ^ 1;
  retstr->BOOL var15 = v20 ^ 1;
  retstr->var17 = v94 ^ 1;
  retstr->var20 = v93 ^ 1;
  double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  double v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"PeopleFinderLowPassFilterTimeConstant"]);

  if (v41)
  {
    double v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v42 doubleForKey:@"PeopleFinderLowPassFilterTimeConstant"];
    double v44 = v43;

    retstr->var7 = v44;
    float v45 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Setting PeopleFinderAlgorithms low pass filter time constant to %3.2f",  buf,  0xCu);
    }
  }

  if (v9 > 0.0) {
    retstr->double var8 = v9;
  }
  if (v11 > 0.0) {
    retstr->double var9 = v11;
  }
  if (v13 > 0.0 && v15 > 0.0)
  {
    retstr->double var10 = v13;
    retstr->double var11 = v15;
  }

  if (v17 > 0.0 && v19 > 0.0)
  {
    retstr->double var12 = v17;
    retstr->double var13 = v19;
  }

  if (v34 > 0.0) {
    retstr->var18 = v34;
  }
  float v46 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    double var10 = retstr->var10;
    double var11 = retstr->var11;
    double var12 = retstr->var12;
    double var13 = retstr->var13;
    BOOL var15 = retstr->var15;
    double var8 = retstr->var8;
    double var9 = retstr->var9;
    *(_DWORD *)std::string buf = 134219520;
    *(double *)v96 = var8;
    *(_WORD *)&v96[8] = 2048;
    double v97 = var10;
    *(_WORD *)std::string::size_type v98 = 2048;
    *(double *)&v98[2] = var11;
    __int16 v99 = 2048;
    double v100 = var12;
    __int16 v101 = 2048;
    double v102 = var13;
    __int16 v103 = 1024;
    BOOL v104 = var15;
    __int16 v105 = 2048;
    double v106 = var9;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,People-finder yield config set to maxUWBRange, %f, minUWBRangeRate, %f, rangeRateWindow, %f, groupFindin gMinUWBRangeRate, %f, groupFindingRangeRateWindow, %f, enableRelaxedYieldCriteriaInFavorableGnssConditions, %d, ma xUWBRangeInFavorableGnssConditions, %f",  buf,  0x44u);
  }

  v54.i32[0] = *(_DWORD *)&retstr->var1;
  if ((vmaxv_u16((uint16x4_t)vceqz_s16((int16x4_t)(vmovl_u8(v54).u64[0] & 0xFF00FF00FF00FFLL))) & 1) != 0
    || !retstr->var0)
  {
    int8x8_t v55 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var1 = retstr->var1;
      BOOL var2 = retstr->var2;
      BOOL var4 = retstr->var4;
      BOOL var3 = retstr->var3;
      BOOL var0 = retstr->var0;
      *(_DWORD *)std::string buf = 67110144;
      *(_DWORD *)v96 = var1;
      *(_WORD *)&v96[4] = 1024;
      *(_DWORD *)&v96[6] = var2;
      LOWORD(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 2) = var4;
      HIWORD(v97) = 1024;
      *(_DWORD *)std::string::size_type v98 = var3;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = var0;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,WARNING: One or more estimators disabled via default,pf,%d,sa,%d,savio,%d,saro,%d,cl,%d",  buf,  0x20u);
    }
  }

  if (retstr->var5)
  {
    int v61 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Straight path estimator enabled via default",  buf,  2u);
    }
  }

  if (v94)
  {
    v62 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Strict SA box span requirement disabled via default",  buf,  2u);
    }
  }

  if (v93)
  {
    v63 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Finder IO usage enabled via default",  buf,  2u);
    }
  }

  if (v87 >= 1)
  {
    retstr->var14.BOOL var3 = v87;
    v64 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(void *)v96 = v87;
      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, number of particles in PF: %ld",  buf,  0xCu);
    }
  }

  if (v88)
  {
    retstr->var14.BOOL var0 = v88;
    int v65 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,People-finder enabling seeding PF solution with CL arrow",  buf,  2u);
    }
  }

  if (v23)
  {
    retstr->var14.BOOL var1 = v23;
    int v66 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Disabling the ability to seed PF with SA solution when findee motion detected",  buf,  2u);
    }
  }

  if (v85 > 0.0)
  {
    retstr->var14.BOOL var2 = v85;
    uint64_t v67 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v85;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, pdrFrameRotationNoise: %f rads",  buf,  0xCu);
    }
  }

  if (v83 > 0.0)
  {
    retstr->var14.double var10 = v83;
    v68 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v83;
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, pdrScaleMu: %f",  buf,  0xCu);
    }
  }

  if (v82 > 0.0)
  {
    retstr->var14.double var11 = v82;
    v69 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v82;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, pdrScalSigma: %f",  buf,  0xCu);
    }
  }

  if (v81 > 0.0)
  {
    retstr->var14.BOOL var4 = v81;
    v70 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v81;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, processVarInnovationScale: %f",  buf,  0xCu);
    }
  }

  if (v80 > 0.0)
  {
    retstr->var14.var5 = v80;
    v71 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v80;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, measurementStdForInnovationCheck: %f",  buf,  0xCu);
    }
  }

  if (v79 > 0.0)
  {
    retstr->var14.var6 = v79;
    uint64_t v72 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v79;
      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, trailingStdThreshold: %f",  buf,  0xCu);
    }
  }

  if (v30 >= 1)
  {
    retstr->var14.var7 = (double)v30;
    v73 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = (double)v30;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, nlosTimeThreshSec: %f",  buf,  0xCu);
    }
  }

  if (v31 >= 1)
  {
    retstr->var14.double var9 = (double)v31;
    uint64_t v74 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = (double)v31;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, timeoutAfterNoMeasurementsSec: %f",  buf,  0xCu);
    }
  }

  if (v32 >= 1)
  {
    retstr->var14.double var8 = (double)v32;
    double v75 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = (double)v32;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding PF parameter, conservativeNlosTimeThreshSec: %f",  buf,  0xCu);
    }
  }

  if (v86 > 0.0)
  {
    retstr->var16.BOOL var0 = v86;
    id v76 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v86;
      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding GRI parameter, minSvTrackedToAvailableRatioForFavorableGnssConditions: %.2lf",  buf,  0xCu);
    }
  }

  if (v84 > 0.0 && v84 <= 90.0)
  {
    retstr->var16.BOOL var1 = v84;
    v77 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)v96 = v84;
      _os_log_impl( (void *)&_mh_execute_header,  v77,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding GRI parameter, minGnssSatelliteElevationDeg: %f",  buf,  0xCu);
    }
  }

  return result;
}

- (FindeeAlgorithmConfig)_getFindeeAlgorithmConfig
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 doubleForKey:@"FindeeMinSvTrackedToAvailableRatioForFavorableGnssConditions"];
  double v4 = v3;
  [v2 doubleForKey:@"FindeeMinGnssSatelliteElevationDeg"];
  double v6 = v5;
  double v7 = 0.5;
  if (v4 > 0.0)
  {
    double v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding GRI parameter, minSvTrackedToAvailableRatioForFavorableGnssConditions: %.2lf",  (uint8_t *)&v13,  0xCu);
    }

    double v7 = v4;
  }

  double v9 = 15.0;
  if (v6 > 0.0 && v6 <= 90.0)
  {
    double v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Overriding GRI parameter, minGnssSatelliteElevationDeg: %f",  (uint8_t *)&v13,  0xCu);
    }

    double v9 = v6;
  }

  double v11 = v7;
  double v12 = v9;
  result.var0.BOOL var1 = v12;
  result.var0.BOOL var0 = v11;
  return result;
}

- (void)_sendTimeTupleToAlgorithms
{
  if (sub_100023CD8(&v7, &v6, &v5))
  {
    int64_t var0 = self->_uniqueIdentifier.var0;
    if (var0)
    {
      *(double *)double v4 = v5;
      *(double *)&v4[1] = v6;
      *(double *)&v4[2] = v7;
      if (self->_protobufLogger.__ptr_)
      {
        sub_10023F918((uint64_t)self->_protobufLogger.__ptr_, (const std::string *)&self->_uniqueIdentifier, v5, v6, v7);
        int64_t var0 = self->_uniqueIdentifier.var0;
      }

      (*(void (**)(int64_t, void *))(*(void *)var0 + 16LL))(var0, v4);
    }
  }

- (void)_createSyntheticApertureAlgoContainer
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nrby-eng,_syntheticApertureFilter", v7, 2u);
  }

  double v4 = operator new(0x230uLL);
  sub_1002C604C(v4, 1LL, 1LL, 1LL, 1LL, 1LL);
  uint64_t v5 = *(void *)&self->_uniqueIdentifier.__r_.var0;
  *(void *)&self->_uniqueIdentifier.__r_.int64_t var0 = v4;
  if (v5) {
    sub_1002AF880((uint64_t)&self->_uniqueIdentifier.__r_.var0, v5);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023F5B4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, 3);
  }
  -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
}

- (void)_createPeerFindingAlgoContainer
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,_findingAlgorithmContainer = PeerFindingAlgorithms",  buf,  2u);
  }

  -[NINearbyUpdatesEngine _getPeopleFinderAlgorithmConfigForPeerSessions]( self,  "_getPeopleFinderAlgorithmConfigForPeerSessions");
  -[NINearbyUpdatesEngine _getFindeeAlgorithmConfig](self, "_getFindeeAlgorithmConfig");
  uint64_t v9 = v4;
  uint64_t v10 = v5;
  double v6 = operator new(0x40uLL);
  sub_1002E1348(v6, buf, &v9);
  int64_t var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.int64_t var0 = (int64_t)v6;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 368LL))(var0);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023F5B4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, 4);
  }
  -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms", v9, v10);
}

- (void)_createPeopleFinderAlgoContainer
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,_findingAlgorithmContainer = PeopleFinderAlgorithms",  v7,  2u);
  }

  -[NINearbyUpdatesEngine _getPeopleFinderAlgorithmConfig](self, "_getPeopleFinderAlgorithmConfig");
  uint64_t v4 = operator new(0x26B0uLL);
  sub_100305AF4(v4, v7);
  int64_t var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.int64_t var0 = (int64_t)v4;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 368LL))(var0);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023F5B4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, 1);
  }
  -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
}

- (void)_createDeviceFinderAlgoContainer
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,_findingAlgorithmContainer = DeviceFinderAlgorithms",  v7,  2u);
  }

  uint64_t v4 = operator new(0x170uLL);
  sub_100318088(v4, self->_queue);
  int64_t var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.int64_t var0 = (int64_t)v4;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 368LL))(var0);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023F5B4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, 2);
  }
  -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
}

- (void)_createFindeeAlgoContainer
{
  double v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,_findingAlgorithmContainer = FindeeAlgorithms",  (uint8_t *)v9,  2u);
  }

  -[NINearbyUpdatesEngine _getFindeeAlgorithmConfig](self, "_getFindeeAlgorithmConfig");
  v9[0] = v4;
  v9[1] = v5;
  double v6 = operator new(0x280uLL);
  sub_1002CEC84(v6, v9);
  int64_t var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.int64_t var0 = (int64_t)v6;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 368LL))(var0);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023F5B4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, 0);
  }
  -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
}

- (void)provideFindingSolution:(id)a3
{
  id v5 = a3;
  if (self->_uniqueIdentifier.var0)
  {
    sub_1001A3CF0(0x2B73047Cu, 1, 0LL, 0LL, 0LL, 0LL);
    (**(void (***)(float32x2_t *__return_ptr))self->_uniqueIdentifier.var0)(v45);
    sub_1001A3CF0(0x2B73047Cu, 2, 0LL, 0LL, 0LL, 0LL);
    uint64_t ptr = self->_protobufLogger.__ptr_;
    if (ptr) {
      sub_10023EFFC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v45);
    }
    -[NINearbyUpdatesEngine logSolution:](self, "logSolution:", v45);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:](self, "nearbyObjectFromSolution:", v45));
    if (v7
      || self->_findingPeerToken
      && (double v7 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyUpdatesEngine nearbyObjectFromSolution:forPeer:]( self,  "nearbyObjectFromSolution:forPeer:",  v45))) != 0LL)
    {
      double v8 = self->_protobufLogger.__ptr_;
      if (v8)
      {
        [v7 timestamp];
        double v10 = v9;
        sub_100230924(v7, (uint64_t)&__p);
        memset(&v41, 0, sizeof(v41));
        v40.__r_.__value_.__s.__data_[8] = 0;
        v41.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0xA0uLL);
        v41.__r_.__value_.__l.__size_ = v41.__r_.__value_.__r.__words[0];
        v41.__r_.__value_.__l.__cap_ = v41.__r_.__value_.__r.__words[0] + 160;
        v41.__r_.__value_.__l.__size_ = sub_1002AFBEC( (uint64_t)&v41.__r_.__value_.__l.__cap_,  (uint64_t)&__p,  (uint64_t)v45,  (uint64_t)v41.__r_.__value_.__l.__data_);
        sub_1002395E8((uint64_t)v8, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v41, v10);
        v40.__r_.__value_.__r.__words[0] = (std::string::size_type)&v41;
        sub_1002AFD60((void ***)&v40);
        if (__p.__r_.__value_.__r.__words[0])
        {
          __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }

      dataSource = self->_dataSource;
      if (dataSource) {
        -[NINearbyUpdatesEngineDataSource updateWithSolution:](dataSource, "updateWithSolution:", v45);
      }
      if (v5)
      {
        objc_msgSend(v7, "setNbRxStatus:", objc_msgSend(v5, "nbRxStatus"));
        objc_msgSend(v7, "setMmsRxStatus:", objc_msgSend(v5, "mmsRxStatus"));
        [v5 nbRssi];
        objc_msgSend(v7, "setNbRssi:");
        [v5 signalStrength];
        objc_msgSend(v7, "setSignalStrength:");
      }

      sub_1000065CC(&v41, "");
      sub_1000065CC(&v40, "RawDist = ");
      if (v5)
      {
        objc_storeStrong((id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds, a3);
        [v5 distance];
      }

      else
      {
        [*(id *)&self->_findingLatencyBookkeeping.lastProcessTimeSeconds distance];
      }

      sub_1002A7540(2, &__p, v12 * 3.28);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type size = __p.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(&v40, (const std::string::value_type *)p_p, size);
      if ((v40.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        double v15 = &v40;
      }
      else {
        double v15 = (std::string *)v40.__r_.__value_.__r.__words[0];
      }
      if ((v40.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v16 = v40.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v16 = v40.__r_.__value_.__l.__size_;
      }
      std::string::append(&v41, (const std::string::value_type *)v15, v16);
      std::string::append(&v41, " ");
      std::string::append(&v41, ", ");
      if ((v46 & 0xFF00000000LL) != 0) {
        double v17 = (&off_1007BBEB8)[(int)v46];
      }
      else {
        double v17 = "Unavailable";
      }
      sub_1000065CC(&v37, v17);
      double v18 = std::string::append(&v37, " : ");
      __int128 v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__l.__cap_ = v18->__r_.__value_.__l.__cap_;
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
      v18->__r_.__value_.__l.__size_ = 0LL;
      v18->__r_.__value_.__l.__cap_ = 0LL;
      v18->__r_.__value_.__r.__words[0] = 0LL;
      if (v45[0].i32[0])
      {
        unsigned __int8 v20 = "Converged   ";
      }

      else if ((*(void *)v45 & 0x100000000LL) != 0)
      {
        unsigned __int8 v20 = "LowDisp     ";
      }

      else if ((*(void *)v45 & 0x100000000000000LL) != 0)
      {
        unsigned __int8 v20 = "LowLighting ";
      }

      else if ((*(void *)v45 & 0x10000000000LL) != 0)
      {
        unsigned __int8 v20 = "LowHorzDisp ";
      }

      else if ((*(void *)v45 & 0x1000000000000LL) != 0)
      {
        unsigned __int8 v20 = "LowVertDisp ";
      }

      else
      {
        unsigned __int8 v20 = "NotConverged";
      }

      sub_1000065CC(v35, v20);
      if ((v36 & 0x80u) == 0) {
        double v21 = v35;
      }
      else {
        double v21 = (void **)v35[0];
      }
      if ((v36 & 0x80u) == 0) {
        std::string::size_type v22 = v36;
      }
      else {
        std::string::size_type v22 = (std::string::size_type)v35[1];
      }
      unsigned int v23 = std::string::append(&__p, (const std::string::value_type *)v21, v22);
      __int128 v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      int64_t cap = v23->__r_.__value_.__l.__cap_;
      *(_OWORD *)double v38 = v24;
      v23->__r_.__value_.__l.__size_ = 0LL;
      v23->__r_.__value_.__l.__cap_ = 0LL;
      v23->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        double v25 = v38;
      }
      else {
        double v25 = (void **)v38[0];
      }
      if (cap >= 0) {
        std::string::size_type v26 = HIBYTE(cap);
      }
      else {
        std::string::size_type v26 = (std::string::size_type)v38[1];
      }
      std::string::append(&v41, (const std::string::value_type *)v25, v26);
      if ((v41.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        double v27 = &v41;
      }
      else {
        double v27 = (std::string *)v41.__r_.__value_.__r.__words[0];
      }
      double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v27));
      [v7 setDebugDisplayInfo:v28];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
      if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
      {
        double v42 = v7;
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
        [WeakRetained updatesEngine:self didUpdateNearbyObjects:v30];
      }

      if (self->_findingPeerToken)
      {
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyUpdatesEngine niConvergenceStateFromSolution:]( self,  "niConvergenceStateFromSolution:",  v45));
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( -[SyntheticApertureFilter objectForKeyedSubscript:]( self->_syntheticApertureFilter.__ptr_.__value_,  "objectForKeyedSubscript:",  self->_findingPeerToken));
        if (([v32 isEqual:v31] & 1) == 0)
        {
          -[SyntheticApertureFilter setObject:forKeyedSubscript:]( self->_syntheticApertureFilter.__ptr_.__value_,  "setObject:forKeyedSubscript:",  v31,  self->_findingPeerToken);
          double v33 = -[NINearbyObject initWithToken:]( objc_alloc(&OBJC_CLASS___NINearbyObject),  "initWithToken:",  self->_findingPeerToken);
          if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:") & 1) != 0) {
            [WeakRetained updatesEngine:self didUpdateAlgorithmConvergenceState:v31 forObject:v33];
          }
          double v34 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(__p.__r_.__value_.__l.__data_) = 138412802;
            *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v33;
            WORD2(__p.__r_.__value_.__r.__words[1]) = 2112;
            *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v31;
            HIWORD(__p.__r_.__value_.__r.__words[2]) = 2112;
            double v44 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#finding, Updated convergence state for object: %@. New state: %@. Previous state: %@",  (uint8_t *)&__p,  0x20u);
          }
        }
      }

      if (SHIBYTE(cap) < 0) {
        operator delete(v38[0]);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
  {
    sub_1003A5F9C();
  }
}

- (void)acceptRoseSolution:(const void *)a3
{
  __int128 v3 = xmmword_10042C848;
  uint64_t v4 = 1LL;
  -[NINearbyUpdatesEngine acceptRoseSolution:withProcessingOptions:]( self,  "acceptRoseSolution:withProcessingOptions:",  a3,  &v3);
}

- (void)acceptRoseSolution:(const void *)a3 withProcessingOptions:(const AlgorithmProcessingOptions *)a4
{
  if (*((_BYTE *)a3 + 24))
  {
    unsigned int v5 = *((_DWORD *)a3 + 8);
    if (v5 > 5) {
      return;
    }
    int v6 = 1 << v5;
    if ((v6 & 0x31) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A6058();
      }
      return;
    }

    if ((v6 & 0xC) != 0) {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeAndAoASolution:](self, "_handleRangeAndAoASolution:", a3));
    }
    else {
      double v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeOnlySolution:](self, "_handleRangeOnlySolution:", a3));
    }
    double v10 = v9;
    if (v9)
    {
      if (!*((_BYTE *)a3 + 24)) {
        sub_100006080();
      }
      [v9 setTimestamp:*((double *)a3 + 2)];
      [v10 setRequiresBiasCorrection:a4->requiresBiasCorrection];
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryToken]);
      id v123 = [v11 hash];
      *(void *)&__int128 buf = &v123;
      float v12 = (id *)sub_1002AFDF4( (uint64_t)&self->_hashToTokenMap,  (unint64_t *)&v123,  (uint64_t)&unk_1004242F8,  (void **)&buf);
      objc_storeStrong(v12 + 3, v11);
      [v10 setRangeBiasEstimate:*(double *)&NINearbyObjectRangeBiasEstimateNotAvailable];
      [v10 setRangeUncertainty:*(double *)&NINearbyObjectRangeUncertaintyNotAvailable];
      if (LOBYTE(self->_convStateForObject))
      {
        int v13 = (os_log_s *)qword_1008000A0;
        if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_41;
        }
        LOWORD(buf) = 0;
        double v14 = "#nrby-eng,#bias-est, Bypass estimating bias correction.";
      }

      else
      {
        unsigned int v15 = [v10 requiresBiasCorrection];
        int v13 = (os_log_s *)qword_1008000A0;
        BOOL v16 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v16)
          {
            LOWORD(buf) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est This device type requires bias estimation.",  (uint8_t *)&buf,  2u);
          }

          if (*((_BYTE *)a3 + 600))
          {
            if (*((unsigned __int16 *)a3 + 215) > 0xFFu)
            {
              int v13 = (os_log_s *)qword_1008000A0;
              if (*((_BYTE *)a3 + 1312))
              {
                double v17 = (os_log_s *)(id)qword_1008000A0;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  if (!*((_BYTE *)a3 + 600)) {
                    sub_100006080();
                  }
                  uint64_t v18 = *((void *)a3 + 14);
                  LODWORD(buf) = 67109120;
                  DWORD1(buf) = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est Calculating bias for device mac addr : %d",  (uint8_t *)&buf,  8u);
                }

                if (self->_protobufLogger.__ptr_)
                {
                  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
                    sub_1003A602C();
                  }
                  sub_10023C07C((uint64_t)self->_protobufLogger.__ptr_, (uint64_t)a3);
                }

                uint64_t v115 = objc_alloc_init(&OBJC_CLASS___UWBSignalFeatures);
                double accumulatedExcessSeconds = self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
                uint64_t v21 = objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v20);
                if ((objc_opt_isKindOfClass(*(void *)&accumulatedExcessSeconds, v21) & 1) != 0)
                {
                  id v22 = *(id *)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
                  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 debugParameters]);
                  if (v23)
                  {
                    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 debugParameters]);
                    double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"enableAdditionalUWBSignalFeatures"]);
                    BOOL v117 = v25 != 0LL;
                  }

                  else
                  {
                    BOOL v117 = 0;
                  }
                }

                else
                {
                  BOOL v117 = 0;
                }

                v114 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyUpdatesEngine _consolidateInputToMLModel:]( self,  "_consolidateInputToMLModel:",  a3));
                v112 = (void *)objc_claimAutoreleasedReturnValue( -[NRBYFindingContainer consumeInputFeatures:]( self->_findingAlgorithmContainer.__ptr_.__value_,  "consumeInputFeatures:",  v114));
                uint64_t v113 = (void *)objc_claimAutoreleasedReturnValue( -[NRBYFindingContainer preprocessInputFeatures:]( self->_findingAlgorithmContainer.__ptr_.__value_,  "preprocessInputFeatures:",  v112));
                uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( -[NRBYFindingContainer predictOutput:]( self->_findingAlgorithmContainer.__ptr_.__value_,  "predictOutput:"));
                v116 = (void *)objc_claimAutoreleasedReturnValue( -[NRBYFindingContainer biasCorrectionEstimate]( self->_findingAlgorithmContainer.__ptr_.__value_,  "biasCorrectionEstimate"));
                if (v116 && v46)
                {
                  __int128 buf = 0uLL;
                  v129[0] = 0LL;
                  uint64_t v119 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  &stru_1007C41E0);
                  for (unint64_t i = 0; (unint64_t)[v46 count] > i; ++i)
                  {
                    id v48 = (void *)objc_claimAutoreleasedReturnValue([v46 objectAtIndexedSubscript:i]);
                    [v48 doubleValue];
                    uint64_t v50 = v49;

                    -[NSMutableString appendFormat:](v119, "appendFormat:", @"%f ", v50);
                    id v51 = (char *)*((void *)&buf + 1);
                    if (*((void *)&buf + 1) >= v129[0])
                    {
                      v53 = (char *)buf;
                      uint64_t v54 = (uint64_t)(*((void *)&buf + 1) - buf) >> 3;
                      unint64_t v55 = v54 + 1;
                      uint64_t v56 = v129[0] - buf;
                      else {
                        unint64_t v57 = v55;
                      }
                      if (v57)
                      {
                        int v58 = (char *)sub_1000472C0((uint64_t)v129, v57);
                        id v51 = (char *)*((void *)&buf + 1);
                        v53 = (char *)buf;
                      }

                      else
                      {
                        int v58 = 0LL;
                      }

                      double v59 = &v58[8 * v54];
                      *(void *)double v59 = v50;
                      char v52 = v59 + 8;
                      while (v51 != v53)
                      {
                        uint64_t v60 = *((void *)v51 - 1);
                        v51 -= 8;
                        *((void *)v59 - 1) = v60;
                        v59 -= 8;
                      }

                      *(void *)&__int128 buf = v59;
                      *((void *)&buf + 1) = v52;
                      v129[0] = &v58[8 * v57];
                      if (v53) {
                        operator delete(v53);
                      }
                    }

                    else
                    {
                      **((void **)&buf + 1) = v50;
                      char v52 = v51 + 8;
                    }

                    *((void *)&buf + 1) = v52;
                  }

                  v63 = (os_log_s *)(id)qword_1008000A0;
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v124 = 67109378;
                    *(_DWORD *)&v124[4] = v64;
                    *(_WORD *)&v124[8] = 2112;
                    *(void *)&v124[10] = v119;
                    _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est Output probabilities for antenna mask %d : %@",  v124,  0x12u);
                  }

                  int v65 = (os_log_s *)(id)qword_1008000A0;
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                  {
                    [v10 distance];
                    float v67 = v66;
                    [v10 distance];
                    float v69 = v68;
                    [v116 doubleValue];
                    *(_DWORD *)v124 = 134218240;
                    *(double *)&v124[4] = v67;
                    *(_WORD *)&v124[12] = 2048;
                    *(double *)&v124[14] = v70 + v69;
                    _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est Range result (raw) = %f, Corrected Range = %f",  v124,  0x16u);
                  }

                  [v116 doubleValue];
                  objc_msgSend(v10, "setRangeBiasEstimate:");
                  BOOL v71 = v117;
                  if (!v114) {
                    BOOL v71 = 0;
                  }
                  if (v71)
                  {
                    uint64_t v72 = objc_alloc_init(&OBJC_CLASS___BiasEstimatorOutputs);
                    [v10 distance];
                    -[BiasEstimatorOutputs setRawRange:](v72, "setRawRange:", v73);
                    [v10 distance];
                    float v75 = v74;
                    [v116 doubleValue];
                    -[BiasEstimatorOutputs setCorrectedRange:](v72, "setCorrectedRange:", v76 + v75);
                    -[BiasEstimatorOutputs setOutProbabilities:](v72, "setOutProbabilities:", v46);
                    -[UWBSignalFeatures setInputFeatures:](v115, "setInputFeatures:", v114);
                    -[UWBSignalFeatures setOutputs:](v115, "setOutputs:", v72);
                    [v10 setUwbSignalFeatures:v115];
                  }

                  if (self->_protobufLogger.__ptr_)
                  {
                    memset(v124, 0, sizeof(v124));
                    v77 = (void *)objc_claimAutoreleasedReturnValue([v112 featureValueForName:@"input"]);
                    BOOL v78 = (void *)objc_claimAutoreleasedReturnValue([v77 multiArrayValue]);

                    std::string __p = 0LL;
                    v121 = 0LL;
                    v122 = 0LL;
                    double v79 = (void *)objc_claimAutoreleasedReturnValue([v113 featureValueForName:@"input"]);
                    v118 = (void *)objc_claimAutoreleasedReturnValue([v79 multiArrayValue]);

                    for (uint64_t j = 0; (uint64_t)[v78 count] > j; ++j)
                    {
                      double v81 = (void *)objc_claimAutoreleasedReturnValue([v78 objectAtIndexedSubscript:j]);
                      [v81 doubleValue];
                      uint64_t v83 = v82;
                      double v84 = *(char **)&v124[8];
                      if (*(void *)&v124[8] >= *(void *)&v124[16])
                      {
                        double v86 = *(char **)v124;
                        uint64_t v87 = (uint64_t)(*(void *)&v124[8] - *(void *)v124) >> 3;
                        unint64_t v88 = v87 + 1;
                        uint64_t v89 = *(void *)&v124[16] - *(void *)v124;
                        else {
                          unint64_t v90 = v88;
                        }
                        if (v90)
                        {
                          unsigned __int8 v91 = (char *)sub_1000472C0((uint64_t)&v124[16], v90);
                          double v86 = *(char **)v124;
                          double v84 = *(char **)&v124[8];
                        }

                        else
                        {
                          unsigned __int8 v91 = 0LL;
                        }

                        unsigned __int8 v92 = &v91[8 * v87];
                        *(void *)unsigned __int8 v92 = v83;
                        double v85 = v92 + 8;
                        while (v84 != v86)
                        {
                          uint64_t v93 = *((void *)v84 - 1);
                          v84 -= 8;
                          *((void *)v92 - 1) = v93;
                          v92 -= 8;
                        }

                        *(void *)v124 = v92;
                        *(void *)&v124[8] = v85;
                        *(void *)&v124[16] = &v91[8 * v90];
                        if (v86) {
                          operator delete(v86);
                        }
                      }

                      else
                      {
                        **(void **)&v124[8] = v82;
                        double v85 = v84 + 8;
                      }

                      *(void *)&v124[8] = v85;

                      unsigned int v94 = (void *)objc_claimAutoreleasedReturnValue([v118 objectAtIndexedSubscript:j]);
                      [v94 doubleValue];
                      uint64_t v96 = v95;
                      double v97 = v121;
                      if (v121 >= v122)
                      {
                        __int16 v99 = (char *)__p;
                        uint64_t v100 = (v121 - (_BYTE *)__p) >> 3;
                        unint64_t v101 = v100 + 1;
                        uint64_t v102 = v122 - (_BYTE *)__p;
                        if ((v122 - (_BYTE *)__p) >> 2 > v101) {
                          unint64_t v101 = v102 >> 2;
                        }
                        else {
                          unint64_t v103 = v101;
                        }
                        if (v103)
                        {
                          BOOL v104 = (char *)sub_1000472C0((uint64_t)&v122, v103);
                          __int16 v99 = (char *)__p;
                          double v97 = v121;
                        }

                        else
                        {
                          BOOL v104 = 0LL;
                        }

                        __int16 v105 = &v104[8 * v100];
                        *(void *)__int16 v105 = v96;
                        std::string::size_type v98 = v105 + 8;
                        while (v97 != v99)
                        {
                          uint64_t v106 = *((void *)v97 - 1);
                          v97 -= 8;
                          *((void *)v105 - 1) = v106;
                          v105 -= 8;
                        }

                        std::string __p = v105;
                        v121 = v98;
                        v122 = &v104[8 * v103];
                        if (v99) {
                          operator delete(v99);
                        }
                      }

                      else
                      {
                        *(void *)v121 = v95;
                        std::string::size_type v98 = v97 + 8;
                      }

                      v121 = v98;
                    }

                    if (!*((_BYTE *)a3 + 600)
                      || (unsigned int v107 = *((unsigned __int16 *)a3 + 215), v107 < 0x100)
                      || (uint64_t ptr = self->_protobufLogger.__ptr_,
                          [v10 distance],
                          float v110 = v109,
                          [v116 doubleValue],
                          !*((_BYTE *)a3 + 24)))
                    {
                      sub_100006080();
                    }

                    sub_10023C7F8( (uint64_t)ptr,  v107,  v110,  v111,  *((double *)a3 + 2),  (uint64_t)v124,  (uint64_t)&__p,  (uint64_t *)&buf,  *((unsigned __int16 *)a3 + 18),  *((void *)a3 + 5));

                    if (__p)
                    {
                      v121 = (char *)__p;
                      operator delete(__p);
                    }

                    if (*(void *)v124)
                    {
                      *(void *)&v124[8] = *(void *)v124;
                      operator delete(*(void **)v124);
                    }
                  }

                  if ((void)buf)
                  {
                    *((void *)&buf + 1) = buf;
                    operator delete((void *)buf);
                  }
                }

                else
                {
                  -[NINearbyUpdatesEngine _getRangeUncertaintyWhenBiasEstimateNotAvailable]( self,  "_getRangeUncertaintyWhenBiasEstimateNotAvailable");
                  objc_msgSend(v10, "setRangeUncertainty:");
                  int v61 = (os_log_s *)(id)qword_1008000A0;
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    [v10 rangeUncertainty];
                    LODWORD(buf) = 134217984;
                    *(void *)((char *)&buf + 4) = v62;
                    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est Could not compute bias estimate, override range uncertainty to %.2f",  (uint8_t *)&buf,  0xCu);
                  }
                }

                goto LABEL_41;
              }

              if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_41:
                unsigned int v26 = -[NINearbyUpdatesEngine _shouldConsumeRoseSolution:](self, "_shouldConsumeRoseSolution:", a3);
                if (!sub_1002B003C( &self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&a4->regionSizeCategory)) {
                  goto LABEL_166;
                }
                double v27 = sub_100046FEC( &self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&a4->regionSizeCategory);
                if (!v27) {
                  sub_100126B2C("unordered_map::at: key not found");
                }
                if (v27[3])
                {
                  if ((v26 & 1) != 0) {
                    -[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:]( self,  "processUWBResultForRegionMonitoring:roseSolution:processingOptions:",  v10,  a3,  a4);
                  }
                }

                else
                {
LABEL_166:
                  if (*(void *)&self->_uniqueIdentifier.__r_.var0)
                  {
                    -[NINearbyUpdatesEngine processUWBResultForSyntheticAperture:roseSolution:]( self,  "processUWBResultForSyntheticAperture:roseSolution:",  v10,  a3);
                  }

                  else if (self->_uniqueIdentifier.var0)
                  {
                    if (*((_BYTE *)a3 + 600))
                    {
                      double v28 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryToken]);
                      id v29 = [v28 hash];
                      if (!*((_BYTE *)a3 + 24) || !*((_BYTE *)a3 + 600)) {
                        sub_100006080();
                      }
                      uint64_t v30 = *((void *)a3 + 2);
                      *(float *)&unsigned int v31 = *((double *)a3 + 44);
                      uint64_t v32 = *((void *)a3 + 27);
                      int v33 = *((unsigned __int16 *)a3 + 80) | 0x10000;
                      __int16 v34 = *((_WORD *)a3 + 257);
                      __int16 v35 = *((_WORD *)a3 + 280);
                      *(void *)&__int128 buf = v29;
                      *((void *)&buf + 1) = v30;
                      v129[0] = v31 | 0x100000000LL;
                      char v130 = 0;
                      char v131 = 0;
                      char v132 = 0;
                      char v133 = 0;
                      v129[1] = 0LL;
                      v129[2] = 0LL;
                      uint64_t v134 = v32;
                      uint64_t v135 = 1LL;
                      __int16 v136 = 0;
                      v138[48] = 0;
                      memset(v138, 0, 25);
                      __int128 v137 = 0u;
                      uint64_t v139 = 0LL;
                      uint64_t v140 = 0LL;
                      int v141 = v33;
                      __int16 v142 = v34;
                      __int16 v143 = v35;

                      -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
                      unsigned __int8 v36 = self->_protobufLogger.__ptr_;
                      if (v36) {
                        sub_10023FACC((uint64_t)v36, (const std::string *)&self->_uniqueIdentifier, (float32x2_t *)&buf);
                      }
                      dataSource = self->_dataSource;
                      if (dataSource)
                      {
                        if (!*((_BYTE *)a3 + 600)) {
                          sub_100006080();
                        }
                        -[NINearbyUpdatesEngineDataSource updateWithSuccessfulRange:uwbRSSI:nbRSSI:]( dataSource,  "updateWithSuccessfulRange:uwbRSSI:nbRSSI:",  *((void *)a3 + 28),  *((void *)a3 + 29),  *((double *)a3 + 44),  *((double *)a3 + 27));
                      }

                      double v38 = *((double *)&buf + 1);
                      double v39 = *(double *)&self->_onlySendKinematicFindeeData;
                      *(void *)&self->_onlySendKinematicFindeeData = *((void *)&buf + 1);
                      double v40 = sub_100023CC4();
                      double v41 = v38 - v39;
                      double v42 = v40 - *(double *)&self->_findingLatencyBookkeeping.receivedFirstMeasurement;
                      *(double *)&self->_findingLatencyBookkeeping.receivedFirstMeasurement = v40;
                      double v43 = v42 - v41;
                      if (self->_cachedMagneticFieldStrength.__engaged_) {
                        self->_findingLatencyBookkeeping.double lastMeasurementTimeSeconds = v43
                      }
                                                                                    + self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds;
                      double v44 = (os_log_s *)qword_1008000A0;
                      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
                      {
                        double lastMeasurementTimeSeconds = self->_findingLatencyBookkeeping.lastMeasurementTimeSeconds;
                        *(_DWORD *)v124 = 134349824;
                        *(double *)&v124[4] = v41;
                        *(_WORD *)&v124[12] = 2050;
                        *(double *)&v124[14] = v42;
                        *(_WORD *)&v124[22] = 1026;
                        int v125 = (int)(v43 * 1000.0);
                        __int16 v126 = 1026;
                        int v127 = (int)(lastMeasurementTimeSeconds * 1000.0);
                        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,Finding range result latency report. measDelta: %{public}0.3f [s]. processDelta: %{p ublic}0.3f [s]. Excess ms: %{public}d. Accumulated excess ms: %{public}d",  v124,  0x22u);
                      }

                      self->_cachedMagneticFieldStrength.__engaged_ = 1;
                      sub_1001A3CF0(0x2B730440u, 1, 1LL, 0LL, 0LL, 0LL);
                      (*(void (**)(int64_t, __int128 *))(*(void *)self->_uniqueIdentifier.var0 + 24LL))( self->_uniqueIdentifier.var0,  &buf);
                      sub_1001A3CF0(0x2B730440u, 2, 1LL, 0LL, 0LL, 0LL);
                      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                          + 32LL))(self->_uniqueIdentifier.var0))
                        -[NINearbyUpdatesEngine provideFindingSolution:](self, "provideFindingSolution:", v10);
                      if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                          + 40LL))(self->_uniqueIdentifier.var0))
                        -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:]( self,  "getPeerDataFromFindingContainerWithToken:",  v11);
                    }

                    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
                    {
                      sub_1003A6000();
                    }
                  }

                  else if (v26)
                  {
                    -[NINearbyUpdatesEngine reportAndLogNearbyObject:](self, "reportAndLogNearbyObject:", v10);
                  }
                }

                return;
              }

              LOWORD(buf) = 0;
              double v14 = "#nrby-eng,#bias-est Not estimating range bias correction for this range result since no TOA V2 CIRs";
            }

            else
            {
              int v13 = (os_log_s *)qword_1008000A0;
              if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_41;
              }
              LOWORD(buf) = 0;
              double v14 = "#nrby-eng,#bias-est received raw rose range measurement without remoteTxAntennaMask, Bypass estimati"
                    "ng bias correction.";
            }
          }

          else
          {
            int v13 = (os_log_s *)qword_1008000A0;
            if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_41;
            }
            LOWORD(buf) = 0;
            double v14 = "#nrby-eng,#bias-est raw_rose_measurement not available, Bypass estimating bias correction.";
          }
        }

        else
        {
          if (!v16) {
            goto LABEL_41;
          }
          LOWORD(buf) = 0;
          double v14 = "#nrby-eng,#bias-est This device type does not require bias estimation";
        }
      }

      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 2u);
      goto LABEL_41;
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A5FD4();
  }

- (void)acceptUnsuccessfulRoseSolution:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003A615C();
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"ForwardUnsuccessfulRangingEvents"]);

  if (v6)
  {
    unsigned int v7 = *((_DWORD *)a3 + 8);
    if (v7 <= 5)
    {
      int v8 = 1 << v7;
      if ((v8 & 0x31) == 0)
      {
        if ((v8 & 0xC) != 0) {
          uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeAndAoASolution:](self, "_handleRangeAndAoASolution:", a3));
        }
        else {
          uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine _handleRangeOnlySolution:](self, "_handleRangeOnlySolution:", a3));
        }
        double v9 = (void *)v10;
        if (v10) {
          -[NINearbyUpdatesEngine reportAndLogNearbyObject:](self, "reportAndLogNearbyObject:", v10);
        }
        goto LABEL_14;
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A6058();
      }
    }

    double v9 = 0LL;
LABEL_14:
  }

  if (self->_uniqueIdentifier.var0)
  {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
    if (*((_BYTE *)a3 + 24))
    {
      if (*((_BYTE *)a3 + 600))
      {
        unsigned int v11 = *((unsigned __int16 *)a3 + 280);
        if (v11 <= 0xFF) {
          sub_1003A6084();
        }
        __int16 v12 = *((_WORD *)a3 + 80);
        uint64_t v20 = *((void *)a3 + 2);
        LOWORD(v21) = v12;
        BYTE2(v21) = v11;
        uint64_t ptr = self->_protobufLogger.__ptr_;
        if (ptr) {
          sub_10023EE48((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)&v20);
        }
        dataSource = self->_dataSource;
        if (dataSource) {
          -[NINearbyUpdatesEngineDataSource updateWithMissedRange](dataSource, "updateWithMissedRange", v20, v21);
        }
        if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 304LL))(self->_uniqueIdentifier.var0))
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
            sub_1003A6130();
          }
          sub_1001A3CF0(0x2B730440u, 1, 0LL, 0LL, 0LL, 0LL);
          (*(void (**)(int64_t, uint64_t *))(*(void *)self->_uniqueIdentifier.var0 + 296LL))( self->_uniqueIdentifier.var0,  &v20);
          sub_1001A3CF0(0x2B730440u, 2, 0LL, 0LL, 0LL, 0LL);
          if ((*(unsigned int (**)(int64_t))(*(void *)self->_uniqueIdentifier.var0 + 312LL))(self->_uniqueIdentifier.var0))
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectFromIdentifier:*((void *)a3 + 5)]);

            if (v16)
            {
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
                sub_1003A6104();
              }
              double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "discoveryToken", v20, v21));
              -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:]( self,  "getPeerDataFromFindingContainerWithToken:",  v17);
            }

            else
            {
              findingPeerToken = self->_findingPeerToken;
              BOOL v19 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG);
              if (findingPeerToken)
              {
                if (v19) {
                  sub_1003A60D8();
                }
                -[NINearbyUpdatesEngine getPeerDataFromFindingContainerWithToken:]( self,  "getPeerDataFromFindingContainerWithToken:",  self->_findingPeerToken,  v20,  v21);
              }

              else if (v19)
              {
                sub_1003A60AC();
              }
            }
          }
        }
      }
    }
  }

- (void)reportAndLogNearbyObject:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
  {
    id v17 = v4;
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    [WeakRetained updatesEngine:self didUpdateNearbyObjects:v6];
  }

  dataSource = self->_dataSource;
  if (dataSource) {
    -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](dataSource, "nearbyObjectUpdated:", v4);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    [v4 timestamp];
    double v10 = v9;
    sub_100230924(v4, (uint64_t)__p);
    unsigned int v11 = 0LL;
    uint64_t v12 = 0LL;
    int v13 = 0LL;
    double v14 = &v11;
    char v15 = 0;
    unsigned int v11 = (char *)operator new(0xA0uLL);
    uint64_t v12 = (uint64_t)v11;
    int v13 = v11 + 160;
    uint64_t v12 = sub_1002AFBEC((uint64_t)&v13, (uint64_t)__p, (uint64_t)&v17, (uint64_t)v11);
    sub_1002395E8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v11, v10);
    double v14 = &v11;
    sub_1002AFD60((void ***)&v14);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
}

- (void)acceptDeviceMotion:(const void *)a3
{
  if (*((_BYTE *)a3 + 16))
  {
    uint64_t v12 = *((void *)a3 + 1);
    __int128 v13 = *(_OWORD *)((char *)a3 + 24);
    uint64_t v14 = *((void *)a3 + 5);
    __int128 v15 = *((_OWORD *)a3 + 3);
    uint64_t v16 = *((void *)a3 + 8);
    __int128 v3 = *(_OWORD *)((char *)a3 + 88);
    __int128 v17 = *(_OWORD *)((char *)a3 + 72);
    __int128 v18 = v3;
    uint64_t v20 = *((void *)a3 + 15);
    __int128 v19 = *(_OWORD *)((char *)a3 + 104);
    __int128 v4 = *(_OWORD *)((char *)a3 + 152);
    uint64_t v22 = *((void *)a3 + 21);
    __int128 v21 = v4;
    p_regionMonitorMap = &self->_regionMonitorMap;
    unint64_t v11 = 0LL;
    if (sub_1002B003C(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, &v11))
    {
      unint64_t v10 = 0LL;
      int v6 = sub_100046FEC(p_regionMonitorMap, &v10);
      if (!v6) {
        goto LABEL_13;
      }
      if (v6[3])
      {
        unint64_t v11 = 0LL;
        unsigned int v7 = sub_100046FEC(p_regionMonitorMap, &v11);
        if (!v7) {
          goto LABEL_13;
        }
        sub_1003142D4((void *)v7[3], (double *)&v12, 0);
      }
    }

    unint64_t v11 = 10LL;
    if (!sub_1002B003C(p_regionMonitorMap, &v11)) {
      return;
    }
    unint64_t v10 = 10LL;
    int v8 = sub_100046FEC(p_regionMonitorMap, &v10);
    if (v8)
    {
      if (!v8[3]) {
        return;
      }
      unint64_t v11 = 10LL;
      double v9 = sub_100046FEC(p_regionMonitorMap, &v11);
      if (v9)
      {
        sub_1003142D4((void *)v9[3], (double *)&v12, 0);
        return;
      }
    }

- (void)acceptMagneticFieldStrength:(double)a3
{
  double v5 = sub_100023CC4();
  int null_state = self->_cachedMagneticFieldStrength.var0.__null_state_;
  *(double *)&self->_rangeBiasEstimatorSingleAntennaModel = v5;
  *(double *)&self->_shouldBypassBiasCorrection = a3;
  if (!null_state) {
    self->_cachedMagneticFieldStrength.var0.__null_state_ = 1;
  }
}

- (void)acceptBluetoothSample:(const void *)a3 coarseEstimation:(BOOL)a4 regionCategory:(int64_t)a5
{
  BOOL v5 = a4;
  v57[0] = a5;
  p_regionMonitorMap = &self->_regionMonitorMap;
  if (sub_1002B003C(&self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_, v57))
  {
    double v9 = sub_100046FEC(p_regionMonitorMap, v57);
    if (!v9) {
      sub_100126B2C("unordered_map::at: key not found");
    }
    if (v9[3])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectFromIdentifier:*((void *)a3 + 9)]);

      if (v11)
      {
        uint64_t ptr = self->_protobufLogger.__ptr_;
        if (ptr) {
          sub_100239C18((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
        }
        id obj = (id)objc_claimAutoreleasedReturnValue([v11 discoveryToken]);
        id v56 = [obj hash];
        v48[0] = &v56;
        __int128 v13 = (id *)sub_1002AFDF4( (uint64_t)&self->_hashToTokenMap,  (unint64_t *)&v56,  (uint64_t)&unk_1004242F8,  v48);
        objc_storeStrong(v13 + 3, obj);
        int v42 = v57[0];
        uint64_t v14 = sub_100046FEC(p_regionMonitorMap, v57);
        if (!v14) {
          sub_100126B2C("unordered_map::at: key not found");
        }
        sub_100314984((uint64_t *)v14[3], v5, v42, (uint64_t *)&v54);
        v53[0] = 0LL;
        v53[1] = 0LL;
        char v52 = v53;
        __int128 v15 = sub_100046FEC(p_regionMonitorMap, v57);
        if (!v15) {
          goto LABEL_44;
        }
        if (sub_1003148A4(v15[3], *((void *)a3 + 9), *((void *)a3 + 10)))
        {
          uint64_t v16 = v54;
          for (unint64_t i = (void *)*v54; ; unint64_t i = v28)
          {
            uint64_t v20 = (void *)v16[1];
            __int128 v18 = v16 + 1;
            __int128 v19 = v20;
            if (v20)
            {
              do
              {
                __int128 v21 = v19;
                __int128 v19 = (void *)v19[1];
              }

              while (v19);
            }

            else
            {
              do
              {
                __int128 v21 = (void *)v18[2];
                BOOL v22 = *v21 == (void)v18;
                __int128 v18 = v21;
              }

              while (v22);
            }

            if (i == v21) {
              break;
            }
            unsigned int v23 = sub_1002A9174();
            int v24 = *((_DWORD *)i + 17);
            double v25 = sub_1001CD82C();
            id v26 = objc_claimAutoreleasedReturnValue(v25);
            sub_1000065CC(v46, (char *)[v26 UTF8String]);
            else {
              std::string __p = *(std::string *)((_BYTE *)a3 + 1);
            }
            sub_1002010B8((uint64_t)v23, v24, (uint64_t)v46, &__p, (uint64_t)v48);
            if (v47 < 0) {
              operator delete(v46[0]);
            }

            sub_1002B0174((uint64_t)&v52, (uint64_t)v48, (uint64_t)v48);
            if (v51 && v50 < 0) {
              operator delete(v49[7]);
            }
            sub_100034A98((uint64_t)v49, v49[1]);
            double v27 = (void *)i[1];
            if (v27)
            {
              do
              {
                double v28 = v27;
                double v27 = (void *)*v27;
              }

              while (v27);
            }

            else
            {
              do
              {
                double v28 = (void *)i[2];
                BOOL v22 = *v28 == (void)i;
                unint64_t i = v28;
              }

              while (!v22);
            }

            uint64_t v16 = v54;
          }
        }

        id v29 = sub_100046FEC(p_regionMonitorMap, v57);
        if (!v29) {
LABEL_44:
        }
          sub_100126B2C("unordered_map::at: key not found");
        uint64_t v30 = v29[3];
        sub_1002B03C8(v44, (uint64_t)&v52);
        double v31 = sub_100023CC4();
        sub_1003143AC(v30, (uint64_t)a3, (uint64_t)v44, v31, 0LL, v5, v42);
        sub_1002B00F0((uint64_t)v44, (void *)v44[1]);
        sub_1002B00F0((uint64_t)&v52, v53[0]);
        uint64_t v32 = v55;
        if (v55)
        {
          p_shared_owners = (unint64_t *)&v55->__shared_owners_;
          do
            unint64_t v34 = __ldaxr(p_shared_owners);
          while (__stlxr(v34 - 1, p_shared_owners));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
      }

      else
      {
        __int16 v35 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_1003A6188((uint64_t)a3 + 72, v35, v36, v37, v38, v39, v40, v41);
        }
      }
    }
  }

- (void)clearStateForToken:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained identifierFromDiscoveryToken:v4];
    if (v8)
    {
      uint64_t v9 = (uint64_t)v7;
      double v10 = sub_100023CC4();
      for (unint64_t i = self->_regionMonitorMap.__table_.__p1_.__value_.__next_; i; unint64_t i = (void *)*i)
      {
        uint64_t v12 = i[3];
        if (v12) {
          sub_100313F34(v12, v9, 0, v10);
        }
      }

      if (self->_protobufLogger.__ptr_)
      {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectFromIdentifier:v9]);
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t ptr = self->_protobufLogger.__ptr_;
          sub_100230924(v13, (uint64_t)__p);
          sub_10023B7F4((uint64_t)ptr, (uint64_t)__p, v10);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
      }
    }
  }
}

- (void)invalidate
{
  if (self->_regionMonitorMap.__table_.__p2_.__value_)
  {
    uint64_t ptr = self->_protobufLogger.__ptr_;
    if (ptr) {
      sub_10023A8D8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier);
    }
    for (unint64_t i = self->_regionMonitorMap.__table_.__p1_.__value_.__next_; i; unint64_t i = (void *)*i)
      sub_1002A93CC(i + 3, 0LL);
    sub_1002B06D0((uint64_t)&self->_hashToTokenMap);
    -[NSMutableDictionary removeAllObjects](self->_regionDict, "removeAllObjects");
    sub_1002B0724((uint64_t)&self->_regionMonitorMap);
  }

  HIDWORD(self->_convStateForObject) = 0;
  if (*(void *)&self->_uniqueIdentifier.__r_.var0)
  {
    BOOL v5 = self->_protobufLogger.__ptr_;
    if (v5) {
      sub_10023F794((uint64_t)v5, (const std::string *)&self->_uniqueIdentifier);
    }
  }

  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    id v7 = self->_protobufLogger.__ptr_;
    if (v7) {
      sub_10023F794((uint64_t)v7, (const std::string *)&self->_uniqueIdentifier);
    }
  }

- (id)_consolidateInputToMLModel:(const void *)a3
{
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#bias-est Consolidating input to bias estimator",  buf,  2u);
  }

  if (!*((_BYTE *)a3 + 600)) {
    sub_100006080();
  }
  if (!*((_BYTE *)a3 + 1312)) {
    sub_1003A61F0();
  }
  double v70 = (char *)a3 + 1208;
  BOOL v5 = (__int16 *)sub_100138E48((uint64_t)a3 + 1208, 0);
  int v6 = objc_alloc(&OBJC_CLASS___Complex);
  double v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)*v5));
  int v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[1]));
  float v68 = -[Complex initWithRealPart:imagPart:](v6, "initWithRealPart:imagPart:", v81);
  v85[0] = v68;
  id v7 = objc_alloc(&OBJC_CLASS___Complex);
  double v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[2]));
  int v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[3]));
  v63 = -[Complex initWithRealPart:imagPart:](v7, "initWithRealPart:imagPart:", v79);
  v85[1] = v63;
  char v8 = objc_alloc(&OBJC_CLASS___Complex);
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[4]));
  unint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[5]));
  double v59 = -[Complex initWithRealPart:imagPart:](v8, "initWithRealPart:imagPart:", v77);
  v85[2] = v59;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___Complex);
  float v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[6]));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[7]));
  unint64_t v55 = -[Complex initWithRealPart:imagPart:](v9, "initWithRealPart:imagPart:", v75);
  v85[3] = v55;
  double v10 = objc_alloc(&OBJC_CLASS___Complex);
  float v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[8]));
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[9]));
  char v51 = -[Complex initWithRealPart:imagPart:](v10, "initWithRealPart:imagPart:", v73);
  v85[4] = v51;
  unint64_t v11 = objc_alloc(&OBJC_CLASS___Complex);
  BOOL v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[10]));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[11]));
  __int128 v13 = -[Complex initWithRealPart:imagPart:](v11, "initWithRealPart:imagPart:", v71, v12);
  v85[5] = v13;
  uint64_t v14 = objc_alloc(&OBJC_CLASS___Complex);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[12]));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[13]));
  __int128 v17 = -[Complex initWithRealPart:imagPart:](v14, "initWithRealPart:imagPart:", v15, v16);
  v85[6] = v17;
  __int128 v18 = objc_alloc(&OBJC_CLASS___Complex);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[14]));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v5[15]));
  __int128 v21 = -[Complex initWithRealPart:imagPart:](v18, "initWithRealPart:imagPart:", v19, v20);
  v85[7] = v21;
  float v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 8LL));

  BOOL v22 = (__int16 *)sub_100138E48((uint64_t)a3 + 1208, 1);
  unsigned int v23 = objc_alloc(&OBJC_CLASS___Complex);
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)*v22));
  float v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[1]));
  unsigned int v64 = -[Complex initWithRealPart:imagPart:](v23, "initWithRealPart:imagPart:", v82);
  v84[0] = v64;
  int v24 = objc_alloc(&OBJC_CLASS___Complex);
  double v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[2]));
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[3]));
  uint64_t v62 = -[Complex initWithRealPart:imagPart:](v24, "initWithRealPart:imagPart:", v80);
  v84[1] = v62;
  double v25 = objc_alloc(&OBJC_CLASS___Complex);
  BOOL v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[4]));
  id v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[5]));
  int v58 = -[Complex initWithRealPart:imagPart:](v25, "initWithRealPart:imagPart:", v78);
  v84[2] = v58;
  id v26 = objc_alloc(&OBJC_CLASS___Complex);
  double v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[6]));
  char v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[7]));
  uint64_t v54 = -[Complex initWithRealPart:imagPart:](v26, "initWithRealPart:imagPart:", v76);
  v84[3] = v54;
  double v27 = objc_alloc(&OBJC_CLASS___Complex);
  float v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[8]));
  id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[9]));
  char v50 = -[Complex initWithRealPart:imagPart:](v27, "initWithRealPart:imagPart:", v74);
  v84[4] = v50;
  double v28 = objc_alloc(&OBJC_CLASS___Complex);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[10]));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[11]));
  uint64_t v30 = -[Complex initWithRealPart:imagPart:](v28, "initWithRealPart:imagPart:", v72, v29);
  v84[5] = v30;
  double v31 = objc_alloc(&OBJC_CLASS___Complex);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[12]));
  int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[13]));
  unint64_t v34 = -[Complex initWithRealPart:imagPart:](v31, "initWithRealPart:imagPart:", v32, v33);
  v84[6] = v34;
  __int16 v35 = objc_alloc(&OBJC_CLASS___Complex);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[14]));
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v22[15]));
  uint64_t v38 = -[Complex initWithRealPart:imagPart:](v35, "initWithRealPart:imagPart:", v36, v37);
  v84[7] = v38;
  float v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 8LL));

  uint64_t v39 = objc_alloc_init(&OBJC_CLASS___BiasEstimatorFeatures);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v40 timeIntervalSince1970];
  double v42 = v41;

  -[BiasEstimatorFeatures setTimestamp:](v39, "setTimestamp:", v42);
  if (!*((_BYTE *)a3 + 24)) {
    __assert_rtn( "-[NINearbyUpdatesEngine _consolidateInputToMLModel:]",  "NIServerNearbyUpdatesEngine.mm",  1835,  "solution.mach_continuous_time_sec.has_value()");
  }
  -[BiasEstimatorFeatures setUwbTime:](v39, "setUwbTime:", *((double *)a3 + 2));
  -[BiasEstimatorFeatures setAntennaMask:](v39, "setAntennaMask:", *((_WORD *)a3 + 215));
  -[BiasEstimatorFeatures setSoiRssiDbm:](v39, "setSoiRssiDbm:", *((double *)a3 + 27));
  -[BiasEstimatorFeatures setRssiDbm:](v39, "setRssiDbm:", *((double *)a3 + 26));
  -[BiasEstimatorFeatures setTofPicSecond:](v39, "setTofPicSecond:", *((double *)a3 + 22));
  LOWORD(v43) = *((_WORD *)a3 + 212);
  -[BiasEstimatorFeatures setToaNoiseRms:](v39, "setToaNoiseRms:", (double)v43);
  LOWORD(v44) = *((_WORD *)a3 + 213);
  -[BiasEstimatorFeatures setToaPpwinRms:](v39, "setToaPpwinRms:", (double)v44);
  LOWORD(v45) = *((_WORD *)a3 + 214);
  -[BiasEstimatorFeatures setToaPpwinPeak:](v39, "setToaPpwinPeak:", (double)v45);
  if (*((_BYTE *)a3 + 440) && *((_BYTE *)a3 + 456) && *((_BYTE *)a3 + 472) && *((_BYTE *)a3 + 488))
  {
    -[BiasEstimatorFeatures setRttInitiator:](v39, "setRttInitiator:", (double)*((unint64_t *)a3 + 54));
    if (!*((_BYTE *)a3 + 456)) {
      sub_100006080();
    }
    -[BiasEstimatorFeatures setTatInitiator:](v39, "setTatInitiator:", (double)*((unint64_t *)a3 + 56));
    if (!*((_BYTE *)a3 + 472)) {
      sub_100006080();
    }
    -[BiasEstimatorFeatures setRttResponder:](v39, "setRttResponder:", (double)*((unint64_t *)a3 + 58));
    if (!*((_BYTE *)a3 + 488)) {
      sub_100006080();
    }
    -[BiasEstimatorFeatures setTatResponder:](v39, "setTatResponder:", (double)*((unint64_t *)a3 + 60));
    -[BiasEstimatorFeatures setCirPacket1:](v39, "setCirPacket1:", v67);
    -[BiasEstimatorFeatures setLeadingEdgePacket1:]( v39,  "setLeadingEdgePacket1:",  (double)sub_100138DF8((uint64_t)v70, 0));
    -[BiasEstimatorFeatures setFirstPathIndexPacket1:]( v39,  "setFirstPathIndexPacket1:",  (double)sub_100138DD0((uint64_t)v70, 0));
    -[BiasEstimatorFeatures setRxAntennaPacket1:](v39, "setRxAntennaPacket1:", sub_100138DA8((uint64_t)v70, 0));
    -[BiasEstimatorFeatures setCirPacket2:](v39, "setCirPacket2:", v69);
    -[BiasEstimatorFeatures setLeadingEdgePacket2:]( v39,  "setLeadingEdgePacket2:",  (double)sub_100138DF8((uint64_t)v70, 1));
    -[BiasEstimatorFeatures setFirstPathIndexPacket2:]( v39,  "setFirstPathIndexPacket2:",  (double)sub_100138DD0((uint64_t)v70, 1));
    -[BiasEstimatorFeatures setRxAntennaPacket2:](v39, "setRxAntennaPacket2:", sub_100138DA8((uint64_t)v70, 1));
    uint64_t v46 = v39;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A6240();
    }
    uint64_t v46 = 0LL;
  }

  return v46;
}

- (id)_handleRangeAndAoASolution:(const void *)a3
{
  if (!*((_BYTE *)a3 + 752)) {
    sub_1003A626C();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectFromIdentifier:*((void *)a3 + 5)]);

  if (v6)
  {
    -[NINearbyUpdatesEngine _convertFromPointingCoordinatesToSpatial:]( self,  "_convertFromPointingCoordinatesToSpatial:",  (char *)a3 + 608);
    float v15 = *(float *)&v7;
    float v16 = v8;
    int rangeMeasSourcePref = self->_rangeMeasSourcePref;
    if (rangeMeasSourcePref)
    {
      if (rangeMeasSourcePref != 1) {
        goto LABEL_12;
      }
      if (!*((_BYTE *)a3 + 600))
      {
        *(float *)&double v7 = NINearbyObjectDistanceNotAvailable;
        goto LABEL_11;
      }

      double v7 = *((double *)a3 + 44);
    }

    else
    {
      double v7 = *((double *)a3 + 81);
    }

    *(float *)&double v7 = v7;
LABEL_11:
    [v6 setDistance:v7];
LABEL_12:
    [v6 setDirection:sub_100035338(&v15)];
    [v6 setDistanceMeasurementQuality:1];
    objc_msgSend(v6, "setQuaternion:", sub_10003528C(v15, v16));
    *(float *)&double v11 = v15;
    [v6 setAzimuth:v11];
    *(float *)&double v12 = v16;
    [v6 setElevation:v12];
    if (*((_BYTE *)a3 + 600))
    {
      [v6 setSignalStrength:*((double *)a3 + 27)];
    }

    id v13 = v6;
    goto LABEL_16;
  }

  double v10 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#warning _handleRangeAndAoASolution failed to convert identifier to object.",  buf,  2u);
  }

- (id)_handleRangeOnlySolution:(const void *)a3
{
  if (!*((_BYTE *)a3 + 600)) {
    sub_1003A6294();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectFromIdentifier:*((void *)a3 + 5)]);

  if (v6)
  {
    if (!*((_BYTE *)a3 + 600)) {
      sub_100006080();
    }
    if (self->_rangeMeasSourcePref < 2u)
    {
      double v7 = *((double *)a3 + 44);
      *(float *)&double v7 = v7;
      [v6 setDistance:v7];
    }

    [v6 setDirection:*(double *)NINearbyObjectDirectionNotAvailable.i64];
    [v6 setDistanceMeasurementQuality:1];
    [v6 setSignalStrength:*((double *)a3 + 27)];
    if (*((unsigned __int16 *)a3 + 248) >= 0x100u && *((unsigned __int16 *)a3 + 249) >= 0x100u)
    {
      [v6 setNbRxStatus:*((_WORD *)a3 + 248)];
      [v6 setMmsRxStatus:*((_WORD *)a3 + 249)];
    }

    if (*((_BYTE *)a3 + 232)) {
      [v6 setNbRssi:*((double *)a3 + 28)];
    }
    id v8 = v6;
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A62BC();
  }

  return v6;
}

- (double)_getRangeUncertaintyWhenBiasEstimateNotAvailable
{
  return 0.5;
}

- (BOOL)_shouldConsumeRoseSolution:(const void *)a3
{
  if (*((_BYTE *)a3 + 600))
  {
    __int128 v4 = *((_OWORD *)a3 + 6);
    __int128 v16 = *((_OWORD *)a3 + 5);
    __int128 v17 = v4;
    __int128 v5 = *((_OWORD *)a3 + 4);
    __int128 v14 = *((_OWORD *)a3 + 3);
    __int128 v15 = v5;
    int v6 = (const void *)*((void *)a3 + 15);
    uint64_t v18 = *((void *)a3 + 14);
    __int128 v19 = 0LL;
    uint64_t v7 = *((void *)a3 + 16);
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    sub_10011B560(&v19, v6, v7, (v7 - (uint64_t)v6) >> 3);
    __int128 v8 = *((_OWORD *)a3 + 10);
    __int128 v22 = *((_OWORD *)a3 + 9);
    __int128 v23 = v8;
    uint64_t v9 = (const void *)*((void *)a3 + 23);
    uint64_t v24 = *((void *)a3 + 22);
    std::string __p = 0LL;
    id v26 = 0LL;
    uint64_t v27 = 0LL;
    sub_10011B618( &__p,  v9,  *((void *)a3 + 24),  0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(*((void *)a3 + 24) - (void)v9) >> 3));
    memcpy(v28, (char *)a3 + 208, 0x181uLL);
    if (v28[153] > 0xFFu)
    {
      if (LOBYTE(v28[153]) <= 2u)
      {
        double v11 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          if (v28[153] <= 0xFFu) {
            sub_100006080();
          }
          v13[0] = 67109120;
          v13[1] = LOBYTE(v28[153]);
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,mmsValStatus %d does not pass check, rejecting range result event",  (uint8_t *)v13,  8u);
        }

        BOOL v10 = 0;
        goto LABEL_14;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
    {
      sub_1003A6314();
    }

    BOOL v10 = 1;
LABEL_14:
    if (__p)
    {
      id v26 = __p;
      operator delete(__p);
    }

    if (v19)
    {
      uint64_t v20 = v19;
      operator delete(v19);
    }

    return v10;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003A62E8();
  }
  return 0;
}

- (void)_handleRegionChangeForDevice:(unint64_t)a3 currentRegion:(optional<nearby::algorithms::region_monitoring::Region> *)a4 prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:
{
  unsigned int v41 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  double v11 = v8;
  uint64_t v12 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (WeakRetained)
  {
    uint64_t v39 = v9;
    if (LOBYTE(a4->var3))
    {
      data = a4;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", data));
      if (!LOBYTE(a4->var3)) {
        sub_100006080();
      }
      __int128 v17 = -[NIRegionKey initWithName:regionSizeCategory:]( objc_alloc(&OBJC_CLASS___NIRegionKey),  "initWithName:regionSizeCategory:",  v16,  *(int *)&a4->var0.var1.var0.__r_.var1);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_regionDict, "objectForKey:", v17));
      if (!v18 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003A63A0();
      }
    }

    else
    {
      uint64_t v18 = 0LL;
    }

    if (*(_BYTE *)(v12 + 48))
    {
      uint64_t v20 = v12;
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v20));
      if (!*(_BYTE *)(v12 + 48)) {
        sub_100006080();
      }
      __int128 v22 = -[NIRegionKey initWithName:regionSizeCategory:]( objc_alloc(&OBJC_CLASS___NIRegionKey),  "initWithName:regionSizeCategory:",  v21,  *(int *)(v12 + 28));
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_regionDict, "objectForKey:", v22));
      if (!v23 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003A63A0();
      }
    }

    else
    {
      __int128 v23 = 0LL;
    }

    if ((v39 & 0xFF00000000LL) != 0) {
      std::to_string(&v48, *(float *)&v39);
    }
    else {
      sub_1000065CC(&v48, "N/A");
    }
    if ((v41 & 1) == 0)
    {
      sub_1000065CC(&__p, "NONE");
      sub_1000065CC(&v47, "NONE");
      if (*(_BYTE *)(v10 + 184))
      {
        sub_1002AAEF8((std::stringbuf::string_type *)&buf, *(float *)(v10 + 16));
        __rep __p = buf;
        if (!*(_BYTE *)(v10 + 184)) {
          sub_100006080();
        }
        if (*(_BYTE *)(v10 + 72))
        {
          sub_1002AAEF8((std::stringbuf::string_type *)&buf, *(double *)(v10 + 64));
          __rep v47 = buf;
        }
      }

      uint64_t v24 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = v23;
        p_uniqueIdentifier = &self->_uniqueIdentifier;
        int v37 = *(unsigned __int8 *)(v12 + 48);
        if (*(_BYTE *)(v12 + 48))
        {
          sub_1002E1104(v12, &v46);
          if ((v46.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            id v26 = &v46;
          }
          else {
            id v26 = (std::stringbuf::string_type *)v46.__r_.__value_.__r.__words[0];
          }
        }

        else
        {
          id v26 = (std::stringbuf::string_type *)"NONE";
        }

        if (LOBYTE(a4->var3))
        {
          sub_1002E1104((uint64_t)a4, &v45);
          if ((v45.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            uint64_t v27 = &v45;
          }
          else {
            uint64_t v27 = (std::stringbuf::string_type *)v45.__r_.__value_.__r.__words[0];
          }
          double v28 = &v48;
          if ((v48.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            double v28 = (std::string *)v48.__r_.__value_.__r.__words[0];
          }
          p_p = &__p;
          uint64_t v30 = &v47;
          *(_DWORD *)buf.var0.var0.__data_ = 136316674;
          *(char **)((char *)&buf.var0.var1.__data_ + 4) = (char *)p_uniqueIdentifier;
          WORD2(buf.var0.var1.__size_) = 2048;
          *(unint64_t *)((char *)&buf.var0.var1.__size_ + 6) = a3;
          *((_WORD *)&buf.var0.var1 + 11) = 2080;
          char v50 = v26;
          __int16 v51 = 2080;
          char v52 = (const char *)v27;
          __int16 v53 = 2080;
          uint64_t v54 = v28;
          __int16 v55 = 2080;
          id v56 = p_p;
          __int16 v57 = 2080;
          int v58 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor #region change ses_id: %s dev: 0x%llx from %s -> %s, intent score: %s, r ange_m: %s, rssi_dbm: %s",  (uint8_t *)&buf,  0x48u);
        }

        else
        {
          double v31 = &v48;
          if ((v48.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            double v31 = (std::string *)v48.__r_.__value_.__r.__words[0];
          }
          uint64_t v32 = &__p;
          int v33 = &v47;
          *(_DWORD *)buf.var0.var0.__data_ = 136316674;
          *(char **)((char *)&buf.var0.var1.__data_ + 4) = (char *)p_uniqueIdentifier;
          WORD2(buf.var0.var1.__size_) = 2048;
          *(unint64_t *)((char *)&buf.var0.var1.__size_ + 6) = a3;
          *((_WORD *)&buf.var0.var1 + 11) = 2080;
          char v50 = v26;
          __int16 v51 = 2080;
          char v52 = "NONE";
          __int16 v53 = 2080;
          uint64_t v54 = v31;
          __int16 v55 = 2080;
          id v56 = v32;
          __int16 v57 = 2080;
          int v58 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#spatialGesturesPredictor #region change ses_id: %s dev: 0x%llx from %s -> %s, intent score: %s, r ange_m: %s, rssi_dbm: %s",  (uint8_t *)&buf,  0x48u);
        }

        __int128 v23 = v38;
      }
    }

    if (*(_BYTE *)(v10 + 184)) {
      uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromRangeResult:](self, "nearbyObjectFromRangeResult:", v10));
    }
    else {
      uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromDeviceIdentifier:](self, "nearbyObjectFromDeviceIdentifier:", a3));
    }
    __int16 v35 = (void *)v34;
    if (v18) {
      -[NINearbyUpdatesEngine _fillNearbyObject:fromRegionSizeCategory:]( self,  "_fillNearbyObject:fromRegionSizeCategory:",  v34,  [v18 regionSizeCategory]);
    }
    if (v35)
    {
      if ((objc_opt_respondsToSelector( WeakRetained,  "updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:") & 1) != 0) {
        [WeakRetained updatesEngine:self object:v35 didUpdateRegion:v18 previousRegion:v23 regionTransitionSuppressed:v41];
      }
      if (self->_protobufLogger.__ptr_)
      {
        sub_100230924(v35, (uint64_t)&buf);
        uint64_t ptr = self->_protobufLogger.__ptr_;
        if (*((char *)&self->_uniqueIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
          sub_1000063A8( &__p,  self->_uniqueIdentifier.__r_.__value_.var0.var1.__data_,  self->_uniqueIdentifier.__r_.__value_.var0.var1.__size_);
        }
        else {
          __rep __p = self->_uniqueIdentifier.__r_.__value_;
        }
        char v44 = 1;
        sub_10023B4D4( (uint64_t)ptr,  (const std::string *)&__p,  (uint64_t)&buf,  (std::string *)a4,  (std::string *)v12,  v39,  v41,  v11);
        if (buf.var0.var1.__data_)
        {
          buf.var0.var1.__size_ = (unint64_t)buf.var0.var1.__data_;
          operator delete(buf.var0.var1.__data_);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003A6340();
    }
  }

  else
  {
    __int128 v19 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf.var0.var0.__data_ = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions, no delegate.",  (uint8_t *)&buf,  2u);
    }
  }
}

- (void)_handleBoundedRegionRange:(double)a3 forDevice:(unint64_t)a4 rangeResult:(optional<nearby::algorithms::common::RangeResult> *)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (!a5->var1) {
    sub_100006080();
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromRangeResult:](self, "nearbyObjectFromRangeResult:", a5));
  uint64_t v10 = v9;
  if (v9)
  {
    if (a5->var0.var1.var15.__engaged_)
    {
      double val = a5->var0.var1.var15.var0.__val_;
      *(float *)&double val = val;
      [v9 setBoundedRegionRange:val];
    }

    if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
    {
      __int128 v14 = v10;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      [WeakRetained updatesEngine:self didUpdateNearbyObjects:v12];
    }

    if (self->_protobufLogger.__ptr_)
    {
      if (a5->var0.var1.var15.__engaged_)
      {
        sub_100230924(v10, (uint64_t)__p);
        sub_10023B2B8( (uint64_t)self->_protobufLogger.__ptr_,  (const std::string *)&self->_uniqueIdentifier,  (uint64_t)__p,  a3);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A6340();
  }
}

- (void)_handleDeviceMonitorActivation:(BOOL)a3 forDevice:(unint64_t)a4 timestamp:(double)a5 regionSizeCategory:(int)a6 regions:(optional<std:(int)a8 :vector<nearby::algorithms::region_monitoring::Region>> *)a7 predictorType:
{
  BOOL v13 = a3;
  __int128 v15 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003A6428(v13, a4, v15);
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    if (v13)
    {
      if (!a7->var1) {
        sub_1003A6400();
      }
      sub_10023AA8C((uint64_t)ptr, a4, a6, (std::string **)a7, a8, a5);
    }

    else
    {
      sub_10023AD34((uint64_t)ptr, a4);
    }
  }

- (void)processUWBResultForRegionMonitoring:(id)a3 roseSolution:(const void *)a4 processingOptions:(const AlgorithmProcessingOptions *)a5
{
  id v9 = a3;
  uint64_t v10 = v9;
  if (!*((_BYTE *)a4 + 24)) {
    __assert_rtn( "-[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:]",  "NIServerNearbyUpdatesEngine.mm",  2175,  "solution.mach_continuous_time_sec.has_value()");
  }
  double v11 = *((double *)a4 + 2);
  [v9 distance];
  if (v12 != NINearbyObjectDistanceNotAvailable)
  {
    [v10 azimuth];
    unsigned int v13 = 0;
    if (v14 == *(float *)&NINearbyObjectAzimuthNotAvailable
      || ([v10 elevation], v15 == *(float *)&NINearbyObjectElevationNotAvailable))
    {
      uint64_t v18 = 0LL;
    }

    else
    {
      [v10 azimuth];
      unsigned int v13 = v16;
      [v10 elevation];
      unsigned int v5 = v17;
      uint64_t v18 = 0x100000001LL;
    }

    id v56 = (void *)objc_claimAutoreleasedReturnValue([v10 discoveryToken]);
    id v55 = [v56 hash];
    if (self->_protobufLogger.__ptr_)
    {
      sub_100230924(v10, (uint64_t)__p);
      sub_10023AEBC( (uint64_t)self->_protobufLogger.__ptr_,  *((unsigned __int16 *)a4 + 18),  *((void *)a4 + 5),  (uint64_t)__p,  (char)[v10 requiresBiasCorrection],  v11);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

    unsigned int v19 = [v10 remoteTxAntennaMask];
    else {
      unsigned __int16 v20 = (unsigned __int16)[v10 remoteTxAntennaMask];
    }
    int convStateForObject_high = HIDWORD(self->_convStateForObject);
    uint64_t v53 = v18;
    switch(convStateForObject_high)
    {
      case 1:
      case 2:
        break;
      case 3:
        else {
          int convStateForObject_high = 3;
        }
        break;
      case 4:
        __assert_rtn( "-[NINearbyUpdatesEngine processUWBResultForRegionMonitoring:roseSolution:processingOptions:]",  "NIServerNearbyUpdatesEngine.mm",  2244,  "false");
      default:
        int convStateForObject_high = 0;
        break;
    }

    unsigned int magneticFieldStrengthCheckOption = a5->magneticFieldStrengthCheckOption;
    uint64_t v23 = 0LL;
    if (magneticFieldStrengthCheckOption == 1)
    {
      unsigned int v24 = 0;
    }

    else
    {
      if (self->_cachedMagneticFieldStrength.var0.__null_state_)
      {
        rangeBiasEstimatorSingleAntennaModel = self->_rangeBiasEstimatorSingleAntennaModel;
        if (vabdd_f64(*(double *)&rangeBiasEstimatorSingleAntennaModel, v11) < 0.07)
        {
          unsigned int v24 = magneticFieldStrengthCheckOption >> 8;
          uint64_t v23 = *(void *)&self->_shouldBypassBiasCorrection;
LABEL_25:
          p_regionSizeCategory = &a5->regionSizeCategory;
          if (sub_1002B003C( &self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)p_regionSizeCategory))
          {
            uint64_t v27 = sub_100046FEC( &self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)p_regionSizeCategory);
            if (!v27) {
              sub_100126B2C("unordered_map::at: key not found");
            }
            if (v27[3])
            {
              double v28 = sub_100046FEC( &self->_regionMonitorMap.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)p_regionSizeCategory);
              if (!v28) {
                sub_100126B2C("unordered_map::at: key not found");
              }
              std::string::size_type v29 = v28[3];
              [v10 distance];
              int v31 = v30;
              [v10 signalStrength];
              uint64_t v33 = v32;
              [v10 rangeBiasEstimate];
              if (v34 == *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable)
              {
                uint64_t v35 = 0LL;
                uint64_t v36 = 0LL;
              }

              else
              {
                [v10 rangeBiasEstimate];
                uint64_t v36 = v37;
                uint64_t v35 = 1LL;
              }

              objc_msgSend(v10, "rangeUncertainty", v53);
              if (v38 == *(double *)&NINearbyObjectRangeUncertaintyNotAvailable)
              {
                uint64_t v39 = 0LL;
                uint64_t v40 = 0LL;
              }

              else
              {
                [v10 rangeUncertainty];
                uint64_t v39 = 1LL;
              }

              unint64_t v41 = *p_regionSizeCategory;
              *(void *)__rep buf = v55;
              int v42 = magneticFieldStrengthCheckOption | (v24 << 8);
              *(double *)uint64_t v62 = v11;
              BOOL v43 = v42 == 1;
              BOOL v44 = v42 != 1;
              *(_DWORD *)&v62[8] = v31;
              if (v43) {
                char v45 = 0;
              }
              else {
                char v45 = magneticFieldStrengthCheckOption;
              }
              *(_DWORD *)v63 = 1;
              *(void *)&v63[4] = v13 | ((unint64_t)v5 << 32);
              *(void *)&v63[12] = v54;
              char v64 = 0;
              char v65 = 0;
              char v66 = 0;
              char v67 = 0;
              uint64_t v68 = v33;
              uint64_t v69 = 1LL;
              __int16 v70 = v20 | 0x100;
              uint64_t v71 = v36;
              uint64_t v72 = v35;
              uint64_t v73 = v40;
              uint64_t v74 = v39;
              int v75 = v41;
              int v76 = convStateForObject_high;
              char v77 = v45;
              __int16 v78 = v24;
              char v79 = BYTE2(v24);
              double v80 = rangeBiasEstimatorSingleAntennaModel;
              uint64_t v81 = v23;
              BOOL v82 = v44;
              uint64_t v83 = 0LL;
              uint64_t v84 = 0LL;
              uint64_t v85 = 0LL;
              sub_100314074(v29, (uint64_t)buf, 0LL, (uint64_t)__p);
              if (v59)
              {
                *(float *)&double v46 = v58;
                [v10 setDistance:v46];
                [v10 setDistanceMeasurementQuality:1];
                [v10 setMotionState:0];
                [v10 setTimestamp:v11];
                __rep v47 = (os_log_s *)(id)qword_1008000A0;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  if (!v59) {
                    sub_100006080();
                  }
                  int v48 = *((unsigned __int16 *)a4 + 18);
                  unint64_t v49 = 0xBFF0000000000000LL;
                  if (*((_BYTE *)a4 + 24)) {
                    unint64_t v49 = *((void *)a4 + 2);
                  }
                  *(_DWORD *)__rep buf = 67109888;
                  *(_DWORD *)&uint8_t buf[4] = v48;
                  *(_WORD *)uint64_t v62 = 2048;
                  *(void *)&v62[2] = v49;
                  *(_WORD *)&v62[10] = 2048;
                  *(void *)v63 = v55;
                  *(_WORD *)&v63[8] = 2048;
                  *(double *)&v63[10] = v58;
                  _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#regions filtered solution. {'ticket id': %d, 'cont time s': %0.3f, 'identifier': %llx, 'range_m': %0.2f}",  buf,  0x26u);
                }

                if (self->_protobufLogger.__ptr_)
                {
                  sub_100230924(v10, (uint64_t)buf);
                  sub_10023B0C0( (uint64_t)self->_protobufLogger.__ptr_,  *((unsigned __int16 *)a4 + 18),  *((void *)a4 + 5),  (uint64_t)buf,  v11);
                  if (*(void *)buf)
                  {
                    *(void *)uint64_t v62 = *(void *)buf;
                    operator delete(*(void **)buf);
                  }
                }

                if (v10)
                {
                  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
                  if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
                  {
                    uint64_t v60 = v10;
                    __int16 v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v60,  1LL));
                    [WeakRetained updatesEngine:self didUpdateNearbyObjects:v51];
                  }

                  dataSource = self->_dataSource;
                  if (dataSource) {
                    -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](dataSource, "nearbyObjectUpdated:", v10);
                  }
                }
              }
            }
          }

          goto LABEL_54;
        }
      }

      unsigned int v24 = 0;
      LOBYTE(magneticFieldStrengthCheckOption) = 1;
    }

    rangeBiasEstimatorSingleAntennaModel = 0LL;
    goto LABEL_25;
  }

- (void)acceptWiFiRangeResults:(const void *)a3
{
}

- (void)_handleWiFiRangeResults:(const void *)a3
{
  __int128 v3 = *(uint64_t **)a3;
  uint64_t v33 = (uint64_t *)*((void *)a3 + 1);
  if (*(uint64_t **)a3 != v33)
  {
    p_previousNIObjectUpdate = &self->_previousNIObjectUpdate;
    p_regionMonitorMap = &self->_regionMonitorMap;
    p_hashToTokenMap = &self->_hashToTokenMap;
    location = (id *)&self->_configuration;
    while (1)
    {
      uint64_t v7 = v3[3];
      if (v3[4] != v7) {
        break;
      }
LABEL_37:
      v3 += 7;
      if (v3 == v33) {
        return;
      }
    }

    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    while (1)
    {
      uint64_t v10 = v7 + v8;
      int v11 = *(_DWORD *)v10;
      double v12 = sub_100023BEC(*(void *)(v10 + 16));
      id WeakRetained = objc_loadWeakRetained((id *)p_previousNIObjectUpdate);
      float v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectFromIdentifier:*v3]);

      if (!v14)
      {
        int v30 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = *v3;
          *(_DWORD *)__rep buf = 134217984;
          *(void *)&uint8_t buf[4] = v31;
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "#nrby-eng,_handleWiFiRangeResult failed to create object from address 0x%llx ",  buf,  0xCu);
        }

        goto LABEL_36;
      }

      double v15 = (double)v11 * 0.0149896229;
      float v16 = v15;
      *(float *)&double v15 = v16;
      [v14 setDistance:v15];
      [v14 setDirection:*(double *)NINearbyObjectDirectionNotAvailable.i64];
      [v14 setDistanceMeasurementQuality:2];
      uint64_t ptr = self->_protobufLogger.__ptr_;
      if (ptr) {
        sub_100239A7C( (uint64_t)ptr,  *v3,  *(unsigned __int8 *)(v3[3] + v8 + 8),  *(unsigned __int8 *)(v3[3] + v8 + 9),  v3[1],  v16,  v12);
      }
      *(void *)__rep buf = 0LL;
      v36[0] = 0LL;
      uint64_t v18 = sub_100046FEC(p_regionMonitorMap, v36);
      if (!v18) {
        sub_100126B2C("unordered_map::at: key not found");
      }
      if (!v18[3])
      {
LABEL_39:

        return;
      }

      *(void *)__rep buf = 0LL;
      unsigned int v19 = sub_100046FEC(p_regionMonitorMap, (unint64_t *)buf);
      if (!v19) {
        sub_100126B2C("unordered_map::at: key not found");
      }
      if (v19[3])
      {
        id v20 = (id)objc_claimAutoreleasedReturnValue([v14 discoveryToken]);
        id v53 = [v20 hash];
        *(void *)__rep buf = &v53;
        uint64_t v21 = (id *)sub_1002AFDF4( (uint64_t)p_hashToTokenMap,  (unint64_t *)&v53,  (uint64_t)&unk_1004242F8,  (void **)buf);
        objc_storeStrong(v21 + 3, v20);
        v36[0] = (unint64_t)[v20 hash];
        *(double *)&v36[1] = v12;
        float v37 = v16;
        int v38 = 2;
        char v41 = 0;
        char v42 = 0;
        char v43 = 0;
        char v44 = 0;
        v49[48] = 0;
        uint64_t v39 = 0LL;
        uint64_t v40 = 0LL;
        uint64_t v45 = 0LL;
        uint64_t v46 = 0LL;
        __int16 v47 = 0;
        __int128 v48 = 0u;
        memset(v49, 0, 25);
        uint64_t v50 = 0LL;
        uint64_t v51 = 0LL;
        uint64_t v52 = 0LL;
        uint64_t v23 = v3[3];
        uint64_t v22 = v3[4];
        *(void *)__rep __p = 0LL;
        unsigned int v24 = sub_100046FEC(p_regionMonitorMap, (unint64_t *)__p);
        if (!v24) {
          sub_100126B2C("unordered_map::at: key not found");
        }
        sub_100314074(v24[3], (uint64_t)v36, v9 == 0xAAAAAAAAAAAAAAABLL * ((v22 - v23) >> 3) - 1, (uint64_t)buf);
        if (!v65)
        {
          uint64_t v32 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__rep __p = 134217984;
            *(double *)&__p[4] = v37;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#wifi_regions: measurement processed but no filtered solution returned, Distance: %f m",  __p,  0xCu);
          }

          goto LABEL_35;
        }

        *(float *)&double v25 = v63;
        [v14 setDistance:v25];
        if (!v65) {
          sub_100006080();
        }
        if (v64 > 1.0 && v64 != -1.0) {
          objc_msgSend(v14, "setDistanceMeasurementQuality:", 3, v64);
        }
        if (self->_protobufLogger.__ptr_)
        {
          sub_100230924(v14, (uint64_t)__p);
          sub_10023B0C0((uint64_t)self->_protobufLogger.__ptr_, v3[1], *v3, (uint64_t)__p, v12);
          if (*(void *)__p)
          {
            *(void *)&__p[8] = *(void *)__p;
            operator delete(*(void **)__p);
          }
        }

        id v26 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          if (!v65) {
            sub_100006080();
          }
          uint64_t v27 = v3[1];
          *(_DWORD *)__rep __p = 134219008;
          *(void *)&__p[4] = v27;
          *(_WORD *)&__p[12] = 2048;
          *(double *)&__p[14] = v12;
          __int16 v56 = 2048;
          unint64_t v57 = (unint64_t)v53;
          __int16 v58 = 2048;
          double v59 = v63;
          __int16 v60 = 2048;
          double v61 = v64;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#wifi_regions: filtered solution. {'ticket id': %llu, 'cont time s': %0.3f, 'identifier': %llx, 'r ange_m': %0.2f, 'uncertainty: %0.2f}",  __p,  0x34u);
        }

        [v14 setMotionState:0];
      }

      id v20 = objc_loadWeakRetained(location);
      if ((objc_opt_respondsToSelector(v20, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
      {
        uint64_t v54 = v14;
        double v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
        [v20 updatesEngine:self didUpdateNearbyObjects:v28];
      }

      dataSource = self->_dataSource;
      if (dataSource) {
        -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](dataSource, "nearbyObjectUpdated:", v14);
      }
LABEL_35:

LABEL_36:
      ++v9;
      uint64_t v7 = v3[3];
      v8 += 24LL;
      if (0xAAAAAAAAAAAAAAABLL * ((v3[4] - v7) >> 3) <= v9) {
        goto LABEL_37;
      }
    }
  }

- (void)acceptVisionInput:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  uint64_t v6 = v5;
  [v4 devicePose];
  __int128 v32 = v8;
  __int128 v33 = v7;
  __int128 v30 = v10;
  __int128 v31 = v9;
  id v11 = [v4 trackingState];
  if (v11 == (id)2) {
    int v12 = 2;
  }
  else {
    int v12 = v11 == (id)1;
  }
  *(void *)&__int128 v45 = v6;
  __int128 v46 = v33;
  __int128 v47 = v32;
  __int128 v48 = v31;
  __int128 v49 = v30;
  LODWORD(v50) = v12;
  BYTE4(v50) = [v4 majorRelocalization];
  BYTE5(v50) = [v4 minorRelocalization];
  BYTE8(v50) = 0;
  LOBYTE(v51) = 0;
  BYTE8(v51) = 0;
  BYTE12(v51) = 0;
  LOBYTE(v52) = 0;
  BYTE4(v52) = 0;
  [v4 lightEstimate];
  if (v13 != *(double *)&NIARLightEstimateNotAvailable)
  {
    [v4 lightEstimate];
    *((void *)&v50 + 1) = v14;
    LOBYTE(v51) = 1;
  }

  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023CD40((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)&v45);
  }
  dataSource = self->_dataSource;
  if (dataSource) {
    -[NINearbyUpdatesEngineDataSource updateWithPose:](dataSource, "updateWithPose:", &v45);
  }
  uint64_t v17 = *(void *)&self->_uniqueIdentifier.__r_.var0;
  if (!v17) {
    goto LABEL_27;
  }
  sub_1002C6058(v17, (uint64_t)&v45);
  unsigned int v19 = self->_dataSource;
  if (v19)
  {
    v44[4] = v49;
    v44[5] = v50;
    v44[6] = v51;
    v44[7] = v52;
    v44[0] = v45;
    v44[1] = v46;
    v44[2] = v47;
    uint64_t v44[3] = v48;
    -[NINearbyUpdatesEngineDataSource updateWithVIOPose:](v19, "updateWithVIOPose:", v44);
  }

  sub_1002C80DC(*(void *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)__src, v18);
  id v20 = self->_dataSource;
  if (v20)
  {
    memcpy(__dst, __src, sizeof(__dst));
    -[NINearbyUpdatesEngineDataSource updateWithSASolution:](v20, "updateWithSASolution:", __dst);
  }

  if (!LOBYTE(__src[24])) {
    goto LABEL_27;
  }
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:](self, "nearbyObjectFromSolution:", __src));
  if (v21)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
    if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
    {
      char v41 = v21;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
      [WeakRetained updatesEngine:self didUpdateNearbyObjects:v23];
    }

    unsigned int v24 = self->_dataSource;
    if (v24) {
      -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](v24, "nearbyObjectUpdated:", v21);
    }
    double v25 = self->_protobufLogger.__ptr_;
    if (v25)
    {
      [v21 timestamp];
      double v27 = v26;
      sub_100230924(v21, (uint64_t)__p);
      double v34 = 0LL;
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
      float v37 = &v34;
      char v38 = 0;
      double v34 = (char *)operator new(0xA0uLL);
      uint64_t v35 = (uint64_t)v34;
      uint64_t v36 = v34 + 160;
      uint64_t v35 = sub_1002AFBEC((uint64_t)&v36, (uint64_t)__p, (uint64_t)&v40, (uint64_t)v34);
      sub_1002395E8((uint64_t)v25, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)&v34, v27);
      float v37 = &v34;
      sub_1002AFD60((void ***)&v37);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

LABEL_27:
    int64_t var0 = self->_uniqueIdentifier.var0;
    if (var0)
    {
      if ((*(unsigned int (**)(int64_t))(*(void *)var0 + 56LL))(var0))
      {
        (*(void (**)(int64_t, __int128 *))(*(void *)self->_uniqueIdentifier.var0 + 48LL))( self->_uniqueIdentifier.var0,  &v45);
      }
    }

    goto LABEL_35;
  }

  std::string::size_type v29 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    if (!LOBYTE(__src[24])) {
      sub_100006080();
    }
    sub_1003A64B8(&__src[1], (uint64_t)__p, v29);
  }

LABEL_35:
}

- (void)processUWBResultForSyntheticAperture:(id)a3 roseSolution:(const void *)a4
{
  id v7 = a3;
  if (!*(void *)&self->_uniqueIdentifier.__r_.var0) {
    __assert_rtn( "-[NINearbyUpdatesEngine processUWBResultForSyntheticAperture:roseSolution:]",  "NIServerNearbyUpdatesEngine.mm",  2620,  "_syntheticApertureFilter != nullptr");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
  if (*((_BYTE *)a4 + 24))
  {
    unsigned int v9 = *((_DWORD *)a4 + 8);
    BOOL v10 = v9 > 5;
    int v11 = (1 << v9) & 0x25;
    if (v10 || v11 == 0)
    {
      if (*((_BYTE *)a4 + 752))
      {
        sub_100387A84(__src);
        uint64_t v21 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          if (!*((_BYTE *)a4 + 600) || !*((_BYTE *)a4 + 24)) {
            sub_100006080();
          }
          uint64_t v52 = *((void *)a4 + 44);
          uint64_t v53 = *((void *)a4 + 2);
          p_uniqueIdentifier = &self->_uniqueIdentifier;
          *(_DWORD *)uint64_t v68 = 134219010;
          *(void *)&v68[4] = v52;
          *(_WORD *)&v68[12] = 2048;
          *(void *)&v68[14] = v53;
          *(_WORD *)&v68[22] = 2048;
          *(void *)&v68[24] = __src[7];
          *(_WORD *)uint64_t v69 = 2048;
          *(void *)&v69[2] = __src[6];
          *(_WORD *)&v69[10] = 2080;
          *(void *)&v69[12] = p_uniqueIdentifier;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "#nrby-eng,#sa_algo,New measurement with distance %4.3f m, timestamp %f, az %4.1f deg, and el %4.1f deg. Uniq ue identifier: %s",  v68,  0x34u);
        }

        float v22 = sub_100026A04(*(double *)&__src[7]);
        float v4 = sub_100026A04(*(double *)&__src[6]);
        sub_100034A98((uint64_t)&__src[2], (void *)__src[3]);
        uint64_t v23 = 0x100000001LL;
      }

      else
      {
        unsigned int v24 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          if (!*((_BYTE *)a4 + 600) || !*((_BYTE *)a4 + 24)) {
            sub_100006080();
          }
          uint64_t v55 = *((void *)a4 + 44);
          uint64_t v56 = *((void *)a4 + 2);
          data = &self->_uniqueIdentifier;
          LODWORD(__src[0]) = 134218498;
          *(uint64_t *)((char *)__src + 4) = v55;
          WORD2(__src[1]) = 2048;
          *(uint64_t *)((char *)&__src[1] + 6) = v56;
          HIWORD(__src[2]) = 2080;
          __src[3] = (uint64_t)data;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "#nrby-eng,#sa_algo,New measurement with distance %4.3f m, timestamp %f, no az or el. Unique identifier: %s",  (uint8_t *)__src,  0x20u);
        }

        uint64_t v23 = 0LL;
        float v22 = 0.0;
      }

      double v25 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryToken]);
      id v26 = [v25 hash];
      if (!*((_BYTE *)a4 + 24) || !*((_BYTE *)a4 + 600)) {
        sub_100006080();
      }
      uint64_t v27 = *((void *)a4 + 2);
      float v28 = *((double *)a4 + 44);
      __int16 v29 = *((_WORD *)a4 + 257);
      __int16 v30 = *((_WORD *)a4 + 280);
      *(void *)uint64_t v68 = v26;
      *(void *)&v68[8] = v27;
      *(float *)&v68[16] = v28;
      *(_DWORD *)&v68[20] = 1;
      *(void *)&v68[24] = LODWORD(v22) | ((unint64_t)LODWORD(v4) << 32);
      *(void *)uint64_t v69 = v23;
      v69[16] = 0;
      v69[20] = 0;
      v69[24] = 0;
      v69[28] = 0;
      BYTE8(v72) = 0;
      __int128 v70 = 0uLL;
      LOWORD(v71[0]) = 0;
      *(_OWORD *)((char *)&v71[2] + 1) = 0u;
      *(_OWORD *)((char *)&v71[1] + 8) = 0u;
      *(_OWORD *)((char *)v71 + 8) = 0u;
      LODWORD(v74) = 0;
      __int128 v73 = 0uLL;
      WORD2(v74) = v29;
      HIWORD(v74) = v30;

      uint64_t ptr = self->_protobufLogger.__ptr_;
      if (ptr) {
        sub_10023FACC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (float32x2_t *)v68);
      }
      sub_1002C7C24(*(void *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)v68);
      dataSource = self->_dataSource;
      if (dataSource)
      {
        v59[9] = v72;
        v59[10] = v73;
        v59[4] = v70;
        v59[5] = v71[0];
        v59[6] = v71[1];
        uint64_t v60 = v74;
        v59[7] = v71[2];
        v59[8] = v71[3];
        v59[0] = *(_OWORD *)v68;
        v59[1] = *(_OWORD *)&v68[16];
        void v59[2] = *(_OWORD *)v69;
        v59[3] = *(_OWORD *)&v69[16];
        -[NINearbyUpdatesEngineDataSource updateWithRangeResult:](dataSource, "updateWithRangeResult:", v59);
      }

      sub_1002C80DC(*(void *)&self->_uniqueIdentifier.__r_.var0, (uint64_t)__src, v32);
      double v34 = self->_dataSource;
      if (v34)
      {
        memcpy(__dst, __src, sizeof(__dst));
        -[NINearbyUpdatesEngineDataSource updateWithSASolution:](v34, "updateWithSASolution:", __dst);
      }

      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyUpdatesEngine niConvergenceStateFromSolution:]( self,  "niConvergenceStateFromSolution:",  __src));
      value = self->_syntheticApertureFilter.__ptr_.__value_;
      float v37 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryToken]);
      char v38 = (void *)objc_claimAutoreleasedReturnValue(-[SyntheticApertureFilter objectForKeyedSubscript:](value, "objectForKeyedSubscript:", v37));

      if (([v38 isEqual:v35] & 1) == 0)
      {
        uint64_t v39 = self->_syntheticApertureFilter.__ptr_.__value_;
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryToken]);
        -[SyntheticApertureFilter setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v35, v40);

        char v41 = objc_alloc(&OBJC_CLASS___NINearbyObject);
        char v42 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryToken]);
        char v43 = -[NINearbyObject initWithToken:](v41, "initWithToken:", v42);

        if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:") & 1) != 0) {
          [WeakRetained updatesEngine:self didUpdateAlgorithmConvergenceState:v35 forObject:v43];
        }
        char v44 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__rep buf = 138412802;
          *(void *)&uint8_t buf[4] = v43;
          *(_WORD *)&_BYTE buf[12] = 2112;
          *(void *)&buf[14] = v35;
          __int16 v63 = 2112;
          double v64 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,#sa_algo,Updated convergence state for object: %@. New state: %@. Previous state: %@",  buf,  0x20u);
        }
      }

      if (LOBYTE(__src[24]))
      {
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromSolution:](self, "nearbyObjectFromSolution:", __src));
        if (v45)
        {
          if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateNearbyObjects:") & 1) != 0)
          {
            char v65 = v45;
            __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v65,  1LL));
            [WeakRetained updatesEngine:self didUpdateNearbyObjects:v46];
          }

          __int128 v47 = self->_dataSource;
          if (v47) {
            -[NINearbyUpdatesEngineDataSource nearbyObjectUpdated:](v47, "nearbyObjectUpdated:", v45);
          }
          __int128 v48 = self->_protobufLogger.__ptr_;
          if (v48)
          {
            [v45 timestamp];
            double v50 = v49;
            sub_100230924(v45, (uint64_t)buf);
            sub_1002A74A4(v58, (uint64_t)buf, 1uLL);
            sub_1002395E8((uint64_t)v48, (const std::string *)&self->_uniqueIdentifier, v58, v50);
            double v61 = (void **)v58;
            sub_1002AFD60(&v61);
            if (*(void *)buf)
            {
              *(void *)&uint8_t buf[8] = *(void *)buf;
              operator delete(*(void **)buf);
            }
          }
        }

        else
        {
          __int128 v51 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            if (!LOBYTE(__src[24])) {
              sub_100006080();
            }
            sub_1003A64B8(&__src[1], (uint64_t)buf, v51);
          }
        }
      }
    }

    else
    {
      double v13 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (!*((_BYTE *)a4 + 24)) {
          sub_100006080();
        }
        sub_1003A656C((uint64_t *)a4 + 2, (uint64_t)self, (uint64_t)__src, v13);
      }
    }
  }

  else
  {
    uint64_t v14 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A64F8((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)acceptPeerDeviceType:(BOOL)a3
{
  dataSource = self->_dataSource;
  if (dataSource) {
    -[NINearbyUpdatesEngineDataSource updateWithPeerDeviceType:](dataSource, "updateWithPeerDeviceType:", a3);
  }
}

- (void)acceptDeviceMotionInput:(const void *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023D080((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 80LL))(var0, a2))
  {
    sub_1001A3CF0(0x2B730444u, 1, 0LL, 0LL, 0LL, 0LL);
    (*(void (**)(int64_t, const void *))(*(void *)self->_uniqueIdentifier.var0 + 72LL))( self->_uniqueIdentifier.var0,  a3);
    sub_1001A3CF0(0x2B730444u, 2, 0LL, 0LL, 0LL, 0LL);
  }

- (void)acceptAltimeterData:(const AltimeterInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023D430((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 104LL))(var0);
  }
}

- (void)acceptGnssSatelliteData:(const void *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003A65CC();
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023D5D4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t))(*(void *)var0 + 192LL))(var0))
  {
    (*(void (**)(int64_t, const void *))(*(void *)self->_uniqueIdentifier.var0 + 184LL))( self->_uniqueIdentifier.var0,  a3);
  }

- (void)acceptSelfLocationData:(const LocationInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023DC88((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3, 0);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 144LL))(var0, a2))
  {
    (*(void (**)(int64_t, const LocationInput *, void))(*(void *)self->_uniqueIdentifier.var0
                                                                          + 136LL))( self->_uniqueIdentifier.var0,  a3,  0LL);
    dataSource = self->_dataSource;
    if (dataSource) {
      -[NINearbyUpdatesEngineDataSource updateWithSelfLocation:](dataSource, "updateWithSelfLocation:", a3);
    }
  }

- (void)acceptHeadingData:(const HeadingInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023E1F4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 168LL))(var0, a2))
  {
    (*(void (**)(int64_t, const HeadingInput *))(*(void *)self->_uniqueIdentifier.var0 + 160LL))( self->_uniqueIdentifier.var0,  a3);
  }

- (void)acceptDiscoveryEventForPeer:(id)a3
{
  id v8 = a3;
  if (self->_uniqueIdentifier.var0)
  {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
    -[NINearbyUpdatesEngine setFindingPeerToken:](self, "setFindingPeerToken:", v8);
  }

  double v4 = sub_100023CC4();
  double v5 = v4;
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023E5EC((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v4);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t))(*(void *)var0 + 120LL))(var0))
    {
      (*(void (**)(int64_t, double))(*(void *)self->_uniqueIdentifier.var0 + 112LL))( self->_uniqueIdentifier.var0,  v5);
    }
  }
}

- (void)acceptPeerLocationData:(const LocationInput *)a3 forPeer:(id)a4
{
  id v9 = a4;
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023DC88((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3, 1);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t))(*(void *)var0 + 144LL))(var0))
  {
    (*(void (**)(int64_t, const LocationInput *, uint64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                           + 136LL))( self->_uniqueIdentifier.var0,  a3,  1LL);
    dataSource = self->_dataSource;
    if (dataSource) {
      -[NINearbyUpdatesEngineDataSource updateWithPeerLocationFromFMF](dataSource, "updateWithPeerLocationFromFMF");
    }
  }
}

- (void)acceptPedometerData:(const PedometerDataInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023D908((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 232LL))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_1003A65F8();
    }
    (*(void (**)(int64_t, const PedometerDataInput *))(*(void *)self->_uniqueIdentifier.var0 + 224LL))( self->_uniqueIdentifier.var0,  a3);
  }

- (void)acceptPedometerEvent:(const PedometerEventInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023DAE4((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 248LL))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_1003A6624();
    }
    (*(void (**)(int64_t, const PedometerEventInput *))(*(void *)self->_uniqueIdentifier.var0 + 240LL))( self->_uniqueIdentifier.var0,  a3);
  }

- (void)acceptMotionActivity:(const MotionActivityInput *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023E398((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t)a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 216LL))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_1003A6650();
    }
    (*(void (**)(int64_t, const MotionActivityInput *))(*(void *)self->_uniqueIdentifier.var0 + 208LL))( self->_uniqueIdentifier.var0,  a3);
  }

- (void)acceptPeerData:(const void *)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,acceptPeerData:FromPeer:",  (uint8_t *)v11,  2u);
  }

  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  sub_10022CCAC((uint64_t)a3, (uint64_t)v11);
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr) {
    sub_10023E78C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v11);
  }
  dataSource = self->_dataSource;
  if (dataSource) {
    -[NINearbyUpdatesEngineDataSource updateWithFinderPeerData:](dataSource, "updateWithFinderPeerData:", v11);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0)
  {
    if ((*(unsigned int (**)(int64_t))(*(void *)var0 + 280LL))(var0))
    {
      -[NINearbyUpdatesEngine setFindingPeerToken:](self, "setFindingPeerToken:", v6);
      sub_1001A3CF0(0x2B730448u, 1, 0LL, 0LL, 0LL, 0LL);
      (*(void (**)(int64_t, uint64_t *))(*(void *)self->_uniqueIdentifier.var0 + 272LL))( self->_uniqueIdentifier.var0,  v11);
      sub_1001A3CF0(0x2B730448u, 2, 0LL, 0LL, 0LL, 0LL);
    }
  }
}

- (void)acceptDevicePDRInput:(const void *)a3
{
  if (self->_uniqueIdentifier.var0) {
    -[NINearbyUpdatesEngine _sendTimeTupleToAlgorithms](self, "_sendTimeTupleToAlgorithms");
  }
  uint64_t ptr = self->_protobufLogger.__ptr_;
  if (ptr)
  {
    __int128 v6 = *((_OWORD *)a3 + 7);
    v29[6] = *((_OWORD *)a3 + 6);
    v29[7] = v6;
    __int128 v7 = *((_OWORD *)a3 + 9);
    v29[8] = *((_OWORD *)a3 + 8);
    v29[9] = v7;
    __int128 v8 = *((_OWORD *)a3 + 3);
    v29[2] = *((_OWORD *)a3 + 2);
    v29[3] = v8;
    __int128 v9 = *((_OWORD *)a3 + 5);
    v29[4] = *((_OWORD *)a3 + 4);
    v29[5] = v9;
    __int128 v10 = *((_OWORD *)a3 + 1);
    v29[0] = *(_OWORD *)a3;
    v29[1] = v10;
    sub_10023EBF8((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, (uint64_t *)v29);
  }

  dataSource = self->_dataSource;
  if (dataSource) {
    -[NINearbyUpdatesEngineDataSource updateWithPDR:](dataSource, "updateWithPDR:", a3);
  }
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0 && (*(unsigned int (**)(int64_t, SEL))(*(void *)var0 + 264LL))(var0, a2))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_1003A667C();
    }
    if (LOBYTE(self->_cachedMagneticFieldStrength.var0.__val_.value))
    {
      __int128 v15 = *((_OWORD *)a3 + 7);
      __int128 v25 = *((_OWORD *)a3 + 6);
      __int128 v26 = v15;
      __int128 v16 = *((_OWORD *)a3 + 9);
      __int128 v27 = *((_OWORD *)a3 + 8);
      __int128 v28 = v16;
      __int128 v17 = *((_OWORD *)a3 + 3);
      __int128 v21 = *((_OWORD *)a3 + 2);
      __int128 v22 = v17;
      __int128 v18 = *((_OWORD *)a3 + 5);
      __int128 v23 = *((_OWORD *)a3 + 4);
      __int128 v24 = v18;
      __int128 v19 = *((_OWORD *)a3 + 1);
      v20[0] = *(_OWORD *)a3;
      v20[1] = v19;
      if ((_BYTE)v21) {
        LOBYTE(v21) = 0;
      }
      if ((_BYTE)v22) {
        LOBYTE(v22) = 0;
      }
      if ((_BYTE)v23) {
        LOBYTE(v23) = 0;
      }
      (*(void (**)(int64_t, _OWORD *, uint64_t, uint64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                         + 256LL))( self->_uniqueIdentifier.var0,  v20,  v13,  v14);
    }

    else
    {
      (*(void (**)(int64_t, const void *, uint64_t, uint64_t))(*(void *)self->_uniqueIdentifier.var0
                                                                             + 256LL))( self->_uniqueIdentifier.var0,  a3,  v13,  v14);
    }
  }

- (void)acceptWatchOrientation:(const WatchOrientationInput *)a3
{
  int64_t var0 = self->_uniqueIdentifier.var0;
  if (var0) {
    (*(void (**)(int64_t, const WatchOrientationInput *))(*(void *)var0 + 320LL))(var0, a3);
  }
}

- (void)setFindingPeerToken:(id)a3
{
  id v4 = a3;
  findingPeerToken = self->_findingPeerToken;
  p_findingPeerToken = (uint64_t *)&self->_findingPeerToken;
  double v5 = findingPeerToken;
  if (findingPeerToken)
  {
    if (!-[NIDiscoveryToken isEqual:](v5, "isEqual:", v4))
    {
      __int128 v8 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003A66A8(p_findingPeerToken, (uint64_t)v4, v8);
      }
    }
  }

  __int128 v9 = (void *)*p_findingPeerToken;
  uint64_t *p_findingPeerToken = (uint64_t)v4;
}

- (AoARad)_convertFromPointingCoordinatesToSpatial:(const void *)a3
{
  float v4 = sub_100026A04(*((double *)a3 + 7));
  float v5 = sub_100026A04(*((double *)a3 + 6));
  float v6 = cosf(v4);
  __float2 v7 = __sincosf_stret(v5);
  float v8 = atan2f(v6 * v7.__cosval, -(float)(v6 * v7.__sinval));
  float v9 = v4;
  result.BOOL var1 = v8;
  result.int64_t var0 = v9;
  return result;
}

- (id)nearbyObjectFromSolution:(const void *)a3 forPeer:(id)a4
{
  float v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromToken:](self, "nearbyObjectFromToken:", a4));
  if (v6)
  {
    if (*((_BYTE *)a3 + 192)) {
      -[NINearbyUpdatesEngine fillNearbyObject:fromRangeResult:]( self,  "fillNearbyObject:fromRangeResult:",  v6,  (char *)a3 + 8);
    }
    -[NINearbyUpdatesEngine fillNearbyObject:fromSolution:](self, "fillNearbyObject:fromSolution:", v6, a3);
    id v7 = v6;
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A672C();
  }

  return v6;
}

- (id)nearbyObjectFromToken:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  float v6 = WeakRetained;
  if (!WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A6758();
    }
    goto LABEL_9;
  }

  id v7 = [WeakRetained identifierFromDiscoveryToken:v4];
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A6784();
    }
LABEL_9:
    __int128 v10 = 0LL;
    goto LABEL_13;
  }

  float v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectFromIdentifier:v7]);
  __int128 v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003A67E4();
  }

LABEL_13:
  return v10;
}

- (id)nearbyObjectFromDeviceIdentifier:(unint64_t)a3
{
  unint64_t v11 = a3;
  id v4 = sub_100046FEC(&self->_hashToTokenMap.__table_.__bucket_list_.__ptr_.__value_, &v11);
  if (v4)
  {
    id v5 = (id)v4[3];
    float v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyUpdatesEngine nearbyObjectFromToken:](self, "nearbyObjectFromToken:", v5));
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003A6844();
    }

    return v7;
  }

  else
  {
    float v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__rep buf = 134217984;
      unint64_t v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "#nrby-eng,nearbyObjectFromDeviceIdentifier - failed to find token mapped to hash: %llu",  buf,  0xCu);
    }

    return 0LL;
  }

- (id)nearbyObjectFromRangeResult:(const void *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyUpdatesEngine nearbyObjectFromDeviceIdentifier:]( self,  "nearbyObjectFromDeviceIdentifier:",  *(void *)a3));
  if (v5) {
    goto LABEL_5;
  }
  float v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#nrby-eng,attempting to get NIObject from session's database",  v10,  2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([WeakRetained objectFromIdentifier:*(void *)a3]);

  id v5 = (void *)v8;
  if (v8) {
LABEL_5:
  }
    -[NINearbyUpdatesEngine fillNearbyObject:fromRangeResult:](self, "fillNearbyObject:fromRangeResult:", v5, a3);
  return v5;
}

- (id)niConvergenceStateFromSolution:(const void *)a3
{
  if (*(_DWORD *)a3 == 1) {
    uint64_t v4 = 2LL;
  }
  else {
    uint64_t v4 = *(_DWORD *)a3 == 0;
  }
  id v5 = -[NIAlgorithmConvergenceState initWithConvergenceStatus:]( objc_alloc(&OBJC_CLASS___NIAlgorithmConvergenceState),  "initWithConvergenceStatus:",  v4);
  -[NIAlgorithmConvergenceState setInsufficientMovement:](v5, "setInsufficientMovement:", *((unsigned __int8 *)a3 + 4));
  -[NIAlgorithmConvergenceState setInsufficientHorizontalSweep:]( v5,  "setInsufficientHorizontalSweep:",  *((unsigned __int8 *)a3 + 5));
  -[NIAlgorithmConvergenceState setInsufficientVerticalSweep:]( v5,  "setInsufficientVerticalSweep:",  *((unsigned __int8 *)a3 + 6));
  -[NIAlgorithmConvergenceState setInsufficientLighting:](v5, "setInsufficientLighting:", *((unsigned __int8 *)a3 + 7));
  return v5;
}

- (void)fillNearbyObject:(id)a3 fromRangeResult:(const void *)a4
{
  id v5 = a3;
  LODWORD(v6) = *((_DWORD *)a4 + 4);
  [v5 setDistance:v6];
  int v7 = *((_DWORD *)a4 + 5) - 1;
  if (*((_BYTE *)a4 + 36))
  {
    uint64_t v8 = *((void *)a4 + 3);
    [v5 setDirection:sub_100035338((float *)&v8)];
  }
}

- (void)fillNearbyObject:(id)a3 fromSolution:(const void *)a4
{
  id v9 = a3;
  if (*((_BYTE *)a4 + 208))
  {
    double v5 = *((double *)a4 + 25) * 0.0174532925;
    *(float *)&double v5 = v5;
    [v9 setHorizontalAngle:v5];
  }

  if (*((_BYTE *)a4 + 328))
  {
    double v6 = *((double *)a4 + 40) * 0.0174532925;
    *(float *)&double v6 = v6;
    [v9 setHorizontalAngleAccuracy:v6];
  }

  if (*((_DWORD *)a4 + 58) <= 4u) {
    objc_msgSend(v9, "setVerticalDirectionEstimate:");
  }
  if (*((_BYTE *)a4 + 272)) {
    [v9 setDirection:*((double *)a4 + 32)];
  }
  if (*((_BYTE *)a4 + 304)) {
    [v9 setWorldPosition:*((double *)a4 + 36)];
  }
  if (*((_BYTE *)a4 + 368))
  {
    uint64_t v7 = *((unsigned int *)a4 + 91);
  }

  if (!*((_BYTE *)a4 + 376))
  {
    uint64_t v8 = 0LL;
    goto LABEL_18;
  }

  uint64_t v8 = *((unsigned int *)a4 + 93);
  if (v8 <= 2) {
LABEL_18:
  }
    [v9 setMotionState:v8];
  if (*((_BYTE *)a4 + 380)) {
    [v9 setResetARSession:1];
  }
  if (*((_BYTE *)a4 + 381)) {
    [v9 setRevokeFindingExperience:1];
  }
}

- (id)nearbyObjectFromSolution:(const void *)a3
{
  if (!*((_BYTE *)a3 + 192)) {
    return 0LL;
  }
  double v5 = (uint64_t *)((char *)a3 + 8);
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[NINearbyUpdatesEngine nearbyObjectFromRangeResult:]( self,  "nearbyObjectFromRangeResult:",  (char *)a3 + 8));
  if (v6)
  {
    -[NINearbyUpdatesEngine fillNearbyObject:fromSolution:](self, "fillNearbyObject:fromSolution:", v6, a3);
    id v7 = v6;
  }

  else
  {
    id v9 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (!*((_BYTE *)a3 + 192)) {
        sub_100006080();
      }
      uint64_t v10 = *v5;
      int v11 = 134217984;
      uint64_t v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "#nrby-eng,no object for identifier 0x%llx",  (uint8_t *)&v11,  0xCu);
    }
  }

  return v6;
}

- (void)logSolution:(const void *)a3
{
  if (!*((_BYTE *)a3 + 192) || (float v4 = *((float *)a3 + 6), v4 == 1.1755e-38))
  {
    sub_100046B94(&v15, (uint64_t)"-, ", 3LL);
  }

  else
  {
    uint64_t v5 = v15;
    *(_DWORD *)((char *)&v15 + *(void *)(v15 - 24) + 8) = *(_DWORD *)((_BYTE *)&v15 + *(void *)(v15 - 24) + 8) & 0xFFFFFEFB | 4;
    *(std::locale::__imp **)((char *)&v16.__loc_.__locale_ + *(void *)(v5 - 24)) = (std::locale::__imp *)2;
    double v6 = (void *)std::ostream::operator<<(v4);
    sub_100046B94(v6, (uint64_t)" m, ", 4LL);
  }

  sub_100046B94(&v15, (uint64_t)"Horizontal angle ", 17LL);
  if (*((_BYTE *)a3 + 208))
  {
    uint64_t v7 = v15;
    *(_DWORD *)((char *)&v15 + *(void *)(v15 - 24) + 8) = *(_DWORD *)((_BYTE *)&v15 + *(void *)(v15 - 24) + 8) & 0xFFFFFEFB | 4;
    *(std::locale::__imp **)((char *)&v16.__loc_.__locale_ + *(void *)(v7 - 24)) = (std::locale::__imp *)2;
    uint64_t v8 = (void *)std::ostream::operator<<(&v15, *((double *)a3 + 25));
    sub_100046B94(v8, (uint64_t)" deg, ", 6LL);
  }

  else
  {
    sub_100046B94(&v15, (uint64_t)"-, ", 3LL);
  }

  sub_100046B94(&v15, (uint64_t)"Horizontal angle unc ", 21LL);
  if (*((_BYTE *)a3 + 328))
  {
    uint64_t v9 = v15;
    *(_DWORD *)((char *)&v15 + *(void *)(v15 - 24) + 8) = *(_DWORD *)((_BYTE *)&v15 + *(void *)(v15 - 24) + 8) & 0xFFFFFEFB | 4;
    *(std::locale::__imp **)((char *)&v16.__loc_.__locale_ + *(void *)(v9 - 24)) = (std::locale::__imp *)2;
    uint64_t v10 = (void *)std::ostream::operator<<(&v15, *((double *)a3 + 40));
    sub_100046B94(v10, (uint64_t)" deg, ", 6LL);
  }

  else
  {
    sub_100046B94(&v15, (uint64_t)"-, ", 3LL);
  }

  sub_100046B94(&v15, (uint64_t)"Vertical state ", 15LL);
  uint64_t v11 = *((int *)a3 + 58);
  sub_100046B94(&v15, (uint64_t)", Algorithm source ", 19LL);
  if (*((_BYTE *)a3 + 368))
  {
    uint64_t v12 = *((int *)a3 + 91);
  }

  unint64_t v13 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str(&v14, &v16);
    sub_1003A68A4((char *)&v14, (uint64_t)v18, v13);
  }

  std::streambuf::~streambuf(&v16);
  std::ios::~ios(&v17);
}

- (void)getPeerDataFromFindingContainerWithToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_uniqueIdentifier.var0)
  {
    [v4 hash];
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_1003A690C();
    }
    (*(void (**)(uint64_t *__return_ptr))(*(void *)self->_uniqueIdentifier.var0 + 8LL))(v10);
    sub_10022C888((uint64_t)v10, (uint64_t)v9);
    uint64_t ptr = self->_protobufLogger.__ptr_;
    if (ptr) {
      sub_10023E78C((uint64_t)ptr, (const std::string *)&self->_uniqueIdentifier, v10);
    }
    dataSource = self->_dataSource;
    if (dataSource) {
      -[NINearbyUpdatesEngineDataSource updateWithFindeePeerData:](dataSource, "updateWithFindeePeerData:", v10);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);
    if ((objc_opt_respondsToSelector(WeakRetained, "updatesEngine:didUpdateFindeeData:forToken:") & 1) != 0) {
      [WeakRetained updatesEngine:self didUpdateFindeeData:v9 forToken:v5];
    }
  }
}

- (void)probeRegions
{
  for (unint64_t i = self->_regionMonitorMap.__table_.__p1_.__value_.__next_; i; unint64_t i = (void *)*i)
  {
    uint64_t v3 = i[3];
    double v4 = sub_100023CC4();
    sub_100314914(v3, v4);
  }

- (set<NIRegionSizeCategory,)_getRegionSizeCategoriesFromRegions:(std:(NINearbyUpdatesEngine *)self :(SEL)a3 allocator<NIRegionSizeCategory>> *__return_ptr)retstr
{
  id v5 = a4;
  retstr->var0.var2.int64_t var0 = 0LL;
  retstr->var0.var1.var0.__left_ = 0LL;
  retstr->var0.int64_t var0 = &retstr->var0.var1;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) regionSizeCategory];
        sub_1002B07B8((uint64_t **)retstr, (uint64_t *)&v11, (uint64_t *)&v11);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  return result;
}

- (NIConfiguration)configuration
{
  return *(NIConfiguration **)&self->_findingLatencyBookkeeping.accumulatedExcessSeconds;
}

- (NINearbyUpdatesEngineDataSource)dataSource
{
  return (NINearbyUpdatesEngineDataSource *)objc_loadWeakRetained((id *)&self->_previousNIObjectUpdate);
}

- (void)setDataSource:(id)a3
{
}

- (NINearbyUpdatesEngineDelegate)delegate
{
  return (NINearbyUpdatesEngineDelegate *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (void)setDelegate:(id)a3
{
}

- (NIServerAnalyticsManager)analyticsManager
{
  return (NIServerAnalyticsManager *)self->_dataSource;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  int64_t var0 = self->_uniqueIdentifier.var0;
  self->_uniqueIdentifier.int64_t var0 = 0LL;
  if (var0) {
    (*(void (**)(int64_t))(*(void *)var0 + 368LL))(var0);
  }
  uint64_t v4 = *(void *)&self->_uniqueIdentifier.__r_.var0;
  *(void *)&self->_uniqueIdentifier.__r_.int64_t var0 = 0LL;
  if (v4) {
    sub_1002AF880((uint64_t)&self->_uniqueIdentifier.__r_.var0, v4);
  }
  sub_100012390((uint64_t)&self->_protobufLogger);
  objc_storeStrong((id *)&self->_findingPeerToken, 0LL);
  sub_10016424C((uint64_t)&self->_hashToTokenMap);
  objc_storeStrong((id *)&self->_regionDict, 0LL);
  sub_1002B0870((uint64_t)&self->_regionMonitorMap);
  objc_storeStrong((id *)&self->_queue, 0LL);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((_BYTE *)self + 200) = 0;
  *((_BYTE *)self + 216) = 0;
  *((_BYTE *)self + 232) = 0;
  *((void *)self + 31) = 0LL;
  *((void *)self + 32) = 0LL;
  *((void *)self + 30) = 0LL;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0LL;
  return self;
}

@end