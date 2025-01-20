LABEL_51:
            [v39 removeObserver:self];
            v30 = 1;
LABEL_52:
            v16 = v154;
LABEL_53:

LABEL_55:
            v35 = v155;
            goto LABEL_56;
          }

          if (BTDeviceGetComPortForServiceWithSandboxExtension( [v38 device],  0x2000,  buf,  512,  v165))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v41 = [v40 ignoreLogging];

            v37 = v156;
            if ((v41 & 1) == 0)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v43 = AXLoggerForFacility();
              v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);

              v45 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v44, v45))
              {
                v46 = AXColorizeFormatLog(1LL, @"Failed to open bt com port - BTError [%ld]");
                v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
                v48 = _AXStringForArgs(v47);
                v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v44, v45))
                {
                  *(_DWORD *)v163 = 138543362;
                  v164 = v49;
                  _os_log_impl(&dword_0, v44, v45, "%{public}@", v163, 0xCu);
                }
              }

LABEL_50:
              goto LABEL_51;
            }

            goto LABEL_51;
          }

          v37 = v156;
          if (sandbox_extension_consume(v165) == -1)
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v76 = [v75 ignoreLogging];

            if ((v76 & 1) == 0)
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v78 = AXLoggerForFacility();
              v26 = objc_claimAutoreleasedReturnValue(v78);

              v79 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled((os_log_t)v26, v79))
              {
                v80 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                v81 = objc_claimAutoreleasedReturnValue(v80);
                __error();
                __buf = (void *)v81;
                v82 = _AXStringForArgs(v81);
                v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled((os_log_t)v26, v79))
                {
                  *(_DWORD *)v163 = 138543362;
                  v164 = v83;
                  _os_log_impl(&dword_0, (os_log_t)v26, v79, "%{public}@", v163, 0xCu);
                }
              }
            }
          }

          v84 = open((const char *)buf, 131074);
          self->_comPort = v84;
          if (v84 < 0)
          {
            v106 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v107 = [v106 ignoreLogging];

            if ((v107 & 1) == 0)
            {
              v108 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v109 = AXLoggerForFacility();
              v110 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);

              v111 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v110, v111))
              {
                v112 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
                v114 = _AXStringForArgs(v113);
                v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
                if (os_log_type_enabled(v110, v111))
                {
                  *(_DWORD *)v163 = 138543362;
                  v164 = v115;
                  _os_log_impl(&dword_0, v110, v111, "%{public}@", v163, 0xCu);
                }
              }
            }

            self->_comPort = -1;
            goto LABEL_51;
          }

          objc_storeStrong((id *)&self->_device, v25);
          v85 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
          v86 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v85];
          readerThread = self->_readerThread;
          self->_readerThread = v86;

          Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          self->_safeReadBuffer = Mutable;
          if (!Mutable) {
            goto LABEL_130;
          }
          v89 = (NSLock *)[objc_allocWithZone(NSLock) init];
          readBufferLock = self->_readBufferLock;
          self->_readBufferLock = v89;

          if (!self->_readBufferLock) {
            goto LABEL_130;
          }
          v91 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          self->_readBuffer = v91;
          if (!v91) {
            goto LABEL_130;
          }
          -[SCRDFileReader start](self->_readerThread, "start");
          v151 = v85;
          __bufa = (void *)SCRDHIMSCreateRequest(251LL, 1LL, 32LL, 0LL, 0LL, __nbyte);
          if (!__bufa)
          {
            v116 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v117 = [v116 ignoreLogging];

            v85 = v151;
            if ((v117 & 1) == 0)
            {
              v118 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v119 = AXLoggerForFacility();
              v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);

              v121 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v120, v121))
              {
                v122 = AXColorizeFormatLog(1LL, @"Failed to create cellCountRequest");
                v123 = (void *)objc_claimAutoreleasedReturnValue(v122);
                v124 = _AXStringForArgs(v123);
                v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
                if (os_log_type_enabled(v120, v121))
                {
                  *(_DWORD *)v163 = 138543362;
                  v164 = v125;
                  _os_log_impl(&dword_0, v120, v121, "%{public}@", v163, 0xCu);
                }
              }

LABEL_128:
LABEL_129:
              v85 = v151;
            }

