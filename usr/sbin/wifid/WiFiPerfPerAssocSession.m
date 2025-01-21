@interface WiFiPerfPerAssocSession
- (BOOL)assocIsToApplePH;
- (BOOL)assocIsToNoMap;
- (BOOL)hasBeenFinalized;
- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5;
- (BOOL)isEdgeBSS;
- (BOOL)wasCaptive;
- (NSDictionary)historicalScorecardAtAssoc;
- (NSNumber)apMode;
- (NSNumber)avgDLSpeed;
- (NSString)bssidAtPollingStart;
- (NSString)bssidOfNetworkForLastReceivedAssocIndication;
- (NSString)connectedBSSID;
- (NSString)connectedSSID;
- (NSString)scorecardIdentifier;
- (WiFiPerfPerAssocSession)initWithNetworkRecord:(void *)a3 managerRef:(void *)a4 andManagerQueue:(id)a5;
- (__WiFiNetwork)networkRecord;
- (double)_roundTimeInterval:(double)a3 toNearestNumberOfHours:(int64_t)a4;
- (double)accuracyOfBestReading;
- (double)bestLatitudeReading;
- (double)bestLongitudeReading;
- (double)doNotFinalizePriorToEpoch;
- (double)epochAtAssoc;
- (double)rttAverageActiveSession;
- (double)rttAverageAsPolledViaInstantaneousScorecard;
- (double)rttAverageAtBeginActiveSession;
- (double)rttMinActiveSession;
- (double)rttMinAtBeginActiveSession;
- (double)rttVarianceActiveSession;
- (double)rttVarianceAsPolledViaInstantaneousScorecard;
- (double)rttVarianceAtBeginActiveSession;
- (id)_deltaStartScorecard:(id)a3 fromEndScorecard:(id)a4;
- (id)description;
- (id)finalizeWithEndScorecard:(id)a3;
- (int)_assocReasonToGeoAssocReason:(int)a3;
- (int)networkOriginator;
- (int)networkType;
- (int)ssidHarvestStatus;
- (int64_t)ccaAverage;
- (int64_t)channel;
- (int64_t)rssiAverage;
- (int64_t)snrAverage;
- (unint64_t)_getSingleSigFigForValue:(unint64_t)a3;
- (unint64_t)_roundByteCount:(unint64_t)a3;
- (unint64_t)_roundPacketCount:(unint64_t)a3;
- (unint64_t)assocReason;
- (unint64_t)associatedTime;
- (unint64_t)band;
- (unint64_t)bytesInAtBeginActiveUsageSession;
- (unint64_t)bytesInTotalActiveUsageSession;
- (unint64_t)bytesOutAtBeginActiveUsageSession;
- (unint64_t)bytesOutTotalActiveUsageSession;
- (unint64_t)captiveFlag;
- (unint64_t)channelWidth;
- (unint64_t)colocatedState;
- (unint64_t)disAssocReason;
- (unint64_t)isHS2;
- (unint64_t)lastBytesInSample;
- (unint64_t)lastBytesOutSample;
- (unint64_t)phyMode;
- (unint64_t)securityType;
- (unint64_t)timeOfDay;
- (void)_updateNetworkOnManagerQueue:(id)a3;
- (void)accumulateActiveUsageWithScorecard:(id)a3;
- (void)beginTrackingActiveUsageWithScorecard:(id)a3;
- (void)calculateTimes;
- (void)dealloc;
- (void)ingestCurrentNetwork:(void *)a3;
- (void)ingestInstantaneousScorecardFromPolling:(id)a3;
- (void)ingestLQMUpdate:(id)a3;
- (void)ingestScanResults:(id)a3 currentSSID:(id)a4;
- (void)resetActiveUsageStats;
- (void)setAccuracyOfBestReading:(double)a3;
- (void)setApMode:(id)a3;
- (void)setAssocIsToApplePH:(BOOL)a3;
- (void)setAssocIsToNoMap:(BOOL)a3;
- (void)setAssocReason:(unint64_t)a3;
- (void)setAssociatedTime:(unint64_t)a3;
- (void)setAvgDLSpeed:(id)a3;
- (void)setBand:(unint64_t)a3;
- (void)setBestLatitudeReading:(double)a3;
- (void)setBestLongitudeReading:(double)a3;
- (void)setBssidAtPollingStart:(id)a3;
- (void)setBssidOfNetworkForLastReceivedAssocIndication:(id)a3;
- (void)setBytesInAtBeginActiveUsageSession:(unint64_t)a3;
- (void)setBytesInTotalActiveUsageSession:(unint64_t)a3;
- (void)setBytesOutAtBeginActiveUsageSession:(unint64_t)a3;
- (void)setBytesOutTotalActiveUsageSession:(unint64_t)a3;
- (void)setCaptiveFlag:(unint64_t)a3;
- (void)setCcaAverage:(int64_t)a3;
- (void)setChannel:(int64_t)a3;
- (void)setChannelWidth:(unint64_t)a3;
- (void)setColocatedState:(unint64_t)a3;
- (void)setConnectedBSSID:(id)a3;
- (void)setConnectedSSID:(id)a3;
- (void)setDisAssocReason:(unint64_t)a3;
- (void)setDoNotFinalizePriorToEpoch:(double)a3;
- (void)setEpochAtAssoc:(double)a3;
- (void)setHasBeenFinalized:(BOOL)a3;
- (void)setHistoricalScorecardAtAssoc:(id)a3;
- (void)setIsEdgeBSS:(BOOL)a3;
- (void)setIsHS2:(unint64_t)a3;
- (void)setLastBytesInSample:(unint64_t)a3;
- (void)setLastBytesOutSample:(unint64_t)a3;
- (void)setNetworkOriginator:(int)a3;
- (void)setNetworkRecord:(__WiFiNetwork *)a3;
- (void)setNetworkType:(int)a3;
- (void)setPhyMode:(unint64_t)a3;
- (void)setRssiAverage:(int64_t)a3;
- (void)setRttAverageActiveSession:(double)a3;
- (void)setRttAverageAsPolledViaInstantaneousScorecard:(double)a3;
- (void)setRttAverageAtBeginActiveSession:(double)a3;
- (void)setRttMinActiveSession:(double)a3;
- (void)setRttMinAtBeginActiveSession:(double)a3;
- (void)setRttVarianceActiveSession:(double)a3;
- (void)setRttVarianceAsPolledViaInstantaneousScorecard:(double)a3;
- (void)setRttVarianceAtBeginActiveSession:(double)a3;
- (void)setScorecardIdentifier:(id)a3;
- (void)setSecurityType:(unint64_t)a3;
- (void)setSnrAverage:(int64_t)a3;
- (void)setSsidHarvestStatus:(int)a3;
- (void)setTimeOfDay:(unint64_t)a3;
- (void)setWasCaptive:(BOOL)a3;
@end

