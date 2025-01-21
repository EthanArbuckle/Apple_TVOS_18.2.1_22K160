@interface WiFiSoftErrorManager
- (BOOL)askToLaunchSlowWiFiRadar:(__CFString *)a3;
- (BOOL)askToLaunchTapToRadar:(int)a3;
- (BOOL)askToLaunchTriggerDisconnectRadar:(__CFString *)a3;
- (BOOL)askToLaunchUserDisconnectRadar;
- (BOOL)getReachabilityStatus;
- (BOOL)isEventMitigationEnabled:(int)a3;
- (BOOL)isLQAIndicatingTxStall;
- (BOOL)isTxStalled:(unsigned int *)a3 rateType:(unsigned __int8)a4 size:(unsigned int)a5;
- (BOOL)shouldSupressErrorReporting:(int)a3;
- (BOOL)supressEventDetectionProcesssing:(int)a3 deviceContext:(void *)a4;
- (BOOL)supressTapToRadar:(int)a3 deviceContext:(void *)a4;
- (BOOL)wifiSoftErrorTxDataStallProcessHistory:(__CFDictionary *)a3;
- (WiFiSoftErrorManager)initWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4;
- (id)copySoftErrorEventDescription:(int)a3;
- (id)fetchSoftErrorContext:(void *)a3 softErrorType:(int)a4;
- (softErrorCounters)getErrorCounters;
- (unsigned)softErrorTypeIndex:(int)a3;
- (void)WiFiSoftErrorDriverAvailableEventhandler;
- (void)WiFiSoftErrorDriverLinkupEventhandler;
- (void)WiFiSoftErrorManagerLQMEventHandler:(id)a3;
- (void)WiFiSoftErrorReporting:(int)a3 deviceContext:(void *)a4 displayString:(__CFString *)a5;
- (void)enableSoftErrorMitigation:(int)a3;
- (void)initErrorArray:(int)a3;
- (void)initEventMitigation;
- (void)launchTapToRadar:(int)a3 displayString:(__CFString *)a4 deviceContext:(void *)a5;
- (void)populateTxFailHistory:(__CFArray *)a3 failureHistoryArray:(unsigned int *)a4 historyArraySz:(unsigned int)a5;
- (void)purgeOutdatedEvents:(id)a3 currTime:(double)a4;
- (void)recordMitigation:(int)a3;
- (void)supressSoftErrorMitigation:(int)a3;
- (void)updateReportingPreference;
- (void)wifiSoftErrorAwdlEventNotificationHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorCounterUpdate:(int)a3;
- (void)wifiSoftErrorEventHandler:(void *)a3 eventType:(int)a4 eventData:(void *)a5;
- (void)wifiSoftErrorMitigation:(int)a3 mitigationContext:(void *)a4;
- (void)wifiSoftErrorRxDataStallEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorSlowWiFiEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorTxDataStallEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorUnexpectedClientAssertionHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorUserConfirmationFlagSetting:(int)a3 forError:(int)a4 withDeviceContext:(void *)a5;
- (void)wifiSoftErrorUserConfirmationUpdate:(int)a3 withDeviceContext:(void *)a4;
- (void)wifiSoftErrorUserDisconnectEventHandler:(void *)a3;
- (void)wifiSoftErrorWiFiAutoJoinEventHandler:(void *)a3;
- (void)wifiSoftErrorWiFiScanEventHandler:(void *)a3;
- (void)wifiSoftErrorWiFiToggleEventHandler:(int)a3 deviceContext:(void *)a4;
- (void)wifiSoftErrorWiFiTriggerDisconnectEventHandler:(void *)a3 eventData:(void *)a4;
- (void)wifiSoftErrorsInProcessStateSet:(int)a3;
- (void)wifiSoftErrorsInProcessStateUnset:(int)a3;
@end

@implementation WiFiSoftErrorManager

- (WiFiSoftErrorManager)initWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v7 = a4;
  if (objc_opt_class(&OBJC_CLASS___WAClient))
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___WiFiSoftErrorManager;
    v8 = -[WiFiSoftErrorManager init](&v16, "init");
    if (v8)
    {
      self = v8;
      v8->_manager = a3;
      v8->_softErrorInProcessFlags = 0;
      v8->_lastReportedSoftErrorTs = 0.0;
      objc_storeStrong((id *)&v8->_queue, a4);
      *(void *)&self->_errorCounters.slowWiFiUserConfirmCount = 0LL;
      *(_OWORD *)&self->_errorCounters.triggerDisconnectUserConfirmCount = 0u;
      *(_OWORD *)&self->_errorCounters.noNetworksFoundErrorUserConfirmCount = 0u;
      *(_OWORD *)&self->_errorCounters.rxDataStallErrorCount = 0u;
      *(_OWORD *)&self->_errorCounters.wifiToggleErrorCount = 0u;
      -[WiFiSoftErrorManager initEventMitigation](self, "initEventMitigation");
      wifiToggleErrors = self->_wifiToggleErrors;
      self->_wifiToggleErrors = 0LL;

      noNetworkFoundErrors = self->_noNetworkFoundErrors;
      self->_noNetworkFoundErrors = 0LL;

      autoJoinDelayErrors = self->_autoJoinDelayErrors;
      self->_autoJoinDelayErrors = 0LL;

      txDataStallErrors = self->_txDataStallErrors;
      self->_txDataStallErrors = 0LL;

      rxDataStallErrors = self->_rxDataStallErrors;
      self->_rxDataStallErrors = 0LL;

      self->_isInternalBuild = MGGetBoolAnswer(@"InternalBuild");
      self->_isReportingDisabled = 0;
      self->_reportingTimeout = 3600.0;
      *(void *)self->_primaryInterfaceTxFail = 0LL;
      *(void *)&self->_primaryInterfaceTxFail[2] = 0LL;
      self->_primaryInterfaceTxFail[4] = 0;
      *(void *)&self->_primaryInterfaceTxFrms[2] = 0LL;
      *(void *)self->_primaryInterfaceTxFrms = 0LL;
      self->_primaryInterfaceTxFrms[4] = 0;
      *(void *)self->_primaryInterfaceRxFrms = 0LL;
      *(void *)&self->_primaryInterfaceRxFrms[2] = 0LL;
      self->_primaryInterfaceRxFrms[4] = 0;
      self->_primaryInterfaceStatsHistoryIdx = 0;
    }

    else
    {
      v15 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: failed in super-init" message:3];
      }
      objc_autoreleasePoolPop(v15);
      self = 0LL;
    }
  }

  return self;
}

- (void)updateReportingPreference
{
  self->_isReportingDisabled = sub_10007F040(self->_manager, &self->_reportingTimeout);
  if (self->_reportingTimeout == 0.0) {
    self->_reportingTimeout = 3600.0;
  }
}

- (void)initErrorArray:(int)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v9 = v5;
  if (v5)
  {
    v6 = v5;
    switch(a3)
    {
      case 1:
        p_wifiToggleErrors = &self->_wifiToggleErrors;
        goto LABEL_12;
      case 2:
        p_wifiToggleErrors = &self->_noNetworkFoundErrors;
        goto LABEL_12;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        p_wifiToggleErrors = &self->_autoJoinDelayErrors;
        goto LABEL_12;
      case 8:
        p_wifiToggleErrors = &self->_txDataStallErrors;
        goto LABEL_12;
      default:
        if (a3 != 16)
        {
LABEL_6:
          v8 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"Invalid Soft-Error" message:3];
          }
          goto LABEL_8;
        }

        p_wifiToggleErrors = &self->_rxDataStallErrors;
LABEL_12:
        objc_storeStrong((id *)p_wifiToggleErrors, v6);
        break;
    }
  }

  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: errorArray allocation failed" message:3];
    }
LABEL_8:
    objc_autoreleasePoolPop(v8);
  }
}

