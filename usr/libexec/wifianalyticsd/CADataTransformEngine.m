@interface CADataTransformEngine
- (BOOL)computeSnapshotValidity:(unint64_t)a3 snapshotTimestamp:(id)a4 validityThreshold:(unint64_t)a5;
- (BOOL)transformAndSubmitDNSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5;
- (BOOL)transformAndSubmitDPSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5;
- (BOOL)transformAndSubmitSWMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5;
- (CADataTransformEngine)init;
- (RecommendationPreferences)preferences;
- (double)computePercentage:(unint64_t)a3 denomenator:(unint64_t)a4;
- (unint64_t)compareValues:(unint64_t)a3 second:(unint64_t)a4;
- (unint64_t)computeDifferenceBetweenDates:(id)a3 end:(id)a4;
- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4;
- (void)computeDPSRecoveryIndex:(id)a3 timestamps:(id)a4 andReply:(id)a5;
- (void)findTxCompletionFailureWithMaxCount:(id)a3 andReply:(id)a4;
- (void)setPreferences:(id)a3;
@end

@implementation CADataTransformEngine

- (CADataTransformEngine)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CADataTransformEngine;
  v2 = -[CADataTransformEngine init](&v10, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[RecommendationPreferences sharedObject](&OBJC_CLASS___RecommendationPreferences, "sharedObject"));
  preferences = v2->_preferences;
  v2->_preferences = (RecommendationPreferences *)v3;

  if (!v2->_preferences)
  {
    id v6 = WALogCategoryDefaultHandle();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[CADataTransformEngine init]";
      __int16 v13 = 1024;
      int v14 = 82;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error RecommendationPreferences init",  buf,  0x12u);
    }

    id v8 = WALogCategoryDefaultHandle();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v12 = "-[CADataTransformEngine init]";
      __int16 v13 = 1024;
      int v14 = 87;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error initializing CADataTransformEngine",  buf,  0x12u);
    }

    return 0LL;
  }

  return v2;
}

- (BOOL)computeSnapshotValidity:(unint64_t)a3 snapshotTimestamp:(id)a4 validityThreshold:(unint64_t)a5
{
  return v7 > (double)a3 && (unint64_t)v7 - a3 <= a5;
}

- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend(v6, "setDropped:", objc_msgSend(v6, "dropped") + objc_msgSend(v5, "dropped"));
  objc_msgSend(v6, "setNoBuf:", objc_msgSend(v6, "noBuf") + objc_msgSend(v5, "noBuf"));
  objc_msgSend( v6,  "setNoResources:",  objc_msgSend(v6, "noResources") + objc_msgSend(v5, "noResources"));
  objc_msgSend(v6, "setNoAck:", objc_msgSend(v6, "noAck") + objc_msgSend(v5, "noAck"));
  objc_msgSend( v6,  "setChipModeError:",  objc_msgSend(v6, "chipModeError") + objc_msgSend(v5, "chipModeError"));
  objc_msgSend(v6, "setExpired:", objc_msgSend(v6, "expired") + objc_msgSend(v5, "expired"));
  objc_msgSend( v6,  "setTxFailure:",  objc_msgSend(v6, "txFailure") + objc_msgSend(v5, "txFailure"));
  objc_msgSend( v6,  "setFirmwareFreePacket:",  objc_msgSend(v6, "firmwareFreePacket") + objc_msgSend(v5, "firmwareFreePacket"));
  objc_msgSend( v6,  "setMaxRetries:",  objc_msgSend(v6, "maxRetries") + objc_msgSend(v5, "maxRetries"));
  LODWORD(a3) = [v5 forceLifetimeExp];

  objc_msgSend(v6, "setForceLifetimeExp:", objc_msgSend(v6, "forceLifetimeExp") + a3);
}

