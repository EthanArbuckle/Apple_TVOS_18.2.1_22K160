@interface WADatapathDiagnosticsMessageSubmitter
- (SDRDiagnosticReporter)ABCReporter;
- (WADatapathDiagnosticsMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitDPEMessage:(id)a3;
- (id)submitDPSRMessage:(id)a3;
- (id)submitMessage:(id)a3;
- (id)submitSlowWiFiMessage:(id)a3;
- (int)findTxCompletionFailureWithMaxCount:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)computeAggregateTxCompletionStatus:(id)a3 source:(id)a4;
- (void)setABCReporter:(id)a3;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WADatapathDiagnosticsMessageSubmitter

- (WADatapathDiagnosticsMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WADatapathDiagnosticsMessageSubmitter;
  v4 = -[WADatapathDiagnosticsMessageSubmitter init](&v10, "init");
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2050000000LL;
  v5 = (void *)qword_1000ED060;
  uint64_t v15 = qword_1000ED060;
  if (!qword_1000ED060)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100083ED0;
    v11[3] = &unk_1000CD9A0;
    v11[4] = &v12;
    sub_100083ED0((uint64_t)v11);
    v5 = (void *)v13[3];
  }

  v6 = v5;
  _Block_object_dispose(&v12, 8);
  v7 = (SDRDiagnosticReporter *)objc_alloc_init(v6);
  ABCReporter = v4->_ABCReporter;
  v4->_ABCReporter = v7;

  v4->_groupTypeForThisSubmitter = a3;
  return v4;
}

- (id)submitMessage:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
    int v18 = 136446722;
    v19 = "-[WADatapathDiagnosticsMessageSubmitter submitMessage:]";
    __int16 v20 = 1024;
    int v21 = 81;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Attempting to submit: %@",  (uint8_t *)&v18,  0x1Cu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
  unsigned int v9 = [v8 isEqualToString:@"DPSR"];

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:](self, "submitDPEMessage:", v4));
LABEL_7:
    v13 = (void *)v10;
    goto LABEL_11;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
  unsigned int v12 = [v11 isEqualToString:@"SWFR"];

  if (v12)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:](self, "submitSlowWiFiMessage:", v4));
    goto LABEL_7;
  }

  id v14 = WALogCategoryDefaultHandle();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
    int v18 = 136446722;
    v19 = "-[WADatapathDiagnosticsMessageSubmitter submitMessage:]";
    __int16 v20 = 1024;
    int v21 = 90;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No Processor for key %@",  (uint8_t *)&v18,  0x1Cu);
  }

  v13 = 0LL;
LABEL_11:

  return v13;
}

- (id)submitSlowWiFiMessage:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
    *(_DWORD *)buf = 136446722;
    v39 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]";
    __int16 v40 = 1024;
    int v41 = 99;
    __int16 v42 = 2112;
    v43 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Attempting to submit: %@",  buf,  0x1Cu);
  }

  v8 = objc_autoreleasePoolPush();
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]( self,  "instantiateAWDProtobufAndPopulateValues:",  v4));
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
    v31 = v8;
    id v32 = v4;
    if ([v11 hasSlowNotice])
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 slowNotice]);
      id v13 = [v12 recoveryReason];
      if (v13 > 0x11)
      {
        v19 = 0LL;
        id v25 = 0LL;
        id v24 = 0LL;
        v26 = 0LL;
        goto LABEL_10;
      }

      id v14 = v13;
      v30 = v12;
    }

    else
    {
      id v14 = 0LL;
      v30 = 0LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Slow WiFi"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"recoveryReason 0x%x",  v14));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000CF610]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000CF610]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:]( self->_ABCReporter,  "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:",  @"WiFi",  @"Slow WiFi",  v17,  v18,  @"wifianalyticsd",  0LL));
    __int16 v20 = objc_alloc(&OBJC_CLASS___NSArray);
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionaryRepresentation]);
    __int16 v22 = -[NSArray initWithObjects:](v20, "initWithObjects:", v21, 0LL);

    ABCReporter = self->_ABCReporter;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10007E764;
    v33[3] = &unk_1000CDCA0;
    id v24 = v15;
    id v34 = v24;
    id v25 = v16;
    id v35 = v25;
    -[SDRDiagnosticReporter snapshotWithSignature:duration:events:payload:actions:reply:]( ABCReporter,  "snapshotWithSignature:duration:events:payload:actions:reply:",  v19,  v22,  0LL,  0LL,  v33,  10.0);

    v26 = 0LL;
    v8 = v31;
    id v4 = v32;
    unsigned int v12 = v30;
  }

  else
  {
    id v28 = WALogCategoryDefaultHandle();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]";
      __int16 v40 = 1024;
      int v41 = 110;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error creating data to send to ABC",  buf,  0x12u);
    }

    NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
    v37 = @"WAErrorCodeSubmissionModelFailure";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9007LL,  v17));
    unsigned int v12 = 0LL;
    v19 = 0LL;
    id v25 = 0LL;
    id v24 = 0LL;
  }

