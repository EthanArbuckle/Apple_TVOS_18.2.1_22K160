@interface RPHIDDaemon
- (BOOL)_setupHIDGCDeviceWithOptions:(id)a3 andReturnError:(id *)a4;
- (BOOL)_setupHIDTouchDeviceAndReturnError:(id *)a3;
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMessageable)messenger;
- (void)_activateScreenSaverWithResponseHandler:(id)a3;
- (void)_handleCommand:(id)a3 responseHandler:(id)a4;
- (void)_handleGameControllerAuxEvent:(int64_t)a3 pressed:(int64_t)a4;
- (void)_handleGameControllerEvent:(id)a3;
- (void)_handleGameControllerStart:(id)a3 responseHandler:(id)a4;
- (void)_handleGameControllerStop:(id)a3 responseHandler:(id)a4;
- (void)_handleSelectWithButtonState:(int)a3;
- (void)_handleTouchEvent:(id)a3;
- (void)_handleTouchStart:(id)a3 responseHandler:(id)a4;
- (void)_handleTouchStop:(id)a3 responseHandler:(id)a4;
- (void)_injectKeyboardEventUsagePage:(unsigned int)a3 usageCode:(unsigned int)a4 buttonState:(int)a5;
- (void)_setupHIDGCSenderIDIfNeeded;
- (void)_setupHIDSenderIDIfNeeded;
- (void)_sleepSystemWithResponseHandler:(id)a3;
- (void)_wakeSystemWithResponseHandler:(id)a3;
- (void)invalidate;
- (void)setMessenger:(id)a3;
@end

@implementation RPHIDDaemon

- (BOOL)activateAndReturnError:(id *)a3
{
  v11 = self->_messenger;
  if (v11)
  {
    if (dword_100131A38 <= 30
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 30LL)))
    {
      LogPrintF(&dword_100131A38, "-[RPHIDDaemon activateAndReturnError:]", 30LL, "Activate\n");
    }

    self->_epochResetTicks = SecondsToUpTicks(3LL);
    if (self->_hidClient
      || (v15 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(0LL), (self->_hidClient = v15) != 0LL))
    {
      if (self->_hidGCClient
        || (v22 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(0LL), (self->_hidGCClient = v22) != 0LL))
      {
        v36 = @"statusFlags";
        v37 = &off_10011AEE0;
        BOOL v23 = 1;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_10004A920;
        v35[3] = &unk_100111BE8;
        v35[4] = self;
        -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_hidC",  v24,  v35);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_10004A92C;
        v34[3] = &unk_100111BE8;
        v34[4] = self;
        -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_touchStart",  v24,  v34);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_10004A938;
        v33[3] = &unk_100111BE8;
        v33[4] = self;
        -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_touchStop",  v24,  v33);
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_10004A944;
        v32[3] = &unk_100112B38;
        v32[4] = self;
        -[RPMessageable registerEventID:options:handler:]( v11,  "registerEventID:options:handler:",  @"_hidT",  v24,  v32);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_10004A950;
        v31[3] = &unk_100111BE8;
        v31[4] = self;
        -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_gcStart",  v24,  v31);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10004A95C;
        v30[3] = &unk_100111BE8;
        v30[4] = self;
        -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_gcStop",  v24,  v30);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_10004A968;
        v29[3] = &unk_100112B38;
        v29[4] = self;
        -[RPMessageable registerEventID:options:handler:]( v11,  "registerEventID:options:handler:",  @"_hidGC",  v24,  v29);

        goto LABEL_22;
      }

      v25 = "Create HID GC client failed";
    }

    else
    {
      v25 = "Create HID client failed";
    }

    id v26 = RPErrorF(4294960591LL, (uint64_t)v25, v16, v17, v18, v19, v20, v21, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v26);
    int v14 = dword_100131A38;
  }

  else
  {
    id v12 = RPErrorF(4294960591LL, (uint64_t)"No messenger provided", v5, v6, v7, v8, v9, v10, v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = dword_100131A38;
  }

  if (a3) {
    *a3 = v13;
  }

  BOOL v23 = 0;
LABEL_22:

  return v23;
}

