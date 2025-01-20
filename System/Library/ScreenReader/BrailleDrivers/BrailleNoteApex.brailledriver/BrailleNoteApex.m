LABEL_108:
                        }

LABEL_109:
                      }

LABEL_116:
                      v58 = v155;
                      goto LABEL_117;
                    }

                    self->_bluetoothChannelIsLost = 0;
                    self->_hasBeenUnloaded = 0;
                    v95 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                    if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v95 == kCFRunLoopRunStopped)
                    {
                      v117 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      v118 = [v117 ignoreLogging];

                      if ((v118 & 1) == 0)
                      {
                        v119 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        v120 = AXLoggerForFacility();
                        v121 = (os_log_s *)objc_claimAutoreleasedReturnValue(v120);

                        v122 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v121, v122))
                        {
                          v123 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleNoteApex braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                          v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
                          v125 = _AXStringForArgs(v124);
                          v126 = (void *)objc_claimAutoreleasedReturnValue(v125);
                          if (os_log_type_enabled(v121, v122))
                          {
                            *(_DWORD *)v165 = 138543362;
                            v166 = v126;
                            v127 = v121;
                            v128 = v122;
                            goto LABEL_107;
                          }

                          goto LABEL_108;
                        }

                        goto LABEL_109;
                      }

                      goto LABEL_116;
                    }

                    -[NSLock lock](self->_readBufferLock, "lock");
                    Length = CFDataGetLength(self->_readBuffer);
                    if (Length >= 1)
                    {
                      v97 = Length;
                      safeReadBuffer = self->_safeReadBuffer;
                      BytePtr = CFDataGetBytePtr(self->_readBuffer);
                      v100 = safeReadBuffer;
                      v58 = v155;
                      CFDataAppendBytes(v100, BytePtr, v97);
                      v171.location = 0LL;
                      v171.length = v97;
                      CFDataDeleteBytes(self->_readBuffer, v171);
                    }

                    -[NSLock unlock](self->_readBufferLock, "unlock");
                    DescriptionPacketFromBuffer = SCRDBrailleNoteCreateDescriptionPacketFromBuffer(self->_safeReadBuffer);
                    if (DescriptionPacketFromBuffer)
                    {
                      v102 = (const void *)DescriptionPacketFromBuffer;
                      if (SCRDBrailleNoteGetDisplayInfoFromDescriptionPacket( DescriptionPacketFromBuffer,  p_mainSize,  &self->_statusOffset))
                      {
                        if (*p_mainSize == 32)
                        {
                          v103 = @"com.apple.scrod.braille.driver.humanware.braillenote.apex.32";
LABEL_86:
                          v104 = self->_modelIdentifier;
                          self->_modelIdentifier = &v103->isa;
                        }

                        else if (*p_mainSize == 18)
                        {
                          v103 = @"com.apple.scrod.braille.driver.humanware.braillenote.apex.18";
                          goto LABEL_86;
                        }
                      }

                      CFRelease(v102);
                    }

                    if (!--v93)
                    {
                      modelIdentifier = self->_modelIdentifier;
LABEL_90:
                      v105 = objc_claimAutoreleasedReturnValue([v159 objectForKey:modelIdentifier]);
                      if (v105)
                      {
                        v106 = (NSLock *)v105;
                        v30 = 0;
                        self->_isDriverLoaded = 1;
                        v37 = v159;
                        goto LABEL_122;
                      }

                      v136 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      v137 = [v136 ignoreLogging];

                      v58 = v155;
                      if ((v137 & 1) == 0)
                      {
                        v138 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                        v139 = AXLoggerForFacility();
                        v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);

                        v141 = AXOSLogLevelFromAXLogLevel(1LL);
                        if (os_log_type_enabled(v140, v141))
                        {
                          v142 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleNoteApex braille driver, Unknown model identifier [%{public}@]");
                          v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
                          v144 = _AXStringForArgs(v143);
                          v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
                          if (os_log_type_enabled(v140, v141))
                          {
                            *(_DWORD *)v165 = 138543362;
                            v166 = v145;
                            _os_log_impl(&dword_0, v140, v141, "%{public}@", v165, 0xCu);
                          }
                        }

                        goto LABEL_116;
                      }