- (void)wifiSoftErrorEventHandler:(void *)a3 eventType:(int)a4 eventData:(void *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v16 = -[WiFiSoftErrorManager copySoftErrorEventDescription:](self, "copySoftErrorEventDescription:", *(void *)&a4);
  if ((_DWORD)v6 == 12)
  {
    if (a5)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(a5, v9) & 1) != 0)
      {
        -[WiFiSoftErrorManager WiFiSoftErrorManagerLQMEventHandler:](self, "WiFiSoftErrorManagerLQMEventHandler:", a5);
        goto LABEL_24;
      }
    }

    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: LQM Dictionary data is NULL or wrong type !" message:3];
    }
    goto LABEL_15;
  }

  v10 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [(id)qword_100219F60 WFLog:3, "%s: eventType received:%u eventName:%@", "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]", v6, v16 message];
  }
  objc_autoreleasePoolPop(v10);
  if (self->_softErrorInProcessFlags)
  {
    switch((_DWORD)v6)
    {
      case 0xB:
        goto LABEL_11;
      case 0xA:
        -[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler]( self,  "WiFiSoftErrorDriverAvailableEventhandler");
        goto LABEL_24;
      case 9:
LABEL_11:
        -[WiFiSoftErrorManager WiFiSoftErrorDriverLinkupEventhandler](self, "WiFiSoftErrorDriverLinkupEventhandler");
        goto LABEL_24;
    }

    v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Dropping SoftErrorEvent: SoftError in ProcessFlag:0x%0x" message:3, "-[WiFiSoftErrorManager wifiSoftErrorEventHandler:eventType:eventData:]", self->_softErrorInProcessFlags];
    }
    v12 = v13;
    goto LABEL_23;
  }

  if (-[WiFiSoftErrorManager supressEventDetectionProcesssing:deviceContext:]( self,  "supressEventDetectionProcesssing:deviceContext:",  v6,  a3))
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: SoftErrorEvent Detection Supressed" message:3];
    }
LABEL_15:
    v12 = v11;
LABEL_23:
    objc_autoreleasePoolPop(v12);
    goto LABEL_24;
  }

  switch((int)v6)
  {
    case 0:
    case 7:
    case 8:
      goto LABEL_18;
    case 1:
      -[WiFiSoftErrorManager enableSoftErrorMitigation:](self, "enableSoftErrorMitigation:", 2LL);
LABEL_18:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiToggleEventHandler:deviceContext:]( self,  "wifiSoftErrorWiFiToggleEventHandler:deviceContext:",  v6,  a3);
      break;
    case 2:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:](self, "wifiSoftErrorWiFiScanEventHandler:", a3);
      break;
    case 3:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:](self, "wifiSoftErrorWiFiAutoJoinEventHandler:", a3);
      break;
    case 4:
      -[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]( self,  "wifiSoftErrorTxDataStallEventHandler:eventData:",  a3,  a5);
      break;
    case 5:
      -[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]( self,  "wifiSoftErrorRxDataStallEventHandler:eventData:",  a3,  a5);
      break;
    case 6:
      -[WiFiSoftErrorManager wifiSoftErrorWiFiTriggerDisconnectEventHandler:eventData:]( self,  "wifiSoftErrorWiFiTriggerDisconnectEventHandler:eventData:",  a3,  a5);
      break;
    case 14:
      -[WiFiSoftErrorManager wifiSoftErrorUnexpectedClientAssertionHandler:eventData:]( self,  "wifiSoftErrorUnexpectedClientAssertionHandler:eventData:",  a3,  a5);
      break;
    case 15:
      -[WiFiSoftErrorManager wifiSoftErrorAwdlEventNotificationHandler:eventData:]( self,  "wifiSoftErrorAwdlEventNotificationHandler:eventData:",  a3,  a5);
      break;
    case 16:
      -[WiFiSoftErrorManager wifiSoftErrorSlowWiFiEventHandler:eventData:]( self,  "wifiSoftErrorSlowWiFiEventHandler:eventData:",  a3,  a5);
      break;
    default:
      break;
  }

- (void)wifiSoftErrorsInProcessStateSet:(int)a3
{
  if (a3 >= 0x400)
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Invalid Soft Error" message:3 v5];
    }
  }

  else
  {
    self->_softErrorInProcessFlags |= a3;
    v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: softErrorsInProcessFlags:0x%0x" message:3, "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:]", self->_softErrorInProcessFlags];
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)wifiSoftErrorsInProcessStateUnset:(int)a3
{
  if (a3 >= 0x400)
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Invalid Soft Error" message:3 v5];
    }
  }

  else
  {
    self->_softErrorInProcessFlags &= ~a3;
    v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: softErrorsInProcessFlags:0x%0x" message:3, "-[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:]", self->_softErrorInProcessFlags];
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (id)fetchSoftErrorContext:(void *)a3 softErrorType:(int)a4
{
  if (a3)
  {
    uint64_t v7 = 5LL;
    switch(a4)
    {
      case 1:
        goto LABEL_8;
      case 2:
        uint64_t v7 = 6LL;
        goto LABEL_8;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        uint64_t v7 = 7LL;
        goto LABEL_8;
      case 8:
        uint64_t v7 = 8LL;
        goto LABEL_8;
      default:
        if (a4 != 16) {
          goto LABEL_18;
        }
        uint64_t v7 = 9LL;
LABEL_8:
        v8 = (&self->super.isa)[v7];
        if (v8)
        {
          uint64_t v9 = v8;
          if (-[objc_class count](v8, "count"))
          {
            unint64_t v10 = 0LL;
            v11 = 0LL;
            do
            {
              v12 = v11;
              v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectAtIndex:](v9, "objectAtIndex:", v10));

              if (a4 == 1) {
                manager = self->_manager;
              }
              else {
                manager = self->_deviceManager;
              }
              if (manager == a3) {
                break;
              }
              ++v10;
            }

            while (v10 < (unint64_t)-[objc_class count](v9, "count"));
          }

          else
          {
            v11 = 0LL;
          }

          goto LABEL_21;
        }

- (void)wifiSoftErrorWiFiToggleEventHandler:(int)a3 deviceContext:(void *)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (self->_wifiToggleErrors)
  {
    v30 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue( -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]( self,  "fetchSoftErrorContext:softErrorType:",  a4,  1LL));
    if (v30) {
      goto LABEL_9;
    }
    v8 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  1LL,  a4);
    if (!v8)
    {
      uint64_t v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: failed to alloc wifiToggleError" message:3];
      }
LABEL_49:
      objc_autoreleasePoolPop(v9);
      v30 = 0LL;
LABEL_50:
      v13 = 0LL;
      v11 = 0LL;
LABEL_51:
      BOOL v15 = 0LL;
      goto LABEL_24;
    }
  }

  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 1LL);
    if (!self->_wifiToggleErrors)
    {
      uint64_t v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: wifiToggleErrorArray is NULL!"];
      }
      goto LABEL_49;
    }

    v8 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  1LL,  a4);
    if (!v8)
    {
      uint64_t v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: failed to alloc wifiToggleError Context" message:3];
      }
      goto LABEL_49;
    }
  }

  v30 = v8;
  -[NSMutableArray addObject:](self->_wifiToggleErrors, "addObject:", v8);
