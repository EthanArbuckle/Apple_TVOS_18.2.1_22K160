@interface WiFiRoamManager
+ (id)sharedWiFiRoamManager;
+ (id)stringRepresentationWithHostReason:(int64_t)a3;
+ (id)stringRepresentationWithReason:(unsigned int)a3;
+ (id)stringRepresentationWithStatus:(unsigned int)a3;
- (BOOL)allowRoam;
- (BOOL)awdlRealTimeModeActive;
- (BOOL)canSubmitMetrics;
- (BOOL)detectLateRoam;
- (BOOL)deviceStationary;
- (BOOL)ipAddrAssigned;
- (BOOL)isLastRoamDueToBeaconLost;
- (BOOL)isRoamLateDueToDelta;
- (BOOL)roamWithReason:(unint64_t)a3 bandPreference:(int)a4;
- (NSDictionary)roamPrep;
- (NSDictionary)roamScanStart;
- (NSDictionary)roamState;
- (NSDictionary)roamStatus;
- (NSMutableArray)previousRoams;
- (WiFiRoamManager)init;
- (double)btStateChangeTimestamp;
- (double)lastRoamAttemptTimestamp;
- (double)lastRoamStatusFailedNoCandidateTs;
- (double)lastRoamSuppressionRemovalTime;
- (double)linkUpTimestamp;
- (double)paramMinRoamRetryWaitTime;
- (double)paramMinRoamWaitTimeFromLinkUpInSec;
- (double)paramWindowSizeInSec;
- (double)roamScanEndTimestamp;
- (double)roamScanStartTimestamp;
- (double)windowTimestamp;
- (id)copyRoamStatus;
- (int64_t)bssEnvironment;
- (int64_t)btState;
- (int64_t)btType;
- (int64_t)currentBand;
- (int64_t)lastHostTriggeredRoamReason;
- (int64_t)maxRssiDeltaInRoamCache;
- (int64_t)minRssiDeltaInRoamCache;
- (int64_t)paramMaxRoamRetriesInWindow;
- (int64_t)roamAttemptCount;
- (unint64_t)detectPingPong;
- (unint64_t)pingPongNth;
- (unsigned)stateFlags;
- (void)dealloc;
- (void)reset;
- (void)resetPingPong;
- (void)setAwdlRealTimeModeActive:(BOOL)a3;
- (void)setBTState:(int64_t)a3 type:(int64_t)a4;
- (void)setBssEnvironment:(int64_t)a3;
- (void)setBtState:(int64_t)a3;
- (void)setBtStateChangeTimestamp:(double)a3;
- (void)setBtType:(int64_t)a3;
- (void)setCurrentBand:(int64_t)a3;
- (void)setDeviceMotionState:(int)a3;
- (void)setDeviceStationary:(BOOL)a3;
- (void)setIpAddrAssigned:(BOOL)a3;
- (void)setIsRoamLateDueToDelta:(BOOL)a3;
- (void)setLastHostTriggeredRoamReason:(int64_t)a3;
- (void)setLastRoamAttemptTimestamp:(double)a3;
- (void)setLastRoamStatusFailedNoCandidateTs:(double)a3;
- (void)setLastRoamSuppressionRemovalTime:(double)a3;
- (void)setLinkDown;
- (void)setLinkUpTimestamp:(double)a3;
- (void)setLinkUpWithBSSEnvironment:(int64_t)a3 band:(int64_t)a4 roam:(BOOL)a5 inCharging:(BOOL)a6 motionState:(int)a7;
- (void)setMaxRssiDeltaInRoamCache:(int64_t)a3;
- (void)setMinRssiDeltaInRoamCache:(int64_t)a3;
- (void)setParamMaxRoamRetriesInWindow:(int64_t)a3;
- (void)setParamMinRoamRetryWaitTime:(double)a3;
- (void)setParamMinRoamWaitTimeFromLinkUpInSec:(double)a3;
- (void)setParamWindowSizeInSec:(double)a3;
- (void)setPingPongNth:(unint64_t)a3;
- (void)setPreviousRoams:(id)a3;
- (void)setRoamAttemptCount:(int64_t)a3;
- (void)setRoamEndState:(id)a3 forInterface:(id)a4;
- (void)setRoamPrep:(id)a3;
- (void)setRoamPrep:(id)a3 forInterface:(id)a4;
- (void)setRoamScanEndTimestamp:(double)a3;
- (void)setRoamScanStart:(id)a3;
- (void)setRoamScanStartTimestamp:(double)a3;
- (void)setRoamStart:(id)a3 forInterface:(id)a4;
- (void)setRoamStatus:(id)a3;
- (void)setRoamStatus:(id)a3 withBeaconCache:(id)a4 forInterface:(id)a5;
- (void)setStateFlags:(unsigned __int8)a3;
- (void)setWindowTimestamp:(double)a3;
@end

@implementation WiFiRoamManager

+ (id)sharedWiFiRoamManager
{
  v3 = (void *)objc_opt_class(&OBJC_CLASS___WiFiRoamManager, a2);
  objc_sync_enter(v3);
  id v4 = (id)qword_1002197F8;
  if (!qword_1002197F8)
  {
    id v4 = objc_alloc_init((Class)a1);
    qword_1002197F8 = (uint64_t)v4;
  }

  objc_sync_exit(v3);
  return v4;
}