LABEL_10:
  objc_autoreleasePoolPop(v8);

  return v26;
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

- (int)findTxCompletionFailureWithMaxCount:(id)a3
{
  id v3 = a3;
  unsigned int v4 = 0;
  int v5 = 0;
  for (uint64_t i = 1LL; ; ++i)
  {
    switch(i)
    {
      case 1LL:
        if ([v3 dropped] > v4)
        {
          unsigned int v4 = [v3 dropped];
          int v5 = 1;
        }

        break;
      case 2LL:
        if ([v3 noBuf] > v4)
        {
          unsigned int v4 = [v3 noBuf];
          int v5 = 2;
        }

        break;
      case 3LL:
        if ([v3 noResources] > v4)
        {
          unsigned int v4 = [v3 noResources];
          int v5 = 3;
        }

        break;
      case 4LL:
        if ([v3 noAck] > v4)
        {
          unsigned int v4 = [v3 noAck];
          int v5 = 4;
        }

        break;
      case 5LL:
        if ([v3 chipModeError] > v4)
        {
          unsigned int v4 = [v3 chipModeError];
          int v5 = 5;
        }

        break;
      case 6LL:
        if ([v3 expired] > v4)
        {
          unsigned int v4 = [v3 expired];
          int v5 = 6;
        }

        break;
      case 7LL:
        if ([v3 txFailure] > v4)
        {
          unsigned int v4 = [v3 txFailure];
          int v5 = 7;
        }

        break;
      case 8LL:
        if ([v3 firmwareFreePacket] > v4)
        {
          unsigned int v4 = [v3 firmwareFreePacket];
          int v5 = 8;
        }

        break;
      case 9LL:
        if ([v3 maxRetries] > v4)
        {
          unsigned int v4 = [v3 maxRetries];
          int v5 = 9;
        }

        break;
      case 10LL:
        if ([v3 forceLifetimeExp] <= v4)
        {
          if (v5) {
            int v7 = v5;
          }
          else {
            int v7 = -1;
          }
        }

        else
        {
          [v3 forceLifetimeExp];
          int v7 = 10;
        }

        return v7;
      default:
        continue;
    }
  }

- (id)submitDPEMessage:(id)a3
{
  id v59 = a3;
  id v4 = WALogCategoryDefaultHandle();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v59 key]);
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 246;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Attempting to submit: %@",  buf,  0x1Cu);
  }

  context = objc_autoreleasePoolPush();
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_10007F628;
  v75 = sub_10007F638;
  id v76 = 0LL;
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x3032000000LL;
  v65 = sub_10007F628;
  v66 = sub_10007F638;
  id v67 = 0LL;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]( self,  "instantiateAWDProtobufAndPopulateValues:",  v59));
  v60 = v7;
  if (v7)
  {
    id v8 = v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dpsEpiloge]);

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 dpsEpiloge]);
      unsigned int v11 = [v10 action];
      if ((v11 & 2) != 0)
      {
        id v12 = WALogCategoryDefaultHandle();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v72 = 1024;
          int v73 = 268;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found Action - Slow DPS Reset",  v70,  0x12u);
        }

        int v14 = 0;
        int v57 = 0;
        int v15 = 0;
      }

      else if (([v10 action] & 4) != 0)
      {
        id v20 = WALogCategoryDefaultHandle();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v72 = 1024;
          int v73 = 271;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found Action - Fast DPS Reset",  v70,  0x12u);
        }

        int v14 = 0;
        int v57 = 0;
        int v15 = 1;
      }

      else if (([v10 action] & 0x40) != 0)
      {
        id v21 = WALogCategoryDefaultHandle();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v72 = 1024;
          int v73 = 274;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found Action - Symptoms DNS Reset",  v70,  0x12u);
        }

        int v14 = 0;
        int v15 = 0;
        int v57 = 1;
      }

      else
      {
        unsigned __int8 v16 = [v10 action];
        id v17 = WALogCategoryDefaultHandle();
        int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        id v13 = v18;
        if ((v16 & 0x80) == 0)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v70 = 136446466;
            v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
            __int16 v72 = 1024;
            int v73 = 279;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:No DPE Action found",  v70,  0x12u);
          }

          int v19 = 0;
          goto LABEL_62;
        }

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v70 = 136446466;
          v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
          __int16 v72 = 1024;
          int v73 = 277;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found Action - Symptoms DNS Reassoc",  v70,  0x12u);
        }

        int v57 = 0;
        int v15 = 0;
        int v14 = 1;
      }

      int v56 = (v11 >> 1) & 1;
    }

    else
    {
      int v14 = 0;
      int v56 = 0;
      int v57 = 0;
      int v15 = 0;
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v8 snapshot]);

    id v23 = WALogCategoryDefaultHandle();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    id v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v70 = 136446466;
        v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
        __int16 v72 = 1024;
        int v73 = 285;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found - snapshot submessage",  v70,  0x12u);
      }

      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 snapshot]);
      uint64_t v26 = 0LL;
      v27 = 0LL;
      id v28 = 0LL;
      do
      {
        switch(v26)
        {
          case 0LL:
            uint64_t v29 = objc_claimAutoreleasedReturnValue(-[os_log_s txCompletionSnapshotBE](v25, "txCompletionSnapshotBE"));
            goto LABEL_35;
          case 1LL:
            uint64_t v29 = objc_claimAutoreleasedReturnValue(-[os_log_s txCompletionSnapshotBK](v25, "txCompletionSnapshotBK"));
            goto LABEL_35;
          case 2LL:
            uint64_t v29 = objc_claimAutoreleasedReturnValue(-[os_log_s txCompletionSnapshotVI](v25, "txCompletionSnapshotVI"));
            goto LABEL_35;
          case 3LL:
            uint64_t v29 = objc_claimAutoreleasedReturnValue(-[os_log_s txCompletionSnapshotVO](v25, "txCompletionSnapshotVO"));
LABEL_35:
            v30 = (void *)v29;

            v27 = v30;
            break;
          default:
            break;
        }

        if (v27)
        {
          if (v28) {
            -[WADatapathDiagnosticsMessageSubmitter computeAggregateTxCompletionStatus:source:]( self,  "computeAggregateTxCompletionStatus:source:",  v28,  v27);
          }
          else {
            id v28 = v27;
          }
        }

        ++v26;
      }

      while (v26 != 4);
      uint64_t v31 = -[WADatapathDiagnosticsMessageSubmitter findTxCompletionFailureWithMaxCount:]( self,  "findTxCompletionFailureWithMaxCount:",  v28);
    }

    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v70 = 136446466;
        v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
        __int16 v72 = 1024;
        int v73 = 319;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:snapshot submessage not found",  v70,  0x12u);
      }

      uint64_t v31 = 0xFFFFFFFFLL;
    }

    if (v15)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"fDPS"));
      if ((_DWORD)v31 != -1)
      {
LABEL_47:
        uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"TE%d", v31));
