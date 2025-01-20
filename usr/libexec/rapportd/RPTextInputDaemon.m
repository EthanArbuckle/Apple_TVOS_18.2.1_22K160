@interface RPTextInputDaemon
- (BOOL)activateAndReturnError:(id *)a3;
- (RPMessageable)messenger;
- (RPTextInputDaemon)init;
- (void)_handleSessionStart:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleSessionStop:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_handleTextInputChange:(id)a3 options:(id)a4;
- (void)_sendTextInputPayloadEvent:(id)a3 rtiPayload:(id)a4;
- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4;
- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5;
- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4;
- (void)invalidate;
- (void)setMessenger:(id)a3;
@end

@implementation RPTextInputDaemon

- (RPTextInputDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPTextInputDaemon;
  v2 = -[RPTextInputDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = v3;
  }

  return v3;
}

- (BOOL)activateAndReturnError:(id *)a3
{
  v11 = self->_messenger;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue"));
    if (v12) {
      objc_storeStrong((id *)&self->_dispatchQueue, v12);
    }

    if (!self->_rtiService)
    {
      id v13 = objc_alloc(off_100132FA0());
      id v14 = off_100132FA8();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (RTIInputSystemService *)[v13 initWithMachName:v15];
      rtiService = self->_rtiService;
      self->_rtiService = v16;

      -[RTIInputSystemService setDelegate:](self->_rtiService, "setDelegate:", self);
    }

    v26 = @"statusFlags";
    v27 = &off_10011B0F0;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000AD974;
    v25[3] = &unk_100111BE8;
    v25[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_tiStart",  v18,  v25);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000AD988;
    v24[3] = &unk_100111BE8;
    v24[4] = self;
    -[RPMessageable registerRequestID:options:handler:]( v11,  "registerRequestID:options:handler:",  @"_tiStop",  v18,  v24);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000AD99C;
    v23[3] = &unk_100112B38;
    v23[4] = self;
    -[RPMessageable registerEventID:options:handler:](v11, "registerEventID:options:handler:", @"_tiC", v18, v23);
  }

  else
  {
    id v19 = RPErrorF(4294960591LL, (uint64_t)"No messenger provided", v5, v6, v7, v8, v9, v10, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (dword_100132F30 <= 90
      && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 90LL)))
    {
      LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon activateAndReturnError:]",  90LL,  "### Activate failed: %{error}\n",  v20);
    }

    if (a3) {
      *a3 = v20;
    }
  }

  return v11 != 0LL;
}

- (void)invalidate
{
  messenger = self->_messenger;
  self->_messenger = 0LL;

  -[RTIInputSystemService setDelegate:](self->_rtiService, "setDelegate:", 0LL);
  rtiService = self->_rtiService;
  self->_rtiService = 0LL;

  rtiSession = self->_rtiSession;
  self->_rtiSession = 0LL;

  sessionPeerIDs = self->_sessionPeerIDs;
  self->_sessionPeerIDs = 0LL;
}

- (void)_handleSessionStart:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v9, @"senderID", TypeID, 0LL);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(TypedValue);

  if (v12) {
    id v13 = (__CFString *)v12;
  }
  else {
    id v13 = @"?";
  }
  sessionPeerIDs = self->_sessionPeerIDs;
  if (!sessionPeerIDs)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v16 = self->_sessionPeerIDs;
    self->_sessionPeerIDs = v15;

    sessionPeerIDs = self->_sessionPeerIDs;
  }

  -[NSMutableSet addObject:](sessionPeerIDs, "addObject:", v13);
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemServiceSession currentDataPayload](self->_rtiSession, "currentDataPayload"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v18 version]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v20, @"_tiV");
  }

  if (v19) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, @"_tiD");
  }
  if (dword_100132F30 <= 30 && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 30LL))) {
    LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleSessionStart:options:responseHandler:]",  30,  "TextInput start: ID '%@', Request %##.16@, Response %##.16@ (%d bytes)\n",  v13,  v21,  v17,  [v19 length]);
  }
  (*((void (**)(id, NSMutableDictionary *, void, void))v8 + 2))(v8, v17, 0LL, 0LL);
}

