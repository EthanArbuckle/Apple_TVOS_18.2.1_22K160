@interface MSCROBrailleNoteApexBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBrailleNoteApexBrailleDriver)init;
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

@implementation MSCROBrailleNoteApexBrailleDriver

- (MSCROBrailleNoteApexBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROBrailleNoteApexBrailleDriver;
  result = -[MSCROBrailleNoteApexBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROBrailleNoteApexBrailleDriver;
  -[MSCROBrailleNoteApexBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading BrailleNoteApex braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        int buf = 138543362;
        v169 = v14;
        _os_log_impl(&dword_0, v9, v10, "%{public}@", (uint8_t *)&buf, 0xCu);
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
        -[MSCROBrailleNoteApexBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v157 = v16;
      v156 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      id v158 = v4;
      v159 = (void *)objc_claimAutoreleasedReturnValue([v156 objectForKey:kSCROBrailleDriverModels]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v161 = 0u;
      __int128 v162 = 0u;
      __int128 v163 = 0u;
      __int128 v164 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v161 objects:v170 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v162;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v162 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v161 + 1) + 8LL * (void)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
            unsigned __int8 v27 = [v26 isEqualToString:v18];

            if ((v27 & 1) != 0)
            {
              id v38 = v25;

              if (v38)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                v155 = v39;
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                if ([v38 connected])
                {
                  if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  &buf,  512,  v167))
                  {
                    v40 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v41 = [v40 ignoreLogging];

                    v35 = v156;
                    v16 = v157;
                    if ((v41 & 1) == 0)
                    {
                      v42 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v43 = AXLoggerForFacility();
                      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);

                      os_log_type_t v45 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v44, v45))
                      {
                        uint64_t v46 = AXColorizeFormatLog(1LL, @"Failed to open bt com port - BTError [%ld]");
                        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                        uint64_t v48 = _AXStringForArgs(v47);
                        v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                        if (os_log_type_enabled(v44, v45))
                        {
                          *(_DWORD *)v165 = 138543362;
                          v166 = v49;
                          _os_log_impl(&dword_0, v44, v45, "%{public}@", v165, 0xCu);
                        }
                      }

                      goto LABEL_50;
                    }

                    goto LABEL_51;
                  }

                  v35 = v156;
                  v16 = v157;
                  if (sandbox_extension_consume(v167) == -1)
                  {
                    v76 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v77 = [v76 ignoreLogging];

                    if ((v77 & 1) == 0)
                    {
                      v78 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v79 = AXLoggerForFacility();
                      v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);

                      os_log_type_t v81 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v80, v81))
                      {
                        uint64_t v82 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                        uint64_t v83 = objc_claimAutoreleasedReturnValue(v82);
                        __error();
                        v153 = (void *)v83;
                        uint64_t v84 = _AXStringForArgs(v83);
                        v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
                        if (os_log_type_enabled(v80, v81))
                        {
                          *(_DWORD *)v165 = 138543362;
                          v166 = v85;
                          _os_log_impl(&dword_0, v80, v81, "%{public}@", v165, 0xCu);
                        }
                      }
                    }
                  }

                  int v86 = open((const char *)&buf, 131074);
                  self->_comPort = v86;
                  if (v86 < 0)
                  {
                    v107 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v108 = [v107 ignoreLogging];

                    if ((v108 & 1) == 0)
                    {
                      v109 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v110 = AXLoggerForFacility();
                      v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);

                      os_log_type_t v112 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v111, v112))
                      {
                        uint64_t v113 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                        v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
                        uint64_t v115 = _AXStringForArgs(v114);
                        v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
                        if (os_log_type_enabled(v111, v112))
                        {
                          *(_DWORD *)v165 = 138543362;
                          v166 = v116;
                          _os_log_impl(&dword_0, v111, v112, "%{public}@", v165, 0xCu);
                        }
                      }
                    }

                    self->_comPort = -1;
                    goto LABEL_51;
                  }

                  objc_storeStrong((id *)&self->_device, v25);
                  id v154 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                  v87 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v154];
                  readerThread = self->_readerThread;
                  self->_readerThread = v87;

                  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                  self->_safeReadBuffer = Mutable;
                  v58 = v155;
                  if (!Mutable) {
                    goto LABEL_117;
                  }
                  v90 = (NSLock *)[objc_allocWithZone(NSLock) init];
                  readBufferLock = self->_readBufferLock;
                  self->_readBufferLock = v90;

                  if (!self->_readBufferLock) {
                    goto LABEL_117;
                  }
                  v92 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                  self->_readBuffer = v92;
                  if (!v92) {
                    goto LABEL_117;
                  }
                  -[SCRDFileReader start](self->_readerThread, "start");
                  p_mainSize = &self->_mainSize;
                  int v93 = 5;
                  while (2)
                  {
                    modelIdentifier = self->_modelIdentifier;
                    if (modelIdentifier) {
                      goto LABEL_90;
                    }
                    __int16 __buf = 16155;
                    if ((unint64_t)write(self->_comPort, &__buf, 2uLL) <= 1)
                    {
                      v129 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      unsigned __int8 v130 = [v129 ignoreLogging];

                      if ((v130 & 1) == 0)
                      {
                        v131 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v132 = AXLoggerForFacility();
                        v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v132);

                        os_log_type_t v133 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v121, v133))
                        {
                          uint64_t v134 = AXColorizeFormatLog( 1LL,  @"Failed to write to com port for BrailleNoteDescriptionRequest");
                          v124 = (void *)objc_claimAutoreleasedReturnValue(v134);
                          uint64_t v135 = _AXStringForArgs(v124);
                          v126 = (void *)objc_claimAutoreleasedReturnValue(v135);
                          if (os_log_type_enabled(v121, v133))
                          {
                            *(_DWORD *)v165 = 138543362;
                            v166 = v126;
                            v127 = v121;
                            os_log_type_t v128 = v133;
LABEL_107:
                            _os_log_impl(&dword_0, v127, v128, "%{public}@", v165, 0xCu);
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading BrailleNoteApex Braille Driver");
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
  return (id)SCRDBrailleNoteExtractEventsFromBuffer(self->_safeReadBuffer);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  DisplayRequest = (const __CFData *)SCRDBrailleNoteCreateDisplayRequest( a3,  a4,  LOBYTE(self->_mainSize),  LOBYTE(self->_statusOffset));
  if (!DisplayRequest) {
    return 0;
  }
  uint64_t v6 = DisplayRequest;
  if (self->_comPort == -1)
  {
    BOOL v10 = 0;
  }

  else
  {
    size_t Length = CFDataGetLength(DisplayRequest);
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