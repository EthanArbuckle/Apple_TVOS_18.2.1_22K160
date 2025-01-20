void _MSCRODebugAbortPrint(uint64_t a1, uint64_t a2, id a3)
{
  void *v3;
  id v4;
  v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"===================================\nVoiceOver Error: %s:%d\nError: %s\nBreak on _MSCRODebugAbortPrint to debug\n", a1, a2, [a3 cStringUsingEncoding:4]));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"VoiceOver Debug Abort",  v4,  0LL));
  [v3 raise];
}

void _MSCROLogPrint(uint64_t a1)
{
}

uint64_t MSCROBTOpenComPort(void *a1, int *a2)
{
  id v3 = a1;
  double Current = CFAbsoluteTimeGetCurrent();
  if (CFAbsoluteTimeGetCurrent() - Current >= 2.0)
  {
    uint64_t v10 = 1LL;
LABEL_9:
    uint64_t v11 = AXLogBrailleHW();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v10;
    v13 = "Failed to open bt com port - BTError [%ld]";
    goto LABEL_11;
  }

  *(void *)&__int128 v5 = 134217984LL;
  __int128 v22 = v5;
  while (1)
  {
    int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension( objc_msgSend(v3, "device", v22),  0x2000,  v26,  512,  v25);
    if (!ComPortForServiceWithSandboxExtension) {
      break;
    }
    int v7 = ComPortForServiceWithSandboxExtension;
    uint64_t v8 = AXLogBrailleHW();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v22;
      uint64_t v24 = v7;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to open bt com port - BTError [%ld] retry mode",  buf,  0xCu);
    }

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.5);
    if (CFAbsoluteTimeGetCurrent() - Current >= 2.0)
    {
      uint64_t v10 = v7;
      goto LABEL_9;
    }
  }

  +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.5);
  if (sandbox_extension_consume(v25) == -1)
  {
    uint64_t v16 = AXLogBrailleHW();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *__error();
      *(_DWORD *)buf = v22;
      uint64_t v24 = v18;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to consume BT com port sandbox extension [%ld]",  buf,  0xCu);
    }
  }

  int v19 = open(v26, 131074);
  *a2 = v19;
  if ((v19 & 0x80000000) == 0)
  {
    uint64_t v14 = 0LL;
    goto LABEL_13;
  }

  uint64_t v20 = AXLogBrailleHW();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *a2;
    *(_DWORD *)buf = v22;
    uint64_t v24 = v21;
    v13 = "Failed to open com port [%ld]";
LABEL_11:
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
  }

LABEL_12:
  uint64_t v14 = 1LL;
LABEL_13:

  return v14;
}

