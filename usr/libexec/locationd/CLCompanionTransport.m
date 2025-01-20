@interface CLCompanionTransport
+ (id)computeMD5:(id)a3;
- (BOOL)isActive;
- (BOOL)isConnected;
- (BOOL)isNearby;
- (CLCompanionTransport)initWithSilo:(id)a3 iDSService:(id)a4;
- (IDSDevice)pairedDevice;
- (IDSService)idsService;
- (double)pairedDeviceLastNearbyTimestamp;
- (double)pairedDeviceLastSeenTimestamp;
- (id)connectionUpdateHandler;
- (id)deviceNearbyHandler;
- (id)receivedMessageHandler;
- (void)dealloc;
- (void)handleAbsoluteAltitudeSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleAbsoluteAltitudeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleCardioChangeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleColdStorageDataUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleCompanionPingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleCompanionPingDataForAbsoluteAltitude:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleContextConfigurationUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleFilteredPressure:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleKappaCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleKappaStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyBicycleCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyBicycleStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMartyStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMobilityUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMotionCalsUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleMotionStateUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCoarseElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCoarseElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCoarseElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCyclingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCyclingSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerCyclingUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleOdometerElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePredictedWalkDistanceBout:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleRemoteAppLaunch:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleSafetyCompanionHeartbeat:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleStrideCalDataSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleStrideCalDataUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleVO2MaxCloudKitDailyStats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleWorkoutDistanceAnalytics:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)receivedMessage:(unsigned __int16)a3 data:(id)a4 identifierString:(id)a5;
- (void)sendMessage:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 fireAndForget:(BOOL)a6 encrypt:(BOOL)a7 bypassConnectionCheck:(BOOL)a8 timeout:(double)a9 nonWaking:(BOOL)a10 completionHandler:(id)a11;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setConnectionUpdateHandler:(id)a3;
- (void)setDeviceNearbyHandler:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsNearby:(BOOL)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPairedDeviceLastNearbyTimestamp:(double)a3;
- (void)setPairedDeviceLastSeenTimestamp:(double)a3;
- (void)setReceivedMessageHandler:(id)a3;
- (void)updateIDSStatus;
- (void)updateIDSStatusAndNotify;
@end

@implementation CLCompanionTransport