LABEL_9:
  unint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v10)
  {
    v27 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: eventDict is NULL!"];
    }
    objc_autoreleasePoolPop(v27);
    goto LABEL_50;
  }

  v11 = v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v30, "fetchSoftErrorContextData"));
  if (!v12)
  {
    v28 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: wifiToggleEventsArray is NULL" message:3];
    }
    objc_autoreleasePoolPop(v28);
    v13 = 0LL;
    goto LABEL_51;
  }

  v13 = (void *)v12;
  v14 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", Current);
  if (!v14)
  {
    v29 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Failed to alloc CurrTime" message:3];
    }
    objc_autoreleasePoolPop(v29);
    goto LABEL_51;
  }

  BOOL v15 = v14;
  if ((a3 & 0xFFFFFFF7) != 0)
  {
    if (a3 == 7 || a3 == 1)
    {
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, @"WiFiONEvent");
      [v13 addObject:v11];
      unint64_t v16 = (unint64_t)[v13 count];
      v17 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: wifiToggleEventsArray:eventsCount:%u" message:3 v16];
      }
      objc_autoreleasePoolPop(v17);
      if ((int)v16 + 0x7FFFFFFF < 0)
      {
        uint64_t v18 = (v16 - 1);
        while (1)
        {
          unint64_t v16 = (v16 - 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v18]);
          if (!v19) {
            break;
          }
          v20 = v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"WiFiOFFEvent"]);

          if (v21)
          {
            [v21 doubleValue];
            double v23 = Current - v22;
            if (v23 >= 3.0)
            {
              v25 = objc_autoreleasePoolPush();
              if (qword_100219F60) {
                [qword_100219F60 WFLog:@"Not a WiFi-Toggle: TimeDelta:%f" message:3 v23];
              }
              objc_autoreleasePoolPop(v25);
            }

            else
            {
              -[WiFiSoftErrorContext setErrorState:](v30, "setErrorState:", 2LL);
              v24 = objc_autoreleasePoolPush();
              if (qword_100219F60) {
                [qword_100219F60 WFLog:@"%s:(Soft Error):WiFi Toggle Error Detected !" message:3];
              }
              objc_autoreleasePoolPop(v24);
              -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 1LL);
              -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]( self,  "WiFiSoftErrorReporting:deviceContext:displayString:",  1LL,  a4,  0LL);
              -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:]( self,  "wifiSoftErrorMitigation:mitigationContext:",  1LL,  a4);
            }

            -[NSMutableArray removeObject:](self->_wifiToggleErrors, "removeObject:", v30);

            v30 = 0LL;
            goto LABEL_24;
          }

          --v18;
        }

        v26 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: eventRef at index:%u is NULL!" message:3 v16];
        }
        objc_autoreleasePoolPop(v26);
      }
    }
  }

  else
  {
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v14, @"WiFiOFFEvent");
    [v13 addObject:v11];
  }

- (void)wifiSoftErrorWiFiScanEventHandler:(void *)a3
{
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: Received zero scan results Event" message:3];
  }
  objc_autoreleasePoolPop(v5);
  if (self->_noNetworkFoundErrors)
  {
    uint64_t v6 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue( -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]( self,  "fetchSoftErrorContext:softErrorType:",  a3,  2LL));
    if (v6) {
      goto LABEL_13;
    }
    uint64_t v7 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  2LL,  a3);
    if (v7)
    {
      v21 = v7;
      -[NSMutableArray addObject:](self->_noNetworkFoundErrors, "addObject:", v7);
LABEL_12:
      uint64_t v6 = v21;
LABEL_13:
      double v22 = v6;
      double v23 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v6, "fetchSoftErrorContextData"));
      unint64_t v10 = objc_autoreleasePoolPush();
      if (!v23)
      {
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: noNetworksEventsArray is NULL" message:3];
        }
        objc_autoreleasePoolPop(v10);
        goto LABEL_27;
      }

      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: noNetworksEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]", v23 message];
      }
      objc_autoreleasePoolPop(v10);
      double Current = CFAbsoluteTimeGetCurrent();
      if ((unint64_t)-[WiFiSoftErrorContext count](v23, "count") > 2)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext objectAtIndex:](v23, "objectAtIndex:", 0LL));
        if (v14)
        {
          BOOL v15 = v14;
          [v14 doubleValue];
          if (Current - v16 < 60.0)
          {
            -[WiFiSoftErrorContext removeAllObjects](v23, "removeAllObjects");
            v17 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [qword_100219F60 WFLog:@"%s:(Soft Error):No Networks Found Detected !" message:3];
            }
            objc_autoreleasePoolPop(v17);
            -[WiFiSoftErrorContext setErrorState:](v22, "setErrorState:", 2LL);
            -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 2LL);
            -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]( self,  "WiFiSoftErrorReporting:deviceContext:displayString:",  2LL,  a3,  0LL);
            -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:]( self,  "wifiSoftErrorMitigation:mitigationContext:",  2LL,  a3);
            -[WiFiSoftErrorContext removeAllObjects](v23, "removeAllObjects");
            -[NSMutableArray removeObject:](self->_noNetworkFoundErrors, "removeObject:", v22);

            uint64_t v18 = v23;
            goto LABEL_28;
          }

          -[WiFiSoftErrorContext removeObjectAtIndex:](v23, "removeObjectAtIndex:", 0LL);
          v13 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", Current);

          if (v13) {
            goto LABEL_25;
          }
        }
      }

      else
      {
        uint64_t v12 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", Current);
        if (v12)
        {
          v13 = v12;
LABEL_25:
          -[WiFiSoftErrorContext addObject:](v23, "addObject:", v13);

LABEL_26:
LABEL_27:
          uint64_t v18 = v22;
LABEL_28:

          return;
        }
      }

      v19 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: numRef Null" message:3];
      }
      objc_autoreleasePoolPop(v19);
      goto LABEL_26;
    }

    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: failed to alloc wifiToggleError" message:3];
    }
  }

  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 2LL);
    if (self->_noNetworkFoundErrors)
    {
      v8 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  2LL,  a3);
      if (v8)
      {
        v21 = v8;
        -[NSMutableArray addObject:](self->_noNetworkFoundErrors, "addObject:", v8);
        uint64_t v9 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: noNetworksErrorList:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiScanEventHandler:]", self->_noNetworkFoundErrors message];
        }
        objc_autoreleasePoolPop(v9);
        goto LABEL_12;
      }

      v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: failed to allocate noNetworksError " message:3];
      }
    }

    else
    {
      v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: noNetworksErrorArray is NULL!"];
      }
    }
  }

  objc_autoreleasePoolPop(v20);
}

- (void)wifiSoftErrorWiFiAutoJoinEventHandler:(void *)a3
{
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: Received delayed AutoJoin" message:3];
  }
  objc_autoreleasePoolPop(v5);
  if (self->_autoJoinDelayErrors)
  {
    uint64_t v6 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue( -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]( self,  "fetchSoftErrorContext:softErrorType:",  a3,  4LL));
    if (v6) {
      goto LABEL_9;
    }
  }

  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 4LL);
    if (!self->_autoJoinDelayErrors)
    {
      v28 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: autoJoinDelayErrorArray is NULL!"];
      }
      goto LABEL_42;
    }
  }

  uint64_t v7 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  4LL,  a3);
  if (v7)
  {
    v30 = v7;
    -[NSMutableArray addObject:](self->_autoJoinDelayErrors, "addObject:", v7);
    uint64_t v6 = v30;
LABEL_9:
    v31 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v6, "fetchSoftErrorContextData"));
    uint64_t v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: slowAutoJoinEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorWiFiAutoJoinEventHandler:]", v8 message];
    }
    objc_autoreleasePoolPop(v9);
    double Current = CFAbsoluteTimeGetCurrent();
    -[WiFiSoftErrorContext setDetectionTime:](v31, "setDetectionTime:");
    v11 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", Current);
    if (!v11)
    {
      v27 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"numRef Null" message:3];
      }
      objc_autoreleasePoolPop(v27);

      v26 = v31;
      goto LABEL_34;
    }

    uint64_t v12 = v11;
    [v8 addObject:v11];
    if ([v8 count] == (id)10) {
      [v8 replaceObjectsInRange:0, 9, withObjectsFromArray:v8, range:1, 9];
    }
    v13 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue( -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]( self,  "fetchSoftErrorContext:softErrorType:",  a3,  1LL));
    v29 = v13;
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v13, "fetchSoftErrorContextData"));
      BOOL v15 = v14;
      if (v14 && [v14 count])
      {
        id v16 = [v15 count];
        if ((uint64_t)v16 - 1 < 0)
        {
          v21 = 0LL;
        }

        else
        {
          uint64_t v17 = (uint64_t)v16;
          while (1)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:--v17]);
            v19 = v18;
            if (v18)
            {
              uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 objectForKey:@"WiFiONEvent"]);
              if (v20) {
                break;
              }
            }

            if (v17 <= 0)
            {
              v21 = 0LL;
              goto LABEL_29;
            }
          }

          v21 = (void *)v20;

          double v22 = CFAbsoluteTimeGetCurrent();
          [v21 doubleValue];
          if (v22 - v23 < 3.0)
          {
            v24 = objc_autoreleasePoolPush();
            if (qword_100219F60) {
              [qword_100219F60 WFLog:@"%s: device was just powered on - skipping delayed auto-join detection" message:3];
            }
            objc_autoreleasePoolPop(v24);

            goto LABEL_33;
          }
        }