- (void)invalidate
{
  messenger = self->_messenger;
  self->_messenger = 0LL;

  hidClient = self->_hidClient;
  if (hidClient)
  {
    CFRelease(hidClient);
    self->_hidClient = 0LL;
  }

  hidGCClient = self->_hidGCClient;
  if (hidGCClient)
  {
    CFRelease(hidGCClient);
    self->_hidGCClient = 0LL;
  }

- (void)_handleCommand:(id)a3 responseHandler:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v22, @"_hidC", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  uint64_t v14 = CFDictionaryGetInt64Ranged(v22, @"_hBtS", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
  if (dword_100131A38 <= 30 && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 30LL)))
  {
    else {
      v15 = (&off_100112BC8)[(int)Int64Ranged];
    }
    else {
      uint64_t v16 = (&off_100112C68)[(int)v14];
    }
    LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _handleCommand:responseHandler:]",  30LL,  "Command <%s>, Button %s, %##.16@\n",  v15,  v16,  v22);
  }

  switch((int)Int64Ranged)
  {
    case 1:
      uint64_t v17 = self;
      uint64_t v18 = 1LL;
      uint64_t v19 = 140LL;
      goto LABEL_36;
    case 2:
      uint64_t v17 = self;
      uint64_t v18 = 1LL;
      goto LABEL_33;
    case 3:
      uint64_t v17 = self;
      uint64_t v18 = 1LL;
      uint64_t v19 = 139LL;
      goto LABEL_36;
    case 4:
      uint64_t v17 = self;
      uint64_t v18 = 1LL;
      uint64_t v19 = 138LL;
      goto LABEL_36;
    case 5:
      uint64_t v17 = self;
      uint64_t v18 = 1LL;
      uint64_t v19 = 134LL;
      goto LABEL_36;
    case 6:
      -[RPHIDDaemon _handleSelectWithButtonState:](self, "_handleSelectWithButtonState:", v14);
      goto LABEL_37;
    case 7:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 96LL;
      goto LABEL_36;
    case 8:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 233LL;
      goto LABEL_36;
    case 9:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 234LL;
      goto LABEL_36;
    case 10:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 4LL;
      goto LABEL_36;
    case 11:
      -[RPHIDDaemon _activateScreenSaverWithResponseHandler:](self, "_activateScreenSaverWithResponseHandler:", v6);
      break;
    case 12:
      -[RPHIDDaemon _sleepSystemWithResponseHandler:](self, "_sleepSystemWithResponseHandler:", v6);
      break;
    case 13:
      -[RPHIDDaemon _wakeSystemWithResponseHandler:](self, "_wakeSystemWithResponseHandler:", v6);
      break;
    case 14:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 205LL;
      goto LABEL_36;
    case 15:
      uint64_t v17 = self;
      uint64_t v18 = 7LL;
      uint64_t v19 = 75LL;
      goto LABEL_36;
    case 16:
      uint64_t v17 = self;
      uint64_t v18 = 7LL;
      uint64_t v19 = 78LL;
      goto LABEL_36;
    case 17:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
LABEL_33:
      uint64_t v19 = 141LL;
      goto LABEL_36;
    case 18:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 226LL;
      goto LABEL_36;
    case 19:
      uint64_t v17 = self;
      uint64_t v18 = 12LL;
      uint64_t v19 = 48LL;
LABEL_36:
      -[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:]( v17,  "_injectKeyboardEventUsagePage:usageCode:buttonState:",  v18,  v19,  v14);
LABEL_37:
      (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0LL, 0LL);
      break;
    default:
      id v20 = RPErrorF(4294960582LL, (uint64_t)"Unsupported command: %d", v8, v9, v10, v11, v12, v13, Int64Ranged);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (dword_100131A38 <= 60
        && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 60LL)))
      {
        LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _handleCommand:responseHandler:]",  60LL,  "### HandleCommand failed: %{error}",  v21);
      }

      (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v21);

      break;
  }
}

- (void)_activateScreenSaverWithResponseHandler:(id)a3
{
  id v3 = a3;
  id v4 = [(Class)off_100131AA8[0]() sharedConnection];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemServiceProxy]);

  if (v6)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004AEEC;
    v16[3] = &unk_100112B60;
    id v17 = v3;
    [v6 activateScreenSaverWithReply:v16];
  }

  else
  {
    id v13 = RPErrorF(4294960596LL, (uint64_t)"Get systemServiceProxy failed", v7, v8, v9, v10, v11, v12, v15);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (dword_100131A38 <= 60
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 60LL)))
    {
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _activateScreenSaverWithResponseHandler:]",  60LL,  "### ActivateScreenSaver failed: %{error}",  v14);
    }

    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0LL, 0LL, v14);
  }
}

