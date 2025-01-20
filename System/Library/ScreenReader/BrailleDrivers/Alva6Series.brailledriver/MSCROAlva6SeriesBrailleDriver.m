@interface MSCROAlva6SeriesBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROAlva6SeriesBrailleDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)dealloc;
- (void)fileReader:(id)a3 data:(const void *)a4 length:(unint64_t)a5;
- (void)removeDeviceNotification:(id)a3;
- (void)setBrailleDriverDelegate:(id)a3;
@end

@implementation MSCROAlva6SeriesBrailleDriver

- (MSCROAlva6SeriesBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROAlva6SeriesBrailleDriver;
  result = -[MSCROAlva6SeriesBrailleDriver init](&v3, "init");
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROAlva6SeriesBrailleDriver;
  -[MSCROAlva6SeriesBrailleDriver dealloc](&v3, "dealloc");
}

- (unint64_t)interfaceVersion
{
  return 4LL;
}

- (int)loadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
    uint64_t v8 = AXLoggerForFacility();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    os_log_type_t v10 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading Alva6Series braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v268 = v14;
        _os_log_impl(&dword_0, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }

  if ([v4 transport] == 2
    && ([v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol] & 1) != 0)
  {
    v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);

    if (v17)
    {
      if (self->_isDriverLoaded) {
        -[MSCROAlva6SeriesBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v250 = v16;
      v249 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      uint64_t v251 = objc_claimAutoreleasedReturnValue([v249 objectForKey:kSCROBrailleDriverModels]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v260 = 0u;
      __int128 v261 = 0u;
      __int128 v262 = 0u;
      __int128 v263 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v260 objects:v269 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v261;
LABEL_14:
        uint64_t v24 = 0LL;
        while (1)
        {
          if (*(void *)v261 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v260 + 1) + 8 * v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
          unsigned __int8 v27 = [v26 isEqualToString:v18];

          if ((v27 & 1) != 0) {
            break;
          }
          if (v22 == (id)++v24)
          {
            id v22 = [v20 countByEnumeratingWithState:&v260 objects:v269 count:16];
            if (!v22) {
              goto LABEL_20;
            }
            goto LABEL_14;
          }
        }

        id v38 = v25;

        if (v38)
        {
          v39 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          [v40 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
          v248 = v40;
          [v40 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
          if (([v39 connected] & 1) == 0)
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            unsigned __int8 v69 = [v68 ignoreLogging];

            v37 = (void *)v251;
            if ((v69 & 1) == 0)
            {
              v43 = v39;
              v70 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              uint64_t v71 = AXLoggerForFacility();
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);

              os_log_type_t v72 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v46, v72))
              {
                uint64_t v73 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver because the device is no longer connected over bluetooth.");
                v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
                uint64_t v75 = _AXStringForArgs(v74);
                v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
                if (os_log_type_enabled(v46, v72))
                {
                  *(_DWORD *)buf = 138543362;
                  v268 = v76;
                  _os_log_impl(&dword_0, v46, v72, "%{public}@", buf, 0xCu);
                }
              }

              goto LABEL_50;
            }

- (BOOL)unloadDriver
{
  self->_hasBeenUnloaded = 1;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading Alva6Series Braille Driver");
      os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v22 = 138543362;
        uint64_t v23 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v22, 0xCu);
      }
    }
  }

  if (self->_isDriverLoaded)
  {
    self->_isDriverLoaded = 0;
    -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
    readerThread = self->_readerThread;
    self->_readerThread = 0LL;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 removeObserver:self];

    safeReadBuffer = self->_safeReadBuffer;
    if (safeReadBuffer)
    {
      CFRelease(safeReadBuffer);
      self->_safeReadBuffer = 0LL;
    }

    -[NSLock lock](self->_readBufferLock, "lock");
    readBuffer = self->_readBuffer;
    if (readBuffer)
    {
      CFRelease(readBuffer);
      self->_readBuffer = 0LL;
    }

    readBufferLock = self->_readBufferLock;
    self->_readBufferLock = 0LL;
    v18 = readBufferLock;

    -[NSLock unlock](v18, "unlock");
    -[BluetoothDevice disconnect](self->_device, "disconnect");
    device = self->_device;
    self->_device = 0LL;

    self->_comPort = -1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0LL;

    self->_mainSize = 0LL;
    *(_WORD *)&self->_availableCells = 0;
    self->_hasFeaturePack = 0;
  }

  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)isInputEnabled
{
  return self->_isDriverLoaded;
}

- (BOOL)postsKeyboardEvents
{
  return self->_hasFeaturePack;
}