@implementation WiFiPerfPerAssocSession

- (WiFiPerfPerAssocSession)initWithNetworkRecord:(void *)a3 managerRef:(void *)a4 andManagerQueue:(id)a5
{
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___WiFiPerfPerAssocSession;
  v10 = -[WiFiPerfPerAssocSession init](&v23, "init");
  if (!a3)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s initWithNetworkRecord: without networkRecord",  "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    }
    goto LABEL_12;
  }

  if (!a4)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s initWithNetworkRecord: without managerRef",  "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    }
    goto LABEL_12;
  }

  if (!v9)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s initWithNetworkRecord: without manager queue",  "-[WiFiPerfPerAssocSession initWithNetworkRecord:managerRef:andManagerQueue:]");
    }
LABEL_12:
    objc_autoreleasePoolPop(v22);

    v10 = 0LL;
    goto LABEL_5;
  }

  qword_1002199B8 = (uint64_t)a4;
  objc_storeStrong((id *)&qword_1002199B0, a5);
  v11 = sub_100095BC8(a3);
  v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v11,  sub_1000951FC((uint64_t)a3, @"BSSID"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  scorecardIdentifier = v10->_scorecardIdentifier;
  v10->_scorecardIdentifier = (NSString *)v13;

  v15 = sub_1000951FC((uint64_t)a3, @"BSSID");
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  connectedBSSID = v10->_connectedBSSID;
  v10->_connectedBSSID = (NSString *)v16;

  v18 = sub_100095BC8(a3);
  uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
  connectedSSID = v10->_connectedSSID;
  v10->_connectedSSID = (NSString *)v19;

  v10->_rttMinActiveSession = 3.40282347e38;
  v10->_rttVarianceActiveSession = -3.40282347e38;
  v10->_accuracyOfBestReading = 3.40282347e38;
  v10->_hasBeenFinalized = 0;
  v10->_ssidHarvestStatus = 1;
LABEL_5:

  return v10;
}

