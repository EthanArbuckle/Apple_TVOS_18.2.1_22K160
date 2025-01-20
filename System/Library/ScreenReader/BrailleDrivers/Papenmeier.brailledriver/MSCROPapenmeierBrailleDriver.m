@interface MSCROPapenmeierBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROPapenmeierBrailleDriver)init;
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

@implementation MSCROPapenmeierBrailleDriver

- (MSCROPapenmeierBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROPapenmeierBrailleDriver;
  result = -[MSCROPapenmeierBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROPapenmeierBrailleDriver;
  -[MSCROPapenmeierBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading Papenmeier braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v197 = v14;
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
        -[MSCROPapenmeierBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v184 = self;
      v185 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      id v186 = v4;
      v187 = (void *)objc_claimAutoreleasedReturnValue([v185 objectForKey:kSCROBrailleDriverModels]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v189 = 0u;
      __int128 v190 = 0u;
      __int128 v191 = 0u;
      __int128 v192 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v189 objects:v198 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v190;
        while (2)
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v190 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v189 + 1) + 8LL * (void)i);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
            unsigned __int8 v27 = [v26 isEqualToString:v18];

            if ((v27 & 1) != 0)
            {
              v38 = v25;

              if (v38)
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
                v40 = v184;
                [v39 addObserver:v184 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                [v39 addObserver:v184 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                v183 = v38;
                if ((-[os_log_s connected](v38, "connected") & 1) == 0)
                {
                  v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  unsigned __int8 v70 = [v69 ignoreLogging];

                  if ((v70 & 1) == 0)
                  {
                    v71 = v39;
                    v72 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    uint64_t v73 = AXLoggerForFacility();
                    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);

                    os_log_type_t v75 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v74, v75))
                    {
                      uint64_t v76 = AXColorizeFormatLog( 1LL,  @"Failed to load Papenmeier braille driver because the device is no longer connected over bluetooth.");
                      v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
                      uint64_t v78 = _AXStringForArgs(v77);
                      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
                      if (os_log_type_enabled(v74, v75))
                      {
                        *(_DWORD *)buf = 138543362;
                        v197 = v79;
                        _os_log_impl(&dword_0, v74, v75, "%{public}@", buf, 0xCu);
                      }
                    }

                    v39 = v71;
                  }

                  [v39 removeObserver:v184];
                  int v30 = 1;
                  v35 = (os_log_s *)v185;
                  id v4 = v186;
                  v37 = v187;
                  goto LABEL_108;
                }

                if (BTDeviceGetComPortForServiceWithSandboxExtension( -[os_log_s device](v38, "device"),  0x2000LL,  buf,  512LL,  v195))
                {
                  v41 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  unsigned __int8 v42 = [v41 ignoreLogging];

                  if ((v42 & 1) == 0)
                  {
                    v43 = v39;
                    v44 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    uint64_t v45 = AXLoggerForFacility();
                    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);

                    os_log_type_t v47 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v46, v47))
                    {
                      uint64_t v48 = AXColorizeFormatLog(1LL, @"Failed to open bt com port - BTError [%ld]");
                      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                      uint64_t v50 = _AXStringForArgs(v49);
                      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                      if (os_log_type_enabled(v46, v47))
                      {
                        *(_DWORD *)v193 = 138543362;
                        v194 = v51;
                        _os_log_impl(&dword_0, v46, v47, "%{public}@", v193, 0xCu);
                      }
                    }

                    v39 = v43;
                  }

                  [v39 removeObserver:v184];
                }

                else
                {
                  if (sandbox_extension_consume(v195) == -1)
                  {
                    v80 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    unsigned __int8 v81 = [v80 ignoreLogging];

                    if ((v81 & 1) == 0)
                    {
                      v82 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      uint64_t v83 = AXLoggerForFacility();
                      v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);

                      os_log_type_t v85 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v84, v85))
                      {
                        v86 = v39;
                        uint64_t v87 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                        v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
                        __error();
                        uint64_t v89 = _AXStringForArgs(v88);
                        v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
                        if (os_log_type_enabled(v84, v85))
                        {
                          *(_DWORD *)v193 = 138543362;
                          v194 = v90;
                          _os_log_impl(&dword_0, v84, v85, "%{public}@", v193, 0xCu);
                        }

                        v39 = v86;
                      }
                    }
                  }

                  int v91 = open((const char *)buf, 131074);
                  v184->_comPort = v91;
                  if ((v91 & 0x80000000) == 0)
                  {
                    v182 = v39;
                    objc_storeStrong((id *)&v184->_device, v25);
                    id v92 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:v184->_comPort closeOnDealloc:1];
                    v93 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:v184 fileHandle:v92];
                    readerThread = v184->_readerThread;
                    v184->_readerThread = v93;

                    CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                    v184->_safeReadBuffer = Mutable;
                    if (Mutable)
                    {
                      v96 = (NSLock *)[objc_allocWithZone(NSLock) init];
                      readBufferLock = v184->_readBufferLock;
                      v184->_readBufferLock = v96;

                      if (v184->_readBufferLock)
                      {
                        CFMutableDataRef v98 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                        v184->_readBuffer = v98;
                        if (v98)
                        {
                          uint64_t v99 = SCRDPapenmeierCreateIdentityRequestBuffer(&__nbyte);
                          if (v99)
                          {
                            v100 = (void *)v99;
                            -[SCRDFileReader start](v184->_readerThread, "start");
                            unsigned int v101 = 0;
                            v102 = kCFRunLoopDefaultMode;
                            while (1)
                            {
                              ssize_t v103 = write(v184->_comPort, v100, __nbyte);
                              v184->_bluetoothChannelIsLost = 0;
                              v184->_hasBeenUnloaded = 0;
                              CFRunLoopRunResult v104 = CFRunLoopRunInMode(v102, 0.1, 0);
                              if (v184->_bluetoothChannelIsLost
                                || v184->_hasBeenUnloaded
                                || v104 == kCFRunLoopRunStopped)
                              {
                                break;
                              }

                              -[NSLock lock](v184->_readBufferLock, "lock");
                              CFIndex Length = CFDataGetLength(v184->_readBuffer);
                              if (Length >= 1)
                              {
                                CFIndex v106 = Length;
                                v107 = v102;
                                safeReadBuffer = v184->_safeReadBuffer;
                                BytePtr = CFDataGetBytePtr(v184->_readBuffer);
                                v110 = safeReadBuffer;
                                v102 = v107;
                                CFDataAppendBytes(v110, BytePtr, v106);
                                v199.location = 0LL;
                                v199.length = v106;
                                CFDataDeleteBytes(v184->_readBuffer, v199);
                              }

                              -[NSLock unlock](v184->_readBufferLock, "unlock");
                              uint64_t PacketFromBuffer = SCRDPapenmeierCreatePacketFromBuffer(v184->_safeReadBuffer);
                              if (PacketFromBuffer)
                              {
                                uint64_t v112 = PacketFromBuffer;
                                while (*(_BYTE *)v112 != 10 || *(_WORD *)(v112 + 2) != 5)
                                {
                                  SCRDPapenmeierReleasePacket(v112);
                                  uint64_t v112 = SCRDPapenmeierCreatePacketFromBuffer(v184->_safeReadBuffer);
                                  if (!v112) {
                                    goto LABEL_80;
                                  }
                                }

                                id v125 = v92;
                                if (v126 > 98)
                                {
                                  if (v126 == 99)
                                  {
                                    v127 = @"com.apple.scrod.braille.driver.papenmeier.braillex.live.plus";
                                  }

                                  else
                                  {
                                    if (v126 != 100) {
                                      goto LABEL_130;
                                    }
                                    v127 = @"com.apple.scrod.braille.driver.papenmeier.braillex.live.20";
                                  }
                                }

                                else
                                {
                                  if (v126 != 89)
                                  {
                                    if (v126 == 98)
                                    {
                                      v127 = @"com.apple.scrod.braille.driver.papenmeier.braillex.live";
                                      goto LABEL_129;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading Papenmeier Braille Driver");
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
    keysDownBuffer = self->_keysDownBuffer;
    if (keysDownBuffer)
    {
      free(keysDownBuffer);
      self->_keysDownBuffer = 0LL;
    }
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
  return (id)SCRDPapenmeierExtractEventsFromBuffer( self->_safeReadBuffer,  self->_deviceID,  self->_keysDownBuffer);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  uint64_t v5 = SCRDPapenmeierCreateBrailleBufferB(a3, a4, LOBYTE(self->_mainSize), 0LL, 0LL, 0LL, &__nbyte);
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
    ssize_t v8 = write(comPort, v6, __nbyte);
    BOOL v9 = v8 == __nbyte;
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