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

LABEL_143:
                              v100 = 0LL;
                              v37 = v172;
                              v39 = v91;
                              v92 = v166;
LABEL_142:

LABEL_88:
                              -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                              v114 = self->_readerThread;
                              self->_readerThread = 0LL;

                              v115 = self->_safeReadBuffer;
                              if (v115)
                              {
                                CFRelease(v115);
                                self->_safeReadBuffer = 0LL;
                              }

                              [v39 removeObserver:self];
                              -[NSLock lock](self->_readBufferLock, "lock");
                              readBuffer = self->_readBuffer;
                              if (readBuffer)
                              {
                                CFRelease(readBuffer);
                                self->_readBuffer = 0LL;
                              }

                              v117 = self->_readBufferLock;
                              readBufferLock = self->_readBufferLock;
                              self->_readBufferLock = 0LL;

                              -[NSLock unlock](v117, "unlock");
                              device = self->_device;
                              self->_device = 0LL;

                              if (v100) {
                                free(v100);
                              }
                              self->_comPort = -1;
                              v120 = self->_modelIdentifier;
                              self->_modelIdentifier = 0LL;

                              self->_mainSize = 0LL;
                              v30 = 2;
LABEL_95:

LABEL_104:
                              uint64_t v16 = v170;
                              v4 = v171;
                              v35 = (os_log_s *)v169;
LABEL_105:

LABEL_106:
                              goto LABEL_107;
                            }

LABEL_134:
                            v100 = 0LL;
                            v37 = v172;
                            v39 = v91;
                            v92 = v166;
                            goto LABEL_88;
                          }

                          modelIdentifier = self->_modelIdentifier;
                          v113 = @"com.apple.scrod.braille.driver.hims.braille.edge.20";
LABEL_125:
                          self->_modelIdentifier = &v113->isa;

                          v151 = (NSLock *)objc_claimAutoreleasedReturnValue([v172 objectForKey:self->_modelIdentifier]);
                          if (v151)
                          {
                            v117 = v151;
                            v152 = (void *)objc_claimAutoreleasedReturnValue( -[NSLock objectForKey:]( v151,  "objectForKey:",  kSCROBrailleDriverMainDisplaySize));
                            self->_mainSize = [v152 unsignedCharValue];

                            v30 = 0;
                            self->_isDriverLoaded = 1;
                            v37 = v172;
                            v39 = v91;
                            v92 = v166;
                            goto LABEL_95;
                          }

                          v160 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                          v161 = [v160 ignoreLogging];

                          if ((v161 & 1) != 0) {
                            goto LABEL_134;
                          }
                          v162 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                          v163 = AXLoggerForFacility();
                          v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);

                          v157 = AXOSLogLevelFromAXLogLevel(1LL);
                          if (!os_log_type_enabled(v137, v157)) {
                            goto LABEL_143;
                          }
                          v164 = AXColorizeFormatLog( 1LL,  @"Failed to load HIMS braille driver, Missing model identifier from info plist [%{public}@]");
                          v149 = objc_claimAutoreleasedReturnValue(v164);
                          v165 = _AXStringForArgs(v149);
                          v142 = (void *)objc_claimAutoreleasedReturnValue(v165);
                          if (os_log_type_enabled(v137, v157))
                          {
                            *(_DWORD *)v177 = 138543362;
                            *(void *)&v177[4] = v142;
LABEL_138:
                            _os_log_impl(&dword_0, v137, v157, "%{public}@", v177, 0xCu);
                          }

LABEL_139:
                          v100 = 0LL;
                          v37 = v172;
                          v39 = v91;
                          v92 = v166;
LABEL_140:
                          v140 = (void *)v149;