LABEL_88:
            v59 = v223;
            [v223 removeObserver:v224];
            v30 = 1;
            v37 = v226;
            v4 = v227;
            goto LABEL_89;
          }

          v35 = v225;
          if (sandbox_extension_consume(v237) == -1)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v79 = [v78 ignoreLogging];

            if ((v79 & 1) == 0)
            {
              v80 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v81 = AXLoggerForFacility();
              v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);

              v83 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v82, v83))
              {
                v84 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
                __error();
                v86 = _AXStringForArgs(v85);
                v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
                if (os_log_type_enabled(v82, v83))
                {
                  *(_DWORD *)v235 = 138543362;
                  v236 = (uint64_t)v87;
                  _os_log_impl(&dword_0, v82, v83, "%{public}@", v235, 0xCu);
                }
              }
            }
          }

          v88 = open((const char *)&buf, 131074);
          v224->_comPort = v88;
          v4 = v227;
          if (v88 < 0)
          {
            v112 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v113 = [v112 ignoreLogging];

            v38 = v222;
            if ((v113 & 1) == 0)
            {
              v114 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v115 = AXLoggerForFacility();
              v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);

              v117 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v116, v117))
              {
                v118 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
                v120 = _AXStringForArgs(v119);
                v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
                if (os_log_type_enabled(v116, v117))
                {
                  *(_DWORD *)v235 = 138543362;
                  v236 = (uint64_t)v121;
                  _os_log_impl(&dword_0, v116, v117, "%{public}@", v235, 0xCu);
                }

                v38 = v222;
              }
            }

            v224->_comPort = -1;
            goto LABEL_88;
          }

          objc_storeStrong((id *)&v224->_device, v25);
          v89 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:v224->_comPort closeOnDealloc:1];
          v90 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:v224 fileHandle:v89];
          readerThread = v224->_readerThread;
          v224->_readerThread = v90;

          Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          v224->_safeReadBuffer = Mutable;
          v38 = v222;
          v219 = v89;
          if (!Mutable)
          {
            v123 = 0LL;
            v220 = 0LL;
            theData = 0LL;
            goto LABEL_98;
          }

          v93 = (NSLock *)[objc_allocWithZone(NSLock) init];
          readBufferLock = v224->_readBufferLock;
          v224->_readBufferLock = v93;

          v59 = v223;
          if (!v224->_readBufferLock
            || (v95 = CFDataCreateMutable(kCFAllocatorDefault, 0LL), (v224->_readBuffer = v95) == 0LL))
          {
            v123 = 0LL;
            v220 = 0LL;
            theData = 0LL;
            v37 = v226;
            goto LABEL_188;
          }

          -[SCRDFileReader start](v224->_readerThread, "start");
          v96 = (const __CFData *)SCRDKGSCreateCommandPacket(17LL, 0LL, 0LL, 0LL);
          if (!v96)
          {
            v124 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v125 = [v124 ignoreLogging];

            if ((v125 & 1) != 0) {
              goto LABEL_100;
            }
            v128 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            v129 = AXLoggerForFacility();
            v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);

            v131 = AXOSLogLevelFromAXLogLevel(1LL);
            mode = (__CFString *)v130;
            if (os_log_type_enabled(v130, v131))
            {
              v132 = AXColorizeFormatLog(1LL, @"Failed to create lineSizeRequest");
              v217 = objc_claimAutoreleasedReturnValue(v132);
              v133 = _AXStringForArgs(v217);
              v134 = objc_claimAutoreleasedReturnValue(v133);
              if (os_log_type_enabled(v130, v131))
              {
                *(_DWORD *)v235 = 138543362;
                v236 = v134;
                _os_log_impl(&dword_0, v130, v131, "%{public}@", v235, 0xCu);
              }

              v123 = 0LL;
              v220 = 0LL;
              theData = 0LL;
              v37 = v226;
              v4 = v227;
              v135 = (void *)v134;
              goto LABEL_108;
            }

            v123 = 0LL;
            theData = 0LL;
            goto LABEL_127;
          }

          theData = v96;
          Length = CFDataGetLength(v96);
          v98 = 0;
          buffer = 0;
          while (1)
          {
            comPort = v224->_comPort;
            BytePtr = CFDataGetBytePtr(theData);
            if (write(comPort, BytePtr, Length) < Length)
            {
              v137 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v138 = [v137 ignoreLogging];

              if ((v138 & 1) != 0)
              {
                v123 = 0LL;
                goto LABEL_111;
              }

              v146 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v147 = AXLoggerForFacility();
              v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);

              v149 = AXOSLogLevelFromAXLogLevel(1LL);
              mode = (__CFString *)v148;
              if (os_log_type_enabled(v148, v149))
              {
                v150 = AXColorizeFormatLog(1LL, @"Failed to write to com port for lineSizeRequest");
                v217 = objc_claimAutoreleasedReturnValue(v150);
                v151 = _AXStringForArgs(v217);
                v215 = objc_claimAutoreleasedReturnValue(v151);
                if (!os_log_type_enabled(v148, v149))
                {
                  v123 = 0LL;
                  v220 = 0LL;
                  v37 = v226;
                  v4 = v227;
                  goto LABEL_185;
                }

                *(_DWORD *)v235 = 138543362;
                v236 = v215;
                _os_log_impl(&dword_0, v148, v149, "%{public}@", v235, 0xCu);
                v135 = (void *)v215;
                v123 = 0LL;
                v220 = 0LL;
                v37 = v226;
                v4 = v227;
                goto LABEL_108;
              }

              v123 = 0LL;
LABEL_127:
              v220 = 0LL;
              v37 = v226;
              v4 = v227;
              v59 = v223;
              goto LABEL_187;
            }

            v224->_bluetoothChannelIsLost = 0;
            v224->_hasBeenUnloaded = 0;
            v101 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
            if (v224->_bluetoothChannelIsLost || v224->_hasBeenUnloaded || v101 == kCFRunLoopRunStopped)
            {
              v126 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v127 = [v126 ignoreLogging];

              if ((v127 & 1) != 0)
              {
                v123 = 0LL;
                v220 = 0LL;
                v37 = v226;
                v4 = v227;
LABEL_103:
                v38 = v222;
                v59 = v223;
                goto LABEL_188;
              }

              v139 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v140 = AXLoggerForFacility();
              v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);

              v142 = AXOSLogLevelFromAXLogLevel(1LL);
              mode = (__CFString *)v141;
              if (os_log_type_enabled(v141, v142))
              {
                v143 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                v136 = (void *)objc_claimAutoreleasedReturnValue(v143);
                v144 = _AXStringForArgs(v136);
                v145 = objc_claimAutoreleasedReturnValue(v144);
                if (os_log_type_enabled(v141, v142))
                {
                  *(_DWORD *)v235 = 138543362;
                  v236 = v145;
                  _os_log_impl(&dword_0, v141, v142, "%{public}@", v235, 0xCu);
                }

                v123 = 0LL;
                v220 = 0LL;
                v37 = v226;
                v4 = v227;
                v38 = v222;
                v135 = (void *)v145;
LABEL_116:
                v59 = v223;
                goto LABEL_186;
              }

              v123 = 0LL;
              v220 = 0LL;
              v37 = v226;
              v4 = v227;
