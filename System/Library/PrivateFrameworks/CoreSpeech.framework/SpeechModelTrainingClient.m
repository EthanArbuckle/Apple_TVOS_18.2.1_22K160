@interface SpeechModelTrainingClient
+ (void)initialize;
- (SpeechModelTrainingClient)init;
- (id)_serviceProxyWithErrorHandler:(id)a3;
- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)invalidate;
- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 directory:(id)a6 completion:(id)a7;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 fides:(BOOL)a6 activity:(id)a7 completion:(id)a8;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 activity:(id)a6 completion:(id)a7;
- (void)trainPersonalizedLMWithLanguage:(id)a3 directory:(id)a4 completion:(id)a5;
- (void)upperCaseString:(id)a3 completion:(id)a4;
- (void)xpcExitClean;
@end

@implementation SpeechModelTrainingClient

- (SpeechModelTrainingClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SpeechModelTrainingClient;
  v2 = -[SpeechModelTrainingClient init](&v14, "init");
  if (v2)
  {
    v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.corespeech.speechmodeltraining.xpc",  0LL);
    smtConnection = v2->_smtConnection;
    v2->_smtConnection = v3;

    v5 = v2->_smtConnection;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SpeechModelTrainingProtocol));
    v15[0] = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    v15[1] = objc_opt_class(&OBJC_CLASS___NSString, v8);
    v15[2] = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    v15[3] = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 4LL));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    [v6 setClasses:v12 forSelector:"trainPersonalizedLMWithLanguage:configuration:fides:write:completion:" argumentIndex:0 ofReply:1];
    [v6 setClasses:v12 forSelector:"buildPhoneticMatchWithLanguage:saveIntermediateFsts:completion:" argumentIndex:0 ofReply:1];

    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);
    -[NSXPCConnection setInterruptionHandler:](v2->_smtConnection, "setInterruptionHandler:", &stru_100229E00);
    -[NSXPCConnection setInvalidationHandler:](v2->_smtConnection, "setInvalidationHandler:", &stru_100229E20);
    -[NSXPCConnection resume](v2->_smtConnection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_10027FBA0;
  if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc-ing", buf, 2u);
  }

  -[NSXPCConnection invalidate](self->_smtConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SpeechModelTrainingClient;
  -[SpeechModelTrainingClient dealloc](&v4, "dealloc");
}

- (id)_serviceProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_smtConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  a3);
}

- (void)upperCaseString:(id)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000536C;
  v15[3] = &unk_100229E48;
  id v16 = a4;
  id v6 = v16;
  id v7 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005380;
  v13[3] = &unk_100229E70;
  uint64_t v8 = objc_retainBlock(v15);
  id v14 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  v13));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100005394;
  v11[3] = &unk_100229E98;
  id v12 = v8;
  uint64_t v10 = v8;
  [v9 upperCaseString:v7 withReply:v11];
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 directory:(id)a6 completion:(id)a7
{
  id v40 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100005264;
  v46[3] = &unk_100229EC0;
  id v14 = a7;
  id v47 = v14;
  v41 = objc_retainBlock(v46);
  v15 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:@"Assistant/SpeechPersonalizedLM"]);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue([v18 stringByStandardizingPath]);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingPathComponent:@"Assistant/SpeechPersonalizedLM_Fides"]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByStandardizingPath]);

  v22 = (os_log_s *)qword_10027FBA0;
  if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v19;
    __int16 v52 = 2112;
    v53 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "personalizedLMPath=%@ fidesPersonalizedLMPath=%@",  buf,  0x16u);
  }

  if ([v13 isEqualToString:v19])
  {
    v23 = (os_log_s *)qword_10027FBA0;
    if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Client is 24-hour job", buf, 2u);
    }

    v24 = self;
    v25 = v40;
    id v26 = v40;
    id v27 = v11;
    id v28 = v12;
    uint64_t v29 = 0LL;
