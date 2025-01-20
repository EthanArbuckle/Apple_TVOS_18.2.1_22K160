LABEL_118:
                      -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                      v127 = self->_readerThread;
                      self->_readerThread = 0LL;

                      v128 = self->_safeReadBuffer;
                      if (v128)
                      {
                        CFRelease(v128);
                        self->_safeReadBuffer = 0LL;
                      }

                      [v144 removeObserver:self];
                      -[NSLock lock](self->_readBufferLock, "lock");
                      readBuffer = self->_readBuffer;
                      v37 = v148;
                      if (readBuffer)
                      {
                        CFRelease(readBuffer);
                        self->_readBuffer = 0LL;
                      }

                      v130 = self->_readBufferLock;
                      self->_readBufferLock = 0LL;
                      v89 = v130;

                      -[NSLock unlock](v89, "unlock");
                      device = self->_device;
                      self->_device = 0LL;

                      close(self->_comPort);
                      self->_comPort = -1;
                      self->_spaceKeyState = 0;
                      v132 = self->_modelIdentifier;
                      self->_modelIdentifier = 0LL;

                      v30 = 2;
LABEL_123:

                      v16 = v146;
                      v4 = v147;
                      v42 = v144;
                      v35 = v145;
LABEL_50:

LABEL_52:
LABEL_53:

LABEL_54:
LABEL_55:

                      goto LABEL_56;
                    }

                    v121 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v122 = [v121 ignoreLogging];

                    if ((v122 & 1) != 0) {
                      goto LABEL_118;
                    }
                    v123 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v124 = AXLoggerForFacility();
                    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);

                    v116 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v115, v116))
                    {
                      v125 = AXColorizeFormatLog(1LL, @"Failed to write to com port for resetRequest");
                      v118 = (void *)objc_claimAutoreleasedReturnValue(v125);
                      v126 = _AXStringForArgs(v118);
                      v120 = (__CFString *)objc_claimAutoreleasedReturnValue(v126);
                      if (os_log_type_enabled(v115, v116))
                      {
                        buf = 138543362;
                        v156 = v120;
LABEL_115:
                        _os_log_impl(&dword_0, v115, v116, "%{public}@", (uint8_t *)&buf, 0xCu);
                      }

LABEL_116:
                    }

LABEL_117:
                    goto LABEL_118;
                  }

                  v30 = v41;
                  v42 = v39;
                  [v39 removeObserver:self];
                }

                else
                {
                  v58 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v59 = [v58 ignoreLogging];

                  if ((v59 & 1) == 0)
                  {
                    v60 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v61 = AXLoggerForFacility();
                    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);

                    v63 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v62, v63))
                    {
                      v64 = AXColorizeFormatLog( 1LL,  @"Failed to load HandyTech braille driver because the device is no longer connected over bluetooth.");
                      v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
                      v66 = _AXStringForArgs(v65);
                      v67 = (__CFString *)objc_claimAutoreleasedReturnValue(v66);
                      if (os_log_type_enabled(v62, v63))
                      {
                        buf = 138543362;
                        v156 = v67;
                        _os_log_impl(&dword_0, v62, v63, "%{public}@", (uint8_t *)&buf, 0xCu);
                      }
                    }
                  }

                  v42 = v39;
                  [v39 removeObserver:self];
                  v30 = 1;
                }

                v16 = v146;
                v4 = v147;
                v35 = v145;
LABEL_49:
                v37 = v148;
                goto LABEL_50;
              }

