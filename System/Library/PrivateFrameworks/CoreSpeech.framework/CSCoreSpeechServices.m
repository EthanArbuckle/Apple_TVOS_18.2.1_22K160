@interface CSCoreSpeechServices
+ (id)getCoreSpeechServiceConnection;
+ (id)getCoreSpeechXPCConnection;
+ (int64_t)getFirstPassRunningMode;
+ (void)_voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10;
+ (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4;
+ (void)getCSVoiceTriggerRTModelRequestOptions:(id)a3 completion:(id)a4;
+ (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4;
+ (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4;
+ (void)requestUpdatedSATAudio;
+ (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6;
+ (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 endpointId:(id)a6 downloadedModels:(id)a7 preinstalledModels:(id)a8 completion:(id)a9;
+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6 completion:(id)a7;
@end

@implementation CSCoreSpeechServices

+ (id)getCoreSpeechServiceConnection
{
  v2 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.corespeech.corespeechservices",  0LL);
  id v3 = sub_1000D563C();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[NSXPCConnection setRemoteObjectInterface:](v2, "setRemoteObjectInterface:", v4);

  return v2;
}

+ (id)getCoreSpeechXPCConnection
{
  v39 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.corespeech.xpc");
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CoreSpeechXPCProtocol));
  v45[0] = objc_opt_class(&OBJC_CLASS___NSUUID, v3);
  v45[1] = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  v45[2] = objc_opt_class(&OBJC_CLASS___NSString, v5);
  v45[3] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 4LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  [v2 setClasses:v8 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:0];

  v44[0] = objc_opt_class(&OBJC_CLASS___NSArray, v9);
  v44[1] = objc_opt_class(&OBJC_CLASS___NSString, v10);
  v44[2] = objc_opt_class(&OBJC_CLASS___NSData, v11);
  v44[3] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel, v12);
  v44[4] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 5LL));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));
  [v2 setClasses:v15 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:0];

  v43[0] = objc_opt_class(&OBJC_CLASS___NSArray, v16);
  v43[1] = objc_opt_class(&OBJC_CLASS___NSString, v17);
  v43[2] = objc_opt_class(&OBJC_CLASS___NSData, v18);
  v43[3] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel, v19);
  v43[4] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 5LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v21));
  [v2 setClasses:v22 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:2 ofReply:0];

  v42[0] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel, v23);
  v42[1] = objc_opt_class(&OBJC_CLASS___NSString, v24);
  v42[2] = objc_opt_class(&OBJC_CLASS___NSData, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 3LL));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v26));
  [v2 setClasses:v27 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:1];

  v41[0] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel, v28);
  v41[1] = objc_opt_class(&OBJC_CLASS___NSString, v29);
  v41[2] = objc_opt_class(&OBJC_CLASS___NSData, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));
  [v2 setClasses:v32 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:1];

  v40[0] = objc_opt_class(&OBJC_CLASS___NSString, v33);
  v40[1] = objc_opt_class(&OBJC_CLASS___NSArray, v34);
  v40[2] = objc_opt_class(&OBJC_CLASS___NSData, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 3LL));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v36));
  [v2 setClasses:v37 forSelector:"voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:" argumentIndex:0 ofReply:0];

  -[NSXPCConnection setRemoteObjectInterface:](v39, "setRemoteObjectInterface:", v2);
  return v39;
}

+ (void)installedVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CSLogInitIfNeeded(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechXPCConnection]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002FC44;
  v16[3] = &unk_10022C280;
  id v9 = v7;
  id v17 = v9;
  [v8 setInvalidationHandler:v16];
  [v8 resume];
  objc_initWeak(&location, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxy]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002FD3C;
  v12[3] = &unk_10022AA00;
  id v11 = v9;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  [v10 installedVoiceTriggerAssetForLanguageCode:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

+ (void)fetchRemoteVoiceTriggerAssetForLanguageCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CSLogInitIfNeeded(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechXPCConnection]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002FAE8;
  v16[3] = &unk_10022C280;
  id v9 = v7;
  id v17 = v9;
  [v8 setInvalidationHandler:v16];
  [v8 resume];
  objc_initWeak(&location, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxy]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002FBE0;
  v12[3] = &unk_10022AA00;
  id v11 = v9;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  [v10 fetchRemoteVoiceTriggerAssetForLanguageCode:v6 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

+ (void)getCurrentVoiceTriggerLocaleWithEndpointId:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002FA6C;
  v7[3] = &unk_10022AA28;
  id v8 = a4;
  id v6 = v8;
  [a1 getCSVoiceTriggerRTModelRequestOptions:a3 completion:v7];
}

+ (void)getCSVoiceTriggerRTModelRequestOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10002F94C;
  v17[3] = &unk_10022AA28;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechServiceConnection]);
  uint64_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]";
    __int16 v21 = 1026;
    int v22 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s making connection to corespeechd with (%{public}d)",  buf,  0x12u);
  }

  [v9 resume];
  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "+[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Asking VoiceTrigger locale to corespeechd",  buf,  0xCu);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteObjectProxy]);
  if (v12)
  {
    objc_initWeak((id *)buf, v9);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10002F960;
    v14[3] = &unk_10022AA50;
    v15 = v8;
    objc_copyWeak(&v16, (id *)buf);
    [v12 getVoiceTriggerRTModelRequestOptionsWithEndpointId:v6 completion:v14];
    objc_destroyWeak(&v16);

    objc_destroyWeak((id *)buf);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  406LL,  0LL));
    ((void (*)(void *, void, void *))v8[2])(v8, 0LL, v13);

    [v9 setInvalidationHandler:0];
    [v9 invalidate];
  }
}

