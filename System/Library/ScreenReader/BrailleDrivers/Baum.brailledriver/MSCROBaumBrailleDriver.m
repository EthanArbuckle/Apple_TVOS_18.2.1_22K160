@interface MSCROBaumBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBaumBrailleDriver)init;
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

@implementation MSCROBaumBrailleDriver

- (MSCROBaumBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROBaumBrailleDriver;
  result = -[MSCROBaumBrailleDriver init](&v3, "init");
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_nextInitRequestTime = -3061152000.0;
    result->_comPort = -1;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROBaumBrailleDriver;
  -[MSCROBaumBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading Baum braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        int buf = 138543362;
        v196 = v14;
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
        -[MSCROBaumBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v180 = v16;
      v182 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v183 = (void *)objc_claimAutoreleasedReturnValue([v182 objectForKey:kSCROBrailleDriverModels]);
      id v181 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v187 = 0u;
      __int128 v188 = 0u;
      __int128 v189 = 0u;
      __int128 v190 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v187 objects:v197 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v188;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v188 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v187 + 1) + 8LL * (void)i);
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
                  if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  &buf,  512,  v194))
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
                        v50 = (__CFString *)objc_claimAutoreleasedReturnValue(v49);
                        if (os_log_type_enabled(v45, v46))
                        {
                          *(_DWORD *)v192 = 138543362;
                          v193 = v50;
                          _os_log_impl(&dword_0, v45, v46, "%{public}@", v192, 0xCu);
                        }
                      }
                    }

                    v39 = v40;
                    v51 = v40;
                  }

                  else
                  {
                    if (sandbox_extension_consume(v194) == -1)
                    {
                      v67 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      unsigned __int8 v68 = [v67 ignoreLogging];

                      if ((v68 & 1) == 0)
                      {
                        v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        uint64_t v70 = AXLoggerForFacility();
                        v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);

                        os_log_type_t v72 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v71, v72))
                        {
                          uint64_t v73 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
                          __error();
                          uint64_t v75 = _AXStringForArgs(v74);
                          v76 = (__CFString *)objc_claimAutoreleasedReturnValue(v75);
                          if (os_log_type_enabled(v71, v72))
                          {
                            *(_DWORD *)v192 = 138543362;
                            v193 = v76;
                            _os_log_impl(&dword_0, v71, v72, "%{public}@", v192, 0xCu);
                          }
                        }
                      }
                    }

                    int v77 = open((const char *)&buf, 131074);
                    self->_comPort = v77;
                    if ((v77 & 0x80000000) == 0)
                    {
                      objc_storeStrong((id *)&self->_device, v25);
                      id v78 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                      v79 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v78];
                      readerThread = self->_readerThread;
                      self->_readerThread = v79;

                      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                      self->_safeReadBuffer = Mutable;
                      v179 = v78;
                      if (!Mutable) {
                        goto LABEL_118;
                      }
                      v82 = (NSLock *)[objc_allocWithZone(NSLock) init];
                      readBufferLock = self->_readBufferLock;
                      self->_readBufferLock = v82;

                      if (!self->_readBufferLock) {
                        goto LABEL_118;
                      }
                      v84 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                      self->_readBuffer = v84;
                      if (!v84) {
                        goto LABEL_118;
                      }
                      -[SCRDFileReader start](self->_readerThread, "start");
                      uint64_t v85 = 0LL;
                      unsigned int v86 = 0;
                      memset(v191, 0, 19);
                      while (1)
                      {
                        char v186 = 1;
                        __int16 __buf = 5403;
                        __int16 v184 = -31717;
                        self->_bluetoothChannelIsLost = 0;
                        self->_hasBeenUnloaded = 0;
                        CFRunLoopRunResult v87 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.2, 0);
                        if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v87 == kCFRunLoopRunStopped)
                        {
                          v133 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                          unsigned __int8 v134 = [v133 ignoreLogging];

                          if ((v134 & 1) != 0) {
                            goto LABEL_118;
                          }
                          v135 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                          uint64_t v136 = AXLoggerForFacility();
                          v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);

                          os_log_type_t v138 = AXOSLogLevelFromAXLogLevel(1LL);
                          if (os_log_type_enabled(v137, v138))
                          {
                            uint64_t v139 = AXColorizeFormatLog( 1LL,  @"Failed to load Baum braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                            v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
                            uint64_t v141 = _AXStringForArgs(v140);
                            v142 = (__CFString *)objc_claimAutoreleasedReturnValue(v141);
                            if (os_log_type_enabled(v137, v138))
                            {
                              *(_DWORD *)v192 = 138543362;
                              v193 = v142;
                              v143 = v137;
                              os_log_type_t v144 = v138;
                              goto LABEL_114;
                            }

                            goto LABEL_115;
                          }

                          goto LABEL_116;
                        }

                        -[NSLock lock](self->_readBufferLock, "lock");
                        CFIndex Length = CFDataGetLength(self->_readBuffer);
                        if (Length >= 1)
                        {
                          CFIndex v89 = Length;
                          uint64_t v90 = v85;
                          safeReadBuffer = self->_safeReadBuffer;
                          BytePtr = CFDataGetBytePtr(self->_readBuffer);
                          v93 = safeReadBuffer;
                          uint64_t v85 = v90;
                          CFDataAppendBytes(v93, BytePtr, v89);
                          v198.location = 0LL;
                          v198.length = v89;
                          CFDataDeleteBytes(self->_readBuffer, v198);
                        }

                        -[NSLock unlock](self->_readBufferLock, "unlock");
                        uint64_t PacketFromBuffer = SCRDBaumCreatePacketFromBuffer(self->_safeReadBuffer, self->_mainSize);
                        if (PacketFromBuffer)
                        {
                          v96 = (const __CFData *)PacketFromBuffer;
                          int v97 = 0;
                          do
                          {
                            v98 = CFDataGetBytePtr(v96);
                            int v99 = *v98;
                            if (v99 == 132)
                            {
                              __int128 v100 = *(_OWORD *)(v98 + 1);
                              LOWORD(v191[1]) = *(_WORD *)(v98 + 17);
                              v191[0] = v100;
                              int v97 = 1;
                            }

                            else if (v99 == 23)
                            {
                              uint64_t v85 = 1LL;
                            }

                            else
                            {
                              uint64_t v85 = v85;
                            }

                            CFRelease(v96);
                            v96 = (const __CFData *)SCRDBaumCreatePacketFromBuffer( self->_safeReadBuffer,  self->_mainSize);
                          }

                          while (v96);
                          BOOL v95 = v86++ > 5;
                          int v101 = v95;
                          if (((v101 | v97) & 1) != 0)
                          {
                            if ((v97 & 1) != 0)
                            {
                              char v102 = v85;
                              v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v191));
                              v104 = _modelIdentifierForDeviceIdentifier(v103, &self->_deviceID);
                              v105 = (NSString *)objc_claimAutoreleasedReturnValue(v104);
                              modelIdentifier = self->_modelIdentifier;
                              self->_modelIdentifier = v105;

                              v107 = (void *)objc_claimAutoreleasedReturnValue([v183 objectForKey:self->_modelIdentifier]);
                              v108 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                              unsigned __int8 v109 = [v108 ignoreLogging];

                              if (v107)
                              {
                                if ((v109 & 1) == 0)
                                {
                                  v110 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                                  uint64_t v111 = AXLoggerForFacility();
                                  v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);

                                  os_log_type_t v113 = AXOSLogLevelFromAXLogLevel(1LL);
                                  if (os_log_type_enabled(v112, v113))
                                  {
                                    uint64_t v114 = AXColorizeFormatLog(1LL, @"Baum braille driver: %@ %@");
                                    v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
                                    uint64_t v116 = _AXStringForArgs(v115);
                                    mode = (__CFString *)objc_claimAutoreleasedReturnValue(v116);
                                    if (os_log_type_enabled(v112, v113))
                                    {
                                      *(_DWORD *)v192 = 138543362;
                                      v193 = mode;
                                      _os_log_impl(&dword_0, v112, v113, "%{public}@", v192, 0xCu);
                                    }
                                  }
                                }

                                v117 = (void *)objc_claimAutoreleasedReturnValue([v107 objectForKey:kSCROBrailleDriverMainDisplaySize]);
                                self->_int64_t mainSize = [v117 unsignedCharValue];

                                int64_t mainSize = self->_mainSize;
                                uint64_t v119 = mainSize + 7;
                                BOOL v95 = mainSize < -7;
                                uint64_t v120 = mainSize + 14;
                                if (!v95) {
                                  uint64_t v120 = v119;
                                }
                                uint64_t v121 = v120 >> 3;
                                self->_routerKeyGroupStateBufferSize = v121;
                                v122 = (char *)calloc(v121, 1uLL);
                                self->_routerKeyGroupStateBuffer = v122;
                                if (v122)
                                {
                                  self->_isDriverLoaded = 1;
                                  self->_isDeviceSleeping = v102 & 1;
                                  if ((v102 & 1) != 0) {
                                    SCRDPostSleepNotification(self, 1LL);
                                  }
                                  int v30 = 0;
                                  v37 = v183;
LABEL_125:

                                  v39 = v40;
LABEL_126:
                                  v16 = v180;
                                  id v4 = v181;
                                  v35 = v182;
LABEL_127:

LABEL_128:
LABEL_129:

LABEL_130:
LABEL_131:

                                  goto LABEL_132;
                                }
                              }

                              else
                              {
                                if ((v109 & 1) == 0)
                                {
                                  v170 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                                  uint64_t v171 = AXLoggerForFacility();
                                  v172 = (os_log_s *)objc_claimAutoreleasedReturnValue(v171);

                                  os_log_type_t v173 = AXOSLogLevelFromAXLogLevel(1LL);
                                  if (os_log_type_enabled(v172, v173))
                                  {
                                    uint64_t v174 = AXColorizeFormatLog( 1LL,  @"Failed to load Baum braille driver, Unknown model identifier [%{public}@]");
                                    v175 = (void *)objc_claimAutoreleasedReturnValue(v174);
                                    uint64_t v176 = _AXStringForArgs(v175);
                                    v177 = (__CFString *)objc_claimAutoreleasedReturnValue(v176);
                                    if (os_log_type_enabled(v172, v173))
                                    {
                                      *(_DWORD *)v192 = 138543362;
                                      v193 = v177;
                                      _os_log_impl(&dword_0, v172, v173, "%{public}@", v192, 0xCu);
                                    }
                                  }
                                }

                                v107 = 0LL;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading Baum Braille Driver");
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

    self->_int64_t mainSize = 0LL;
    routerKeyGroupStateBuffer = self->_routerKeyGroupStateBuffer;
    if (routerKeyGroupStateBuffer)
    {
      free(routerKeyGroupStateBuffer);
      self->_routerKeyGroupStateBuffer = 0LL;
    }

    self->_isDeviceSleeping = 0;
    *(_DWORD *)&self->_routerKeyStateBuffer = 0;
    self->_frontPanelKeysDown = 0;
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
  return (self->_deviceID < 0x25uLL) & (0x1C0FC001FFuLL >> self->_deviceID);
}

