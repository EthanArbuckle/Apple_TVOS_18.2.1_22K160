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

LABEL_137:
LABEL_95:
                      -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                      v115 = self->_readerThread;
                      self->_readerThread = 0LL;

                      safeReadBuffer = self->_safeReadBuffer;
                      if (safeReadBuffer)
                      {
                        CFRelease(safeReadBuffer);
                        self->_safeReadBuffer = 0LL;
                      }

                      if (v100) {
                        CFRelease(v100);
                      }
                      -[os_log_s removeObserver:](v52, "removeObserver:", self);
                      -[NSLock lock](self->_readBufferLock, "lock");
                      readBuffer = self->_readBuffer;
                      if (readBuffer)
                      {
                        CFRelease(readBuffer);
                        self->_readBuffer = 0LL;
                      }

                      v118 = self->_readBufferLock;
                      self->_readBufferLock = 0LL;
                      v119 = v118;

                      -[NSLock unlock](v119, "unlock");
                      device = self->_device;
                      self->_device = 0LL;

                      log = 0LL;
                      self->_comPort = -1;
                      self->_deviceID = 0;
                      modelIdentifier = self->_modelIdentifier;
                      self->_modelIdentifier = 0LL;
                      LODWORD(v32) = 2;
LABEL_102:

                      goto LABEL_103;
                    }

                    -[NSLock lock](self->_readBufferLock, "lock");
                    v106 = CFDataGetLength(self->_readBuffer);
                    if (v106 >= 1)
                    {
                      v107 = v106;
                      v108 = self->_safeReadBuffer;
                      v109 = CFDataGetBytePtr(self->_readBuffer);
                      CFDataAppendBytes(v108, v109, v107);
                      v181.location = 0LL;
                      v181.length = v107;
                      CFDataDeleteBytes(self->_readBuffer, v181);
                    }

                    -[NSLock unlock](self->_readBufferLock, "unlock");
                    InitializationPacketFromBuffer = SCRDHumanwareCreateInitializationPacketFromBuffer(self->_safeReadBuffer);
                    v100 = v160;
                    if (InitializationPacketFromBuffer)
                    {
                      v111 = (const void *)InitializationPacketFromBuffer;
                      do
                      {
                        v112 = SCRDHumanwareDeviceIDForInitializationPacket(v111);
                        if (SCRDHumanwareIsDeviceIDValid())
                        {
                          self->_mainSize = SCRDHumanwareDisplaySizeForDeviceID(v112);
                          self->_deviceID = v112;
                        }

                        CFRelease(v111);
                        v111 = (const void *)SCRDHumanwareCreateInitializationPacketFromBuffer(self->_safeReadBuffer);
                      }

                      while (v111);
                    }

                    ++v101;
                    v52 = v170;
                    if (v101 == 7) {
                      break;
                    }
                  }

                  CFRelease(v100);
                  v113 = self->_deviceID - 1;
                  else {
                    v114 = (NSString *)*(&off_4258 + v113);
                  }
                  v29 = v166;
                  v133 = self->_modelIdentifier;
                  self->_modelIdentifier = v114;

                  v134 = objc_claimAutoreleasedReturnValue([v171 objectForKey:self->_modelIdentifier]);
                  if (!v134)
                  {
                    v144 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v145 = [v144 ignoreLogging];

                    if ((v145 & 1) == 0)
                    {
                      v152 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v153 = AXLoggerForFacility();
                      v154 = (os_log_s *)objc_claimAutoreleasedReturnValue(v153);

                      v155 = AXOSLogLevelFromAXLogLevel(1LL);
                      loga = v154;
                      if (os_log_type_enabled(v154, v155))
                      {
                        v156 = AXColorizeFormatLog( 1LL,  @"Failed to load Brailliant2 braille driver, Unknown model identifier [%{public}@]");
                        mode = (__CFString *)objc_claimAutoreleasedReturnValue(v156);
                        v157 = _AXStringForArgs(mode);
                        v132 = (void *)objc_claimAutoreleasedReturnValue(v157);
                        if (os_log_type_enabled(v154, v155))
                        {
                          *(_DWORD *)buf = 138543362;
                          v180 = v132;
                          _os_log_impl(&dword_0, v154, v155, "%{public}@", buf, 0xCu);
                        }

                        v100 = 0LL;
LABEL_132:
                        v38 = v171;
                        v4 = v172;
                        v92 = v159;
                        goto LABEL_133;
                      }

                      v100 = 0LL;
LABEL_136:
                      v38 = v171;
                      v4 = v172;
                      v52 = v170;
                      v92 = v159;
                      goto LABEL_137;
                    }

                    v100 = 0LL;
LABEL_122:
                    v38 = v171;
                    v4 = v172;
                    v92 = v159;
                    goto LABEL_95;
                  }

                  v135 = (os_log_s *)v134;
                  self->_isDriverLoaded = 1;
                  v136 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v137 = [v136 ignoreLogging];

                  log = v135;
                  if ((v137 & 1) != 0)
                  {
                    LODWORD(v32) = 0;
                    v38 = v171;
                    v4 = v172;
                    v92 = v159;
                    goto LABEL_104;
                  }

                  v146 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                  v147 = AXLoggerForFacility();
                  v119 = (NSLock *)objc_claimAutoreleasedReturnValue(v147);

                  v148 = AXOSLogLevelFromAXLogLevel(1LL);
                  if (os_log_type_enabled((os_log_t)v119, v148))
                  {
                    v149 = AXColorizeFormatLog(1LL, @"Successful Brailliant2 braille driver load %@");
                    modea = (CFRunLoopMode)objc_claimAutoreleasedReturnValue(v149);
                    v150 = _AXStringForArgs(modea);
                    v151 = (void *)objc_claimAutoreleasedReturnValue(v150);
                    if (os_log_type_enabled((os_log_t)v119, v148))
                    {
                      *(_DWORD *)buf = 138543362;
                      v180 = v151;
                      _os_log_impl(&dword_0, (os_log_t)v119, v148, "%{public}@", buf, 0xCu);
                    }

                    LODWORD(v32) = 0;
                    v38 = v171;
                    v4 = v172;
                    v52 = v170;
                    v92 = v159;
                    modelIdentifier = &modea->isa;
                    goto LABEL_102;
                  }

                  LODWORD(v32) = 0;
                  v38 = v171;
                  v4 = v172;
                  v52 = v170;
                  v92 = v159;