LABEL_57:
        id v35 = (void *)v32;
LABEL_58:
        uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v58));
        v37 = *(void **)(*(void *)&buf[8] + 40LL);
        *(void *)(*(void *)&buf[8] + 40LL) = v36;

        if ((v15 | v56) == 1)
        {
          uint64_t v38 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v35));
          v39 = (void *)v63[5];
          v63[5] = v38;
          __int16 v40 = @"DPS.Stall";
        }

        else
        {
          uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", &stru_1000CF610));
          v39 = (void *)v63[5];
          v63[5] = v41;
          __int16 v40 = @"DNS.Stall";
        }

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v40));
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)&buf[8] + 40) stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000CF610]);
        v43 = (void *)objc_claimAutoreleasedReturnValue( [(id)v63[5] stringByReplacingOccurrencesOfString:@"%" withString:&stru_1000CF610]);
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[SDRDiagnosticReporter signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:]( self->_ABCReporter,  "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:",  @"WiFi",  v10,  v42,  v43,  @"wifianalyticsd",  0LL));
        v44 = objc_alloc(&OBJC_CLASS___NSArray);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryRepresentation]);
        v46 = -[NSArray initWithObjects:](v44, "initWithObjects:", v45, 0LL);

        ABCReporter = self->_ABCReporter;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472LL;
        v61[2] = sub_10007F640;
        v61[3] = &unk_1000CDCC8;
        v61[4] = buf;
        v61[5] = &v62;
        -[SDRDiagnosticReporter snapshotWithSignature:duration:events:payload:actions:reply:]( ABCReporter,  "snapshotWithSignature:duration:events:payload:actions:reply:",  v13,  v46,  0LL,  0LL,  v61,  10.0);

        int v19 = 1;
