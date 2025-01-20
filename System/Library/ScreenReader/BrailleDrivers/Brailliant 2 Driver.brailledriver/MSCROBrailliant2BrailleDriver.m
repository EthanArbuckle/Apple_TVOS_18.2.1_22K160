@interface MSCROBrailliant2BrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBrailliant2BrailleDriver)init;
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

@implementation MSCROBrailliant2BrailleDriver

- (MSCROBrailliant2BrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROBrailliant2BrailleDriver;
  result = -[MSCROBrailliant2BrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROBrailliant2BrailleDriver;
  -[MSCROBrailliant2BrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading Brailliant2 braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        id v180 = v14;
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
        -[MSCROBrailliant2BrailleDriver unloadDriver](self, "unloadDriver");
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v171 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kSCROBrailleDriverModels]);
      id v172 = v4;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v174 = 0u;
      __int128 v175 = 0u;
      __int128 v176 = 0u;
      __int128 v177 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 pairedDevices]);

      id v22 = [v21 countByEnumeratingWithState:&v174 objects:v178 count:16];
      v173 = v18;
      if (v22)
      {
        id v23 = v22;
        v167 = v16;
        uint64_t v24 = *(void *)v175;
        while (2)
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v175 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v174 + 1) + 8LL * (void)i);
            v27 = (void *)objc_claimAutoreleasedReturnValue([v26 address]);
            unsigned int v28 = [v27 isEqualToString:v19];

            if (v28)
            {
              id v29 = v26;
              goto LABEL_27;
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v174 objects:v178 count:16];
          if (v23) {
            continue;
          }
          break;
        }

        id v29 = 0LL;