- (CLCompanionTransport)initWithSilo:(id)a3 iDSService:(id)a4
{
  *(void *)&double v6 = objc_opt_class(&OBJC_CLASS___IDSService).n128_u64[0];
  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___CLCompanionTransport;
    v8 = -[CLCompanionTransport init](&v17, "init", v6);
    if (v8)
    {
      if (qword_1019344B0 != -1) {
        dispatch_once(&qword_1019344B0, &stru_101859918);
      }
      v9 = (os_log_s *)qword_1019344B8;
      if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating CLCompanionTransport", buf, 2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019344B0 != -1) {
          dispatch_once(&qword_1019344B0, &stru_101859918);
        }
        v18[0] = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  1LL,  "Creating CLCompanionTransport",  v18,  2);
        v13 = (uint8_t *)v12;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionTransport initWithSilo:iDSService:]", "%s\n", v12);
        if (v13 != buf) {
          free(v13);
        }
      }

      -[IDSService addDelegate:queue:](v8->_idsService, "addDelegate:queue:", v8, [a3 queue]);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10081D94C;
      v16[3] = &unk_10181A288;
      v16[4] = v8;
      [a3 async:v16];
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerCyclingSubscribe:service:account:fromID:context:",  0LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerCyclingUnsubscribe:service:account:fromID:context:",  1LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerCyclingData:service:account:fromID:context:",  2LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerElevationSubscribe:service:account:fromID:context:",  4LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerElevationUnsubscribe:service:account:fromID:context:",  5LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerElevationData:service:account:fromID:context:",  6LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleStrideCalDataSubscribe:service:account:fromID:context:",  7LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleStrideCalDataUnsubscribe:service:account:fromID:context:",  8LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerCoarseElevationSubscribe:service:account:fromID:context:",  11LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerCoarseElevationUnsubscribe:service:account:fromID:context:",  12LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleOdometerCoarseElevationData:service:account:fromID:context:",  13LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMotionCalsUpdate:service:account:fromID:context:",  14LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMotionStateUpdate:service:account:fromID:context:",  18LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleRemoteAppLaunch:service:account:fromID:context:",  19LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleCompanionPingData:service:account:fromID:context:",  15LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleAbsoluteAltitudeUpdate:service:account:fromID:context:",  20LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleAbsoluteAltitudeSubscribe:service:account:fromID:context:",  22LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleCompanionPingDataForAbsoluteAltitude:service:account:fromID:context:",  23LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleFilteredPressure:service:account:fromID:context:",  36LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handlePredictedWalkDistanceBout:service:account:fromID:context:",  21LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleKappaCollect:service:account:fromID:context:",  24LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleKappaStop:service:account:fromID:context:",  25LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMartyCollect:service:account:fromID:context:",  26LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMartyStop:service:account:fromID:context:",  27LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMartyBicycleCollect:service:account:fromID:context:",  28LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMartyBicycleStop:service:account:fromID:context:",  29LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleSafetyCompanionHeartbeat:service:account:fromID:context:",  30LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleVO2MaxCloudKitDailyStats:service:account:fromID:context:",  31LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleContextConfigurationUpdate:service:account:fromID:context:",  32LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleCardioChangeUpdate:service:account:fromID:context:",  33LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleColdStorageDataUpdate:service:account:fromID:context:",  34LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleMobilityUpdate:service:account:fromID:context:",  35LL);
      -[IDSService setProtobufAction:forIncomingRequestsOfType:]( v8->_idsService,  "setProtobufAction:forIncomingRequestsOfType:",  "handleWorkoutDistanceAnalytics:service:account:fromID:context:",  37LL);
    }
  }

  else
  {
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101859918);
    }
    v10 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "IDSService CLCompanionTransport is nil!",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344B0 != -1) {
        dispatch_once(&qword_1019344B0, &stru_101859918);
      }
      v18[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  2LL,  "IDSService CLCompanionTransport is nil!",  v18,  2);
      v15 = (uint8_t *)v14;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionTransport initWithSilo:iDSService:]", "%s\n", v14);
      if (v15 != buf) {
        free(v15);
      }
    }

    return 0LL;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCompanionTransport;
  -[CLCompanionTransport dealloc](&v3, "dealloc");
}