LABEL_130:
            -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
            v145 = self->_readerThread;
            self->_readerThread = 0LL;

            safeReadBuffer = self->_safeReadBuffer;
            if (safeReadBuffer)
            {
              CFRelease(safeReadBuffer);
              self->_safeReadBuffer = 0LL;
            }

            [v39 removeObserver:self];
            -[NSLock lock](self->_readBufferLock, "lock");
            readBuffer = self->_readBuffer;
            v16 = v154;
            if (readBuffer)
            {
              CFRelease(readBuffer);
              self->_readBuffer = 0LL;
            }

            v148 = self->_readBufferLock;
            self->_readBufferLock = 0LL;
            v105 = v148;

            -[NSLock unlock](v105, "unlock");
            device = self->_device;
            self->_device = 0LL;

            self->_comPort = -1;
            modelIdentifier = self->_modelIdentifier;
            self->_modelIdentifier = 0LL;

            v30 = 2;
LABEL_135:

            goto LABEL_53;
          }

          v92 = 0;
          while (1)
          {
            if (self->_modelIdentifier)
            {
LABEL_101:
              free(__bufa);
              v104 = objc_claimAutoreleasedReturnValue([v156 objectForKey:self->_modelIdentifier]);
              if (v104)
              {
                v105 = (NSLock *)v104;
                v30 = 0;
                self->_isDriverLoaded = 1;
                v16 = v154;
                goto LABEL_135;
              }

              v136 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v137 = [v136 ignoreLogging];

              v85 = v151;
              if ((v137 & 1) == 0)
              {
                v138 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                v139 = AXLoggerForFacility();
                v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);

                v140 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v120, v140))
                {
                  v141 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleSense braille driver, Unknown model identifier [%{public}@]");
                  v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
                  v143 = _AXStringForArgs(v142);
                  v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
                  if (os_log_type_enabled(v120, v140))
                  {
                    *(_DWORD *)v163 = 138543362;
                    v164 = v144;
                    _os_log_impl(&dword_0, v120, v140, "%{public}@", v163, 0xCu);
                  }

                  v37 = v156;
                }

                goto LABEL_128;
              }

              goto LABEL_130;
            }

            v93 = write(self->_comPort, __bufa, __nbyte[0]);
            if (v93 < __nbyte[0])
            {
              free(__bufa);
              goto LABEL_130;
            }

            self->_bluetoothChannelIsLost = 0;
            self->_hasBeenUnloaded = 0;
            v94 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
            if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v94 == kCFRunLoopRunStopped)
            {
              v126 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v127 = [v126 ignoreLogging];

              if ((v127 & 1) == 0)
              {
                v128 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                v129 = AXLoggerForFacility();
                v130 = (os_log_s *)objc_claimAutoreleasedReturnValue(v129);

                v131 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v130, v131))
                {
                  v132 = AXColorizeFormatLog(1LL, @"Failed to write to com port for cellCountRequest");
                  v133 = (void *)objc_claimAutoreleasedReturnValue(v132);
                  v134 = _AXStringForArgs(v133);
                  v135 = (void *)objc_claimAutoreleasedReturnValue(v134);
                  if (os_log_type_enabled(v130, v131))
                  {
                    *(_DWORD *)v163 = 138543362;
                    v164 = v135;
                    _os_log_impl(&dword_0, v130, v131, "%{public}@", v163, 0xCu);
                  }
                }
              }

              free(__bufa);
              goto LABEL_129;
            }

            -[NSLock lock](self->_readBufferLock, "lock");
            Length = CFDataGetLength(self->_readBuffer);
            if (Length >= 1)
            {
              v96 = Length;
              v97 = self->_safeReadBuffer;
              BytePtr = CFDataGetBytePtr(self->_readBuffer);
              v99 = v97;
              v85 = v151;
              CFDataAppendBytes(v99, BytePtr, v96);
              v169.location = 0LL;
              v169.length = v96;
              CFDataDeleteBytes(self->_readBuffer, v169);
            }

            -[NSLock unlock](self->_readBufferLock, "unlock");
            SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 250LL);
            if (CFDataGetLength(self->_safeReadBuffer) >= 10) {
              break;
            }
