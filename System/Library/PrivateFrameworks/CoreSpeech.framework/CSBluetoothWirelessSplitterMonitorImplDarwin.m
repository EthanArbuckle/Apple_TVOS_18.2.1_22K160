@interface CSBluetoothWirelessSplitterMonitorImplDarwin
- (CSBluetoothWirelessSplitterMonitorImplDarwin)init;
- (unint64_t)splitterState;
- (void)_didReceiveWirelessSplitterStateChange;
- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
- (void)splitterState:(id)a3;
- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
@end

@implementation CSBluetoothWirelessSplitterMonitorImplDarwin

- (CSBluetoothWirelessSplitterMonitorImplDarwin)init
{
  if (+[CSUtils isDarwinOS](&OBJC_CLASS___CSUtils, "isDarwinOS"))
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___CSBluetoothWirelessSplitterMonitorImplDarwin;
    v3 = -[CSBluetoothWirelessSplitterMonitor init](&v6, "init");
    if (v3)
    {
      v3->_splitterState = 0LL;
      v3->_shouldDisableSpeakerVerificationInSplitterMode = 0;
    }

    self = v3;
    v4 = self;
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (void)updateSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = @"NO";
    *(void *)&v9[4] = "-[CSBluetoothWirelessSplitterMonitorImplDarwin updateSplitterState:shouldDisableSpeakerVerificat"
                        "ionInSplitterMode:]";
    *(_DWORD *)v9 = 136315650;
    if (v4) {
      v8 = @"YES";
    }
    *(_WORD *)&v9[12] = 2050;
    *(void *)&v9[14] = a3;
    __int16 v10 = 2114;
    v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s splitterState : %{public}lu, shouldDisableSpeakerVerification : %{public}@",  v9,  0x20u);
  }

  self->_splitterState = a3;
  self->_shouldDisableSpeakerVerificationInSplitterMode = v4;
  -[CSBluetoothWirelessSplitterMonitorImplDarwin _didReceiveWirelessSplitterStateChange]( self,  "_didReceiveWirelessSplitterStateChange",  *(_OWORD *)v9);
}

- (void)splitterState:(id)a3
{
  if (a3) {
    (*((void (**)(id, unint64_t, BOOL))a3 + 2))( a3,  self->_splitterState,  self->_shouldDisableSpeakerVerificationInSplitterMode);
  }
}

- (unint64_t)splitterState
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin splitterState]";
    _os_log_fault_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_FAULT,  "%s This call is not supported on darwinOS device (splitterState)",  (uint8_t *)&v4,  0xCu);
  }

  return 0LL;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin _startMonitoringWithQueue:]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Start monitoring : Wireless Splitter start",  (uint8_t *)&v4,  0xCu);
  }

- (void)_stopMonitoring
{
  v2 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[CSBluetoothWirelessSplitterMonitorImplDarwin _stopMonitoring]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s Stop monitoring : Wireless Splitter",  (uint8_t *)&v3,  0xCu);
  }

- (void)_didReceiveWirelessSplitterStateChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000F9180;
  v2[3] = &unk_10022E480;
  v2[4] = self;
  -[CSBluetoothWirelessSplitterMonitorImplDarwin splitterState:](self, "splitterState:", v2);
}

- (void)_notifyObserver:(id)a3 splitterState:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  -[CSBluetoothWirelessSplitterMonitorImplDarwin notifyObserver:](self, "notifyObserver:", v8);
  if ((objc_opt_respondsToSelector( v8,  "CSBluetoothWirelessSplitterMonitor:didReceiveSplitterStateChange:shouldDisableSpeakerVerificationInSplitterMode:") & 1) != 0) {
    [v8 CSBluetoothWirelessSplitterMonitor:self didReceiveSplitterStateChange:a4 shouldDisableSpeakerVerificationInSplitterMode:v5];
  }
}

@end