@interface MSCROHIMSBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROHIMSBrailleDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)_himsDeviceId;
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

@implementation MSCROHIMSBrailleDriver

- (MSCROHIMSBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROHIMSBrailleDriver;
  result = -[MSCROHIMSBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROHIMSBrailleDriver;
  -[MSCROHIMSBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading HIMS braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v180 = v14;
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
        -[MSCROHIMSBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v170 = v16;
      v169 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      id v171 = v4;
      v172 = (void *)objc_claimAutoreleasedReturnValue([v169 objectForKey:kSCROBrailleDriverModels]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      *(_OWORD *)&__nbyte[1] = 0u;
      __int128 v174 = 0u;
      __int128 v175 = 0u;
      __int128 v176 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&__nbyte[1] objects:v181 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v174;
        while (2)
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v174 != v23) {
              objc_enumerationMutation(v20);
            }
            unint64_t v25 = *(void *)(*(void *)&__nbyte[3] + 8LL * (void)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue([(id)v25 address]);
            unsigned __int8 v27 = [v26 isEqualToString:v18];

            if ((v27 & 1) != 0)
            {
              v38 = (os_log_s *)(id)v25;

              if (v38)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                [v39 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                v168 = v38;
                if ((-[os_log_s connected](v38, "connected") & 1) == 0)
                {
                  v68 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  unsigned __int8 v69 = [v68 ignoreLogging];

                  if ((v69 & 1) == 0)
                  {
                    v70 = v39;
                    v71 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    uint64_t v72 = AXLoggerForFacility();
                    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);

                    os_log_type_t v74 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v73, v74))
                    {
                      uint64_t v75 = AXColorizeFormatLog( 1LL,  @"Failed to load HIMS braille driver because the device is no longer connected over bluetooth.");
                      v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
                      uint64_t v77 = _AXStringForArgs(v76);
                      v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
                      if (os_log_type_enabled(v73, v74))
                      {
                        *(_DWORD *)buf = 138543362;
                        v180 = v78;
                        _os_log_impl(&dword_0, v73, v74, "%{public}@", buf, 0xCu);
                      }
                    }

                    v39 = v70;
                  }

                  [v39 removeObserver:self];
                  int v30 = 1;
                  v16 = v170;
                  id v4 = v171;
                  v35 = (os_log_s *)v169;
                  v37 = v172;
                  goto LABEL_105;
                }

                if (BTDeviceGetComPortForServiceWithSandboxExtension( -[os_log_s device](v38, "device"),  0x2000LL,  buf,  512LL,  v178))
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  unsigned __int8 v41 = [v40 ignoreLogging];

                  if ((v41 & 1) == 0)
                  {
                    v42 = v39;
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
                        *(_DWORD *)v177 = 138543362;
                        *(void *)&v177[4] = v50;
                        _os_log_impl(&dword_0, v45, v46, "%{public}@", v177, 0xCu);
                      }
                    }

                    v39 = v42;
                  }
                }

                else
                {
                  if (sandbox_extension_consume(v178) == -1)
                  {
                    v79 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v80 = [v79 ignoreLogging];

                    if ((v80 & 1) == 0)
                    {
                      v81 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v82 = AXLoggerForFacility();
                      v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);

                      os_log_type_t v84 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v83, v84))
                      {
                        v85 = v39;
                        uint64_t v86 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
                        __error();
                        uint64_t v88 = _AXStringForArgs(v87);
                        v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
                        if (os_log_type_enabled(v83, v84))
                        {
                          *(_DWORD *)v177 = 138543362;
                          *(void *)&v177[4] = v89;
                          _os_log_impl(&dword_0, v83, v84, "%{public}@", v177, 0xCu);
                        }

                        v39 = v85;
                      }
                    }
                  }

                  int v90 = open((const char *)buf, 131074);
                  self->_comPort = v90;
                  if ((v90 & 0x80000000) == 0)
                  {
                    v91 = v39;
                    objc_storeStrong((id *)&self->_device, (id)v25);
                    id v92 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                    v93 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v92];
                    readerThread = self->_readerThread;
                    self->_readerThread = v93;

                    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                    self->_safeReadBuffer = Mutable;
                    if (Mutable
                      && (v96 = (NSLock *)[objc_allocWithZone(NSLock) init],
                          v97 = self->_readBufferLock,
                          self->_readBufferLock = v96,
                          v97,
                          self->_readBufferLock)
                      && (v98 = CFDataCreateMutable(kCFAllocatorDefault, 0LL), (self->_readBuffer = v98) != 0LL))
                    {
                      -[SCRDFileReader start](self->_readerThread, "start");
                      uint64_t v99 = SCRDHIMSCreateRequest(251LL, 1LL, 32LL, 0LL, 0LL, __nbyte);
                      v100 = (void *)v99;
                      if (v99)
                      {
                        unsigned int v101 = 0;
                        v167 = (void *)v99;
                        id v166 = v92;
                        while (1)
                        {
                          ssize_t v102 = write(self->_comPort, v100, __nbyte[0]);
                          if (v102 < __nbyte[0]) {
                            break;
                          }
                          self->_bluetoothChannelIsLost = 0;
                          self->_hasBeenUnloaded = 0;
                          CFRunLoopRunResult v103 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                          if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v103 == kCFRunLoopRunStopped)
                          {
                            v133 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                            unsigned __int8 v134 = [v133 ignoreLogging];

                            if ((v134 & 1) == 0)
                            {
                              v135 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                              uint64_t v136 = AXLoggerForFacility();
                              v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);

                              os_log_type_t v138 = AXOSLogLevelFromAXLogLevel(1LL);
                              v39 = v91;
                              if (os_log_type_enabled(v137, v138))
                              {
                                uint64_t v139 = AXColorizeFormatLog( 1LL,  @"Failed to load HIMS braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                                v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
                                uint64_t v141 = _AXStringForArgs(v140);
                                v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
                                if (os_log_type_enabled(v137, v138))
                                {
                                  *(_DWORD *)v177 = 138543362;
                                  *(void *)&v177[4] = v142;
                                  _os_log_impl(&dword_0, v137, v138, "%{public}@", v177, 0xCu);
                                }

                                v37 = v172;
                                id v92 = v166;
                                v100 = v167;
                                goto LABEL_141;
                              }

                              v37 = v172;
LABEL_132:
                              id v92 = v166;
                              v100 = v167;
                              goto LABEL_142;
                            }

                            goto LABEL_118;
                          }

                          -[NSLock lock](self->_readBufferLock, "lock");
                          CFIndex Length = CFDataGetLength(self->_readBuffer);
                          if (Length >= 1)
                          {
                            CFIndex v105 = Length;
                            safeReadBuffer = self->_safeReadBuffer;
                            BytePtr = CFDataGetBytePtr(self->_readBuffer);
                            v108 = safeReadBuffer;
                            v100 = v167;
                            CFDataAppendBytes(v108, BytePtr, v105);
                            v182.location = 0LL;
                            v182.length = v105;
                            CFDataDeleteBytes(self->_readBuffer, v182);
                          }

                          -[NSLock unlock](self->_readBufferLock, "unlock");
                          SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 250LL);
                          if (CFDataGetLength(self->_safeReadBuffer) < 10)
                          {
LABEL_79:
                            int v111 = 0;
                          }

                          else
                          {
                            while (1)
                            {
                              v109 = CFDataGetBytePtr(self->_safeReadBuffer);
                              SCRDHIMSFillPacket(v177, v109);
                              unint64_t v25 = v25 & 0xFFFFFFFFFFFF0000LL | *(unsigned __int16 *)&v177[8];
                              v183.location = 0LL;
                              v183.length = 1LL;
                              CFDataDeleteBytes(self->_safeReadBuffer, v183);
                              SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 250LL);
                              if (CFDataGetLength(self->_safeReadBuffer) <= 9) {
                                goto LABEL_79;
                              }
                            }

                            int v111 = v177[3];
                            v184.location = 0LL;
                            v184.length = 1LL;
                            CFDataDeleteBytes(self->_safeReadBuffer, v184);
                          }

                          if (v101 <= 3)
                          {
                            ++v101;
                            if (!v111) {
                              continue;
                            }
                          }

                          free(v100);
                          if (v111 != 20)
                          {
                            if (v111 == 40)
                            {
                              modelIdentifier = self->_modelIdentifier;
                              v113 = @"com.apple.scrod.braille.driver.hims.braille.edge.40";
                              goto LABEL_125;
                            }

                            v153 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                            unsigned __int8 v154 = [v153 ignoreLogging];

                            if ((v154 & 1) == 0)
                            {
                              v155 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                              uint64_t v156 = AXLoggerForFacility();
                              v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);

                              os_log_type_t v157 = AXOSLogLevelFromAXLogLevel(1LL);
                              if (os_log_type_enabled(v137, v157))
                              {
                                uint64_t v158 = AXColorizeFormatLog( 1LL,  @"Failed to load HIMS braille driver, Unknown model identifier [%{public}@]");
                                uint64_t v149 = objc_claimAutoreleasedReturnValue(v158);
                                uint64_t v159 = _AXStringForArgs(v149);
                                v142 = (void *)objc_claimAutoreleasedReturnValue(v159);
                                if (os_log_type_enabled(v137, v157))
                                {
                                  *(_DWORD *)v177 = 138543362;
                                  *(void *)&v177[4] = v142;
                                  goto LABEL_138;
                                }

                                goto LABEL_139;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading HIMS Braille Driver");
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
  return (id)SCRDHIMSBrailleEDGEExtractEventsFromBuffer( self->_safeReadBuffer,  -[MSCROHIMSBrailleDriver _himsDeviceId](self, "_himsDeviceId"));
}

- (int)_himsDeviceId
{
  return 0;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  uint64_t v5 = SCRDHIMSCreateRequest(252LL, 1LL, LOBYTE(self->_mainSize), a3, a4, &__nbyte);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)v5;
  int comPort = self->_comPort;
  if (comPort == -1)
  {
    BOOL v9 = 0;
  }

  else
  {
    int v8 = write(comPort, v6, __nbyte);
    BOOL v9 = (_DWORD)__nbyte == v8;
  }

  free(v6);
  return v9;
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
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
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