@interface ADMyriadSettingsManager
+ (id)sharedSettingsManager;
- (BOOL)trialTreatmentMultiDeviceConsensus;
- (NSString)treatmentId;
- (id)_init;
- (void)_setupTrialRefresh;
- (void)getSidekickBoostsFileWithCompletion:(id)a3;
- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5;
- (void)refreshTrial;
- (void)setTrialTreatmentMultiDeviceConsensus:(BOOL)a3;
@end

@implementation ADMyriadSettingsManager

- (NSString)treatmentId
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue( -[TRIClient treatmentIdWithNamespaceName:]( self->_trialClient,  "treatmentIdWithNamespaceName:",  @"MYRIAD_BOOSTS"));
  v3 = v2;
  if (!v2) {
    v2 = &stru_1004FECA0;
  }
  v4 = v2;

  return v4;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADMyriadSettingsManager;
  v2 = -[ADMyriadSettingsManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADMyriadSettingsManager", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](&OBJC_CLASS___TRIClient, "clientWithIdentifier:", 294LL));
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v7;

    v2->_trialTreatmentMultiDeviceConsensus = 0;
  }

  return v2;
}

- (void)setTrialTreatmentMultiDeviceConsensus:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    BOOL trialTreatmentMultiDeviceConsensus = self->_trialTreatmentMultiDeviceConsensus;
    int v7 = 136315650;
    v8 = "-[ADMyriadSettingsManager setTrialTreatmentMultiDeviceConsensus:]";
    __int16 v9 = 1024;
    BOOL v10 = trialTreatmentMultiDeviceConsensus;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Consensus Updated From: %d To: %d",  (uint8_t *)&v7,  0x18u);
  }

  if (self->_trialTreatmentMultiDeviceConsensus != v3)
  {
    self->_BOOL trialTreatmentMultiDeviceConsensus = v3;
    -[ADMyriadSettingsManager refreshTrial](self, "refreshTrial");
  }

- (void)_setupTrialRefresh
{
  BOOL v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v9 = "-[ADMyriadSettingsManager _setupTrialRefresh]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Registering update handler", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002475D0;
  v6[3] = &unk_1004FCD88;
  objc_copyWeak(&v7, (id *)buf);
  v4 = objc_retainBlock(v6);
  id v5 =  -[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]( self->_trialClient,  "addUpdateHandlerForNamespaceName:queue:usingBlock:",  @"MYRIAD_BOOSTS",  self->_queue,  v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)refreshTrial
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002474D8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)getTrialEnables:(id)a3 doubleFactors:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100246E7C;
  v15[3] = &unk_1004FDA30;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)getSidekickBoostsFileWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100246AE0;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)trialTreatmentMultiDeviceConsensus
{
  return self->_trialTreatmentMultiDeviceConsensus;
}

- (void).cxx_destruct
{
}

+ (id)sharedSettingsManager
{
  if (qword_100578258 != -1) {
    dispatch_once(&qword_100578258, &stru_1004F7780);
  }
  return (id)qword_100578250;
}

@end