- (WiFiRoamManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiRoamManager;
  v2 = -[WiFiRoamManager init](&v10, "init");
  v3 = (WiFiRoamManager *)v2;
  if (v2)
  {
    v2[8] = 0;
    *((void *)v2 + 3) = 0LL;
    *((void *)v2 + 4) = 0LL;
    *((void *)v2 + 2) = 0LL;
    *((void *)v2 + 9) = 0LL;
    *((void *)v2 + 10) = 0LL;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *(_OWORD *)(v2 + 168) = 0u;
    *(_OWORD *)(v2 + 184) = 0u;
    *(_OWORD *)(v2 + 200) = 0u;
    __asm { FMOV            V0.2D, #10.0 }

    *(_OWORD *)(v2 + 40) = _Q0;
    *((void *)v2 + 7) = 3LL;
    *((void *)v2 + 8) = 0x405E000000000000LL;
    *(_DWORD *)(v2 + 9) = 0;
    *((void *)v2 + 11) = 0LL;
    *((void *)v2 + 12) = 0LL;
    *((void *)v2 + 27) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3->_pingPongNth = 0LL;
  }

  qword_1002197F8 = (uint64_t)v3;
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiRoamManager;
  -[WiFiRoamManager dealloc](&v3, "dealloc");
}

- (void)setRoamStart:(id)a3 forInterface:(id)a4
{
  v7 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 1) == 0)
  {
    -[WiFiRoamManager setStateFlags:]( self,  "setStateFlags:",  -[WiFiRoamManager stateFlags](self, "stateFlags") | 1);
    roamScanStart = self->_roamScanStart;
    if (roamScanStart) {

    }
    self->_roamScanStart = (NSDictionary *)[a3 copy];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_roamScanStartTimestamp = v9;
    self->_roamScanEndTimestamp = 0.0;
    self->_isRoamLateDueToDelta = 0;
    self->_minRssiDeltaInRoamCache = 0LL;
    self->_maxRssiDeltaInRoamCache = 0LL;
    id v10 = -[NSDictionary objectForKey:](self->_roamScanStart, "objectForKey:", @"ROAM_LAST_STATUS");
    id v11 = -[NSDictionary objectForKey:](self->_roamScanStart, "objectForKey:", @"ROAM_SCAN_REASON");
    v12 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Status:%u Reason:%d (%@)", "-[WiFiRoamManager setRoamStart:forInterface:]", (unint64_t)objc_msgSend(v10, "unsignedIntValue") & 0x1FF, (unint64_t)objc_msgSend(v11, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithReason:]( WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v11, "unsignedIntValue")) message];
    }
    objc_autoreleasePoolPop(v12);
    -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:]( +[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"),  "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:",  1,  [v11 unsignedIntValue],  +[WiFiRoamManager stringRepresentationWithReason:]( WiFiRoamManager,  "stringRepresentationWithReason:",  objc_msgSend(v11, "unsignedIntValue")),  objc_msgSend(v10, "unsignedIntValue"),  +[WiFiRoamManager stringRepresentationWithStatus:]( WiFiRoamManager,  "stringRepresentationWithStatus:",  objc_msgSend(v10, "unsignedIntValue")),  0,  self->_roamScanStart,  0,  a4);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)setRoamEndState:(id)a3 forInterface:(id)a4
{
  v7 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 2) == 0)
  {
    id v32 = a4;
    -[WiFiRoamManager setStateFlags:]( self,  "setStateFlags:",  -[WiFiRoamManager stateFlags](self, "stateFlags") | 2);
    roamState = self->_roamState;
    if (roamState) {

    }
    self->_roamState = (NSDictionary *)[a3 copy];
    id v36 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
    v34 = self;
    id v9 = -[NSDictionary objectForKey:](self->_roamState, "objectForKey:", @"ROAM_CACHE");
    id v31 = [v9 count];
    id obj = v9;
    if (v9)
    {
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v38;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v38 != v12) {
              objc_enumerationMutation(obj);
            }
            [v36 appendFormat:@" {%@, %@, %@, %@} ", objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)i), "objectForKey:", @"BSSID"), objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)i), "objectForKey:", @"RSSI"), objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)i), "objectForKey:", @"CHANNEL"), objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * (void)i), "objectForKey:", @"CHANNEL_FLAGS")];
          }

          id v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }

        while (v11);
      }
    }

    v14 = self;
    id v33 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAM_LAST_STATUS");
    id v15 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAM_SCAN_REASON");
    id v16 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_FLAGS");
    id v17 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_TIME_STARTED");
    id v30 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_TIME_ENDED");
    v18 = [v30 unsignedLongValue];
    id v29 = v17;
    v19 = [v17 unsignedLongValue];
    v20 = objc_autoreleasePoolPush();
    if (qword_100219F60)
    {
      v14 = v34;
      [(id)qword_100219F60 WFLog:3, "%s: Rssi: %d Count: %d Age: %d LastStatus: %d Reason: %d Flags:%lX RoamCache: %lu - %@", "-[WiFiRoamManager setRoamEndState:forInterface:]", objc_msgSend(-[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"RSSI"), "unsignedIntValue"), objc_msgSend( -[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_SCAN_COUNT"), "unsignedIntValue"), objc_msgSend( -[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_SCAN_AGE"), "unsignedIntValue"), objc_msgSend( -[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_LAST_STATUS"), "unsignedIntValue"), objc_msgSend( -[NSDictionary objectForKey:](v34->_roamState, "objectForKey:", @"ROAM_SCAN_REASON"), "unsignedIntValue"), objc_msgSend(v16, "unsignedIntegerValue"), v31, v36 message];
    }

    objc_autoreleasePoolPop(v20);
    -[WiFiRoamManager detectLateRoam](v14, "detectLateRoam");
    if (obj) {
      -[WiFiUsageMonitor updateRoamCache:forInterface:]( +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance"),  "updateRoamCache:forInterface:",  obj,  v32);
    }
    if ([v33 unsignedIntValue])
    {
      uint64_t v21 = v18 - v19;
      v22 = +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance");
      uint64_t v23 = [v15 unsignedIntValue];
      id v24 = +[WiFiRoamManager stringRepresentationWithReason:]( WiFiRoamManager,  "stringRepresentationWithReason:",  [v15 unsignedIntValue]);
      uint64_t v25 = [v33 unsignedIntValue];
      id v26 = +[WiFiRoamManager stringRepresentationWithStatus:]( WiFiRoamManager,  "stringRepresentationWithStatus:",  [v33 unsignedIntValue]);
      if (v30) {
        BOOL v27 = v29 == 0LL;
      }
      else {
        BOOL v27 = 1;
      }
      if (v27) {
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v28 = v21;
      }
      -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:]( v22,  "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:",  0LL,  v23,  v24,  v25,  v26,  v28,  v14->_roamState,  0LL,  v32);
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)setRoamPrep:(id)a3 forInterface:(id)a4
{
  v7 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 4) == 0)
  {
    -[WiFiRoamManager setStateFlags:]( self,  "setStateFlags:",  -[WiFiRoamManager stateFlags](self, "stateFlags") | 4);
    roamPrep = self->_roamPrep;
    if (roamPrep) {

    }
    id v9 = (NSDictionary *)[a3 copy];
    self->_roamPrep = v9;
    id v10 = -[NSDictionary objectForKey:](v9, "objectForKey:", @"ROAM_SCAN_REASON");
    -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:]( +[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"),  "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:",  1,  [v10 unsignedIntValue],  +[WiFiRoamManager stringRepresentationWithReason:]( WiFiRoamManager,  "stringRepresentationWithReason:",  objc_msgSend(v10, "unsignedIntValue")),  0x7FFFFFFFFFFFFFFFLL,  0,  0,  self->_roamPrep,  0,  a4);
    id v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [(id)qword_100219F60 WFLog:3, "%s: Will roam to candidate: %@", "-[WiFiRoamManager setRoamPrep:forInterface:]", -[NSDictionary objectForKey:](self->_roamPrep, "objectForKey:", @"BSSID") message];
    }
    objc_autoreleasePoolPop(v11);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)setRoamStatus:(id)a3 withBeaconCache:(id)a4 forInterface:(id)a5
{
  id v9 = objc_autoreleasePoolPush();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 8) == 0)
  {
    -[WiFiRoamManager setStateFlags:]( self,  "setStateFlags:",  -[WiFiRoamManager stateFlags](self, "stateFlags") | 8);
    roamStatus = self->_roamStatus;
    if (roamStatus) {

    }
    self->_roamStatus = (NSDictionary *)[a3 copy];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    self->_roamScanEndTimestamp = v11;
    id v12 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_TIME_STARTED");
    v13 = objc_msgSend( -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_TIME_ENDED"),  "unsignedLongValue");
    v14 = [v12 unsignedLongValue];
    id v15 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_STATUS");
    id v32 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_REASON");
    id v16 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_FLAGS");
    id v30 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_CHANNELS_SCANNED_COUNT");
    if (((unint64_t)[v15 unsignedIntegerValue] & 0x1FF) != 0)
    {
      id v29 = 0LL;
      id v28 = 0LL;
      unint64_t v17 = 0LL;
    }

    else
    {
      unint64_t v17 = -[WiFiRoamManager detectPingPong](self, "detectPingPong");
      self->_pingPongNth = v17;
      id v29 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAM_SCAN_SUMMARY");
      id v28 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAM_PKT_LOSS_INFO");
    }

    int64_t v31 = v13 - v14;
    v18 = objc_autoreleasePoolPush();
    if (qword_100219F60)
    {
      context = v18;
      [(id)qword_100219F60 WFLog:3, "%s: Latency:%ld Status:%u (%@) Reason:%d (%@) ScannedChannelCount:%lu Flags:%lX PingPongNth:%lu scanSummary:%@ lossSummary:%@", "-[WiFiRoamManager setRoamStatus:withBeaconCache:forInterface:]", v31, (unint64_t)objc_msgSend(v15, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithStatus:]( WiFiRoamManager, "stringRepresentationWithStatus:", objc_msgSend(v15, "unsignedIntValue")), (unint64_t)objc_msgSend(v32, "unsignedIntValue") & 0x1FF, +[WiFiRoamManager stringRepresentationWithReason:]( WiFiRoamManager, "stringRepresentationWithReason:", objc_msgSend(v32, "unsignedIntValue")), objc_msgSend(v30, "unsignedIntegerValue"), objc_msgSend(v16, "unsignedIntegerValue"), v17, v29, v28 message];
      v18 = context;
    }

    objc_autoreleasePoolPop(v18);
    if (v17)
    {
      v19 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: previous roams:%@", "-[WiFiRoamManager setRoamStatus:withBeaconCache:forInterface:]", self->_previousRoams message];
      }
      objc_autoreleasePoolPop(v19);
    }

    -[WiFiRoamManager detectLateRoam](self, "detectLateRoam");
    if ([v15 unsignedIntValue] == -528350205
      || -[WiFiRoamManager deviceStationary](self, "deviceStationary")
      && [v15 unsignedIntValue] == -528350133)
    {
      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:");
    }

    if (a4) {
      -[WiFiUsageMonitor updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:]( +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance"),  "updateBeaconCache:afterRoamAttempt:whileCurrentBSSID:forInterface:",  a4,  self->_roamStatus,  -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_ORIGIN_ADDR"),  a5);
    }
    v20 = +[WiFiUsageMonitor sharedInstance](&OBJC_CLASS___WiFiUsageMonitor, "sharedInstance");
    uint64_t v21 = [v32 unsignedIntValue];
    id v22 = +[WiFiRoamManager stringRepresentationWithReason:]( WiFiRoamManager,  "stringRepresentationWithReason:",  [v32 unsignedIntValue]);
    uint64_t v23 = [v15 unsignedIntValue];
    id v24 = +[WiFiRoamManager stringRepresentationWithStatus:]( WiFiRoamManager,  "stringRepresentationWithStatus:",  [v15 unsignedIntValue]);
    uint64_t v25 = self->_roamStatus;
    if (self->_pingPongNth) {
      id v26 = -[NSMutableArray valueForKey:](self->_previousRoams, "valueForKey:", @"reason");
    }
    else {
      id v26 = 0LL;
    }
    -[WiFiUsageMonitor setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:]( v20,  "setRoamingState:withReason:asString:andStatus:asString:andLatency:andRoamData:andPingPongSequence:forInterface:",  0LL,  v21,  v22,  v23,  v24,  v31,  v25,  v26,  a5);
  }

  objc_autoreleasePoolPop(v9);
}