LABEL_141:

                          goto LABEL_142;
                        }

                        v143 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                        v144 = [v143 ignoreLogging];

                        if ((v144 & 1) == 0)
                        {
                          v145 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                          v146 = AXLoggerForFacility();
                          v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);

                          v147 = AXOSLogLevelFromAXLogLevel(1LL);
                          if (os_log_type_enabled(v137, v147))
                          {
                            v148 = AXColorizeFormatLog(1LL, @"Failed to write to com port for cellCountRequest");
                            v149 = objc_claimAutoreleasedReturnValue(v148);
                            v150 = _AXStringForArgs(v149);
                            v142 = (void *)objc_claimAutoreleasedReturnValue(v150);
                            if (os_log_type_enabled(v137, v147))
                            {
                              *(_DWORD *)v177 = 138543362;
                              *(void *)&v177[4] = v142;
                              _os_log_impl(&dword_0, v137, v147, "%{public}@", v177, 0xCu);
                            }

                            v37 = v172;
                            v39 = v91;
                            v92 = v166;
                            v100 = v167;
                            goto LABEL_140;
                          }

                          v37 = v172;
                          v39 = v91;
                          goto LABEL_132;
                        }

LABEL_118:
                        v37 = v172;
                        v39 = v91;
                        v92 = v166;
                        v100 = v167;
                        goto LABEL_88;
                      }
                    }

                    else
                    {
                      v100 = 0LL;
                    }

                    v37 = v172;
                    goto LABEL_88;
                  }

                  v121 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v122 = [v121 ignoreLogging];

                  if ((v122 & 1) == 0)
                  {
                    v123 = v39;
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
                        *(_DWORD *)v177 = 138543362;
                        *(void *)&v177[4] = v131;
                        _os_log_impl(&dword_0, v126, v127, "%{public}@", v177, 0xCu);
                      }
                    }

                    v39 = v123;
                  }

                  self->_comPort = -1;
                }

                [v39 removeObserver:self];
                v30 = 1;
                v37 = v172;
                goto LABEL_104;
              }

              goto LABEL_35;
            }
          }

          __int128 v22 = [v20 countByEnumeratingWithState:&__nbyte[1] objects:v181 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

LABEL_35:
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      v52 = [v51 ignoreLogging];

      if ((v52 & 1) == 0)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v56 = AXLoggerForFacility();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);

        v30 = 1;
        v58 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = (os_log_s *)v169;
        v168 = v57;
        if (os_log_type_enabled(v57, v58))
        {
          v59 = AXColorizeFormatLog( 1LL,  @"Failed to load HIMS braille driver because we found no matching paired device");
          v60 = objc_claimAutoreleasedReturnValue(v59);
          v61 = _AXStringForArgs(v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v57, v58))
          {
            *(_DWORD *)buf = 138543362;
            v180 = v62;
            _os_log_impl(&dword_0, v57, v58, "%{public}@", buf, 0xCu);
          }

          uint64_t v16 = v170;
          v4 = v171;
          v37 = v172;
          v39 = (void *)v60;
          goto LABEL_105;
        }

        uint64_t v16 = v170;
        v4 = v171;
        v37 = v172;
        goto LABEL_106;
      }

      v30 = 1;
      uint64_t v16 = v170;
      v4 = v171;
      v35 = (os_log_s *)v169;
      v37 = v172;
LABEL_107:

      goto LABEL_108;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v54 = [v53 ignoreLogging];

    if ((v54 & 1) == 0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v64 = AXLoggerForFacility();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);

      v30 = 1;
      v65 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v35, v65))
      {
        v66 = AXColorizeFormatLog(1LL, @"Failed to load HIMS braille driver because we have no bundle identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v67 = _AXStringForArgs(v37);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v35, v65))
        {
          *(_DWORD *)buf = 138543362;
          v180 = v18;
          _os_log_impl(&dword_0, v35, v65, "%{public}@", buf, 0xCu);
        }

        goto LABEL_107;
      }

      goto LABEL_109;
    }

    v30 = 1;
    goto LABEL_110;
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
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load HIMS braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v180 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

LABEL_108:
LABEL_109:
    }

LABEL_110:
    goto LABEL_111;
  }

  v30 = 1;
LABEL_111:

  return v30;
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}