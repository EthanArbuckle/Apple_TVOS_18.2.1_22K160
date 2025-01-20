@interface AXTVBrailleManager
- (AXTVBrailleManager)init;
- (NSString)primaryDeviceAddress;
- (SCROBrailleClient)brailleClient;
- (id)_cachedPrimaryDeviceAddress;
- (void)_handleBrailleConfigurationChanged;
- (void)connectToBrailleServer;
- (void)disconnectFromBrailleServer;
- (void)handleBrailleConfigurationChanged:(id)a3;
- (void)handleBrailleDidDisconnect:(id)a3;
- (void)handleBrailleDidDisplay:(id)a3;
- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5;
- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5;
- (void)handleBrailleDidReconnect:(id)a3;
- (void)handleBrailleDidShowNextAnnouncement:(id)a3;
- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3;
- (void)handleBrailleKeyMemorize:(id)a3;
- (void)handleBrailleKeyWillMemorize:(id)a3;
- (void)handleBrailleKeypress:(id)a3;
- (void)handleBraillePlayBorderHitSound;
- (void)handleBraillePlayCommandNotSupportedSound;
- (void)handleBraillePlayDisplayConnectionSound:(id)a3;
- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4;
- (void)handleBrailleTableFailedToLoad:(id)a3;
- (void)handleDisplayModeChanged:(id)a3;
- (void)handleFailedToLoadBluetoothDevice:(id)a3;
- (void)loadDisplayForDevice:(id)a3 errorHandler:(id)a4;
- (void)removeDisplayForDevice:(id)a3;
- (void)setBrailleClient:(id)a3;
- (void)setPrimaryDeviceAddress:(id)a3;
- (void)updatePrimaryDevice:(id)a3;
@end

@implementation AXTVBrailleManager

- (AXTVBrailleManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXTVBrailleManager;
  v2 = -[AXTVBrailleManager init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager _cachedPrimaryDeviceAddress](v2, "_cachedPrimaryDeviceAddress"));
    -[AXTVBrailleManager setPrimaryDeviceAddress:](v3, "setPrimaryDeviceAddress:", v4);
  }

  return v3;
}

- (void)connectToBrailleServer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager brailleClient](self, "brailleClient"));

  if (!v3)
  {
    id v4 = [objc_allocWithZone(SCROBrailleClient) initWithDelegate:self];
    [v4 setKeepConnectionAlive:1];
    [v4 setDisplayDescriptorCallbackEnabled:0];
    -[AXTVBrailleManager setBrailleClient:](self, "setBrailleClient:", v4);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager brailleClient](self, "brailleClient"));
  _AXTVBTLog(0LL, 5LL, @"Did connect to braille server. client: %@", v5, v6, v7, v8, v9, (uint64_t)v10);
}

- (void)disconnectFromBrailleServer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager brailleClient](self, "brailleClient"));
  [v3 setDelegate:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager brailleClient](self, "brailleClient"));
  [v4 setKeepConnectionAlive:0];

  -[AXTVBrailleManager setBrailleClient:](self, "setBrailleClient:", 0LL);
  _AXTVBTLog(0LL, 5LL, @"Did disconnect from braille server", v5, v6, v7, v8, v9, v10);
}

- (void)loadDisplayForDevice:(id)a3 errorHandler:(id)a4
{
  id v27 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  _AXTVBTLog(0LL, 5LL, @"Will load display for device: %@", v7, v8, v9, v10, v11, (uint64_t)v27);
  if (!v6) {
    uint64_t v6 = (void (**)(id, void *))[&stru_66C10 copy];
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  if ([v12 length])
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager brailleClient](self, "brailleClient"));
    [v19 loadDisplayWithBluetoothDeviceAddress:v12];
  }

  else
  {
    id v20 = _AXTVMakeError(1LL, @"device address was empty", v13, v14, v15, v16, v17, v18, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v20);
    _AXTVBTLog(16LL, 5LL, @"%@", v21, v22, v23, v24, v25, (uint64_t)v19);
    v6[2](v6, v19);
  }
}

- (void)removeDisplayForDevice:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager brailleClient](self, "brailleClient"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  [v6 removeDisplayWithBluetoothDeviceAddress:v5];
}

- (void)updatePrimaryDevice:(id)a3
{
  if (!a3) {
    -[AXTVBrailleManager setPrimaryDeviceAddress:](self, "setPrimaryDeviceAddress:");
  }
}

- (void)_handleBrailleConfigurationChanged
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCROBrailleClient driverConfiguration](self->_brailleClient, "driverConfiguration", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCROBrailleDisplayIsPrimary]);
      unsigned __int8 v10 = [v9 BOOLValue];

      if ((v10 & 1) != 0) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kSCROBrailleDisplayBluetoothAddress]);

    if (v11) {
      goto LABEL_12;
    }
  }

  else
  {
LABEL_9:
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager _cachedPrimaryDeviceAddress](self, "_cachedPrimaryDeviceAddress"));
LABEL_12:
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleManager primaryDeviceAddress](self, "primaryDeviceAddress"));
  unsigned __int8 v13 = [v12 isEqualToString:v11];

  if ((v13 & 1) == 0) {
    -[AXTVBrailleManager setPrimaryDeviceAddress:](self, "setPrimaryDeviceAddress:", v11);
  }
}

- (id)_cachedPrimaryDeviceAddress
{
  v2 = (void *)_AXSVoiceOverTouchCopyBrailleBluetoothDisplay(self, a2);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kSCROBrailleDisplayBluetoothAddress]);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance", 0LL));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 pairedDevices]);

      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
LABEL_5:
        uint64_t v12 = 0LL;
        while (1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * v12) identifier]);
          unsigned __int8 v14 = [v13 isEqualToString:v6];

          if ((v14 & 1) != 0) {
            break;
          }
          if (v10 == (id)++v12)
          {
            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }

      else
      {
LABEL_11:

        uint64_t v8 = v6;
        id v6 = 0LL;
      }
    }

    else
    {
      id v6 = 0LL;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)handleBrailleDidDisconnect:(id)a3
{
}

- (void)handleBrailleDidReconnect:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_37590;
  block[3] = &unk_65530;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)handleBrailleConfigurationChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_37614;
  block[3] = &unk_65530;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)handleBrailleKeypress:(id)a3
{
}

- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4
{
}

- (void)handleBrailleKeyWillMemorize:(id)a3
{
}

- (void)handleBrailleKeyMemorize:(id)a3
{
}

- (void)handleBrailleDidDisplay:(id)a3
{
}

- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5
{
}

- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5
{
}

- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3
{
}

- (void)handleBrailleDidShowNextAnnouncement:(id)a3
{
}

- (void)handleBraillePlayDisplayConnectionSound:(id)a3
{
}

- (void)handleBraillePlayBorderHitSound
{
}

- (void)handleBraillePlayCommandNotSupportedSound
{
}

- (void)handleFailedToLoadBluetoothDevice:(id)a3
{
}

- (void)handleBrailleTableFailedToLoad:(id)a3
{
}

- (void)handleDisplayModeChanged:(id)a3
{
}

- (NSString)primaryDeviceAddress
{
  return self->_primaryDeviceAddress;
}

- (void)setPrimaryDeviceAddress:(id)a3
{
}

- (SCROBrailleClient)brailleClient
{
  return self->_brailleClient;
}

- (void)setBrailleClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end