- (id)copyRoamStatus
{
  objc_super v3 = objc_autoreleasePoolPush();
  id v4 = -[NSDictionary copy](self->_roamStatus, "copy");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)setLinkUpWithBSSEnvironment:(int64_t)a3 band:(int64_t)a4 roam:(BOOL)a5 inCharging:(BOOL)a6 motionState:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = objc_autoreleasePoolPush();
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[WiFiRoamManager setLinkUpTimestamp:](self, "setLinkUpTimestamp:");
  -[WiFiRoamManager setBssEnvironment:](self, "setBssEnvironment:", a3);
  -[WiFiRoamManager setCurrentBand:](self, "setCurrentBand:", a4);
  if (!a5)
  {
    -[WiFiRoamManager reset](self, "reset");
    -[WiFiRoamManager setDeviceMotionState:](self, "setDeviceMotionState:", v7);
  }

  -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:", 0.0);
  objc_autoreleasePoolPop(v12);
}

- (void)setLinkDown
{
  objc_super v3 = objc_autoreleasePoolPush();
  -[WiFiRoamManager setDeviceMotionState:](self, "setDeviceMotionState:", 0LL);
  -[WiFiRoamManager setLinkUpTimestamp:](self, "setLinkUpTimestamp:", 0.0);
  -[WiFiRoamManager setBssEnvironment:](self, "setBssEnvironment:", 0LL);
  -[WiFiRoamManager setCurrentBand:](self, "setCurrentBand:", 0LL);
  -[WiFiRoamManager reset](self, "reset");
  -[WiFiRoamManager setWindowTimestamp:](self, "setWindowTimestamp:", 0.0);
  -[WiFiRoamManager setLastRoamStatusFailedNoCandidateTs:](self, "setLastRoamStatusFailedNoCandidateTs:", 0.0);
  objc_autoreleasePoolPop(v3);
}