- (void)dealloc
{
  networkRecord = self->_networkRecord;
  if (networkRecord)
  {
    CFRelease(networkRecord);
    self->_networkRecord = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiPerfPerAssocSession;
  -[WiFiPerfPerAssocSession dealloc](&v4, "dealloc");
}

- (id)_deltaStartScorecard:(id)a3 fromEndScorecard:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 mutableCopy];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"adminDisables"]);
  id v9 = [v8 unsignedIntegerValue];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"adminDisables"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v9 - (_BYTE *)[v10 unsignedIntegerValue]));
  [v7 setObject:v11 forKeyedSubscript:@"adminDisables"];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"bytesIn"]);
  uint64_t v13 = [v12 unsignedIntegerValue];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bytesIn"]);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v13 - (_BYTE *)[v14 unsignedIntegerValue]));
  [v7 setObject:v15 forKeyedSubscript:@"bytesIn"];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"bytesOut"]);
  v17 = [v16 unsignedIntegerValue];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"bytesOut"]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v17 - (_BYTE *)[v18 unsignedIntegerValue]));
  [v7 setObject:v19 forKeyedSubscript:@"bytesOut"];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"connAttempts"]);
  v21 = [v20 unsignedIntegerValue];
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"connAttempts"]);
  objc_super v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v21 - (_BYTE *)[v22 unsignedIntegerValue]));
  [v7 setObject:v23 forKeyedSubscript:@"connAttempts"];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"connSuccesses"]);
  v25 = [v24 unsignedIntegerValue];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"connSuccesses"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v25 - (_BYTE *)[v26 unsignedIntegerValue]));
  [v7 setObject:v27 forKeyedSubscript:@"connSuccesses"];

  v28 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"certErrors"]);
  v29 = [v28 unsignedIntegerValue];
  v30 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"certErrors"]);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v29 - (_BYTE *)[v30 unsignedIntegerValue]));
  [v7 setObject:v31 forKeyedSubscript:@"certErrors"];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"dataStalls"]);
  v33 = [v32 unsignedIntegerValue];
  v34 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"dataStalls"]);
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v33 - (_BYTE *)[v34 unsignedIntegerValue]));
  [v7 setObject:v35 forKeyedSubscript:@"dataStalls"];

  v36 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"epochs"]);
  v37 = [v36 unsignedIntegerValue];
  v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"epochs"]);
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v37 - (_BYTE *)[v38 unsignedIntegerValue]));
  [v7 setObject:v39 forKeyedSubscript:@"epochs"];

  v40 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"faultyStay"]);
  v41 = [v40 unsignedIntegerValue];
  v42 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"faultyStay"]);
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v41 - (_BYTE *)[v42 unsignedIntegerValue]));
  [v7 setObject:v43 forKeyedSubscript:@"faultyStay"];

  v44 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"lowLqmStay"]);
  v45 = [v44 unsignedIntegerValue];
  v46 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lowLqmStay"]);
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v45 - (_BYTE *)[v46 unsignedIntegerValue]));
  [v7 setObject:v47 forKeyedSubscript:@"lowLqmStay"];

  v48 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"lowqStay"]);
  v49 = [v48 unsignedIntegerValue];
  v50 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lowqStay"]);
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v49 - (_BYTE *)[v50 unsignedIntegerValue]));
  [v7 setObject:v51 forKeyedSubscript:@"lowqStay"];

  v52 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"lqmTranCount"]);
  v53 = [v52 unsignedIntegerValue];
  v54 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lqmTranCount"]);
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v53 - (_BYTE *)[v54 unsignedIntegerValue]));
  [v7 setObject:v55 forKeyedSubscript:@"lqmTranCount"];

  v56 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"lqmTransitionRate"]);
  v57 = [v56 unsignedIntegerValue];
  v58 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lqmTransitionRate"]);
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v57 - (_BYTE *)[v58 unsignedIntegerValue]));
  [v7 setObject:v59 forKeyedSubscript:@"lqmTransitionRate"];

  v60 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"overallStay"]);
  v61 = [v60 unsignedIntegerValue];
  v62 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"overallStay"]);
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v61 - (_BYTE *)[v62 unsignedIntegerValue]));
  [v7 setObject:v63 forKeyedSubscript:@"overallStay"];

  v64 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetsIn"]);
  v65 = [v64 unsignedIntegerValue];
  v66 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"packetsIn"]);
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v65 - (_BYTE *)[v66 unsignedIntegerValue]));
  [v7 setObject:v67 forKeyedSubscript:@"packetsIn"];

  v68 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"packetsOut"]);
  v69 = [v68 unsignedIntegerValue];
  v70 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"packetsOut"]);
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v69 - (_BYTE *)[v70 unsignedIntegerValue]));
  [v7 setObject:v71 forKeyedSubscript:@"packetsOut"];

  v72 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"reTxBytes"]);
  v73 = [v72 unsignedIntegerValue];
  v74 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"reTxBytes"]);
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v73 - (_BYTE *)[v74 unsignedIntegerValue]));
  [v7 setObject:v75 forKeyedSubscript:@"reTxBytes"];

  v76 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"receivedDupes"]);
  v77 = [v76 unsignedIntegerValue];
  v78 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"receivedDupes"]);
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v77 - (_BYTE *)[v78 unsignedIntegerValue]));
  [v7 setObject:v79 forKeyedSubscript:@"receivedDupes"];

  v80 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"rxOutOfOrderBytes"]);
  v81 = [v80 unsignedIntegerValue];
  v82 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"rxOutOfOrderBytes"]);
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v81 - (_BYTE *)[v82 unsignedIntegerValue]));
  [v7 setObject:v83 forKeyedSubscript:@"rxOutOfOrderBytes"];

  v84 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"topDownloadRate"]);
  id v85 = [v84 unsignedIntegerValue];
  v86 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"topDownloadRate"]);

  id v87 = [v86 unsignedIntegerValue];
  if (v85 == v87) {
    [v7 setObject:&off_100205900 forKeyedSubscript:@"topDownloadRate"];
  }
  return v7;
}