- (void)wifiSoftErrorRxDataStallEventHandler:(void *)a3 eventData:(void *)a4
{
  uint64_t v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"Received Rx-Data -Stall Event" message:3];
  }
  objc_autoreleasePoolPop(v7);
  if (!a3 || !a4)
  {
    v19 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceRef or data is NULL!"];
    }
    goto LABEL_36;
  }

  if (self->_rxDataStallErrors)
  {
    v8 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue( -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]( self,  "fetchSoftErrorContext:softErrorType:",  a3,  16LL));
    if (v8) {
      goto LABEL_11;
    }
  }

  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 16LL);
    if (!self->_rxDataStallErrors)
    {
      v19 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: rxDataStallErrorArray is NULL!"];
      }
      goto LABEL_36;
    }
  }

  uint64_t v9 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  16LL,  a3);
  if (v9)
  {
    double v22 = v9;
    -[NSMutableArray addObject:](self->_rxDataStallErrors, "addObject:", v9);
    v8 = v22;
LABEL_11:
    double v23 = v8;
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v8, "fetchSoftErrorContextData"));
    v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: rxDataStallEventsArray:%@", "-[WiFiSoftErrorManager wifiSoftErrorRxDataStallEventHandler:eventData:]", v10 message];
    }
    objc_autoreleasePoolPop(v11);
    uint64_t v12 = *(void *)a4;
    unsigned __int8 v13 = -[WiFiSoftErrorManager getReachabilityStatus](self, "getReachabilityStatus");
    v14 = objc_autoreleasePoolPush();
    if ((v13 & 1) != 0)
    {
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: Rx-Stall with errorCode:%lluu" message:3];
      }
      objc_autoreleasePoolPop(v14);
      double Current = CFAbsoluteTimeGetCurrent();
      -[WiFiSoftErrorContext setDetectionTime:](v23, "setDetectionTime:");
      id v16 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", Current);
      if (v16)
      {
        uint64_t v17 = v16;
        [v10 addObject:v16];
        if ([v10 count] == (id)20) {
          [v10 replaceObjectsInRange:0 withObjectsFromArray:v10 range:1];
        }
        uint64_t v18 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s:(Soft Error):RX-Data Stall Error Detected !" message:3];
        }
        objc_autoreleasePoolPop(v18);
        -[WiFiSoftErrorContext setErrorState:](v23, "setErrorState:", 2LL);
        -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 16LL);
        -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]( self,  "WiFiSoftErrorReporting:deviceContext:displayString:",  16LL,  a3,  0LL);
        -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:]( self,  "wifiSoftErrorMitigation:mitigationContext:",  16LL,  a3);

        goto LABEL_22;
      }

      v21 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: numRef Null" message:3];
      }
      uint64_t v20 = v21;
    }

    else
    {
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: Not a Rx-Stall" message:3];
      }
      uint64_t v20 = v14;
    }

    objc_autoreleasePoolPop(v20);
LABEL_22:

    return;
  }

  v19 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: failed to alloc rxDataStallError" message:3];
  }
LABEL_36:
  objc_autoreleasePoolPop(v19);
}

- (void)wifiSoftErrorTxDataStallEventHandler:(void *)a3 eventData:(void *)a4
{
  uint64_t v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: Received Tx-Data Stall Event" message:3];
  }
  objc_autoreleasePoolPop(v7);
  if (!a3 || !a4)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: deviceRef or data is NULL!"];
    }
    goto LABEL_48;
  }

  if (self->_txDataStallErrors)
  {
    v8 = (WiFiSoftErrorContext *)objc_claimAutoreleasedReturnValue( -[WiFiSoftErrorManager fetchSoftErrorContext:softErrorType:]( self,  "fetchSoftErrorContext:softErrorType:",  a3,  8LL));
    if (v8) {
      goto LABEL_11;
    }
  }

  else
  {
    -[WiFiSoftErrorManager initErrorArray:](self, "initErrorArray:", 8LL);
    if (!self->_txDataStallErrors)
    {
      v21 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: txDataStallErrorArray is NULL!"];
      }
      goto LABEL_48;
    }
  }

  uint64_t v9 = -[WiFiSoftErrorContext initWithErrorType:deviceContext:]( objc_alloc(&OBJC_CLASS___WiFiSoftErrorContext),  "initWithErrorType:deviceContext:",  8LL,  a3);
  if (!v9)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: failed to alloc txDataStallError" message:3];
    }
LABEL_48:
    objc_autoreleasePoolPop(v21);
    id v16 = 0LL;
    unint64_t v10 = 0LL;
    goto LABEL_36;
  }

  double v23 = v9;
  -[NSMutableArray addObject:](self->_txDataStallErrors, "addObject:", v9);
  v8 = v23;
LABEL_11:
  v24 = v8;
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiSoftErrorContext fetchSoftErrorContextData](v8, "fetchSoftErrorContextData"));
  if (!-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]( self,  "wifiSoftErrorTxDataStallProcessHistory:",  a4))
  {
LABEL_44:
    id v16 = 0LL;
    goto LABEL_45;
  }

  v11 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s:Tx-Stall Instance Detected" message:3];
  }
  objc_autoreleasePoolPop(v11);
  double Current = CFAbsoluteTimeGetCurrent();
  -[WiFiSoftErrorContext setDetectionTime:](v24, "setDetectionTime:");
  unsigned __int8 v13 = -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", Current);
  if (!v13)
  {
    double v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: numRef Null" message:3];
    }
    objc_autoreleasePoolPop(v22);
    goto LABEL_44;
  }

  v14 = v13;
  [v10 addObject:v13];
  if ([v10 count]) {
    -[WiFiSoftErrorManager purgeOutdatedEvents:currTime:](self, "purgeOutdatedEvents:currTime:", v10, Current);
  }
  id v15 = [v10 count];
  if ((unint64_t)v15 < 2)
  {
    id v16 = v14;
  }

  else
  {
    id v16 = (NSNumber *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);

    if (v16)
    {
      -[NSNumber doubleValue](v16, "doubleValue");
      if (Current - v17 >= 10.0)
      {
        if (-[WiFiSoftErrorManager isLQAIndicatingTxStall](self, "isLQAIndicatingTxStall"))
        {
          uint64_t v18 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"%s: TxStall Detected due to high TxPER(as per LQM)" message:3];
          }
        }

        else
        {
          unsigned __int8 v19 = -[WiFiSoftErrorManager getReachabilityStatus](self, "getReachabilityStatus");
          uint64_t v18 = objc_autoreleasePoolPush();
          if ((v19 & 1) != 0)
          {
            if (qword_100219F60) {
              [qword_100219F60 WFLog:@"%s: txStall NOT detected" message:3 "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallEventHandler:eventData:]"];
            }
            objc_autoreleasePoolPop(v18);
            goto LABEL_35;
          }

          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"%s: TxStall Detected due to Reachability Failure" message:3];
          }
        }

        objc_autoreleasePoolPop(v18);
        uint64_t v20 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s:(Soft Error):TX-Data Stall Error Detected !" message:3];
        }
        objc_autoreleasePoolPop(v20);
        -[WiFiSoftErrorContext setErrorState:](v24, "setErrorState:", 2LL);
        -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateSet:](self, "wifiSoftErrorsInProcessStateSet:", 8LL);
        -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]( self,  "WiFiSoftErrorReporting:deviceContext:displayString:",  8LL,  a3,  0LL);
        -[WiFiSoftErrorManager wifiSoftErrorMitigation:mitigationContext:]( self,  "wifiSoftErrorMitigation:mitigationContext:",  8LL,  a3);
LABEL_35:
        [v10 removeAllObjects];
        -[NSMutableArray removeObject:](self->_txDataStallErrors, "removeObject:", v24);

LABEL_36:
        v24 = 0LL;
      }
    }
  }

- (void)wifiSoftErrorWiFiTriggerDisconnectEventHandler:(void *)a3 eventData:(void *)a4
{
}

- (void)wifiSoftErrorUserDisconnectEventHandler:(void *)a3
{
}

- (void)wifiSoftErrorUnexpectedClientAssertionHandler:(void *)a3 eventData:(void *)a4
{
}