- (void)reset
{
  objc_super v3 = objc_autoreleasePoolPush();
  id v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s", "-[WiFiRoamManager reset]");
  }
  objc_autoreleasePoolPop(v4);

  self->_roamState = 0LL;
  self->_roamScanStartTimestamp = 0.0;
  self->_roamScanEndTimestamp = 0.0;

  self->_roamScanStart = 0LL;
  self->_roamState = 0LL;

  self->_roamPrep = 0LL;
  self->_roamStatus = 0LL;
  -[WiFiRoamManager setLastHostTriggeredRoamReason:](self, "setLastHostTriggeredRoamReason:", 0LL);
  -[WiFiRoamManager setStateFlags:](self, "setStateFlags:", 0LL);
  objc_autoreleasePoolPop(v3);
}

- (void)resetPingPong
{
  self->_pingPongNth = 0LL;
}

- (void)setBTState:(int64_t)a3 type:(int64_t)a4
{
  uint64_t v7 = objc_autoreleasePoolPush();
  -[WiFiRoamManager setBtState:](self, "setBtState:", a3);
  -[WiFiRoamManager setBtType:](self, "setBtType:", a4);
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  -[WiFiRoamManager setBtStateChangeTimestamp:](self, "setBtStateChangeTimestamp:");
  if ((id)-[WiFiRoamManager btType](self, "btType") == (id)102)
  {
    int64_t v8 = -[WiFiRoamManager btState](self, "btState");
    if ((unint64_t)(v8 - 1) <= 1)
    {
      int64_t v9 = v8;
      if ((id)-[WiFiRoamManager currentBand](self, "currentBand") == (id)1) {
        -[WiFiRoamManager roamWithReason:bandPreference:](self, "roamWithReason:bandPreference:", v9, 0LL);
      }
    }
  }

  objc_autoreleasePoolPop(v7);
}

- (BOOL)allowRoam
{
  objc_super v3 = objc_autoreleasePoolPush();
  int64_t v4 = -[WiFiRoamManager bssEnvironment](self, "bssEnvironment");
  if ((char *)-[WiFiRoamManager bssEnvironment](self, "bssEnvironment") - 5 >= (char *)2
    && (unint64_t)(v4 - 3) >= 2)
  {
    double v11 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Not allowed for environment:%ld",  "-[WiFiRoamManager allowRoam]",  -[WiFiRoamManager bssEnvironment](self, "bssEnvironment"),  v39);
    }
    goto LABEL_10;
  }

  -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
  if (v5 == 0.0)
  {
    __int128 v37 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Not allowed as link not up",  "-[WiFiRoamManager allowRoam]");
    }
    goto LABEL_35;
  }

  if (-[WiFiRoamManager awdlRealTimeModeActive](self, "awdlRealTimeModeActive"))
  {
    __int128 v37 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Not allowed as awdl realtime traffic active",  "-[WiFiRoamManager allowRoam]");
    }
    goto LABEL_35;
  }

  if (!-[WiFiRoamManager ipAddrAssigned](self, "ipAddrAssigned"))
  {
    __int128 v37 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Not allowed as IP addr hasn't been assigned yet",  "-[WiFiRoamManager allowRoam]");
    }