- (void)_handleSessionStop:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  id v9 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v9, @"senderID", TypeID, 0LL);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(TypedValue);

  if (v12) {
    id v13 = (__CFString *)v12;
  }
  else {
    id v13 = @"?";
  }
  -[NSMutableSet removeObject:](self->_sessionPeerIDs, "removeObject:", v13);
  if (dword_100132F30 <= 30 && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 30LL))) {
    LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleSessionStop:options:responseHandler:]",  30LL,  "TextInput stop: ID '%@', %##.16@\n",  v13,  v14);
  }
  (*((void (**)(id, void *, void, void))v8 + 2))(v8, &__NSDictionary0__struct, 0LL, 0LL);
}

- (void)_handleTextInputChange:(id)a3 options:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v6, @"senderID", TypeID, 0LL);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(TypedValue);

  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = @"?";
  }
  if ((-[NSMutableSet containsObject:](self->_sessionPeerIDs, "containsObject:", v10) & 1) != 0)
  {
    v11 = self->_rtiSession;
    if (v11)
    {
      CFTypeID v12 = CFDataGetTypeID();
      uint64_t v13 = CFDictionaryGetTypedValue(v18, @"_tiD", v12, 0LL);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v14)
      {
        unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v18, @"_tiV", 0LL, 0xFFFFFFFFLL, 0LL);
        id v16 = -[objc_class payloadWithData:version:](off_100132FB0(), "payloadWithData:version:", v14, Int64Ranged);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          if (dword_100132F30 <= 20
            && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 20LL)))
          {
            LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleTextInputChange:options:]",  20,  "RTI Change remote: %d bytes\n",  [v14 length]);
          }

          -[RTIInputSystemServiceSession handleTextActionPayload:](v11, "handleTextActionPayload:", v17);
        }

        else if (dword_100132F30 <= 60 {
               && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 60LL)))
        }
        {
          LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleTextInputChange:options:]",  60LL,  "### TextInput change bad data: ID '%@'\n",  v10);
        }
      }

      else if (dword_100132F30 <= 60 {
             && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 60LL)))
      }
      {
        LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleTextInputChange:options:]",  60LL,  "### TextInput change no data: ID '%@'\n",  v10);
      }
    }

    else if (dword_100132F30 <= 60 {
           && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 60LL)))
    }
    {
      LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleTextInputChange:options:]",  60LL,  "### TextInput change ignoring without session: ID '%@'\n",  v10,  v18);
    }
  }

  else if (dword_100132F30 <= 60 {
         && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 60LL)))
  }
  {
    LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _handleTextInputChange:options:]",  60LL,  "### TextInput change ignoring unknown sender: ID '%@'\n",  v10,  v18);
  }
}

- (void)_sendTextInputPayloadEvent:(id)a3 rtiPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);
  if (v7)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v7 version]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, @"_tiV");
  }

  if (v9) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, @"_tiD");
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  obj = self->_sessionPeerIDs;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        if (dword_100132F30 <= 10
          && (dword_100132F30 != -1 || _LogCategory_Initialize(&dword_100132F30, 10LL)))
        {
          LogPrintF( &dword_100132F30,  "-[RPTextInputDaemon _sendTextInputPayloadEvent:rtiPayload:]",  10,  "RTI event: '%@', %@, %d bytes\n",  v6,  v15,  [v9 length]);
        }

        messenger = self->_messenger;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_1000AE2AC;
        v18[3] = &unk_1001118A0;
        v18[4] = v15;
        -[RPMessageable sendEventID:event:destinationID:options:completion:]( messenger,  "sendEventID:event:destinationID:options:completion:",  v6,  v8,  v15,  0LL,  v18);
      }

      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v12);
  }
}

- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AE398;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)inputSystemService:(id)a3 inputSessionDidBegin:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000AE480;
  v8[3] = &unk_100111968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)inputSystemService:(id)a3 inputSessionDidEnd:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AE6C8;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)inputSystemService:(id)a3 inputSessionDidDie:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AE7C4;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)inputSystemService:(id)a3 inputSessionDocumentDidChange:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000AE8E4;
  v8[3] = &unk_100111968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)inputSystemService:(id)a3 inputSessionDidPause:(id)a4 withReason:(id)a5
{
  id v6 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000AEA3C;
  v9[3] = &unk_100111968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, v9);
}

- (void)inputSystemService:(id)a3 inputSessionDidUnpause:(id)a4 withReason:(id)a5
{
  id v6 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000AEB40;
  v9[3] = &unk_100111968;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, v9);
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