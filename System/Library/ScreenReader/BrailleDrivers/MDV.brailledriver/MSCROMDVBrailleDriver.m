@interface MSCROMDVBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROMDVBrailleDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)_flushWriteBuffer;
- (void)dealloc;
- (void)fileReader:(id)a3 data:(const void *)a4 length:(unint64_t)a5;
- (void)removeDeviceNotification:(id)a3;
- (void)setBrailleDriverDelegate:(id)a3;
@end

@implementation MSCROMDVBrailleDriver

- (MSCROMDVBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROMDVBrailleDriver;
  result = -[MSCROMDVBrailleDriver init](&v3, "init");
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_nextWriteTime = -3061152000.0;
    result->_comPort = -1;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSCROMDVBrailleDriver;
  -[MSCROMDVBrailleDriver dealloc](&v3, "dealloc");
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
      uint64_t v11 = AXColorizeFormatLog(1LL, @"Loading MDV braille driver");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = ((uint64_t (*)(void))_AXStringForArgs)();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v226 = v14;
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
        -[MSCROMDVBrailleDriver unloadDriver](self, "unloadDriver");
      }
      v206 = self;
      v208 = (void *)objc_claimAutoreleasedReturnValue([v16 infoDictionary]);
      v207 = (void *)objc_claimAutoreleasedReturnValue([v208 objectForKey:kSCROBrailleDriverModels]);
      id v209 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 bluetoothAddress]);
      __int128 v217 = 0u;
      __int128 v218 = 0u;
      __int128 v219 = 0u;
      __int128 v220 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 pairedDevices]);

      id v21 = [v20 countByEnumeratingWithState:&v217 objects:v227 count:16];
      if (!v21)
      {
LABEL_20:

LABEL_36:
        v51 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        unsigned __int8 v52 = [v51 ignoreLogging];

        id v4 = v209;
        if ((v52 & 1) != 0)
        {
          int v30 = 1;
          v37 = v207;
          v35 = v208;
LABEL_118:

LABEL_119:
          goto LABEL_120;
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        uint64_t v56 = AXLoggerForFacility();
        id v38 = (id)objc_claimAutoreleasedReturnValue(v56);

        int v30 = 1;
        os_log_type_t v57 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = v208;
        if (!os_log_type_enabled((os_log_t)v38, v57))
        {
          v37 = v207;
LABEL_117:

          goto LABEL_118;
        }

        uint64_t v58 = AXColorizeFormatLog( 1LL,  @"Failed to load MDV braille driver because we found no matching paired device");
        uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);
        uint64_t v60 = _AXStringForArgs(v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled((os_log_t)v38, v57))
        {
          *(_DWORD *)buf = 138543362;
          v226 = v61;
          _os_log_impl(&dword_0, (os_log_t)v38, v57, "%{public}@", buf, 0xCu);
        }

        v37 = v207;
        v39 = (void *)v59;
LABEL_116:

        goto LABEL_117;
      }

      id v22 = v21;
      uint64_t v23 = *(void *)v218;
LABEL_14:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v218 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v217 + 1) + 8 * v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 address]);
        unsigned __int8 v27 = [v26 isEqualToString:v18];

        if ((v27 & 1) != 0) {
          break;
        }
        if (v22 == (id)++v24)
        {
          id v22 = [v20 countByEnumeratingWithState:&v217 objects:v227 count:16];
          if (v22) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }

      id v38 = v25;

      if (!v38) {
        goto LABEL_36;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v40 = v206;
      [v39 addObserver:v206 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
      [v39 addObserver:v206 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
      if ([v38 connected])
      {
        id v200 = v38;
        if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  buf,  512,  v224))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
          unsigned __int8 v42 = [v41 ignoreLogging];

          v35 = v208;
          if ((v42 & 1) == 0)
          {
            v201 = v39;
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
                *(_DWORD *)v222 = 138543362;
                CFRunLoopMode v223 = v50;
                _os_log_impl(&dword_0, v45, v46, "%{public}@", v222, 0xCu);
              }
            }

            v39 = v201;
          }

          [v39 removeObserver:v206];
          int v30 = 1;
          id v4 = v209;
          v37 = v207;
