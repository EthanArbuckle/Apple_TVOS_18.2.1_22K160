@interface _FindingAdvertiser
+ (id)sharedInstance;
- (id)_configureAdvertiserForType:(int)a3 toPeer:(id)a4 withAdvertisement:(id)a5;
- (id)_configureNearbyActionNoWakeAdvertiserWithPeer:(id)a3 advertisement:(id)a4;
- (id)_configureSpatialInteractionAdvertiserWithPeer:(id)a3 advertisement:(id)a4;
- (id)_initInternal;
- (id)payloadChangeObserverQueue;
- (id)printableState;
- (id)startAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4 withAdvertisement:(id)a5;
- (id)stopAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4;
- (unint64_t)_peerIndexReferenceForAdvertisementType:(int)a3 outPeers:(id *)a4 outAdvertisements:(id *)a5;
- (unint64_t)_totalPeers;
- (void)_cbAdvertisingAddressChanged;
- (void)_resetAdvertiserForType:(int)a3;
- (void)_resetNearbyActionNoWakeAdvertiser;
- (void)_resetSpatialInteractionAdvertiser;
- (void)_roundRobinTimerHandler;
- (void)_startRoundRobinTimer;
- (void)_stopRoundRobinTimer;
- (void)_updateAdvertisementAfterActivationForType:(int)a3;
- (void)payloadDidChange;
@end

@implementation _FindingAdvertiser

+ (id)sharedInstance
{
  if (qword_1007FE108 != -1) {
    dispatch_once(&qword_1007FE108, &stru_1007BB9D8);
  }
  return (id)qword_1007FE100;
}

- (id)startAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4 withAdvertisement:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v15 = "token";
    int v16 = 125;
    goto LABEL_6;
  }

  if (!v9)
  {
    v15 = "advertisement";
    int v16 = 126;
LABEL_6:
    __assert_rtn( "-[_FindingAdvertiser startAdvertisingAsFinder:toPeer:withAdvertisement:]",  "NIServerFindingDiscovery.mm",  v16,  v15);
  }

  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100298494;
  v26 = sub_1002984A4;
  id v27 = 0LL;
  selfQueue = (dispatch_queue_s *)self->_selfQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002984AC;
  block[3] = &unk_1007BBA00;
  BOOL v21 = a3;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  v20 = &v22;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(selfQueue, block);
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v13;
}