- (int)brailleInputMode
{
  return 2 * self->_hasFeaturePack;
}

- (int64_t)mainSize
{
  return self->_availableCells;
}

- (int64_t)statusSize
{
  return 0LL;
}

- (id)getInputEvents
{
  readBuffer = self->_readBuffer;
  if (readBuffer)
  {
    CFIndex Length = CFDataGetLength(readBuffer);
    if (Length >= 1)
    {
      CFIndex v5 = Length;
      safeReadBuffer = self->_safeReadBuffer;
      BytePtr = CFDataGetBytePtr(self->_readBuffer);
      CFDataAppendBytes(safeReadBuffer, BytePtr, v5);
      v24.location = 0LL;
      v24.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v24);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 27LL);
  CFIndex v8 = CFDataGetLength(self->_safeReadBuffer);
  if (v8 >= 3)
  {
    unint64_t v9 = v8;
    os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    while (1)
    {
      uint64_t v11 = CFDataGetBytePtr(self->_safeReadBuffer);
      v12.location = 0LL;
      v12.length = 3LL;
      switch(v11[1])
      {
        case '?':
        case 'D':
        case 'I':
        case 'L':
        case 'O':
        case 'P':
        case 'R':
        case 'S':
        case 'U':
          goto LABEL_7;
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'J':
        case 'M':
        case 'Q':
          goto LABEL_11;
        case 'E':
          int v14 = v11[2];
          if (v14 != self->_availableCells)
          {
            self->_availableCells = v14;
            self->_splitPointOffset = LOBYTE(self->_mainSize) - v14;
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter",  3LL));
            [v15 postNotificationName:@"SCROBrailleDriverProtocolConfigurationChangeNotification" object:self userInfo:0];
          }

          v12.location = 0LL;
          v12.length = 3LL;
          goto LABEL_7;
        case 'F':
          if (v9 < 6) {
            goto LABEL_30;
          }
          v12.location = 0LL;
          v12.length = 6LL;
          goto LABEL_7;
        case 'G':
          if (v9 < 0xB) {
            goto LABEL_30;
          }
          v12.location = 0LL;
          v12.length = 11LL;
          goto LABEL_7;
        case 'H':
          if (v9 < 8) {
            goto LABEL_30;
          }
          v12.location = 0LL;
          v12.length = 8LL;
          goto LABEL_7;
        case 'K':
          if (v9 < 4) {
            goto LABEL_30;
          }
          uint64_t v16 = v11[2];
          if ((_DWORD)v16 == 1)
          {
            char v23 = 63;
            __int16 __buf = 17691;
            int comPort = self->_comPort;
            if (comPort != -1) {
              write(comPort, &__buf, 3uLL);
            }
          }

          else
          {
            SCRDAlva6SeriesAppendKeyEvent(self->_deviceID, v16, v11[3], 0LL, self->_availableCells, v10);
          }

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  int64_t availableCells = self->_availableCells;
  CFIndex v8 = (char *)malloc(availableCells + 4);
  if (!v8) {
    return 0;
  }
  unint64_t v9 = v8;
  strcpy(v8, "\x1BB");
  v8[3] = availableCells;
  os_log_type_t v10 = v8 + 4;
  if (availableCells <= a4)
  {
    memcpy(v8 + 4, a3, availableCells);
  }

  else
  {
    memcpy(v8 + 4, a3, a4);
    bzero(&v10[a4], availableCells - a4);
  }

  int comPort = self->_comPort;
  BOOL v11 = comPort != -1 && write(comPort, v9, availableCells + 4) == availableCells + 4;
  free(v9);
  return v11;
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (void)fileReader:(id)a3 data:(const void *)a4 length:(unint64_t)a5
{
  if (a5)
  {
    -[NSLock lock](self->_readBufferLock, "lock", a3);
    readBuffer = self->_readBuffer;
    if (readBuffer) {
      CFDataAppendBytes(readBuffer, (const UInt8 *)a4, a5);
    }
    -[NSLock unlock](self->_readBufferLock, "unlock");
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_driverDelegate);
  [WeakRetained brailleDriverDidReceiveInput];
}

- (void)removeDeviceNotification:(id)a3
{
  unsigned __int8 v4 = (BluetoothDevice *)objc_claimAutoreleasedReturnValue([a3 object]);
  if (v4)
  {
    if (v4 == self->_device)
    {
      self->_bluetoothChannelIsLost = 1;
      if (self->_isDriverLoaded)
      {
        uint64_t v6 = v4;
        CFIndex v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v5 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:self userInfo:0];

        unsigned __int8 v4 = v6;
      }
    }
  }
}

- (void)setBrailleDriverDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end