LABEL_115:
          id v38 = v200;
          goto LABEL_116;
        }

        v35 = v208;
        if (sandbox_extension_consume(v224) == -1)
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
              v203 = v39;
              uint64_t v84 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
              v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
              __error();
              uint64_t v86 = _AXStringForArgs(v85);
              v87 = (__CFString *)objc_claimAutoreleasedReturnValue(v86);
              if (os_log_type_enabled(v82, v83))
              {
                *(_DWORD *)v222 = 138543362;
                CFRunLoopMode v223 = v87;
                _os_log_impl(&dword_0, v82, v83, "%{public}@", v222, 0xCu);
              }

              v39 = v203;
            }
          }
        }

        int v88 = open((const char *)buf, 131074);
        v206->_comPort = v88;
        id v4 = v209;
        if ((v88 & 0x80000000) == 0)
        {
          objc_storeStrong((id *)&v206->_device, v25);
          id v89 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:v206->_comPort closeOnDealloc:1];
          v90 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:v206 fileHandle:v89];
          readerThread = v206->_readerThread;
          v206->_readerThread = v90;

          v92 = (char *)calloc(0x2AuLL, 1uLL);
          v206->_writeBuffer = v92;
          if (!v92)
          {
            v98 = 0LL;
            type = 0LL;
            v37 = v207;
            goto LABEL_103;
          }

          v204 = v39;
          CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          v206->_safeReadBuffer = Mutable;
          if (!Mutable
            || (v94 = (NSLock *)[objc_allocWithZone(NSLock) init],
                readBufferLock = v206->_readBufferLock,
                v206->_readBufferLock = v94,
                readBufferLock,
                !v206->_readBufferLock)
            || (CFMutableDataRef v96 = CFDataCreateMutable(kCFAllocatorDefault, 0LL), (v206->_readBuffer = v96) == 0LL))
          {
            v98 = 0LL;
            type = 0LL;
            v37 = v207;
            goto LABEL_103;
          }

          -[SCRDFileReader start](v206->_readerThread, "start");
          char v215 = 0;
          uint64_t v97 = SCRDMDVSerialCreateRequest(38LL, &v215, 1LL, &__nbyte);
          if (v97)
          {
            v98 = (void *)v97;
            id v193 = v89;
            uint64_t v99 = SCRDMDVSerialCreateRequest(36LL, 0LL, 0LL, &v214);
            if (!v99)
            {
              v144 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              unsigned __int8 v145 = [v144 ignoreLogging];

              if ((v145 & 1) == 0)
              {
                v155 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                uint64_t v156 = AXLoggerForFacility();
                v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);

                os_log_type_t v157 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v148, v157))
                {
                  uint64_t v158 = AXColorizeFormatLog(1LL, @"Failed to create DeviceIdentificationRequest");
                  v198 = (void *)objc_claimAutoreleasedReturnValue(v158);
                  uint64_t v159 = _AXStringForArgs(v198);
                  CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v159);
                  if (!os_log_type_enabled(v148, v157))
                  {
                    type = 0LL;
                    id v4 = v209;
                    v37 = v207;
                    goto LABEL_171;
                  }

                  *(_DWORD *)v222 = 138543362;
                  CFRunLoopMode v223 = mode;
                  _os_log_impl(&dword_0, v148, v157, "%{public}@", v222, 0xCu);
                  v152 = (__CFString *)mode;
                  type = 0LL;
                  id v4 = v209;
                  v37 = v207;
LABEL_153:
                  id v89 = v193;
                  goto LABEL_173;
                }

                type = 0LL;
                id v4 = v209;
                v37 = v207;
                goto LABEL_168;
              }

              type = 0LL;
LABEL_141:
              id v4 = v209;
              v37 = v207;