- (id)stopAdvertisingAsFinder:(BOOL)a3 toPeer:(id)a4
{
  id v6 = a4;
  if (!v6) {
    sub_1003A5680();
  }
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100298494;
  id v19 = sub_1002984A4;
  id v20 = 0LL;
  selfQueue = (dispatch_queue_s *)self->_selfQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100298750;
  v11[3] = &unk_1007BBA28;
  BOOL v14 = a3;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  id v8 = v6;
  dispatch_sync(selfQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)printableState
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100298494;
  id v11 = sub_1002984A4;
  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  selfQueue = (dispatch_queue_s *)self->_selfQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002989CC;
  v6[3] = &unk_1007B1E50;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(selfQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_initInternal
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____FindingAdvertiser;
  v2 = -[_FindingAdvertiser init](&v19, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nearbyd.finding.advertiser-self", v4);
    selfQueue = v2->_selfQueue;
    v2->_selfQueue = (OS_dispatch_queue *)v5;

    roundRobinTimer = v2->_roundRobinTimer;
    v2->_roundRobinTimer = 0LL;

    nearbyActionNoWakeAdvertiser = v2->_nearbyActionNoWakeAdvertiser;
    v2->_nearbyActionNoWakeAdvertiser = 0LL;

    v2->_activatedNearbyActionNoWake = 0;
    spatialInteractionAdvertiser = v2->_spatialInteractionAdvertiser;
    v2->_spatialInteractionAdvertiser = 0LL;

    v2->_activatedSpatialInteraction = 0;
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    nearbyActionNoWakePeers = v2->_nearbyActionNoWakePeers;
    v2->_nearbyActionNoWakePeers = v10;

    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    nearbyActionNoWakeAdvertisements = v2->_nearbyActionNoWakeAdvertisements;
    v2->_nearbyActionNoWakeAdvertisements = v12;

    v2->_nearbyActionNoWakeCurrentPeerIndex = 0LL;
    BOOL v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    spatialInteractionPeers = v2->_spatialInteractionPeers;
    v2->_spatialInteractionPeers = v14;

    int v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    spatialInteractionAdvertisements = v2->_spatialInteractionAdvertisements;
    v2->_spatialInteractionAdvertisements = v16;

    v2->_spatialInteractionCurrentPeerIndex = 0LL;
  }

  return v2;
}

- (unint64_t)_peerIndexReferenceForAdvertisementType:(int)a3 outPeers:(id *)a4 outAdvertisements:(id *)a5
{
  uint64_t v7 = self;
  if (a3 == 26)
  {
    *a4 = (id) self[7];
    *a5 = (id) v7[8];
    id v10 = [*a4 count];
    if (v10 != [*a5 count]) {
      sub_1003A5720();
    }
    if ([*a4 count])
    {
      unint64_t v11 = v7[9];
    }

    return v7 + 9;
  }

  else if (a3 == 19)
  {
    *a4 = (id) self[10];
    *a5 = (id) v7[11];
    id v8 = [*a4 count];
    if (v8 != [*a5 count]) {
      sub_1003A56D0();
    }
    if ([*a4 count])
    {
      unint64_t v9 = v7[12];
    }

    return v7 + 12;
  }

  return self;
}

- (unint64_t)_totalPeers
{
  id v3 = -[NSMutableArray count](self->_nearbyActionNoWakePeers, "count");
  return (unint64_t)v3 + (void)-[NSMutableArray count](self->_spatialInteractionPeers, "count");
}

- (id)_configureAdvertiserForType:(int)a3 toPeer:(id)a4 withAdvertisement:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 == 26)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[_FindingAdvertiser _configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:]( self,  "_configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:",  v9,  v10));
    goto LABEL_5;
  }

  if (a3 == 19)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[_FindingAdvertiser _configureSpatialInteractionAdvertiserWithPeer:advertisement:]( self,  "_configureSpatialInteractionAdvertiserWithPeer:advertisement:",  v9,  v10));
LABEL_5:
    dispatch_queue_t v5 = (void *)v11;
  }

  return v5;
}

