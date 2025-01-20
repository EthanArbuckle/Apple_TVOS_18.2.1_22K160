@interface ADMUXReverseSyncInstrumentationUtil
+ (id)_generateSISchemaUuidPostMD5HashFrom:(id)a3;
+ (int)_ADMUXSyncDownloadTriggerToRSSDownloadTrigger:(int64_t)a3;
+ (int)_ADMUXSyncTokenTransferReason:(int64_t)a3;
+ (int)_ADServerSyncErrorCodeToRSSSiriVocabSyncDataDownloadFailureReason:(int64_t)a3;
+ (int)_KVErrorToSyncDataDonationFailureReason:(id)a3;
+ (int)_SASyncTypeToRSSSiriVocabSyncData:(id)a3;
+ (void)logSiriVocabDataDownloadEndedRequestId:(id)a3;
+ (void)logSiriVocabDataDownloadFailedRequestId:(id)a3 errorCode:(int64_t)a4;
+ (void)logSiriVocabDataDownloadTriggeredRequestId:(id)a3 triggerType:(int64_t)a4 syncType:(id)a5;
+ (void)logSyncDataDonationFailedWithReason:(id)a3;
+ (void)logSyncDataUpdateNotificationReceivedWithLatency:(double)a3;
+ (void)logSyncTokenReceivedWithTransferReason:(int64_t)a3 requestCreatedAt:(id)a4;
@end

@implementation ADMUXReverseSyncInstrumentationUtil

+ (void)logSyncDataUpdateNotificationReceivedWithLatency:(double)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  id v5 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEvent);
  id v6 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEventMetadata);
  id v7 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  v8 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v9 = [v7 initWithNSUUID:v8];
  [v6 setRssId:v9];

  id v10 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataUpdatedNotificationReceived);
  v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (a3 >= 0.0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      v13 = "+[ADMUXReverseSyncInstrumentationUtil logSyncDataUpdateNotificationReceivedWithLatency:]";
      __int16 v14 = 2048;
      double v15 = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s SyncDataUpdateNotification latency in seconds: %f",  (uint8_t *)&v12,  0x16u);
    }

    [v10 setSyncDataUpdateNotificationLatencyInMs:(unint64_t)(a3 * 1000.0)];
    [v5 setSyncDataUpdatedNotificationReceived:v10];
    [v5 setEventMetadata:v6];
    [v4 emitMessage:v5];
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    v13 = "+[ADMUXReverseSyncInstrumentationUtil logSyncDataUpdateNotificationReceivedWithLatency:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Timestamp on receiver lower that timestamp on sender, ignoring the metric due to failed sanity check",  (uint8_t *)&v12,  0xCu);
  }
}

+ (void)logSyncDataDonationFailedWithReason:(id)a3
{
  id v3 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  id v4 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEvent);
  id v5 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEventMetadata);
  id v6 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v8 = [v6 initWithNSUUID:v7];
  [v5 setRssId:v8];

  id v9 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDonationFailed);
  uint64_t v10 = +[ADMUXReverseSyncInstrumentationUtil _KVErrorToSyncDataDonationFailureReason:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "_KVErrorToSyncDataDonationFailureReason:",  v3);

  [v9 setReason:v10];
  [v4 setSyncDataDonationFailed:v9];
  [v4 setEventMetadata:v5];
  [v11 emitMessage:v4];
}

+ (void)logSyncTokenReceivedWithTransferReason:(int64_t)a3 requestCreatedAt:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  id v7 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEvent);
  id v8 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEventMetadata);
  id v9 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  id v11 = [v9 initWithNSUUID:v10];
  [v8 setRssId:v11];

  id v12 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncTokenReceived);
  objc_msgSend( v12,  "setReason:",  +[ADMUXReverseSyncInstrumentationUtil _ADMUXSyncTokenTransferReason:]( ADMUXReverseSyncInstrumentationUtil,  "_ADMUXSyncTokenTransferReason:",  a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v13 timeIntervalSince1970];
  double v15 = v14;

  [v5 doubleValue];
  double v17 = v16;

  double v18 = v15 - v17;
  v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (v18 >= 0.0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136315394;
      v21 = "+[ADMUXReverseSyncInstrumentationUtil logSyncTokenReceivedWithTransferReason:requestCreatedAt:]";
      __int16 v22 = 2048;
      double v23 = v18;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "%s SyncToken latency in seconds: %f",  (uint8_t *)&v20,  0x16u);
    }

    [v12 setSyncTokenTransferLatencyInMs:(unint64_t)(v18 * 1000.0)];
    [v7 setSyncTokenReceived:v12];
    [v7 setEventMetadata:v8];
    [v6 emitMessage:v7];
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315138;
    v21 = "+[ADMUXReverseSyncInstrumentationUtil logSyncTokenReceivedWithTransferReason:requestCreatedAt:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Timestamp on receiver lower that timestamp on sender, ignoring the metric due to failed sanity check",  (uint8_t *)&v20,  0xCu);
  }
}

