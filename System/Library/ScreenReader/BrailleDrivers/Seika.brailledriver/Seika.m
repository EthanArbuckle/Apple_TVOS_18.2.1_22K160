LABEL_126:
                          }

LABEL_127:
                          -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                          v162 = self->_readerThread;
                          self->_readerThread = 0LL;

                          v163 = self->_safeReadBuffer;
                          if (v163)
                          {
                            CFRelease(v163);
                            self->_safeReadBuffer = 0LL;
                          }

                          v39 = v174;
                          [v174 removeObserver:self];
                          -[NSLock lock](self->_readBufferLock, "lock");
                          v164 = self->_readBuffer;
                          v16 = v176;
                          if (v164)
                          {
                            CFRelease(v164);
                            self->_readBuffer = 0LL;
                          }

                          v165 = self->_readBufferLock;
                          self->_readBufferLock = 0LL;
                          v166 = v165;

                          -[NSLock unlock](v166, "unlock");
                          device = self->_device;
                          self->_device = 0LL;

                          self->_comPort = -1;
                          v168 = self->_modelIdentifier;
                          self->_modelIdentifier = 0LL;

                          self->_deviceID = 0;
                          v30 = 2;
LABEL_132:

LABEL_100:
LABEL_101:

LABEL_102:
LABEL_103:

LABEL_104:
                          goto LABEL_105;
                        }
                      }

                      v144 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      v145 = [v144 ignoreLogging];

                      v86 = v169;
                      if ((v145 & 1) != 0) {
                        goto LABEL_127;
                      }
                      v146 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v147 = AXLoggerForFacility();
                      v148 = objc_claimAutoreleasedReturnValue(v147);

                      v138 = (os_log_s *)v148;
                      v149 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (!os_log_type_enabled(v138, v149)) {
                        goto LABEL_126;
                      }
                      v150 = AXColorizeFormatLog(1LL, @"Failed to write to com port for identityRequest");
                      mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v150);
                      v151 = _AXStringForArgs(mode);
                      v143 = (void *)objc_claimAutoreleasedReturnValue(v151);
                      if (os_log_type_enabled(v138, v149))
                      {
                        *(_DWORD *)v185 = 138543362;
                        v186 = v143;
                        goto LABEL_122;
                      }

LABEL_123:
                      v141 = (__CFString *)mode;
LABEL_124:

                      goto LABEL_126;
                    }

                    v122 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v123 = [v122 ignoreLogging];

                    v39 = v174;
                    if ((v123 & 1) == 0)
                    {
                      v124 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v125 = AXLoggerForFacility();
                      v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);

                      v127 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v126, v127))
                      {
                        v128 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                        v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
                        v130 = _AXStringForArgs(v129);
                        v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
                        if (os_log_type_enabled(v126, v127))
                        {
                          *(_DWORD *)v185 = 138543362;
                          v186 = v131;
                          _os_log_impl(&dword_0, v126, v127, "%{public}@", v185, 0xCu);
                        }

                        v39 = v174;
                      }
                    }

                    self->_comPort = -1;
                  }
                }

                else
                {
                  v65 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v66 = [v65 ignoreLogging];

                  v37 = v177;
                  v35 = v178;
                  if ((v66 & 1) == 0)
                  {
                    v67 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v68 = AXLoggerForFacility();
                    v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);

                    v70 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v69, v70))
                    {
                      v71 = v39;
                      v72 = AXColorizeFormatLog( 1LL,  @"Failed to load Seika braille driver because the device is no longer connected over bluetooth.");
                      v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
                      v74 = _AXStringForArgs(v73);
                      v175 = (void *)objc_claimAutoreleasedReturnValue(v74);
                      if (os_log_type_enabled(v69, v70))
                      {
                        buf = 138543362;
                        v189 = v175;
                        _os_log_impl(&dword_0, v69, v70, "%{public}@", (uint8_t *)&buf, 0xCu);
                      }

                      v39 = v71;
                    }
                  }
                }

                [v39 removeObserver:self];
LABEL_99:
                v30 = 1;
                v16 = v176;
                goto LABEL_100;
              }

LABEL_36:
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v51 = [v50 ignoreLogging];

              if ((v51 & 1) != 0)
              {
                v30 = 1;
                v16 = v176;
                v37 = v177;
                v35 = v178;
                goto LABEL_102;
              }

              v54 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v55 = AXLoggerForFacility();
              v38 = (id)objc_claimAutoreleasedReturnValue(v55);

              v30 = 1;
              v56 = AXOSLogLevelFromAXLogLevel(1LL);
              v35 = v178;
              if (!os_log_type_enabled((os_log_t)v38, v56))
              {
                v16 = v176;
                v37 = v177;
                goto LABEL_101;
              }

              v57 = AXColorizeFormatLog( 1LL,  @"Failed to load Seika braille driver because we found no matching paired device");
              v39 = (void *)objc_claimAutoreleasedReturnValue(v57);
              v58 = _AXStringForArgs(v39);
              v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
              v37 = v177;
              if (os_log_type_enabled((os_log_t)v38, v56))
              {
                buf = 138543362;
                v189 = v59;
                _os_log_impl(&dword_0, (os_log_t)v38, v56, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              goto LABEL_99;
            }
          }

          v22 = [v20 countByEnumeratingWithState:&v181 objects:v190 count:16];
        }

        while (v22);
      }

      goto LABEL_36;
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
      if (os_log_type_enabled((os_log_t)v35, v62))
      {
        v63 = AXColorizeFormatLog( 1LL,  @"Failed to load Seika braille driver because we have no bundle identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v64 = _AXStringForArgs(v37);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled((os_log_t)v35, v62))
        {
          buf = 138543362;
          v189 = v18;
          _os_log_impl(&dword_0, (os_log_t)v35, v62, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_102;
      }

      goto LABEL_104;
    }

    v30 = 1;
LABEL_105:
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
        v34 = AXColorizeFormatLog( 1LL,  @"Failed to load Seika braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        [v4 transport];
        [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
        v36 = _AXStringForArgs(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)v16, v33))
        {
          buf = 138543362;
          v189 = v37;
          _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_103;
      }

      goto LABEL_105;
    }

    v30 = 1;
  }

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