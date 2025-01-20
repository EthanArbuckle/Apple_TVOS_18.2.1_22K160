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

LABEL_84:
            [v39 removeObserver:v133];
            v30 = 1;
            v37 = v136;
            goto LABEL_85;
          }

          v35 = v134;
          if (sandbox_extension_consume(v143) == -1)
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v76 = [v75 ignoreLogging];

            if ((v76 & 1) == 0)
            {
              v77 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v78 = AXLoggerForFacility();
              v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);

              v80 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v79, v80))
              {
                v81 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                type = v80;
                v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
                __error();
                v83 = _AXStringForArgs(v82);
                v131 = (void *)objc_claimAutoreleasedReturnValue(v83);
                if (os_log_type_enabled(v79, type))
                {
                  *(_DWORD *)v141 = 138543362;
                  v142 = v131;
                  _os_log_impl(&dword_0, v79, type, "%{public}@", v141, 0xCu);
                }
              }
            }
          }

          v84 = open((const char *)buf, 131074);
          v133->_comPort = v84;
          if (v84 < 0)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v105 = [v104 ignoreLogging];

            if ((v105 & 1) == 0)
            {
              v106 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v107 = AXLoggerForFacility();
              v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);

              v109 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v108, v109))
              {
                v110 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
                v112 = _AXStringForArgs(v111);
                v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
                if (os_log_type_enabled(v108, v109))
                {
                  *(_DWORD *)v141 = 138543362;
                  v142 = v113;
                  _os_log_impl(&dword_0, v108, v109, "%{public}@", v141, 0xCu);
                }
              }
            }

            v133->_comPort = -1;
            goto LABEL_84;
          }

          objc_storeStrong((id *)&v133->_device, v25);
          v85 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:v133->_comPort closeOnDealloc:1];
          v86 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:v133 fileHandle:v85];
          readerThread = v133->_readerThread;
          v133->_readerThread = v86;

          Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          v133->_safeReadBuffer = Mutable;
          if (Mutable
            && (v89 = (NSLock *)[objc_allocWithZone(NSLock) init],
                readBufferLock = v133->_readBufferLock,
                v133->_readBufferLock = v89,
                readBufferLock,
                v133->_readBufferLock)
            && (v91 = CFDataCreateMutable(kCFAllocatorDefault, 0LL), (v133->_readBuffer = v91) != 0LL))
          {
            v132 = (void *)objc_claimAutoreleasedReturnValue([v38 name]);
            if ([v132 isEqualToString:kSCRDNinepointSystemsNinepointBluetoothName])
            {
              modelIdentifier = v133->_modelIdentifier;
              v133->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.ninepointsystems.ninepoint";
            }

            v93 = objc_claimAutoreleasedReturnValue([v136 objectForKey:v133->_modelIdentifier]);
            if (v93)
            {
              v94 = (void *)v93;
              -[SCRDFileReader start](v133->_readerThread, "start");
              v95 = (void *)objc_claimAutoreleasedReturnValue([v94 objectForKey:kSCROBrailleDriverMainDisplaySize]);
              v133->_mainSize = [v95 unsignedCharValue];

              v133->_isDriverLoaded = 1;
              v30 = 0;
              v37 = v136;
              v96 = v132;
LABEL_76:

LABEL_85:
              v4 = v135;
              goto LABEL_86;
            }

            v115 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v116 = [v115 ignoreLogging];

            if ((v116 & 1) != 0)
            {
              v37 = v136;
            }

            else
            {
              v117 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v118 = AXLoggerForFacility();
              v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);

              v120 = v119;
              v121 = AXOSLogLevelFromAXLogLevel(1LL);
              v122 = os_log_type_enabled(v119, v121);
              v37 = v136;
              if (v122)
              {
                v123 = AXColorizeFormatLog( 1LL,  @"Failed to load NinePoint braille driver, Unknown model identifier [%{public}@]");
                v130 = (void *)objc_claimAutoreleasedReturnValue(v123);
                v124 = _AXStringForArgs(v130);
                v125 = objc_claimAutoreleasedReturnValue(v124);
                v126 = v121;
                v127 = (void *)v125;
                typea = v126;
                if (os_log_type_enabled(v120, v126))
                {
                  *(_DWORD *)v141 = 138543362;
                  v142 = v127;
                  _os_log_impl(&dword_0, v120, typea, "%{public}@", v141, 0xCu);
                }
              }
            }

            v96 = v132;
          }

          else
          {
            v96 = 0LL;
            v37 = v136;
          }

          -[SCRDFileReader invalidate](v133->_readerThread, "invalidate");
          v97 = v133->_readerThread;
          v133->_readerThread = 0LL;

          safeReadBuffer = v133->_safeReadBuffer;
          if (safeReadBuffer)
          {
            CFRelease(safeReadBuffer);
            v133->_safeReadBuffer = 0LL;
          }

          [v39 removeObserver:v133];
          -[NSLock lock](v133->_readBufferLock, "lock");
          readBuffer = v133->_readBuffer;
          if (readBuffer)
          {
            CFRelease(readBuffer);
            v133->_readBuffer = 0LL;
          }

          v100 = v133->_readBufferLock;
          v133->_readBufferLock = 0LL;
          v101 = v100;

          -[NSLock unlock](v101, "unlock");
          device = v133->_device;
          v133->_device = 0LL;

          v133->_comPort = -1;
          v103 = v133->_modelIdentifier;
          v133->_modelIdentifier = 0LL;

          v133->_mainSize = 0LL;
          v30 = 2;
          goto LABEL_76;
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        v66 = [v65 ignoreLogging];

        v35 = v134;
        if ((v66 & 1) == 0)
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
          v68 = AXLoggerForFacility();
          v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);

          v70 = AXOSLogLevelFromAXLogLevel(1LL);
          if (os_log_type_enabled(v69, v70))
          {
            v71 = AXColorizeFormatLog( 1LL,  @"Failed to load NinePoint braille driver because the device is no longer connected over bluetooth.");
            v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            v73 = _AXStringForArgs(v72);
            v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
            if (os_log_type_enabled(v69, v70))
            {
              *(_DWORD *)buf = 138543362;
              v145 = v74;
              _os_log_impl(&dword_0, v69, v70, "%{public}@", buf, 0xCu);
            }
          }
        }

        [v39 removeObserver:v133];
      }

      else
      {
LABEL_20:

LABEL_35:
        v50 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        v51 = [v50 ignoreLogging];

        if ((v51 & 1) != 0)
        {
          v30 = 1;
          v35 = v134;
          v4 = v135;
          v37 = v136;
LABEL_88:

LABEL_89:
          goto LABEL_90;
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v55 = AXLoggerForFacility();
        v38 = (id)objc_claimAutoreleasedReturnValue(v55);

        v30 = 1;
        v56 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = v134;
        if (!os_log_type_enabled((os_log_t)v38, v56))
        {
          v4 = v135;
          v37 = v136;
LABEL_87:

          goto LABEL_88;
        }

        v57 = AXColorizeFormatLog( 1LL,  @"Failed to load NinePoint braille driver because we found no matching paired device");
        v39 = (void *)objc_claimAutoreleasedReturnValue(v57);
        v58 = _AXStringForArgs(v39);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled((os_log_t)v38, v56))
        {
          *(_DWORD *)buf = 138543362;
          v145 = v59;
          _os_log_impl(&dword_0, (os_log_t)v38, v56, "%{public}@", buf, 0xCu);
        }
      }

      v30 = 1;
      v4 = v135;
      v37 = v136;
LABEL_86:

      goto LABEL_87;
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
LABEL_90:

        goto LABEL_91;
      }

      v63 = AXColorizeFormatLog( 1LL,  @"Failed to load NinePoint braille driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v63);
      v64 = _AXStringForArgs(v37);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled((os_log_t)v35, v62))
      {
        *(_DWORD *)buf = 138543362;
        v145 = v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v62, "%{public}@", buf, 0xCu);
      }

      goto LABEL_88;
    }

    v30 = 1;
LABEL_91:

    goto LABEL_92;
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
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load NinePoint braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v145 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

      goto LABEL_89;
    }

    goto LABEL_91;
  }

  v30 = 1;
LABEL_92:

  return v30;
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}