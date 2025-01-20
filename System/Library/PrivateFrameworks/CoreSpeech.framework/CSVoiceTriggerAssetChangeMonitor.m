@interface CSVoiceTriggerAssetChangeMonitor
+ (id)sharedMonitor;
- (CSVoiceTriggerAssetChangeDelegate)delegate;
- (CSVoiceTriggerAssetChangeMonitor)init;
- (void)notifyVoiceTriggerAssetChanged;
- (void)setDelegate:(id)a3;
- (void)startMonitoring;
@end

@implementation CSVoiceTriggerAssetChangeMonitor

- (CSVoiceTriggerAssetChangeMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerAssetChangeMonitor;
  v2 = -[CSVoiceTriggerAssetChangeMonitor init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    dispatch_queue_t v4 = dispatch_queue_create("VoiceTrigger Asset Change Monitor", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }

  return v3;
}

- (void)startMonitoring
{
  if (self->_notifyToken == -1)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10002FF38;
    v4[3] = &unk_10022C258;
    objc_copyWeak(&v5, &location);
    notify_register_dispatch("com.apple.corespeech.voicetriggerassetchange", &self->_notifyToken, queue, v4);
    objc_destroyWeak(&v5);
  }

  objc_destroyWeak(&location);
}

- (void)notifyVoiceTriggerAssetChanged
{
}

- (CSVoiceTriggerAssetChangeDelegate)delegate
{
  return (CSVoiceTriggerAssetChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedMonitor
{
  if (qword_10027FCB8 != -1) {
    dispatch_once(&qword_10027FCB8, &stru_10022ABD0);
  }
  return (id)qword_10027FCC0;
}

@end