- (void)accumulateActiveUsageWithScorecard:(id)a3
{
  id v56 = a3;
  if (v56)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedBSSID](self, "connectedBSSID"));
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"identifier"]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedBSSID](self, "connectedBSSID"));
      unsigned int v11 = [v9 hasSuffix:v10];

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allValues]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:0]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"bytesIn"]);
        -[WiFiPerfPerAssocSession setBytesInTotalActiveUsageSession:]( self,  "setBytesInTotalActiveUsageSession:",  (char *)-[WiFiPerfPerAssocSession bytesInTotalActiveUsageSession](self, "bytesInTotalActiveUsageSession")
        + (_BYTE *)[v15 unsignedIntegerValue]
        - (_BYTE *)-[WiFiPerfPerAssocSession lastBytesInSample](self, "lastBytesInSample"));

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allValues]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndex:0]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"bytesOut"]);
        -[WiFiPerfPerAssocSession setBytesOutTotalActiveUsageSession:]( self,  "setBytesOutTotalActiveUsageSession:",  (char *)-[WiFiPerfPerAssocSession bytesOutTotalActiveUsageSession](self, "bytesOutTotalActiveUsageSession")
        + (_BYTE *)[v19 unsignedIntegerValue]
        - (_BYTE *)-[WiFiPerfPerAssocSession lastBytesOutSample](self, "lastBytesOutSample"));

        v20 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allValues]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndex:0]);
        objc_super v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"bytesIn"]);
        -[WiFiPerfPerAssocSession setLastBytesInSample:]( self,  "setLastBytesInSample:",  [v23 unsignedIntegerValue]);

        v24 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 allValues]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndex:0]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"bytesOut"]);
        -[WiFiPerfPerAssocSession setLastBytesOutSample:]( self,  "setLastBytesOutSample:",  [v27 unsignedIntegerValue]);

        v28 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 allValues]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndex:0]);
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"rttAvg"]);
        [v31 doubleValue];
        double v33 = v32;

        if (v33 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttAverageAtBeginActiveSession](self, "rttAverageAtBeginActiveSession");
          if (v34 != 0.0)
          {
            -[WiFiPerfPerAssocSession rttAverageAtBeginActiveSession](self, "rttAverageAtBeginActiveSession");
            double v33 = (v33 + v35) * 0.5;
          }

          -[WiFiPerfPerAssocSession rttAverageActiveSession](self, "rttAverageActiveSession");
          if (v36 != 0.0)
          {
            -[WiFiPerfPerAssocSession rttAverageActiveSession](self, "rttAverageActiveSession");
            double v33 = (v33 + v37) * 0.5;
          }

          -[WiFiPerfPerAssocSession setRttAverageActiveSession:](self, "setRttAverageActiveSession:", v33);
        }

        v38 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v38 allValues]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndex:0]);
        v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKeyedSubscript:@"rttMin"]);
        [v41 doubleValue];
        double v43 = v42;

        -[WiFiPerfPerAssocSession rttMinAtBeginActiveSession](self, "rttMinAtBeginActiveSession");
        if (v44 != 0.0 && v43 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttMinAtBeginActiveSession](self, "rttMinAtBeginActiveSession");
          if (v43 < v45)
          {
            -[WiFiPerfPerAssocSession rttMinActiveSession](self, "rttMinActiveSession");
            if (v43 < v46) {
              -[WiFiPerfPerAssocSession setRttMinActiveSession:](self, "setRttMinActiveSession:", v43);
            }
          }
        }

        v47 = (void *)objc_claimAutoreleasedReturnValue([v56 objectForKeyedSubscript:@"instant"]);
        v48 = (void *)objc_claimAutoreleasedReturnValue([v47 allValues]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectAtIndex:0]);
        v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:@"rttVar"]);
        [v50 doubleValue];
        double v52 = v51;

        -[WiFiPerfPerAssocSession rttVarianceAtBeginActiveSession](self, "rttVarianceAtBeginActiveSession");
        if (v53 != 0.0 && v52 != 0.0)
        {
          -[WiFiPerfPerAssocSession rttVarianceAtBeginActiveSession](self, "rttVarianceAtBeginActiveSession");
          if (v52 > v54)
          {
            -[WiFiPerfPerAssocSession rttVarianceActiveSession](self, "rttVarianceActiveSession");
            if (v52 > v55) {
              -[WiFiPerfPerAssocSession setRttVarianceActiveSession:](self, "setRttVarianceActiveSession:", v52);
            }
          }
        }
      }
    }
  }
}

- (id)finalizeWithEndScorecard:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v5 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s without scorecard argument. Perhaps one wasn't received from Symptoms.",  "-[WiFiPerfPerAssocSession finalizeWithEndScorecard:]");
    }
    objc_autoreleasePoolPop(v5);
  }

  return 0LL;
}

- (void)ingestCurrentNetwork:(void *)a3
{
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_1000A7C20;
  v10[4] = sub_1000A7C30;
  unsigned int v11 = (WiFiPerfPerAssocSession *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = self;
  unsigned int v11 = v4;
  if (qword_1002199B8) {
    BOOL v5 = qword_1002199B0 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s Don't have WiFiManagerRef or the master queue, exit early",  "-[WiFiPerfPerAssocSession ingestCurrentNetwork:]");
    }
    objc_autoreleasePoolPop(v8);
  }

  else
  {
    id v6 = v4;
    if (-[WiFiPerfPerAssocSession networkRecord](v4, "networkRecord"))
    {
      CFRelease(-[WiFiPerfPerAssocSession networkRecord](v6, "networkRecord"));
      -[WiFiPerfPerAssocSession setNetworkRecord:](v6, "setNetworkRecord:", 0LL);
    }

    CFAllocatorRef Default = CFAllocatorGetDefault();
    -[WiFiPerfPerAssocSession setNetworkRecord:](v6, "setNetworkRecord:", sub_100094E60((uint64_t)Default, (uint64_t)a3));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A7C38;
    block[3] = &unk_1001E42A0;
    block[4] = v10;
    dispatch_sync((dispatch_queue_t)qword_100219F80, block);
  }

  _Block_object_dispose(v10, 8);
}

