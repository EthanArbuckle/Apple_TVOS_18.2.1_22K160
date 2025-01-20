@interface BTServicesXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BTAudioSession)audioSession;
- (BTServicesDaemon)daemon;
- (BTShareAudioSessionDaemon)shareAudioSession;
- (BTSmartRoutingDaemon)smartRoutingSession;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (void)_diagnosticControlShareAudioBanner;
- (void)audioRoutingRequest:(id)a3 responseHandler:(id)a4;
- (void)audioSessionActivate:(id)a3 completion:(id)a4;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticShow:(id)a3 completion:(id)a4;
- (void)setAudioSession:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setShareAudioSession:(id)a3;
- (void)setSmartRoutingSession:(id)a3;
- (void)setXpcCnx:(id)a3;
- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4;
- (void)shareAudioUserConfirmed:(BOOL)a3;
- (void)xpcConnectionInvalidated;
@end

@implementation BTServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.BluetoothServices"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100234918 <= 90
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 90LL)))
    {
      LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection _entitledAndReturnError:]",  90LL,  "### Missing entitlement: %#{pid}, '%@'",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.BluetoothServices");
    }

    if (a3)
    {
      uint64_t v8 = BTErrorF(4294896128LL, "Missing entitlement '%@'", @"com.apple.BluetoothServices");
      id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
      BOOL result = 0;
      *a3 = v9;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (void)xpcConnectionInvalidated
{
  v3 = self->_audioSession;
  if (v3)
  {
    if (dword_100234918 < 31
      && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
    {
      LogPrintF(&dword_100234918, "-[BTServicesXPCConnection xpcConnectionInvalidated]", 30LL, "Invalidate: %@", v3);
    }

    -[BTAudioSession invalidate](v3, "invalidate");
    audioSession = self->_audioSession;
    self->_audioSession = 0LL;
  }

  v5 = self->_shareAudioSession;
  v6 = v5;
  if (v5)
  {
    id v9 = v5;
    if (dword_100234918 < 31)
    {
      if (dword_100234918 != -1 || (int v7 = _LogCategory_Initialize(&dword_100234918, 30LL), v6 = v9, v7))
      {
        LogPrintF(&dword_100234918, "-[BTServicesXPCConnection xpcConnectionInvalidated]", 30LL, "Invalidate: %@", v6);
        v6 = v9;
      }
    }

    -[BTShareAudioSessionDaemon invalidate](v6, "invalidate");
    shareAudioSession = self->_shareAudioSession;
    self->_shareAudioSession = 0LL;

    v6 = v9;
  }
}

- (void)audioRoutingRequest:(id)a3 responseHandler:(id)a4
{
  id v12 = a3;
  v6 = (void (**)(id, id))a4;
  if (self->_smartRoutingSession
    || (int v7 = (BTSmartRoutingDaemon *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon")),  smartRoutingSession = self->_smartRoutingSession,  self->_smartRoutingSession = v7,  smartRoutingSession,  self->_smartRoutingSession))
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___BTAudioRoutingResponse);
    uint64_t v10 = NSErrorF(NSOSStatusErrorDomain, 4294960591LL, "### Smart Routing not supported on this platform");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v9 setError:v11];

    v6[2](v6, v9);
  }
}

- (void)audioSessionActivate:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection audioSessionActivate:completion:]",  30LL,  "Activate: %@",  v10);
  }
  objc_storeStrong((id *)&self->_audioSession, a3);
  if (!self->_smartRoutingSession)
  {
    uint64_t v8 = (BTSmartRoutingDaemon *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
    smartRoutingSession = self->_smartRoutingSession;
    self->_smartRoutingSession = v8;
  }
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_10008A900;
  v32 = sub_10008A910;
  id v33 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10008EC24;
  v25[3] = &unk_100206810;
  v27 = &v28;
  id v7 = a4;
  id v26 = v7;
  uint64_t v8 = objc_retainBlock(v25);
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection diagnosticControl:completion:]",  30LL,  "DiagnosticControl: %##@",  v6);
  }
  id v9 = (id *)(v29 + 5);
  id obj = (id)v29[5];
  unsigned __int8 v10 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9, obj);
  if ((v10 & 1) != 0)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"_input", TypeID, 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    v14 = v13;
    if (!v13)
    {
      id v23 = (id)BTErrorF(4294960591LL, "No input");
      goto LABEL_22;
    }

    if ([v13 caseInsensitiveCompare:@"FWCrashed"])
    {
      if ([v14 caseInsensitiveCompare:@"HIDLagDetected"])
      {
        if ([v14 caseInsensitiveCompare:@"IgnoreBTRestart"])
        {
          if (![v14 caseInsensitiveCompare:@"shNote"])
          {
            -[BTServicesXPCConnection _diagnosticControlShareAudioBanner](self, "_diagnosticControlShareAudioBanner");
LABEL_21:
            (*((void (**)(id, void *, void))v7 + 2))(v7, &__NSDictionary0__struct, 0LL);
LABEL_22:

            goto LABEL_23;
          }

          if ([v14 caseInsensitiveCompare:@"HIDIntervalUpdated"])
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[BTIdentityDaemon sharedBTIdentityDaemon]( &OBJC_CLASS___BTIdentityDaemon,  "sharedBTIdentityDaemon"));
            unsigned __int8 v16 = [v15 diagnosticControl:v6 completion:v7];

            if ((v16 & 1) == 0)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue( +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon]( &OBJC_CLASS___BTSmartRoutingDaemon,  "sharedBTSmartRoutingDaemon"));
              unsigned __int8 v18 = [v17 diagnosticControl:v6 completion:v7];

              if ((v18 & 1) == 0)
              {
                uint64_t v19 = BTErrorF(4294960582LL, "Unsupported control");
                uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
                v21 = (void *)v29[5];
                v29[5] = v20;
              }
            }

            goto LABEL_22;
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue( +[BTServicesDaemon sharedBTServicesDaemon]( &OBJC_CLASS___BTServicesDaemon,  "sharedBTServicesDaemon"));
          [v22 _showHIDIntervalBannerIfEnabled:v6];
        }

        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[BTServicesDaemon sharedBTServicesDaemon]( &OBJC_CLASS___BTServicesDaemon,  "sharedBTServicesDaemon"));
          [v22 setIgnoreBTRestart:1];
        }
      }

      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[BTServicesDaemon sharedBTServicesDaemon]( &OBJC_CLASS___BTServicesDaemon,  "sharedBTServicesDaemon"));
        [v22 _showHIDLagBannerIfEnabled:v6];
      }
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[BTServicesDaemon sharedBTServicesDaemon]( &OBJC_CLASS___BTServicesDaemon,  "sharedBTServicesDaemon"));
      [v22 showCrashBannerIfNeeded:v6];
    }

    goto LABEL_21;
  }