LABEL_182:
              v38 = v222;
              v59 = v223;
              goto LABEL_187;
            }

            -[NSLock lock](v224->_readBufferLock, "lock");
            v102 = CFDataGetLength(v224->_readBuffer);
            if (v102 >= 1)
            {
              v103 = v102;
              safeReadBuffer = v224->_safeReadBuffer;
              v105 = CFDataGetBytePtr(v224->_readBuffer);
              CFDataAppendBytes(safeReadBuffer, v105, v103);
              v241.location = 0LL;
              v241.length = v103;
              CFDataDeleteBytes(v224->_readBuffer, v241);
            }

            -[NSLock unlock](v224->_readBufferLock, "unlock");
            v106 = CFDataGetLength(v224->_safeReadBuffer);
            v107 = v106;
            v38 = v222;
            if (v106 == 1)
            {
              v242.location = 0LL;
              v242.length = 1LL;
              CFDataGetBytes(v224->_safeReadBuffer, v242, &buffer);
            }

            else if (v106 < 1)
            {
              goto LABEL_77;
            }

            v243.location = 0LL;
            v243.length = v107;
            CFDataDeleteBytes(v224->_safeReadBuffer, v243);
LABEL_77:
            if (v98 <= 3)
            {
              ++v98;
              if (!buffer) {
                continue;
              }
            }

            CFRelease(theData);
            v108 = (void *)objc_claimAutoreleasedReturnValue([v222 name]);
            v109 = [v108 hasPrefix:@"BM-NextTouch40"];

            if (v109)
            {
              modelIdentifier = v224->_modelIdentifier;
              v111 = @"com.apple.scrod.braille.driver.kgs.bm.next.touch.40";
            }

            else
            {
              switch(buffer)
              {
                case 0x28u:
                  v111 = @"com.apple.scrod.braille.driver.kgs.braille.memo.40";
                  break;
                case 0x20u:
                  v111 = @"com.apple.scrod.braille.driver.kgs.braille.memo.32";
                  break;
                case 0x10u:
                  v111 = @"com.apple.scrod.braille.driver.kgs.braille.memo.16";
                  break;
                default:
                  v111 = 0LL;
                  break;
              }

              modelIdentifier = v224->_modelIdentifier;
            }

            v224->_modelIdentifier = &v111->isa;

            v152 = objc_claimAutoreleasedReturnValue([v226 objectForKey:v224->_modelIdentifier]);
            if (v152)
            {
              v220 = (void *)v152;
              v229 = 0;
              v153 = (const __CFData *)SCRDKGSCreateCommandPacket(32LL, 0LL, &v229, 2LL);
              if (v153)
              {
                v123 = v153;
                v154 = CFDataGetLength(v153);
                v155 = 0;
                v228 = 0;
                while (1)
                {
                  v156 = v224->_comPort;
                  v157 = CFDataGetBytePtr(v123);
                  if (write(v156, v157, v154) < v154)
                  {
                    v190 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v191 = [v190 ignoreLogging];

                    if ((v191 & 1) == 0)
                    {
                      v192 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v193 = AXLoggerForFacility();
                      v194 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);

                      v195 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v194, v195))
                      {
                        v196 = AXColorizeFormatLog(1LL, @"Failed to write to com port for displayModeRequest");
                        v197 = (void *)objc_claimAutoreleasedReturnValue(v196);
                        v198 = _AXStringForArgs(v197);
                        v199 = (void *)objc_claimAutoreleasedReturnValue(v198);
                        if (os_log_type_enabled(v194, v195))
                        {
                          *(_DWORD *)v235 = 138543362;
                          v236 = (uint64_t)v199;
                          _os_log_impl(&dword_0, v194, v195, "%{public}@", v235, 0xCu);
                        }
                      }
                    }

LABEL_167:
                    CFRelease(v123);
                    if (v228)
                    {
                      v200 = (void *)objc_claimAutoreleasedReturnValue([v220 objectForKey:kSCROBrailleDriverMainDisplaySize]);
                      v224->_mainSize = [v200 unsignedCharValue];

                      v30 = 0;
                      v224->_isDriverLoaded = 1;
                      v37 = v226;
                      v4 = v227;
                      v35 = v225;
                      v38 = v222;
                      v59 = v223;
                      goto LABEL_197;
                    }

                    v201 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v202 = [v201 ignoreLogging];

                    if ((v202 & 1) != 0) {
                      goto LABEL_171;
                    }
                    v203 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v204 = AXLoggerForFacility();
                    v205 = (os_log_s *)objc_claimAutoreleasedReturnValue(v204);

                    v178 = AXOSLogLevelFromAXLogLevel(1LL);
                    mode = (__CFString *)v205;
                    if (!os_log_type_enabled(v205, v178)) {
                      goto LABEL_179;
                    }
                    v206 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver, could not enable Display Mode");
                    v217 = objc_claimAutoreleasedReturnValue(v206);
                    v207 = _AXStringForArgs(v217);
                    v215 = objc_claimAutoreleasedReturnValue(v207);
                    if (os_log_type_enabled(v205, v178))
                    {
                      *(_DWORD *)v235 = 138543362;
                      v181 = (void *)v215;
                      v236 = v215;
                      goto LABEL_177;
                    }

LABEL_183:
                    v123 = 0LL;
                    theData = 0LL;
LABEL_184:
                    v37 = v226;
                    v4 = v227;
                    v40 = v224;
                    v35 = v225;
                    v38 = v222;
LABEL_185:
                    v59 = v223;
                    v135 = (void *)v215;
                    v136 = (void *)v217;
LABEL_186:

LABEL_187:
LABEL_188:
                    -[SCRDFileReader invalidate](v40->_readerThread, "invalidate");
                    v208 = v40->_readerThread;
                    v40->_readerThread = 0LL;

                    v209 = v40->_safeReadBuffer;
                    if (v209)
                    {
                      CFRelease(v209);
                      v40->_safeReadBuffer = 0LL;
                    }

                    [v59 removeObserver:v40];
                    -[NSLock lock](v40->_readBufferLock, "lock");
                    readBuffer = v40->_readBuffer;
                    if (readBuffer)
                    {
                      CFRelease(readBuffer);
                      v40->_readBuffer = 0LL;
                    }

                    v211 = v40->_readBufferLock;
                    v212 = v40->_readBufferLock;
                    v40->_readBufferLock = 0LL;

                    -[NSLock unlock](v211, "unlock");
                    device = v40->_device;
                    v40->_device = 0LL;

                    if (theData) {
                      CFRelease(theData);
                    }
                    if (v123) {
                      CFRelease(v123);
                    }
                    v40->_comPort = -1;
                    v214 = v40->_modelIdentifier;
                    v40->_modelIdentifier = 0LL;

                    v40->_mainSize = 0LL;
                    v30 = 2;
LABEL_197:

LABEL_89:
                    goto LABEL_90;
                  }

                  v224->_bluetoothChannelIsLost = 0;
                  v224->_hasBeenUnloaded = 0;
                  v158 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                  if (v224->_bluetoothChannelIsLost || v224->_hasBeenUnloaded || v158 == kCFRunLoopRunStopped)
                  {
                    v182 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v183 = [v182 ignoreLogging];

                    if ((v183 & 1) != 0) {
                      goto LABEL_172;
                    }
                    v184 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v185 = AXLoggerForFacility();
                    v186 = (os_log_s *)objc_claimAutoreleasedReturnValue(v185);

                    v187 = AXOSLogLevelFromAXLogLevel(1LL);
                    mode = (__CFString *)v186;
                    if (!os_log_type_enabled(v186, v187)) {
                      goto LABEL_180;
                    }
                    v188 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                    v136 = (void *)objc_claimAutoreleasedReturnValue(v188);
                    v189 = _AXStringForArgs(v136);
                    v216 = objc_claimAutoreleasedReturnValue(v189);
                    if (os_log_type_enabled(v186, v187))
                    {
                      *(_DWORD *)v235 = 138543362;
                      v236 = v216;
                      _os_log_impl(&dword_0, v186, v187, "%{public}@", v235, 0xCu);
                      v135 = (void *)v216;
                      theData = 0LL;
                      v37 = v226;
                      v4 = v227;
                      v40 = v224;
                      v35 = v225;
                      v38 = v222;
                      goto LABEL_116;
                    }

                    theData = 0LL;
                    v37 = v226;
                    v4 = v227;
                    v40 = v224;
                    v35 = v225;
                    v38 = v222;
                    v59 = v223;
                    v135 = (void *)v216;
                    goto LABEL_186;
                  }

                  -[NSLock lock](v224->_readBufferLock, "lock");
                  v159 = CFDataGetLength(v224->_readBuffer);
                  if (v159 >= 1)
                  {
                    v160 = v159;
                    v161 = v224->_safeReadBuffer;
                    v162 = CFDataGetBytePtr(v224->_readBuffer);
                    CFDataAppendBytes(v161, v162, v160);
                    v244.location = 0LL;
                    v244.length = v160;
                    CFDataDeleteBytes(v224->_readBuffer, v244);
                  }

                  -[NSLock unlock](v224->_readBufferLock, "unlock");
                  v163 = CFDataGetLength(v224->_safeReadBuffer);
                  v164 = v163;
                  if (v163 == 1)
                  {
                    v245.location = 0LL;
                    v245.length = 1LL;
                    CFDataGetBytes(v224->_safeReadBuffer, v245, &v228);
                  }

                  else if (v163 < 1)
                  {
                    goto LABEL_146;
                  }

                  v246.location = 0LL;
                  v246.length = v164;
                  CFDataDeleteBytes(v224->_safeReadBuffer, v246);
