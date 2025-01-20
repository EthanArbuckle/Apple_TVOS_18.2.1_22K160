@interface CSEndpointLatencyInfo
- (CSEndpointLatencyInfo)initWithRequestMHUUID:(id)a3;
- (NSMutableArray)trailingPktLatencies;
- (NSMutableArray)trailingPktSpeechLatencies;
- (NSString)requestMHUUID;
- (double)firstPktLatency;
- (unint64_t)numOfAudioPackets;
- (unint64_t)numOfValidTrailingPackets;
- (unint64_t)numOfValidTrailingSpeechPackets;
- (void)_emitMHEndpointLatencyInfo:(id)a3 withRequestMHUUID:(id)a4;
- (void)addPktInfoWithTimestamp:(unint64_t)a3 arrivalTimestamp:(unint64_t)a4 currentMachTime:(unint64_t)a5;
- (void)report;
- (void)setFirstPktLatency:(double)a3;
- (void)setNumOfAudioPackets:(unint64_t)a3;
- (void)setNumOfValidTrailingPackets:(unint64_t)a3;
- (void)setNumOfValidTrailingSpeechPackets:(unint64_t)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setTrailingPktLatencies:(id)a3;
- (void)setTrailingPktSpeechLatencies:(id)a3;
@end

@implementation CSEndpointLatencyInfo

- (CSEndpointLatencyInfo)initWithRequestMHUUID:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSEndpointLatencyInfo;
  v5 = -[CSEndpointLatencyInfo init](&v13, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    requestMHUUID = v5->_requestMHUUID;
    v5->_requestMHUUID = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL));
    trailingPktLatencies = v5->_trailingPktLatencies;
    v5->_trailingPktLatencies = (NSMutableArray *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 10LL));
    trailingPktSpeechLatencies = v5->_trailingPktSpeechLatencies;
    v5->_trailingPktSpeechLatencies = (NSMutableArray *)v10;

    v5->_numOfAudioPackets = 0LL;
    v5->_numOfValidTrailingPackets = 0LL;
    v5->_numOfValidTrailingSpeechPackets = 0LL;
  }

  return v5;
}

- (void)addPktInfoWithTimestamp:(unint64_t)a3 arrivalTimestamp:(unint64_t)a4 currentMachTime:(unint64_t)a5
{
  double TimeInterval = CSMachAbsoluteTimeGetTimeInterval(a5 - a3);
  unint64_t numOfAudioPackets = self->_numOfAudioPackets;
  self->_unint64_t numOfAudioPackets = numOfAudioPackets + 1;
  if (!numOfAudioPackets)
  {
    v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      __int16 v19 = 2050;
      double v20 = TimeInterval * 1000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s %{public}.2f ms after firstBufferStart",  (uint8_t *)&v17,  0x16u);
    }
  }

  if (TimeInterval <= 10.0)
  {
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", TimeInterval * 1000.0));
    -[NSMutableArray setObject:atIndexedSubscript:]( self->_trailingPktLatencies,  "setObject:atIndexedSubscript:",  v13,  self->_numOfValidTrailingPackets % 0xA);

    ++self->_numOfValidTrailingPackets;
  }

  else
  {
    v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      v18 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      __int16 v19 = 2050;
      double v20 = *(double *)&a5;
      __int16 v21 = 2050;
      unint64_t v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Invalid timestamp (currentMachTime: %{public}llu timestamp: %{public}llu)",  (uint8_t *)&v17,  0x20u);
    }
  }

  double v14 = CSMachAbsoluteTimeGetTimeInterval(a5 - a4);
  if (a4 && v14 > 10.0)
  {
    v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      v18 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      __int16 v19 = 2050;
      double v20 = *(double *)&a5;
      __int16 v21 = 2050;
      unint64_t v22 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Invalid timestamp (currentMachTime: %{public}llu arrivalTimestamp: %{public}llu)",  (uint8_t *)&v17,  0x20u);
    }
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14 * 1000.0));
    -[NSMutableArray setObject:atIndexedSubscript:]( self->_trailingPktSpeechLatencies,  "setObject:atIndexedSubscript:",  v16,  self->_numOfValidTrailingSpeechPackets % 0xA);

    ++self->_numOfValidTrailingSpeechPackets;
  }