LABEL_142:
              v39 = v204;
              id v89 = v193;
              goto LABEL_103;
            }

            type = (void *)v99;
            unsigned int v100 = 0;
            UInt8 v101 = 0;
            unsigned int v102 = 0;
            v194 = v98;
            while (1)
            {
              unint64_t v103 = write(v40->_comPort, v98, __nbyte);
              if (v103 < __nbyte) {
                break;
              }
              unint64_t v104 = write(v40->_comPort, type, v214);
              if (v104 < v214)
              {
                v169 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                unsigned __int8 v170 = [v169 ignoreLogging];

                if ((v170 & 1) != 0) {
                  goto LABEL_141;
                }
                v178 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                uint64_t v179 = AXLoggerForFacility();
                v180 = (os_log_s *)objc_claimAutoreleasedReturnValue(v179);

                os_log_type_t v165 = AXOSLogLevelFromAXLogLevel(1LL);
                v148 = v180;
                if (!os_log_type_enabled(v180, v165)) {
                  goto LABEL_167;
                }
                uint64_t v181 = AXColorizeFormatLog(1LL, @"Failed to write to com port for DeviceIdentificationRequest");
                v198 = (void *)objc_claimAutoreleasedReturnValue(v181);
                uint64_t v182 = _AXStringForArgs(v198);
                CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v182);
                if (!os_log_type_enabled(v180, v165)) {
                  goto LABEL_170;
                }
                *(_DWORD *)v222 = 138543362;
                CFRunLoopMode v168 = mode;
                CFRunLoopMode v223 = mode;
LABEL_151:
                _os_log_impl(&dword_0, v148, v165, "%{public}@", v222, 0xCu);
                v152 = (__CFString *)v168;
LABEL_152:
                v35 = v208;
                id v4 = v209;
                v40 = v206;
                v37 = v207;
                goto LABEL_153;
              }

              *(_WORD *)&v40->_bluetoothChannelIsLost = 0;
              CFRunLoopRunResult v105 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.2, 0);
              if (v40->_bluetoothChannelIsLost || v40->_hasBeenUnloaded || v105 == kCFRunLoopRunStopped)
              {
                v153 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                unsigned __int8 v154 = [v153 ignoreLogging];

                if ((v154 & 1) != 0)
                {
                  id v4 = v209;
                  v37 = v207;
                  v39 = v204;
                  id v89 = v193;
                  v98 = v194;
                  goto LABEL_103;
                }

                v171 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                uint64_t v172 = AXLoggerForFacility();
                v173 = (os_log_s *)objc_claimAutoreleasedReturnValue(v172);

                os_log_type_t v174 = AXOSLogLevelFromAXLogLevel(1LL);
                CFRunLoopMode modea = (CFRunLoopMode)v173;
                if (os_log_type_enabled(v173, v174))
                {
                  uint64_t v175 = AXColorizeFormatLog( 1LL,  @"Failed to load MDV braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                  v198 = (void *)objc_claimAutoreleasedReturnValue(v175);
                  uint64_t v176 = _AXStringForArgs(v198);
                  v152 = (__CFString *)objc_claimAutoreleasedReturnValue(v176);
                  if (os_log_type_enabled(v173, v174))
                  {
                    *(_DWORD *)v222 = 138543362;
                    CFRunLoopMode v223 = v152;
                    os_log_type_t v177 = v174;
                    v148 = v173;
                    _os_log_impl(&dword_0, v173, v177, "%{public}@", v222, 0xCu);
                    v35 = v208;
                    id v4 = v209;
                    v40 = v206;
                    v37 = v207;
                    id v89 = v193;
                    v98 = v194;
                  }

                  else
                  {
                    v35 = v208;
                    id v4 = v209;
                    v40 = v206;
                    v37 = v207;
                    id v89 = v193;
                    v98 = v194;
                    v148 = (os_log_s *)modea;
                  }

                  goto LABEL_173;
                }

                v35 = v208;
                id v4 = v209;
                v37 = v207;
                v39 = v204;
                id v89 = v193;
                v98 = v194;
                v148 = (os_log_s *)modea;
                goto LABEL_174;
              }

              unsigned int v197 = v102;
              -[NSLock lock](v40->_readBufferLock, "lock");
              CFIndex Length = CFDataGetLength(v40->_readBuffer);
              if (Length >= 1)
              {
                CFIndex v107 = Length;
                safeReadBuffer = v40->_safeReadBuffer;
                BytePtr = CFDataGetBytePtr(v40->_readBuffer);
                CFDataAppendBytes(safeReadBuffer, BytePtr, v107);
                v228.location = 0LL;
                v228.length = v107;
                CFDataDeleteBytes(v40->_readBuffer, v228);
              }

              -[NSLock unlock](v40->_readBufferLock, "unlock");
              uint64_t PacketsFromBuffer = SCRDMDVSerialCreatePacketsFromBuffer(v40->_safeReadBuffer);
              v111 = (void *)objc_claimAutoreleasedReturnValue(PacketsFromBuffer);
              __int128 v210 = 0u;
              __int128 v211 = 0u;
              __int128 v212 = 0u;
              __int128 v213 = 0u;
              id v112 = [v111 countByEnumeratingWithState:&v210 objects:v221 count:16];
              if (v112)
              {
                id v113 = v112;
                char v114 = 0;
                uint64_t v115 = *(void *)v211;
                do
                {
                  for (i = 0LL; i != v113; i = (char *)i + 1)
                  {
                    if (*(void *)v211 != v115) {
                      objc_enumerationMutation(v111);
                    }
                    v117 = CFDataGetBytePtr(*(CFDataRef *)(*((void *)&v210 + 1) + 8LL * (void)i));
                    if (v117[2] == 37 && v117[3] == 6)
                    {
                      UInt8 v101 = v117[5];
                      unsigned int v100 = v117[9];
                      char v114 = 1;
                    }
                  }

                  id v113 = [v111 countByEnumeratingWithState:&v210 objects:v221 count:16];
                }

                while (v113);
              }

              else
              {
                char v114 = 0;
              }

              v35 = v208;
              v40 = v206;
              v98 = v194;
              if ((v114 & 1) == 0)
              {
                unsigned int v102 = v197 + 1;
                if (v197 < 6) {
                  continue;
                }
              }

              free(v194);
              free(type);
              v206->_mainSize = v101;
              if (v101 == 24)
              {
                uint64_t v119 = 0LL;
                __int128 v120 = xmmword_70D0;
                v118 = @"com.apple.scrod.braille.driver.mdv.mb248.24";
                uint64_t v121 = 2LL;
LABEL_157:
                v40 = v206;
                v206->_statusSize = v119;
                v206->_deviceID = v121;
                *(_OWORD *)&v206->_writeBufferSize = v120;
              }

              else
              {
                v118 = 0LL;
                if (v101 == 40)
                {
                  uint64_t v119 = 2LL * (v100 < 7);
                  __int128 v120 = xmmword_70E0;
                  v118 = @"com.apple.scrod.braille.driver.mdv.mb408l.40";
                  uint64_t v121 = 1LL;
                  goto LABEL_157;
                }
              }

              modelIdentifier = v40->_modelIdentifier;
              v40->_modelIdentifier = &v118->isa;

              uint64_t v184 = objc_claimAutoreleasedReturnValue([v207 objectForKey:v40->_modelIdentifier]);
              if (v184)
              {
                v135 = (NSLock *)v184;
                int v30 = 0;
                v40->_isDriverLoaded = 1;
                v35 = v208;
                id v4 = v209;
                v37 = v207;
                v39 = v204;
                id v89 = v193;
                goto LABEL_114;
              }

              v185 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              unsigned __int8 v186 = [v185 ignoreLogging];

              if ((v186 & 1) != 0)
              {
                v98 = 0LL;
                type = 0LL;
                v35 = v208;
                id v4 = v209;
                v40 = v206;
                v37 = v207;
                goto LABEL_142;
              }

              v187 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              uint64_t v188 = AXLoggerForFacility();
              v189 = (os_log_s *)objc_claimAutoreleasedReturnValue(v188);

              os_log_type_t v190 = AXOSLogLevelFromAXLogLevel(1LL);
              v148 = v189;
              if (os_log_type_enabled(v189, v190))
              {
                uint64_t v191 = AXColorizeFormatLog( 1LL,  @"Failed to load MDV braille driver, Unknown model identifier [%{public}@]");
                v198 = (void *)objc_claimAutoreleasedReturnValue(v191);
                uint64_t v192 = _AXStringForArgs(v198);
                CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v192);
                if (os_log_type_enabled(v189, v190))
                {
                  *(_DWORD *)v222 = 138543362;
                  CFRunLoopMode v223 = mode;
                  _os_log_impl(&dword_0, v189, v190, "%{public}@", v222, 0xCu);
                  v152 = (__CFString *)mode;
                  v98 = 0LL;
                  type = 0LL;
                  goto LABEL_152;
                }

                v98 = 0LL;
                type = 0LL;
LABEL_170:
                v35 = v208;
                id v4 = v209;
                v40 = v206;
                v37 = v207;
LABEL_171:
                id v89 = v193;
LABEL_172:
                v152 = (__CFString *)mode;
                goto LABEL_173;
              }

              v98 = 0LL;
              type = 0LL;