LABEL_146:
                  if (v155 <= 3)
                  {
                    ++v155;
                    if (!v228) {
                      continue;
                    }
                  }

                  goto LABEL_167;
                }
              }

              v173 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v174 = [v173 ignoreLogging];

              if ((v174 & 1) != 0)
              {
LABEL_171:
                v123 = 0LL;
LABEL_172:
                theData = 0LL;
                v37 = v226;
                v4 = v227;
                v40 = v224;
                v35 = v225;
                goto LABEL_103;
              }

              v175 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v176 = AXLoggerForFacility();
              v177 = (os_log_s *)objc_claimAutoreleasedReturnValue(v176);

              v178 = AXOSLogLevelFromAXLogLevel(1LL);
              mode = (__CFString *)v177;
              if (os_log_type_enabled(v177, v178))
              {
                v179 = AXColorizeFormatLog(1LL, @"Failed to create displayModeRequest");
                v217 = objc_claimAutoreleasedReturnValue(v179);
                v180 = _AXStringForArgs(v217);
                v215 = objc_claimAutoreleasedReturnValue(v180);
                if (!os_log_type_enabled(v177, v178)) {
                  goto LABEL_183;
                }
                *(_DWORD *)v235 = 138543362;
                v181 = (void *)v215;
                v236 = v215;
LABEL_177:
                _os_log_impl(&dword_0, (os_log_t)mode, v178, "%{public}@", v235, 0xCu);
                v135 = v181;
                v123 = 0LL;
                theData = 0LL;
                goto LABEL_178;
              }