LABEL_103:

                  v29 = v166;
LABEL_104:

                  goto LABEL_58;
                }
              }

              v100 = 0LL;
            }

            else
            {
              v100 = 0LL;
              v4 = v172;
            }

            v38 = v171;
            goto LABEL_95;
          }

          v32 = v53;
          v54 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
          v55 = [v54 ignoreLogging];

          if ((v55 & 1) == 0)
          {
            v165 = v29;
            v168 = v52;
            v56 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            v57 = AXLoggerForFacility();
            v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);

            v59 = AXOSLogLevelFromAXLogLevel(1LL);
            if (os_log_type_enabled(v58, v59))
            {
              v60 = AXColorizeFormatLog(1LL, @"Failed to load Brailliant2 can't open braille com port: %@");
              v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
              v158 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v32));
              v62 = _AXStringForArgs(v61);
              v63 = (void *)objc_claimAutoreleasedReturnValue(v62);

              if (os_log_type_enabled(v58, v59))
              {
                *(_DWORD *)buf = 138543362;
                v180 = v63;
                _os_log_impl(&dword_0, v58, v59, "%{public}@", buf, 0xCu);
              }
            }

            v29 = v165;
            v52 = v168;
          }

          -[os_log_s removeObserver:](v52, "removeObserver:", self);
        }

        else
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
          v67 = [v66 ignoreLogging];

          if ((v67 & 1) == 0)
          {
            v169 = v52;
            v68 = v29;
            v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
            v70 = AXLoggerForFacility();
            v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);

            v72 = AXOSLogLevelFromAXLogLevel(1LL);
            if (os_log_type_enabled(v71, v72))
            {
              v73 = AXColorizeFormatLog( 1LL,  @"Failed to load Brailliant2 braille driver because the device is no longer connected over bluetooth.");
              v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
              v75 = _AXStringForArgs(v74);
              v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
              if (os_log_type_enabled(v71, v72))
              {
                *(_DWORD *)buf = 138543362;
                v180 = v76;
                _os_log_impl(&dword_0, v71, v72, "%{public}@", buf, 0xCu);
              }
            }

            v29 = v68;
            uint64_t v18 = v173;
            v52 = v169;
          }

          -[os_log_s removeObserver:](v52, "removeObserver:", self);
          LODWORD(v32) = 1;
        }

        v4 = v172;
      }

      else
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
        v65 = [v64 ignoreLogging];

        v4 = v172;
        if ((v65 & 1) != 0)
        {
          LODWORD(v32) = 1;
          v38 = v171;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }

        v83 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v84 = AXLoggerForFacility();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);

        LODWORD(v32) = 1;
        v85 = AXOSLogLevelFromAXLogLevel(1LL);
        if (os_log_type_enabled(v52, v85))
        {
          v86 = AXColorizeFormatLog( 1LL,  @"Failed to load Brailliant2 braille driver because we found no matching paired device");
          v87 = v52;
          v88 = (void *)objc_claimAutoreleasedReturnValue(v86);
          v89 = _AXStringForArgs(v88);
          v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
          v91 = v87;
          if (os_log_type_enabled(v87, v85))
          {
            *(_DWORD *)buf = 138543362;
            v180 = v90;
            _os_log_impl(&dword_0, v87, v85, "%{public}@", buf, 0xCu);
          }

          v38 = v171;
          v4 = v172;
          v52 = v91;
          goto LABEL_58;
        }
      }

      v38 = v171;
