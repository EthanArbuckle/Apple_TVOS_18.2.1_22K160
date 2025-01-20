@interface MSCROEasyLinkBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROEasyLinkBrailleDriver)init;
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

@implementation MSCROEasyLinkBrailleDriver

- (MSCROEasyLinkBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROEasyLinkBrailleDriver;
  result = -[MSCROEasyLinkBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROEasyLinkBrailleDriver;
  -[MSCROEasyLinkBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading EasyLink braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v188 = v14;
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
        -[MSCROEasyLinkBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v174 = self;
      v177 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v175 = (void *)objc_claimAutoreleasedReturnValue([v177 objectForKey:kSCROBrailleDriverModels]);
      id v176 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v180 = 0u;
      __int128 v181 = 0u;
      __int128 v182 = 0u;
      __int128 v183 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v180 objects:v189 count:16];
      if (!v21)
      {
LABEL_20:

LABEL_36:
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        unsigned __int8 v52 = [v51 ignoreLogging];

        id v4 = v176;
        if ((v52 & 1) != 0)
        {
          int v30 = 1;
          v35 = v177;
          v37 = v175;
LABEL_94:

LABEL_95:
          goto LABEL_96;
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        uint64_t v56 = AXLoggerForFacility();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);

        int v30 = 1;
        os_log_type_t v58 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = v177;
        v173 = v57;
        if (!os_log_type_enabled(v57, v58))
        {
          v37 = v175;
LABEL_93:

          goto LABEL_94;
        }

        uint64_t v59 = AXColorizeFormatLog( 1LL,  @"Failed to load EasyLink braille driver because we found no matching paired device");
        uint64_t v60 = objc_claimAutoreleasedReturnValue(v59);
        uint64_t v61 = _AXStringForArgs(v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v57, v58))
        {
          *(_DWORD *)buf = 138543362;
          v188 = v62;
          _os_log_impl(&dword_0, v57, v58, "%{public}@", buf, 0xCu);
        }

        v37 = v175;
        v39 = (void *)v60;
LABEL_92:

        goto LABEL_93;
      }

      id v22 = v21;
      uint64_t v23 = *(void *)v181;
LABEL_14:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v181 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v180 + 1) + 8 * v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
        unsigned __int8 v27 = [v26 isEqualToString:v18];

        if ((v27 & 1) != 0) {
          break;
        }
        if (v22 == (id)++v24)
        {
          id v22 = [v20 countByEnumeratingWithState:&v180 objects:v189 count:16];
          if (v22) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }

      v38 = v25;

      if (!v38) {
        goto LABEL_36;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v40 = v174;
      [v39 addObserver:v174 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
      [v39 addObserver:v174 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
      v173 = v38;
      if ((-[os_log_s connected](v38, "connected") & 1) != 0)
      {
        v172 = v39;
        if (BTDeviceGetComPortForServiceWithSandboxExtension( -[os_log_s device](v38, "device"),  0x2000LL,  buf,  512LL,  v186))
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
                *(_DWORD *)v184 = 138543362;
                v185 = v50;
                _os_log_impl(&dword_0, v45, v46, "%{public}@", v184, 0xCu);
              }
            }
          }

          [v39 removeObserver:v174];
          int v30 = 1;
          id v4 = v176;
          v35 = v177;
          v37 = v175;
          goto LABEL_92;
        }

        if (sandbox_extension_consume(v186) == -1)
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
                *(_DWORD *)v184 = 138543362;
                v185 = v87;
                _os_log_impl(&dword_0, v82, v83, "%{public}@", v184, 0xCu);
              }
            }
          }
        }

        int v88 = open((const char *)buf, 131074);
        v174->_comPort = v88;
        id v4 = v176;
        if ((v88 & 0x80000000) == 0)
        {
          objc_storeStrong((id *)&v174->_device, v25);
          id v171 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:v174->_comPort closeOnDealloc:1];
          v89 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:v174 fileHandle:v171];
          readerThread = v174->_readerThread;
          v174->_readerThread = v89;

          CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          v174->_safeReadBuffer = Mutable;
          if (!Mutable
            || (v92 = (NSLock *)[objc_allocWithZone(NSLock) init],
                readBufferLock = v174->_readBufferLock,
                v174->_readBufferLock = v92,
                readBufferLock,
                !v174->_readBufferLock)
            || (CFMutableDataRef v94 = CFDataCreateMutable(kCFAllocatorDefault, 0LL), (v174->_readBuffer = v94) == 0LL))
          {
            v95 = 0LL;
            goto LABEL_75;
          }

          -[SCRDFileReader start](v174->_readerThread, "start");
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothDevice name](v174->_device, "name"));
          if (([v95 isEqualToString:kSCRDEasyLinkBluetoothNameEasyLink] & 1) == 0
            && ([v95 isEqualToString:kSCRDEasyLinkBluetoothNameBraillePen] & 1) == 0)
          {
            int v121 = 0;
            v170 = v95;
            while (1)
            {
              if (v174->_modelIdentifier) {
                goto LABEL_125;
              }
              __int16 __buf = 19483;
              v174->_bluetoothChannelIsLost = 0;
              v174->_hasBeenUnloaded = 0;
              CFRunLoopRunResult v122 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
              if (v174->_bluetoothChannelIsLost || v174->_hasBeenUnloaded || v122 == kCFRunLoopRunStopped)
              {
                v154 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                unsigned __int8 v155 = [v154 ignoreLogging];

                if ((v155 & 1) != 0) {
                  goto LABEL_149;
                }
                v156 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                uint64_t v157 = AXLoggerForFacility();
                v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);

                os_log_type_t v159 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v158, v159))
                {
                  uint64_t v160 = AXColorizeFormatLog( 1LL,  @"Failed to load EasyLink braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                  v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
                  uint64_t v162 = _AXStringForArgs(v161);
                  v163 = (void *)objc_claimAutoreleasedReturnValue(v162);
                  if (os_log_type_enabled(v158, v159))
                  {
                    *(_DWORD *)v184 = 138543362;
                    v185 = v163;
                    goto LABEL_145;
                  }

                  goto LABEL_146;
                }

                goto LABEL_148;
              }

              -[NSLock lock](v174->_readBufferLock, "lock");
              CFIndex Length = CFDataGetLength(v174->_readBuffer);
              if (Length >= 1)
              {
                CFIndex v124 = Length;
                safeReadBuffer = v174->_safeReadBuffer;
                BytePtr = CFDataGetBytePtr(v174->_readBuffer);
                CFDataAppendBytes(safeReadBuffer, BytePtr, v124);
                v190.location = 0LL;
                v190.length = v124;
                CFDataDeleteBytes(v174->_readBuffer, v190);
              }

              -[NSLock unlock](v174->_readBufferLock, "unlock");
              while (1)
              {
                PacketFromBuffer = (const __CFData *)SCRDEasyLinkCreatePacketFromBuffer(v174->_safeReadBuffer);
                if (!PacketFromBuffer) {
                  break;
                }
                v128 = PacketFromBuffer;
                v129 = CFDataGetBytePtr(PacketFromBuffer);
                int v130 = *v129;
                int v131 = v129[1];
                CFRelease(v128);
                if (v130 == 76 && v131 == 12)
                {
                  v134 = @"com.apple.scrod.braille.driver.optelec.easylink.12";
                  goto LABEL_122;
                }

                if (v130 == 76 && v131 == 14)
                {
                  v134 = @"com.apple.scrod.braille.driver.harpo.braillepen.14";
LABEL_122:
                  modelIdentifier = v174->_modelIdentifier;
                  v174->_modelIdentifier = &v134->isa;

                  break;
                }
              }

              ++v121;
              id v4 = v176;
              v95 = v170;
              if (v121 == 5)
              {
                if (!v174->_modelIdentifier) {
                  goto LABEL_68;
                }
LABEL_125:
                char v179 = 1;
                __int16 __buf = 17435;
                v136 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                unsigned __int8 v137 = [v136 ignoreLogging];

                if ((v137 & 1) == 0)
                {
                  v138 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                  uint64_t v139 = AXLoggerForFacility();
                  v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);

                  os_log_type_t v141 = AXOSLogLevelFromAXLogLevel(1LL);
                  if (os_log_type_enabled(v140, v141))
                  {
                    uint64_t v142 = AXColorizeFormatLog(1LL, @"Failed to write to com port for displayOnState");
                    v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
                    uint64_t v144 = _AXStringForArgs(v143);
                    v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
                    if (os_log_type_enabled(v140, v141))
                    {
                      *(_DWORD *)v184 = 138543362;
                      v185 = v145;
                      _os_log_impl(&dword_0, v140, v141, "%{public}@", v184, 0xCu);
                    }
                  }

                  v40 = v174;
                  v95 = v170;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading EasyLink Braille Driver");
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

    *(_DWORD *)((char *)&self->_mainSize + 7) = 0;
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
  return !self->_isKeyboardOnly;
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
      v11.location = 0LL;
      v11.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v11);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  os_log_type_t v8 = self->_safeReadBuffer;
  if (self->_isKeyboardOnly) {
    uint64_t KeyboardEventsFromBuffer = SCRDEasyLinkExtractKeyboardEventsFromBuffer(v8);
  }
  else {
    uint64_t KeyboardEventsFromBuffer = SCRDEasyLinkExtractEventsFromBuffer(v8, &self->_topKeysDown, &self->_frontKeysDown);
  }
  return (id)objc_claimAutoreleasedReturnValue(KeyboardEventsFromBuffer);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  if (self->_isKeyboardOnly) {
    return 1;
  }
  if (a4 < 1)
  {
    char v9 = 0;
  }

  else
  {
    int64_t v8 = 0LL;
    char v9 = 0;
    unsigned int v10 = 1;
    do
    {
      if (a3[v8] == 27) {
        ++v9;
      }
      int64_t v8 = v10++;
    }

    while (v8 < a4);
  }

  int64_t mainSize = self->_mainSize;
  char v12 = mainSize + v9;
  size_t v13 = (mainSize + v9) + 4LL;
  v14 = (char *)malloc(v13);
  if (!v14) {
    return 0;
  }
  v15 = v14;
  if (mainSize >= a4)
  {
    if (mainSize > a4) {
      bzero(&v14[a4 + 4], mainSize - a4);
    }
    int64_t mainSize = a4;
  }

  strcpy(v15, "\x1BB");
  v15[3] = v12;
  if (mainSize >= 1)
  {
    uint64_t v16 = 0LL;
    v17 = v15 + 4;
    unsigned int v18 = 1;
    do
    {
      _BYTE *v17 = a3[v16];
      if (a3[v16] == 27)
      {
        v17[1] = 27;
        v17 += 2;
      }

      else
      {
        ++v17;
      }

      uint64_t v16 = v18;
    }

    while (mainSize > v18++);
  }

  int comPort = self->_comPort;
  BOOL v4 = comPort != -1 && write(comPort, v15, v13) == v13;
  free(v15);
  return v4;
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
  BOOL v4 = (BluetoothDevice *)objc_claimAutoreleasedReturnValue([a3 object]);
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

        BOOL v4 = v6;
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