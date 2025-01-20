LABEL_149:
                v4 = v176;
LABEL_75:
                v37 = v175;
LABEL_76:
                v39 = v172;
                goto LABEL_77;
              }
            }

            v164 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v165 = [v164 ignoreLogging];

            if ((v165 & 1) != 0) {
              goto LABEL_149;
            }
            v166 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            v167 = AXLoggerForFacility();
            v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v167);

            v159 = AXOSLogLevelFromAXLogLevel(1LL);
            if (os_log_type_enabled(v158, v159))
            {
              v168 = AXColorizeFormatLog(1LL, @"Failed to write to com port for lengthRequest");
              v161 = (void *)objc_claimAutoreleasedReturnValue(v168);
              v169 = _AXStringForArgs(v161);
              v163 = (void *)objc_claimAutoreleasedReturnValue(v169);
              if (os_log_type_enabled(v158, v159))
              {
                *(_DWORD *)v184 = 138543362;
                v185 = v163;
LABEL_145:
                _os_log_impl(&dword_0, v158, v159, "%{public}@", v184, 0xCu);
              }

LABEL_146:
            }

            v40 = v174;
            v95 = v170;
LABEL_148:

            goto LABEL_149;
          }

          v96 = v174->_modelIdentifier;
          v174->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.optelec.easylink";

          v174->_isKeyboardOnly = 1;
LABEL_68:
          v39 = v172;
          if (!v174->_modelIdentifier)
          {
            v97 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothDevice name](v174->_device, "name"));

            v95 = v97;
            if (([v97 isEqualToString:kSCRDEasyLinkBluetoothNameEasyLink] & 1) != 0
              || [v97 isEqualToString:kSCRDEasyLinkBluetoothNameBraillePen])
            {
              v98 = v174->_modelIdentifier;
              v174->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.optelec.easylink";

              v174->_isKeyboardOnly = 1;
            }
          }

          v99 = (NSLock *)objc_claimAutoreleasedReturnValue([v175 objectForKey:v174->_modelIdentifier]);
          if (v99)
          {
            v100 = v99;
            v101 = (void *)objc_claimAutoreleasedReturnValue(-[NSLock objectForKey:](v99, "objectForKey:", kSCROBrailleDriverMainDisplaySize));
            v174->_mainSize = [v101 unsignedCharValue];

            v30 = 0;
            v174->_isDriverLoaded = 1;
            v37 = v175;
          }

          else
          {
            v119 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v120 = [v119 ignoreLogging];

            if ((v120 & 1) == 0)
            {
              v146 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v147 = AXLoggerForFacility();
              v148 = (os_log_s *)objc_claimAutoreleasedReturnValue(v147);

              v149 = AXOSLogLevelFromAXLogLevel(1LL);
              v37 = v175;
              if (os_log_type_enabled(v148, v149))
              {
                v150 = AXColorizeFormatLog( 1LL,  @"Failed to load EasyLink braille driver, Unknown model identifier [%{public}@]");
                v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
                v152 = _AXStringForArgs(v151);
                v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
                if (os_log_type_enabled(v148, v149))
                {
                  *(_DWORD *)v184 = 138543362;
                  v185 = v153;
                  _os_log_impl(&dword_0, v148, v149, "%{public}@", v184, 0xCu);
                }
              }

              v4 = v176;
              goto LABEL_76;
            }

            v37 = v175;
            v4 = v176;
LABEL_77:
            -[SCRDFileReader invalidate](v40->_readerThread, "invalidate");
            v102 = v40->_readerThread;
            v40->_readerThread = 0LL;

            v103 = v40->_safeReadBuffer;
            if (v103)
            {
              CFRelease(v103);
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

            v105 = v40->_readBufferLock;
            v40->_readBufferLock = 0LL;
            v100 = v105;

            -[NSLock unlock](v100, "unlock");
            device = v40->_device;
            v40->_device = 0LL;

            v40->_comPort = -1;
            v40->_isKeyboardOnly = 0;
            v107 = v40->_modelIdentifier;
            v40->_modelIdentifier = 0LL;

            v30 = 2;
          }

          v35 = v177;
          goto LABEL_92;
        }

        v108 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        v109 = [v108 ignoreLogging];

        v35 = v177;
        if ((v109 & 1) == 0)
        {
          v110 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
          v111 = AXLoggerForFacility();
          v112 = (os_log_s *)objc_claimAutoreleasedReturnValue(v111);

          v113 = AXOSLogLevelFromAXLogLevel(1LL);
          if (os_log_type_enabled(v112, v113))
          {
            v114 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
            v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
            v116 = _AXStringForArgs(v115);
            v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
            if (os_log_type_enabled(v112, v113))
            {
              *(_DWORD *)v184 = 138543362;
              v185 = v117;
              _os_log_impl(&dword_0, v112, v113, "%{public}@", v184, 0xCu);
            }

            v35 = v177;
          }
        }

        v174->_comPort = -1;
      }

      else
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        v69 = [v68 ignoreLogging];

        v35 = v177;
        if ((v69 & 1) != 0)
        {
LABEL_91:
          [v39 removeObserver:v174];
          v30 = 1;
          v37 = v175;
          v4 = v176;
          goto LABEL_92;
        }

        v172 = v39;
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v71 = AXLoggerForFacility();
        v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);

        v73 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v72, v73))
        {
          v74 = AXColorizeFormatLog( 1LL,  @"Failed to load EasyLink braille driver because the device is no longer connected over bluetooth.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
          v76 = _AXStringForArgs(v75);
          v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v72, v73))
          {
            *(_DWORD *)buf = 138543362;
            v188 = v77;
            _os_log_impl(&dword_0, v72, v73, "%{public}@", buf, 0xCu);
          }

          v35 = v177;
        }
      }

      v39 = v172;
      goto LABEL_91;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v54 = [v53 ignoreLogging];

    if ((v54 & 1) == 0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v64 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v64);

      v30 = 1;
      v65 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v35, v65))
      {
LABEL_96:

        goto LABEL_97;
      }

      v66 = AXColorizeFormatLog( 1LL,  @"Failed to load EasyLink braille driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v66);
      v67 = _AXStringForArgs(v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled((os_log_t)v35, v65))
      {
        *(_DWORD *)buf = 138543362;
        v188 = v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v65, "%{public}@", buf, 0xCu);
      }

      goto LABEL_94;
    }

    v30 = 1;
LABEL_97:

    goto LABEL_98;
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
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load EasyLink braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v188 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

      goto LABEL_95;
    }

    goto LABEL_97;
  }

  v30 = 1;
LABEL_98:

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

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}