+ (void)logSiriVocabDataDownloadTriggeredRequestId:(id)a3 triggerType:(int64_t)a4 syncType:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  id v10 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEvent);
  id v11 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEventMetadata);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ADMUXReverseSyncInstrumentationUtil _generateSISchemaUuidPostMD5HashFrom:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "_generateSISchemaUuidPostMD5HashFrom:",  v8));

  [v11 setRssId:v12];
  id v13 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDownloadContext);
  id v14 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDownloadTriggered);
  objc_msgSend( v14,  "setTrigger:",  +[ADMUXReverseSyncInstrumentationUtil _ADMUXSyncDownloadTriggerToRSSDownloadTrigger:]( ADMUXReverseSyncInstrumentationUtil,  "_ADMUXSyncDownloadTriggerToRSSDownloadTrigger:",  a4));
  uint64_t v15 = +[ADMUXReverseSyncInstrumentationUtil _SASyncTypeToRSSSiriVocabSyncData:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "_SASyncTypeToRSSSiriVocabSyncData:",  v7);

  [v14 setSyncData:v15];
  [v13 setStartedOrChanged:v14];
  [v10 setSyncDataDownloadContext:v13];
  [v10 setEventMetadata:v11];
  double v16 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    double v17 = v16;
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v11 rssId]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 value]);
    int v20 = 136315394;
    v21 = "+[ADMUXReverseSyncInstrumentationUtil logSiriVocabDataDownloadTriggeredRequestId:triggerType:syncType:]";
    __int16 v22 = 2112;
    double v23 = v19;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "%s Received download triggered: %@",  (uint8_t *)&v20,  0x16u);
  }

  [v9 emitMessage:v10];
}

+ (void)logSiriVocabDataDownloadFailedRequestId:(id)a3 errorCode:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  id v7 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEvent);
  id v8 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEventMetadata);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[ADMUXReverseSyncInstrumentationUtil _generateSISchemaUuidPostMD5HashFrom:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "_generateSISchemaUuidPostMD5HashFrom:",  v5));

  [v8 setRssId:v9];
  id v10 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDownloadContext);
  id v11 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDownloadFailed);
  objc_msgSend( v11,  "setReason:",  +[ADMUXReverseSyncInstrumentationUtil _ADServerSyncErrorCodeToRSSSiriVocabSyncDataDownloadFailureReason:]( ADMUXReverseSyncInstrumentationUtil,  "_ADServerSyncErrorCodeToRSSSiriVocabSyncDataDownloadFailureReason:",  a4));
  [v10 setFailed:v11];
  [v7 setSyncDataDownloadContext:v10];
  [v7 setEventMetadata:v8];
  id v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v13 = v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 rssId]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
    int v16 = 136315394;
    double v17 = "+[ADMUXReverseSyncInstrumentationUtil logSiriVocabDataDownloadFailedRequestId:errorCode:]";
    __int16 v18 = 2112;
    v19 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s Received download failed: %@",  (uint8_t *)&v16,  0x16u);
  }

  [v6 emitMessage:v7];
}

+ (void)logSiriVocabDataDownloadEndedRequestId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  id v5 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEvent);
  id v6 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSClientEventMetadata);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADMUXReverseSyncInstrumentationUtil _generateSISchemaUuidPostMD5HashFrom:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "_generateSISchemaUuidPostMD5HashFrom:",  v3));

  [v6 setRssId:v7];
  id v8 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDownloadContext);
  id v9 = objc_alloc_init(&OBJC_CLASS___RSSSchemaRSSSiriVocabSyncDataDownloadEnded);
  [v9 setExists:1];
  [v8 setEnded:v9];
  [v5 setSyncDataDownloadContext:v8];
  [v5 setEventMetadata:v6];
  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 rssId]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 value]);
    int v14 = 136315394;
    uint64_t v15 = "+[ADMUXReverseSyncInstrumentationUtil logSiriVocabDataDownloadEndedRequestId:]";
    __int16 v16 = 2112;
    double v17 = v13;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s Received download ended: %@",  (uint8_t *)&v14,  0x16u);
  }

  [v4 emitMessage:v5];
}

+ (id)_generateSISchemaUuidPostMD5HashFrom:(id)a3
{
  id v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  id v5 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", md, 16LL));
  id v7 = [v5 initWithBytesAsData:v6];

  return v7;
}

+ (int)_ADServerSyncErrorCodeToRSSSiriVocabSyncDataDownloadFailureReason:(int64_t)a3
{
  else {
    return dword_1003C9DBC[a3];
  }
}

+ (int)_SASyncTypeToRSSSiriVocabSyncData:(id)a3
{
  id v3 = a3;
  CC_LONG v4 = (void *)SASyncSyncTypeContactsValue;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {

    if (v5) {
      goto LABEL_7;
    }
  }

  else
  {
    id v7 = v6;
    if (v5 && v6)
    {
      unsigned __int8 v8 = [v5 isEqual:v6];

      if ((v8 & 1) == 0) {
        goto LABEL_9;
      }
LABEL_7:
      int v9 = 1;
      goto LABEL_26;
    }
  }

+ (int)_ADMUXSyncDownloadTriggerToRSSDownloadTrigger:(int64_t)a3
{
  else {
    return dword_1003C9DDC[a3];
  }
}

+ (int)_KVErrorToSyncDataDonationFailureReason:(id)a3
{
  id v3 = (char *)[a3 code];
  return (int)v3;
}

+ (int)_ADMUXSyncTokenTransferReason:(int64_t)a3
{
  else {
    return 0;
  }
}

@end