LABEL_11:
    -[SpeechModelTrainingClient trainPersonalizedLMWithLanguage:configuration:asset:fides:activity:completion:]( v24,  "trainPersonalizedLMWithLanguage:configuration:asset:fides:activity:completion:",  v26,  v27,  v28,  v29,  0LL,  v14);
    goto LABEL_12;
  }

  if ([v13 isEqualToString:v21])
  {
    v30 = (os_log_s *)qword_10027FBA0;
    if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Client is DictationPersonalizationFidesPlugin",  buf,  2u);
    }

    v24 = self;
    v25 = v40;
    id v26 = v40;
    id v27 = v11;
    id v28 = v12;
    uint64_t v29 = 1LL;
    goto LABEL_11;
  }

  if ([v13 length])
  {
    v31 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Input directory path(%@) does not match expected path",  v13);
    v32 = (os_log_s *)qword_10027FBA0;
    v33 = v31;
    if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    v49 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.speechmodeltraining",  202LL,  v34));
    ((void (*)(void *, void, void *))v41[2])(v41, 0LL, v35);

    v25 = v40;
  }

  else
  {
    v36 = (os_log_s *)qword_10027FBA0;
    if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Client is PersonalizedLmFidesPlugin", buf, 2u);
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_100005278;
    v44[3] = &unk_100229E70;
    v37 = v41;
    id v45 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  v44));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100005360;
    v42[3] = &unk_100229EC0;
    v43 = v37;
    v25 = v40;
    [v38 trainPersonalizedLMWithLanguage:v40 configuration:v11 fides:0 write:0 completion:v42];
  }

- (void)trainPersonalizedLMWithLanguage:(id)a3 directory:(id)a4 completion:(id)a5
{
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 fides:(BOOL)a6 activity:(id)a7 completion:(id)a8
{
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  BOOL v7 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000515C;
  v21[3] = &unk_100229EC0;
  id v22 = a7;
  id v11 = v22;
  id v12 = a4;
  id v13 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100005170;
  v19[3] = &unk_100229E70;
  id v14 = objc_retainBlock(v21);
  id v20 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  v19));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100005258;
  v17[3] = &unk_100229EC0;
  id v18 = v14;
  id v16 = v14;
  [v15 trainPersonalizedLMWithLanguage:v13 configuration:v12 fides:v7 write:1 completion:v17];
}

- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100005060;
  v9[3] = &unk_100229E70;
  id v10 = a4;
  id v6 = v10;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v9));
  [v8 trainGlobalNNLMwithFidesSessionURL:v7 completion:v6];
}

- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100004F64;
  v17[3] = &unk_100229EC0;
  id v18 = a5;
  id v8 = v18;
  id v9 = a3;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100004F78;
  v15 = &unk_100229E70;
  id v16 = objc_retainBlock(v17);
  id v10 = v16;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  &v12));
  objc_msgSend(v11, "buildPhoneticMatchWithLanguage:saveIntermediateFsts:completion:", v9, v5, v8, v12, v13, v14, v15);
}

- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100004E64;
  v12[3] = &unk_100229E70;
  id v13 = a5;
  id v8 = v13;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  v12));
  [v11 generateAudioWithTexts:v10 language:v9 completion:v8];
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100004D64;
  v29[3] = &unk_100229E70;
  id v30 = a12;
  id v18 = v30;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  v29));
  [v27 generateConfusionPairsWithUUID:v26 parameters:v25 language:v24 task:v23 samplingRate:a7 recognizedTokens:v22 recognizedText:v21 correctedText:v20 s electedAlternatives:v19 completion:v18];
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100004C64;
  v29[3] = &unk_100229E70;
  id v30 = a12;
  id v18 = v30;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  v29));
  [v27 generateConfusionPairsWithUUID:v26 parameters:v25 language:v24 task:v23 samplingRate:a7 recognizedNbest:v22 recognizedText:v21 correctedText:v20 se lectedAlternatives:v19 completion:v18];
}

- (void)xpcExitClean
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:]( self,  "_serviceProxyWithErrorHandler:",  &stru_100229EE0));
  [v2 xpcExitClean];
}

- (void)invalidate
{
  v3 = (os_log_s *)qword_10027FBA0;
  if (os_log_type_enabled((os_log_t)qword_10027FBA0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating", v4, 2u);
  }

  -[NSXPCConnection invalidate](self->_smtConnection, "invalidate");
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SpeechModelTrainingClient, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SpeechModelTrainingClient");
    v3 = (void *)qword_10027FBA0;
    qword_10027FBA0 = (uint64_t)v2;
  }

@end