LABEL_100:
            if (++v92 == 5) {
              goto LABEL_101;
            }
          }

          while (1)
          {
            v100 = CFDataGetBytePtr(self->_safeReadBuffer);
            SCRDHIMSFillPacket(&v157, v100);
            v26 = v26 & 0xFFFFFFFFFFFF0000LL | v158;
            v170.location = 0LL;
            v170.length = 1LL;
            CFDataDeleteBytes(self->_safeReadBuffer, v170);
            SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 250LL);
            if (CFDataGetLength(self->_safeReadBuffer) <= 9) {
              goto LABEL_100;
            }
          }

          if (BYTE3(v157) <= 0x13u)
          {
            if (BYTE3(v157) == 14)
            {
              v102 = @"com.apple.scrod.braille.driver.hims.braillesense.smart.beetle.14";
              goto LABEL_98;
            }

            if (BYTE3(v157) == 18)
            {
              v102 = @"com.apple.scrod.braille.driver.hims.braillesense.18";
              goto LABEL_98;
            }
          }

          else
          {
            if (BYTE3(v157) == 20)
            {
              v102 = @"com.apple.scrod.braille.driver.hims.braillesense.20";
              goto LABEL_98;
            }

            v102 = @"com.apple.scrod.braille.driver.hims.braillesense.40";
            if (BYTE3(v157) == 40)
            {
LABEL_98:
              v103 = self->_modelIdentifier;
              self->_modelIdentifier = &v102->isa;

              self->_mainSize = BYTE3(v157);
              goto LABEL_99;
            }

            if (BYTE3(v157) == 32)
            {
              v102 = @"com.apple.scrod.braille.driver.hims.braillesense.32";
              goto LABEL_98;
            }
          }

LABEL_99:
          v171.location = 0LL;
          v171.length = 1LL;
          CFDataDeleteBytes(self->_safeReadBuffer, v171);
          goto LABEL_100;
        }
      }

      else
      {
LABEL_20:
      }

      v50 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      v51 = [v50 ignoreLogging];

      if ((v51 & 1) != 0)
      {
        v30 = 1;
        v16 = v154;
        v35 = v155;
        v37 = v156;
LABEL_56:

LABEL_57:
        goto LABEL_58;
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v55 = AXLoggerForFacility();
      v38 = (id)objc_claimAutoreleasedReturnValue(v55);

      v30 = 1;
      v56 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v38, v56))
      {
        v16 = v154;
        v37 = v156;
        goto LABEL_55;
      }

      v57 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleSense braille driver because we found no matching paired device");
      v39 = (void *)objc_claimAutoreleasedReturnValue(v57);
      v58 = _AXStringForArgs(v39);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v37 = v156;
      if (os_log_type_enabled((os_log_t)v38, v56))
      {
        *(_DWORD *)buf = 138543362;
        v167 = v59;
        _os_log_impl(&dword_0, (os_log_t)v38, v56, "%{public}@", buf, 0xCu);
      }

      goto LABEL_52;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v53 = [v52 ignoreLogging];

    if ((v53 & 1) == 0)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v61 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v61);

      v30 = 1;
      v62 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v35, v62))
      {
LABEL_58:

        goto LABEL_59;
      }

      v63 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleSense braille driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v63);
      v64 = _AXStringForArgs(v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled((os_log_t)v35, v62))
      {
        *(_DWORD *)buf = 138543362;
        v167 = v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v62, "%{public}@", buf, 0xCu);
      }

      goto LABEL_56;
    }

    v30 = 1;
LABEL_59:

    goto LABEL_60;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
  v29 = [v28 ignoreLogging];

  if ((v29 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
    v32 = AXLoggerForFacility();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v30 = 1;
    v33 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled((os_log_t)v16, v33))
    {
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleSense braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v167 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

      goto LABEL_57;
    }

    goto LABEL_59;
  }

  v30 = 1;
LABEL_60:

  return v30;
}

void _MSCRODebugAbortPrint(uint64_t a1, uint64_t a2, id a3)
{
  id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"===================================\nVoiceOver Error: %s:%d\nError: %s\nBreak on _MSCRODebugAbortPrint to debug\n", a1, a2, [a3 cStringUsingEncoding:4]));
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

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}