- (void)_diagnosticControlShareAudioBanner
{
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection _diagnosticControlShareAudioBanner]",  30LL,  "Diag: ShareAudio banner start");
  }
  v3 = objc_alloc_init(&OBJC_CLASS___CUUserNotificationSession);
  -[CUUserNotificationSession setBundleID:](v3, "setBundleID:", @"com.apple.ShareAudioNotifications");
  -[CUUserNotificationSession setCategoryID:](v3, "setCategoryID:", @"ShareAudioCategoryID");
  -[CUUserNotificationSession setDispatchQueue:](v3, "setDispatchQueue:", self->_dispatchQueue);
  -[CUUserNotificationSession setFlags:](v3, "setFlags:", 1LL);
  -[CUUserNotificationSession setTitleKey:](v3, "setTitleKey:", @"Apple TV");
  -[CUUserNotificationSession setBodyKey:](v3, "setBodyKey:", @"SHARE_AUDIO_BODY_FORMAT");
  -[CUUserNotificationSession setBodyArguments:](v3, "setBodyArguments:", &off_100219188);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008EE5C;
  v5[3] = &unk_100209110;
  v5[4] = v3;
  -[CUUserNotificationSession setActionHandler:](v3, "setActionHandler:", v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008EF10;
  v4[3] = &unk_100206058;
  v4[4] = v3;
  -[CUUserNotificationSession addActionWithIdentifier:title:flags:handler:]( v3,  "addActionWithIdentifier:title:flags:handler:",  @"ShareAudioActionIDConnect",  @"SHARE_AUDIO_BUTTON",  0LL,  v4);
  -[CUUserNotificationSession activate](v3, "activate");
}