LABEL_167:
              v35 = v208;
              id v4 = v209;
              v40 = v206;
              v37 = v207;
LABEL_168:
              v39 = v204;
              id v89 = v193;
LABEL_174:

              goto LABEL_103;
            }

            v160 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            unsigned __int8 v161 = [v160 ignoreLogging];

            if ((v161 & 1) != 0) {
              goto LABEL_141;
            }
            v162 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            uint64_t v163 = AXLoggerForFacility();
            v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);

            os_log_type_t v165 = AXOSLogLevelFromAXLogLevel(1LL);
            v148 = v164;
            if (!os_log_type_enabled(v164, v165)) {
              goto LABEL_167;
            }
            uint64_t v166 = AXColorizeFormatLog(1LL, @"Failed to write to com port for SetACKTimeoutRequest");
            v198 = (void *)objc_claimAutoreleasedReturnValue(v166);
            uint64_t v167 = _AXStringForArgs(v198);
            CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v167);
            if (!os_log_type_enabled(v164, v165)) {
              goto LABEL_170;
            }
            *(_DWORD *)v222 = 138543362;
            CFRunLoopMode v168 = mode;
            CFRunLoopMode v223 = mode;
            goto LABEL_151;
          }

          id v141 = v89;
          v142 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
          unsigned __int8 v143 = [v142 ignoreLogging];

          if ((v143 & 1) == 0)
          {
            v146 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            uint64_t v147 = AXLoggerForFacility();
            v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);

            os_log_type_t v149 = AXOSLogLevelFromAXLogLevel(1LL);
            if (os_log_type_enabled(v148, v149))
            {
              uint64_t v150 = AXColorizeFormatLog(1LL, @"Failed to create SetACKTimeoutRequest");
              v198 = (void *)objc_claimAutoreleasedReturnValue(v150);
              uint64_t v151 = _AXStringForArgs(v198);
              CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v151);
              if (!os_log_type_enabled(v148, v149))
              {
                type = 0LL;
                id v4 = v209;
                v37 = v207;
                id v89 = v141;
                v98 = 0LL;
                goto LABEL_172;
              }

              *(_DWORD *)v222 = 138543362;
              CFRunLoopMode v223 = mode;
              _os_log_impl(&dword_0, v148, v149, "%{public}@", v222, 0xCu);
              v152 = (__CFString *)mode;
              type = 0LL;
              id v4 = v209;
              v37 = v207;
              id v89 = v141;
              v98 = 0LL;
