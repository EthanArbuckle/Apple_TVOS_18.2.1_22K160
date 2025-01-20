@interface SpeechModelTrainingConnection
+ (void)initialize;
- (BOOL)shouldStop;
- (SpeechModelTrainingConnection)init;
- (SpeechModelTrainingConnection)initWithXPCConnection:(id)a3;
- (id)createDispatchTimerWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)setShouldStop:(BOOL)a3;
- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 write:(BOOL)a6 completion:(id)a7;
- (void)upperCaseString:(id)a3 withReply:(id)a4;
@end

@implementation SpeechModelTrainingConnection

- (SpeechModelTrainingConnection)init
{
  return 0LL;
}

- (SpeechModelTrainingConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SpeechModelTrainingConnection;
  v6 = -[SpeechModelTrainingConnection init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_100006460;
    v13 = &unk_1000106C8;
    objc_copyWeak(&v14, &location);
    v8 = objc_retainBlock(&v10);
    objc_msgSend(v5, "setInterruptionHandler:", v8, v10, v11, v12, v13);
    [v5 setInvalidationHandler:v8];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SpeechModelTrainingConnection;
  -[SpeechModelTrainingConnection dealloc](&v3, "dealloc");
}

- (void)upperCaseString:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 uppercaseString]);
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 write:(BOOL)a6 completion:(id)a7
{
  id v7 = a7;
  v8 = (dispatch_queue_s *)qword_100016020;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006428;
  block[3] = &unk_1000106F0;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (id)createDispatchTimerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  id v7 = a5;
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, (dispatch_queue_t)a4);
  if (v8)
  {
    double v9 = a3 * 1000000000.0;
    dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)v9);
    dispatch_source_set_timer(v8, v10, (unint64_t)v9, 0LL);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = v5;
  if (v5) {
    id v5 = (id)(*((uint64_t (**)(id, void))v5 + 2))(v5, 0LL);
  }
  xpc_transaction_exit_clean(v5);
}

- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5
{
  id v5 = a5;
  v6 = (dispatch_queue_s *)qword_100016020;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006400;
  block[3] = &unk_1000106F0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5
{
  id v5 = a5;
  v6 = (dispatch_queue_s *)qword_100016020;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000063D8;
  block[3] = &unk_1000106F0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v12 = a12;
  v13 = (dispatch_queue_s *)qword_100016020;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000063BC;
  block[3] = &unk_1000106F0;
  id v16 = v12;
  id v14 = v12;
  dispatch_async(v13, block);
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v12 = a12;
  v13 = (dispatch_queue_s *)qword_100016020;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000063A0;
  block[3] = &unk_1000106F0;
  id v16 = v12;
  id v14 = v12;
  dispatch_async(v13, block);
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SpeechModelTrainingConnection, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SpeechModelTrainingConnection");
    objc_super v3 = (void *)qword_100016018;
    qword_100016018 = (uint64_t)v2;

    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SpeechModelTrainingConnection", v5);
    id v7 = (void *)qword_100016020;
    qword_100016020 = (uint64_t)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.speechmodeltrainingd.asset-fetch", 0LL);
    id v9 = (void *)qword_100016028;
    qword_100016028 = (uint64_t)v8;
  }

@end