@interface CSAttendingSelfLogger
+ (void)emitAttendingContextEndedEventWithStopReason:(int64_t)a3 withMHUUID:(id)a4;
+ (void)emitAttendingContextStartedEventWithAttendingOptions:(id)a3 withMHUUID:(id)a4;
@end

@implementation CSAttendingSelfLogger

+ (void)emitAttendingContextEndedEventWithStopReason:(int64_t)a3 withMHUUID:(id)a4
{
  id v5 = a4;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v5 = (id)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Mint a new MHUUID for attending ended events",  (uint8_t *)&v21,  0xCu);
    }
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAttendingContext);
  id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAttendingEnded);
  if (a3 == 1)
  {
    v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Emit AttendingEnded with reason: New request started",  (uint8_t *)&v21,  0xCu);
    }

    uint64_t v11 = 1LL;
  }

  else if (a3 == 7)
  {
    v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s Emit AttendingEnded with reason: UI requested",  (uint8_t *)&v21,  0xCu);
    }

    uint64_t v11 = 2LL;
  }

  else
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    BOOL v14 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v11 = 0LL;
    if (v14)
    {
      int v21 = 136315138;
      v22 = "+[CSAttendingSelfLogger emitAttendingContextEndedEventWithStopReason:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Emit AttendingEnded with reason: Other reasons",  (uint8_t *)&v21,  0xCu);
      uint64_t v11 = 0LL;
    }
  }

  [v9 setEndReason:v11];
  [v8 setEnded:v9];
  id v15 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  id v16 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v17 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v5);
  id v19 = [v17 initWithNSUUID:v18];
  [v16 setMhId:v19];

  [v15 setEventMetadata:v16];
  [v15 setAttendingContext:v8];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v20 emitMessage:v15];
}

+ (void)emitAttendingContextStartedEventWithAttendingOptions:(id)a3 withMHUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

    id v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Mint a new MHUUID for attending started events",  (uint8_t *)&v22,  0xCu);
    }
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAttendingContext);
  id v10 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHAttendingStarted);
  if ([v5 attendingType] == (id)1)
  {
    uint64_t v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Emit AttendingStarted with reason: Flexible FollowUp",  (uint8_t *)&v22,  0xCu);
    }

    uint64_t v12 = 1LL;
  }

  else if ([v5 attendingType] == (id)6 || objc_msgSend(v5, "attendingType") == (id)7)
  {
    v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Emit AttendingStarted with reason: Announce Notification",  (uint8_t *)&v22,  0xCu);
    }

    uint64_t v12 = 2LL;
  }

  else
  {
    v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    BOOL v21 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    uint64_t v12 = 0LL;
    if (v21)
    {
      int v22 = 136315138;
      v23 = "+[CSAttendingSelfLogger emitAttendingContextStartedEventWithAttendingOptions:withMHUUID:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Emit AttendingStarted with reason: Other reasons",  (uint8_t *)&v22,  0xCu);
      uint64_t v12 = 0LL;
    }
  }

  [v10 setStartReason:v12];
  [v9 setStartedOrChanged:v10];
  id v14 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEvent);
  id v15 = objc_alloc_init(&OBJC_CLASS___MHSchemaMHClientEventMetadata);
  id v16 = objc_alloc(&OBJC_CLASS___SISchemaUUID);
  id v17 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v6);
  id v18 = [v16 initWithNSUUID:v17];
  [v15 setMhId:v18];

  [v14 setEventMetadata:v15];
  [v14 setAttendingContext:v9];
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v19 emitMessage:v14];
}

@end