LABEL_173:

              v39 = v204;
            }

            else
            {
              type = 0LL;
              id v4 = v209;
              v37 = v207;
              v39 = v204;
              id v89 = v141;
              v98 = 0LL;
            }

            goto LABEL_174;
          }

          type = 0LL;
          id v4 = v209;
          v37 = v207;
          id v89 = v141;
          v98 = 0LL;
LABEL_103:
          -[SCRDFileReader invalidate](v40->_readerThread, "invalidate");
          v132 = v40->_readerThread;
          v40->_readerThread = 0LL;

          v133 = v40->_safeReadBuffer;
          if (v133)
          {
            CFRelease(v133);
            v40->_safeReadBuffer = 0LL;
          }

          [v39 removeObserver:v40];
          -[NSLock lock](v40->_readBufferLock, "lock");
          readBuffer = v40->_readBuffer;
          if (readBuffer)
          {
            CFRelease(readBuffer);
            v40->_readBuffer = 0LL;
          }

          v135 = v40->_readBufferLock;
          v136 = v40->_readBufferLock;
          v40->_readBufferLock = 0LL;

          -[NSLock unlock](v135, "unlock");
          device = v40->_device;
          v40->_device = 0LL;

          v40->_comPort = -1;
          if (type) {
            free(type);
          }
          if (v98) {
            free(v98);
          }
          writeBuffer = v40->_writeBuffer;
          if (writeBuffer)
          {
            free(writeBuffer);
            v40->_writeBuffer = 0LL;
          }

          v139 = v40->_modelIdentifier;
          v40->_modelIdentifier = 0LL;

          int v30 = 2;