LABEL_58:

      goto LABEL_59;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v40 = [v39 ignoreLogging];

    if ((v40 & 1) == 0)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v79 = AXLoggerForFacility();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v79);

      LODWORD(v32) = 1;
      v80 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v18, v80)) {
        goto LABEL_62;
      }
      v81 = AXColorizeFormatLog( 1LL,  @"Failed to load Brailliant2 braille driver because we have no bundle identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v81);
      v82 = _AXStringForArgs(v38);
      v29 = (id)objc_claimAutoreleasedReturnValue(v82);
      if (os_log_type_enabled((os_log_t)v18, v80))
      {
        *(_DWORD *)buf = 138543362;
        v180 = v29;
        _os_log_impl(&dword_0, (os_log_t)v18, v80, "%{public}@", buf, 0xCu);
      }

      goto LABEL_60;
    }

    LODWORD(v32) = 1;
LABEL_63:

    goto LABEL_64;
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
  v31 = [v30 ignoreLogging];

  if ((v31 & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
    v34 = AXLoggerForFacility();
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v34);

    LODWORD(v32) = 1;
    v35 = AXOSLogLevelFromAXLogLevel(1LL);
    if (os_log_type_enabled((os_log_t)v16, v35))
    {
      v36 = AXColorizeFormatLog( 1LL,  @"Failed to load Brailliant2 braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v36);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v37 = _AXStringForArgs(v18);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled((os_log_t)v16, v35))
      {
        *(_DWORD *)buf = 138543362;
        v180 = v38;
        _os_log_impl(&dword_0, (os_log_t)v16, v35, "%{public}@", buf, 0xCu);
      }

      goto LABEL_61;
    }

    goto LABEL_63;
  }

  LODWORD(v32) = 1;
LABEL_64:

  return v32;
}

uint64_t _modelIdentifierForDeviceIdentifier(int a1)
{
  else {
    return (uint64_t)*(&off_4258 + a1 - 1);
  }
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}