- (void)_resetAdvertiserForType:(int)a3
{
  if (a3 == 26)
  {
    -[_FindingAdvertiser _resetNearbyActionNoWakeAdvertiser](self, "_resetNearbyActionNoWakeAdvertiser");
  }

  else if (a3 == 19)
  {
    -[_FindingAdvertiser _resetSpatialInteractionAdvertiser](self, "_resetSpatialInteractionAdvertiser");
  }

- (id)_configureNearbyActionNoWakeAdvertiserWithPeer:(id)a3 advertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (!v6)
  {
    v32 = "peerToken";
    int v33 = 388;
    goto LABEL_37;
  }

  if (!v7)
  {
    v32 = "advertisement";
    int v33 = 389;
LABEL_37:
    __assert_rtn( "-[_FindingAdvertiser _configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:]",  "NIServerFindingDiscovery.mm",  v33,  v32);
  }

  nearbyActionNoWakeAdvertiser = self->_nearbyActionNoWakeAdvertiser;
  if (nearbyActionNoWakeAdvertiser)
  {
    if (self->_activatedNearbyActionNoWake)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CBAdvertiser advertisingAddressDataConnectable]( nearbyActionNoWakeAdvertiser,  "advertisingAddressDataConnectable"));
      id v10 = v9;
      if (!v9 || (unint64_t)[v9 length] <= 5)
      {
        WORD2(location[0]) = 0;
        LODWORD(location[0]) = 0;
        uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", location, 6LL));

        id v10 = (void *)v11;
      }

      id v12 = sub_100299CE4(v6, v10);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_1003A5748();
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  0LL));
        goto LABEL_33;
      }

      if (-[CBAdvertiser nearbyActionNoWakeType]( self->_nearbyActionNoWakeAdvertiser,  "nearbyActionNoWakeType") != 1) {
        -[CBAdvertiser setNearbyActionNoWakeType:]( self->_nearbyActionNoWakeAdvertiser,  "setNearbyActionNoWakeType:",  1LL);
      }
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[CBAdvertiser nearbyActionNoWakeAuthTagData]( self->_nearbyActionNoWakeAdvertiser,  "nearbyActionNoWakeAuthTagData"));
      uint64_t v15 = (uint64_t)[v13 isEqualToData:v14];

      if ((v15 & 1) == 0) {
        -[CBAdvertiser setNearbyActionNoWakeAuthTagData:]( self->_nearbyActionNoWakeAdvertiser,  "setNearbyActionNoWakeAuthTagData:",  v13);
      }
      int v16 = (void *)objc_claimAutoreleasedReturnValue([v7 payload]);
      if (v16
        || (uint64_t v15 = objc_claimAutoreleasedReturnValue( -[CBAdvertiser nearbyActionNoWakeConfigData]( self->_nearbyActionNoWakeAdvertiser,  "nearbyActionNoWakeConfigData"))) != 0)
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payload", v15));
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[CBAdvertiser nearbyActionNoWakeConfigData]( self->_nearbyActionNoWakeAdvertiser,  "nearbyActionNoWakeConfigData"));
        unsigned int v19 = [v17 isEqualToData:v18];

        if (v16)
        {

          if (!v19) {
            goto LABEL_29;
          }
        }

        else
        {

          if ((v19 & 1) == 0) {
            goto LABEL_29;
          }
        }
      }

      unsigned int v27 = -[CBAdvertiser nearbyActionNWPrecisionFindingStatus]( self->_nearbyActionNoWakeAdvertiser,  "nearbyActionNWPrecisionFindingStatus");
      if (v27 == [v7 statusFlags])
      {
LABEL_30:
        v29 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_nearbyActionNoWakeAdvertiser;
          LODWORD(location[0]) = 138477827;
          *(id *)((char *)location + 4) = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "#find-disc,NearbyActionNoWake: configured advertiser: %{private}@",  (uint8_t *)location,  0xCu);
        }

        v26 = 0LL;
LABEL_33:

        goto LABEL_34;
      }

