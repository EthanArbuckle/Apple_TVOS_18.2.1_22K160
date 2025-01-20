@interface CSVoiceTriggerUserSelectedPhrase
- (BOOL)_isMultiPhrase:(unint64_t)a3;
- (BOOL)mphSelected;
- (BOOL)multiPhraseSelected;
- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3;
- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3 vtPreferences:(id)a4;
- (CSVoiceTriggerUserSelectedPhraseDelegate)delegate;
- (NSUUID)endpointDeviceId;
- (OS_dispatch_queue)queue;
- (VTPreferences)vtPrefrences;
- (unint64_t)_fetchUserSelectedPhraseType;
- (unint64_t)uSelectedPhraseType;
- (unint64_t)userSelectedPhraseType;
- (void)_registerForNotification;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEndpointDeviceId:(id)a3;
- (void)setMphSelected:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUSelectedPhraseType:(unint64_t)a3;
- (void)setVtPrefrences:(id)a3;
- (void)vtPhraseTypeDidChangeNotificationReceived;
@end

@implementation CSVoiceTriggerUserSelectedPhrase

- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3
{
  return -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:vtPreferences:]( self,  "initWithEndpointId:vtPreferences:",  a3,  0LL);
}

- (CSVoiceTriggerUserSelectedPhrase)initWithEndpointId:(id)a3 vtPreferences:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerUserSelectedPhrase;
  v9 = -[CSVoiceTriggerUserSelectedPhrase init](&v17, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointDeviceId, a3);
    if (v8) {
      v11 = (VTPreferences *)v8;
    }
    else {
      v11 = (VTPreferences *)objc_claimAutoreleasedReturnValue(+[VTPreferences sharedPreferences](&OBJC_CLASS___VTPreferences, "sharedPreferences"));
    }
    vtPrefrences = v10->_vtPrefrences;
    v10->_vtPrefrences = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CSUtils getSerialQueue:qualityOfService:]( &OBJC_CLASS___CSUtils,  "getSerialQueue:qualityOfService:",  @"com.apple.com.CSUserSelectedVTPhraseMonitor",  33LL));
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    id v15 = -[CSVoiceTriggerUserSelectedPhrase _fetchUserSelectedPhraseType](v10, "_fetchUserSelectedPhraseType");
    v10->_uSelectedPhraseType = (unint64_t)v15;
    v10->_mphSelected = -[CSVoiceTriggerUserSelectedPhrase _isMultiPhrase:](v10, "_isMultiPhrase:", v15);
    -[CSVoiceTriggerUserSelectedPhrase _registerForNotification](v10, "_registerForNotification");
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100127664;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSVoiceTriggerUserSelectedPhrase dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver( DarwinNotifyCenter,  self,  kVTPreferencesVTPhraseTypeDidChangeDarwinNotification,  0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerUserSelectedPhrase;
  -[CSVoiceTriggerUserSelectedPhrase dealloc](&v5, "dealloc");
}

- (unint64_t)_fetchUserSelectedPhraseType
{
  else {
    uint64_t v3 = 2LL * (self->_endpointDeviceId != 0LL);
  }
  id v4 = -[VTPreferences getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:]( self->_vtPrefrences,  "getUserPreferredVoiceTriggerPhraseTypeForDeviceType:endpointId:error:",  v3);
  id v5 = 0LL;
  if (v5)
  {
    id v6 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSVoiceTriggerUserSelectedPhrase _fetchUserSelectedPhraseType]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "%s Error fetching the user selected phrase type %@",  buf,  0x16u);
    }
  }

  return (unint64_t)v4;
}

- (BOOL)_isMultiPhrase:(unint64_t)a3
{
  return a3 == 1;
}

- (void)vtPhraseTypeDidChangeNotificationReceived
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001274A8;
  v4[3] = &unk_10022E920;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_registerForNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1001274A0,  kVTPreferencesVTPhraseTypeDidChangeDarwinNotification,  0LL,  CFNotificationSuspensionBehaviorDrop);
}

- (unint64_t)userSelectedPhraseType
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10012748C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)multiPhraseSelected
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100127448;
  block[3] = &unk_10022DF08;
  block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

- (CSVoiceTriggerUserSelectedPhraseDelegate)delegate
{
  return (CSVoiceTriggerUserSelectedPhraseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VTPreferences)vtPrefrences
{
  return self->_vtPrefrences;
}

- (void)setVtPrefrences:(id)a3
{
}

- (NSUUID)endpointDeviceId
{
  return self->_endpointDeviceId;
}

- (void)setEndpointDeviceId:(id)a3
{
}

- (BOOL)mphSelected
{
  return self->_mphSelected;
}

- (void)setMphSelected:(BOOL)a3
{
  self->_mphSelected = a3;
}

- (unint64_t)uSelectedPhraseType
{
  return self->_uSelectedPhraseType;
}

- (void)setUSelectedPhraseType:(unint64_t)a3
{
  self->_uSelectedPhraseType = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end