+ (void)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v23 = v10;
    id v14 = objc_alloc(&OBJC_CLASS___CSSafetyOneArgumentCompletionBlock);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10002F72C;
    v31[3] = &unk_10022AA78;
    id v32 = v13;
    id v15 = [v14 initWithDefaultValue:&__kCFBooleanFalse completionBlock:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10002F75C;
    v29[3] = &unk_10022F100;
    id v16 = (id)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechXPCConnection]);
    id v30 = v16;
    id v17 = objc_retainBlock(v29);
    [v16 setInterruptionHandler:v17];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10002F834;
    v27[3] = &unk_10022F100;
    id v18 = v16;
    id v28 = v18;
    [v18 setInvalidationHandler:v27];
    [v18 resume];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 remoteObjectProxy]);
    uint64_t v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:completion:]";
      __int16 v35 = 2048;
      v36 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Remote object proxy %p", buf, 0x16u);
    }

    if (v19)
    {
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 remoteObjectProxy]);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10002F8EC;
      v24[3] = &unk_10022AAA0;
      v26 = v17;
      id v25 = v15;
      id v10 = v23;
      [v21 supportsMultiPhraseVoiceTriggerForEngineVersion:v23 engineMinorVersion:v11 accessoryRTModelType:v12 completion:v24];
    }

    else
    {
      int v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      id v10 = v23;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v34 = "+[CSCoreSpeechServices supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModel"
              "Type:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Remote object proxy is nil",  buf,  0xCu);
      }
    }
  }
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 downloadedModels:(id)a6 preinstalledModels:(id)a7 completion:(id)a8
{
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10
{
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 endpointId:(id)a6 downloadedModels:(id)a7 preinstalledModels:(id)a8 completion:(id)a9
{
}

+ (void)_voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 accessoryRTModelType:(int64_t)a5 accessoryInfo:(id)a6 endpointId:(id)a7 downloadedModels:(id)a8 preinstalledModels:(id)a9 completion:(id)a10
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  CSLogInitIfNeeded(v19);
  if (a5) {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  }
  else {
    uint64_t v20 = 0LL;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10002EFBC;
  v28[3] = &unk_10022AB18;
  unint64_t v35 = a3;
  unint64_t v36 = a4;
  id v29 = v16;
  id v30 = v20;
  int64_t v37 = a5;
  id v38 = a1;
  id v31 = v15;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v19;
  id v24 = v15;
  id v25 = v20;
  id v26 = v16;
  +[CSCoreSpeechServices getCSVoiceTriggerRTModelRequestOptions:completion:]( &OBJC_CLASS___CSCoreSpeechServices,  "getCSVoiceTriggerRTModelRequestOptions:completion:",  v25,  v28);
}

+ (void)voiceTriggerRTModelForVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  CSLogInitIfNeeded(v14);
  [a1 voiceTriggerRTModelForVersion:a3 minorVersion:a4 accessoryRTModelType:0 accessoryInfo:0 endpointId:0 downloadedModels:v14 preinstall edModels:v13 completion:v12];
}

+ (void)voiceTriggerJarvisLanguageList:(id)a3 jarvisSelectedLanguage:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CSLogInitIfNeeded(v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechXPCConnection]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002EE64;
  v19[3] = &unk_10022C280;
  id v12 = v10;
  id v20 = v12;
  [v11 setInvalidationHandler:v19];
  [v11 resume];
  id v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "+[CSCoreSpeechServices voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:]";
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Asking keyword language given Jarvis language list %{public}@, jarvis-selected language: %{public}@",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, v11);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxy]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002EF58;
  v16[3] = &unk_10022AB40;
  id v15 = v12;
  id v17 = v15;
  objc_copyWeak(&v18, (id *)buf);
  [v14 voiceTriggerJarvisLanguageList:v8 jarvisSelectedLanguage:v9 completion:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

+ (void)requestUpdatedSATAudio
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechServiceConnection]);
  [v3 setInvalidationHandler:&stru_10022AB60];
  [v3 resume];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteObjectProxy]);
  if (v4)
  {
    objc_initWeak(&location, v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10002ECA8;
    v5[3] = &unk_10022AB88;
    objc_copyWeak(&v6, &location);
    [v4 requestUpdatedSATAudio:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

  else
  {
    [v3 setInvalidationHandler:0];
    [v3 invalidate];
  }
}

+ (int64_t)getFirstPassRunningMode
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getCoreSpeechServiceConnection]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002EB94;
  v19[3] = &unk_10022F100;
  uint64_t v5 = v3;
  id v20 = v5;
  [v4 setInvalidationHandler:v19];
  [v4 resume];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = -1LL;
  if (v6)
  {
    objc_initWeak(&location, v4);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002EC44;
    v10[3] = &unk_10022ABB0;
    id v12 = &v15;
    objc_copyWeak(&v13, &location);
    id v7 = v5;
    id v11 = v7;
    [v6 getFirstPassRunningMode:v10];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  else
  {
    [v4 setInvalidationHandler:0];
    [v4 invalidate];
  }

  int64_t v8 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v8;
}

@end