LABEL_114:

          goto LABEL_115;
        }

        v122 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        unsigned __int8 v123 = [v122 ignoreLogging];

        id v38 = v200;
        if ((v123 & 1) == 0)
        {
          v205 = v39;
          v124 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
          uint64_t v125 = AXLoggerForFacility();
          v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);

          os_log_type_t v127 = AXOSLogLevelFromAXLogLevel(1LL);
          if (os_log_type_enabled(v126, v127))
          {
            uint64_t v128 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
            v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
            uint64_t v130 = _AXStringForArgs(v129);
            v131 = (__CFString *)objc_claimAutoreleasedReturnValue(v130);
            if (os_log_type_enabled(v126, v127))
            {
              *(_DWORD *)v222 = 138543362;
              CFRunLoopMode v223 = v131;
              _os_log_impl(&dword_0, v126, v127, "%{public}@", v222, 0xCu);
            }

            id v38 = v200;
          }

          v39 = v205;
        }

        v206->_comPort = -1;
      }

      else
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        unsigned __int8 v68 = [v67 ignoreLogging];

        v35 = v208;
        if ((v68 & 1) == 0)
        {
          v202 = v39;
          v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
          uint64_t v70 = AXLoggerForFacility();
          v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);

          os_log_type_t v72 = AXOSLogLevelFromAXLogLevel(1LL);
          if (os_log_type_enabled(v71, v72))
          {
            id v73 = v38;
            uint64_t v74 = AXColorizeFormatLog( 1LL,  @"Failed to load MDV braille driver because the device is no longer connected over bluetooth.");
            v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
            uint64_t v76 = _AXStringForArgs(v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled(v71, v72))
            {
              *(_DWORD *)buf = 138543362;
              v226 = v77;
              _os_log_impl(&dword_0, v71, v72, "%{public}@", buf, 0xCu);
            }

            id v38 = v73;
          }

          v39 = v202;
        }
      }

      [v39 removeObserver:v206];
      int v30 = 1;
      id v4 = v209;
      v37 = v207;
      goto LABEL_116;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    unsigned __int8 v54 = [v53 ignoreLogging];

    if ((v54 & 1) == 0)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      uint64_t v63 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v63);

      int v30 = 1;
      os_log_type_t v64 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v35, v64))
      {
LABEL_120:

        goto LABEL_121;
      }

      uint64_t v65 = AXColorizeFormatLog(1LL, @"Failed to load MDV braille driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v65);
      uint64_t v66 = _AXStringForArgs(v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled((os_log_t)v35, v64))
      {
        *(_DWORD *)buf = 138543362;
        v226 = v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v64, "%{public}@", buf, 0xCu);
      }

      goto LABEL_118;
    }

    int v30 = 1;