LABEL_27:
        v16 = v167;
        v18 = v173;
      }

      else
      {
        id v29 = 0LL;
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      unsigned __int8 v42 = [v41 ignoreLogging];

      if ((v42 & 1) == 0)
      {
        id v43 = v29;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        uint64_t v45 = AXLoggerForFacility();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);

        os_log_type_t v47 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = AXColorizeFormatLog(1LL, @"Found paired device: %@");
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          uint64_t v50 = _AXStringForArgs(v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v46, v47))
          {
            *(_DWORD *)buf = 138543362;
            id v180 = v51;
            _os_log_impl(&dword_0, v46, v47, "%{public}@", buf, 0xCu);
          }
        }

        id v29 = v43;
        v18 = v173;
      }

      if (v29)
      {
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        -[os_log_s addObserver:selector:name:object:]( v52,  "addObserver:selector:name:object:",  self,  "removeDeviceNotification:",  BluetoothDeviceDisconnectSuccessNotification,  0LL);
        -[os_log_s addObserver:selector:name:object:]( v52,  "addObserver:selector:name:object:",  self,  "removeDeviceNotification:",  BluetoothDeviceDisconnectFailedNotification,  0LL);
        if ([v29 connected])
        {
          uint64_t v53 = MSCROBTOpenComPort(v29, &self->_comPort);
          if (!(_DWORD)v53)
          {
            v170 = v52;
            objc_storeStrong((id *)&self->_device, v29);
            id v92 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
            v93 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v92];
            readerThread = self->_readerThread;
            self->_readerThread = v93;

            Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
            self->_safeReadBuffer = Mutable;
            id v166 = v29;
            if (Mutable)
            {
              v96 = (NSLock *)[objc_allocWithZone(NSLock) init];
              readBufferLock = self->_readBufferLock;
              self->_readBufferLock = v96;

              id v4 = v172;
              if (self->_readBufferLock)
              {
                v98 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                self->_readBuffer = v98;
                if (v98)
                {
                  uint64_t InitializationRequestPacket = SCRDHumanwareCreateInitializationRequestPacket(-[SCRDFileReader start](self->_readerThread, "start"));
                  v100 = (const __CFData *)InitializationRequestPacket;
                  if (!InitializationRequestPacket)
                  {
                    v38 = v171;
                    goto LABEL_95;
                  }

                  id v159 = v92;
                  int v101 = 0;
                  v160 = (const __CFData *)InitializationRequestPacket;
                  while (!self->_deviceID)
                  {
                    ssize_t Length = CFDataGetLength(v100);
                    int comPort = self->_comPort;
                    BytePtr = CFDataGetBytePtr(v100);
                    if (write(comPort, BytePtr, Length) < Length)
                    {
                      v124 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      unsigned __int8 v125 = [v124 ignoreLogging];

                      if ((v125 & 1) == 0)
                      {
                        v126 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v127 = AXLoggerForFacility();
                        v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);

                        os_log_type_t v129 = AXOSLogLevelFromAXLogLevel(1LL);
                        os_log_t loga = v128;
                        if (os_log_type_enabled(v128, v129))
                        {
                          uint64_t v130 = AXColorizeFormatLog(1LL, @"Failed to write to com port for initRequest");
                          mode = (__CFString *)objc_claimAutoreleasedReturnValue(v130);
                          uint64_t v131 = _AXStringForArgs(mode);
                          v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
                          if (os_log_type_enabled(v128, v129))
                          {
                            *(_DWORD *)buf = 138543362;
                            id v180 = v132;
                            _os_log_impl(&dword_0, v128, v129, "%{public}@", buf, 0xCu);
                          }

                          goto LABEL_132;
                        }

                        goto LABEL_136;
                      }

                      goto LABEL_122;
                    }

                    self->_bluetoothChannelIsLost = 0;
                    self->_hasBeenUnloaded = 0;
                    CFRunLoopRunResult v105 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                    if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v105 == kCFRunLoopRunStopped)
                    {
                      v122 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      unsigned __int8 v123 = [v122 ignoreLogging];

                      if ((v123 & 1) != 0)
                      {
                        v38 = v171;
                        id v4 = v172;
                        id v92 = v159;
                        v100 = v160;
                        goto LABEL_95;
                      }

                      v138 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v139 = AXLoggerForFacility();
                      v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);

                      os_log_type_t v141 = AXOSLogLevelFromAXLogLevel(1LL);
                      os_log_t loga = v140;
                      if (os_log_type_enabled(v140, v141))
                      {
                        uint64_t v142 = AXColorizeFormatLog( 1LL,  @"Failed to load Brailliant2 braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                        mode = (__CFString *)objc_claimAutoreleasedReturnValue(v142);
                        uint64_t v143 = _AXStringForArgs(mode);
                        v132 = (void *)objc_claimAutoreleasedReturnValue(v143);
                        if (os_log_type_enabled(v140, v141))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v180 = v132;
                          _os_log_impl(&dword_0, v140, v141, "%{public}@", buf, 0xCu);
                        }

                        v38 = v171;
                        id v4 = v172;
                        id v92 = v159;
                        v100 = v160;
LABEL_133:

                        v52 = v170;
                      }

                      else
                      {
                        v38 = v171;
                        id v4 = v172;
                        v52 = v170;
                        id v92 = v159;
                        v100 = v160;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading Brailliant2 Braille Driver");
      os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v22 = 138543362;
        id v23 = v12;
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

    self->_int comPort = -1;
    self->_bluetoothChannelIsLost = 1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0LL;

    self->_mainSize = 0LL;
    self->_deviceID = 0;
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
  return (self->_deviceID < 9u) & (0x1C6u >> self->_deviceID);
}

- (int)brailleInputMode
{
  int deviceID = self->_deviceID;
  else {
    return 2 * (deviceID == 7);
  }
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
  return (id)SCRDHumanwareExtractEventsFromBuffer(self->_safeReadBuffer, self->_deviceID, 0LL);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFIndex v5 = (const __CFData *)SCRDHumanwareCreateWriteRequestPacket(a3, a4, self->_deviceID);
  if (!v5) {
    return 0;
  }
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
  id v4 = a3;
  uint64_t v5 = AXLogBrailleHW();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Brailliant2 remove device: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = (BluetoothDevice *)objc_claimAutoreleasedReturnValue([v4 object]);
  os_log_type_t v8 = v7;
  if (v7)
  {
    if (v7 == self->_device)
    {
      self->_bluetoothChannelIsLost = 1;
      if (self->_isDriverLoaded)
      {
        CFRange v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
        [v9 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:self userInfo:0];
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