- (void)updateIDSStatus
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  v21 = self;
  id obj = -[IDSService devices](-[CLCompanionTransport idsService](self, "idsService"), "devices");
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v7);
        if (qword_1019346D0 != -1) {
          dispatch_once(&qword_1019346D0, &stru_101859938);
        }
        v9 = (os_log_s *)p_vtable[219];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = objc_msgSend(objc_msgSend(v8, "name"), "UTF8String");
          v11 = p_vtable;
          unsigned int v12 = [v8 isNearby];
          unsigned int v13 = [v8 isDefaultPairedDevice];
          unsigned int v14 = [v8 isConnected];
          *(_DWORD *)buf = 68290051;
          *(_DWORD *)v30 = 0;
          *(_WORD *)&v30[4] = 2082;
          *(void *)&v30[6] = "";
          __int16 v31 = 2081;
          id v32 = v10;
          __int16 v33 = 1026;
          unsigned int v34 = v12;
          p_vtable = v11;
          __int16 v35 = 1026;
          unsigned int v36 = v13;
          __int16 v37 = 1026;
          unsigned int v38 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:updateIDSStatus:, name:%{private, location:escape_only}s, isNearby:%{public }hhd, isDefaultPairedDevice:%{public}hhd, isConnected:%{public}hhd}",  buf,  0x2Eu);
        }

        if ([v8 isDefaultPairedDevice])
        {
          -[CLCompanionTransport setIsNearby:](v21, "setIsNearby:", [v8 isNearby]);
          -[CLCompanionTransport setIsActive:](v21, "setIsActive:", [v8 isActive]);
        }

        if ([v8 isDefaultPairedDevice] && objc_msgSend(v8, "isNearby"))
        {
          -[CLCompanionTransport setIsConnected:](v21, "setIsConnected:", 1LL);
          -[CLCompanionTransport setPairedDevice:](v21, "setPairedDevice:", v8);
          -[CLCompanionTransport setPairedDeviceLastNearbyTimestamp:]( v21,  "setPairedDeviceLastNearbyTimestamp:",  CFAbsoluteTimeGetCurrent());
          if (qword_1019346D0 != -1) {
            dispatch_once(&qword_1019346D0, &stru_101859938);
          }
          v15 = (os_log_s *)p_vtable[219];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = objc_msgSend( -[IDSDevice modelIdentifier]( -[CLCompanionTransport pairedDevice](v21, "pairedDevice"),  "modelIdentifier"),  "UTF8String");
            *(_DWORD *)buf = 136315138;
            *(void *)v30 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Fitness: Companion model is %s",  buf,  0xCu);
          }

          if (sub_1002921D0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1019346D0 != -1) {
              dispatch_once(&qword_1019346D0, &stru_101859938);
            }
            objc_super v17 = p_vtable[219];
            id v18 = objc_msgSend( -[IDSDevice modelIdentifier]( -[CLCompanionTransport pairedDevice](v21, "pairedDevice"),  "modelIdentifier"),  "UTF8String");
            int v27 = 136315138;
            id v28 = v18;
            _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v17,  2LL,  "Fitness: Companion model is %s",  (const char *)&v27);
            v20 = (uint8_t *)v19;
            sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionTransport updateIDSStatus]", "%s\n", v19);
            if (v20 != buf) {
              free(v20);
            }
          }

          return;
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v39 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (void)updateIDSStatusAndNotify
{
  unsigned int v3 = -[CLCompanionTransport isConnected](self, "isConnected");
  -[CLCompanionTransport updateIDSStatus](self, "updateIDSStatus");
  if (v3 != -[CLCompanionTransport isConnected](self, "isConnected"))
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    id v4 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        uint64_t v5 = "true";
      }
      else {
        uint64_t v5 = "false";
      }
      if (-[CLCompanionTransport isConnected](self, "isConnected")) {
        double v6 = "true";
      }
      else {
        double v6 = "false";
      }
      *(_DWORD *)buf = 136315394;
      v19 = v5;
      __int16 v20 = 2080;
      v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "prevConnectedState,%s,currConnectedState,%s",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_101859938);
      }
      uint64_t v9 = qword_1019346D8;
      if (v3) {
        id v10 = "true";
      }
      else {
        id v10 = "false";
      }
      if (-[CLCompanionTransport isConnected](self, "isConnected")) {
        v11 = "true";
      }
      else {
        v11 = "false";
      }
      int v14 = 136315394;
      v15 = v10;
      __int16 v16 = 2080;
      objc_super v17 = v11;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  0LL,  "prevConnectedState,%s,currConnectedState,%s",  (const char *)&v14,  22);
      unsigned int v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionTransport updateIDSStatusAndNotify]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }

    if (!-[CLCompanionTransport isConnected](self, "isConnected")) {
      -[CLCompanionTransport setPairedDeviceLastSeenTimestamp:]( self,  "setPairedDeviceLastSeenTimestamp:",  CFAbsoluteTimeGetCurrent());
    }
    if (-[CLCompanionTransport connectionUpdateHandler](self, "connectionUpdateHandler"))
    {
      uint64_t v7 = -[CLCompanionTransport connectionUpdateHandler](self, "connectionUpdateHandler");
      v7[2](v7, -[CLCompanionTransport isConnected](self, "isConnected"));
    }

    if (-[CLCompanionTransport deviceNearbyHandler](self, "deviceNearbyHandler"))
    {
      v8 = -[CLCompanionTransport deviceNearbyHandler](self, "deviceNearbyHandler");
      v8[2](v8, -[CLCompanionTransport isNearby](self, "isNearby"));
    }
  }