- (id)_configureSpatialInteractionAdvertiserWithPeer:(id)a3 advertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  if (!v6)
  {
    v45 = "peerToken";
    int v46 = 485;
    goto LABEL_34;
  }

  if (!v7)
  {
    v45 = "advertisement";
    int v46 = 486;
LABEL_34:
    __assert_rtn( "-[_FindingAdvertiser _configureSpatialInteractionAdvertiserWithPeer:advertisement:]",  "NIServerFindingDiscovery.mm",  v46,  v45);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getIRK]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 getSessionIdentifier]);
    if (v9)
    {
      char v51 = 0;
      int v50 = 0;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 payload]);

      if (v10)
      {
        for (unsigned __int8 i = 0; ; ++i)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 payload]);
          id v13 = [v12 length];

          id v14 = objc_claimAutoreleasedReturnValue([v7 payload]);
          *((_BYTE *)&v50 + i) = *((_BYTE *)[v14 bytes] + i);
        }
      }

      id v15 = [v7 statusFlags];
      int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
      [v16 setFindingStatus:v15];

      uint64_t v17 = v50;
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
      [v18 setFindingConfig:v17];

      uint64_t v19 = BYTE1(v50);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
      [v20 setFindingConfig2:v19];

      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
      [v21 setFindingEnabled:1];

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
      [v22 commitChange];

      double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 aggregatedUWBData]);

      spatialInteractionAdvertiser = self->_spatialInteractionAdvertiser;
      if (spatialInteractionAdvertiser)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession clientIrkData](spatialInteractionAdvertiser, "clientIrkData"));
        if ([v26 isEqualToData:v8])
        {
          unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( -[CBSpatialInteractionSession clientIdentifierData]( self->_spatialInteractionAdvertiser,  "clientIdentifierData"));
          unsigned __int8 v28 = [v27 isEqual:v9];

          if ((v28 & 1) != 0)
          {
            if (self->_activatedSpatialInteraction)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue( -[CBSpatialInteractionSession uwbConfigData]( self->_spatialInteractionAdvertiser,  "uwbConfigData"));
              unsigned __int8 v30 = [v24 isEqualToData:v29];

              if ((v30 & 1) == 0)
              {
                -[CBSpatialInteractionSession setControlFlags:]( self->_spatialInteractionAdvertiser,  "setControlFlags:",  -[CBSpatialInteractionSession controlFlags]( self->_spatialInteractionAdvertiser,  "controlFlags") | 8);
                -[CBSpatialInteractionSession setUwbConfigData:]( self->_spatialInteractionAdvertiser,  "setUwbConfigData:",  v24);
                -[CBSpatialInteractionSession setControlFlags:]( self->_spatialInteractionAdvertiser,  "setControlFlags:",  (unint64_t)-[CBSpatialInteractionSession controlFlags]( self->_spatialInteractionAdvertiser,  "controlFlags") & 0xFFFFFFF7);
              }

              uint64_t v31 = qword_1008000A0;
              if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_27;
              }
              v32 = self->_spatialInteractionAdvertiser;
              LODWORD(location[0]) = 138477827;
              *(id *)((char *)location + 4) = v32;
              int v33 = "#find-disc,SpatialInteraction: configured advertiser: %{private}@";
              v34 = (os_log_s *)v31;
              uint32_t v35 = 12;
            }

            else
            {
              uint64_t v44 = qword_1008000A0;
              if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
              {
LABEL_27:

                v36 = 0LL;
                goto LABEL_28;
              }

              LOWORD(location[0]) = 0;
              int v33 = "#find-disc,SpatialInteraction: advertiser still activating";
              v34 = (os_log_s *)v44;
              uint32_t v35 = 2;
            }

            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)location, v35);
            goto LABEL_27;
          }
        }

        else
        {
        }
      }

      -[CBSpatialInteractionSession invalidate](self->_spatialInteractionAdvertiser, "invalidate");
      v38 = objc_opt_new(&OBJC_CLASS___CBSpatialInteractionSession);
      id v39 = self->_spatialInteractionAdvertiser;
      self->_spatialInteractionAdvertiser = v38;

      -[CBSpatialInteractionSession setDispatchQueue:]( self->_spatialInteractionAdvertiser,  "setDispatchQueue:",  self->_selfQueue);
      -[CBSpatialInteractionSession setLabel:]( self->_spatialInteractionAdvertiser,  "setLabel:",  @"nearbydFinding");
      -[CBSpatialInteractionSession setClientIrkData:](self->_spatialInteractionAdvertiser, "setClientIrkData:", v8);
      -[CBSpatialInteractionSession setClientIdentifierData:]( self->_spatialInteractionAdvertiser,  "setClientIdentifierData:",  v9);
      -[CBSpatialInteractionSession setControlFlags:](self->_spatialInteractionAdvertiser, "setControlFlags:", 4115LL);
      -[CBSpatialInteractionSession setEnableEPAForLEAdvertisement:]( self->_spatialInteractionAdvertiser,  "setEnableEPAForLEAdvertisement:",  1LL);
      -[CBSpatialInteractionSession setAdvertiseRate:](self->_spatialInteractionAdvertiser, "setAdvertiseRate:", 50LL);
      -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v24);
      self->_activatedSpatialInteraction = 0;
      objc_initWeak(location, self);
      v40 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#find-disc,SpatialInteraction: activating advertiser",  buf,  2u);
      }

      double v41 = sub_100023CC4();
      v42 = self->_spatialInteractionAdvertiser;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10029A580;
      v47[3] = &unk_1007A1D58;
      v48[1] = *(id *)&v41;
      objc_copyWeak(v48, location);
      v47[4] = self;
      -[CBSpatialInteractionSession activateWithCompletion:](v42, "activateWithCompletion:", v47);
      objc_destroyWeak(v48);
      objc_destroyWeak(location);
      goto LABEL_27;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A5800();
    }
    NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
    v54 = @"Discovery token doesn't contain valid session identifier";
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v37));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A5800();
    }
    NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
    v56 = @"Discovery token doesn't contain valid IRK";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v9));
  }