- (void)report
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils distributionDictionary:]( &OBJC_CLASS___CSUtils,  "distributionDictionary:",  self->_trailingPktLatencies));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSUtils distributionDictionary:]( &OBJC_CLASS___CSUtils,  "distributionDictionary:",  self->_trailingPktSpeechLatencies));
  v5 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numOfAudioPackets = self->_numOfAudioPackets;
    unint64_t numOfValidTrailingPackets = self->_numOfValidTrailingPackets;
    unint64_t numOfValidTrailingSpeechPackets = self->_numOfValidTrailingSpeechPackets;
    int v14 = 136316418;
    v15 = "-[CSEndpointLatencyInfo report]";
    __int16 v16 = 2050;
    unint64_t v17 = numOfAudioPackets;
    __int16 v18 = 2050;
    unint64_t v19 = numOfValidTrailingPackets;
    __int16 v20 = 2050;
    unint64_t v21 = numOfValidTrailingSpeechPackets;
    __int16 v22 = 2114;
    v23 = v3;
    __int16 v24 = 2114;
    v25 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s numOfAudioPackets: %{public}lu, numOfValidTrailingPackets: %{public}lu, numOfValidTrailingSpeechPackets: %{publ ic}lu, \n trailingPktLatencies: %{public}@ \n trailingPktSpeechLatencies: %{public}@",  (uint8_t *)&v14,  0x3Eu);
  }

  v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ([v3 count]) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v3, @"TrailingPktLatency");
  }
  if ([v4 count]) {
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v4, @"TrailingPktSpeechLatency");
  }
  if (self->_firstPktLatency > 0.0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, @"FirstPktLatency");
  }

  if (-[NSMutableDictionary count](v9, "count"))
  {
    -[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]( self,  "_emitMHEndpointLatencyInfo:withRequestMHUUID:",  v9,  self->_requestMHUUID);
    id v11 = objc_alloc(&OBJC_CLASS___AFAnalytics);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
    id v13 = [v11 initWithInstanceContext:v12];

    [v13 logEventWithType:4712 context:v9];
  }
}

- (void)_emitMHEndpointLatencyInfo:(id)a3 withRequestMHUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 copy];
    id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointLatencyInfoReported);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"FirstPktLatency"]);

    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"FirstPktLatency"]);
      [v10 floatValue];
      int v12 = v11;

      LODWORD(v13) = v12;
      objc_msgSend( v8,  "setFirstPacketLatencyInNs:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v13));
    }

    int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TrailingPktLatency"]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TrailingPktLatency"]);
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHStatisticDistributionInfoFromDictionary:",  v15));
      [v8 setTrailingPacketLatency:v16];
    }

    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TrailingPktSpeechLatency"]);

    if (v17)
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TrailingPktSpeechLatency"]);
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHStatisticDistributionInfoFromDictionary:",  v18));
      [v8 setCoreSpeechTrailingPacketLatency:v19];
    }

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  v6));
    [v20 setEndpointLatencyInfoReported:v8];
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v21 emitMessage:v20];

    __int16 v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315394;
      v25 = "-[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]";
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointLatencyInfoReportedEvent to SELF for MH ID: %@",  (uint8_t *)&v24,  0x16u);
    }
  }

  else
  {
    v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315138;
      v25 = "-[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v24,  0xCu);
    }
  }
}

- (double)firstPktLatency
{
  return self->_firstPktLatency;
}

- (void)setFirstPktLatency:(double)a3
{
  self->_firstPktLatency = a3;
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSMutableArray)trailingPktSpeechLatencies
{
  return self->_trailingPktSpeechLatencies;
}

- (void)setTrailingPktSpeechLatencies:(id)a3
{
}

- (NSMutableArray)trailingPktLatencies
{
  return self->_trailingPktLatencies;
}

- (void)setTrailingPktLatencies:(id)a3
{
}

- (unint64_t)numOfAudioPackets
{
  return self->_numOfAudioPackets;
}

- (void)setNumOfAudioPackets:(unint64_t)a3
{
  self->_unint64_t numOfAudioPackets = a3;
}

- (unint64_t)numOfValidTrailingPackets
{
  return self->_numOfValidTrailingPackets;
}

- (void)setNumOfValidTrailingPackets:(unint64_t)a3
{
  self->_unint64_t numOfValidTrailingPackets = a3;
}

- (unint64_t)numOfValidTrailingSpeechPackets
{
  return self->_numOfValidTrailingSpeechPackets;
}

- (void)setNumOfValidTrailingSpeechPackets:(unint64_t)a3
{
  self->_unint64_t numOfValidTrailingSpeechPackets = a3;
}

- (void).cxx_destruct
{
}

@end