- (void)diagnosticShow:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_10008A900;
  v25 = sub_10008A910;
  id v26 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10008F1F4;
  v18[3] = &unk_100206810;
  uint64_t v20 = &v21;
  id v7 = a4;
  id v19 = v7;
  uint64_t v8 = objc_retainBlock(v18);
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection diagnosticShow:completion:]",  30LL,  "DiagnosticShow: %.32@",  v6);
  }
  id v9 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  unsigned __int8 v10 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9, obj);
  if ((v10 & 1) != 0)
  {
    id v16 = 0LL;
    uint64_t v11 = CUDescriptionWithLevel(self->_daemon, 20LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    NSAppendPrintF(&v16, "%@", v12);
    v13 = (__CFString *)v16;

    if (v13) {
      v14 = v13;
    }
    else {
      v14 = @"None\n";
    }
    v27 = @"_output";
    uint64_t v28 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    (*((void (**)(id, void *, void))v7 + 2))(v7, v15, 0LL);
  }

  ((void (*)(void *))v8[2])(v8);

  _Block_object_dispose(&v21, 8);
}

- (void)shareAudioSessionActivate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_10008A900;
  v29 = sub_10008A910;
  id v30 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10008F578;
  v21[3] = &unk_100208858;
  v24 = &v25;
  id v8 = v6;
  id v22 = v8;
  id v9 = v7;
  id v23 = v9;
  unsigned __int8 v10 = objc_retainBlock(v21);
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL))) {
    LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection shareAudioSessionActivate:completion:]",  30LL,  "Activate: %@",  v8);
  }
  uint64_t v11 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  unsigned __int8 v12 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    if (self->_shareAudioSession)
    {
      uint64_t v17 = NSErrorF(NSOSStatusErrorDomain, 4294960575LL, "Session already active");
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
      v13 = (BTShareAudioSessionDaemon *)v26[5];
      v26[5] = v18;
    }

    else
    {
      v13 = objc_alloc_init(&OBJC_CLASS___BTShareAudioSessionDaemon);
      objc_storeStrong((id *)&self->_shareAudioSession, v13);
      dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
      dispatch_queue_t v16 = dispatch_queue_create("BTShareAudioSessionDaemon", v15);
      -[BTShareAudioSessionDaemon setDispatchQueue:](v13, "setDispatchQueue:", v16);

      -[BTShareAudioSessionDaemon setMode:](v13, "setMode:", [v8 mode]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10008F638;
      v19[3] = &unk_100209188;
      v19[4] = self;
      v19[5] = v13;
      -[BTShareAudioSessionDaemon setProgressHandler:](v13, "setProgressHandler:", v19);
      -[BTShareAudioSessionDaemon activate](v13, "activate");
      (*((void (**)(id, void))v9 + 2))(v9, 0LL);
    }
  }

  ((void (*)(void *))v10[2])(v10);

  _Block_object_dispose(&v25, 8);
}

- (void)shareAudioUserConfirmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = 0LL;
  dispatch_queue_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10008A900;
  id v19 = sub_10008A910;
  id v20 = 0LL;
  v5 = self->_shareAudioSession;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10008F914;
  v14[3] = &unk_100206B38;
  v14[4] = v5;
  v14[5] = &v15;
  id v6 = objc_retainBlock(v14);
  if (dword_100234918 <= 30 && (dword_100234918 != -1 || _LogCategory_Initialize(&dword_100234918, 30LL)))
  {
    id v7 = "no";
    if (v3) {
      id v7 = "yes";
    }
    LogPrintF( &dword_100234918,  "-[BTServicesXPCConnection shareAudioUserConfirmed:]",  30LL,  "UserConfirmed: permanent %s, %@",  v7,  v5);
  }

  id v8 = (id *)(v16 + 5);
  id obj = (id)v16[5];
  unsigned __int8 v9 = -[BTServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if ((v9 & 1) != 0)
  {
    if (v5)
    {
      -[BTShareAudioSessionDaemon userConfirmed:](v5, "userConfirmed:", v3);
    }

    else
    {
      uint64_t v10 = NSErrorF(NSOSStatusErrorDomain, 4294960575LL, "No session");
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      unsigned __int8 v12 = (void *)v16[5];
      v16[5] = v11;
    }
  }

  ((void (*)(void *))v6[2])(v6);

  _Block_object_dispose(&v15, 8);
}

- (BTAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (BTServicesDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (BTShareAudioSessionDaemon)shareAudioSession
{
  return self->_shareAudioSession;
}

- (void)setShareAudioSession:(id)a3
{
}

- (BTSmartRoutingDaemon)smartRoutingSession
{
  return self->_smartRoutingSession;
}

- (void)setSmartRoutingSession:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (void).cxx_destruct
{
}

@end