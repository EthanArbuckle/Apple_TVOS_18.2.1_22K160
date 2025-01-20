LABEL_130:
                                    SCRDPapenmeierReleasePacket(v112);
                                    v184->_deviceID = v126;
                                    v92 = v125;
LABEL_131:
                                    v155 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                                    v156 = [v155 ignoreLogging];

                                    v39 = v182;
                                    if ((v156 & 1) == 0)
                                    {
                                      v157 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                                      v158 = AXLoggerForFacility();
                                      v159 = (os_log_s *)objc_claimAutoreleasedReturnValue(v158);

                                      v160 = AXOSLogLevelFromAXLogLevel(1LL);
                                      if (os_log_type_enabled(v159, v160))
                                      {
                                        v161 = AXColorizeFormatLog( 1LL,  @"Found device ID: %d, modelIdenitifier: %@");
                                        v162 = (void *)objc_claimAutoreleasedReturnValue(v161);
                                        v163 = _AXStringForArgs(v162);
                                        v164 = (void *)objc_claimAutoreleasedReturnValue(v163);
                                        if (os_log_type_enabled(v159, v160))
                                        {
                                          *(_DWORD *)v193 = 138543362;
                                          v194 = v164;
                                          _os_log_impl(&dword_0, v159, v160, "%{public}@", v193, 0xCu);
                                        }

                                        v39 = v182;
                                      }
                                    }

                                    KeyBuffer = SCRDPapenmeierCreateKeyBuffer(v184->_deviceID);
                                    v184->_keysDownBuffer = (char *)KeyBuffer;
                                    if (KeyBuffer)
                                    {
                                      free(v100);
                                      v166 = (NSLock *)objc_claimAutoreleasedReturnValue([v187 objectForKey:v184->_modelIdentifier]);
                                      if (v166)
                                      {
                                        v133 = v166;
                                        v167 = (void *)objc_claimAutoreleasedReturnValue( -[NSLock objectForKey:]( v166,  "objectForKey:",  kSCROBrailleDriverMainDisplaySize));
                                        v184->_mainSize = [v167 unsignedCharValue];

                                        v30 = 0;
                                        v184->_isDriverLoaded = 1;
                                        v37 = v187;
                                        goto LABEL_106;
                                      }

                                      v175 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                                      v176 = [v175 ignoreLogging];

                                      if ((v176 & 1) != 0)
                                      {
                                        v100 = 0LL;
                                        goto LABEL_146;
                                      }

                                      v177 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                                      v178 = AXLoggerForFacility();
                                      v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v178);

                                      v179 = AXOSLogLevelFromAXLogLevel(1LL);
                                      if (os_log_type_enabled(v141, v179))
                                      {
                                        v180 = AXColorizeFormatLog( 1LL,  @"Failed to load Papenmeier braille driver, Unknown model identifier [%{public}@]");
                                        v144 = (void *)objc_claimAutoreleasedReturnValue(v180);
                                        v181 = _AXStringForArgs(v144);
                                        v146 = (void *)objc_claimAutoreleasedReturnValue(v181);
                                        if (os_log_type_enabled(v141, v179))
                                        {
                                          *(_DWORD *)v193 = 138543362;
                                          v194 = v146;
                                          _os_log_impl(&dword_0, v141, v179, "%{public}@", v193, 0xCu);
                                        }

                                        v100 = 0LL;
                                        goto LABEL_151;
                                      }

LABEL_153:
                                      v100 = 0LL;
LABEL_154:
                                      v37 = v187;
                                      v39 = v182;
LABEL_155:

LABEL_97:
                                      -[SCRDFileReader invalidate](v40->_readerThread, "invalidate");
                                      v130 = v40->_readerThread;
                                      v40->_readerThread = 0LL;

                                      v131 = v40->_safeReadBuffer;
                                      if (v131)
                                      {
                                        CFRelease(v131);
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

                                      v133 = v40->_readBufferLock;
                                      v134 = v40->_readBufferLock;
                                      v40->_readBufferLock = 0LL;

                                      -[NSLock unlock](v133, "unlock");
                                      keysDownBuffer = v40->_keysDownBuffer;
                                      if (keysDownBuffer)
                                      {
                                        free(keysDownBuffer);
                                        v40->_keysDownBuffer = 0LL;
                                      }

                                      if (v100) {
                                        free(v100);
                                      }
                                      device = v40->_device;
                                      v40->_device = 0LL;

                                      v40->_comPort = -1;
                                      modelIdentifier = v40->_modelIdentifier;
                                      v40->_modelIdentifier = 0LL;

                                      v30 = 2;
LABEL_106:

LABEL_107:
                                      v35 = (os_log_s *)v185;
                                      v4 = v186;
LABEL_108:

LABEL_109:
                                      goto LABEL_110;
                                    }

                                    v168 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                                    v169 = [v168 ignoreLogging];

                                    if ((v169 & 1) != 0)
                                    {
LABEL_146:
                                      v37 = v187;
                                      goto LABEL_97;
                                    }

                                    v170 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                                    v171 = AXLoggerForFacility();
                                    v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v171);

                                    v172 = AXOSLogLevelFromAXLogLevel(1LL);
                                    if (!os_log_type_enabled(v141, v172)) {
                                      goto LABEL_154;
                                    }
                                    v173 = AXColorizeFormatLog( 1LL,  @"Failed to create keyDownBuffer for deviceId: %d");
                                    v144 = (void *)objc_claimAutoreleasedReturnValue(v173);
                                    v174 = _AXStringForArgs(v144);
                                    v146 = (void *)objc_claimAutoreleasedReturnValue(v174);
                                    if (os_log_type_enabled(v141, v172))
                                    {
                                      *(_DWORD *)v193 = 138543362;
                                      v194 = v146;
                                      _os_log_impl(&dword_0, v141, v172, "%{public}@", v193, 0xCu);
                                    }

LABEL_122:
                                    v37 = v187;
LABEL_152:
                                    v39 = v182;

                                    goto LABEL_155;
                                  }

                                  v127 = @"com.apple.scrod.braille.driver.papenmeier.braillex.trio.40";
                                }

LABEL_129:
                                v154 = v184->_modelIdentifier;
                                v184->_modelIdentifier = &v127->isa;

                                goto LABEL_130;
                              }

LABEL_80:
                              if (v101++ >= 4) {
                                goto LABEL_131;
                              }
                            }

                            v147 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                            v148 = [v147 ignoreLogging];

                            if ((v148 & 1) != 0) {
                              goto LABEL_96;
                            }
                            v149 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                            v150 = AXLoggerForFacility();
                            v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v150);

                            v151 = AXOSLogLevelFromAXLogLevel(1LL);
                            if (!os_log_type_enabled(v141, v151)) {
                              goto LABEL_154;
                            }
                            v152 = AXColorizeFormatLog( 1LL,  @"Failed to load Papenmeier braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                            v144 = (void *)objc_claimAutoreleasedReturnValue(v152);
                            v153 = _AXStringForArgs(v144);
                            v146 = (void *)objc_claimAutoreleasedReturnValue(v153);
                            if (os_log_type_enabled(v141, v151))
                            {
                              *(_DWORD *)v193 = 138543362;
                              v194 = v146;
                              _os_log_impl(&dword_0, v141, v151, "%{public}@", v193, 0xCu);
                            }

LABEL_151:
                            v37 = v187;
                            v40 = v184;
                            goto LABEL_152;
                          }

                          v128 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                          v129 = [v128 ignoreLogging];

                          if ((v129 & 1) == 0)
                          {
                            v139 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                            v140 = AXLoggerForFacility();
                            v141 = (os_log_s *)objc_claimAutoreleasedReturnValue(v140);

                            v142 = AXOSLogLevelFromAXLogLevel(1LL);
                            if (!os_log_type_enabled(v141, v142)) {
                              goto LABEL_153;
                            }
                            v143 = AXColorizeFormatLog(1LL, @"Failed to create IdentityRequest");
                            v144 = (void *)objc_claimAutoreleasedReturnValue(v143);
                            v145 = _AXStringForArgs(v144);
                            v146 = (void *)objc_claimAutoreleasedReturnValue(v145);
                            if (os_log_type_enabled(v141, v142))
                            {
                              *(_DWORD *)v193 = 138543362;
                              v194 = v146;
                              _os_log_impl(&dword_0, v141, v142, "%{public}@", v193, 0xCu);
                            }

                            v100 = 0LL;
                            goto LABEL_122;
                          }
                        }
                      }
                    }

                    v100 = 0LL;