- (void)wifiSoftErrorAwdlEventNotificationHandler:(void *)a3 eventData:(void *)a4
{
  uint64_t v7 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    if (a4) {
      uint64_t v8 = *(unsigned int *)a4;
    }
    else {
      uint64_t v8 = 0LL;
    }
    [qword_100219F60 WFLog:@"%s: SoftError eventType is %u \n" message:3 v8];
  }

  objc_autoreleasePoolPop(v7);
  -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]( self,  "WiFiSoftErrorReporting:deviceContext:displayString:",  256LL,  a3,  0LL);
}

- (void)wifiSoftErrorSlowWiFiEventHandler:(void *)a3 eventData:(void *)a4
{
  uint64_t v7 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"Slow WiFi event occured\n" message:3];
  }
  objc_autoreleasePoolPop(v7);
  uint64_t v8 = sub_1000D3348((uint64_t)a3, a4);
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = sub_100095BC8(v8);
    Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
    uint64_t v12 = Mutable;
    if (Mutable) {
      BOOL v13 = v10 == 0LL;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      CFStringAppendFormat( Mutable,  0LL,  @"A slow Wi-Fi connection to “%@“ has been detected. Your response will be used to help tune our detection algorithm.",  v10);
      -[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]( self,  "WiFiSoftErrorReporting:deviceContext:displayString:",  512LL,  a3,  v12);
      CFRelease(v9);
LABEL_11:
      CFRelease(v12);
      return;
    }

    CFRelease(v9);
    if (v12) {
      goto LABEL_11;
    }
  }

- (void)WiFiSoftErrorManagerLQMEventHandler:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"RSSI"]);
    self->_primaryInterfaceRssi = (int64_t)[v5 integerValue];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"CCA"]);
    self->_primaryInterfaceCca = (int64_t)[v6 integerValue];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"SNR"]);
    self->_primaryInterfaceSnr = (int64_t)[v7 integerValue];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"TXFRAMES"]);
    self->_primaryInterfaceTxFrms[self->_primaryInterfaceStatsHistoryIdx] = [v8 unsignedIntValue];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"TXFAIL"]);
    self->_primaryInterfaceTxFail[self->_primaryInterfaceStatsHistoryIdx] = [v9 unsignedIntValue];

    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"RXFRAMES"]);
    self->_primaryInterfaceRxFrms[self->_primaryInterfaceStatsHistoryIdx] = [v10 unsignedIntValue];

    v11 = v13;
    self->_primaryInterfaceStatsHistoryIdx = (self->_primaryInterfaceStatsHistoryIdx + 1) % 5u;
  }

  else
  {
    uint64_t v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: lqmDict is NULL" message:3];
    }
    objc_autoreleasePoolPop(v12);
    v11 = 0LL;
  }
}

- (void)WiFiSoftErrorDriverAvailableEventhandler
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: Handle DriverAvailable Event: inProcessFlags:0x%0x" message:3, "-[WiFiSoftErrorManager WiFiSoftErrorDriverAvailableEventhandler]", self->_softErrorInProcessFlags];
  }
  objc_autoreleasePoolPop(v3);
  if ((self->_softErrorInProcessFlags & 2) != 0)
  {
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:](self, "wifiSoftErrorsInProcessStateUnset:", 2LL);
  }

  else
  {
    self->_softErrorInProcessFlags = 0;
    id v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: DriverAvailbale event received when not expected.Clearing inProcess State" message:3];
    }
    objc_autoreleasePoolPop(v4);
  }

- (void)WiFiSoftErrorDriverLinkupEventhandler
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"Handle Linkup/Roam Event:inProcessFlags:0x%0x" message:3,  "-[WiFiSoftErrorManager WiFiSoftErrorDriverLinkupEventhandler]",  self->_softErrorInProcessFlags];
  }
  objc_autoreleasePoolPop(v3);
  if ((self->_softErrorInProcessFlags & 8) != 0) {
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:](self, "wifiSoftErrorsInProcessStateUnset:", 8LL);
  }
}

- (void)WiFiSoftErrorReporting:(int)a3 deviceContext:(void *)a4 displayString:(__CFString *)a5
{
  if (a3 >= 0x400)
  {
    uint64_t v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: errorType Not Handled" message:3];
    }
    objc_autoreleasePoolPop(v12);
  }

  else
  {
    uint64_t v7 = *(void *)&a3;
    -[WiFiSoftErrorManager wifiSoftErrorCounterUpdate:](self, "wifiSoftErrorCounterUpdate:");
    if (!-[WiFiSoftErrorManager shouldSupressErrorReporting:](self, "shouldSupressErrorReporting:", v7))
    {
      uint64_t v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: _isInternalBuild:%u _isReportingDisabled:%u supressTapToRadar:%u",  "-[WiFiSoftErrorManager WiFiSoftErrorReporting:deviceContext:displayString:]",  self->_isInternalBuild,  self->_isReportingDisabled,  -[WiFiSoftErrorManager supressTapToRadar:deviceContext:](self, "supressTapToRadar:deviceContext:", v7, a4));
      }
      objc_autoreleasePoolPop(v9);
      if (!self->_isInternalBuild
        || self->_isReportingDisabled
        || -[WiFiSoftErrorManager supressTapToRadar:deviceContext:](self, "supressTapToRadar:deviceContext:", v7, a4))
      {
        unint64_t v10 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: Supressed TapToRadar:errorType:%u !" message:3 v7];
        }
        objc_autoreleasePoolPop(v10);
      }

      else
      {
        v15[0] = 0LL;
        v15[1] = v15;
        v15[2] = 0x2020000000LL;
        unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
        if (a5) {
          CFTypeRef v11 = CFRetain(a5);
        }
        else {
          CFTypeRef v11 = 0LL;
        }
        unint64_t v16 = (unint64_t)v11;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000DCC0;
        block[3] = &unk_1001E2880;
        int v14 = v7;
        block[6] = a5;
        block[7] = a4;
        block[4] = self;
        block[5] = v15;
        dispatch_async((dispatch_queue_t)qword_100219F80, block);
        _Block_object_dispose(v15, 8);
      }

      if ((_DWORD)v7 == 64 || (_DWORD)v7 == 32) {
        self->_lastReportedDisconnect = CFAbsoluteTimeGetCurrent();
      }
      else {
        self->_lastReportedSoftErrorTs = CFAbsoluteTimeGetCurrent();
      }
    }
  }

- (void)wifiSoftErrorMitigation:(int)a3 mitigationContext:(void *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (-[WiFiSoftErrorManager isEventMitigationEnabled:](self, "isEventMitigationEnabled:"))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000DE28;
    block[3] = &unk_1001E28A8;
    int v10 = v5;
    block[4] = self;
    block[5] = a4;
    dispatch_async(queue, block);
  }

  else
  {
    -[WiFiSoftErrorManager wifiSoftErrorsInProcessStateUnset:](self, "wifiSoftErrorsInProcessStateUnset:", v5);
    uint64_t v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: mitigation is supressed for SoftError:%u" message:3 v5];
    }
    objc_autoreleasePoolPop(v8);
  }