- (void)findTxCompletionFailureWithMaxCount:(id)a3 andReply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, unint64_t, void *))a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  uint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  uint64_t v11 = 1LL;
  while (2)
  {
    switch(v11)
    {
      case 1LL:
        unsigned int v12 = [v5 dropped];
        goto LABEL_13;
      case 2LL:
        unsigned int v12 = [v5 noBuf];
        goto LABEL_13;
      case 3LL:
        unsigned int v12 = [v5 noResources];
        goto LABEL_13;
      case 4LL:
        unsigned int v12 = [v5 noAck];
        goto LABEL_13;
      case 5LL:
        unsigned int v12 = [v5 chipModeError];
        goto LABEL_13;
      case 6LL:
        unsigned int v12 = [v5 expired];
        goto LABEL_13;
      case 7LL:
        unsigned int v12 = [v5 txFailure];
        goto LABEL_13;
      case 8LL:
        unsigned int v12 = [v5 firmwareFreePacket];
        goto LABEL_13;
      case 9LL:
        unsigned int v12 = [v5 maxRetries];
        goto LABEL_13;
      case 10LL:
        unsigned int v12 = [v5 forceLifetimeExp];
LABEL_13:
        BOOL v13 = v10 >= v12;
        if (v10 <= v12) {
          unint64_t v10 = v12;
        }
        if (!v13) {
          uint64_t v9 = v11;
        }
        int v14 = @"1";
        if (!v12) {
          goto LABEL_18;
        }
        goto LABEL_19;
      default:
LABEL_18:
        int v14 = @"0";
LABEL_19:
        [v7 insertString:v14 atIndex:0];
        if (++v11 != 11) {
          continue;
        }
        v15 = (char *)[v7 length];
        if (v15)
        {
          v16 = v15 - 1;
          do
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v16, 1));
            [v8 appendString:v17];

            --v16;
          }

          while (v16 != (char *)-1LL);
        }

        id v18 = WALogCategoryDefaultHandle();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136446722;
          v21 = "-[CADataTransformEngine findTxCompletionFailureWithMaxCount:andReply:]";
          __int16 v22 = 1024;
          int v23 = 181;
          __int16 v24 = 2112;
          v25 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:txStatusString: %@",  (uint8_t *)&v20,  0x1Cu);
        }

        v6[2](v6, v9, v10, v8);
        return;
    }
  }

- (void)computeDPSRecoveryIndex:(id)a3 timestamps:(id)a4 andReply:(id)a5
{
  id v8 = a3;
  id v43 = a4;
  v42 = (void (**)(id, uint64_t, id, uint64_t))a5;
  v39 = self;
  unint64_t v9 = -[RecommendationPreferences dps_interrogation_sample_count](self->_preferences, "dps_interrogation_sample_count");
  id v40 = [v8 dpsCounterSamplesCount];
  if (v9)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    unsigned int v12 = 0LL;
    unsigned int v13 = 0;
    id v41 = v8;
    unint64_t v38 = v9;
    while (1)
    {
      int v14 = v11;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dpsCounterSampleAtIndex:v10]);

      if (!v11) {
        break;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue([v11 peerStats]);

      if (!v15)
      {
        unsigned int v12 = 0LL;
        break;
      }

      unsigned int v12 = v15;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 acCompletions]);
      id v17 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v49;
        while (2)
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v49 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)i);
            if ([v21 ac]
              && [v21 durSinceLastSuccessfulComp] / 0x3E8 < v13 + 8)
            {
              unint64_t v22 = v13 + 5;
              uint64_t v23 = 1LL;
              goto LABEL_17;
            }
          }

          id v18 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v10 = ++v13;
      unint64_t v9 = v38;
      id v8 = v41;
      if (v38 <= v13) {
        goto LABEL_20;
      }
    }

    unint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_38;
  }

  unsigned int v12 = 0LL;
  uint64_t v11 = 0LL;
LABEL_20:
  if ((unint64_t)v40 <= v9)
  {
    unint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v25 = 1LL;
LABEL_38:
    __int16 v24 = v43;
    goto LABEL_42;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v8 dpsCounterSamples]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastObject]);

  __int16 v24 = v43;
  if (!v27)
  {
    uint64_t v11 = 0LL;
    unint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_42;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 peerStats]);

  if (!v28)
  {
    unsigned int v12 = 0LL;
    unint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_41;
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"start"]);
  if (!v29
    || (v30 = (void *)v29,
        v31 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"end"]),
        v31,
        v30,
        !v31))
  {
    unint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v25 = 1LL;
LABEL_40:
    unsigned int v12 = v28;
LABEL_41:
    uint64_t v11 = v27;
    goto LABEL_42;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"start"]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"end"]);
  id v34 = -[CADataTransformEngine computeDifferenceBetweenDates:end:](v39, "computeDifferenceBetweenDates:end:", v32, v33);

  if ((unint64_t)v34 <= v9
    || v34 > (id)-[RecommendationPreferences dps_report_sent_after](v39->_preferences, "dps_report_sent_after"))
  {
    unint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v25 = 0LL;
    goto LABEL_40;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v28 acCompletions]);
  unint64_t v22 = (unint64_t)[v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v22)
  {
    id v41 = v8;
    uint64_t v35 = *(void *)v45;
    while (2)
    {
      for (j = 0LL; j != (void *)v22; j = (char *)j + 1)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v16);
        }
        v37 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
        if ([v37 ac]
          && (unint64_t)v34 + 8 > [v37 durSinceLastSuccessfulComp] / 0x3E8uLL)
        {
          unint64_t v22 = ((_DWORD)v34 + 5);
          uint64_t v23 = 1LL;
          goto LABEL_44;
        }
      }

      unint64_t v22 = (unint64_t)[v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v22) {
        continue;
      }
      break;
    }

    uint64_t v23 = 0LL;