- (void)_injectKeyboardEventUsagePage:(unsigned int)a3 usageCode:(unsigned int)a4 buttonState:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (!self->_hidClient
    || (-[RPHIDDaemon _setupHIDSenderIDIfNeeded](self, "_setupHIDSenderIDIfNeeded"),
        uint64_t v9 = mach_absolute_time(),
        (uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent(0LL, v9, v7, v6, a5 < 2, 0LL)) == 0))
  {
LABEL_15:
    if (dword_100131A38 <= 60
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 60LL)))
    {
      else {
        BOOL v23 = (&off_100112C68)[a5];
      }
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:]",  60LL,  "### Inject usage page 0x%X, usage code 0x%X, buttonState %d (%s) failed: %#m\n",  v7,  v6,  a5,  v23);
    }

    return;
  }

  uint64_t v11 = (const void *)KeyboardEvent;
  unint64_t hidSenderID = self->_hidSenderID;
  if (hidSenderID) {
    IOHIDEventSetSenderID(KeyboardEvent, hidSenderID);
  }
  char v24 = 0;
  uint64_t TimeStamp = IOHIDEventGetTimeStamp(v11);
  uint64_t v14 = IOHIDEventCreateVendorDefinedEvent(0LL, TimeStamp, 65299LL, 16LL, 1LL, &v24, 0LL, 0LL);
  if (v14)
  {
    uint64_t v15 = (const void *)v14;
    IOHIDEventAppendEvent(v11, v14, 0LL);
    CFRelease(v15);
  }

  IOHIDEventSystemClientDispatchEvent(self->_hidClient, v11);
  CFRelease(v11);
  if (!a5)
  {
    uint64_t v16 = mach_absolute_time();
    uint64_t v17 = IOHIDEventCreateKeyboardEvent(0LL, v16, v7, v6, 0LL, 0LL);
    if (v17)
    {
      uint64_t v18 = (const void *)v17;
      unint64_t v19 = self->_hidSenderID;
      if (v19) {
        IOHIDEventSetSenderID(v17, v19);
      }
      uint64_t v20 = IOHIDEventGetTimeStamp(v18);
      uint64_t v21 = IOHIDEventCreateVendorDefinedEvent(0LL, v20, 65299LL, 16LL, 1LL, &v24, 0LL, 0LL);
      if (v21)
      {
        id v22 = (const void *)v21;
        IOHIDEventAppendEvent(v18, v21, 0LL);
        CFRelease(v22);
      }

      IOHIDEventSystemClientDispatchEvent(self->_hidClient, v18);
      CFRelease(v18);
      return;
    }

    goto LABEL_15;
  }

- (void)_sleepSystemWithResponseHandler:(id)a3
{
  id v17 = a3;
  id v3 = [(Class)off_100131AA8[0]() sharedConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 systemServiceProxy]);

  if (v5)
  {
    uint64_t v12 = off_100131AB0[0]();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v5 sleepSystemForReason:v13];

    (*((void (**)(id, void *, void, void))v17 + 2))(v17, &__NSDictionary0__struct, 0LL, 0LL);
  }

  else
  {
    id v14 = RPErrorF(4294960596LL, (uint64_t)"Get systemServiceProxy failed", v6, v7, v8, v9, v10, v11, v16);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100131A38 <= 60
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 60LL)))
    {
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _sleepSystemWithResponseHandler:]",  60LL,  "### SleepSystem failed: %{error}",  v15);
    }

    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0LL, 0LL, v15);
  }
}

- (void)_wakeSystemWithResponseHandler:(id)a3
{
  id v17 = a3;
  id v3 = [(Class)off_100131AA8[0]() sharedConnection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 systemServiceProxy]);

  if (v5)
  {
    id v12 = off_100131AB8();
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v5 wakeSystemForReason:v13];

    (*((void (**)(id, void *, void, void))v17 + 2))(v17, &__NSDictionary0__struct, 0LL, 0LL);
  }

  else
  {
    id v14 = RPErrorF(4294960596LL, (uint64_t)"Get systemServiceProxy failed", v6, v7, v8, v9, v10, v11, v16);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100131A38 <= 60
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 60LL)))
    {
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _wakeSystemWithResponseHandler:]",  60LL,  "### WakeSystem failed: %{error}",  v15);
    }

    (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0LL, 0LL, v15);
  }
}