LABEL_62:

        v48 = 0LL;
        goto LABEL_63;
      }
    }

    else
    {
      if (((v57 | v14 | v56 ^ 1) & 1) != 0)
      {
        v33 = @"None";
        if (v14) {
          v33 = @"sDNS.Reassoc";
        }
        if (v57) {
          id v34 = @"sDNS.Reset";
        }
        else {
          id v34 = v33;
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v34));
        id v35 = 0LL;
        goto LABEL_58;
      }

      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"sDPS"));
      if ((_DWORD)v31 != -1) {
        goto LABEL_47;
      }
    }

    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NoTE"));
    goto LABEL_57;
  }

  id v53 = WALogCategoryDefaultHandle();
  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v70 = 136446466;
    v71 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
    __int16 v72 = 1024;
    int v73 = 261;
    _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error creating data to send to ABC",  v70,  0x12u);
  }

  NSErrorUserInfoKey v68 = NSLocalizedFailureReasonErrorKey;
  v69 = @"WAErrorCodeSubmissionModelFailure";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9007LL,  v10));
  int v19 = 0;
LABEL_63:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(context);
  if (v19)
  {
    id v49 = WALogCategoryDefaultHandle();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue([v59 key]);
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 372;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Submit complete: %@",  buf,  0x1Cu);
    }
  }

  return v48;
}

