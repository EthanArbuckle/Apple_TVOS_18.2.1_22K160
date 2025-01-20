LABEL_119:
                              v37 = v183;
LABEL_120:
                              -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                              v154 = self->_readerThread;
                              self->_readerThread = 0LL;

                              v155 = self->_safeReadBuffer;
                              if (v155)
                              {
                                CFRelease(v155);
                                self->_safeReadBuffer = 0LL;
                              }

                              [v40 removeObserver:self];
                              -[NSLock lock](self->_readBufferLock, "lock");
                              readBuffer = self->_readBuffer;
                              if (readBuffer)
                              {
                                CFRelease(readBuffer);
                                self->_readBuffer = 0LL;
                              }

                              v157 = self->_readBufferLock;
                              self->_readBufferLock = 0LL;
                              v158 = v157;

                              -[NSLock unlock](v158, "unlock");
                              device = self->_device;
                              self->_device = 0LL;

                              self->_comPort = -1;
                              v160 = self->_modelIdentifier;
                              self->_modelIdentifier = 0LL;

                              self->_isDeviceSleeping = 0;
                              v30 = 2;
                              goto LABEL_125;
                            }

LABEL_117:
                            v152 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                            v153 = [v152 ignoreLogging];

                            if ((v153 & 1) == 0)
                            {
                              v162 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                              v163 = AXLoggerForFacility();
                              v164 = (os_log_s *)objc_claimAutoreleasedReturnValue(v163);

                              v165 = AXOSLogLevelFromAXLogLevel(1LL);
                              v37 = v183;
                              if (os_log_type_enabled(v164, v165))
                              {
                                v166 = AXColorizeFormatLog( 1LL,  @"Failed to load Baum braille driver, No displayID");
                                v167 = (void *)objc_claimAutoreleasedReturnValue(v166);
                                v168 = _AXStringForArgs(v167);
                                v169 = (__CFString *)objc_claimAutoreleasedReturnValue(v168);
                                if (os_log_type_enabled(v164, v165))
                                {
                                  *(_DWORD *)v192 = 138543362;
                                  v193 = v169;
                                  _os_log_impl(&dword_0, v164, v165, "%{public}@", v192, 0xCu);
                                }
                              }

                              v107 = 0LL;
                              v103 = 0LL;
                              goto LABEL_120;
                            }

LABEL_118:
                            v107 = 0LL;
                            v103 = 0LL;
                            goto LABEL_119;
                          }
                        }

                        else
                        {
                          v95 = v86++ > 5;
                          if (v95) {
                            goto LABEL_117;
                          }
                        }
                      }

                      v145 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      v146 = [v145 ignoreLogging];

                      if ((v146 & 1) != 0) {
                        goto LABEL_118;
                      }
                      v147 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v148 = AXLoggerForFacility();
                      v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v148);

                      v149 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v137, v149))
                      {
                        v150 = AXColorizeFormatLog(1LL, @"Failed to write to com port for deviceIDRequest");
                        v140 = (void *)objc_claimAutoreleasedReturnValue(v150);
                        v151 = _AXStringForArgs(v140);
                        v142 = (__CFString *)objc_claimAutoreleasedReturnValue(v151);
                        if (os_log_type_enabled(v137, v149))
                        {
                          *(_DWORD *)v192 = 138543362;
                          v193 = v142;
                          v143 = v137;
                          v144 = v149;
LABEL_114:
                          _os_log_impl(&dword_0, v143, v144, "%{public}@", v192, 0xCu);
                        }

LABEL_115:
                      }

LABEL_116:
                      goto LABEL_118;
                    }

                    v123 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v124 = [v123 ignoreLogging];

                    v39 = v40;
                    if ((v124 & 1) == 0)
                    {
                      v125 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v126 = AXLoggerForFacility();
                      v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);

                      v128 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v127, v128))
                      {
                        v129 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                        v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
                        v131 = _AXStringForArgs(v130);
                        v132 = (__CFString *)objc_claimAutoreleasedReturnValue(v131);
                        if (os_log_type_enabled(v127, v128))
                        {
                          *(_DWORD *)v192 = 138543362;
                          v193 = v132;
                          _os_log_impl(&dword_0, v127, v128, "%{public}@", v192, 0xCu);
                        }

                        v39 = v40;
                      }
                    }

                    self->_comPort = -1;
                    v51 = v39;
                  }

                  [v51 removeObserver:self];
                  v30 = 1;
                  v37 = v183;
                  goto LABEL_126;
                }

                [v39 removeObserver:self];
                v30 = 1;
                v16 = v180;
                v4 = v181;
                v35 = v182;