- (void)_handleGameControllerStart:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v8 = 0LL;
  -[RPHIDDaemon _setupHIDGCDeviceWithOptions:andReturnError:]( self,  "_setupHIDGCDeviceWithOptions:andReturnError:",  a3,  &v8);
  id v7 = v8;
  if (v7)
  {
    if (dword_100131A38 <= 90
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
    {
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _handleGameControllerStart:responseHandler:]",  90LL,  "### Game Controller start failed: %{error}\n",  v7);
    }

    (*((void (**)(id, void, void, id))v6 + 2))(v6, 0LL, 0LL, v7);
  }

  else
  {
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0LL, 0LL);
  }
}

- (void)_handleGameControllerStop:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  hidGCDevice = self->_hidGCDevice;
  if (hidGCDevice)
  {
    CFRelease(hidGCDevice);
    self->_hidGCDevice = 0LL;
  }

  self->_hidGCSenderID = 0LL;
  self->_hidGCSenderIDInitialized = 0;
  (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0LL, 0LL);
}

- (void)_handleGameControllerAuxEvent:(int64_t)a3 pressed:(int64_t)a4
{
  uint64_t v7 = mach_absolute_time();
  uint64_t v8 = IOHIDEventCreate(0LL, 3LL, v7, 0LL);
  if (v8)
  {
    uint64_t v9 = (const void *)v8;
    IOHIDEventSetEventFlags(v8, 1LL);
    IOHIDEventSetIntegerValue(v9, 196608LL, 12LL);
    IOHIDEventSetIntegerValue(v9, 196609LL, a3);
    IOHIDEventSetIntegerValue(v9, 196610LL, a4);
    IOHIDEventSetIntegerValue(v9, 196612LL, 1LL);
    IOHIDEventSetSenderID(v9, self->_hidGCSenderID);
    IOHIDEventSystemClientDispatchEvent(self->_hidGCClient, v9);
    CFRelease(v9);
  }

  else if (dword_100131A38 <= 60 {
         && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 60LL)))
  }
  {
    LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _handleGameControllerAuxEvent:pressed:]",  60LL,  "### Inject Game Controller event failed: %#m\n",  4294960568LL);
  }

