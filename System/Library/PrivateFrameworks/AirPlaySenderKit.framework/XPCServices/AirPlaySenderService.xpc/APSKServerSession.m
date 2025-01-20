@interface APSKServerSession
- (APSKServerSession)init;
- (int)sendAudioDataFromXPCParams:(id)a3;
- (int)sendFrameFromXPCParams:(id)a3;
- (int)setAuthStringFromXPCParams:(id)a3;
- (int)startWithXPCParams:(id)a3;
- (void)dealloc;
- (void)handleAuthRequired:(int)a3;
- (void)handleFailure:(int)a3;
- (void)handleStartCompletion:(int)a3;
- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5;
- (void)handleVideoStreamErrorNotification:(int)a3;
- (void)setObjectID:(unint64_t)a3 andConnection:(id)a4;
- (void)stop;
@end

@implementation APSKServerSession

- (APSKServerSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSKServerSession;
  v2 = -[APSKServerSession init](&v4, "init");
  if (v2)
  {
    v2->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (dword_100010248 <= 50
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
    {
      LogPrintF(&dword_100010248, "-[APSKServerSession init]", 33554482LL, "[%{ptr}] server session initialized", v2);
    }
  }

  return v2;
}

- (void)dealloc
{
  self->_lock = 0LL;
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF(&dword_100010248, "-[APSKServerSession dealloc]", 33554482LL, "[%{ptr}] server session deallocated", self);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___APSKServerSession;
  -[APSKServerSession dealloc](&v3, "dealloc");
}

- (void)stop
{
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF(&dword_100010248, "-[APSKServerSession stop]", 33554482LL, "[%{ptr}] server session stopped", self);
  }

  if (self->_senderNotifObserver)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self->_senderNotifObserver];

    senderNotifObserver = self->_senderNotifObserver;
    self->_senderNotifObserver = 0LL;
  }

  sender = self->_sender;
  if (sender)
  {
    sub_100006BF8((uint64_t)sender);
    v6 = self->_sender;
    if (v6)
    {
      CFRelease(v6);
      self->_sender = 0LL;
    }
  }

  FigSimpleMutexLock(self->_lock);
  connection = self->_connection;
  self->_connection = 0LL;
  self->_objectID = 0LL;

  FigSimpleMutexUnlock(self->_lock);
}

