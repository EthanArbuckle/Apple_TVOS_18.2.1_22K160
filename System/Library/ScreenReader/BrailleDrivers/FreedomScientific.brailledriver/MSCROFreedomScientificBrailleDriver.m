@interface MSCROFreedomScientificBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROFreedomScientificBrailleDriver)init;
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

@implementation MSCROFreedomScientificBrailleDriver

- (MSCROFreedomScientificBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROFreedomScientificBrailleDriver;
  result = -[MSCROFreedomScientificBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROFreedomScientificBrailleDriver;
  -[MSCROFreedomScientificBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading FreedomScientific braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v194 = v14;
        _os_log_impl(&dword_0, v9, v10, "%{public}@", buf, 0xCu);
      }
    }
  }

  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol]
    && [v4 transport] == 2)
  {
    v15 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);

    if (v17)
    {
      if (self->_isDriverLoaded) {
        -[MSCROFreedomScientificBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v180 = self;
      v181 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      id v182 = v4;
      v183 = (void *)objc_claimAutoreleasedReturnValue([v181 objectForKey:kSCROBrailleDriverModels]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v186 = 0u;
      __int128 v187 = 0u;
      __int128 v188 = 0u;
      __int128 v189 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v186 objects:v195 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v187;
LABEL_14:
        uint64_t v24 = 0LL;
        while (1)
        {
          if (*(void *)v187 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v186 + 1) + 8 * v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
          unsigned __int8 v27 = [v26 isEqualToString:v18];

          if ((v27 & 1) != 0) {
            break;
          }
          if (v22 == (id)++v24)
          {
            id v22 = [v20 countByEnumeratingWithState:&v186 objects:v195 count:16];
            if (!v22) {
              goto LABEL_20;
            }
            goto LABEL_14;
          }
        }

        v38 = v25;

        if (v38)
        {
          uint64_t v39 = AXLogBrailleHW();
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v194 = v38;
            _os_log_impl(&dword_0, v40, OS_LOG_TYPE_DEFAULT, "Found paired device: %@", buf, 0xCu);
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          v42 = v180;
          [v41 addObserver:v180 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
          [v41 addObserver:v180 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
          if ((-[os_log_s connected](v38, "connected") & 1) != 0)
          {
            if (BTDeviceGetComPortForServiceWithSandboxExtension( -[os_log_s device](v38, "device"),  0x2000LL,  buf,  512LL,  v192))
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              unsigned __int8 v44 = [v43 ignoreLogging];

              if ((v44 & 1) == 0)
              {
                v177 = v41;
                v45 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                uint64_t v46 = AXLoggerForFacility();
                v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);

                os_log_type_t v48 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v47, v48))
                {
                  uint64_t v49 = AXColorizeFormatLog(1LL, @"Failed to open bt com port - BTError [%ld]");
                  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                  uint64_t v51 = _AXStringForArgs(v50);
                  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                  if (os_log_type_enabled(v47, v48))
                  {
                    *(_DWORD *)v190 = 138543362;
                    v191 = v52;
                    _os_log_impl(&dword_0, v47, v48, "%{public}@", v190, 0xCu);
                  }
                }

- (BOOL)unloadDriver
{
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading FreedomScientific Braille Driver");
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

  self->_hasBeenUnloaded = 1;
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
    self->_bluetoothChannelIsLost = 1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0LL;

    self->_mainSize = 0LL;
    *(void *)&self->_int deviceID = 0LL;
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
  return 1;
}

- (int)brailleInputMode
{
  return 2;
}

- (int64_t)mainSize
{
  return self->_mainSize;
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
      v9.location = 0LL;
      v9.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v9);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  return (id)SCRDFreedomScientificExtractEventsFromBuffer( self->_safeReadBuffer,  &self->_brailleKeysDown,  &self->_topPanelKeysDown,  &self->_frontPanelKeysDown,  &self->_rockerKeysDown);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFIndex v5 = (const __CFData *)SCRDFreedomScientificCreateWriteRequestPacket(a3, a4, 1LL);
  if (v5)
  {
    uint64_t v6 = v5;
    if (self->_comPort == -1)
    {
      BOOL v10 = 0;
    }

    else
    {
      size_t Length = CFDataGetLength(v5);
      int comPort = self->_comPort;
      BytePtr = CFDataGetBytePtr(v6);
      BOOL v10 = write(comPort, BytePtr, Length) == Length;
    }

    CFRelease(v6);
  }

  else
  {
    BOOL v10 = 0;
  }

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.005);
  return v10;
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