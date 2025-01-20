@interface RPSiriAudioXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPAudioInputPlugin)plugin;
- (RPSiriAudioSession)activatedSession;
- (RPSiriAudioXPCConnection)initWithPlugin:(id)a3 xpcCnx:(id)a4;
- (void)connectionInvalidated;
- (void)setDispatchQueue:(id)a3;
- (void)xpcSiriAudioReceived:(id)a3;
- (void)xpcSiriAudioSessionActivate:(id)a3 completion:(id)a4;
@end

@implementation RPSiriAudioXPCConnection

- (RPSiriAudioXPCConnection)initWithPlugin:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPSiriAudioXPCConnection;
  v9 = -[RPSiriAudioXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plugin, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  v6 = self->_activatedSession;
  activatedSession = self->_activatedSession;
  self->_activatedSession = 0LL;

  -[RPSiriAudioSession invalidate](v6, "invalidate");
  v4 = self->_inputDevice;
  inputDevice = self->_inputDevice;
  self->_inputDevice = 0LL;

  if (v4) {
    -[RPAudioInputPlugin removeInputDevice:](self->_plugin, "removeInputDevice:", v4);
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.siri-audio"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL))) {
      LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection _entitledAndReturnError:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.rapport.siri-audio");
    }
    if (a3)
    {
      uint64_t v8 = RPErrorF(4294896128LL, "Missing entitlement '%@'", @"com.apple.rapport.siri-audio");
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

- (void)xpcSiriAudioSessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v16 = 0LL;
  unsigned __int8 v9 = -[RPSiriAudioXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v16);
  id v10 = v16;
  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionID]);
    if (v11)
    {
      if (!self->_activatedSession)
      {
        if (dword_D090 <= 30 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 30LL))) {
          LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioSessionActivate:completion:]",  30LL,  "Activate audio session %@ from %#{pid}\n",  v11,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
        }
        [v7 setDispatchQueue:self->_dispatchQueue];
        objc_storeStrong((id *)&self->_activatedSession, a3);
        v14 = objc_alloc_init(&OBJC_CLASS___RPAudioInputDevice);
        inputDevice = self->_inputDevice;
        self->_inputDevice = v14;

        -[RPAudioInputDevice setDeviceIdentifier:](self->_inputDevice, "setDeviceIdentifier:", v11);
        -[RPAudioInputPlugin addInputDevice:](self->_plugin, "addInputDevice:", self->_inputDevice);
        if (v8) {
          v8[2](v8, v10);
        }
        goto LABEL_17;
      }

      if (v8)
      {
        uint64_t v12 = RPErrorF(4294960575LL, "Session already active");
LABEL_10:
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v8[2](v8, v13);
      }
    }

    else if (v8)
    {
      uint64_t v12 = RPErrorF(4294960588LL, "No session ID");
      goto LABEL_10;
    }

- (void)xpcSiriAudioReceived:(id)a3
{
  id v4 = a3;
  v5 = self->_audioFormat;
  if (!v5)
  {
    v33 = (AVAudioFormat *)objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice format](self->_inputDevice, "format"));
    if (!v33)
    {
      if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL))) {
        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Ignoring received audio when not active\n");
      }
      v5 = 0LL;
      goto LABEL_102;
    }

    v5 = v33;
    v34 = -[AVAudioFormat streamDescription](v33, "streamDescription");
    if (!v34)
    {
      if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL))) {
        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Audio format without ASBD?\n");
      }
      goto LABEL_102;
    }

    self->_framesPerPacket = v34->mFramesPerPacket;
  }

  CFTypeID TypeID = CFArrayGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v4, &off_8320, TypeID, &v47);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  unsigned __int8 v9 = v8;
  if (v8)
  {
    unint64_t v10 = (unint64_t)[v8 count];
    if (HIDWORD(v10))
    {
      if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL))) {
        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio too many packets: %llu\n");
      }
    }

    else
    {
      CFTypeID v11 = CFDataGetTypeID();
      uint64_t v12 = CFDictionaryGetTypedValue(v4, &off_8338, v11, &v47);
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v13)
      {
        unint64_t v15 = (unint64_t)[v13 length];
        if (HIDWORD(v15))
        {
          if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL))) {
            LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio too many bytes: %zu\n");
          }
        }

        else
        {
          id v16 = -[AVAudioCompressedBuffer initWithFormat:packetCapacity:maximumPacketSize:]( objc_alloc(&OBJC_CLASS___AVAudioCompressedBuffer),  "initWithFormat:packetCapacity:maximumPacketSize:",  v5,  v10,  v15);
          v17 = v16;
          if (v16)
          {
            if ((_DWORD)v15) {
              memcpy( -[AVAudioCompressedBuffer data](v16, "data"), [v14 bytes], v15);
            }
            unsigned int v42 = v15;
            -[AVAudioCompressedBuffer setByteLength:](v17, "setByteLength:", v15);
            v18 = -[AVAudioCompressedBuffer packetDescriptions](v17, "packetDescriptions");
            if (v18)
            {
              v19 = v18;
              v38 = v14;
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              __int128 v43 = 0u;
              __int128 v44 = 0u;
              id obj = v9;
              id v40 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v44;
                v37 = v17;
                while (2)
                {
                  for (i = 0LL; i != v40; i = (char *)i + 1)
                  {
                    if (*(void *)v44 != v41) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
                    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                    if ((objc_opt_isKindOfClass(v21, v22) & 1) == 0)
                    {
                      v17 = v37;
                      v14 = v38;
                      if (dword_D090 <= 90
                        && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
                      {
                        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio packet description not a dictionary\n");
                      }

                      goto LABEL_74;
                    }

                    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged(v21, &off_8350, 0LL, 0xFFFFFFFFLL, &v47);
                    unsigned int v24 = Int64Ranged;
                    if (v47 || (unsigned int v25 = v42 - Int64Ranged, v42 < Int64Ranged))
                    {
                      v17 = v37;
                      v14 = v38;
                      if (dword_D090 <= 90
                        && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
                      {
                        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio bad packet length: %u, %#m\n");
                      }

                      goto LABEL_74;
                    }

                    unsigned int v26 = CFDictionaryGetInt64Ranged(v21, &off_8368, 0LL, 0xFFFFFFFFLL, &v47);
                    if (v47 || v25 < v26)
                    {
                      v17 = v37;
                      v14 = v38;
                      if (dword_D090 <= 90
                        && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL)))
                      {
                        LogPrintF( &dword_D090,  "-[RPSiriAudioXPCConnection xpcSiriAudioReceived:]",  90LL,  "### Received audio bad start offset: %u, %#m\n");
                      }

- (RPSiriAudioSession)activatedSession
{
  return self->_activatedSession;
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

- (RPAudioInputPlugin)plugin
{
  return self->_plugin;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
}

@end