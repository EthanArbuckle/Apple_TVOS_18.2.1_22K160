@interface IDSQuickSwitchHelper
+ (id)sharedInstance;
- (BOOL)isQuickSwitchingToAnotherDevice;
- (IDSQuickSwitchHelper)init;
- (void)_resetCommunicationStateBeforeQuickSwitchDeactivatePairedDevices:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_setIsQuickSwitchingToAnotherDevice:(BOOL)a3;
- (void)dealloc;
- (void)initiateQuickSwitchToDeviceWithCBUUID:(id)a3 force:(BOOL)a4 completionBlock:(id)a5;
- (void)resetCommunicationStateBeforeQuickSwitchWithCompletionBlock:(id)a3;
@end

@implementation IDSQuickSwitchHelper

+ (id)sharedInstance
{
  if (qword_1009BE9A0 != -1) {
    dispatch_once(&qword_1009BE9A0, &stru_1008F9A40);
  }
  return (id)qword_1009BE9A8;
}

- (IDSQuickSwitchHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSQuickSwitchHelper;
  v2 = -[IDSQuickSwitchHelper init](&v5, "init");
  v3 = v2;
  if (v2) {
    pthread_mutex_init(&v2->_isQuickSwitchingMutex, 0LL);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSQuickSwitchHelper;
  -[IDSQuickSwitchHelper dealloc](&v3, "dealloc");
}

- (BOOL)isQuickSwitchingToAnotherDevice
{
  v2 = self;
  p_isQuickSwitchingMutex = &self->_isQuickSwitchingMutex;
  pthread_mutex_lock(&self->_isQuickSwitchingMutex);
  LOBYTE(v2) = v2->_isQuickSwitchingToAnotherDevice;
  pthread_mutex_unlock(p_isQuickSwitchingMutex);
  return (char)v2;
}

- (void)_setIsQuickSwitchingToAnotherDevice:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "isQuickSwitching set to %@",  (uint8_t *)&v7,  0xCu);
  }

  pthread_mutex_lock(&self->_isQuickSwitchingMutex);
  self->_isQuickSwitchingToAnotherDevice = v3;
  pthread_mutex_unlock(&self->_isQuickSwitchingMutex);
}

- (void)initiateQuickSwitchToDeviceWithCBUUID:(id)a3 force:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPairingManager sharedInstance](&OBJC_CLASS___IDSPairingManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 pairedDeviceUUIDString]);

  unsigned int v12 = [v8 isEqualToIgnoringCase:v11];
  unsigned int v13 = v12;
  if (a4)
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      id v26 = v11;
      __int16 v27 = 2113;
      id v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Forcing QuickSwitch {activeCBUUID: %{private}@, cbuuid: %{private}@}",  buf,  0x16u);
    }

    goto LABEL_10;
  }

  if (!v12)
  {
LABEL_10:
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Initiating QuickSwitch to (cbuuid %@)",  buf,  0xCu);
    }

    if ((v13 & 1) == 0) {
      -[IDSQuickSwitchHelper _setIsQuickSwitchingToAnotherDevice:](self, "_setIsQuickSwitchingToAnotherDevice:", 1LL);
    }
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    uint64_t v18 = v17;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000DAC9C;
    v19[3] = &unk_1008F9A68;
    id v22 = v9;
    char v24 = v13;
    id v20 = v8;
    v21 = self;
    uint64_t v23 = v18;
    -[IDSQuickSwitchHelper _resetCommunicationStateBeforeQuickSwitchDeactivatePairedDevices:withCompletionBlock:]( self,  "_resetCommunicationStateBeforeQuickSwitchDeactivatePairedDevices:withCompletionBlock:",  v13 ^ 1,  v19);

    goto LABEL_15;
  }

  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "We're already switched to (cbuuid %@), ignoring request to switch...",  buf,  0xCu);
  }

  if (v9) {
    (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  }
LABEL_15:
}

- (void)resetCommunicationStateBeforeQuickSwitchWithCompletionBlock:(id)a3
{
}

- (void)_resetCommunicationStateBeforeQuickSwitchDeactivatePairedDevices:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog watchPairing](&OBJC_CLASS___IMRGLog, "watchPairing"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = @"NO";
    if (v4) {
      int v7 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Resetting communication before QuickSwitch {shouldDeactivatePairedDevices: %{public}@}",  buf,  0xCu);
  }

  uint64_t v10 = im_primary_queue(v8, v9);
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000DB198;
  v13[3] = &unk_1008F9A90;
  BOOL v15 = v4;
  id v14 = v5;
  id v12 = v5;
  dispatch_async(v11, v13);
}

@end