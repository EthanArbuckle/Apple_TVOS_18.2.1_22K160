LABEL_119:
                        -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                        v145 = self->_readerThread;
                        self->_readerThread = 0LL;

                        v146 = self->_safeReadBuffer;
                        if (v146)
                        {
                          CFRelease(v146);
                          self->_safeReadBuffer = 0LL;
                        }

                        [v39 removeObserver:self];
                        -[NSLock lock](self->_readBufferLock, "lock");
                        readBuffer = self->_readBuffer;
                        v4 = v153;
                        v35 = v154;
                        v16 = v155;
                        v37 = v156;
                        if (readBuffer)
                        {
                          CFRelease(readBuffer);
                          self->_readBuffer = 0LL;
                        }

                        v148 = self->_readBufferLock;
                        self->_readBufferLock = 0LL;
                        v149 = v148;

                        -[NSLock unlock](v149, "unlock");
                        device = self->_device;
                        self->_device = 0LL;

                        self->_comPort = -1;
                        v151 = self->_modelIdentifier;
                        self->_modelIdentifier = 0LL;

                        v30 = 2;
                        goto LABEL_124;
                      }
                    }

                    v128 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v129 = [v128 ignoreLogging];

                    v39 = v40;
                    if ((v129 & 1) != 0) {
                      goto LABEL_119;
                    }
                    v130 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v131 = AXLoggerForFacility();
                    v122 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);

                    v132 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v122, v132))
                    {
                      v133 = AXColorizeFormatLog(1LL, @"Failed to write to com port for systemInfoRequest");
                      v125 = (void *)objc_claimAutoreleasedReturnValue(v133);
                      v134 = _AXStringForArgs(v125);
                      v127 = (void *)objc_claimAutoreleasedReturnValue(v134);
                      if (os_log_type_enabled(v122, v132))
                      {
                        *(_DWORD *)v163 = 138543362;
                        v164 = v127;
                        _os_log_impl(&dword_0, v122, v132, "%{public}@", v163, 0xCu);
                      }

LABEL_110:
                    }

LABEL_118:
                    goto LABEL_119;
                  }

                  v107 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v108 = [v107 ignoreLogging];

                  v39 = v40;
                  if ((v108 & 1) == 0)
                  {
                    v109 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v110 = AXLoggerForFacility();
                    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);

                    v112 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v111, v112))
                    {
                      v113 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                      v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
                      v115 = _AXStringForArgs(v114);
                      v116 = (void *)objc_claimAutoreleasedReturnValue(v115);
                      if (os_log_type_enabled(v111, v112))
                      {
                        *(_DWORD *)v163 = 138543362;
                        v164 = v116;
                        _os_log_impl(&dword_0, v111, v112, "%{public}@", v163, 0xCu);
                      }

                      v39 = v40;
                    }
                  }

                  self->_comPort = -1;
                }

                else
                {
                  v67 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v68 = [v67 ignoreLogging];

                  if ((v68 & 1) == 0)
                  {
                    v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v70 = AXLoggerForFacility();
                    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);

                    v72 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v71, v72))
                    {
                      v73 = v39;
                      v74 = AXColorizeFormatLog( 1LL,  @"Failed to load Eurobraille braille driver because the device is no longer connected over bluetooth.");
                      v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                      v76 = _AXStringForArgs(v75);
                      v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
                      if (os_log_type_enabled(v71, v72))
                      {
                        *(_DWORD *)buf = 138543362;
                        v167 = v77;
                        _os_log_impl(&dword_0, v71, v72, "%{public}@", buf, 0xCu);
                      }

                      v39 = v73;
                    }
                  }
                }

                v51 = v39;
                goto LABEL_92;
              }

LABEL_36:
              v52 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v53 = [v52 ignoreLogging];

              if ((v53 & 1) != 0)
              {
                v30 = 1;
                v4 = v153;
                v35 = v154;
                v16 = v155;
                v37 = v156;
                goto LABEL_96;
              }

              v56 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v57 = AXLoggerForFacility();
              v38 = (id)objc_claimAutoreleasedReturnValue(v57);

              v30 = 1;
              v58 = AXOSLogLevelFromAXLogLevel(1LL);
              v35 = v154;
              if (!os_log_type_enabled((os_log_t)v38, v58))
              {
                v4 = v153;
                v16 = v155;
                v37 = v156;
                goto LABEL_95;
              }

              v59 = AXColorizeFormatLog( 1LL,  @"Failed to load Eurobraille braille driver because we found no matching paired device");
              v39 = (void *)objc_claimAutoreleasedReturnValue(v59);
              v60 = _AXStringForArgs(v39);
              v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled((os_log_t)v38, v58))
              {
                *(_DWORD *)buf = 138543362;
                v167 = v61;
                _os_log_impl(&dword_0, (os_log_t)v38, v58, "%{public}@", buf, 0xCu);
              }

              v30 = 1;
              v4 = v153;
              goto LABEL_93;
            }
          }

          v22 = [v20 countByEnumeratingWithState:&v159 objects:v168 count:16];
        }

        while (v22);
      }

      goto LABEL_36;
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v55 = [v54 ignoreLogging];

    if ((v55 & 1) == 0)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v63 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v63);

      v30 = 1;
      v64 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled((os_log_t)v35, v64))
      {
        v65 = AXColorizeFormatLog( 1LL,  @"Failed to load Eurobraille braille driver because we have no bundle identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v66 = _AXStringForArgs(v37);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled((os_log_t)v35, v64))
        {
          *(_DWORD *)buf = 138543362;
          v167 = v18;
          _os_log_impl(&dword_0, (os_log_t)v35, v64, "%{public}@", buf, 0xCu);
        }

        goto LABEL_96;
      }

      goto LABEL_98;
    }

    v30 = 1;
LABEL_99:
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
        v34 = AXColorizeFormatLog( 1LL,  @"Failed to load Eurobraille braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
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

        goto LABEL_97;
      }

      goto LABEL_99;
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

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}