LABEL_96:
                    v37 = v187;
                    v39 = v182;
                    goto LABEL_97;
                  }

                  v114 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v115 = [v114 ignoreLogging];

                  if ((v115 & 1) == 0)
                  {
                    v116 = v39;
                    v117 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v118 = AXLoggerForFacility();
                    v119 = (os_log_s *)objc_claimAutoreleasedReturnValue(v118);

                    v120 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v119, v120))
                    {
                      v121 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                      v122 = (void *)objc_claimAutoreleasedReturnValue(v121);
                      v123 = _AXStringForArgs(v122);
                      v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
                      if (os_log_type_enabled(v119, v120))
                      {
                        *(_DWORD *)v193 = 138543362;
                        v194 = v124;
                        _os_log_impl(&dword_0, v119, v120, "%{public}@", v193, 0xCu);
                      }
                    }

                    v39 = v116;
                  }

                  [v39 removeObserver:v184];
                  v184->_comPort = -1;
                }

                v30 = 1;
                v37 = v187;
                goto LABEL_107;
              }

              goto LABEL_37;
            }
          }

          v22 = [v20 countByEnumeratingWithState:&v189 objects:v198 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

LABEL_37:
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      v53 = [v52 ignoreLogging];

      if ((v53 & 1) == 0)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v57 = AXLoggerForFacility();
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);

        v30 = 1;
        v59 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = (os_log_s *)v185;
        v183 = v58;
        if (os_log_type_enabled(v58, v59))
        {
          v60 = AXColorizeFormatLog( 1LL,  @"Failed to load Papenmeier braille driver because we found no matching paired device");
          v61 = objc_claimAutoreleasedReturnValue(v60);
          v62 = _AXStringForArgs(v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v58, v59))
          {
            *(_DWORD *)buf = 138543362;
            v197 = v63;
            _os_log_impl(&dword_0, v58, v59, "%{public}@", buf, 0xCu);
          }

          v4 = v186;
          v37 = v187;
          v39 = (void *)v61;
          goto LABEL_108;
        }

        v4 = v186;
        v37 = v187;
        goto LABEL_109;
      }

      v30 = 1;
      v35 = (os_log_s *)v185;
      v4 = v186;
      v37 = v187;
LABEL_110:

      goto LABEL_111;
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v55 = [v54 ignoreLogging];

    if ((v55 & 1) == 0)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v65 = AXLoggerForFacility();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);

      v30 = 1;
      v66 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled(v35, v66))
      {
        v67 = AXColorizeFormatLog( 1LL,  @"Failed to load Papenmeier braille driver because we have no bundle identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v68 = _AXStringForArgs(v37);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v68);
        if (os_log_type_enabled(v35, v66))
        {
          *(_DWORD *)buf = 138543362;
          v197 = v18;
          _os_log_impl(&dword_0, v35, v66, "%{public}@", buf, 0xCu);
        }

        goto LABEL_110;
      }

      goto LABEL_112;
    }

    v30 = 1;
    goto LABEL_113;
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
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load Papenmeier braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v197 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

LABEL_111:
LABEL_112:
    }

LABEL_113:
    goto LABEL_114;
  }

  v30 = 1;
LABEL_114:

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