- (void)wifiSoftErrorCounterUpdate:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 > 31)
  {
    if (a3 > 255)
    {
      if (a3 == 256)
      {
        ++self->_errorCounters.awdlSoftErrorCount;
        return;
      }

      if (a3 == 512)
      {
        ++self->_errorCounters.slowWiFiErrorCount;
        return;
      }
    }

    else
    {
      if (a3 == 32)
      {
        ++self->_errorCounters.triggerDisconnectCount;
        return;
      }

      if (a3 == 64)
      {
        ++self->_errorCounters.userDisconnectCount;
        return;
      }
    }

- (void)wifiSoftErrorUserConfirmationFlagSetting:(int)a3 forError:(int)a4 withDeviceContext:(void *)a5
{
  self->_errorCounters.lastSoftErrorUserFeedbk = a3;
  if (a3 != -1 && a4 == 512) {
    sub_1000F2110((uint64_t)a5, a3 == 1);
  }
}

- (void)wifiSoftErrorUserConfirmationUpdate:(int)a3 withDeviceContext:(void *)a4
{
  uint64_t v4 = *(void *)&a3;
  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:",  1LL,  *(void *)&a3,  a4);
  if ((int)v4 > 31)
  {
    if ((int)v4 > 255)
    {
      if ((_DWORD)v4 == 256)
      {
        ++self->_errorCounters.awdlSoftErrorCount;
        return;
      }

      if ((_DWORD)v4 == 512)
      {
        ++self->_errorCounters.slowWiFiUserConfirmCount;
        return;
      }
    }

    else
    {
      if ((_DWORD)v4 == 32)
      {
        ++self->_errorCounters.triggerDisconnectUserConfirmCount;
        return;
      }

      if ((_DWORD)v4 == 64)
      {
        ++self->_errorCounters.UserDisconnectUserConfirmCount;
        return;
      }
    }

- (softErrorCounters)getErrorCounters
{
  return &self->_errorCounters;
}

- (BOOL)wifiSoftErrorTxDataStallProcessHistory:(__CFDictionary *)a3
{
  unsigned int valuePtr = 0;
  double v17 = 0LL;
  value = 0LL;
  memset(v24, 0, 48);
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  if (a3)
  {
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_COUNT", (const void **)&value) && value)
    {
      CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
      uint64_t v5 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: Number of RateSeries Present:%u" message:3 valuePtr];
      }
      objc_autoreleasePoolPop(v5);
    }

    uint64_t v6 = 0LL;
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_LEGACY_RATES", (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]( self,  "populateTxFailHistory:failureHistoryArray:historyArraySz:",  v17,  v24,  12LL);
      uint64_t v7 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: Legacy Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      objc_autoreleasePoolPop(v7);
      uint64_t v6 = v24;
    }

    uint64_t v8 = 0LL;
    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11N_1SS", (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]( self,  "populateTxFailHistory:failureHistoryArray:historyArraySz:",  v17,  v23,  12LL);
      uint64_t v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: 11n 1SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      objc_autoreleasePoolPop(v9);
      uint64_t v6 = v23;
      uint64_t v8 = 1LL;
    }

    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11N_2SS", (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]( self,  "populateTxFailHistory:failureHistoryArray:historyArraySz:",  v17,  v22,  12LL);
      int v10 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: 11N 2SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      objc_autoreleasePoolPop(v10);
      uint64_t v6 = v22;
      uint64_t v8 = 1LL;
    }

    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11AC_1SS", (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]( self,  "populateTxFailHistory:failureHistoryArray:historyArraySz:",  v17,  v21,  12LL);
      CFTypeRef v11 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: 11AC 1SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      objc_autoreleasePoolPop(v11);
      uint64_t v6 = v21;
      uint64_t v8 = 1LL;
    }

    if (CFDictionaryGetValueIfPresent(a3, @"TX_FAILURE_PHYRATE_SERIES_11AC_2SS", (const void **)&v17) && v17)
    {
      -[WiFiSoftErrorManager populateTxFailHistory:failureHistoryArray:historyArraySz:]( self,  "populateTxFailHistory:failureHistoryArray:historyArraySz:",  v17,  v20,  12LL);
      uint64_t v12 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: 11AC 2SS Rates TxFail History RateSeries:%@", "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]", v17 message];
      }
      objc_autoreleasePoolPop(v12);
      uint64_t v6 = v20;
      uint64_t v8 = 1LL;
    }

    BOOL v13 = -[WiFiSoftErrorManager isTxStalled:rateType:size:](self, "isTxStalled:rateType:size:", v6, v8, 12LL);
    if (v13)
    {
      int v14 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"Possible Tx-Stall" message:3];
      }
      objc_autoreleasePoolPop(v14);
      LOBYTE(v13) = 1;
    }
  }

  else
  {
    id v15 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s:txFailHistoryDictionary is NULL" message:3 "-[WiFiSoftErrorManager wifiSoftErrorTxDataStallProcessHistory:]"];
    }
    objc_autoreleasePoolPop(v15);
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)isTxStalled:(unsigned int *)a3 rateType:(unsigned __int8)a4 size:(unsigned int)a5
{
  if (a3 && a5)
  {
    unint64_t v5 = 0LL;
    unsigned int v6 = 0;
    unsigned int v7 = 0;
    do
    {
      unsigned int v8 = a3[v5];
      if (v5 >= 9) {
        unsigned int v9 = 0;
      }
      else {
        unsigned int v9 = a3[v5];
      }
      if (v5) {
        unsigned int v10 = 0;
      }
      else {
        unsigned int v10 = *a3;
      }
      if (a4) {
        unsigned int v9 = v10;
      }
      unsigned int v11 = v9 + v6;
      if (v8)
      {
        v7 += v8;
        unsigned int v6 = v11;
      }

      ++v5;
    }

    while (a5 != v5);
    if (v7) {
      double v12 = (float)(v6 / v7);
    }
    else {
      double v12 = 0.0;
    }
    BOOL v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"-[WiFiSoftErrorManager isTxStalled:rateType:size:]" message:3, "%s: failureRatio:%f", "-[WiFiSoftErrorManager isTxStalled:rateType:size:]", *(void *)&v12];
    }
    objc_autoreleasePoolPop(v13);
    if (v12 > 0.7) {
      return 1;
    }
  }

  else
  {
    id v15 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Bad params!"];
    }
    objc_autoreleasePoolPop(v15);
  }

  return 0;
}

- (void)populateTxFailHistory:(__CFArray *)a3 failureHistoryArray:(unsigned int *)a4 historyArraySz:(unsigned int)a5
{
  if (CFArrayGetCount(a3) >= a5) {
    uint64_t Count = a5;
  }
  else {
    uint64_t Count = CFArrayGetCount(a3);
  }
  if (a3 && a4 && a5)
  {
    if (Count >= 1)
    {
      for (CFIndex i = 0LL; i != Count; ++i)
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a3, i);
        if (ValueAtIndex) {
          CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, a4);
        }
        ++a4;
      }
    }
  }

  else
  {
    unsigned int v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: Failure History params are invalid" message:3];
    }
    objc_autoreleasePoolPop(v11);
  }

- (BOOL)shouldSupressErrorReporting:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 64 || a3 == 32)
  {
    p_lastReportedDisconnect = &self->_lastReportedDisconnect;
    double reportingTimeout = 82800.0;
  }

  else
  {
    p_lastReportedDisconnect = &self->_lastReportedSoftErrorTs;
    double reportingTimeout = self->_reportingTimeout;
  }

  if ((a3 - 1) <= 0x3F && ((1LL << (a3 - 1)) & 0x8000000080000001LL) != 0)
  {
    unsigned int v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Suppressing softerror (%u) reporting" message:3 v3, v10, v11];
    }
LABEL_9:
    objc_autoreleasePoolPop(v6);
    return 1;
  }

  double v8 = *p_lastReportedDisconnect;
  double v9 = CFAbsoluteTimeGetCurrent() - v8;
  if (v9 < reportingTimeout)
  {
    unsigned int v6 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s:Rate-Limiting-dropping this(%u) SoftError. TimeDelta:(%f)secs" message:3 v3 *(void *)&v9];
    }
    goto LABEL_9;
  }

  return 0;
}

- (BOOL)askToLaunchTapToRadar:(int)a3
{
  CFOptionFlags v11 = 0LL;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  if (Mutable)
  {
    unint64_t v5 = Mutable;
    if (a3 == 4) {
      unsigned int v6 = @"Did you manually disconnect from this network?";
    }
    else {
      unsigned int v6 = @"Seeing WiFi Problems?";
    }
    if (a3 == 4) {
      unsigned int v7 = @"If not, please file a radar.";
    }
    else {
      unsigned int v7 = @"File a radar now?";
    }
    CFStringAppend(Mutable, v6);
    CFUserNotificationDisplayAlert(0.0, 0LL, 0LL, 0LL, 0LL, v5, v7, @"Dismiss", @"Radar", 0LL, &v11);
    BOOL v8 = (v11 & 3) != 0;
    CFRelease(v5);
  }

  else
  {
    uint64_t v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"-[WiFiSoftErrorManager askToLaunchTapToRadar:] failed to alloc string"];
    }
    objc_autoreleasePoolPop(v10);
    return 1;
  }

  return v8;
}