LABEL_49:
                v37 = v183;
                goto LABEL_127;
              }

LABEL_37:
              v52 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v53 = [v52 ignoreLogging];

              if ((v53 & 1) != 0)
              {
                v30 = 1;
                v16 = v180;
                v4 = v181;
                v35 = v182;
                v37 = v183;
                goto LABEL_129;
              }

              v56 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v57 = AXLoggerForFacility();
              v38 = (id)objc_claimAutoreleasedReturnValue(v57);

              v30 = 1;
              v58 = AXOSLogLevelFromAXLogLevel(1LL);
              v35 = v182;
              if (!os_log_type_enabled((os_log_t)v38, v58))
              {
                v16 = v180;
                v4 = v181;
                v37 = v183;
                goto LABEL_128;
              }

              v59 = AXColorizeFormatLog( 1LL,  @"Failed to load Baum braille driver because we found no matching paired device");
              v39 = (void *)objc_claimAutoreleasedReturnValue(v59);
              v60 = _AXStringForArgs(v39);
              v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled((os_log_t)v38, v58))
              {
                buf = 138543362;
                v196 = v61;
                _os_log_impl(&dword_0, (os_log_t)v38, v58, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              v30 = 1;
              v16 = v180;
              v4 = v181;
              goto LABEL_49;
            }
          }

          v22 = [v20 countByEnumeratingWithState:&v187 objects:v197 count:16];
        }

        while (v22);
      }

      goto LABEL_37;
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
        v65 = AXColorizeFormatLog(1LL, @"Failed to load Baum brialle driver because we have no bundle identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue(v65);
        v66 = _AXStringForArgs(v37);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled((os_log_t)v35, v64))
        {
          buf = 138543362;
          v196 = v18;
          _os_log_impl(&dword_0, (os_log_t)v35, v64, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_129;
      }

      goto LABEL_131;
    }

    v30 = 1;
LABEL_132:
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
        v34 = AXColorizeFormatLog( 1LL,  @"Failed to load Baum braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        [v4 transport];
        [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
        v36 = _AXStringForArgs(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)v16, v33))
        {
          buf = 138543362;
          v196 = v37;
          _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", (uint8_t *)&buf, 0xCu);
        }

        goto LABEL_130;
      }

      goto LABEL_132;
    }

    v30 = 1;
  }

  return v30;
}