- (int)startWithXPCParams:(id)a3
{
  id v4 = a3;
  v48[0] = 0LL;
  int uint64 = xpc_dictionary_get_uint64(v4, off_1000102D0);
  string = xpc_dictionary_get_string(v4, off_1000102E0);
  CFTypeRef v47 = 0LL;
  int v7 = xpc_dictionary_get_uint64(v4, off_1000102C8);
  int v8 = xpc_dictionary_get_uint64(v4, off_1000102D8);
  objc_initWeak(&location, self);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100003F00;
  v44[3] = &unk_10000C980;
  objc_copyWeak(&v45, &location);
  v34 = objc_retainBlock(v44);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100003F3C;
  v42[3] = &unk_10000C980;
  objc_copyWeak(&v43, &location);
  v9 = objc_retainBlock(v42);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100003F78;
  v40[3] = &unk_10000C980;
  objc_copyWeak(&v41, &location);
  v10 = objc_retainBlock(v40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100003FB4;
  v38[3] = &unk_10000C9A8;
  objc_copyWeak(&v39, &location);
  v33 = objc_retainBlock(v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100004008;
  v36[3] = &unk_10000C9D0;
  objc_copyWeak(&v37, &location);
  v32 = objc_retainBlock(v36);
  uint64_t v11 = FigXPCMessageCopyCFObject(v4, off_1000102C0, &v47);
  uint64_t v12 = v11;
  if ((_DWORD)v11)
  {
    APSLogErrorAt(v11, "-[APSKServerSession startWithXPCParams:]", 107LL, 0LL);
    goto LABEL_47;
  }

  if (!v47)
  {
    uint64_t v30 = 108LL;
LABEL_35:
    uint64_t v12 = 4294960591LL;
    APSLogErrorAt(4294960591LL, "-[APSKServerSession startWithXPCParams:]", v30, 1LL);
    goto LABEL_47;
  }

  if (!uint64)
  {
    uint64_t v30 = 109LL;
    goto LABEL_35;
  }

  if (self->_sender)
  {
    uint64_t v12 = 4294960587LL;
    APSLogErrorAt(4294960587LL, "-[APSKServerSession startWithXPCParams:]", 110LL, 1LL);
    goto LABEL_47;
  }

  sender = (OpaqueAPMediaSender *)sub_100004F88();
  self->_sender = sender;
  if (!sender)
  {
    uint64_t v12 = 4294960534LL;
    APSLogErrorAt(4294960534LL, "-[APSKServerSession startWithXPCParams:]", 113LL, 1LL);
    goto LABEL_47;
  }

  if (dword_100010248 <= 50)
  {
    if (dword_100010248 != -1
      || (int v14 = _LogCategory_Initialize(&dword_100010248, 33554482LL), sender = self->_sender, v14))
    {
      LogPrintF( &dword_100010248,  "-[APSKServerSession startWithXPCParams:]",  33554482LL,  "[%{ptr}] remote session: using media sender %{ptr}",  self,  sender);
      sender = self->_sender;
    }
  }

  if (string)
  {
    uint64_t v15 = sub_100005A04( (uint64_t)sender,  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    uint64_t v12 = v15;
    if ((_DWORD)v15)
    {
      APSLogErrorAt(v15, "-[APSKServerSession startWithXPCParams:]", 118LL, 0LL);
      goto LABEL_47;
    }

    sender = self->_sender;
  }

  uint64_t v16 = sub_1000051A4((uint64_t)sender, (uint64_t)v34);
  uint64_t v12 = v16;
  if ((_DWORD)v16)
  {
    APSLogErrorAt(v16, "-[APSKServerSession startWithXPCParams:]", 122LL, 0LL);
    goto LABEL_47;
  }

  uint64_t v17 = sub_1000052C8((uint64_t)self->_sender, (uint64_t)v10);
  uint64_t v12 = v17;
  if ((_DWORD)v17)
  {
    APSLogErrorAt(v17, "-[APSKServerSession startWithXPCParams:]", 124LL, 0LL);
    goto LABEL_47;
  }

  size_t length = 0LL;
  data = xpc_dictionary_get_data(v4, off_100010308, &length);
  if (!data || length != 40)
  {
    uint64_t v12 = 4294960591LL;
    APSLogErrorAt(4294960591LL, "-[APSKServerSession startWithXPCParams:]", 129LL, 1LL);
    goto LABEL_47;
  }

  v19 = self->_sender;
  char v20 = xpc_dictionary_get_BOOL(v4, off_100010300);
  uint64_t v21 = sub_10000586C((uint64_t)v19, (uint64_t)data, v20);
  uint64_t v12 = v21;
  if ((_DWORD)v21)
  {
    APSLogErrorAt(v21, "-[APSKServerSession startWithXPCParams:]", 132LL, 0LL);
  }

  else
  {
LABEL_19:
    if ((uint64 & 1) == 0)
    {
LABEL_26:
      sub_100005B84((uint64_t)self->_sender, v47, v7, uint64, v8, (uint64_t)v9);
      LODWORD(v12) = 0;
      goto LABEL_27;
    }

    uint64_t v22 = FigXPCMessageCopyCFDictionary(v4, off_1000102F8, v48);
    uint64_t v12 = v22;
    if ((_DWORD)v22)
    {
      APSLogErrorAt(v22, "-[APSKServerSession startWithXPCParams:]", 136LL, 0LL);
    }

    else
    {
      uint64_t v23 = sub_1000056B8((uint64_t)self->_sender, v48[0]);
      uint64_t v12 = v23;
      if ((_DWORD)v23)
      {
        APSLogErrorAt(v23, "-[APSKServerSession startWithXPCParams:]", 138LL, 0LL);
      }

      else
      {
        uint64_t v24 = sub_1000053EC((uint64_t)self->_sender, (uint64_t)v33);
        uint64_t v12 = v24;
        if ((_DWORD)v24)
        {
          APSLogErrorAt(v24, "-[APSKServerSession startWithXPCParams:]", 141LL, 0LL);
        }

        else
        {
          if (!xpc_dictionary_get_BOOL(v4, off_1000102F0)
            || (v25 = sub_100005520((uint64_t)self->_sender), uint64_t v12 = v25, !(_DWORD)v25))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
            v27 = objc_claimAutoreleasedReturnValue( [v26 addObserverForName:@"APMediaSender_VideoStreamFailed" object:self->_sender queue:0 usingBlock:v32]);
            senderNotifObserver = self->_senderNotifObserver;
            self->_senderNotifObserver = v27;

            goto LABEL_26;
          }

          APSLogErrorAt(v25, "-[APSKServerSession startWithXPCParams:]", 145LL, 0LL);
        }
      }
    }
  }

- (int)setAuthStringFromXPCParams:(id)a3
{
  string = xpc_dictionary_get_string(a3, off_1000102E0);
  sender = self->_sender;
  if (!sender)
  {
    int v8 = -6709;
    uint64_t v7 = 4294960587LL;
    uint64_t v10 = 172LL;
    uint64_t v11 = 1LL;
LABEL_9:
    APSLogErrorAt(v7, "-[APSKServerSession setAuthStringFromXPCParams:]", v10, v11);
    return v8;
  }

  if (string) {
    v6 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string);
  }
  else {
    v6 = 0LL;
  }
  uint64_t v7 = sub_100005A04((uint64_t)sender, v6);
  int v8 = v7;
  if ((_DWORD)v7)
  {
    uint64_t v10 = 176LL;
    uint64_t v11 = 0LL;
    goto LABEL_9;
  }

  return v8;
}

- (int)sendFrameFromXPCParams:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v14 = 0LL;
  CFTypeRef cf = 0LL;
  if (self->_sender)
  {
    xpc_object_t value = xpc_dictionary_get_value(v4, off_1000102E8);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(value);
    int v8 = v7;
    if (v7)
    {
      uint64_t v9 = sub_100008DF0(v7, (CVPixelBufferRef *)&cf, &v14);
      if ((_DWORD)v9)
      {
        int v10 = v9;
        uint64_t v12 = 195LL;
      }

      else
      {
        uint64_t v9 = sub_100006D80((uint64_t)self->_sender, (uint64_t)cf, v14);
        int v10 = v9;
        if (!(_DWORD)v9) {
          goto LABEL_5;
        }
        uint64_t v12 = 198LL;
      }

      uint64_t v13 = 0LL;
    }

    else
    {
      int v10 = -6705;
      uint64_t v9 = 4294960591LL;
      uint64_t v12 = 192LL;
      uint64_t v13 = 1LL;
    }

    APSLogErrorAt(v9, "-[APSKServerSession sendFrameFromXPCParams:]", v12, v13);
  }

  else
  {
    int v10 = -6709;
    APSLogErrorAt(4294960587LL, "-[APSKServerSession sendFrameFromXPCParams:]", 189LL, 1LL);
    int v8 = 0LL;
  }

- (int)sendAudioDataFromXPCParams:(id)a3
{
  id v4 = a3;
  v5 = v4;
  __int128 v19 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  size_t length = 0LL;
  if (!self->_sender)
  {
    int v14 = -6709;
    APSLogErrorAt(4294960587LL, "-[APSKServerSession sendAudioDataFromXPCParams:]", 215LL, 1LL);
    goto LABEL_11;
  }

  data = (const UInt8 *)xpc_dictionary_get_data(v4, off_100010310, &length);
  if (data)
  {
    CFDataRef v7 = CFDataCreate(kCFAllocatorDefault, data, length);
    int CMTime = FigXPCMessageGetCMTime(v5, off_100010318, &v19);
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, off_100010320);
    BOOL v10 = xpc_dictionary_get_BOOL(v5, off_100010328);
    if (CMTime)
    {
      uint64_t v11 = sub_100006F14((uint64_t)self->_sender, (uint64_t)v7);
      goto LABEL_8;
    }

    char v12 = v10;
  }

  else
  {
    char v12 = 0;
    uint64_t uint64 = 0LL;
    CFDataRef v7 = 0LL;
  }

  sender = self->_sender;
  __int128 v16 = v19;
  CMTimeEpoch v17 = epoch;
  uint64_t v11 = sub_1000070A4((uint64_t)sender, (uint64_t)v7, &v16, uint64, v12);
LABEL_8:
  int v14 = v11;
  if ((_DWORD)v11)
  {
    APSLogErrorAt(v11, "-[APSKServerSession sendAudioDataFromXPCParams:]", 233LL, 0LL);
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  if (v7) {
LABEL_10:
  }
    CFRelease(v7);
LABEL_11:

  return v14;
}

- (void)setObjectID:(unint64_t)a3 andConnection:(id)a4
{
  v6 = (OS_xpc_object *)a4;
  FigSimpleMutexLock(self->_lock);
  connection = self->_connection;
  self->_connection = v6;
  self->_objectID = a3;
  int v8 = v6;

  FigSimpleMutexUnlock(self->_lock);
}

- (void)handleAuthRequired:(int)a3
{
  if (self->_objectID && self->_connection)
  {
    uint64_t v5 = FigXPCCreateBasicMessage(1919973220LL);
    id v6 = 0LL;
    CFDataRef v7 = v6;
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5, "-[APSKServerSession handleAuthRequired:]", 258LL, 0LL);
    }

    else
    {
      xpc_dictionary_set_uint64(v6, off_100010338, a3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }

  else
  {
    CFDataRef v7 = 0LL;
  }

  FigSimpleMutexUnlock(self->_lock);
  FigXPCRelease(v7);
}

- (void)handleStartCompletion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3)
  {
    if (dword_100010248 <= 90
      && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
    {
      LogPrintF( &dword_100010248,  "-[APSKServerSession handleStartCompletion:]",  33554522LL,  "[%{ptr}] server session start failed, error: %#m",  self,  v3);
    }
  }

  else if (dword_100010248 <= 50 {
         && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  }
  {
    LogPrintF( &dword_100010248,  "-[APSKServerSession handleStartCompletion:]",  33554482LL,  "[%{ptr}] server session started",  self);
  }

  FigSimpleMutexLock(self->_lock);
  if (self->_objectID && self->_connection)
  {
    uint64_t v5 = FigXPCCreateBasicMessage(1937006964LL);
    id v6 = 0LL;
    CFDataRef v7 = v6;
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5, "-[APSKServerSession handleStartCompletion:]", 283LL, 0LL);
    }

    else
    {
      xpc_dictionary_set_uint64(v6, off_100010330, (int)v3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }

  else
  {
    CFDataRef v7 = 0LL;
  }

  FigSimpleMutexUnlock(self->_lock);
  FigXPCRelease(v7);
}

- (void)handleFailure:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100010248 <= 100
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554532LL)))
  {
    LogPrintF( &dword_100010248,  "-[APSKServerSession handleFailure:]",  33554532LL,  "[%{ptr}] server session failed, error: %#m",  self,  v3);
  }

  FigSimpleMutexLock(self->_lock);
  if (self->_objectID && self->_connection)
  {
    uint64_t v5 = FigXPCCreateBasicMessage(1717660012LL);
    id v6 = 0LL;
    CFDataRef v7 = v6;
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5, "-[APSKServerSession handleFailure:]", 303LL, 0LL);
    }

    else
    {
      xpc_dictionary_set_uint64(v6, off_100010330, (int)v3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }

  else
  {
    CFDataRef v7 = 0LL;
  }

  FigSimpleMutexUnlock(self->_lock);
  FigXPCRelease(v7);
}

