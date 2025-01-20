@interface MSCROHandyTechBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROHandyTechBrailleDriver)init;
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

@implementation MSCROHandyTechBrailleDriver

- (MSCROHandyTechBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROHandyTechBrailleDriver;
  result = -[MSCROHandyTechBrailleDriver init](&v3, "init");
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_nextResetRequestTime = -3061152000.0;
    result->_comPort = -1;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROHandyTechBrailleDriver;
  -[MSCROHandyTechBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading HandyTech braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        int buf = 138543362;
        v156 = v14;
        _os_log_impl(&dword_0, v9, v10, "%{public}@", (uint8_t *)&buf, 0xCu);
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
        -[MSCROHandyTechBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v146 = v16;
      v145 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      id v147 = v4;
      v148 = (__CFString *)objc_claimAutoreleasedReturnValue([v145 objectForKey:kSCROBrailleDriverModels]);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v150 = 0u;
      __int128 v151 = 0u;
      __int128 v152 = 0u;
      __int128 v153 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v150 objects:v154 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v151;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v151 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v150 + 1) + 8LL * (void)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
            unsigned __int8 v27 = [v26 isEqualToString:v18];

            if ((v27 & 1) != 0)
            {
              id v38 = v25;

              if (v38)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                v144 = v39;
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                if ([v38 connected])
                {
                  p_comPort = &self->_comPort;
                  int v41 = MSCROBTOpenComPort(v38, &self->_comPort);
                  if (!v41)
                  {
                    objc_storeStrong((id *)&self->_device, v25);
                    id v69 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                    v70 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v69];
                    readerThread = self->_readerThread;
                    self->_readerThread = v70;

                    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                    self->_safeReadBuffer = Mutable;
                    if (!Mutable) {
                      goto LABEL_118;
                    }
                    v73 = (NSLock *)[objc_allocWithZone(NSLock) init];
                    readBufferLock = self->_readBufferLock;
                    self->_readBufferLock = v73;

                    if (!self->_readBufferLock) {
                      goto LABEL_118;
                    }
                    v75 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                    self->_readBuffer = v75;
                    if (!v75) {
                      goto LABEL_118;
                    }
                    -[SCRDFileReader start](self->_readerThread, "start");
                    unsigned int v76 = 0;
                    while (1)
                    {
                      char __buf = -1;
                      if (!write(*p_comPort, &__buf, 1uLL)) {
                        break;
                      }
                      self->_bluetoothChannelIsLost = 0;
                      self->_hasBeenUnloaded = 0;
                      CFRunLoopRunResult v77 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0);
                      if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v77 == kCFRunLoopRunStopped)
                      {
                        v111 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                        unsigned __int8 v112 = [v111 ignoreLogging];

                        if ((v112 & 1) != 0) {
                          goto LABEL_118;
                        }
                        v113 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v114 = AXLoggerForFacility();
                        v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);

                        os_log_type_t v116 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v115, v116))
                        {
                          uint64_t v117 = AXColorizeFormatLog( 1LL,  @"Failed to load HandyTech braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                          v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
                          uint64_t v119 = _AXStringForArgs(v118);
                          v120 = (__CFString *)objc_claimAutoreleasedReturnValue(v119);
                          if (os_log_type_enabled(v115, v116))
                          {
                            int buf = 138543362;
                            v156 = v120;
                            goto LABEL_115;
                          }

                          goto LABEL_116;
                        }

                        goto LABEL_117;
                      }

                      -[NSLock lock](self->_readBufferLock, "lock");
                      CFIndex Length = CFDataGetLength(self->_readBuffer);
                      if (Length >= 1)
                      {
                        CFIndex v79 = Length;
                        safeReadBuffer = self->_safeReadBuffer;
                        BytePtr = CFDataGetBytePtr(self->_readBuffer);
                        CFDataAppendBytes(safeReadBuffer, BytePtr, v79);
                        v157.location = 0LL;
                        v157.length = v79;
                        CFDataDeleteBytes(self->_readBuffer, v157);
                      }

                      -[NSLock unlock](self->_readBufferLock, "unlock");
                      SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 254LL);
                      while (CFDataGetLength(self->_safeReadBuffer) > 1)
                      {
                        v82 = CFDataGetBytePtr(self->_safeReadBuffer);
                        if (*v82 == 254)
                        {
                          unsigned int v83 = v82[1];
                          if (v83 <= 0x80)
                          {
                            if (v82[1] <= 0x60u)
                            {
                              if (v83 == 5 || v83 == 68 || v83 == 84) {
                                goto LABEL_90;
                              }
                            }

                            else if (v82[1] > 0x71u)
                            {
                              if (v83 == 114 || v83 == 116) {
                                goto LABEL_90;
                              }
                            }

                            else if (v83 == 97 || v83 == 100)
                            {
                              goto LABEL_90;
                            }
                          }

                          else
                          {
                            if (v82[1] <= 0xA3u)
                            {
                              switch(v82[1])
                              {
                                case 0x81u:
                                case 0x82u:
                                case 0x83u:
                                case 0x84u:
                                case 0x86u:
                                case 0x87u:
                                case 0x8Au:
                                  goto LABEL_90;
                                default:
                                  continue;
                              }
                            }

                            if (v83 == 164 || v83 == 166 || v83 == 168)
                            {
LABEL_90:
                              int v84 = v82[1];
                              goto LABEL_92;
                            }
                          }
                        }

                        else
                        {
                          v158.location = 0LL;
                          v158.length = 1LL;
                          CFDataDeleteBytes(self->_safeReadBuffer, v158);
                        }
                      }

                      int v84 = 0;
