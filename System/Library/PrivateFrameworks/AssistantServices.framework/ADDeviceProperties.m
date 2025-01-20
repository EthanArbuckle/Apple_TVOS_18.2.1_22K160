@interface ADDeviceProperties
- (ADDeviceProperties)init;
- (void)_getODDiOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 iOSGeneral:(id)a6 iOSAssistant:(id)a7 completion:(id)a8;
- (void)_getODDmacOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 macOS:(id)a6 completion:(id)a7;
- (void)_getODDtvOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 tvOS:(id)a6 completion:(id)a7;
- (void)_getODDvisionOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 completion:(id)a6;
- (void)_getODDwatchOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 watchOS:(id)a6 completion:(id)a7;
- (void)_populateDevicePropertiesForClientEvent:(id)a3 withCompletion:(id)a4;
- (void)_populateEventMetadataForClientEvent:(id)a3 withCompletion:(id)a4;
- (void)_triggerReportingForNullDeviceAggregationId;
- (void)getODDDevicePropertiesWithCompletion:(id)a3;
@end

@implementation ADDeviceProperties

- (ADDeviceProperties)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADDeviceProperties;
  v2 = -[ADDeviceProperties init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("ADDeviceProperties", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)getODDDevicePropertiesWithCompletion:(id)a3
{
  v4 = (void (**)(id, id))a3;
  dispatch_queue_attr_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ADDeviceProperties getODDDevicePropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  v6 = dispatch_group_create();
  id v7 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDSiriClientEvent);
  dispatch_group_enter(v6);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10011CF94;
  v22[3] = &unk_1004FD940;
  v8 = v6;
  v23 = v8;
  -[ADDeviceProperties _populateEventMetadataForClientEvent:withCompletion:]( self,  "_populateEventMetadataForClientEvent:withCompletion:",  v7,  v22);
  dispatch_group_enter(v8);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10011CF9C;
  v20 = &unk_1004FD940;
  v9 = v8;
  v21 = v9;
  -[ADDeviceProperties _populateDevicePropertiesForClientEvent:withCompletion:]( self,  "_populateDevicePropertiesForClientEvent:withCompletion:",  v7,  &v17);
  dispatch_time_t v10 = dispatch_time(0LL, 11000000000LL);
  uint64_t v11 = dispatch_group_wait(v9, v10);
  v12 = (void *)AFSiriLogContextDaemon;
  if (!v11)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v15 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryRepresentation", v17, v18, v19, v20));
      *(_DWORD *)buf = 136315394;
      v25 = "-[ADDeviceProperties getODDDevicePropertiesWithCompletion:]";
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Successfully populated ODDDeviceProperties event %@",  buf,  0x16u);

      if (!v4) {
        goto LABEL_11;
      }
    }

    else if (!v4)
    {
      goto LABEL_11;
    }

- (void)_populateEventMetadataForClientEvent:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011CA40;
  block[3] = &unk_1004FD9E0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_populateDevicePropertiesForClientEvent:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[ADGeneralProperties initWithQueue:]( objc_alloc(&OBJC_CLASS___ADGeneralProperties),  "initWithQueue:",  self->_queue);
  id v9 = objc_alloc_init(&OBJC_CLASS___ADAssistantProperties);
  id v10 = objc_alloc_init(&OBJC_CLASS___ADDictationProperties);
  uint64_t v11 = -[ADtvOSAssistantProperties initWithQueue:]( objc_alloc(&OBJC_CLASS___ADtvOSAssistantProperties),  "initWithQueue:",  self->_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10011CA00;
  v14[3] = &unk_1004F1E98;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  -[ADDeviceProperties _getODDtvOSDevicePropertiesWithGeneral:assistant:dictation:tvOS:completion:]( self,  "_getODDtvOSDevicePropertiesWithGeneral:assistant:dictation:tvOS:completion:",  v8,  v9,  v10,  v11,  v14);
}

- (void)_getODDiOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 iOSGeneral:(id)a6 iOSAssistant:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[ADDeviceProperties _getODDiOSDevicePropertiesWithGeneral:assistant:dictation:iOSGeneral:iOSAssistant:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  v21 = dispatch_group_create();
  id v22 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDiOSDevicePropertiesReported);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v15 getODDAssistantProperties]);
  [v22 setAssistant:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue([v16 getODDDictationProperties]);
  [v22 setDictation:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v17 getODDiOSGeneralProperties]);
  [v22 setIOSGeneral:v25];

  dispatch_group_enter(v21);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10011C98C;
  v39[3] = &unk_1004F1EC0;
  id v26 = v22;
  id v40 = v26;
  v27 = v21;
  v41 = v27;
  [v14 getODDGeneralPropertiesWithCompletion:v39];
  dispatch_group_enter(v27);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10011C9B8;
  v36[3] = &unk_1004F1EE8;
  id v28 = v26;
  id v37 = v28;
  v38 = v27;
  v29 = v27;
  [v18 getODDiOSAssistantPropertiesWithCompletion:v36];
  queue = (dispatch_queue_s *)self->_queue;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10011C9E4;
  v33[3] = &unk_1004FD990;
  id v34 = v28;
  id v35 = v19;
  id v31 = v28;
  id v32 = v19;
  dispatch_group_notify(v29, queue, v33);
}