LABEL_30:
              v43 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v44 = [v43 ignoreLogging];

              if ((v44 & 1) != 0)
              {
                v30 = 1;
                v16 = v146;
                v4 = v147;
                v35 = v145;
                v37 = v148;
                goto LABEL_53;
              }

              v47 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v48 = AXLoggerForFacility();
              v38 = (id)objc_claimAutoreleasedReturnValue(v48);

              v30 = 1;
              v49 = AXOSLogLevelFromAXLogLevel(1LL);
              v35 = v145;
              if (!os_log_type_enabled((os_log_t)v38, v49))
              {
                v16 = v146;
                v4 = v147;
                v37 = v148;
                goto LABEL_52;
              }

              v50 = AXColorizeFormatLog( 1LL,  @"Failed to load HandyTech braille driver because we found no matching paired device");
              v42 = (void *)objc_claimAutoreleasedReturnValue(v50);
              v51 = _AXStringForArgs(v42);
              v52 = (__CFString *)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled((os_log_t)v38, v49))
              {
                buf = 138543362;
                v156 = v52;
                _os_log_impl(&dword_0, (os_log_t)v38, v49, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              v16 = v146;
              v4 = v147;
              goto LABEL_49;
            }
          }

          v22 = [v20 countByEnumeratingWithState:&v150 objects:v154 count:16];
        }

        while (v22);
      }

      goto LABEL_30;
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v46 = [v45 ignoreLogging];

    if ((v46 & 1) == 0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v54 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v54);

      v30 = 1;
      v55 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled((os_log_t)v35, v55))
      {
        v56 = AXColorizeFormatLog( 1LL,  @"Failed to load HandyTech braille driver because we have no bundle identifier");
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(v56);
        v57 = _AXStringForArgs(v37);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled((os_log_t)v35, v55))
        {
          buf = 138543362;
          v156 = v18;
          _os_log_impl(&dword_0, (os_log_t)v35, v55, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_53;
      }

      goto LABEL_55;
    }

    v30 = 1;
LABEL_56:
  }

  else
  {
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
        v34 = AXColorizeFormatLog( 1LL,  @"Failed to load HandyTech braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        [v4 transport];
        [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
        v36 = _AXStringForArgs(v35);
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)v16, v33))
        {
          buf = 138543362;
          v156 = v37;
          _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_54;
      }

      goto LABEL_56;
    }

    v30 = 1;
  }

  return v30;
}

CFStringRef sub_5A88(int a1)
{
  result = 0LL;
  if (a1 <= 128)
  {
    v3 = @"com.apple.scrod.braille.driver.handytech.braillino.20";
    v4 = @"com.apple.scrod.braille.driver.handytech.braille.star.40";
    if (a1 != 116) {
      v4 = 0LL;
    }
    if (a1 != 114) {
      v3 = v4;
    }
    v5 = @"com.apple.scrod.braille.driver.handytech.actilino";
    v6 = @"com.apple.scrod.braille.driver.handytech.active.star.40";
    if (a1 != 100) {
      v6 = 0LL;
    }
    if (a1 != 97) {
      v5 = v6;
    }
    if (a1 <= 113) {
      v3 = v5;
    }
    v7 = @"com.apple.scrod.braille.driver.handytech.braille.wave.40";
    v8 = @"com.apple.scrod.braille.driver.handytech.easy.braille.40";
    v9 = @"com.apple.scrod.braille.driver.handytech.active.braille.40";
    if (a1 != 84) {
      v9 = 0LL;
    }
    if (a1 != 68) {
      v8 = v9;
    }
    if (a1 != 5) {
      v7 = v8;
    }
    if (a1 <= 96) {
      return v7;
    }
    else {
      return v3;
    }
  }

  else if (a1 > 163)
  {
    v10 = @"com.apple.scrod.braille.driver.handytech.activator.pro.64";
    v11 = @"com.apple.scrod.braille.driver.handytech.activator.pro.80";
    if (a1 != 168) {
      v11 = 0LL;
    }
    if (a1 != 166) {
      v10 = v11;
    }
    if (a1 == 164) {
      return @"com.apple.scrod.braille.driver.handytech.activator.40";
    }
    else {
      return v10;
    }
  }

  else
  {
    switch(a1)
    {
      case 129:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.16";
        break;
      case 130:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.20";
        break;
      case 131:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.32";
        break;
      case 132:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.40";
        break;
      case 134:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.64";
        break;
      case 135:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.80";
        break;
      case 138:
        result = @"com.apple.scrod.braille.driver.handytech.basic.braille.48";
        break;
      default:
        return result;
    }
  }

  return result;
}
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