LABEL_179:
              v123 = 0LL;
LABEL_180:
              theData = 0LL;
LABEL_181:
              v37 = v226;
              v4 = v227;
              v40 = v224;
              v35 = v225;
              goto LABEL_182;
            }

            v165 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v166 = [v165 ignoreLogging];

            if ((v166 & 1) == 0)
            {
              v167 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v168 = AXLoggerForFacility();
              v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);

              v170 = AXOSLogLevelFromAXLogLevel(1LL);
              mode = (__CFString *)v169;
              if (!os_log_type_enabled(v169, v170))
              {
                v123 = 0LL;
                v220 = 0LL;
                theData = 0LL;
                goto LABEL_181;
              }

              v171 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver, Unknown model identifier [%{public}@]");
              v217 = objc_claimAutoreleasedReturnValue(v171);
              v172 = _AXStringForArgs(v217);
              v215 = objc_claimAutoreleasedReturnValue(v172);
              if (!os_log_type_enabled(v169, v170))
              {
                v123 = 0LL;
                v220 = 0LL;
                theData = 0LL;
                goto LABEL_184;
              }

              *(_DWORD *)v235 = 138543362;
              v236 = v215;
              _os_log_impl(&dword_0, v169, v170, "%{public}@", v235, 0xCu);
              v135 = (void *)v215;
              v123 = 0LL;
              v220 = 0LL;
              theData = 0LL;