LABEL_92:
                      if (v76 <= 3)
                      {
                        ++v76;
                        if (!v84) {
                          continue;
                        }
                      }

                      v85 = sub_5A88(v84);
                      v86 = (NSString *)objc_claimAutoreleasedReturnValue(v85);
                      modelIdentifier = self->_modelIdentifier;
                      self->_modelIdentifier = v86;

                      v88 = (NSLock *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKey:](v148, "objectForKey:", self->_modelIdentifier));
                      if (v88)
                      {
                        v89 = v88;
                        self->_identifierByte = v84;
                        v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSLock objectForKey:](v88, "objectForKey:", kSCROBrailleDriverMainDisplaySize));
                        self->_mainSize = [v90 unsignedCharValue];

                        if (SCRDHandyTechDisplayUsesExtendedProtocol(self->_identifierByte, v91))
                        {
                          uint64_t ExtendedProtocolRequestPacket = SCRDHandyTechCreateExtendedProtocolRequestPacket( self->_identifierByte,  10LL,  0LL,  0LL);
                          if (ExtendedProtocolRequestPacket)
                          {
                            v93 = (const __CFData *)ExtendedProtocolRequestPacket;
                            v94 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                            unsigned __int8 v95 = [v94 ignoreLogging];

                            if ((v95 & 1) == 0)
                            {
                              v96 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                              uint64_t v97 = AXLoggerForFacility();
                              v98 = (os_log_s *)objc_claimAutoreleasedReturnValue(v97);

                              os_log_type_t v99 = AXOSLogLevelFromAXLogLevel(1LL);
                              if (os_log_type_enabled(v98, v99))
                              {
                                uint64_t v100 = AXColorizeFormatLog(1LL, @"Failed to write to com port for PCModeRequest");
                                v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
                                uint64_t v102 = _AXStringForArgs(v101);
                                mode = (__CFString *)objc_claimAutoreleasedReturnValue(v102);
                                if (os_log_type_enabled(v98, v99))
                                {
                                  int buf = 138543362;
                                  v156 = mode;
                                  _os_log_impl(&dword_0, v98, v99, "%{public}@", (uint8_t *)&buf, 0xCu);
                                }
                              }
                            }

                            int v103 = *p_comPort;
                            v104 = CFDataGetBytePtr(v93);
                            size_t v105 = CFDataGetLength(v93);
                            write(v103, v104, v105);
                            CFRelease(v93);
                          }

                          LOBYTE(buf) = 0;
                          v106 = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket( self->_identifierByte,  80LL,  &buf,  1LL);
                          if (v106)
                          {
                            v107 = v106;
                            int v108 = *p_comPort;
                            v109 = CFDataGetBytePtr(v106);
                            size_t v110 = CFDataGetLength(v107);
                            write(v108, v109, v110);
                            CFRelease(v107);
                          }
                        }

                        int v30 = 0;
                        self->_isDriverLoaded = 1;
                        v37 = v148;
                        goto LABEL_123;
                      }

                      v133 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      unsigned __int8 v134 = [v133 ignoreLogging];

                      if ((v134 & 1) == 0)
                      {
                        v135 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v136 = AXLoggerForFacility();
                        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);

                        os_log_type_t v138 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v137, v138))
                        {
                          uint64_t v139 = AXColorizeFormatLog( 1LL,  @"Failed to load HandyTech braille driver, Unknown model identifier [%{public}@]");
                          v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
                          uint64_t v141 = _AXStringForArgs(v140);
                          v142 = (__CFString *)objc_claimAutoreleasedReturnValue(v141);
                          if (os_log_type_enabled(v137, v138))
                          {
                            int buf = 138543362;
                            v156 = v142;
                            _os_log_impl(&dword_0, v137, v138, "%{public}@", (uint8_t *)&buf, 0xCu);
                          }
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading HandyTech Braille Driver");
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
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0LL;

    self->_identifierByte = 0;
    self->_mainSize = 0LL;
    *(_DWORD *)&self->_maxPacketSize = 0;
    self->_nextResetRequestTime = -3061152000.0;
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
  return (self->_identifierByte + 117) < 0xF6u;
}