LABEL_35:
    id v15 = v37;
    goto LABEL_11;
  }

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v7 = v6;
  -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
  double v9 = v7 - v8;
  -[WiFiRoamManager paramMinRoamWaitTimeFromLinkUpInSec](self, "paramMinRoamWaitTimeFromLinkUpInSec");
  if (v9 >= v10)
  {
    -[WiFiRoamManager windowTimestamp](self, "windowTimestamp");
    if (v17 == 0.0
      || (-[WiFiRoamManager windowTimestamp](self, "windowTimestamp"),
          double v19 = v7 - v18,
          -[WiFiRoamManager paramWindowSizeInSec](self, "paramWindowSizeInSec"),
          v19 >= v20))
    {
      BOOL v27 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: Resetting window", "-[WiFiRoamManager allowRoam]");
      }
      objc_autoreleasePoolPop(v27);
      -[WiFiRoamManager setWindowTimestamp:](self, "setWindowTimestamp:", v7);
      -[WiFiRoamManager setRoamAttemptCount:](self, "setRoamAttemptCount:", 0LL);
      -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
      if (v28 != 0.0)
      {
        -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
        double v30 = v7 - v29;
        -[WiFiRoamManager paramMinRoamRetryWaitTime](self, "paramMinRoamRetryWaitTime");
        if (v30 <= v31)
        {
          double v11 = objc_autoreleasePoolPush();
          id v12 = (void *)qword_100219F60;
          if (!qword_100219F60) {
            goto LABEL_10;
          }
          -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
          double v38 = v7 - v33;
          v14 = "%s: Not allowed as last attempt was %2.2f sec ago ";
          goto LABEL_9;
        }
      }
    }

    else
    {
      uint64_t v21 = -[WiFiRoamManager roamAttemptCount](self, "roamAttemptCount");
      if (v21 >= -[WiFiRoamManager paramMaxRoamRetriesInWindow](self, "paramMaxRoamRetriesInWindow"))
      {
        double v11 = objc_autoreleasePoolPush();
        id v12 = (void *)qword_100219F60;
        if (!qword_100219F60) {
          goto LABEL_10;
        }
        -[WiFiRoamManager windowTimestamp](self, "windowTimestamp");
        double v35 = v7 - v34;
        -[WiFiRoamManager paramWindowSizeInSec](self, "paramWindowSizeInSec");
        double v38 = v35;
        uint64_t v39 = v36;
        v14 = "%s: Not allowed as max attempts made. Only %2.2f sec into window size %2.2f";
        goto LABEL_9;
      }

      -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
      if (v22 != 0.0)
      {
        -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
        double v24 = v7 - v23;
        -[WiFiRoamManager paramMinRoamRetryWaitTime](self, "paramMinRoamRetryWaitTime");
        if (v24 <= v25)
        {
          double v11 = objc_autoreleasePoolPush();
          id v12 = (void *)qword_100219F60;
          if (!qword_100219F60) {
            goto LABEL_10;
          }
          -[WiFiRoamManager lastRoamAttemptTimestamp](self, "lastRoamAttemptTimestamp");
          double v38 = v7 - v26;
          v14 = "%s: Not allowed as last attempt was %2.2f sec ago";
          goto LABEL_9;
        }
      }
    }

    -[WiFiRoamManager setRoamAttemptCount:]( self,  "setRoamAttemptCount:",  (char *)-[WiFiRoamManager roamAttemptCount](self, "roamAttemptCount") + 1);
    -[WiFiRoamManager setLastRoamAttemptTimestamp:](self, "setLastRoamAttemptTimestamp:", v7);
    BOOL v16 = 1;
    goto LABEL_24;
  }

  double v11 = objc_autoreleasePoolPush();
  id v12 = (void *)qword_100219F60;
  if (qword_100219F60)
  {
    -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
    double v38 = v7 - v13;
    v14 = "%s: Not allowed as link up was %2.2f sec ago";
LABEL_9:
    objc_msgSend(v12, "WFLog:message:", 3, v14, "-[WiFiRoamManager allowRoam]", *(void *)&v38, v39);
  }

- (BOOL)roamWithReason:(unint64_t)a3 bandPreference:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double v7 = objc_autoreleasePoolPush();
  if (v4 >= 3)
  {
    double v13 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: Invalid band preference: %d. Exiting",  "-[WiFiRoamManager roamWithReason:bandPreference:]",  0);
    }
    objc_autoreleasePoolPop(v13);
    goto LABEL_10;
  }

  if (!-[WiFiRoamManager allowRoam](self, "allowRoam"))
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_6;
  }

  double v8 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Host triggered roam allowed for reason: %lu with bandPref: %d ",  "-[WiFiRoamManager roamWithReason:bandPreference:]",  a3,  v4);
  }
  objc_autoreleasePoolPop(v8);
  -[WiFiRoamManager setLastHostTriggeredRoamReason:](self, "setLastHostTriggeredRoamReason:", a3);
  v14[0] = @"com.apple.wifid.wifiroammangerroamtype";
  v14[1] = @"com.apple.wifid.wifiroammangerroamreason";
  v15[0] = +[NSNumber numberWithChar:](&OBJC_CLASS___NSNumber, "numberWithChar:", (char)v4);
  v15[1] = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (int)a3);
  double v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  BOOL v11 = 1;
  CFNotificationCenterPostNotification( LocalCenter,  @"com.apple.wifid.wifiroammanagerroamnotification",  0LL,  (CFDictionaryRef)v9,  1u);
