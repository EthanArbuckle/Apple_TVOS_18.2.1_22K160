@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CoreSpeechXPCFakeModelMonitor)fakeModelMonitor;
- (ServiceDelegate)init;
- (void)dealloc;
- (void)setFakeModelMonitor:(id)a3;
@end

@implementation ServiceDelegate

- (ServiceDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ServiceDelegate;
  v2 = -[ServiceDelegate init](&v8, "init");
  v4 = v2;
  if (v2 && CSIsInternalBuild(v2, v3))
  {
    v5 = objc_alloc_init(&OBJC_CLASS___CoreSpeechXPCFakeModelMonitor);
    fakeModelMonitor = v4->_fakeModelMonitor;
    v4->_fakeModelMonitor = v5;

    -[CoreSpeechXPCFakeModelMonitor start](v4->_fakeModelMonitor, "start");
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ServiceDelegate;
  -[ServiceDelegate dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v22 = a4;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CoreSpeechXPCProtocol));
  v30[0] = objc_opt_class(&OBJC_CLASS___NSUUID);
  v30[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v30[2] = objc_opt_class(&OBJC_CLASS___NSString);
  v30[3] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 4LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  [v4 setClasses:v6 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:0];

  *(void *)buf = objc_opt_class(&OBJC_CLASS___NSArray);
  *(void *)&buf[8] = objc_opt_class(&OBJC_CLASS___NSString);
  *(void *)&buf[16] = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v28 = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel);
  uint64_t v29 = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", buf, 5LL));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  [v4 setClasses:v8 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:0];

  v26[0] = objc_opt_class(&OBJC_CLASS___NSArray);
  v26[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v26[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v26[3] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel);
  v26[4] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 5LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
  [v4 setClasses:v10 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:2 ofReply:0];

  v25[0] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel);
  v25[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v25[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  [v4 setClasses:v12 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:0 ofReply:1];

  v24[0] = objc_opt_class(&OBJC_CLASS___CSVoiceTriggerRTModel);
  v24[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v24[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 3LL));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
  [v4 setClasses:v14 forSelector:"voiceTriggerRTModelWithRequestOptions:downloadedModels:preinstalledModels:completion:" argumentIndex:1 ofReply:1];

  v23[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v23[1] = objc_opt_class(&OBJC_CLASS___NSArray);
  v23[2] = objc_opt_class(&OBJC_CLASS___NSData);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
  [v4 setClasses:v16 forSelector:"voiceTriggerJarvisLanguageList:jarvisSelectedLanguage:completion:" argumentIndex:0 ofReply:0];

  [v22 setExportedInterface:v4];
  unsigned __int8 v17 = +[CSUtils xpcConnection:hasEntitlement:]( &OBJC_CLASS___CSUtils,  "xpcConnection:hasEntitlement:",  v22,  @"corespeech.xpc");
  if ((v17 & 1) != 0)
  {
    v18 = -[CoreSpeechXPC initWithFakeMonitor:]( objc_alloc(&OBJC_CLASS___CoreSpeechXPC),  "initWithFakeMonitor:",  self->_fakeModelMonitor);
    [v22 setExportedObject:v18];
    [v22 resume];
  }

  else
  {
    v19 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ServiceDelegate listener:shouldAcceptNewConnection:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Connecting request %{public}@ rejected due to missing entitlement",  buf,  0x16u);
    }

    objc_msgSend(v22, "invalidate", self);
  }

  return v17;
}

- (CoreSpeechXPCFakeModelMonitor)fakeModelMonitor
{
  return self->_fakeModelMonitor;
}

- (void)setFakeModelMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end