- (int)brailleInputMode
{
  unint64_t deviceID = self->_deviceID;
  if (deviceID > 0x24) {
    return 0;
  }
  else {
    return dword_6D44[deviceID];
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
      v19.location = 0LL;
      v19.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v19);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  os_log_type_t v8 = self->_safeReadBuffer;
  if (!v8) {
    return 0LL;
  }
  if (CFDataGetLength(v8) < 3) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  uint64_t PacketFromBuffer = SCRDBaumCreatePacketFromBuffer(self->_safeReadBuffer, self->_mainSize);
  if (PacketFromBuffer)
  {
    v12 = (const __CFData *)PacketFromBuffer;
    while (1)
    {
      int v13 = *CFDataGetBytePtr(v12);
      if (v13 > 0x23)
      {
        if (v13 > 50)
        {
          if (v13 == 51)
          {
            SCRDBaumAppendEventsFromBrailleAndFrontPanelPacket( v9,  v12,  &self->_brailleKeysDown,  &self->_frontPanelKeysDown,  self->_deviceID);
          }

          else if (v13 == 52)
          {
            SCRDBaumAppendEventsFromDirectionalPadPacket(v9, v12, &self->_directionalPadKeysDown);
          }
        }

        else if (v13 == 36)
        {
          SCRDBaumAppendEventsFromTopPanelPacket(v9, v12, &self->_topPanelKeyState, self->_deviceID);
        }

        else if (v13 == 39)
        {
          SCRDBaumAppendEventsFromRoutingKeyPacket(v9, v12, &self->_routerKeyStateBuffer);
        }

        goto LABEL_32;
      }

      if (v13 == 1) {
        break;
      }
      if (v13 != 23)
      {
        if (v13 == 34) {
          SCRDBaumAppendEventsFromRoutingKeyGroupPacket( v9,  v12,  self->_routerKeyGroupStateBuffer,  self->_routerKeyGroupStateBufferSize);
        }
        goto LABEL_32;
      }

      if (!self->_isDeviceSleeping)
      {
        self->_isDeviceSleeping = 1;
        v14 = self;
        uint64_t v15 = 1LL;
LABEL_30:
        SCRDPostSleepNotification(v14, v15);
      }

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  uint64_t v5 = SCRDBaumCreateDisplayRequest(a3, a4, self->_mainSize, &__nbyte);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    int comPort = self->_comPort;
    if (comPort == -1)
    {
      BOOL v9 = 0;
    }

    else
    {
      ssize_t v8 = write(comPort, v6, __nbyte);
      BOOL v9 = v8 == __nbyte;
    }

    free(v6);
  }

  else
  {
    BOOL v9 = 0;
  }

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.005);
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