- (void)_updateNetworkOnManagerQueue:(id)a3
{
  id v28 = a3;
  if ([v28 networkRecord])
  {
    id v3 = (const __CFArray *)sub_100063560(qword_1002199B8);
    if (v3)
    {
      uint64_t v4 = v3;
      CFIndex Count = CFArrayGetCount(v3);
      if (Count)
      {
        CFIndex v6 = Count;
        id v7 = [v28 networkRecord];
        v29.location = 0LL;
        v29.length = v6;
        CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v29, v7);
        if ((FirstIndexOfValue & 0x8000000000000000LL) == 0)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v4, FirstIndexOfValue);
          [v28 setSecurityType:sub_100098EA8((uint64_t)ValueAtIndex)];
          [v28 setCaptiveFlag:sub_100097480((uint64_t)ValueAtIndex)];
          [v28 setIsHS2:sub_100095318((BOOL)ValueAtIndex)];
          [v28 setBand:sub_1000992D0((uint64_t)ValueAtIndex)];
          objc_msgSend(v28, "setChannel:", objc_msgSend((id)sub_100096A74((uint64_t)ValueAtIndex), "integerValue"));
          [v28 setChannelWidth:sub_10009A3FC((uint64_t)ValueAtIndex)];
          [v28 setPhyMode:sub_10009A3DC((uint64_t)ValueAtIndex)];
          [v28 setWasCaptive:sub_10009740C((uint64_t)ValueAtIndex)];
          [v28 setNetworkType:sub_10009F494((uint64_t)ValueAtIndex)];
          [v28 setNetworkOriginator:sub_10009EE28((uint64_t)ValueAtIndex)];
          v10 = sub_1000951FC((uint64_t)ValueAtIndex, @"BSSID");
          objc_msgSend(v28, "setIsEdgeBSS:", sub_10009C030(ValueAtIndex, v10) != 0);
          [v28 setSsidHarvestStatus:sub_1000A0430((uint64_t)ValueAtIndex)];
          unsigned int v11 = sub_100095BC8(ValueAtIndex);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          [v28 setAssocIsToNoMap:0];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
          unsigned int v14 = [v13 hasSuffix:@"_nomap"];

          if (v14) {
            [v28 setAssocIsToNoMap:1];
          }
          [v28 setAssocIsToApplePH:sub_100097700((uint64_t)ValueAtIndex) != 0];
          v15 = (const __CFArray *)sub_1000951FC((uint64_t)ValueAtIndex, @"lastTputMeasurementResults");
          if (v15)
          {
            uint64_t v16 = v15;
            if (CFArrayGetCount(v15) >= 1) {
              objc_msgSend(v28, "setAvgDLSpeed:", CFArrayGetValueAtIndex(v16, 0));
            }
          }

          v17 = sub_1000951FC((uint64_t)ValueAtIndex, @"AP_MODE");
          if (v17) {
            [v28 setApMode:v17];
          }
          v18 = objc_autoreleasePoolPush();
          uint64_t v19 = (void *)qword_100219F60;
          if (qword_100219F60)
          {
            id v27 = [v28 securityType];
            id v20 = [v28 captiveFlag];
            id v21 = [v28 channel];
            id v22 = [v28 phyMode];
            id v23 = [v28 networkType];
            id v24 = [v28 networkOriginator];
            id v25 = [v28 ssidHarvestStatus];
            v26 = (void *)objc_claimAutoreleasedReturnValue([v28 avgDLSpeed]);
            [v19 WFLog:3, "%s: %@: securityType: %lu captiveFlag: %lu channel: %ld phyMode: %lu networkType: %d originator: %d ssid-h arvest: %d avgDLSpeed: %@", "-[WiFiPerfPerAssocSession _updateNetworkOnManagerQueue:]", v12, v27, v20, v21, v22, v23, v24, v25, v26 message];
          }

          objc_autoreleasePoolPop(v18);
        }
      }
    }
  }
}

- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5
{
  if (v9 == 0.0 || (-[WiFiPerfPerAssocSession bestLongitudeReading](self, "bestLongitudeReading"), v10 == 0.0))
  {
    if (a3 == 0.0 || a4 == 0.0 || a5 == 0.0)
    {
      v12 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: invalid location (lat: %f, lng: %f) or accuracy (%f)",  "-[WiFiPerfPerAssocSession ingestLocationUpdateWithLat:andLon:andAccuracy:]",  *(void *)&a3,  *(void *)&a4,  *(void *)&a5);
      }
    }

    else
    {
      if (a5 < 100.1)
      {
        -[WiFiPerfPerAssocSession setAccuracyOfBestReading:](self, "setAccuracyOfBestReading:", a5);
        -[WiFiPerfPerAssocSession setBestLatitudeReading:](self, "setBestLatitudeReading:", a3);
        -[WiFiPerfPerAssocSession setBestLongitudeReading:](self, "setBestLongitudeReading:", a4);
        return 1;
      }

      v12 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: invalid location accuracy %f",  "-[WiFiPerfPerAssocSession ingestLocationUpdateWithLat:andLon:andAccuracy:]",  *(void *)&a5,  v13,  v14);
      }
    }

    objc_autoreleasePoolPop(v12);
  }

  return 0;
}

- (void)ingestLQMUpdate:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v4 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s without argument!",  "-[WiFiPerfPerAssocSession ingestLQMUpdate:]");
    }
    objc_autoreleasePoolPop(v4);
    id v3 = 0LL;
  }
}