- (BOOL)askToLaunchTriggerDisconnectRadar:(__CFString *)a3
{
  CFOptionFlags v4 = 0LL;
  CFUserNotificationDisplayAlert( 0.0,  0LL,  0LL,  0LL,  0LL,  a3,  @"If WiFi was usable, please file radar",  @"Dismiss",  @"Radar",  0LL,  &v4);
  return (v4 & 3) != 0;
}

- (BOOL)askToLaunchSlowWiFiRadar:(__CFString *)a3
{
  CFOptionFlags v4 = 0LL;
  CFUserNotificationDisplayAlert( 0.0,  0LL,  0LL,  0LL,  0LL,  @"[Internal Only]",  a3,  @"Slow, File Radar",  @"Not Slow",  0LL,  &v4);
  return (v4 & 3) == 0;
}

- (BOOL)askToLaunchUserDisconnectRadar
{
  CFOptionFlags v3 = 0LL;
  CFUserNotificationDisplayAlert( 0.0,  0LL,  0LL,  0LL,  0LL,  @"User Disconnected from WiFi",  @"Seeing WiFi problems?",  @"Dismiss",  @"Radar",  0LL,  &v3);
  return (v3 & 3) != 0;
}

- (void)launchTapToRadar:(int)a3 displayString:(__CFString *)a4 deviceContext:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:",  0xFFFFFFFFLL,  *(void *)&a3);
  if ((int)v7 <= 31)
  {
    if ((_DWORD)v7 == 8)
    {
      if ([(id)qword_100219F60 getLogLevelEnable] == (id)1) {
        sub_10013EDC0("softerror.tx_datapath_stall");
      }
      -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:",  8LL,  a5);
LABEL_21:
      double v9 = @"tap-to-radar://new?Title=WiFi%20Tx%20Data%20Stall%20Problem&AutoDiagnostics=phone&Description=Not%20able%20to%20browse%20over%20WiFi%29%20Please%20provide%20following%20feedback%20%20-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20User%20activity%20during%20this%20period%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
      goto LABEL_22;
    }

    if ((_DWORD)v7 == 16)
    {
      if ([(id)qword_100219F60 getLogLevelEnable] == (id)1) {
        sub_10013EDC0("softerror.rx_datapath.stall");
      }
      -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:",  16LL,  a5);
      double v9 = @"tap-to-radar://new?Title=WiFi%20Rx%20Data%20Stall%20Problem&AutoDiagnostics=phone&Description=Not%20able%20to%20browse%20over%20WiFi&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
      goto LABEL_22;
    }
  }

  else
  {
    switch((_DWORD)v7)
    {
      case 0x200:
        if (-[WiFiSoftErrorManager askToLaunchSlowWiFiRadar:](self, "askToLaunchSlowWiFiRadar:", a4))
        {
          -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:",  512LL,  a5);
          uint64_t v10 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"SlowWiFi tap URL" message:3 "%s:SlowWiFi tap URL" "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]"];
          }
          objc_autoreleasePoolPop(v10);
          double v9 = @"tap-to-radar://new?Title=Slow%20WiFi%20detected&AutoDiagnostics=phone&Description=Please%20describe%20user%20activity%3A%0A%0AAt%20the%20time%20of%20Slow%20Wi-Fi%20error%20pop-up%2C%20were%20you%20observing%20any%20degraded%20wifi%20performance%3F%20%5BYes%2FNo%2FUnsure%5D%3A%0A%0AAfter%20selecting%20%E2%80%98Slow%2C%20File%20Radar%E2%80%99%20in%20the%20pop-up%2C%20was%20there%20any%20perceivable%20change%20in%20Wi-Fi%20performance%3F%20%5BYes%2FNo%2FUnsure%5D%3A%0A%0AAre%20you%20currently%20at%20home%2C%20office%20or%20other%20location%3F%0A%0A%20%20-If%20other%20location%2C%20please%20provide%20some%20details%20like%20Starbucks%2C%20Hotel%20captive%20network%2C%20etc%E2%80%A6%0A%0A%20%20-If%20at%20home%3A%0A%20%20%20%20-What%20is%20the%20make%20and%20model%20of%20the%20router%3F%0A%0A%20%20%20%20-Is%20the%20router%20at%20home%20surrounded%20by%20other%20electronic%20devices%20i.e.%20susceptible%20to%20RF%20interference%20or%20any%20obstacles%20strongly%20blocking%20RF%20signal%20%3F&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
          goto LABEL_22;
        }

        int v14 = self;
        uint64_t v15 = 512LL;
LABEL_37:
        -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:]( v14,  "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:",  0LL,  v15,  a5);
        BOOL v13 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s:User-Cancelled Filing TD Radar" message:3];
        }
LABEL_34:
        objc_autoreleasePoolPop(v13);
        return;
      case 0x40:
        if (!-[WiFiSoftErrorManager askToLaunchUserDisconnectRadar](self, "askToLaunchUserDisconnectRadar"))
        {
          -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:",  0LL,  64LL,  a5);
          BOOL v13 = objc_autoreleasePoolPush();
          if (qword_100219F60) {
            [qword_100219F60 WFLog:@"%s:User-Cancelled Filing UD Radar" message:3];
          }
          goto LABEL_34;
        }

        -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:",  64LL,  a5);
        double v9 = @"tap-to-radar://new?Title=WiFi%20User%20Disconnect%20From%20Network&AutoDiagnostics=phone&Description=Please%20provide%20feedback%20on%20following-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20You%20dont%20want%20WiFi%20to%20connect%20to%20this%20network%20%28yes%2Fno%29%20-%0A3.%20Did%20WiFi%20happen%20to%20rejoin%20again%20%28yes%2Fno%29%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug";
        goto LABEL_22;
      case 0x20:
        if (-[WiFiSoftErrorManager askToLaunchTriggerDisconnectRadar:](self, "askToLaunchTriggerDisconnectRadar:", a4))
        {
          -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:",  32LL,  a5);
          double v9 = @"tap-to-radar://new?Title=WiFi%20Trigger%20Disconnected%20too%20early&AutoDiagnostics=phone&Description=Please%20provide%20following%20feedback%20%20-%0A1.%20Are%20you%20seeing%20poor%20wifi%20connectivity%20%28yes%2Fno%29%20-%0A2.%20Do%20you%20expect%20wifi%20to%20be%20connected%20%28yes%2Fno%29%20-%0A3.%20User%20activity%20during%20this%20period%20-&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
          goto LABEL_22;
        }

        int v14 = self;
        uint64_t v15 = 32LL;
        goto LABEL_37;
    }
  }

  if (!-[WiFiSoftErrorManager askToLaunchTapToRadar:](self, "askToLaunchTapToRadar:", v7))
  {
    -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationFlagSetting:forError:withDeviceContext:",  0LL,  v7,  a5);
    BOOL v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s:User-Cancelled Filing Radar" message:3];
    }
    goto LABEL_34;
  }

  -[WiFiSoftErrorManager wifiSoftErrorUserConfirmationUpdate:withDeviceContext:]( self,  "wifiSoftErrorUserConfirmationUpdate:withDeviceContext:",  v7,  a5);
  if ((int)v7 <= 15)
  {
    double v9 = @"tap-to-radar://new?Title=WiFi%20Toggle%20Problem&AutoDiagnostics=phone&Description=WiFi%20doesn't%20seem%20to%20work&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
    switch((int)v7)
    {
      case 1:
        goto LABEL_22;
      case 2:
        double v9 = @"tap-to-radar://new?Title=No%20WiFi%20Networks%20Found%20Problem&AutoDiagnostics=phone&Description=I%20am%20not%20seeing%20any%20WiFi%20Networks%20On%20WiFi-Setting%20Page&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
        goto LABEL_22;
      case 4:
        double v9 = @"tap-to-radar://new?Title=Slow%20AutoJoin%20Problem&AutoDiagnostics=phone&Description=WiFi%20is%20taking%20too%20long%20to%20connect%20to%20my%20known%20Network&ComponentID=607679&ComponentName=WiFi%20Policy&ComponentVersion=iOS&Classification=Other%20Bug&ExtensionIdentifiers=com.apple.DiagnosticExtensions.WiFi";
        goto LABEL_22;
      case 8:
        goto LABEL_21;
      default:
        goto LABEL_32;
    }
  }

  if ((_DWORD)v7 != 256)
  {
LABEL_32:
    BOOL v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: UnKnown Soft-Error Type\n" message:3 "-[WiFiSoftErrorManager launchTapToRadar:displayString:deviceContext:]"];
    }
    goto LABEL_34;
  }

  double v9 = @"tap-to-radar://new?Title=WiFi%20Awdl%20Issues&AutoDiagnostics=phone&Description=Please%20provide%20feedback%20on%20following-%0A1.%20Which%20application%20are%20you%20running%29%20-%0A2.%20Did%20you%20see%20any%20performance%20issue%29%20-&ComponentID=482277&ComponentName=WiFi%20AWDL&ComponentVersion=iOS&Classification=Other%20Bug";