LABEL_117:
                      -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                      v146 = self->_readerThread;
                      self->_readerThread = 0LL;

                      v147 = self->_safeReadBuffer;
                      if (v147)
                      {
                        CFRelease(v147);
                        self->_safeReadBuffer = 0LL;
                      }

                      [v58 removeObserver:self];
                      -[NSLock lock](self->_readBufferLock, "lock");
                      readBuffer = self->_readBuffer;
                      v37 = v159;
                      if (readBuffer)
                      {
                        CFRelease(readBuffer);
                        self->_readBuffer = 0LL;
                      }

                      v149 = self->_readBufferLock;
                      self->_readBufferLock = 0LL;
                      v106 = v149;

                      -[NSLock unlock](v106, "unlock");
                      device = self->_device;
                      self->_device = 0LL;

                      self->_comPort = -1;
                      v151 = self->_modelIdentifier;
                      self->_modelIdentifier = 0LL;

                      v30 = 2;
LABEL_122:

LABEL_53:
LABEL_55:

                      v4 = v158;
LABEL_56:

LABEL_57:
LABEL_58:

                      goto LABEL_59;
                    }

                    continue;
                  }
                }

                v66 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                v67 = [v66 ignoreLogging];

                v35 = v156;
                v16 = v157;
                if ((v67 & 1) == 0)
                {
                  v68 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                  v69 = AXLoggerForFacility();
                  v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);

                  v70 = AXOSLogLevelFromAXLogLevel(1LL);
                  if (os_log_type_enabled(v44, v70))
                  {
                    v71 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleNoteApex braille driver because the device is no longer connected over bluetooth.");
                    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
                    v73 = _AXStringForArgs(v72);
                    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
                    if (os_log_type_enabled(v44, v70))
                    {
                      buf = 138543362;
                      v169 = v74;
                      _os_log_impl(&dword_0, v44, v70, "%{public}@", (uint8_t *)&buf, 0xCu);
                    }
                  }

LABEL_50:
                }

LABEL_51:
                v58 = v155;
                [v155 removeObserver:self];
                v30 = 1;
LABEL_52:
                v37 = v159;
                goto LABEL_53;
              }

LABEL_34:
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v51 = [v50 ignoreLogging];

              if ((v51 & 1) != 0)
              {
                v30 = 1;
                v16 = v157;
                v4 = v158;
                v35 = v156;
                v37 = v159;
                goto LABEL_56;
              }

              v54 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v55 = AXLoggerForFacility();
              v38 = (id)objc_claimAutoreleasedReturnValue(v55);

              v30 = 1;
              v56 = AXOSLogLevelFromAXLogLevel(1LL);
              v35 = v156;
              if (!os_log_type_enabled((os_log_t)v38, v56))
              {
                v16 = v157;
                v37 = v159;
                goto LABEL_55;
              }

              v57 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleNoteApex braille driver because we found no matching paired device");
              v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
              v59 = _AXStringForArgs(v58);
              v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
              v16 = v157;
              if (os_log_type_enabled((os_log_t)v38, v56))
              {
                buf = 138543362;
                v169 = v60;
                _os_log_impl(&dword_0, (os_log_t)v38, v56, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              goto LABEL_52;
            }
          }

          v22 = [v20 countByEnumeratingWithState:&v161 objects:v170 count:16];
        }

        while (v22);
      }

      goto LABEL_34;
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v53 = [v52 ignoreLogging];

    if ((v53 & 1) == 0)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v62 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v62);

      v30 = 1;
      v63 = AXOSLogLevelFromAXLogLevel(1LL);
      if (os_log_type_enabled((os_log_t)v35, v63))
      {
        v64 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleNoteApex braille driver because we have no bundle identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v64);
        v65 = _AXStringForArgs(v37);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled((os_log_t)v35, v63))
        {
          buf = 138543362;
          v169 = v18;
          _os_log_impl(&dword_0, (os_log_t)v35, v63, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_56;
      }

      goto LABEL_58;
    }

    v30 = 1;
LABEL_59:
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
        v34 = AXColorizeFormatLog( 1LL,  @"Failed to load BrailleNoteApex braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        [v4 transport];
        [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
        v36 = _AXStringForArgs(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)v16, v33))
        {
          buf = 138543362;
          v169 = v37;
          _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_57;
      }

      goto LABEL_59;
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