- (void)ingestInstantaneousScorecardFromPolling:(id)a3
{
  id v12 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"instant"]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);
  CFIndex v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"rttVar"]);
  [v7 doubleValue];
  -[WiFiPerfPerAssocSession setRttVarianceAsPolledViaInstantaneousScorecard:]( self,  "setRttVarianceAsPolledViaInstantaneousScorecard:");

  v8 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"instant"]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allValues]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"rttAvg"]);
  [v11 doubleValue];
  -[WiFiPerfPerAssocSession setRttAverageAsPolledViaInstantaneousScorecard:]( self,  "setRttAverageAsPolledViaInstantaneousScorecard:");

  -[WiFiPerfPerAssocSession accumulateActiveUsageWithScorecard:](self, "accumulateActiveUsageWithScorecard:", v12);
}

- (void)ingestScanResults:(id)a3 currentSSID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](self, "connectedSSID"));
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    double v9 = objc_autoreleasePoolPush();
    double v10 = (void *)qword_100219F60;
    if (qword_100219F60)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession connectedSSID](self, "connectedSSID"));
      [v10 WFLog:3, "%s told to ingest scan results but the current SSID (%@) indicated with the scan results differs from that which WiFiPerfPerAssoc session was initialized with (%@)", "-[WiFiPerfPerAssocSession ingestScanResults:currentSSID:]", v6, v11, v12 message];
    }

    objc_autoreleasePoolPop(v9);
  }
}

- (void)beginTrackingActiveUsageWithScorecard:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"bytesIn"]);
  -[WiFiPerfPerAssocSession setBytesInAtBeginActiveUsageSession:]( self,  "setBytesInAtBeginActiveUsageSession:",  [v8 unsignedIntegerValue]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"bytesOut"]);
  -[WiFiPerfPerAssocSession setBytesOutAtBeginActiveUsageSession:]( self,  "setBytesOutAtBeginActiveUsageSession:",  [v12 unsignedIntegerValue]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allValues]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:0]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"rttAvg"]);
  [v16 doubleValue];
  -[WiFiPerfPerAssocSession setRttAverageAtBeginActiveSession:](self, "setRttAverageAtBeginActiveSession:");

  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allValues]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndex:0]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"rttMin"]);
  [v20 doubleValue];
  -[WiFiPerfPerAssocSession setRttMinAtBeginActiveSession:](self, "setRttMinAtBeginActiveSession:");

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allValues]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndex:0]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"rttVar"]);
  [v24 doubleValue];
  -[WiFiPerfPerAssocSession setRttVarianceAtBeginActiveSession:](self, "setRttVarianceAtBeginActiveSession:");

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 allValues]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectAtIndex:0]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"bytesIn"]);
  -[WiFiPerfPerAssocSession setLastBytesInSample:]( self,  "setLastBytesInSample:",  [v28 unsignedIntegerValue]);

  id v32 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"instant"]);
  CFRange v29 = (void *)objc_claimAutoreleasedReturnValue([v32 allValues]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndex:0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"bytesOut"]);
  -[WiFiPerfPerAssocSession setLastBytesOutSample:]( self,  "setLastBytesOutSample:",  [v31 unsignedIntegerValue]);
}

- (void)resetActiveUsageStats
{
}

- (void)calculateTimes
{
  double v4 = v3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSince1970];
  double v7 = v6 - v4;

  -[WiFiPerfPerAssocSession epochAtAssoc](self, "epochAtAssoc");
  if (v4 == 0.0)
  {
    double v9 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s: epochAtAssoc is invalid, using current date for midpoint",  "-[WiFiPerfPerAssocSession calculateTimes]");
    }
    objc_autoreleasePoolPop(v9);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSince1970];
    double v12 = v11;
  }

  else
  {
    double v12 = v8 + v7 * 0.5;
  }

  -[WiFiPerfPerAssocSession _roundTimeInterval:toNearestNumberOfHours:]( self,  "_roundTimeInterval:toNearestNumberOfHours:",  3LL,  v12);
  -[WiFiPerfPerAssocSession setTimeOfDay:](self, "setTimeOfDay:", (unint64_t)v13);
  if (v7 >= 60.0)
  {
    if (v7 >= 300.0)
    {
      if (v7 >= 1200.0)
      {
        if (v7 >= 3600.0 || v7 < 1200.0) {
          -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 5LL);
        }
        else {
          -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 4LL);
        }
      }

      else
      {
        -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 3LL);
      }
    }

    else
    {
      -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 2LL);
    }
  }

  else
  {
    -[WiFiPerfPerAssocSession setAssociatedTime:](self, "setAssociatedTime:", 1LL);
  }

- (double)_roundTimeInterval:(double)a3 toNearestNumberOfHours:(int64_t)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", a3));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 components:124 fromDate:v5]);

  uint64_t v8 = (uint64_t)[v7 hour];
  int64_t v9 = v8 % a4;
  if (a4 >= 0) {
    int64_t v10 = a4;
  }
  else {
    int64_t v10 = a4 + 1;
  }
  [v7 setHour:v8 - v9];
  [v7 setMinute:0];
  [v7 setSecond:0];
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 dateFromComponents:v7]);
  [v12 timeIntervalSince1970];
  double v14 = v13;

  return v14;
}

- (unint64_t)_roundPacketCount:(unint64_t)a3
{
  unint64_t v3 = 100000000LL;
  if (a3 > 0x5F5E100) {
    return v3;
  }
  if (a3 < 0x64) {
    return 0LL;
  }
  return -[WiFiPerfPerAssocSession _getSingleSigFigForValue:](self, "_getSingleSigFigForValue:");
}