- (id)submitDPSRMessage:(id)a3
{
  id v450 = a3;
  id v3 = WALogCategoryDefaultHandle();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v450 key]);
    *(_DWORD *)buf = 136446722;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v536 = 1024;
    int v537 = 380;
    __int16 v538 = 2112;
    *(void *)v539 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Attempting to submit: %@",  buf,  0x1Cu);
  }

  context = objc_autoreleasePoolPush();
  uint64_t v526 = 0LL;
  v527 = &v526;
  uint64_t v528 = 0x3032000000LL;
  v529 = sub_10007F628;
  v530 = sub_10007F638;
  id v531 = 0LL;
  uint64_t v520 = 0LL;
  v521 = &v520;
  uint64_t v522 = 0x3032000000LL;
  v523 = sub_10007F628;
  v524 = sub_10007F638;
  id v525 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]( self,  "instantiateAWDProtobufAndPopulateValues:",  v450));
  v452 = v6;
  if (!v6)
  {
    id v422 = WALogCategoryDefaultHandle();
    v423 = (os_log_s *)objc_claimAutoreleasedReturnValue(v422);
    if (os_log_type_enabled(v423, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 469;
      _os_log_impl( (void *)&_mh_execute_header,  v423,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error creating data to send to ABC",  buf,  0x12u);
    }

    NSErrorUserInfoKey v551 = NSLocalizedFailureReasonErrorKey;
    v552 = @"WAErrorCodeSubmissionModelFailure";
    v445 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v552,  &v551,  1LL));
    v395 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9007LL,  v445));
    v454 = 0LL;
    v455 = 0LL;
    v456 = 0LL;
    goto LABEL_479;
  }

  id v474 = v6;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v474 stallNotifications]);
  BOOL v449 = [v7 count] != 0;

  if (v449)
  {
    __int128 v518 = 0u;
    __int128 v519 = 0u;
    __int128 v516 = 0u;
    __int128 v517 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v474 stallNotifications]);
    id v9 = [v8 countByEnumeratingWithState:&v516 objects:v550 count:16];
    if (!v9) {
      goto LABEL_13;
    }
    uint64_t v10 = *(void *)v517;
    while (1)
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v517 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v516 + 1) + 8LL * (void)i);
        if (![v12 symptom])
        {
          unsigned int v425 = [v12 problemAC];
          id v13 = WALogCategoryDefaultHandle();
          int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446722;
            v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
            __int16 v536 = 1024;
            int v537 = 479;
            __int16 v538 = 1024;
            *(_DWORD *)v539 = v425;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:**** Found first DPS on AC bitfield %x",  buf,  0x18u);
          }

          int v438 = 1;
LABEL_17:

          __int128 v514 = 0u;
          __int128 v515 = 0u;
          __int128 v512 = 0u;
          __int128 v513 = 0u;
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v474 stallNotifications]);
          id v16 = [v15 countByEnumeratingWithState:&v512 objects:v549 count:16];
          if (!v16)
          {
            char v488 = 0;
            char v482 = 0;
            LOBYTE(v470) = 0;
            char v467 = 0;
            char v471 = 0;
            char v475 = 0;
            goto LABEL_53;
          }

          char v488 = 0;
          char v482 = 0;
          int v470 = 0;
          char v467 = 0;
          char v471 = 0;
          char v475 = 0;
          uint64_t v17 = *(void *)v513;
          while (2)
          {
            uint64_t v18 = 0LL;
LABEL_20:
            if (*(void *)v513 != v17) {
              objc_enumerationMutation(v15);
            }
            int v19 = *(void **)(*((void *)&v512 + 1) + 8 * v18);
            id v20 = WALogCategoryDefaultHandle();
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v474 stallNotifications]);
              id v23 = [v22 indexOfObject:v19];
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v474 stallNotifications]);
              id v25 = [v24 count];
              *(_DWORD *)buf = 136446978;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v536 = 1024;
              int v537 = 485;
              __int16 v538 = 2048;
              *(void *)v539 = v23;
              *(_WORD *)&v539[8] = 2048;
              *(void *)v540 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:stallNotification %lu of %lu",  buf,  0x26u);
            }

            id v26 = WALogCategoryDefaultHandle();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
              __int16 v536 = 1024;
              int v537 = 486;
              __int16 v538 = 2112;
              *(void *)v539 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:WiFiAnalyticsAWDWiFiDPSNotification[]: %@",  buf,  0x1Cu);
            }

            if ([v19 symptom])
            {
              if ([v19 symptom] == 2)
              {
                id v28 = WALogCategoryDefaultHandle();
                uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                  __int16 v536 = 1024;
                  int v537 = 498;
                  _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:**** Found User Toggle WiFi Off",  buf,  0x12u);
                }

                char v488 = 1;
                goto LABEL_42;
              }

              if ([v19 symptom] == 3)
              {
                id v31 = WALogCategoryDefaultHandle();
                uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446466;
                  v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
                  __int16 v536 = 1024;
                  int v537 = 502;
                  _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:**** Found User Toggle WiFi On",  buf,  0x12u);
                }

                char v488 = 0;