- (void)sendMessage:(id)a3 type:(unsigned __int16)a4 priority:(int64_t)a5 fireAndForget:(BOOL)a6 encrypt:(BOOL)a7 bypassConnectionCheck:(BOOL)a8 timeout:(double)a9 nonWaking:(BOOL)a10 completionHandler:(id)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  uint64_t v16 = a4;
  -[CLCompanionTransport updateIDSStatusAndNotify](self, "updateIDSStatusAndNotify");
  if (-[CLCompanionTransport isConnected](self, "isConnected") || v12)
  {
    uint64_t v20 = a10;
    id v43 = 0LL;
    uint64_t v44 = 0LL;
    id v21 = [[IDSProtobuf alloc] initWithProtobufData:a3 type:v16 isResponse:0];
    v67[0] = IDSSendMessageOptionTimeoutKey;
    v68[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a9);
    v68[1] = &__kCFBooleanTrue;
    v67[1] = IDSSendMessageOptionLocalDeliveryKey;
    v67[2] = IDSSendMessageOptionFireAndForgetKey;
    v68[2] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14);
    v67[3] = IDSSendMessageOptionEncryptPayloadKey;
    v68[3] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13);
    v67[4] = IDSSendMessageOptionNonWakingKey;
    v68[4] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a10);
    v22 = &CMOnBodyStatusManagerManufacturer_ptr;
    __int128 v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v68,  v67,  5LL);
    __int128 v24 = -[CLCompanionTransport idsService](self, "idsService");
    id v25 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:]( v24,  "sendProtobuf:toDestinations:priority:options:identifier:error:",  v21,  +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", IDSDefaultPairedDevice),  a5,  v23,  &v43,  &v44);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    __int128 v26 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      id v27 = v25;
      id v28 = [v43 UTF8String];
      id v29 = objc_msgSend(objc_msgSend(v21, "data"), "length");
      id v30 = objc_msgSend( +[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a3),  "UTF8String");
      *(_DWORD *)buf = 136316162;
      id v58 = v28;
      id v25 = v27;
      __int16 v59 = 2048;
      id v60 = v29;
      v22 = &CMOnBodyStatusManagerManufacturer_ptr;
      __int16 v61 = 1024;
      int v62 = v16;
      __int16 v63 = 1024;
      int v64 = (int)v27;
      __int16 v65 = 2080;
      id v66 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Sending protobuf ID:%s size: %lu type: %d over IDSService - Status %d, md5 %s",  buf,  0x2Cu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      HIDWORD(v41) = a10;
      id v34 = v25;
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_101859938);
      }
      uint64_t v35 = qword_1019346D8;
      id v36 = [v43 UTF8String];
      id v37 = objc_msgSend(objc_msgSend(v21, "data"), "length");
      id v38 = objc_msgSend( +[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a3),  "UTF8String");
      int v47 = 136316162;
      id v48 = v36;
      __int16 v49 = 2048;
      id v50 = v37;
      __int16 v51 = 1024;
      int v52 = v16;
      __int16 v53 = 1024;
      id v25 = v34;
      int v54 = (int)v34;
      __int16 v55 = 2080;
      id v56 = v38;
      LODWORD(v41) = 44;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v35,  2LL,  "Sending protobuf ID:%s size: %lu type: %d over IDSService - Status %d, md5 %s",  (const char *)&v47,  v41,  (_DWORD)v43,  v44,  v45[0]);
      v40 = (uint8_t *)v39;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport sendMessage:type:priority:fireAndForget:encrypt:bypassConnectionCheck:timeout:nonWaking:c ompletionHandler:]",  "%s\n",  v39);
      if (v40 != buf) {
        free(v40);
      }
      uint64_t v20 = v42;
      v22 = &CMOnBodyStatusManagerManufacturer_ptr;
    }

    if ((_DWORD)v16 != 20)
    {
      v45[0] = @"type";
      v46[0] = +[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v16);
      v45[1] = @"nonWaking";
      __int16 v31 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v20);
      v45[2] = @"action";
      v46[1] = v31;
      v46[2] = &off_1018D3A28;
      sub_100E575BC( (uint64_t)[v22[404] dictionaryWithObjects:v46 forKeys:v45 count:3],  (uint64_t)"MotionPacket");
    }

    if (a11) {
      (*((void (**)(id, id, uint64_t))a11 + 2))(a11, v25, v44);
    }
  }

  else
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    v19 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "No device locally connected - Ignore sending data",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_101859938);
      }
      LOWORD(v47) = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "No device locally connected - Ignore sending data",  &v47,  2);
      __int16 v33 = (uint8_t *)v32;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport sendMessage:type:priority:fireAndForget:encrypt:bypassConnectionCheck:timeout:nonWaking:c ompletionHandler:]",  "%s\n",  v32);
      if (v33 != buf) {
        free(v33);
      }
    }

    if (a11) {
      (*((void (**)(id, void, void))a11 + 2))(a11, 0LL, 0LL);
    }
  }