LABEL_22:
  uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));
  if (v11)
  {
    id v16 = (id)v11;
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v12 openURL:v16];
  }

- (void)purgeOutdatedEvents:(id)a3 currTime:(double)a4
{
  id v15 = a3;
  if (!v15)
  {
    int v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: txStallEvents Array is NULL" message:3];
    }
    goto LABEL_18;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  if (!v5)
  {
    int v14 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: outdatedEvents allocation failed" message:3];
    }
LABEL_18:
    objc_autoreleasePoolPop(v14);
    goto LABEL_13;
  }

  unsigned int v6 = (void *)v5;
  uint64_t v7 = (char *)[v15 count];
  if (v7)
  {
    BOOL v8 = v7;
    for (CFIndex i = 0LL; i != v8; ++i)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:i]);
      uint64_t v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        if (v12 != 0.0 && a4 - v12 > 15.0) {
          [v6 addIndex:i];
        }
      }
    }
  }

  [v15 removeObjectsAtIndexes:v6];

LABEL_13:
}

- (BOOL)isLQAIndicatingTxStall
{
  int v2 = self->_primaryInterfaceStatsHistoryIdx + 4;
  unsigned int v3 = v2 - 5 * ((13108 * v2) >> 16);
  CFOptionFlags v4 = (char *)self + 4 * (unsigned __int16)(v2 - 5 * ((13108 * v2) >> 16));
  uint64_t v5 = *((unsigned int *)v4 + 81);
  uint64_t v6 = *((unsigned int *)v4 + 76);
  double v7 = 0.0;
  if ((_DWORD)v6) {
    BOOL v8 = (_DWORD)v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    double v7 = (float)((float)v6 / (float)v5);
  }
  double v9 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: lastLqaStatsRdIdx:%u lastSampleStats txFrms:%u txFails:%u txPer:%f" message:3 "-[WiFiSoftErrorManager isLQAIndicatingTxStall]" lastLqaStatsRdIdx:v3 lastSampleStats:v5 txFrms:v6 txFails:v7 txPer:v7];
  }
  objc_autoreleasePoolPop(v9);
  return v7 > 0.5;
}

- (BOOL)getReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  *(void *)&address.sa_data[6] = 0LL;
  *(void *)&address.sa_len = 528LL;
  int v2 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (SCNetworkReachabilityGetFlags(v2, &flags)) {
    BOOL v3 = flags == 0;
  }
  else {
    BOOL v3 = 1;
  }
  BOOL v4 = !v3;
  if (!v3)
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: NetworkReachabilityFlags :0x%0x" message:3 flags];
    }
    objc_autoreleasePoolPop(v5);
  }

  uint64_t v6 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    double v7 = "NO";
    if (v4) {
      double v7 = "YES";
    }
    [qword_100219F60 WFLog:@"%s: Internet Reachability Status :%s" message:3, "-[WiFiSoftErrorManager getReachabilityStatus]", v7];
  }

  objc_autoreleasePoolPop(v6);
  if (v2) {
    CFRelease(v2);
  }
  return v4;
}

- (BOOL)supressTapToRadar:(int)a3 deviceContext:(void *)a4
{
  BOOL v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: Supress TapToRadar on Non-iOS platform" message:3];
  }
  objc_autoreleasePoolPop(v4);
  return 1;
}

- (BOOL)supressEventDetectionProcesssing:(int)a3 deviceContext:(void *)a4
{
  if ((a3 & 0xFFFFFFFE) != 4) {
    return 0;
  }
  if (a4) {
    return (int)sub_1000EE760((uint64_t)a4) < -70;
  }
  uint64_t v5 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"%s: deviceManagerRef is NULL!"];
  }
  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)initEventMitigation
{
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[4] = 0u;
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[6] = 0u;
  *(_OWORD *)self->_mitigationInfo.lastMitigationTime = 0u;
  *(_OWORD *)&self->_mitigationInfo.lastMitigationTime[2] = 0u;
  *(_OWORD *)self->_mitigationInfo.mitigationAttemptuint64_t Count = 0u;
  *(_OWORD *)&self->_mitigationInfo.mitigationAttemptCount[4] = 0u;
  -[WiFiSoftErrorManager enableSoftErrorMitigation:](self, "enableSoftErrorMitigation:", 2LL);
  -[WiFiSoftErrorManager enableSoftErrorMitigation:](self, "enableSoftErrorMitigation:", 8LL);
}

- (void)enableSoftErrorMitigation:(int)a3
{
  unsigned int v4 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:", *(void *)&a3);
  if (v4 >= 7)
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Invalid softError Type" message:3];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    self->_mitigationInfo.mitigationAllowedFlag[v4] = 1;
  }

- (void)supressSoftErrorMitigation:(int)a3
{
  unsigned int v4 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:", *(void *)&a3);
  if (v4 >= 7)
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Invalid softError Type" message:3];
    }
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    self->_mitigationInfo.mitigationAllowedFlag[v4] = 0;
  }

- (BOOL)isEventMitigationEnabled:(int)a3
{
  unsigned int v5 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:");
  if (v5 >= 7)
  {
    double v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Invalid softError Type" message:3];
    }
    objc_autoreleasePoolPop(v7);
  }

  else
  {
    if (a3 == 8) {
      return 1;
    }
    if (a3 == 2) {
      return self->_mitigationInfo.mitigationAllowedFlag[v5];
    }
  }

  return 0;
}

- (void)recordMitigation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unsigned int v6 = -[WiFiSoftErrorManager softErrorTypeIndex:](self, "softErrorTypeIndex:", v3);
  if (v6 >= 7)
  {
    double v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"Invalid softError Type" message:3 v10 v11];
    }
  }

  else
  {
    unsigned int v7 = v6;
    p_mitigationInfo = &self->_mitigationInfo;
    self->_mitigationInfo.lastMitigationTime[v6] = Current;
    ++self->_mitigationInfo.mitigationAttemptCount[v6];
    if ((_DWORD)v3 == 2) {
      -[WiFiSoftErrorManager supressSoftErrorMitigation:](self, "supressSoftErrorMitigation:", 2LL);
    }
    double v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s: recording mitigationAttempt Count:(%u) for SoftError:%u" message:3, "-[WiFiSoftErrorManager recordMitigation:]", p_mitigationInfo->mitigationAttemptCount[v7], v3];
    }
  }

  objc_autoreleasePoolPop(v9);
}

- (unsigned)softErrorTypeIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        return 4;
      case 32:
        return 5;
      case 64:
        return 6;
      default:
LABEL_12:
        unsigned int v5 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [qword_100219F60 WFLog:@"%s: Invalid softErrorType:%u" message:3, "-[WiFiSoftErrorManager softErrorTypeIndex:]", v3];
        }
        objc_autoreleasePoolPop(v5);
        return 255;
    }
  }

  else
  {
    unsigned int result = 0;
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        unsigned int result = 1;
        break;
      case 4:
        unsigned int result = 2;
        break;
      case 8:
        unsigned int result = 3;
        break;
      default:
        goto LABEL_12;
    }
  }

  return result;
}

- (id)copySoftErrorEventDescription:(int)a3
{
  else {
    return off_1001E28F0[a3];
  }
}

- (void).cxx_destruct
{
}

@end