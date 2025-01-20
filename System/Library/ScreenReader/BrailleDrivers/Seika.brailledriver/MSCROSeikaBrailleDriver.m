@interface MSCROSeikaBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROSeikaBrailleDriver)init;
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

@implementation MSCROSeikaBrailleDriver

- (MSCROSeikaBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROSeikaBrailleDriver;
  result = -[MSCROSeikaBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROSeikaBrailleDriver;
  -[MSCROSeikaBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading Seika braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        int buf = 138543362;
        v189 = v14;
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
        -[MSCROSeikaBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v176 = v16;
      v178 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v177 = (void *)objc_claimAutoreleasedReturnValue([v178 objectForKey:kSCROBrailleDriverModels]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v181 = 0u;
      __int128 v182 = 0u;
      __int128 v183 = 0u;
      __int128 v184 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v181 objects:v190 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v182;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v182 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v181 + 1) + 8LL * (void)i);
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
                  v174 = v39;
                  if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  &buf,  512,  v187))
                  {
                    v40 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v41 = [v40 ignoreLogging];

                    v37 = v177;
                    v35 = v178;
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
                          *(_DWORD *)v185 = 138543362;
                          v186 = v49;
                          _os_log_impl(&dword_0, v44, v45, "%{public}@", v185, 0xCu);
                        }
                      }
                    }

                    v39 = v174;
                  }

                  else
                  {
                    v37 = v177;
                    v35 = v178;
                    if (sandbox_extension_consume(v187) == -1)
                    {
                      v75 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      unsigned __int8 v76 = [v75 ignoreLogging];

                      if ((v76 & 1) == 0)
                      {
                        v77 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v78 = AXLoggerForFacility();
                        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);

                        os_log_type_t v80 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v79, v80))
                        {
                          uint64_t v81 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                          uint64_t v82 = objc_claimAutoreleasedReturnValue(v81);
                          __error();
                          v172 = (void *)v82;
                          uint64_t v83 = _AXStringForArgs(v82);
                          v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
                          if (os_log_type_enabled(v79, v80))
                          {
                            *(_DWORD *)v185 = 138543362;
                            v186 = v84;
                            _os_log_impl(&dword_0, v79, v80, "%{public}@", v185, 0xCu);
                          }
                        }
                      }
                    }

                    int v85 = open((const char *)&buf, 131074);
                    self->_comPort = v85;
                    if ((v85 & 0x80000000) == 0)
                    {
                      objc_storeStrong((id *)&self->_device, v25);
                      id v86 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                      v87 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v86];
                      readerThread = self->_readerThread;
                      self->_readerThread = v87;

                      id v89 = objc_allocWithZone(&OBJC_CLASS___NSConstantValueExpression);
                      id v90 = [v89 initWithObject:kSCRDSeikaNotetakerBluetoothNameRegExPattern];
                      id v91 = objc_allocWithZone(&OBJC_CLASS___NSComparisonPredicate);
                      v92 = (void *)objc_claimAutoreleasedReturnValue( +[NSExpression expressionForEvaluatedObject]( &OBJC_CLASS___NSExpression,  "expressionForEvaluatedObject"));
                      v171 = v90;
                      id v173 = [v91 initWithLeftExpression:v92 rightExpression:v90 modifier:0 type:6 options:0];

                      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                      self->_safeReadBuffer = Mutable;
                      if (!Mutable) {
                        goto LABEL_127;
                      }
                      v94 = (NSLock *)[objc_allocWithZone(NSLock) init];
                      readBufferLock = self->_readBufferLock;
                      self->_readBufferLock = v94;

                      if (!self->_readBufferLock) {
                        goto LABEL_127;
                      }
                      v96 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                      self->_readBuffer = v96;
                      if (!v96) {
                        goto LABEL_127;
                      }
                      id v169 = v86;
                      -[SCRDFileReader start](self->_readerThread, "start");
                      v97 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothDevice name](self->_device, "name"));
                      id v98 = [v173 evaluateWithObject:v97];

                      id v99 = v98;
                      int v100 = 0;
                      if ((_DWORD)v98) {
                        char v101 = -95;
                      }
                      else {
                        char v101 = 10;
                      }
                      __int16 __buf = -1;
                      char v180 = v101;
                      while (1)
                      {
                        modelIdentifier = self->_modelIdentifier;
                        if (modelIdentifier) {
                          goto LABEL_116;
                        }
                        self->_bluetoothChannelIsLost = 0;
                        self->_hasBeenUnloaded = 0;
                        CFRunLoopRunResult v103 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                        if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v103 == kCFRunLoopRunStopped)
                        {
                          v133 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                          unsigned __int8 v134 = [v133 ignoreLogging];

                          id v86 = v169;
                          if ((v134 & 1) != 0) {
                            goto LABEL_127;
                          }
                          v135 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                          uint64_t v136 = AXLoggerForFacility();
                          v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);

                          v138 = v137;
                          os_log_type_t v139 = AXOSLogLevelFromAXLogLevel(1LL);
                          if (!os_log_type_enabled(v137, v139))
                          {
                            id v86 = v169;
                            goto LABEL_126;
                          }

                          uint64_t v140 = AXColorizeFormatLog( 1LL,  @"Failed to load Seika braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                          v141 = (__CFString *)objc_claimAutoreleasedReturnValue(v140);
                          uint64_t v142 = _AXStringForArgs(v141);
                          v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
                          if (os_log_type_enabled(v138, v139))
                          {
                            *(_DWORD *)v185 = 138543362;
                            v186 = v143;
                            _os_log_impl(&dword_0, v138, v139, "%{public}@", v185, 0xCu);
                          }

                          id v86 = v169;
                          goto LABEL_124;
                        }

                        -[NSLock lock](self->_readBufferLock, "lock");
                        readBuffer = self->_readBuffer;
                        if (readBuffer)
                        {
                          CFIndex Length = CFDataGetLength(readBuffer);
                          if (Length >= 1)
                          {
                            CFIndex v106 = Length;
                            id v107 = v99;
                            safeReadBuffer = self->_safeReadBuffer;
                            BytePtr = CFDataGetBytePtr(self->_readBuffer);
                            v110 = safeReadBuffer;
                            id v99 = v107;
                            CFDataAppendBytes(v110, BytePtr, v106);
                            v191.location = 0LL;
                            v191.length = v106;
                            CFDataDeleteBytes(self->_readBuffer, v191);
                          }
                        }

                        -[NSLock unlock](self->_readBufferLock, "unlock");
                        v111 = self->_safeReadBuffer;
                        if ((v99 & 1) != 0)
                        {
                          uint64_t PacketFromBuffer = SCRDSeikaNotetakerCreatePacketFromBuffer(v111);
                          if (PacketFromBuffer)
                          {
                            v113 = (const __CFData *)PacketFromBuffer;
                            do
                            {
                              v114 = CFDataGetBytePtr(v113);
                              if (v114[2] == 162)
                              {
                                HIDWORD(v116) = v114[5];
                                LODWORD(v116) = HIDWORD(v116) - 8;
                                signed int v115 = v116 >> 3;
                                if (v115 <= 4 && ((0x17u >> v115) & 1) != 0)
                                {
                                  int v117 = dword_7098[v115];
                                  v118 = (NSString *)*(&off_8260 + v115);
                                  self->_deviceID = v117;
                                  v119 = self->_modelIdentifier;
                                  self->_modelIdentifier = v118;
                                }
                              }

                              CFRelease(v113);
                              v113 = (const __CFData *)SCRDSeikaNotetakerCreatePacketFromBuffer(self->_safeReadBuffer);
                            }

                            while (v113);
                          }
                        }

                        else
                        {
                          while (1)
                          {
                            Identityuint64_t PacketFromBuffer = (const void *)SCRDSeikaCreateIdentityPacketFromBuffer(v111);
                            if (!IdentityPacketFromBuffer) {
                              break;
                            }
                            if (CFDataGetBytePtr(self->_safeReadBuffer)[2] == 40)
                            {
                              self->_deviceID = 1;
                              v121 = self->_modelIdentifier;
                              self->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.nippon.telesoft.seika.40";
                            }

                            CFRelease(IdentityPacketFromBuffer);
                            v111 = self->_safeReadBuffer;
                          }
                        }

                        if (++v100 == 5)
                        {
                          modelIdentifier = self->_modelIdentifier;
LABEL_116:
                          v152 = (void *)objc_claimAutoreleasedReturnValue([v177 objectForKey:modelIdentifier]);
                          v39 = v174;
                          id v86 = v169;
                          if (v152)
                          {
                            v153 = v152;
                            v154 = (void *)objc_claimAutoreleasedReturnValue([v152 objectForKey:kSCROBrailleDriverMainDisplaySize]);
                            self->_mainSize = [v154 unsignedCharValue];

                            self->_isDriverLoaded = 1;
                            int v30 = 0;
                            v16 = v176;
                            goto LABEL_132;
                          }

                          v155 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                          unsigned __int8 v156 = [v155 ignoreLogging];

                          if ((v156 & 1) == 0)
                          {
                            v157 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                            uint64_t v158 = AXLoggerForFacility();
                            uint64_t v159 = objc_claimAutoreleasedReturnValue(v158);

                            v138 = (os_log_s *)v159;
                            os_log_type_t v149 = AXOSLogLevelFromAXLogLevel(1LL);
                            if (os_log_type_enabled(v138, v149))
                            {
                              uint64_t v160 = AXColorizeFormatLog( 1LL,  @"Failed to load Seika braille driver, Unknown model identifier [%{public}@]");
                              CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v160);
                              uint64_t v161 = _AXStringForArgs(mode);
                              v143 = (void *)objc_claimAutoreleasedReturnValue(v161);
                              if (os_log_type_enabled(v138, v149))
                              {
                                *(_DWORD *)v185 = 138543362;
                                v186 = v143;
LABEL_122:
                                _os_log_impl(&dword_0, v138, v149, "%{public}@", v185, 0xCu);
                              }

                              goto LABEL_123;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading Seika Braille Driver");
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
  return (self->_deviceID - 3) < 4;
}

- (int)brailleInputMode
{
  return 2 * ((self->_deviceID - 3) < 4);
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
  return (id)SCRDSeikaExtractEventsFromBuffer(self->_safeReadBuffer, self->_deviceID);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFIndex v5 = (const __CFData *)SCRDSeikaCreateWriteRequestPacket(a3, a4, self->_deviceID);
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