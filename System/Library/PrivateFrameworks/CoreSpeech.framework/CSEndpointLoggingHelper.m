@interface CSEndpointLoggingHelper
+ (id)getMHClientEventByMhUUID:(id)a3;
+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3;
+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3 withScaleFactor:(double)a4;
+ (void)reportMHEndpointerAccessibleContextEventWithThresholdType:(id)a3 MhId:(id)a4;
+ (void)reportServerEndpointWithMhId:(id)a3;
@end

@implementation CSEndpointLoggingHelper

+ (id)getMHClientEventByMhUUID:(id)a3
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v3), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
    id v7 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
    v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v4);
    id v9 = [v7 initWithNSUUID:v8];

    id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
    [v10 setMhId:v9];
    [v6 setEventMetadata:v10];
  }

  else
  {
    v11 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      int v16 = 136315650;
      v17 = "+[CSEndpointLoggingHelper getMHClientEventByMhUUID:]";
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = (id)objc_opt_class(v4, v13);
      id v14 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s mhUUID = %@, class = %@",  (uint8_t *)&v16,  0x20u);
    }

    id v6 = 0LL;
  }

  return v6;
}

+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3
{
  return +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:withScaleFactor:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHStatisticDistributionInfoFromDictionary:withScaleFactor:",  a3,  1.0);
}

+ (id)getMHStatisticDistributionInfoFromDictionary:(id)a3 withScaleFactor:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHStatisticDistributionInfo);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Num"]);
  objc_msgSend(v6, "setNum:", objc_msgSend(v7, "intValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Avg"]);
  [v8 floatValue];
  double v10 = v9 * a4;
  *(float *)&double v10 = v10;
  objc_msgSend(v6, "setAvg:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Max"]);
  [v11 floatValue];
  double v13 = v12 * a4;
  *(float *)&double v13 = v13;
  objc_msgSend(v6, "setMax:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v13));

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Min"]);
  [v14 floatValue];
  double v16 = v15 * a4;
  *(float *)&double v16 = v16;
  objc_msgSend(v6, "setMin:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v16));

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"P95"]);
  [v17 floatValue];
  double v19 = v18 * a4;
  *(float *)&double v19 = v19;
  objc_msgSend(v6, "setP95:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v19));

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Median"]);
  [v20 floatValue];
  double v22 = v21 * a4;
  *(float *)&double v22 = v22;
  objc_msgSend( v6,  "setMedian:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v22));

  v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Std"]);
  [v23 floatValue];
  objc_msgSend(v6, "setStd:");

  v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Warmup"]);
  if (v24)
  {
    [v24 floatValue];
    double v26 = v25 * a4;
    *(float *)&double v26 = v26;
    objc_msgSend( v6,  "setWarmup:",  +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v26));
  }

  return v6;
}

+ (void)reportMHEndpointerAccessibleContextEventWithThresholdType:(id)a3 MhId:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointerAccessibleContext);
    v8 = v7;
    if (v5 == @"accessible-extended") {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = 2 * (v5 == @"accessible-maximum");
    }
    [v7 setAccessibleEndpointerLevel:v9];
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  v6));
    [v10 setEndpointerAccessibleContext:v8];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v11 emitMessage:v10];

    float v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      float v15 = "+[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointerAccessibleContextEvent to SELF for MH ID: %@",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    double v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      float v15 = "+[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v14,  0xCu);
    }
  }
}

+ (void)reportServerEndpointWithMhId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHEndpointDetected);
    [v4 setEndpointerType:5];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CSEndpointLoggingHelper getMHClientEventByMhUUID:]( &OBJC_CLASS___CSEndpointLoggingHelper,  "getMHClientEventByMhUUID:",  v3));
    [v5 setEndpointDetected:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
    [v6 emitMessage:v5];

    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      double v10 = "+[CSEndpointLoggingHelper reportServerEndpointWithMhId:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  else
  {
    v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      double v10 = "+[CSEndpointLoggingHelper reportServerEndpointWithMhId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s MHID not set, skipping SELF Logging",  (uint8_t *)&v9,  0xCu);
    }
  }
}

@end