@interface IntelligentRoutingDiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation IntelligentRoutingDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  IRSetupLogging();
  v4 = (os_log_s *)IRLogObject;
  if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#diagnosticExtension, attachmentForParameters, called with parameters: %@",  (uint8_t *)&buf,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DEExtensionHostAppKey"]);
  else {
    unsigned int v6 = [v5 isEqualToString:@"com.apple.TapToRadar"] ^ 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"]);
  unsigned int v8 = [v7 BOOLValue];

  if (((v6 | v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000LL;
    v32 = sub_100003248;
    v33 = sub_100003258;
    id v34 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100003260;
    v26[3] = &unk_100004160;
    p___int128 buf = &buf;
    v10 = dispatch_semaphore_create(0LL);
    v27 = v10;
    id v11 = v9;
    id v28 = v11;
    +[IRSession databaseExportwithReply:](&OBJC_CLASS___IRSession, "databaseExportwithReply:", v26);
    dispatch_time_t v12 = dispatch_time(0LL, 10000000000LL);
    dispatch_semaphore_wait(v10, v12);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    v14 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v13;

    v15 = v28;
    id v16 = v11;

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    v17 = (os_log_s *)IRLogObject;
    if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_ERROR)) {
      sub_1000035BC(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    id v16 = &__NSArray0__struct;
  }

  return v16;
}

@end