- (void)_resetNearbyActionNoWakeAdvertiser
{
  id v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-disc,NearbyActionNoWake: reset advertising",  v5,  2u);
  }

  -[CBAdvertiser invalidate](self->_nearbyActionNoWakeAdvertiser, "invalidate");
  nearbyActionNoWakeAdvertiser = self->_nearbyActionNoWakeAdvertiser;
  self->_nearbyActionNoWakeAdvertiser = 0LL;

  self->_activatedNearbyActionNoWake = 0;
}

- (void)_resetSpatialInteractionAdvertiser
{
  id v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#find-disc,SpatialInteraction: reset advertising",  v7,  2u);
  }

  -[CBSpatialInteractionSession invalidate](self->_spatialInteractionAdvertiser, "invalidate");
  spatialInteractionAdvertiser = self->_spatialInteractionAdvertiser;
  self->_spatialInteractionAdvertiser = 0LL;

  self->_activatedSpatialInteraction = 0;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
  [v5 setFindingEnabled:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
  [v6 commitChange];
}

- (void)_updateAdvertisementAfterActivationForType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_selfQueue);
  id v12 = 0LL;
  id v13 = 0LL;
  dispatch_queue_t v5 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]( self,  "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:",  v3,  &v13,  &v12);
  id v6 = v13;
  id v7 = v12;
  unint64_t v8 = *v5;
  if (v8 < (unint64_t)[v6 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:*v5]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:*v5]);
    id v11 =  -[_FindingAdvertiser _configureAdvertiserForType:toPeer:withAdvertisement:]( self,  "_configureAdvertiserForType:toPeer:withAdvertisement:",  v3,  v9,  v10);
  }
}

