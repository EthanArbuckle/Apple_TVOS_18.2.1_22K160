@interface MSCROEurobrailleBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROEurobrailleBrailleDriver)init;
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

@implementation MSCROEurobrailleBrailleDriver

- (MSCROEurobrailleBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROEurobrailleBrailleDriver;
  result = -[MSCROEurobrailleBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROEurobrailleBrailleDriver;
  -[MSCROEurobrailleBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading Eurobraille braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v167 = v14;
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
        -[MSCROEurobrailleBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v155 = v16;
      v154 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v156 = (void *)objc_claimAutoreleasedReturnValue([v154 objectForKey:kSCROBrailleDriverModels]);
      id v153 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v159 = 0u;
      __int128 v160 = 0u;
      __int128 v161 = 0u;
      __int128 v162 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v159 objects:v168 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v160;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v160 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v159 + 1) + 8LL * (void)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
            unsigned __int8 v27 = [v26 isEqualToString:v18];

            if ((v27 & 1) != 0)
            {
              id v38 = v25;

              if (v38)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                if ([v38 connected])
                {
                  v40 = v39;
                  if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  buf,  512,  v165))
                  {
                    v41 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v42 = [v41 ignoreLogging];

                    if ((v42 & 1) == 0)
                    {
                      v43 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v44 = AXLoggerForFacility();
                      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);

                      os_log_type_t v46 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v45, v46))
                      {
                        uint64_t v47 = AXColorizeFormatLog(1LL, @"Failed to open bt com port - BTError [%ld]");
                        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
                        uint64_t v49 = _AXStringForArgs(v48);
                        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
                        if (os_log_type_enabled(v45, v46))
                        {
                          *(_DWORD *)v163 = 138543362;
                          v164 = v50;
                          _os_log_impl(&dword_0, v45, v46, "%{public}@", v163, 0xCu);
                        }
                      }
                    }

                    v39 = v40;
                    v51 = v40;
LABEL_92:
                    [v51 removeObserver:self];
                    int v30 = 1;
                    id v4 = v153;
                    v35 = v154;
LABEL_93:
                    v16 = v155;
                    v37 = v156;
                    goto LABEL_94;
                  }

                  if (sandbox_extension_consume(v165) == -1)
                  {
                    v78 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v79 = [v78 ignoreLogging];

                    if ((v79 & 1) == 0)
                    {
                      v80 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v81 = AXLoggerForFacility();
                      v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);

                      os_log_type_t v83 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v82, v83))
                      {
                        uint64_t v84 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                        v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
                        __error();
                        uint64_t v86 = _AXStringForArgs(v85);
                        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
                        if (os_log_type_enabled(v82, v83))
                        {
                          *(_DWORD *)v163 = 138543362;
                          v164 = v87;
                          _os_log_impl(&dword_0, v82, v83, "%{public}@", v163, 0xCu);
                        }
                      }
                    }
                  }

                  int v88 = open((const char *)buf, 131074);
                  self->_comPort = v88;
                  if ((v88 & 0x80000000) == 0)
                  {
                    objc_storeStrong((id *)&self->_device, v25);
                    id v152 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                    v89 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v152];
                    readerThread = self->_readerThread;
                    self->_readerThread = v89;

                    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                    self->_safeReadBuffer = Mutable;
                    v39 = v40;
                    if (!Mutable) {
                      goto LABEL_119;
                    }
                    v92 = (NSLock *)[objc_allocWithZone(NSLock) init];
                    readBufferLock = self->_readBufferLock;
                    self->_readBufferLock = v92;

                    if (!self->_readBufferLock) {
                      goto LABEL_119;
                    }
                    v94 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                    self->_readBuffer = v94;
                    if (!v94) {
                      goto LABEL_119;
                    }
                    -[SCRDFileReader start](self->_readerThread, "start");
                    int v95 = 5;
                    while (1)
                    {
                      modelIdentifier = self->_modelIdentifier;
                      if (modelIdentifier) {
                        goto LABEL_79;
                      }
                      __int16 v158 = 841;
                      int __buf = 1392771074;
                      self->_bluetoothChannelIsLost = 0;
                      self->_hasBeenUnloaded = 0;
                      CFRunLoopRunResult v97 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
                      if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v97 == kCFRunLoopRunStopped)
                      {
                        v118 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                        unsigned __int8 v119 = [v118 ignoreLogging];

                        v39 = v40;
                        if ((v119 & 1) != 0) {
                          goto LABEL_119;
                        }
                        v120 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v121 = AXLoggerForFacility();
                        v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v121);

                        os_log_type_t v123 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v122, v123))
                        {
                          uint64_t v124 = AXColorizeFormatLog( 1LL,  @"Failed to load Eurobraille braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                          v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
                          uint64_t v126 = _AXStringForArgs(v125);
                          v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
                          if (os_log_type_enabled(v122, v123))
                          {
                            *(_DWORD *)v163 = 138543362;
                            v164 = v127;
                            _os_log_impl(&dword_0, v122, v123, "%{public}@", v163, 0xCu);
                          }

                          v39 = v40;
                          goto LABEL_110;
                        }

                        v39 = v40;
                        goto LABEL_118;
                      }

                      -[NSLock lock](self->_readBufferLock, "lock");
                      CFIndex Length = CFDataGetLength(self->_readBuffer);
                      if (Length >= 1)
                      {
                        CFIndex v99 = Length;
                        safeReadBuffer = self->_safeReadBuffer;
                        BytePtr = CFDataGetBytePtr(self->_readBuffer);
                        CFDataAppendBytes(safeReadBuffer, BytePtr, v99);
                        v169.location = 0LL;
                        v169.length = v99;
                        CFDataDeleteBytes(self->_readBuffer, v169);
                      }

                      -[NSLock unlock](self->_readBufferLock, "unlock");
                      if (SCRDEurobrailleGetModelInfoFromBuffer( self->_safeReadBuffer,  &self->_deviceIdentifier,  &self->_mainSize,  &self->_isDeviceSleeping))
                      {
                        uint64_t deviceIdentifier = self->_deviceIdentifier;
                        if (deviceIdentifier < 0xF && ((0x607Fu >> deviceIdentifier) & 1) != 0)
                        {
                          v103 = self->_modelIdentifier;
                          self->_modelIdentifier = (NSString *)*(&off_4258 + deviceIdentifier);
                        }
                      }

                      if (!--v95)
                      {
                        modelIdentifier = self->_modelIdentifier;
LABEL_79:
                        v39 = v40;
                        v104 = (void *)objc_claimAutoreleasedReturnValue([v156 objectForKey:modelIdentifier]);

                        if (v104)
                        {
                          unint64_t v105 = self->_mainSize + 6;
                          self->_writeBufferSize = v105;
                          v106 = (char *)malloc(v105);
                          self->_writeBuffer = v106;
                          if (!v106) {
                            goto LABEL_119;
                          }
                          self->_isDriverLoaded = 1;
                          v35 = v154;
                          v16 = v155;
                          if (self->_isDeviceSleeping) {
                            SCRDPostSleepNotification(self, 1LL);
                          }
                          int v30 = 0;
                          id v4 = v153;
                          v37 = v156;
LABEL_124:

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:

LABEL_98:
                          goto LABEL_99;
                        }

                        v135 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                        unsigned __int8 v136 = [v135 ignoreLogging];

                        if ((v136 & 1) == 0)
                        {
                          v137 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                          uint64_t v138 = AXLoggerForFacility();
                          v139 = (os_log_s *)objc_claimAutoreleasedReturnValue(v138);

                          os_log_type_t v140 = AXOSLogLevelFromAXLogLevel(1LL);
                          if (os_log_type_enabled(v139, v140))
                          {
                            uint64_t v141 = AXColorizeFormatLog( 1LL,  @"Failed to load Eurobraille braille driver, Unknown model identifier [%{public}@]");
                            v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
                            uint64_t v143 = _AXStringForArgs(v142);
                            v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
                            if (os_log_type_enabled(v139, v140))
                            {
                              *(_DWORD *)v163 = 138543362;
                              v164 = v144;
                              _os_log_impl(&dword_0, v139, v140, "%{public}@", v163, 0xCu);
                            }

                            v39 = v40;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading Eurobraille Braille Driver");
      os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v23 = 138543362;
        v24 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v23, 0xCu);
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

    v17 = self->_readBufferLock;
    readBufferLock = self->_readBufferLock;
    self->_readBufferLock = 0LL;

    -[NSLock unlock](v17, "unlock");
    -[BluetoothDevice disconnect](self->_device, "disconnect");
    device = self->_device;
    self->_device = 0LL;

    self->_comPort = -1;
    self->_bluetoothChannelIsLost = 1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0LL;

    self->_mainSize = 0LL;
    writeBuffer = self->_writeBuffer;
    if (writeBuffer)
    {
      free(writeBuffer);
      self->_writeBuffer = 0LL;
    }

    *(_WORD *)&self->_joystick2KeyBuffer = 0;
    *(_DWORD *)&self->_isDeviceSleeping = 0;
  }

  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return self->_isDeviceSleeping;
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
  return self->_deviceIdentifier != 2;
}