- (void)_getODDwatchOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 watchOS:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[ADDeviceProperties _getODDwatchOSDevicePropertiesWithGeneral:assistant:dictation:watchOS:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDwatchOSDevicePropertiesReported);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 getODDAssistantProperties]);
  [v17 setAssistant:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 getODDDictationProperties]);
  [v17 setDictation:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 getODDwatchOSAssistantProperties]);
  [v17 setWatchOSAssistant:v20];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10011C948;
  v23[3] = &unk_1004F1F10;
  id v24 = v17;
  id v25 = v15;
  id v21 = v15;
  id v22 = v17;
  [v11 getODDGeneralPropertiesWithCompletion:v23];
}

- (void)_getODDtvOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 tvOS:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[ADDeviceProperties _getODDtvOSDevicePropertiesWithGeneral:assistant:dictation:tvOS:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v18 = dispatch_group_create();
  id v19 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDtvOSDevicePropertiesReported);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v13 getODDAssistantProperties]);
  [v19 setAssistant:v20];

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v14 getODDDictationProperties]);
  [v19 setDictation:v21];

  dispatch_group_enter(v18);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10011C8D4;
  v35[3] = &unk_1004F1EC0;
  id v22 = v19;
  id v36 = v22;
  v23 = v18;
  id v37 = v23;
  [v12 getODDGeneralPropertiesWithCompletion:v35];
  dispatch_group_enter(v23);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_10011C900;
  v32[3] = &unk_1004F1F38;
  id v24 = v22;
  id v33 = v24;
  id v34 = v23;
  id v25 = v23;
  [v15 getODDtvOSAssistantPropertiesWithCompletion:v32];
  queue = (dispatch_queue_s *)self->_queue;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10011C92C;
  v29[3] = &unk_1004FD990;
  id v30 = v24;
  id v31 = v16;
  id v27 = v24;
  id v28 = v16;
  dispatch_group_notify(v25, queue, v29);
}

- (void)_getODDmacOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 macOS:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v27 = "-[ADDeviceProperties _getODDmacOSDevicePropertiesWithGeneral:assistant:dictation:macOS:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDmacOSDevicePropertiesReported);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 getODDAssistantProperties]);
  [v17 setAssistant:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 getODDDictationProperties]);
  [v17 setDictation:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 getODDmacOSAssistantProperties]);
  [v17 setMacOSAssistant:v20];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10011C890;
  v23[3] = &unk_1004F1F10;
  id v24 = v17;
  id v25 = v15;
  id v21 = v15;
  id v22 = v17;
  [v11 getODDGeneralPropertiesWithCompletion:v23];
}

- (void)_getODDvisionOSDevicePropertiesWithGeneral:(id)a3 assistant:(id)a4 dictation:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[ADDeviceProperties _getODDvisionOSDevicePropertiesWithGeneral:assistant:dictation:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___ODDSiriSchemaODDvisionOSDevicePropertiesReported);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 getODDAssistantProperties]);
  [v14 setAssistant:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 getODDDictationProperties]);
  [v14 setDictation:v16];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10011C84C;
  v19[3] = &unk_1004F1F10;
  id v20 = v14;
  id v21 = v12;
  id v17 = v12;
  id v18 = v14;
  [v9 getODDGeneralPropertiesWithCompletion:v19];
}

- (void)_triggerReportingForNullDeviceAggregationId
{
  v2 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    id v7 = "-[ADDeviceProperties _triggerReportingForNullDeviceAggregationId]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Reporting missing deviceAggregationId for ODDDeviceProperties to ABC",  (uint8_t *)&v6,  0xCu);
  }

  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SiriCoreSymptomsReporter sharedInstance](&OBJC_CLASS___SiriCoreSymptomsReporter, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  id v5 = [v4 processIdentifier];
  [v3 reportIssueForType:@"ODDDeviceProperties" subType:@"null_deviceAggregationId" context:&__NSDictionary0__struct processIdentifier:v5 walkboutStatus:byte_1005780A0];
}

- (void).cxx_destruct
{
}

@end