LABEL_121:

    goto LABEL_122;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
  unsigned __int8 v29 = [v28 ignoreLogging];

  if ((v29 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
    uint64_t v32 = AXLoggerForFacility();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v32);

    int v30 = 1;
    os_log_type_t v33 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled((os_log_t)v16, v33))
    {
      uint64_t v34 = AXColorizeFormatLog( 1LL,  @"Failed to load MDV braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      uint64_t v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v226 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

      goto LABEL_119;
    }

    goto LABEL_121;
  }

  int v30 = 1;
LABEL_122:

  return v30;
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
      uint64_t v9 = AXColorizeFormatLog(1LL, @"Unloading MDV Braille Driver");
      os_log_type_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v24 = 138543362;
        v25 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v24, 0xCu);
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
    queuedMainCellsBuffer = self->_queuedMainCellsBuffer;
    if (queuedMainCellsBuffer)
    {
      CFRelease(queuedMainCellsBuffer);
      self->_queuedMainCellsBuffer = 0LL;
    }

    writeBuffer = self->_writeBuffer;
    if (writeBuffer)
    {
      free(writeBuffer);
      self->_writeBuffer = 0LL;
    }

    self->_writeBufferNeedsFlush = 0;
    self->_nextWriteTime = -3061152000.0;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0LL;

    self->_mainSize = 0LL;
    self->_statusSize = 0LL;
    self->_isShiftKeyDown = 0;
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
  return 0;
}

- (int)brailleInputMode
{
  return 2 * (self->_deviceID == 2);
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return self->_statusSize;
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
  return (id)SCRDMDVSerialExtractEventsFromBuffer(self->_safeReadBuffer, &self->_isShiftKeyDown, self->_deviceID);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  if (a4 >= 1)
  {
    v7 = &self->_writeBuffer[self->_writeBufferStatusCellOffset];
    int64_t v8 = a4;
    do
    {
      unsigned int v9 = *(unsigned __int8 *)a3++;
      *v7++ = SCRDMDVConvertStandardCellToMDVCell(v9, a2);
      --v8;
    }

    while (v8);
  }

  int64_t mainSize = self->_mainSize;
  if (mainSize > a4) {
    bzero(&self->_writeBuffer[a4 + self->_writeBufferStatusCellOffset], mainSize - a4);
  }
  self->_writeBufferNeedsFlush = 1;
  -[MSCROMDVBrailleDriver _flushWriteBuffer](self, "_flushWriteBuffer");
  return 1;
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  if (a4 >= 1)
  {
    for (uint64_t i = 0LL; i != a4; ++i)
      self->_writeBuffer[i] = SCRDMDVConvertStandardCellToMDVCell(a3[i], a2);
  }

  int64_t statusSize = self->_statusSize;
  if (statusSize > a4) {
    bzero(&self->_writeBuffer[a4], statusSize - a4);
  }
  self->_writeBufferNeedsFlush = 1;
  -[MSCROMDVBrailleDriver _flushWriteBuffer](self, "_flushWriteBuffer");
  return 1;
}

- (void)_flushWriteBuffer
{
  if (self->_writeBufferNeedsFlush)
  {
    double nextWriteTime = self->_nextWriteTime;
    if (nextWriteTime < CFAbsoluteTimeGetCurrent())
    {
      uint64_t v4 = SCRDMDVSerialCreateRequest(0LL, self->_writeBuffer, LOBYTE(self->_writeBufferSize), &__nbyte);
      if (v4)
      {
        CFIndex v5 = (void *)v4;
        int comPort = self->_comPort;
        if (comPort != -1)
        {
          ssize_t v7 = write(comPort, v5, __nbyte);
          if (v7 == __nbyte) {
            self->_writeBufferNeedsFlush = 0;
          }
        }

        self->_double nextWriteTime = CFAbsoluteTimeGetCurrent() + 0.005;
        free(v5);
      }
    }
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
  uint64_t v4 = (BluetoothDevice *)objc_claimAutoreleasedReturnValue([a3 object]);
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

        uint64_t v4 = v6;
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