- (void)handleUpdatedDisplayWidth:(int)a3 height:(int)a4 refreshRate:(int)a5
{
  if (dword_100010248 <= 50
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554482LL)))
  {
    LogPrintF( &dword_100010248,  "-[APSKServerSession handleUpdatedDisplayWidth:height:refreshRate:]",  33554482LL,  "[%{ptr}] display info updated",  self);
  }

  FigSimpleMutexLock(self->_lock);
  if (self->_objectID && self->_connection)
  {
    uint64_t v9 = FigXPCCreateBasicMessage(1684632432LL);
    id v10 = 0LL;
    uint64_t v11 = v10;
    if ((_DWORD)v9)
    {
      APSLogErrorAt(v9, "-[APSKServerSession handleUpdatedDisplayWidth:height:refreshRate:]", 323LL, 0LL);
    }

    else
    {
      xpc_dictionary_set_uint64(v10, off_100010340, a3);
      xpc_dictionary_set_uint64(v11, off_100010348, a4);
      xpc_dictionary_set_uint64(v11, off_100010350, a5);
      xpc_connection_send_message(self->_connection, v11);
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  FigSimpleMutexUnlock(self->_lock);
  FigXPCRelease(v11);
}

- (void)handleVideoStreamErrorNotification:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100010248 <= 90
    && (dword_100010248 != -1 || _LogCategory_Initialize(&dword_100010248, 33554522LL)))
  {
    LogPrintF( &dword_100010248,  "-[APSKServerSession handleVideoStreamErrorNotification:]",  33554522LL,  "[%{ptr}] server session got video stream failure notification, error: %#m",  self,  v3);
  }

  FigSimpleMutexLock(self->_lock);
  if (self->_objectID && self->_connection)
  {
    uint64_t v5 = FigXPCCreateBasicMessage(1986359922LL);
    id v6 = 0LL;
    CFDataRef v7 = v6;
    if ((_DWORD)v5)
    {
      APSLogErrorAt(v5, "-[APSKServerSession handleVideoStreamErrorNotification:]", 345LL, 0LL);
    }

    else
    {
      xpc_dictionary_set_uint64(v6, off_100010330, (int)v3);
      xpc_connection_send_message(self->_connection, v7);
    }
  }

  else
  {
    CFDataRef v7 = 0LL;
  }

  FigSimpleMutexUnlock(self->_lock);
  FigXPCRelease(v7);
}

- (void).cxx_destruct
{
}

@end