LABEL_6:
  objc_autoreleasePoolPop(v7);
  return v11;
}

- (BOOL)canSubmitMetrics
{
  double Current = CFAbsoluteTimeGetCurrent();
  if ((-[WiFiRoamManager stateFlags](self, "stateFlags") & 8) != 0
    && (-[WiFiRoamManager lastRoamSuppressionRemovalTime](self, "lastRoamSuppressionRemovalTime"), Current - v4 > 30.0))
  {
    unsigned int v5 = (-[WiFiRoamManager stateFlags](self, "stateFlags") >> 1) & 1;
  }

  else
  {
    unsigned int v5 = 0;
  }

  double v6 = objc_autoreleasePoolPush();
  if (qword_100219F60)
  {
    double v7 = "No";
    if (v5) {
      double v7 = "Yes";
    }
    objc_msgSend((id)qword_100219F60, "WFLog:message:", 3, "%s: %s", "-[WiFiRoamManager canSubmitMetrics]", v7);
  }

  objc_autoreleasePoolPop(v6);
  return v5;
}

- (BOOL)detectLateRoam
{
  objc_super v3 = objc_autoreleasePoolPush();
  if (!self->_roamState
    || (roamStatus = self->_roamStatus) == 0LL
    || (id v5 = -[NSDictionary objectForKey:](roamStatus, "objectForKey:", @"ROAMEDEVENT_STATUS"),
        id v6 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_REASON"),
        [v5 unsignedIntValue] != -528350205)
    && [v5 unsignedIntValue] != -528350133
    || [v6 unsignedIntegerValue] != (id)3766619137)
  {
    BOOL v22 = 0;
    goto LABEL_44;
  }

  unsigned int v29 = objc_msgSend( -[NSDictionary objectForKey:](self->_roamState, "objectForKey:", @"RSSI"),  "unsignedIntValue");
  id v7 = -[NSDictionary objectForKey:](self->_roamState, "objectForKey:", @"ROAM_CACHE");
  if (!v7)
  {
    double v25 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend((id)qword_100219F60, "WFLog:message:", 4, "%s: no roam cache", "-[WiFiRoamManager detectLateRoam]");
    }
    objc_autoreleasePoolPop(v25);
    goto LABEL_42;
  }

  double v8 = v7;
  if (![v7 count])
  {
LABEL_42:
    char v24 = 0;
    goto LABEL_43;
  }

  BOOL v27 = v3;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v9)
  {
    char v28 = 0;
    goto LABEL_36;
  }

  id v10 = v9;
  char v28 = 0;
  uint64_t v11 = 0LL;
  uint64_t v12 = *(void *)v31;
  do
  {
    double v13 = 0LL;
    do
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)v13);
      if (!v14)
      {
        double v17 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: ERROR: no roam candidate at idx %d in cache with count %lu ",  "-[WiFiRoamManager detectLateRoam]",  (char *)v13 + v11,  objc_msgSend(v8, "count"));
        }
        goto LABEL_19;
      }

      id v15 = objc_msgSend( objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v13), "objectForKey:", @"RSSI"),  "unsignedIntValue");
      id v16 = v15;
      if ((int)v15 <= -90)
      {
        double v17 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: Roam candidate %d has weak RSSI %d ",  "-[WiFiRoamManager detectLateRoam]",  (char *)v13 + v11,  v16);
        }
LABEL_19:
        objc_autoreleasePoolPop(v17);
        goto LABEL_20;
      }

      uint64_t v18 = v15 - v29;
      id v19 = [v14 objectForKey:@"BSSID"];
      double v20 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [(id)qword_100219F60 WFLog:3, "%s: Roam candidate %@ (idx %d) has RSSI delta %d ", "-[WiFiRoamManager detectLateRoam]", v19, (char *)v13 + v11, v18 message];
      }
      objc_autoreleasePoolPop(v20);
      if ((v18 - 1) <= 0xB)
      {
        -[WiFiRoamManager setIsRoamLateDueToDelta:](self, "setIsRoamLateDueToDelta:", 1LL);
        if (!-[WiFiRoamManager minRssiDeltaInRoamCache](self, "minRssiDeltaInRoamCache")
          || -[WiFiRoamManager minRssiDeltaInRoamCache](self, "minRssiDeltaInRoamCache") > v18)
        {
          -[WiFiRoamManager setMinRssiDeltaInRoamCache:](self, "setMinRssiDeltaInRoamCache:", v18);
        }

        if (!-[WiFiRoamManager maxRssiDeltaInRoamCache](self, "maxRssiDeltaInRoamCache")
          || -[WiFiRoamManager maxRssiDeltaInRoamCache](self, "maxRssiDeltaInRoamCache") < v18)
        {
          -[WiFiRoamManager setMaxRssiDeltaInRoamCache:](self, "setMaxRssiDeltaInRoamCache:", v18);
        }

        char v28 = 1;
      }

