@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.private.speech-model-training"]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SpeechModelTrainingProtocol));
    v15[0] = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    v15[1] = objc_opt_class(&OBJC_CLASS___NSString, v8);
    v15[2] = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    v15[3] = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 4LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    [v6 setClasses:v12 forSelector:"trainPersonalizedLMWithLanguage:configuration:fides:write:completion:" argumentIndex:0 ofReply:1];
    [v6 setClasses:v12 forSelector:"buildPhoneticMatchWithLanguage:saveIntermediateFsts:completion:" argumentIndex:0 ofReply:1];

    [v4 setExportedInterface:v6];
    v13 = -[SpeechModelTrainingConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___SpeechModelTrainingConnection),  "initWithXPCConnection:",  v4);
    [v4 setExportedObject:v13];
    [v4 resume];
  }

  else
  {
    [v4 invalidate];
  }

  return v5 != 0LL;
}

@end