LABEL_42:
                char v482 = 1;
              }
            }

            else if ([v19 problemAC])
            {
              char v475 = 1;
            }

            else if (([v19 problemAC] & 2) != 0)
            {
              char v471 = 1;
            }

            else if (([v19 problemAC] & 4) != 0)
            {
              char v467 = 1;
            }

            else
            {
              else {
                int v30 = v470;
              }
              int v470 = v30;
            }

            if (v16 == (id)++v18)
            {
              id v16 = [v15 countByEnumeratingWithState:&v512 objects:v549 count:16];
              if (!v16)
              {
LABEL_53:

                uint64_t v429 = 0LL;
                int v440 = v488 & 1;
                int v35 = v482 & 1;
                int v442 = v470 & 1;
                int v444 = v467 & 1;
                LODWORD(v446) = v471 & 1;
                HIDWORD(v446) = v475 & 1;
                goto LABEL_54;
              }

              continue;
            }

            goto LABEL_20;
          }
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v516 objects:v550 count:16];
      if (!v9)
      {
LABEL_13:
        unsigned int v425 = 0;
        int v438 = 0;
        goto LABEL_17;
      }
    }
  }

  id v33 = WALogCategoryDefaultHandle();
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v536 = 1024;
    int v537 = 510;
    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Missing DPS Notificaiton",  buf,  0x12u);
  }

  int v440 = 0;
  int v35 = 0;
  int v442 = 0;
  int v444 = 0;
  uint64_t v446 = 0LL;
  unsigned int v425 = 0;
  int v438 = 0;
  uint64_t v429 = 1LL;
LABEL_54:
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v474 probeResults]);
  BOOL v448 = [v36 count] != 0;

  if (!v448)
  {
    id v47 = WALogCategoryDefaultHandle();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 566;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Missing Probe result",  buf,  0x12u);
    }

    id v49 = 0LL;
    BOOL v424 = 0;
    int v436 = 0;
    int v437 = 0;
    uint64_t v428 = 1LL;
    goto LABEL_137;
  }

  v453 = (void *)objc_claimAutoreleasedReturnValue([v474 probeResultAtIndex:0]);
  id v37 = WALogCategoryDefaultHandle();
  uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v536 = 1024;
    int v537 = 519;
    __int16 v538 = 2112;
    *(void *)v539 = v453;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:**** First Probe result %@",  buf,  0x1Cu);
  }

  if ([v453 hasRttGatewayBE]
    && [v453 rttGatewayBE]
    && [v453 hasRttGatewayBK]
    && [v453 rttGatewayBK]
    && [v453 hasRttGatewayVO]
    && [v453 rttGatewayVO]
    && [v453 hasRttGatewayVI]
    && [v453 rttGatewayVI])
  {
    id v39 = WALogCategoryDefaultHandle();
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 525;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Probe results All successfull, conflicts DPS Notificaiton",  buf,  0x12u);
    }

    int v437 = 0;
  }

  else
  {
    if (![v453 hasRttGatewayBE]
      || [v453 rttGatewayBE]
      || ![v453 hasRttGatewayBK]
      || [v453 rttGatewayBK]
      || ![v453 hasRttGatewayVO]
      || [v453 rttGatewayVO]
      || ![v453 hasRttGatewayVI]
      || [v453 rttGatewayVI])
    {
      int v437 = 0;
      goto LABEL_78;
    }

    id v421 = WALogCategoryDefaultHandle();
    __int16 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v421);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 531;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Probe results All AC blocked, confirm DPS Notificaiton",  buf,  0x12u);
    }

    int v437 = 1;
  }