- (unint64_t)detectPingPong
{
  if (!self->_roamStatus)
  {
    NSLog(@"%s - _roamStatus not available. bail", a2, "-[WiFiRoamManager detectPingPong]");
    return 0LL;
  }

  if (!-[WiFiRoamManager previousRoams](self, "previousRoams"))
  {
    NSLog(@"%s - previousRoams not available. bail", v3, "-[WiFiRoamManager detectPingPong]");
    return 0LL;
  }

  double v4 = objc_autoreleasePoolPush();
  id v5 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_REASON");
  id v6 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_TARGET_ADDR");
  id v7 = -[NSDictionary objectForKey:](self->_roamStatus, "objectForKey:", @"ROAMEDEVENT_ORIGIN_ADDR");
  if ([v6 isEqualToData:v7])
  {
    NSLog( @"%s - roamTarget (%@) and roamOrigin (%@) are identical, bail",  "-[WiFiRoamManager detectPingPong]",  v6,  v7);
LABEL_29:
    objc_autoreleasePoolPop(v4);
    return 0LL;
  }

  double v8 = +[PreviousRoam roamWithBssid:andReason:]( PreviousRoam,  "roamWithBssid:andReason:",  v6,  [v5 unsignedIntegerValue]);
  if (!v8)
  {
    NSLog(@"%s - cannot get instance of PreviousRoam class, bail", "-[WiFiRoamManager detectPingPong]");
    goto LABEL_29;
  }

  -[NSMutableArray addObject:](self->_previousRoams, "addObject:", v8);
  id v9 = +[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 2LL);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = objc_msgSend( -[NSMutableArray reverseObjectEnumerator](self->_previousRoams, "reverseObjectEnumerator"),  "allObjects");
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    uint64_t v14 = -1LL;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        objc_msgSend(objc_msgSend(v16, "timestamp"), "timeIntervalSinceNow");
        if (v17 < -60.0
          && v14 <= (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16))
        {
          uint64_t v14 = (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16);
        }

        if ((-[NSMutableSet containsObject:](v9, "containsObject:", [v16 bssid]) & 1) != 0
          || -[NSMutableSet count](v9, "count") != (id)2)
        {
          -[NSMutableSet addObject:](v9, "addObject:", [v16 bssid]);
        }

        else if (v14 <= (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16))
        {
          uint64_t v14 = (uint64_t)-[NSMutableArray indexOfObject:](self->_previousRoams, "indexOfObject:", v16);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v12);
    if ((v14 & 0x8000000000000000LL) == 0) {
      -[NSMutableArray removeObjectsInRange:](self->_previousRoams, "removeObjectsInRange:", 0LL, v14 + 1);
    }
  }

  uint64_t v18 = (char *)-[NSMutableArray count](self->_previousRoams, "count");
  previousRoams = self->_previousRoams;
  unint64_t v20 = (unint64_t)(v18 - 2) & ~((uint64_t)(v18 - 2) >> 63);
  NSLog( @"%s - _previousRoams:%@\npingPongNth=%ld (-->%lu)",  "-[WiFiRoamManager detectPingPong]",  previousRoams,  v18 - 2,  v20);
  objc_autoreleasePoolPop(v4);
  return v20;
}

- (void)setDeviceMotionState:(int)a3
{
  id v5 = objc_autoreleasePoolPush();
  -[WiFiRoamManager linkUpTimestamp](self, "linkUpTimestamp");
  if (v6 != 0.0) {
    -[WiFiRoamManager setDeviceStationary:](self, "setDeviceStationary:", a3 == 1);
  }
  objc_autoreleasePoolPop(v5);
}

+ (id)stringRepresentationWithStatus:(unsigned int)a3
{
  if ((a3 & 0x1FF) == 0) {
    return @"Success";
  }
  id result = @"Operation failed";
  switch(a3)
  {
    case 0xE0820401:
      return result;
    case 0xE0820402:
      id result = @"Operation timed out";
      break;
    case 0xE0820403:
      id result = @"Failed due to no matching network found";
      break;
    case 0xE0820404:
      id result = @"Operation was aborted";
      break;
    case 0xE0820405:
      id result = @"Protocol failure: packet not ack'd";
      break;
    case 0xE0820406:
      id result = @"AUTH or ASSOC packet was unsolicited";
      break;
    case 0xE0820407:
      id result = @"Attempt to assoc to an auto auth configuration";
      break;
    case 0xE0820408:
      id result = @"Scan results are incomplete";
      break;
    case 0xE0820409:
      id result = @"Scan aborted by another scan";
      break;
    case 0xE082040A:
      id result = @"Scan aborted due to assoc in progress";
      break;
    case 0xE082040B:
      id result = @"802.11h quiet period started";
      break;
    case 0xE082040C:
      id result = @"User disabled scanning";
      break;
    case 0xE082040D:
      id result = @"No allowable channels to scan";
      break;
    case 0xE082040E:
      id result = @"Scan aborted due to CCX fast roam";
      break;
    case 0xE082040F:
      id result = @"Abort channel select";
      break;
    default:
      if (a3 == -528350133) {
        id result = @"Network found but filtered out by roam score logic";
      }
      else {
        id result = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Unknown=%ld", a3);
      }
      break;
  }

  return result;
}

+ (id)stringRepresentationWithReason:(unsigned int)a3
{
  if (a3 + 528348160 >= 0x14) {
    return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Unknown=%ld", a3);
  }
  else {
    return *(&off_1001E29A0 + (int)(a3 + 528348160));
  }
}

+ (id)stringRepresentationWithHostReason:(int64_t)a3
{
  else {
    return *(&off_1001E2A40 + a3);
  }
}

- (BOOL)isLastRoamDueToBeaconLost
{
  roamScanStart = self->_roamScanStart;
  if (roamScanStart)
  {
    id v3 = -[NSDictionary objectForKey:](roamScanStart, "objectForKey:", @"ROAM_SCAN_REASON");
    LOBYTE(roamScanStart) = v3 && [v3 unsignedIntValue] == -528348156;
  }

  return (char)roamScanStart;
}

- (NSDictionary)roamState
{
  return self->_roamState;
}

- (double)roamScanStartTimestamp
{
  return self->_roamScanStartTimestamp;
}

- (void)setRoamScanStartTimestamp:(double)a3
{
  self->_roamScanStartTimestamp = a3;
}

- (double)roamScanEndTimestamp
{
  return self->_roamScanEndTimestamp;
}

- (void)setRoamScanEndTimestamp:(double)a3
{
  self->_roamScanEndTimestamp = a3;
}