- (void)_handleGameControllerEvent:(id)a3
{
  id v4 = a3;
  id v30 = v4;
  if (!self->_hidGCClient) {
    goto LABEL_12;
  }
  if (!v4)
  {
    uint64_t v21 = 4294960559LL;
    goto LABEL_15;
  }

  -[RPHIDDaemon _setupHIDGCSenderIDIfNeeded](self, "_setupHIDGCSenderIDIfNeeded");
  if (self->_hidGCSenderID)
  {
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = IOHIDEventCreate(0LL, 35LL, v5, 0LL);
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      double Double = CFDictionaryGetDouble(v30, @"_gcDU", 0LL);
      double v24 = CFDictionaryGetDouble(v30, @"_gcDD", 0LL);
      double v23 = CFDictionaryGetDouble(v30, @"_gcDL", 0LL);
      double v22 = CFDictionaryGetDouble(v30, @"_gcDR", 0LL);
      double v29 = CFDictionaryGetDouble(v30, @"_gcLThx", 0LL);
      double v28 = CFDictionaryGetDouble(v30, @"_gcLThy", 0LL);
      int Int64Ranged = CFDictionaryGetInt64Ranged(v30, @"_gcLThB", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      double v27 = CFDictionaryGetDouble(v30, @"_gcRThx", 0LL);
      double v26 = CFDictionaryGetDouble(v30, @"_gcRThy", 0LL);
      int v9 = CFDictionaryGetInt64Ranged(v30, @"_gcRThB", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      double v10 = CFDictionaryGetDouble(v30, @"_gcBtA", 0LL);
      double v11 = CFDictionaryGetDouble(v30, @"_gcBtB", 0LL);
      double v12 = CFDictionaryGetDouble(v30, @"_gcBtX", 0LL);
      double v13 = CFDictionaryGetDouble(v30, @"_gcBtY", 0LL);
      double v14 = CFDictionaryGetDouble(v30, @"_gcL1", 0LL);
      double v15 = CFDictionaryGetDouble(v30, @"_gcL2", 0LL);
      double v16 = CFDictionaryGetDouble(v30, @"_gcR1", 0LL);
      double v17 = CFDictionaryGetDouble(v30, @"_gcR2", 0LL);
      IOHIDEventSetDoubleValue(v7, 2293761LL, Double);
      IOHIDEventSetDoubleValue(v7, 2293762LL, v24);
      IOHIDEventSetDoubleValue(v7, 2293763LL, v23);
      IOHIDEventSetDoubleValue(v7, 2293764LL, v22);
      IOHIDEventSetDoubleValue(v7, 2293767LL, v12);
      IOHIDEventSetDoubleValue(v7, 2293768LL, v13);
      IOHIDEventSetDoubleValue(v7, 2293765LL, v10);
      IOHIDEventSetDoubleValue(v7, 2293766LL, v11);
      IOHIDEventSetDoubleValue(v7, 2293769LL, v14);
      IOHIDEventSetDoubleValue(v7, 2293771LL, v15);
      IOHIDEventSetIntegerValue(v7, 2293777LL, Int64Ranged);
      IOHIDEventSetDoubleValue(v7, 2293770LL, v16);
      IOHIDEventSetDoubleValue(v7, 2293772LL, v17);
      IOHIDEventSetIntegerValue(v7, 2293778LL, v9);
      IOHIDEventSetDoubleValue(v7, 2293773LL, v29);
      IOHIDEventSetDoubleValue(v7, 2293774LL, v28);
      IOHIDEventSetDoubleValue(v7, 2293775LL, v27);
      IOHIDEventSetDoubleValue(v7, 2293776LL, v26);
      IOHIDEventSetIntegerValue(v7, 2293760LL, 0LL);
      IOHIDEventSetSenderID(v7, self->_hidGCSenderID);
      IOHIDEventSystemClientDispatchEvent(self->_hidGCClient, v7);
      CFRelease(v7);
      int v18 = CFDictionaryGetInt64Ranged(v30, @"_gcBtHome", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      int v19 = CFDictionaryGetInt64Ranged(v30, @"_gcBtMenu", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      int v20 = CFDictionaryGetInt64Ranged(v30, @"_gcBtOptions", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
      if ((v18 & 0xFFFFFF00) != 0) {
        -[RPHIDDaemon _handleGameControllerAuxEvent:pressed:]( self,  "_handleGameControllerAuxEvent:pressed:",  547LL,  v18 & 1);
      }
      if ((v19 & 0xFFFFFF00) != 0) {
        -[RPHIDDaemon _handleGameControllerAuxEvent:pressed:]( self,  "_handleGameControllerAuxEvent:pressed:",  516LL,  v19 & 1);
      }
      if ((v20 & 0xFFFFFF00) != 0) {
        -[RPHIDDaemon _handleGameControllerAuxEvent:pressed:]( self,  "_handleGameControllerAuxEvent:pressed:",  521LL,  v20 & 1);
      }
      goto LABEL_11;
    }

    uint64_t v21 = 4294960568LL;
  }

  else
  {
LABEL_12:
    uint64_t v21 = 4294960551LL;
  }

- (BOOL)_setupHIDGCDeviceWithOptions:(id)a3 andReturnError:(id *)a4
{
  if (self->_hidGCDevice) {
    return 1;
  }
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v30 = xmmword_10010A24D;
  v31[0] = unk_10010A25D;
  *(_OWORD *)((char *)v31 + 9) = unk_10010A266;
  __int128 v26 = xmmword_10010A20D;
  __int128 v27 = unk_10010A21D;
  __int128 v28 = xmmword_10010A22D;
  __int128 v29 = unk_10010A23D;
  __int128 v24 = xmmword_10010A1ED;
  __int128 v25 = unk_10010A1FD;
  uint64_t v8 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v24, 137LL);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, @"ReportDescriptor");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_10011AEF8,  @"VendorID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_10011AF10,  @"ProductID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  @"Rapport",  @"Transport");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"DisplayIntegrated");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"Authenticated");
  int v9 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v9, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v10,  @"PhysicalDeviceUniqueID");

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  @"Generic Extended Controller",  @"Product");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_10011AF28,  @"DeviceUsagePage");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  &off_10011AF40,  @"DeviceUsage");
  double v11 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate(0LL, v7);
  self->_hidGCDevice = v11;
  BOOL v4 = v11 != 0LL;
  if (v11)
  {
    int v19 = v11;
    uint64_t v20 = CUMainQueue( v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v24,  *((void *)&v24 + 1),  v25,  *((void *)&v25 + 1),  v26,  *((void *)&v26 + 1),  v27,  *((void *)&v27 + 1),  v28,  *((void *)&v28 + 1));
    uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
    IOHIDUserDeviceSetDispatchQueue(v19, v21);

    IOHIDUserDeviceActivate(self->_hidGCDevice);
  }

  else if (a4)
  {
    id v23 = RPErrorF(4294960596LL, (uint64_t)"IOHIDUserDeviceCreate failed", v13, v14, v15, v16, v17, v18, v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v23);
  }

  return v4;
}

