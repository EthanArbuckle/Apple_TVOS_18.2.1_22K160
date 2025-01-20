@interface MSCROKGSBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROKGSBrailleDriver)init;
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

@implementation MSCROKGSBrailleDriver

- (MSCROKGSBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROKGSBrailleDriver;
  result = -[MSCROKGSBrailleDriver init](&v3, "init");
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
  v3.super_class = (Class)&OBJC_CLASS___MSCROKGSBrailleDriver;
  -[MSCROKGSBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading KGS braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        int buf = 138543362;
        v239 = v14;
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
        -[MSCROKGSBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v224 = self;
      v225 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v226 = (void *)objc_claimAutoreleasedReturnValue([v225 objectForKey:kSCROBrailleDriverModels]);
      id v227 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v231 = 0u;
      __int128 v232 = 0u;
      __int128 v233 = 0u;
      __int128 v234 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v231 objects:v240 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v232;
LABEL_14:
        uint64_t v24 = 0LL;
        while (1)
        {
          if (*(void *)v232 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v231 + 1) + 8 * v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
          unsigned __int8 v27 = [v26 isEqualToString:v18];

          if ((v27 & 1) != 0) {
            break;
          }
          if (v22 == (id)++v24)
          {
            id v22 = [v20 countByEnumeratingWithState:&v231 objects:v240 count:16];
            if (!v22) {
              goto LABEL_20;
            }
            goto LABEL_14;
          }
        }

        id v38 = v25;

        if (v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
          v40 = v224;
          [v39 addObserver:v224 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
          v223 = v39;
          [v39 addObserver:v224 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
          if (([v38 connected] & 1) == 0)
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            unsigned __int8 v68 = [v67 ignoreLogging];

            v35 = v225;
            if ((v68 & 1) == 0)
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              uint64_t v70 = AXLoggerForFacility();
              v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);

              os_log_type_t v72 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v71, v72))
              {
                id v73 = v38;
                uint64_t v74 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver because the device is no longer connected over bluetooth.");
                v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                uint64_t v76 = _AXStringForArgs(v75);
                v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
                if (os_log_type_enabled(v71, v72))
                {
                  int buf = 138543362;
                  v239 = v77;
                  _os_log_impl(&dword_0, v71, v72, "%{public}@", (uint8_t *)&buf, 0xCu);
                }

                id v38 = v73;
              }
            }

            goto LABEL_88;
          }

          v222 = v38;
          if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  &buf,  512,  v237))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            unsigned __int8 v42 = [v41 ignoreLogging];

            v35 = v225;
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
                  *(_DWORD *)v235 = 138543362;
                  uint64_t v236 = (uint64_t)v50;
                  _os_log_impl(&dword_0, v45, v46, "%{public}@", v235, 0xCu);
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading KGS Braille Driver");
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

    self->_int comPort = -1;
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
  return 1;
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
      v17.location = 0LL;
      v17.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v17);
    }
  }

  -[NSLock unlock](self->_readBufferLock, "unlock");
  uint64_t v8 = SCRDKGSExtractEventsFromBuffer(self->_safeReadBuffer);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_log_type_t v10 = v9;
  if (v9 && [v9 count])
  {
    id v11 = [v10 mutableCopy];
    uint64_t v12 = _SCROD_LOG([v11 removeObjectsInArray:&off_87D0]);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "KGS Driver: got input events %@", (uint8_t *)&v15, 0xCu);
    }
  }

  return v10;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  int64_t mainSize = self->_mainSize;
  if (mainSize >= a4) {
    size_t v8 = a4;
  }
  else {
    size_t v8 = self->_mainSize;
  }
  memcpy((char *)&v17 - ((mainSize + 15) & 0xFFFFFFFFFFFFFFF0LL), a3, v8);
  if (mainSize > a4) {
    bzero((char *)&v17 + a4 - ((mainSize + 15) & 0xFFFFFFFFFFFFFFF0LL), mainSize - a4);
  }
  SCRDKGSConvertBrailleCellsToKGSOrder( (char *)&v17 - ((mainSize + 15) & 0xFFFFFFFFFFFFFFF0LL),  mainSize);
  uint64_t v9 = (const __CFData *)SCRDKGSCreateCommandPacket( 49LL,  0LL,  (char *)&v17 - ((mainSize + 15) & 0xFFFFFFFFFFFFFFF0LL),  LOWORD(self->_mainSize));
  if (!v9) {
    return 0;
  }
  os_log_type_t v10 = v9;
  int comPort = self->_comPort;
  if (comPort == -1)
  {
    BOOL v15 = 0;
  }

  else
  {
    BytePtr = CFDataGetBytePtr(v9);
    size_t Length = CFDataGetLength(v10);
    ssize_t v14 = write(comPort, BytePtr, Length);
    BOOL v15 = v14 == CFDataGetLength(v10);
  }

  CFRelease(v10);
  return v15;
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