- (void)_startRoundRobinTimer
{
  roundRobinTimer = self->_roundRobinTimer;
  if (roundRobinTimer)
  {
    dispatch_source_cancel((dispatch_source_t)roundRobinTimer);
    id v4 = self->_roundRobinTimer;
    self->_roundRobinTimer = 0LL;
  }

  dispatch_queue_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_selfQueue);
  id v6 = self->_roundRobinTimer;
  self->_roundRobinTimer = v5;

  id v7 = self->_roundRobinTimer;
  dispatch_time_t v8 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0x12A05F200uLL, 0x989680uLL);
  objc_initWeak(&location, self);
  id v9 = self->_roundRobinTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10029AAA4;
  v10[3] = &unk_1007A1CA0;
  objc_copyWeak(&v11, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
  dispatch_resume((dispatch_object_t)self->_roundRobinTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_stopRoundRobinTimer
{
  roundRobinTimer = self->_roundRobinTimer;
  if (roundRobinTimer)
  {
    dispatch_source_cancel((dispatch_source_t)roundRobinTimer);
    id v4 = self->_roundRobinTimer;
    self->_roundRobinTimer = 0LL;
  }

- (void)_roundRobinTimerHandler
{
  uint64_t v3 = operator new(8uLL);
  uint64_t v4 = 0LL;
  *uint64_t v3 = 0x1A00000013LL;
  *(void *)&__int128 v5 = 136315651LL;
  __int128 v16 = v5;
  do
  {
    uint64_t v6 = *(unsigned int *)((char *)v3 + v4);
    id v17 = 0LL;
    id v18 = 0LL;
    id v7 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]( self,  "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:",  v6,  &v18,  &v17,  v16);
    id v8 = v18;
    id v9 = v17;
    if ((unint64_t)[v8 count] >= 2)
    {
      unint64_t v10 = *v7;
      *id v7 = (v10 + 1) % (unint64_t)[v8 count];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:*v7]);
      id v13 =  -[_FindingAdvertiser _configureAdvertiserForType:toPeer:withAdvertisement:]( self,  "_configureAdvertiserForType:toPeer:withAdvertisement:",  v6,  v11,  v12);
      id v14 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = sub_10027843C(v6);
        *(_DWORD *)buf = v16;
        id v20 = v15;
        __int16 v21 = 2113;
        uint64_t v22 = v11;
        __int16 v23 = 2113;
        uint64_t v24 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#find-disc,Round robin: re-configured advertiser (%s). New peer: %{private}@. New advertisement: %{private}@.",  buf,  0x20u);
      }
    }

    v4 += 4LL;
  }

  while (v4 != 8);
  operator delete(v3);
}

- (void)_cbAdvertisingAddressChanged
{
  uint64_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-disc,BT adv address changed", buf, 2u);
  }

  id v10 = 0LL;
  id v11 = 0LL;
  uint64_t v4 = -[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]( self,  "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:",  26LL,  &v11,  &v10);
  id v5 = v11;
  id v6 = v10;
  if ([v5 count])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:*v4]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:*v4]);
    id v9 =  -[_FindingAdvertiser _configureAdvertiserForType:toPeer:withAdvertisement:]( self,  "_configureAdvertiserForType:toPeer:withAdvertisement:",  26LL,  v7,  v8);
  }
}

- (id)payloadChangeObserverQueue
{
  return self->_selfQueue;
}

- (void)payloadDidChange
{
  if (self->_spatialInteractionAdvertiser)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerSpatialInteractionPayloadAggregator sharedInstance]( &OBJC_CLASS___NIServerSpatialInteractionPayloadAggregator,  "sharedInstance"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aggregatedUWBData]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBSpatialInteractionSession uwbConfigData](self->_spatialInteractionAdvertiser, "uwbConfigData"));
    unsigned __int8 v6 = [v5 isEqualToData:v4];

    if ((v6 & 1) == 0)
    {
      if ((-[CBSpatialInteractionSession controlFlags]( self->_spatialInteractionAdvertiser,  "controlFlags") & 8) != 0)
      {
        -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v4);
        id v8 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-disc,SpatialInteraction: payload did change: %@. Advertiser updated, but not currently advertising",  (uint8_t *)&v9,  0xCu);
        }
      }

      else
      {
        -[CBSpatialInteractionSession setControlFlags:]( self->_spatialInteractionAdvertiser,  "setControlFlags:",  -[CBSpatialInteractionSession controlFlags](self->_spatialInteractionAdvertiser, "controlFlags") | 8);
        -[CBSpatialInteractionSession setUwbConfigData:](self->_spatialInteractionAdvertiser, "setUwbConfigData:", v4);
        id v7 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-disc,SpatialInteraction: payload did change: %@. Advertiser updated, and control flags toggled for it to take effect",  (uint8_t *)&v9,  0xCu);
        }

        -[CBSpatialInteractionSession setControlFlags:]( self->_spatialInteractionAdvertiser,  "setControlFlags:",  (unint64_t)-[CBSpatialInteractionSession controlFlags]( self->_spatialInteractionAdvertiser,  "controlFlags") & 0xFFFFFFF7);
      }
    }
  }

- (void).cxx_destruct
{
}

@end