- (unint64_t)_roundByteCount:(unint64_t)a3
{
  if (a3 > 0x2541B263FLL) {
    return 10000LL;
  }
  if (a3 >= 0xF4240) {
    return -[WiFiPerfPerAssocSession _getSingleSigFigForValue:](self, "_getSingleSigFigForValue:", a3 / 0xF4240);
  }
  return 0LL;
}

- (unint64_t)_getSingleSigFigForValue:(unint64_t)a3
{
  if (!a3) {
    return 0LL;
  }
  double v4 = log10((double)a3);
  double v5 = __exp10(floor(v4));
  return a3 / (unint64_t)v5 * (unint64_t)v5;
}

- (int)_assocReasonToGeoAssocReason:(int)a3
{
  else {
    return 0;
  }
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocSession scorecardIdentifier](self, "scorecardIdentifier"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WiFiPerfPerAssocSession with identifier: %@",  v2));

  return v3;
}

- (double)doNotFinalizePriorToEpoch
{
  return self->_doNotFinalizePriorToEpoch;
}

- (void)setDoNotFinalizePriorToEpoch:(double)a3
{
  self->_doNotFinalizePriorToEpoch = a3;
}

- (NSString)scorecardIdentifier
{
  return self->_scorecardIdentifier;
}

- (void)setScorecardIdentifier:(id)a3
{
}

- (NSString)connectedBSSID
{
  return self->_connectedBSSID;
}

- (void)setConnectedBSSID:(id)a3
{
}

- (NSDictionary)historicalScorecardAtAssoc
{
  return self->_historicalScorecardAtAssoc;
}

- (void)setHistoricalScorecardAtAssoc:(id)a3
{
}

- (double)epochAtAssoc
{
  return self->_epochAtAssoc;
}

- (void)setEpochAtAssoc:(double)a3
{
  self->_epochAtAssoc = a3;
}

- (unint64_t)assocReason
{
  return self->_assocReason;
}

- (void)setAssocReason:(unint64_t)a3
{
  self->_assocReason = a3;
}

- (unint64_t)disAssocReason
{
  return self->_disAssocReason;
}

- (void)setDisAssocReason:(unint64_t)a3
{
  self->_disAssocReason = a3;
}

- (BOOL)hasBeenFinalized
{
  return self->_hasBeenFinalized;
}

- (void)setHasBeenFinalized:(BOOL)a3
{
  self->_hasBeenFinalized = a3;
}

- (unint64_t)bytesInAtBeginActiveUsageSession
{
  return self->_bytesInAtBeginActiveUsageSession;
}

- (void)setBytesInAtBeginActiveUsageSession:(unint64_t)a3
{
  self->_bytesInAtBeginActiveUsageSession = a3;
}

- (unint64_t)bytesOutAtBeginActiveUsageSession
{
  return self->_bytesOutAtBeginActiveUsageSession;
}

- (void)setBytesOutAtBeginActiveUsageSession:(unint64_t)a3
{
  self->_bytesOutAtBeginActiveUsageSession = a3;
}

- (unint64_t)bytesInTotalActiveUsageSession
{
  return self->_bytesInTotalActiveUsageSession;
}

- (void)setBytesInTotalActiveUsageSession:(unint64_t)a3
{
  self->_bytesInTotalActiveUsageSession = a3;
}

- (unint64_t)bytesOutTotalActiveUsageSession
{
  return self->_bytesOutTotalActiveUsageSession;
}

- (void)setBytesOutTotalActiveUsageSession:(unint64_t)a3
{
  self->_bytesOutTotalActiveUsageSession = a3;
}

- (unint64_t)lastBytesInSample
{
  return self->_lastBytesInSample;
}

- (void)setLastBytesInSample:(unint64_t)a3
{
  self->_lastBytesInSample = a3;
}

- (unint64_t)lastBytesOutSample
{
  return self->_lastBytesOutSample;
}

- (void)setLastBytesOutSample:(unint64_t)a3
{
  self->_lastBytesOutSample = a3;
}

- (double)rttMinActiveSession
{
  return self->_rttMinActiveSession;
}

- (void)setRttMinActiveSession:(double)a3
{
  self->_rttMinActiveSession = a3;
}

- (double)rttMinAtBeginActiveSession
{
  return self->_rttMinAtBeginActiveSession;
}

- (void)setRttMinAtBeginActiveSession:(double)a3
{
  self->_rttMinAtBeginActiveSession = a3;
}

- (double)rttAverageActiveSession
{
  return self->_rttAverageActiveSession;
}

- (void)setRttAverageActiveSession:(double)a3
{
  self->_rttAverageActiveSession = a3;
}

- (double)rttAverageAtBeginActiveSession
{
  return self->_rttAverageAtBeginActiveSession;
}

- (void)setRttAverageAtBeginActiveSession:(double)a3
{
  self->_rttAverageAtBeginActiveSession = a3;
}

- (double)rttVarianceActiveSession
{
  return self->_rttVarianceActiveSession;
}

- (void)setRttVarianceActiveSession:(double)a3
{
  self->_rttVarianceActiveSession = a3;
}

- (double)rttVarianceAtBeginActiveSession
{
  return self->_rttVarianceAtBeginActiveSession;
}

- (void)setRttVarianceAtBeginActiveSession:(double)a3
{
  self->_rttVarianceAtBeginActiveSession = a3;
}

