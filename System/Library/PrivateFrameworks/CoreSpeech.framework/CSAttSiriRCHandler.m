@interface CSAttSiriRCHandler
- (CSAttSiriEndpointerNode)endpointerNode;
- (CSAttSiriRCHandler)initWithEndpointerNode:(id)a3 uresNode:(id)a4;
- (CSAttSiriUresNode)uresNode;
- (NSHashTable)resultCandidateReceivers;
- (OS_dispatch_queue)queue;
- (void)addResultCandidateReceiver:(id)a3;
- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8;
- (void)setEndpointerNode:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResultCandidateReceivers:(id)a3;
- (void)setUresNode:(id)a3;
@end

@implementation CSAttSiriRCHandler

- (CSAttSiriRCHandler)initWithEndpointerNode:(id)a3 uresNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSAttSiriRCHandler;
  v8 = -[CSAttSiriRCHandler init](&v15, "init");
  if (v8)
  {
    v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSAttSiriRCHandler initWithEndpointerNode:uresNode:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }

    objc_storeWeak((id *)&v8->_endpointerNode, v6);
    objc_storeWeak((id *)&v8->_uresNode, v7);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    resultCandidateReceivers = v8->_resultCandidateReceivers;
    v8->_resultCandidateReceivers = (NSHashTable *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueueWithQOS:name:fixedPriority:]( &OBJC_CLASS___CSUtils,  "getSerialQueueWithQOS:name:fixedPriority:",  33LL,  @"AttSiriRCHandler Queue",  kCSDefaultSerialQueueFixedPriority));
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;
  }

  return v8;
}

- (void)addResultCandidateReceiver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D28D4;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (void (**)(id, BOOL, BOOL, void))a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v15 recognition]);
  [v18 processedAudioDuration];
  double v20 = v19;

  v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSAttSiriRCHandler processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    double v43 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s Received RC %lu with duration %f from server, make RC acceptance and mitigation decision",  buf,  0x20u);
  }

  if (!+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
    [WeakRetained processResultCandidate:v15 forRCId:a3 forTask:v16 forRequestId:v14 completion:0];

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v43) = 0;
    if (v9)
    {
      if ((+[CSUtils isMedocFeatureEnabled](&OBJC_CLASS___CSUtils, "isMedocFeatureEnabled") & 1) == 0)
      {
        id v24 = objc_loadWeakRetained((id *)&self->_uresNode);
        unsigned __int8 v25 = [v24 getMitigationDecisionForRCId:a3 forRequestId:v14];
        *(_BYTE *)(*(void *)&buf[8] + 24LL) = v25;
      }

      if (!v17) {
        goto LABEL_15;
      }
      BOOL v26 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
      goto LABEL_14;
    }

    id v27 = objc_loadWeakRetained((id *)&self->_endpointerNode);
    BOOL v28 = v27 == 0LL;

    if (v28)
    {
      if (v17)
      {
        BOOL v26 = 0LL;
LABEL_14:
        v17[2](v17, v9, v26, 0LL);
      }
    }

    else
    {
      id v29 = objc_loadWeakRetained((id *)&self->_endpointerNode);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1000D2790;
      v30[3] = &unk_10022CE08;
      v33 = buf;
      unint64_t v34 = a3;
      v30[4] = self;
      id v31 = v14;
      v32 = v17;
      [v29 shouldAcceptEagerResultForDuration:v30 resultsCompletionHandler:v20];
    }

- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8 = a4;
  BOOL v9 = (void (**)(id, id))a5;
  uint64_t v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[CSAttSiriRCHandler getMitigationDecisionForRCIdWithCompletion:requestId:completion:]";
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s rcId: %lu", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uresNode);
  id v12 = [WeakRetained getMitigationDecisionForRCId:a3 forRequestId:v8];

  if (v9) {
    v9[2](v9, v12);
  }
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return (CSAttSiriEndpointerNode *)objc_loadWeakRetained((id *)&self->_endpointerNode);
}

- (void)setEndpointerNode:(id)a3
{
}

- (CSAttSiriUresNode)uresNode
{
  return (CSAttSiriUresNode *)objc_loadWeakRetained((id *)&self->_uresNode);
}

- (void)setUresNode:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)resultCandidateReceivers
{
  return self->_resultCandidateReceivers;
}

- (void)setResultCandidateReceivers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end