CFStringRef _modelIdentifierForDeviceIdentifier(void *a1, uint64_t *a2)
{
  id v3 = a1;
  v4 = v3;
  if (a2)
  {
    if ([v3 isEqualToString:kSCRDBaumRefreshabraille18DeviceIdentifier])
    {
      *a2 = 22LL;
      v5 = @"com.apple.scrod.braille.driver.baum.aph.refreshabraille.18";
    }

    else
    {
      v5 = 0LL;
    }

    if (([v4 isEqualToString:kSCRDOrbitReader20DeviceIdentifier] & 1) != 0
      || ([v4 isEqualToString:kSCRDNLSEReaderZoomaxDeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.orbit.reader.20";
      uint64_t v6 = 34LL;
    }

    else if ([v4 isEqualToString:kSCRDOrbitReader40DeviceIdentifier])
    {
      v5 = @"com.apple.scrod.braille.driver.baum.orbit.reader.40";
      uint64_t v6 = 35LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailleConnect12DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumConnyDeviceIdentifier] & 1) != 0
    }
           || ([v4 isEqualToString:kSCRDBaumVarioConnect12DeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.varioconnect.12";
      uint64_t v6 = 1LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailleConnect24DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumVarioConnect24DeviceIdentifier] & 1) != 0)
    }
    {
      v5 = @"com.apple.scrod.braille.driver.baum.varioconnect.24";
      uint64_t v6 = 3LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailleConnect32DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumVarioConnect32DeviceIdentifier] & 1) != 0)
    }
    {
      v5 = @"com.apple.scrod.braille.driver.baum.varioconnect.32";
      uint64_t v6 = 5LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailleConnect40DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumVarioConnect40DeviceIdentifier] & 1) != 0)
    }
    {
      v5 = @"com.apple.scrod.braille.driver.baum.varioconnect.40";
      uint64_t v6 = 7LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailliant14DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumPDIBrailliant14DeviceIdentifier] & 1) != 0)
    }
    {
      v5 = @"com.apple.scrod.braille.driver.baum.pocketvario.14";
      uint64_t v6 = 11LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailliant24DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumPocketVario24DeviceIdentifier] & 1) != 0
    }
           || ([v4 isEqualToString:kSCRDBaumPDIBrailliant24DeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.pocketvario.24";
      uint64_t v6 = 9LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailliant32DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumSuperVario32DeviceIdentifier] & 1) != 0
    }
           || ([v4 isEqualToString:kSCRDBaumPDIBrailliant32DeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.supervario.32";
      uint64_t v6 = 12LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailliant40DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumSuperVario40DeviceIdentifier] & 1) != 0
    }
           || ([v4 isEqualToString:kSCRDBaumPDIBrailliant40DeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.supervario.40";
      uint64_t v6 = 14LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailliant64DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumSuperVario64DeviceIdentifier] & 1) != 0
    }
           || ([v4 isEqualToString:kSCRDBaumPDIBrailliant64DeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.supervario.64";
      uint64_t v6 = 16LL;
    }

    else if (([v4 isEqualToString:kSCRDBaumBrailliant80DeviceIdentifier] & 1) != 0 {
           || ([v4 isEqualToString:kSCRDBaumSuperVario80DeviceIdentifier] & 1) != 0
    }
           || ([v4 isEqualToString:kSCRDBaumPDIBrailliant80DeviceIdentifier] & 1) != 0)
    {
      v5 = @"com.apple.scrod.braille.driver.baum.supervario.80";
      uint64_t v6 = 18LL;
    }

    else if ([v4 isEqualToString:kSCRDBaumPronto18DeviceIdentifier])
    {
      v5 = @"com.apple.scrod.braille.driver.baum.pronto.18";
      uint64_t v6 = 23LL;
    }

    else if ([v4 isEqualToString:kSCRDBaumPronto40DeviceIdentifier])
    {
      v5 = @"com.apple.scrod.braille.driver.baum.pronto.40";
      uint64_t v6 = 24LL;
    }

    else if ([v4 isEqualToString:kSCRDBaumVarioUltra20DeviceIdentifier])
    {
      v5 = @"com.apple.scrod.braille.driver.baum.vario.ultra.20";
      uint64_t v6 = 25LL;
    }

    else if ([v4 isEqualToString:kSCRDBaumVarioUltra32DeviceIdentifier])
    {
      v5 = @"com.apple.scrod.braille.driver.baum.vario.ultra.32";
      uint64_t v6 = 26LL;
    }

    else if ([v4 isEqualToString:kSCRDBaumVarioUltra40DeviceIdentifier])
    {
      v5 = @"com.apple.scrod.braille.driver.baum.vario.ultra.40";
      uint64_t v6 = 27LL;
    }

    else
    {
      v5 = @"com.apple.scrod.braille.driver.nbp.b2g";
      uint64_t v6 = 36LL;
    }

    *a2 = v6;
  }

  else
  {
    v5 = 0LL;
  }

LABEL_10:
  return v5;
}

LABEL_32:
      CFRelease(v12);
      v12 = (const __CFData *)SCRDBaumCreatePacketFromBuffer(self->_safeReadBuffer, self->_mainSize);
      if (!v12) {
        goto LABEL_33;
      }
    }

    if (!SCRDBaumGetSizeFromDisplaySizePacket(v12, &v18)
      || self->_mainSize != v18
      || !self->_isDeviceSleeping)
    {
      goto LABEL_32;
    }

    self->_isDeviceSleeping = 0;
    v14 = self;
    v15 = 0LL;
    goto LABEL_30;
  }

LABEL_33:
  if ([v9 count]) {
    v16 = v9;
  }
  else {
    v16 = 0LL;
  }
  v17 = v16;

  return v17;
}

void _MSCRODebugAbortPrint(uint64_t a1, uint64_t a2, id a3)
{
  id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"===================================\nVoiceOver Error: %s:%d\nError: %s\nBreak on _MSCRODebugAbortPrint to debug\n", a1, a2, [a3 cStringUsingEncoding:4]));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"VoiceOver Debug Abort",  v4,  0LL));
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