- (void)receivedMessage:(unsigned __int16)a3 data:(id)a4 identifierString:(id)a5
{
  uint64_t v7 = a3;
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_101859938);
  }
  uint64_t v9 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v30 = [a5 UTF8String];
    __int16 v31 = 1024;
    int v32 = v7;
    __int16 v33 = 2048;
    id v34 = [a4 length];
    __int16 v35 = 2080;
    id v36 = objc_msgSend( +[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a4),  "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Received message ID:%s, type:%d, size %lu, md5 %s",  buf,  0x26u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    uint64_t v12 = qword_1019346D8;
    int v21 = 136315906;
    id v22 = [a5 UTF8String];
    __int16 v23 = 1024;
    int v24 = v7;
    __int16 v25 = 2048;
    id v26 = [a4 length];
    __int16 v27 = 2080;
    id v28 = objc_msgSend( +[CLCompanionTransport computeMD5:](CLCompanionTransport, "computeMD5:", a4),  "UTF8String");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v12,  2LL,  "Received message ID:%s, type:%d, size %lu, md5 %s",  (const char *)&v21,  38,  v18,  (const char *)v19);
    BOOL v14 = (uint8_t *)v13;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionTransport receivedMessage:data:identifierString:]", "%s\n", v13);
    if (v14 != buf) {
      free(v14);
    }
  }

  if ((_DWORD)v7 != 20)
  {
    id v18 = @"type";
    v19 = @"action";
    v20[0] = +[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v7);
    v20[1] = &off_1018D3A40;
    sub_100E575BC( (uint64_t)+[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  &v18,  2LL),  (uint64_t)"MotionPacket");
  }

  if (!-[CLCompanionTransport isConnected](self, "isConnected"))
  {
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    id v10 = (os_log_s *)qword_1019346D8;
    if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Unexpected message received while disconnected. Updating status.",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019346D0 != -1) {
        dispatch_once(&qword_1019346D0, &stru_101859938);
      }
      LOWORD(v21) = 0;
      LODWORD(v17) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019346D8,  2LL,  "Unexpected message received while disconnected. Updating status.",  &v21,  v17);
      uint64_t v16 = (uint8_t *)v15;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport receivedMessage:data:identifierString:]",  "%s\n",  v15);
      if (v16 != buf) {
        free(v16);
      }
    }

    -[CLCompanionTransport updateIDSStatusAndNotify](self, "updateIDSStatusAndNotify");
  }

  if (-[CLCompanionTransport receivedMessageHandler](self, "receivedMessageHandler"))
  {
    v11 = -[CLCompanionTransport receivedMessageHandler](self, "receivedMessageHandler");
    v11[2](v11, v7, a4);
  }