LABEL_44:
    unsigned int v12 = v28;
    uint64_t v11 = v27;
LABEL_17:
    id v8 = v41;
    __int16 v24 = v43;
  }

  else
  {
    uint64_t v23 = 0LL;
    unsigned int v12 = v28;
    uint64_t v11 = v27;
  }

  uint64_t v25 = 1LL;
LABEL_42:
  v42[2](v42, v23, (id)v22, v25);
}

- (unint64_t)computeDifferenceBetweenDates:(id)a3 end:(id)a4
{
  return (unint64_t)v4;
}

- (unint64_t)compareValues:(unint64_t)a3 second:(unint64_t)a4
{
  if (a4 <= a3) {
    return a4 != a3;
  }
  else {
    return 2LL;
  }
}

- (double)computePercentage:(unint64_t)a3 denomenator:(unint64_t)a4
{
  if (a4) {
    return (double)a3 / (double)a4 * 100.0;
  }
  else {
    return 0.0;
  }
}

- (BOOL)transformAndSubmitDPSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_autoreleasePoolPush();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000729DC;
  v23[3] = &unk_1000CDA30;
  id v12 = v9;
  id v24 = v12;
  uint64_t v25 = self;
  id v13 = v8;
  id v26 = v13;
  id v14 = v10;
  id v27 = v14;
  char v15 = AnalyticsSendEventLazy(@"com.apple.wifi.dps.notification", v23);
  id v16 = WALogCategoryDefaultHandle();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v29 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]";
      __int16 v30 = 1024;
      int v31 = 448;
      uint64_t v19 = "%{public}s::%d:Submitted DPS metric (CA)";
      int v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0x12u);
    }
  }

  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v29 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]";
    __int16 v30 = 1024;
    int v31 = 446;
    uint64_t v19 = "%{public}s::%d:Failed sending DPS metric (CA)";
    int v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
  return v15;
}

- (BOOL)transformAndSubmitDNSMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_autoreleasePoolPush();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100074834;
  v23[3] = &unk_1000CDA30;
  id v12 = v9;
  id v24 = v12;
  uint64_t v25 = self;
  id v13 = v8;
  id v26 = v13;
  id v14 = v10;
  id v27 = v14;
  char v15 = AnalyticsSendEventLazy(@"com.apple.wifi.dns.notification", v23);
  id v16 = WALogCategoryDefaultHandle();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v29 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]";
      __int16 v30 = 1024;
      int v31 = 793;
      uint64_t v19 = "%{public}s::%d:Submitted DNS metric (CA)";
      int v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0x12u);
    }
  }

  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v29 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]";
    __int16 v30 = 1024;
    int v31 = 791;
    uint64_t v19 = "%{public}s::%d:Failed sending DNS metric (CA)";
    int v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
  return v15;
}

- (BOOL)transformAndSubmitSWMessageToCA:(id)a3 additionalInfo:(id)a4 timestamps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_autoreleasePoolPush();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000781B0;
  v22[3] = &unk_1000CDA58;
  id v12 = v9;
  id v23 = v12;
  id v24 = self;
  id v13 = v8;
  id v25 = v13;
  char v14 = AnalyticsSendEventLazy(@"com.apple.wifi.sw.notification", v22);
  id v15 = WALogCategoryDefaultHandle();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  id v17 = v16;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v27 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]";
      __int16 v28 = 1024;
      int v29 = 1044;
      id v18 = "%{public}s::%d:Submitted SW metric (CA)";
      uint64_t v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, 0x12u);
    }
  }

  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    id v27 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]";
    __int16 v28 = 1024;
    int v29 = 1042;
    id v18 = "%{public}s::%d:Failed sending SW metric (CA)";
    uint64_t v19 = v17;
    os_log_type_t v20 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v11);
  return v14;
}

- (RecommendationPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end