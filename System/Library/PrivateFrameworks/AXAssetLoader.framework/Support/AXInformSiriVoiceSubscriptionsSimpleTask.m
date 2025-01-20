@interface AXInformSiriVoiceSubscriptionsSimpleTask
- (void)run:(id)a3;
@end

@implementation AXInformSiriVoiceSubscriptionsSimpleTask

- (void)run:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogAssetDaemon(v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "AXInformSiriSubsTask: Task did begin",  (uint8_t *)&buf,  2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 arguments]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kAXVoiceId"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v11);

  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arguments]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"kAXVoiceId"]);
  }

  else
  {
    v15 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXSimpleAssetTaskBase trigger](self, "trigger"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 arguments]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"kAXVoiceSubscriptionAddition"]);
  unsigned __int8 v19 = [v18 BOOLValue];

  if (v15)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[TTSAXResourceManager sharedInstance](&OBJC_CLASS___TTSAXResourceManager, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 resourceWithVoiceId:v15]);

    if (v22)
    {
      id v24 = objc_alloc_init(&OBJC_CLASS___SiriTTSDaemonSession);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v22 primaryLanguage]);
      uint64_t v26 = AXSiriTTSSynthesisVoiceFromVoiceIdentifier(v15, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v56 = 0x3032000000LL;
      v57 = sub_100009B40;
      v58 = sub_100009B50;
      id v59 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      uint64_t v28 = AXLogAssetDaemon(v59);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v24 == 0LL));
        *(_DWORD *)v53 = 138412290;
        v54 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Asking SiriTTSDaemonSession for auto-downloaded voices %@",  v53,  0xCu);
      }

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_100009B58;
      v47[3] = &unk_100020920;
      p___int128 buf = &buf;
      unsigned __int8 v52 = v19;
      id v31 = v27;
      id v48 = v31;
      id v32 = v24;
      id v49 = v32;
      id v50 = v4;
      [v32 subscribedVoicesWithReply:v47];

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      uint64_t v40 = AXLogAssetDaemon(v23);
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: No resource found for voiceId: %@",  (uint8_t *)&buf,  0xCu);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v42 setValue:v43 forKey:@"InformSiriVoiceSubscriptionsTaskFailed" forAssetType:kAXTTSResourceAssetType];

      uint64_t v45 = AXLogAssetDaemon(v44);
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Task finishing with failure",  (uint8_t *)&buf,  2u);
      }

      (*((void (**)(id, uint64_t))v4 + 2))(v4, 2LL);
    }
  }

  else
  {
    uint64_t v33 = AXLogAssetDaemon(v20);
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Unable to subscribe to nil voiceId",  (uint8_t *)&buf,  2u);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXAssetMetadataStore store](&OBJC_CLASS___AXAssetMetadataStore, "store"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v35 setValue:v36 forKey:@"InformSiriVoiceSubscriptionsTaskFailed" forAssetType:kAXTTSResourceAssetType];

    uint64_t v38 = AXLogAssetDaemon(v37);
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "AXInformSiriSubsTask: Task finishing with failure",  (uint8_t *)&buf,  2u);
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2LL);
  }
}

@end