- (double)paramMinRoamWaitTimeFromLinkUpInSec
{
  return self->_paramMinRoamWaitTimeFromLinkUpInSec;
}

- (void)setParamMinRoamWaitTimeFromLinkUpInSec:(double)a3
{
  self->_paramMinRoamWaitTimeFromLinkUpInSec = a3;
}

- (double)paramMinRoamRetryWaitTime
{
  return self->_paramMinRoamRetryWaitTime;
}

- (void)setParamMinRoamRetryWaitTime:(double)a3
{
  self->_paramMinRoamRetryWaitTime = a3;
}

- (int64_t)paramMaxRoamRetriesInWindow
{
  return self->_paramMaxRoamRetriesInWindow;
}

- (void)setParamMaxRoamRetriesInWindow:(int64_t)a3
{
  self->_paramMaxRoamRetriesInWindow = a3;
}

- (double)paramWindowSizeInSec
{
  return self->_paramWindowSizeInSec;
}

- (void)setParamWindowSizeInSec:(double)a3
{
  self->_paramWindowSizeInSec = a3;
}

- (BOOL)isRoamLateDueToDelta
{
  return self->_isRoamLateDueToDelta;
}

- (void)setIsRoamLateDueToDelta:(BOOL)a3
{
  self->_isRoamLateDueToDelta = a3;
}

- (int64_t)minRssiDeltaInRoamCache
{
  return self->_minRssiDeltaInRoamCache;
}

- (void)setMinRssiDeltaInRoamCache:(int64_t)a3
{
  self->_minRssiDeltaInRoamCache = a3;
}

- (int64_t)maxRssiDeltaInRoamCache
{
  return self->_maxRssiDeltaInRoamCache;
}

- (void)setMaxRssiDeltaInRoamCache:(int64_t)a3
{
  self->_maxRssiDeltaInRoamCache = a3;
}

- (int64_t)lastHostTriggeredRoamReason
{
  return self->_lastHostTriggeredRoamReason;
}

- (void)setLastHostTriggeredRoamReason:(int64_t)a3
{
  self->_lastHostTriggeredRoamReason = a3;
}

- (BOOL)awdlRealTimeModeActive
{
  return self->_awdlRealTimeModeActive;
}

- (void)setAwdlRealTimeModeActive:(BOOL)a3
{
  self->_awdlRealTimeModeActive = a3;
}

- (BOOL)ipAddrAssigned
{
  return self->_ipAddrAssigned;
}

- (void)setIpAddrAssigned:(BOOL)a3
{
  self->_ipAddrAssigned = a3;
}

- (double)lastRoamStatusFailedNoCandidateTs
{
  return self->_lastRoamStatusFailedNoCandidateTs;
}

- (void)setLastRoamStatusFailedNoCandidateTs:(double)a3
{
  self->_lastRoamStatusFailedNoCandidateTs = a3;
}

- (double)lastRoamSuppressionRemovalTime
{
  return self->_lastRoamSuppressionRemovalTime;
}

- (void)setLastRoamSuppressionRemovalTime:(double)a3
{
  self->_lastRoamSuppressionRemovalTime = a3;
}

- (unint64_t)pingPongNth
{
  return self->_pingPongNth;
}

- (void)setPingPongNth:(unint64_t)a3
{
  self->_pingPongNth = a3;
}

- (NSDictionary)roamScanStart
{
  return self->_roamScanStart;
}

- (void)setRoamScanStart:(id)a3
{
}

- (NSDictionary)roamPrep
{
  return self->_roamPrep;
}

- (void)setRoamPrep:(id)a3
{
}

- (NSDictionary)roamStatus
{
  return self->_roamStatus;
}

- (void)setRoamStatus:(id)a3
{
}

- (int64_t)roamAttemptCount
{
  return self->_roamAttemptCount;
}

- (void)setRoamAttemptCount:(int64_t)a3
{
  self->_roamAttemptCount = a3;
}

- (int64_t)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(int64_t)a3
{
  self->_bssEnvironment = a3;
}

- (int64_t)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int64_t)a3
{
  self->_currentBand = a3;
}

- (int64_t)btState
{
  return self->_btState;
}

- (void)setBtState:(int64_t)a3
{
  self->_btState = a3;
}

- (int64_t)btType
{
  return self->_btType;
}

- (void)setBtType:(int64_t)a3
{
  self->_btType = a3;
}

- (double)btStateChangeTimestamp
{
  return self->_btStateChangeTimestamp;
}

- (void)setBtStateChangeTimestamp:(double)a3
{
  self->_btStateChangeTimestamp = a3;
}

- (double)linkUpTimestamp
{
  return self->_linkUpTimestamp;
}

- (void)setLinkUpTimestamp:(double)a3
{
  self->_linkUpTimestamp = a3;
}

- (double)windowTimestamp
{
  return self->_windowTimestamp;
}

- (void)setWindowTimestamp:(double)a3
{
  self->_windowTimestamp = a3;
}

- (double)lastRoamAttemptTimestamp
{
  return self->_lastRoamAttemptTimestamp;
}

- (void)setLastRoamAttemptTimestamp:(double)a3
{
  self->_lastRoamAttemptTimestamp = a3;
}

- (unsigned)stateFlags
{
  return self->_stateFlags;
}

- (void)setStateFlags:(unsigned __int8)a3
{
  self->_stateFlags = a3;
}

- (BOOL)deviceStationary
{
  return self->_deviceStationary;
}

- (void)setDeviceStationary:(BOOL)a3
{
  self->_deviceStationary = a3;
}

- (NSMutableArray)previousRoams
{
  return self->_previousRoams;
}

- (void)setPreviousRoams:(id)a3
{
}

@end