- (void)_setupHIDGCSenderIDIfNeeded
{
  if (!self->_hidGCSenderIDInitialized)
  {
    hidGCDevice = self->_hidGCDevice;
    if (hidGCDevice)
    {
      self->_hidGCSenderID = 0LL;
      io_registry_entry_t v4 = IOHIDUserDeviceCopyService(hidGCDevice, a2);
      if (v4)
      {
        io_object_t v5 = v4;
        io_registry_entry_t child = 0;
        uint64_t ChildEntry = IORegistryEntryGetChildEntry(v4, "IOService", &child);
        IOObjectRelease(v5);
        if ((_DWORD)ChildEntry)
        {
          if (dword_100131A38 <= 90
            && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
          {
            LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]",  90LL,  "### Get HID child 1 failed: %#m\n",  ChildEntry);
          }
        }

        else
        {
          io_registry_entry_t entry = 0;
          uint64_t v7 = IORegistryEntryGetChildEntry(child, "IOService", &entry);
          IOObjectRelease(child);
          if ((_DWORD)v7)
          {
            if (dword_100131A38 <= 90
              && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
            {
              LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]",  90LL,  "### Get HID child 2 failed: %#m\n",  v7);
            }
          }

          else
          {
            uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, &self->_hidGCSenderID);
            self->_hidGCSenderIDInitialized = 1;
            IOObjectRelease(entry);
            if ((_DWORD)RegistryEntryID
              && dword_100131A38 <= 90
              && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
            {
              LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]",  90LL,  "### Get HID GC sender ID failed: %#m\n",  RegistryEntryID);
            }
          }
        }
      }

      else if (dword_100131A38 <= 90 {
             && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
      }
      {
        LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDGCSenderIDIfNeeded]",  90LL,  "### IOHIDUserDeviceCopyService failed\n");
      }
    }
  }

- (void)_handleTouchStart:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = 0LL;
  -[RPHIDDaemon _setupHIDTouchDeviceAndReturnError:](self, "_setupHIDTouchDeviceAndReturnError:", &v10);
  id v8 = v10;
  if (v8)
  {
    if (dword_100131A38 <= 90
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
    {
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _handleTouchStart:responseHandler:]",  90LL,  "### Touch start failed: %{error}\n",  v8);
    }

    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v8);
  }

  else
  {
    double v11 = @"_i";
    uint64_t v12 = &off_10011AF28;
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0LL, 0LL);
  }
}

- (void)_handleTouchStop:(id)a3 responseHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  activeTouchEventMap = self->_activeTouchEventMap;
  self->_activeTouchEventMap = 0LL;

  self->_lastEventTicks = 0LL;
  self->_epochNanos = 0LL;
  self->_epochTicks = 0LL;
  hidTouchDevice = self->_hidTouchDevice;
  if (hidTouchDevice)
  {
    CFRelease(hidTouchDevice);
    self->_hidTouchDevice = 0LL;
  }

  self->_unint64_t hidSenderID = 0LL;
  self->_hidSenderIDInitialized = 0;
  (*((void (**)(id, void *, void, void))v6 + 2))(v6, &__NSDictionary0__struct, 0LL, 0LL);
}