LABEL_78:
  if ([v453 hasRttGatewayBE]
    && (![v453 rttGatewayBE] ? (char v41 = BYTE4(v446)) : (char v41 = 0), (v41 & 1) != 0)
    || [v453 hasRttGatewayBE]
    && (![v453 rttGatewayBK] ? (char v42 = v446) : (char v42 = 0), (v42 & 1) != 0)
    || [v453 hasRttGatewayBE]
    && (![v453 rttGatewayVO] ? (char v43 = v444) : (char v43 = 0), (v43 & 1) != 0)
    || [v453 hasRttGatewayBE]
    && (![v453 rttGatewayVI] ? (int v44 = v442) : (int v44 = 0), v44 == 1))
  {
    id v45 = WALogCategoryDefaultHandle();
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 540;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Probe results confirm DPS Notificaiton",  buf,  0x12u);
    }

    int v436 = 1;
  }

  else
  {
    int v436 = 0;
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue([v474 probeResults]);
  BOOL v51 = (unint64_t)[v50 count] > 1;

  if (!v51)
  {
    BOOL v424 = 0;
    BOOL v448 = 0;
    uint64_t v428 = 0LL;
    goto LABEL_139;
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue([v474 probeResults]);
  id v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v474, "probeResultAtIndex:", (char *)objc_msgSend(v52, "count") - 1));

  BOOL v424 = [v49 hasRttGatewayBE]
      && [v49 rttGatewayBE]
      && [v49 hasRttGatewayBK]
      && [v49 rttGatewayBK]
      && [v49 hasRttGatewayVO]
      && [v49 rttGatewayVO]
  if (![v49 hasRttGatewayBE]
    || ([v49 rttGatewayBE] ? (char v53 = BYTE4(v446)) : (char v53 = 0), (v53 & 1) == 0))
  {
    if (![v49 hasRttGatewayBE]
      || ([v49 rttGatewayBK] ? (char v54 = v446) : (char v54 = 0), (v54 & 1) == 0))
    {
      if (![v49 hasRttGatewayBE]
        || ([v49 rttGatewayVO] ? (char v55 = v444) : (char v55 = 0), (v55 & 1) == 0))
      {
        if (![v49 hasRttGatewayBE]
          || ![v49 rttGatewayVI]
          || !v442)
        {
          BOOL v448 = 0;
          uint64_t v428 = 0LL;
          goto LABEL_138;
        }
      }
    }
  }

  id v56 = WALogCategoryDefaultHandle();
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
    __int16 v536 = 1024;
    int v537 = 559;
    _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Last Probe results show recovered DPS",  buf,  0x12u);
  }

  uint64_t v428 = 0LL;
LABEL_137:

LABEL_138:
  v453 = v49;
LABEL_139:
  int v57 = (void *)objc_claimAutoreleasedReturnValue([v474 dpsEpiloge]);

  if (!v57)
  {
    uint64_t v430 = 0LL;
    uint64_t v431 = 0LL;
    uint64_t v426 = 0LL;
    uint64_t v427 = 0LL;
    int v443 = 0;
    BOOL v441 = 0;
    id v447 = 0LL;
    v445 = 0LL;
    goto LABEL_227;
  }

  log = (void *)objc_claimAutoreleasedReturnValue([v474 dpsEpiloge]);
  int v58 = v35;
  unsigned int v468 = [log action];
  if ((v468 & 2) != 0)
  {
    id v59 = WALogCategoryDefaultHandle();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 575;
      v61 = "%{public}s::%d:Found Action - DPS Watchdog";
LABEL_148:
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, v61, buf, 0x12u);
      goto LABEL_149;
    }

    goto LABEL_149;
  }

  if (([log action] & 4) != 0)
  {
    id v62 = WALogCategoryDefaultHandle();
    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v535 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]";
      __int16 v536 = 1024;
      int v537 = 578;
      v61 = "%{public}s::%d:Found Action - Fast DPS Watchdog";
      goto LABEL_148;
    }

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

- (SDRDiagnosticReporter)ABCReporter
{
  return self->_ABCReporter;
}

- (void)setABCReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end