- (int)brailleInputMode
{
  return 2 * ((self->_identifierByte + 127) > 9u);
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
      v27.location = 0LL;
      v27.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v27);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  BOOL isDeviceResetting = self->_isDeviceResetting;
  uint64_t EventsFromBuffer = SCRDHandyTechExtractEventsFromBuffer( self->_safeReadBuffer,  self->_identifierByte,  &self->_spaceKeyState,  &self->_isDeviceResetting);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(EventsFromBuffer);
  if (self->_isDeviceResetting)
  {
    double nextResetRequestTime = self->_nextResetRequestTime;
    if (nextResetRequestTime <= CFAbsoluteTimeGetCurrent())
    {
      char __buf = -1;
      int comPort = self->_comPort;
      if (comPort != -1) {
        write(comPort, &__buf, 1uLL);
      }
      self->_double nextResetRequestTime = CFAbsoluteTimeGetCurrent() + 0.2;
    }
  }

  if (isDeviceResetting != self->_isDeviceResetting)
  {
    if (SCRDHandyTechDisplayUsesExtendedProtocol(self->_identifierByte, v10) && self->_comPort != -1)
    {
      uint64_t ExtendedProtocolRequestPacket = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket( self->_identifierByte,  10LL,  0LL,  0LL);
      if (ExtendedProtocolRequestPacket)
      {
        v15 = ExtendedProtocolRequestPacket;
        int v16 = self->_comPort;
        v17 = CFDataGetBytePtr(ExtendedProtocolRequestPacket);
        size_t v18 = CFDataGetLength(v15);
        write(v16, v17, v18);
        CFRelease(v15);
      }

      char v25 = 0;
      v19 = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket(self->_identifierByte, 80LL, &v25, 1LL);
      if (v19)
      {
        v20 = v19;
        int v21 = self->_comPort;
        int v22 = CFDataGetBytePtr(v19);
        size_t v23 = CFDataGetLength(v20);
        write(v21, v22, v23);
        CFRelease(v20);
      }
    }

    SCRDPostSleepNotification(self, self->_isDeviceResetting);
  }

  return v11;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  if (self->_isDeviceResetting) {
    return 0;
  }
  if (SCRDHandyTechDisplayUsesExtendedProtocol(self->_identifierByte, a2))
  {
    uint64_t ExtendedProtocolRequestPacket = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket( self->_identifierByte,  1LL,  a3,  a4);
    if (ExtendedProtocolRequestPacket)
    {
      uint64_t v9 = ExtendedProtocolRequestPacket;
      CFIndex Length = CFDataGetLength(ExtendedProtocolRequestPacket);
      int comPort = self->_comPort;
      if (comPort == -1)
      {
        BOOL v14 = 0;
      }

      else
      {
        size_t v12 = Length;
        BytePtr = CFDataGetBytePtr(v9);
        BOOL v14 = write(comPort, BytePtr, v12) == v12;
      }

      CFRelease(v9);
    }

    else
    {
      return 0;
    }

    return v14;
  }

  else
  {
    int64_t mainSize = self->_mainSize;
    int v16 = (char *)&v19 - ((mainSize + 16) & 0xFFFFFFFFFFFFFFF0LL);
    size_t v17 = mainSize;
    if (mainSize >= a4)
    {
      if (mainSize > a4) {
        bzero(&v16[a4 + 1], mainSize - a4);
      }
      size_t v17 = a4;
    }

    char *v16 = 1;
    memcpy(v16 + 1, a3, v17);
    int v18 = self->_comPort;
    return v18 != -1
        && write(v18, (char *)&v19 - ((mainSize + 16) & 0xFFFFFFFFFFFFFFF0LL), mainSize + 1) == mainSize + 1;
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