- (void)_handleTouchEvent:(id)a3
{
  id v4 = a3;
  if (self->_hidTouchDevice) {
    goto LABEL_8;
  }
  id v36 = 0LL;
  -[RPHIDDaemon _setupHIDTouchDeviceAndReturnError:](self, "_setupHIDTouchDeviceAndReturnError:", &v36);
  io_object_t v5 = (_UNKNOWN **)v36;
  id v6 = v5;
  if (self->_hidTouchDevice)
  {

LABEL_8:
    uint64_t v7 = mach_absolute_time();
    uint64_t NSNumber = NSDictionaryGetNSNumber(v4, @"_tFg", 0LL);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(NSNumber);
    id v10 = (void *)v9;
    double v11 = &off_10011AF58;
    if (v9) {
      double v11 = (_UNKNOWN **)v9;
    }
    id v6 = v11;

    unsigned int v32 = [v6 intValue];
    int Int64Ranged = CFDictionaryGetInt64Ranged(v4, @"_tPh", 0xFFFFFFFF80000000LL, 0x7FFFFFFFLL, 0LL);
    __int16 v33 = CFDictionaryGetInt64Ranged(v4, @"_cx", 0LL, 0xFFFFLL, 0LL);
    __int16 v34 = CFDictionaryGetInt64Ranged(v4, @"_cy", 0LL, 0xFFFFLL, 0LL);
    unint64_t Int64 = CFDictionaryGetInt64(v4, @"_ns", 0LL);
    if (!self->_activeTouchEventMap)
    {
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      activeTouchEventMap = self->_activeTouchEventMap;
      self->_activeTouchEventMap = v13;
    }

    uint64_t v15 = -[NSValue initWithBytes:objCType:]( objc_alloc(&OBJC_CLASS___NSValue),  "initWithBytes:objCType:",  &v32,  "{?=iSSiB}");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activeTouchEventMap,  "setObject:forKeyedSubscript:",  v15,  v6);

    if (v7 - self->_lastEventTicks >= self->_epochResetTicks)
    {
      self->_epochNanos = Int64;
      self->_unint64_t epochTicks = v7;
      uint64_t v17 = v7;
    }

    else
    {
      unint64_t epochTicks = self->_epochTicks;
      uint64_t v17 = NanosecondsToUpTicks(Int64 - self->_epochNanos) + epochTicks;
    }

    self->_lastEventTicks = v7;
    uint64_t v27 = 0LL;
    __int128 v28 = (const uint8_t *)&v27;
    uint64_t v29 = 0x3010000000LL;
    __int128 v30 = &unk_1000EF05A;
    v31[0] = 0LL;
    *(void *)((char *)v31 + 5) = 0LL;
    v25[0] = 0LL;
    v25[1] = v25;
    v25[2] = 0x2020000000LL;
    char v26 = 0;
    uint64_t v18 = self->_activeTouchEventMap;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004C6F8;
    v24[3] = &unk_100112B88;
    v24[4] = &v27;
    v24[5] = v25;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v24);
    int v19 = Int64Ranged;
    uint64_t v20 = v28;
    *((_BYTE *)v28 + 44) = Int64Ranged == 5;
    if ((v19 - 1) >= 3)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activeTouchEventMap,  "setObject:forKeyedSubscript:",  0LL,  v6);
      uint64_t v20 = v28;
    }

    uint64_t v21 = IOHIDUserDeviceHandleReportWithTimeStamp(self->_hidTouchDevice, v17, v20 + 32, 13LL);
    if ((_DWORD)v21
      && dword_100131A38 <= 90
      && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
    {
      LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _handleTouchEvent:]",  90LL,  "### Touch event report failed: %#m\n",  v21);
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
    goto LABEL_27;
  }

  if (dword_100131A38 <= 90 && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
  {
    uint64_t v22 = CUPrintNSError(v6);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    LogPrintF(&dword_100131A38, "-[RPHIDDaemon _handleTouchEvent:]", 90LL, "### Re-start touch device failed: %@", v23);
  }

- (void)_handleSelectWithButtonState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = UpTicksToMilliseconds(v5);
  if (v3 < 2)
  {
    uint64_t v7 = mach_absolute_time();
    self->_lastSelectButtonDown = UpTicksToMilliseconds(v7);
LABEL_4:
    -[RPHIDDaemon _injectKeyboardEventUsagePage:usageCode:buttonState:]( self,  "_injectKeyboardEventUsagePage:usageCode:buttonState:",  12LL,  128LL,  v3);
    return;
  }

  if (v6 - self->_lastSelectButtonDown > 0x14) {
    goto LABEL_4;
  }
  dispatch_time_t v8 = dispatch_time(0LL, 20000000LL);
  uint64_t v16 = CUMainQueue(v8, v9, v10, v11, v12, v13, v14, v15, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  uint64_t v20 = sub_10004C884;
  uint64_t v21 = &unk_100111878;
  uint64_t v22 = self;
  LODWORD(v23) = v3;
  dispatch_after(v8, v17, &v18);
}

- (BOOL)_setupHIDTouchDeviceAndReturnError:(id *)a3
{
  if (self->_hidTouchDevice) {
    return 1;
  }
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &off_10011AF70,  @"VendorID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &off_10011AF88,  @"ProductID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  &__kCFBooleanFalse,  @"DisplayIntegrated");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  @"Rapport",  @"Transport");
  *(_OWORD *)uint64_t v18 = xmmword_10010A296;
  *(_OWORD *)&v18[16] = unk_10010A2A6;
  __int128 v21 = xmmword_10010A2D6;
  __int128 v22 = unk_10010A2E6;
  __int128 v23 = xmmword_10010A2F6;
  __int128 v19 = xmmword_10010A2B6;
  __int128 v20 = unk_10010A2C6;
  v17[0] = xmmword_10010A276;
  v17[1] = unk_10010A286;
  int v24 = -1073638137;
  *(_WORD *)&v18[15] = 1000;
  HIWORD(v21) = 1000;
  *(_WORD *)&v18[28] = 1000;
  *(_WORD *)((char *)&v22 + 11) = 1000;
  uint64_t v7 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v17, 148LL);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, @"ReportDescriptor");

  dispatch_time_t v8 = (__IOHIDUserDevice *)IOHIDUserDeviceCreate(0LL, v6);
  self->_hidTouchDevice = v8;
  BOOL v3 = v8 != 0LL;
  if (!v8 && a3)
  {
    id v16 = RPErrorF( 4294960596LL,  (uint64_t)"IOHIDUserDeviceCreate failed",  v9,  v10,  v11,  v12,  v13,  v14,  *(uint64_t *)&v17[0]);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  return v3;
}