- (int64_t)ccaAverage
{
  return self->_ccaAverage;
}

- (void)setCcaAverage:(int64_t)a3
{
  self->_ccaAverage = a3;
}

- (int64_t)rssiAverage
{
  return self->_rssiAverage;
}

- (void)setRssiAverage:(int64_t)a3
{
  self->_rssiAverage = a3;
}

- (int64_t)snrAverage
{
  return self->_snrAverage;
}

- (void)setSnrAverage:(int64_t)a3
{
  self->_snrAverage = a3;
}

- (NSString)connectedSSID
{
  return self->_connectedSSID;
}

- (void)setConnectedSSID:(id)a3
{
}

- (double)bestLatitudeReading
{
  return self->_bestLatitudeReading;
}

- (void)setBestLatitudeReading:(double)a3
{
  self->_bestLatitudeReading = a3;
}

- (double)bestLongitudeReading
{
  return self->_bestLongitudeReading;
}

- (void)setBestLongitudeReading:(double)a3
{
  self->_bestLongitudeReading = a3;
}

- (double)accuracyOfBestReading
{
  return self->_accuracyOfBestReading;
}

- (void)setAccuracyOfBestReading:(double)a3
{
  self->_accuracyOfBestReading = a3;
}

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_securityType = a3;
}

- (unint64_t)captiveFlag
{
  return self->_captiveFlag;
}

- (void)setCaptiveFlag:(unint64_t)a3
{
  self->_captiveFlag = a3;
}

- (unint64_t)colocatedState
{
  return self->_colocatedState;
}

- (void)setColocatedState:(unint64_t)a3
{
  self->_colocatedState = a3;
}

- (unint64_t)isHS2
{
  return self->_isHS2;
}

- (void)setIsHS2:(unint64_t)a3
{
  self->_isHS2 = a3;
}

- (unint64_t)band
{
  return self->_band;
}

- (void)setBand:(unint64_t)a3
{
  self->_band = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (unint64_t)channelWidth
{
  return self->_channelWidth;
}

- (void)setChannelWidth:(unint64_t)a3
{
  self->_channelWidth = a3;
}

- (unint64_t)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(unint64_t)a3
{
  self->_phyMode = a3;
}

- (unint64_t)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(unint64_t)a3
{
  self->_timeOfDay = a3;
}

- (unint64_t)associatedTime
{
  return self->_associatedTime;
}

- (void)setAssociatedTime:(unint64_t)a3
{
  self->_associatedTime = a3;
}

- (BOOL)wasCaptive
{
  return self->_wasCaptive;
}

- (void)setWasCaptive:(BOOL)a3
{
  self->_wasCaptive = a3;
}

- (BOOL)assocIsToApplePH
{
  return self->_assocIsToApplePH;
}

- (void)setAssocIsToApplePH:(BOOL)a3
{
  self->_assocIsToApplePH = a3;
}

- (BOOL)assocIsToNoMap
{
  return self->_assocIsToNoMap;
}

- (void)setAssocIsToNoMap:(BOOL)a3
{
  self->_assocIsToNoMap = a3;
}

- (int)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (NSString)bssidOfNetworkForLastReceivedAssocIndication
{
  return self->_bssidOfNetworkForLastReceivedAssocIndication;
}

- (void)setBssidOfNetworkForLastReceivedAssocIndication:(id)a3
{
}

- (double)rttVarianceAsPolledViaInstantaneousScorecard
{
  return self->_rttVarianceAsPolledViaInstantaneousScorecard;
}

- (void)setRttVarianceAsPolledViaInstantaneousScorecard:(double)a3
{
  self->_rttVarianceAsPolledViaInstantaneousScorecard = a3;
}

- (double)rttAverageAsPolledViaInstantaneousScorecard
{
  return self->_rttAverageAsPolledViaInstantaneousScorecard;
}

- (void)setRttAverageAsPolledViaInstantaneousScorecard:(double)a3
{
  self->_rttAverageAsPolledViaInstantaneousScorecard = a3;
}

- (NSString)bssidAtPollingStart
{
  return self->_bssidAtPollingStart;
}

- (void)setBssidAtPollingStart:(id)a3
{
  self->_bssidAtPollingStart = (NSString *)a3;
}

- (int)networkOriginator
{
  return self->_networkOriginator;
}

- (void)setNetworkOriginator:(int)a3
{
  self->_networkOriginator = a3;
}

- (BOOL)isEdgeBSS
{
  return self->_isEdgeBSS;
}

- (void)setIsEdgeBSS:(BOOL)a3
{
  self->_isEdgeBSS = a3;
}

- (__WiFiNetwork)networkRecord
{
  return self->_networkRecord;
}

- (void)setNetworkRecord:(__WiFiNetwork *)a3
{
  self->_networkRecord = a3;
}

- (NSNumber)avgDLSpeed
{
  return self->_avgDLSpeed;
}

- (void)setAvgDLSpeed:(id)a3
{
}

- (NSNumber)apMode
{
  return self->_apMode;
}

- (void)setApMode:(id)a3
{
}

- (int)ssidHarvestStatus
{
  return self->_ssidHarvestStatus;
}

- (void)setSsidHarvestStatus:(int)a3
{
  self->_ssidHarvestStatus = a3;
}

- (void).cxx_destruct
{
}

@end