- (int)brailleInputMode
{
  return 2 * (self->_deviceIdentifier != 2);
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
      v13.location = 0LL;
      v13.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v13);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  int isDeviceSleeping = self->_isDeviceSleeping;
  uint64_t EventsFromBuffer = SCRDEurobrailleExtractEventsFromBuffer( self->_safeReadBuffer,  self->_deviceIdentifier,  &self->_switches1KeyBuffer,  &self->_switches2KeyBuffer,  &self->_joystick1KeyBuffer,  &self->_joystick2KeyBuffer,  &self->_functionKeyBuffer,  &self->_isDeviceSleeping);
  os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(EventsFromBuffer);
  int v11 = self->_isDeviceSleeping;
  if (isDeviceSleeping != v11) {
    SCRDPostSleepNotification(self, v11 != 0);
  }
  return v10;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  *self->_writeBuffer = 2;
  self->_writeBuffer[self->_writeBufferSize - 1] = 3;
  int v5 = LODWORD(self->_mainSize) + 4;
  self->_writeBuffer[1] = BYTE1(v5);
  self->_writeBuffer[2] = v5;
  self->_writeBuffer[3] = 66;
  self->_writeBuffer[4] = 83;
  int64_t mainSize = self->_mainSize;
  v7 = self->_writeBuffer + 5;
  if (mainSize <= a4)
  {
    memcpy(v7, a3, mainSize);
  }

  else
  {
    memcpy(v7, a3, a4);
    bzero(&self->_writeBuffer[a4 + 5], self->_mainSize - a4);
  }

  int comPort = self->_comPort;
  return comPort != -1 && write(comPort, self->_writeBuffer, self->_writeBufferSize) == self->_writeBufferSize;
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
        int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
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