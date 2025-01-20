@interface iAP2SessionHandler
- (BOOL)handleData:(char *)a3 length:(unsigned __int16)a4 forSession:(unsigned __int8)a5;
- (Transport)transport;
- (iAP2SessionHandler)initWithTransport:(id)a3;
- (void)beginFakeAuthentication;
- (void)requestFakeAuthenticationChallengeResponse;
- (void)sendFakeAuthenticationResponse;
- (void)sendIdentificationAccepted;
- (void)sendPowerUpdate;
- (void)sendStartIdentification;
- (void)sendUSBModeUpdate;
- (void)setTransport:(id)a3;
- (void)signalAuthenticationPassed;
@end

@implementation iAP2SessionHandler

- (iAP2SessionHandler)initWithTransport:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___iAP2SessionHandler;
  v5 = -[iAP2SessionHandler init](&v13, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
    messageParser = v5->_messageParser;
    v5->_messageParser = v6;

    objc_storeWeak((id *)&v5->_transport, v4);
    v8 = -[USBManager initWithTransport:](objc_alloc(&OBJC_CLASS___USBManager), "initWithTransport:", v4);
    USBManager = v5->_USBManager;
    v5->_USBManager = v8;

    v10 = -[PowerManager initWithTransport:](objc_alloc(&OBJC_CLASS___PowerManager), "initWithTransport:", v4);
    powerManager = v5->_powerManager;
    v5->_powerManager = v10;

    *(_WORD *)&v5->_shouldEnableUHPM = 0;
  }

  return v5;
}

- (BOOL)handleData:(char *)a3 length:(unsigned __int16)a4 forSession:(unsigned __int8)a5
{
  __int16 v26 = 0;
  uint64_t v6 = -[iAP2Message parseMsgBuffer::::](self->_messageParser, "parseMsgBuffer::::", 0LL, a3, a4, &v26);
  if ((_DWORD)v6 != 36)
  {
    if ((_DWORD)v6)
    {
      NSLog(@"   ### Message parsing failed. Error: %d", v6);
    }

    else
    {
      int v7 = -[iAP2Message getMsgID](self->_messageParser, "getMsgID");
      NSLog(@"### Received message ID: %2x", v7);
      if (v7 <= 43520)
      {
        if (v7 == 7425)
        {
          -[iAP2SessionHandler sendIdentificationAccepted](self, "sendIdentificationAccepted");
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2Message getGroupParams](self->_messageParser, "getGroupParams"));
          v11 = (void *)objc_claimAutoreleasedReturnValue([v19 getParamArray]);
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v23;
            do
            {
              for (i = 0LL; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
                if ([v16 getGrpParamID] == 7)
                {
                  int v21 = -1;
                  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 getParamDataAsNSData:&v21]);
                  __int16 v20 = 32257;
                  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v20,  1LL));
                  if (objc_msgSend(v17, "rangeOfData:options:range:", v18, 0, 0, objc_msgSend(v17, "length")) != (id)0x7FFFFFFFFFFFFFFFLL) {
                    -[iAP2SessionHandler sendUSBModeUpdate](self, "sendUSBModeUpdate");
                  }
                }

                else if ([v16 getGrpParamID] == 240)
                {
                  self->_shouldEnableUHPM = 1;
                  -[PowerManager enableUHPM](self->_powerManager, "enableUHPM");
                }
              }

              id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
            }

            while (v13);
          }
        }

        else if (v7 == 32256)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v9 addObserver:self selector:"sendUSBModeUpdate" name:@"NotificationUSBModeChanged" object:0];

          -[USBManager enableUSBHostMode](self->_USBManager, "enableUSBHostMode");
          if (self->_shouldEnableUHPM) {
            -[PowerManager enableUHPM](self->_powerManager, "enableUHPM");
          }
        }
      }

      else
      {
        switch(v7)
        {
          case 44544:
            self->_shouldSendPowerUpdates = 1;
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
            [v10 addObserver:self selector:"sendPowerUpdate" name:@"NotificationPowerModeChanged" object:0];

            -[iAP2SessionHandler sendPowerUpdate](self, "sendPowerUpdate");
            break;
          case 43523:
            -[iAP2SessionHandler sendFakeAuthenticationResponse](self, "sendFakeAuthenticationResponse");
            -[iAP2SessionHandler signalAuthenticationPassed](self, "signalAuthenticationPassed");
            -[iAP2SessionHandler sendStartIdentification](self, "sendStartIdentification");
            break;
          case 43521:
            -[iAP2SessionHandler requestFakeAuthenticationChallengeResponse]( self,  "requestFakeAuthenticationChallengeResponse");
            break;
        }
      }
    }

    -[iAP2Message reinit](self->_messageParser, "reinit");
  }

  return 0;
}

- (void)signalAuthenticationPassed
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  xpc_dictionary_set_uint64(xdict, "portID", (uint64_t)[v3 portID]);

  xpc_dictionary_set_string(xdict, "requestType", "handleAuthenticationPassed");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "xpc_connection"));
  [v5 sendSynchronousMessage:xdict withReply:0];
}

- (void)beginFakeAuthentication
{
  id v4 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v4, "setMsgID:", 43520LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v3 sendMessage:v4];
}

- (void)requestFakeAuthenticationChallengeResponse
{
  v3 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v3, "setMsgID:", 43522LL);
  int v7 = -1757313022;
  __int128 v6 = xmmword_1000160E8;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v6, 20LL));
  -[iAP2Message createParamWithIDAndNSData::](v3, "createParamWithIDAndNSData::", 0LL, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v5 sendMessage:v3];
}

- (void)sendFakeAuthenticationResponse
{
  id v4 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v4, "setMsgID:", 43525LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v3 sendMessage:v4];
}

- (void)sendStartIdentification
{
  id v4 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v4, "setMsgID:", 7424LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v3 sendMessage:v4];
}

- (void)sendIdentificationAccepted
{
  id v4 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v4, "setMsgID:", 7426LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v3 sendMessage:v4];
}

- (void)sendUSBModeUpdate
{
  id v4 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v4, "setMsgID:", 32257LL);
  -[iAP2Message createParamWithID:](v4, "createParamWithID:", -[USBManager getUSBMode](self->_USBManager, "getUSBMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v3 sendMessage:v4];
}

- (void)sendPowerUpdate
{
  id v4 = objc_alloc_init(&OBJC_CLASS___iAP2Message);
  -[iAP2Message setMsgID:](v4, "setMsgID:", 44545LL);
  -[iAP2Message createParamWithIDAndDataU8::]( v4,  "createParamWithIDAndDataU8::",  2LL,  -[PowerManager getPowerMode](self->_powerManager, "getPowerMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[iAP2SessionHandler transport](self, "transport"));
  [v3 sendMessage:v4];
}

- (Transport)transport
{
  return (Transport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end