LABEL_178:
              v37 = v226;
              v4 = v227;
              v40 = v224;
              v35 = v225;
              v38 = v222;
LABEL_108:
              v59 = v223;
              v136 = (void *)v217;
              goto LABEL_186;
            }

LABEL_100:
            v123 = 0LL;
            theData = 0LL;
LABEL_111:
            v220 = 0LL;
            v4 = v227;
LABEL_98:
            v37 = v226;
            v59 = v223;
            goto LABEL_188;
          }
        }
      }

      else
      {
LABEL_20:
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      v52 = [v51 ignoreLogging];

      v4 = v227;
      if ((v52 & 1) != 0)
      {
        v30 = 1;
        v35 = v225;
        v37 = v226;
      }

      else
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v56 = AXLoggerForFacility();
        v38 = (id)objc_claimAutoreleasedReturnValue(v56);

        v30 = 1;
        v57 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = v225;
        if (os_log_type_enabled((os_log_t)v38, v57))
        {
          v58 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver because we found no matching paired device");
          v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
          v60 = _AXStringForArgs(v59);
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled((os_log_t)v38, v57))
          {
            buf = 138543362;
            v239 = v61;
            _os_log_impl(&dword_0, (os_log_t)v38, v57, "%{public}@", (uint8_t *)&buf, 0xCu);
          }

          v37 = v226;
          goto LABEL_89;
        }

        v37 = v226;
LABEL_90:
      }

LABEL_91:
LABEL_92:
      goto LABEL_93;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v54 = [v53 ignoreLogging];

    if ((v54 & 1) == 0)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v63 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v63);

      v30 = 1;
      v64 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v35, v64))
      {
LABEL_93:

        goto LABEL_94;
      }

      v65 = AXColorizeFormatLog(1LL, @"Failed to load KGS braille driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v65);
      v66 = _AXStringForArgs(v37);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled((os_log_t)v35, v64))
      {
        buf = 138543362;
        v239 = v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v64, "%{public}@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_91;
    }

    v30 = 1;
LABEL_94:

    goto LABEL_95;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
  v29 = [v28 ignoreLogging];

  if ((v29 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
    v32 = AXLoggerForFacility();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v30 = 1;
    v33 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled((os_log_t)v16, v33))
    {
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load KGS braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        buf = 138543362;
        v239 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_92;
    }

    goto LABEL_94;
  }

  v30 = 1;
LABEL_95:

  return v30;
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}