- (void)_setupHIDSenderIDIfNeeded
{
  if (!self->_hidSenderIDInitialized)
  {
    hidTouchDevice = self->_hidTouchDevice;
    if (hidTouchDevice)
    {
      self->_unint64_t hidSenderID = 0LL;
      p_unint64_t hidSenderID = &self->_hidSenderID;
      *((_BYTE *)p_hidSenderID + 8) = 1;
      io_registry_entry_t v5 = IOHIDUserDeviceCopyService(hidTouchDevice, a2);
      if (v5)
      {
        io_object_t v6 = v5;
        io_registry_entry_t child = 0;
        uint64_t ChildEntry = IORegistryEntryGetChildEntry(v5, "IOService", &child);
        IOObjectRelease(v6);
        if ((_DWORD)ChildEntry)
        {
          if (dword_100131A38 <= 90
            && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
          {
            LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]",  90LL,  "### Get HID child 1 failed: %#m\n",  ChildEntry);
          }
        }

        else
        {
          io_registry_entry_t entry = 0;
          uint64_t v8 = IORegistryEntryGetChildEntry(child, "IOService", &entry);
          IOObjectRelease(child);
          if ((_DWORD)v8)
          {
            if (dword_100131A38 <= 90
              && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
            {
              LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]",  90LL,  "### Get HID child 2 failed: %#m\n",  v8);
            }
          }

          else
          {
            uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, p_hidSenderID);
            IOObjectRelease(entry);
            if ((_DWORD)RegistryEntryID
              && dword_100131A38 <= 90
              && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
            {
              LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]",  90LL,  "### Get HID touch sender ID failed: %#m\n",  RegistryEntryID);
            }
          }
        }
      }

      else if (dword_100131A38 <= 90 {
             && (dword_100131A38 != -1 || _LogCategory_Initialize(&dword_100131A38, 90LL)))
      }
      {
        LogPrintF( &dword_100131A38,  "-[RPHIDDaemon _setupHIDSenderIDIfNeeded]",  90LL,  "### IOHIDUserDeviceCopyService failed\n");
      }
    }
  }

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end