- (void)handleKappaCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleKappaStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMartyCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMartyStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMartyBicycleCollect:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMartyBicycleStop:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleSafetyCompanionHeartbeat:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerCyclingSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerCyclingUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerCyclingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleStrideCalDataSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleStrideCalDataUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerCoarseElevationSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerCoarseElevationUnsubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleOdometerCoarseElevationData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMotionCalsUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleCompanionPingData:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMotionStateUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleRemoteAppLaunch:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleAbsoluteAltitudeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleAbsoluteAltitudeSubscribe:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleFilteredPressure:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handlePredictedWalkDistanceBout:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleCompanionPingDataForAbsoluteAltitude:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleVO2MaxCloudKitDailyStats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleContextConfigurationUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleCardioChangeUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_101859938);
  }
  v8 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    id v15 = [a5 length];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Received data over IDSService size : %ld",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    uint64_t v9 = qword_1019346D8;
    int v12 = 134217984;
    id v13 = [a5 length];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v9,  2LL,  "Received data over IDSService size : %ld",  &v12);
    v11 = (uint8_t *)v10;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport service:account:incomingData:fromID:context:]",  "%s\n",  v10);
    if (v11 != buf) {
      free(v11);
    }
  }

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_101859938);
  }
  uint64_t v9 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = objc_msgSend(objc_msgSend(a7, "outgoingResponseIdentifier"), "UTF8String");
    __int16 v19 = 2048;
    id v20 = objc_msgSend(objc_msgSend(a5, "data"), "length");
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Received unhandled protobuf ID:%s, size:%lu",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    uint64_t v10 = qword_1019346D8;
    int v13 = 136315394;
    id v14 = objc_msgSend(objc_msgSend(a7, "outgoingResponseIdentifier"), "UTF8String");
    __int16 v15 = 2048;
    id v16 = objc_msgSend(objc_msgSend(a5, "data"), "length");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  2LL,  "Received unhandled protobuf ID:%s, size:%lu",  (const char *)&v13,  22);
    int v12 = (uint8_t *)v11;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport service:account:incomingUnhandledProtobuf:fromID:context:]",  "%s\n",  v11);
    if (v12 != buf) {
      free(v12);
    }
  }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_101859938);
  }
  uint64_t v10 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = [a5 UTF8String];
    __int16 v22 = 1024;
    BOOL v23 = v8;
    __int16 v24 = 2080;
    id v25 = objc_msgSend(objc_msgSend(a7, "localizedDescription"), "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Service sent data with ID:%s with success %d error %s",  buf,  0x1Cu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    uint64_t v11 = qword_1019346D8;
    int v14 = 136315650;
    id v15 = [a5 UTF8String];
    __int16 v16 = 1024;
    BOOL v17 = v8;
    __int16 v18 = 2080;
    id v19 = objc_msgSend(objc_msgSend(a7, "localizedDescription"), "UTF8String");
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v11,  2LL,  "Service sent data with ID:%s with success %d error %s",  (const char *)&v14,  28);
    int v13 = (uint8_t *)v12;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport service:account:identifier:didSendWithSuccess:error:]",  "%s\n",  v12);
    if (v13 != buf) {
      free(v13);
    }
  }

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  if (qword_1019346D0 != -1) {
    dispatch_once(&qword_1019346D0, &stru_101859938);
  }
  uint64_t v7 = (os_log_s *)qword_1019346D8;
  if (os_log_type_enabled((os_log_t)qword_1019346D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = [a5 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Service data ack on otherside with ID:%s",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019346D0 != -1) {
      dispatch_once(&qword_1019346D0, &stru_101859938);
    }
    uint64_t v8 = qword_1019346D8;
    int v11 = 136315138;
    id v12 = [a5 UTF8String];
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v8,  2LL,  "Service data ack on otherside with ID:%s",  (const char *)&v11);
    uint64_t v10 = (uint8_t *)v9;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLCompanionTransport service:account:identifier:hasBeenDeliveredWithContext:]",  "%s\n",  v9);
    if (v10 != buf) {
      free(v10);
    }
  }

- (void)handleColdStorageDataUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleMobilityUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

- (void)handleWorkoutDistanceAnalytics:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
}

+ (id)computeMD5:(id)a3
{
  unsigned int v3 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 32LL);
  for (uint64_t i = 0LL; i != 16; ++i)
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"%02x", md[i]);
  return v3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (IDSDevice)pairedDevice
{
  return (IDSDevice *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPairedDevice:(id)a3
{
}

- (double)pairedDeviceLastSeenTimestamp
{
  return self->_pairedDeviceLastSeenTimestamp;
}

- (void)setPairedDeviceLastSeenTimestamp:(double)a3
{
  self->_pairedDeviceLastSeenTimestamp = a3;
}

- (id)receivedMessageHandler
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setReceivedMessageHandler:(id)a3
{
}

- (id)connectionUpdateHandler
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setConnectionUpdateHandler:(id)a3
{
}

- (id)deviceNearbyHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDeviceNearbyHandler:(id)a3
{
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void)setIsNearby:(BOOL)a3
{
  self->_isNearby = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (double)pairedDeviceLastNearbyTimestamp
{
  return self->_pairedDeviceLastNearbyTimestamp;
}

- (void)setPairedDeviceLastNearbyTimestamp:(double)a3
{
  self->_pairedDeviceLastNearbyTimestamp = a3;
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setIdsService:(id)a3
{
}

@end