LABEL_52:
                v41 = v177;
              }
            }

            else
            {
              v179 = v41;
              if (sandbox_extension_consume(v192) == -1)
              {
                v79 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                v80 = [v79 ignoreLogging];

                if ((v80 & 1) == 0)
                {
                  v81 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                  v82 = AXLoggerForFacility();
                  v83 = (os_log_s *)objc_claimAutoreleasedReturnValue(v82);

                  v84 = AXOSLogLevelFromAXLogLevel(1LL);
                  if (os_log_type_enabled(v83, v84))
                  {
                    v85 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                    v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
                    __error();
                    v87 = _AXStringForArgs(v86);
                    v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
                    if (os_log_type_enabled(v83, v84))
                    {
                      *(_DWORD *)v190 = 138543362;
                      v191 = v88;
                      _os_log_impl(&dword_0, v83, v84, "%{public}@", v190, 0xCu);
                    }

                    v41 = v179;
                  }
                }
              }

              v89 = open((const char *)buf, 131074);
              v180->_comPort = v89;
              if ((v89 & 0x80000000) == 0)
              {
                objc_storeStrong((id *)&v180->_device, v25);
                type = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:v180->_comPort closeOnDealloc:1];
                v90 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:v180 fileHandle:type];
                readerThread = v180->_readerThread;
                v180->_readerThread = v90;

                Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                v180->_safeReadBuffer = Mutable;
                if (!Mutable) {
                  goto LABEL_140;
                }
                v93 = (NSLock *)[objc_allocWithZone(NSLock) init];
                readBufferLock = v180->_readBufferLock;
                v180->_readBufferLock = v93;

                if (!v180->_readBufferLock) {
                  goto LABEL_140;
                }
                v95 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
                v180->_readBuffer = v95;
                if (!v95) {
                  goto LABEL_140;
                }
                -[SCRDFileReader start](v180->_readerThread, "start");
                v96 = 0;
                v180->_deviceID = 0;
                while (1)
                {
                  __buf = 527;
                  if ((unint64_t)write(v180->_comPort, &__buf, 4uLL) <= 3)
                  {
                    v132 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v133 = [v132 ignoreLogging];

                    if ((v133 & 1) != 0) {
                      goto LABEL_140;
                    }
                    v134 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v135 = AXLoggerForFacility();
                    v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v135);

                    v136 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v126, v136))
                    {
                      v137 = AXColorizeFormatLog(1LL, @"Failed to write to com port for configRequestPacket");
                      v129 = (void *)objc_claimAutoreleasedReturnValue(v137);
                      v138 = _AXStringForArgs(v129);
                      v131 = (void *)objc_claimAutoreleasedReturnValue(v138);
                      if (os_log_type_enabled(v126, v136))
                      {
                        *(_DWORD *)v190 = 138543362;
                        v191 = v131;
                        _os_log_impl(&dword_0, v126, v136, "%{public}@", v190, 0xCu);
                      }

                      v42 = v180;
LABEL_115:
                    }

LABEL_139:
                    goto LABEL_140;
                  }

                  v180->_bluetoothChannelIsLost = 0;
                  v180->_hasBeenUnloaded = 0;
                  v97 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.3, 0);
                  if (v180->_bluetoothChannelIsLost || v180->_hasBeenUnloaded || v97 == kCFRunLoopRunStopped)
                  {
                    v122 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v123 = [v122 ignoreLogging];

                    if ((v123 & 1) != 0) {
                      goto LABEL_140;
                    }
                    v124 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v125 = AXLoggerForFacility();
                    v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);

                    v127 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v126, v127))
                    {
                      v128 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                      v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
                      v130 = _AXStringForArgs(v129);
                      v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
                      if (os_log_type_enabled(v126, v127))
                      {
                        *(_DWORD *)v190 = 138543362;
                        v191 = v131;
                        _os_log_impl(&dword_0, v126, v127, "%{public}@", v190, 0xCu);
                      }

                      goto LABEL_115;
                    }

                    goto LABEL_139;
                  }

                  -[NSLock lock](v180->_readBufferLock, "lock");
                  Length = CFDataGetLength(v180->_readBuffer);
                  if (Length >= 1)
                  {
                    v99 = Length;
                    safeReadBuffer = v180->_safeReadBuffer;
                    BytePtr = CFDataGetBytePtr(v180->_readBuffer);
                    CFDataAppendBytes(safeReadBuffer, BytePtr, v99);
                    v196.location = 0LL;
                    v196.length = v99;
                    CFDataDeleteBytes(v180->_readBuffer, v196);
                  }

                  -[NSLock unlock](v180->_readBufferLock, "unlock");
                  if ((SCRDFreedomScientificDoesBufferContainACKPacket(v180->_safeReadBuffer) & 1) != 0)
                  {
                    v184 = 0;
                    if ((unint64_t)write(v180->_comPort, &v184, 4uLL) <= 3)
                    {
                      v163 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      v164 = [v163 ignoreLogging];

                      if ((v164 & 1) != 0) {
                        goto LABEL_140;
                      }
                      v165 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v166 = AXLoggerForFacility();
                      v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v166);

                      v167 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v126, v167))
                      {
                        v168 = AXColorizeFormatLog(1LL, @"Failed to write to com port for infoRequestPacket");
                        v145 = (void *)objc_claimAutoreleasedReturnValue(v168);
                        v169 = _AXStringForArgs(v145);
                        v147 = (void *)objc_claimAutoreleasedReturnValue(v169);
                        if (os_log_type_enabled(v126, v167))
                        {
                          *(_DWORD *)v190 = 138543362;
                          v191 = v147;
                          v148 = v126;
                          v149 = v167;
LABEL_136:
                          _os_log_impl(&dword_0, v148, v149, "%{public}@", v190, 0xCu);
                        }

LABEL_137:
                      }

                      v42 = v180;
                      goto LABEL_139;
                    }

                    v180->_bluetoothChannelIsLost = 0;
                    v180->_hasBeenUnloaded = 0;
                    v102 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.3, 0);
                    if (v180->_bluetoothChannelIsLost || v180->_hasBeenUnloaded || v102 == kCFRunLoopRunStopped)
                    {
                      v139 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                      v140 = [v139 ignoreLogging];

                      if ((v140 & 1) != 0) {
                        goto LABEL_140;
                      }
                      v141 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v142 = AXLoggerForFacility();
                      v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);

                      v143 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (!os_log_type_enabled(v126, v143)) {
                        goto LABEL_139;
                      }
                      v144 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                      v145 = (void *)objc_claimAutoreleasedReturnValue(v144);
                      v146 = _AXStringForArgs(v145);
                      v147 = (void *)objc_claimAutoreleasedReturnValue(v146);
                      if (os_log_type_enabled(v126, v143))
                      {
                        *(_DWORD *)v190 = 138543362;
                        v191 = v147;
                        v148 = v126;
                        v149 = v143;
                        goto LABEL_136;
                      }

                      goto LABEL_137;
                    }

                    -[NSLock lock](v180->_readBufferLock, "lock");
                    v103 = CFDataGetLength(v180->_readBuffer);
                    if (v103 >= 1)
                    {
                      v104 = v103;
                      v105 = v180->_safeReadBuffer;
                      v106 = CFDataGetBytePtr(v180->_readBuffer);
                      CFDataAppendBytes(v105, v106, v104);
                      v197.location = 0LL;
                      v197.length = v104;
                      CFDataDeleteBytes(v180->_readBuffer, v197);
                    }

                    -[NSLock unlock](v180->_readBufferLock, "unlock");
                    if (SCRDFreedomScientificDoesBufferContainACKPacket(v180->_safeReadBuffer))
                    {
                      PacketFromBuffer = SCRDFreedomScientificCreatePacketFromBuffer(v180->_safeReadBuffer);
                      if (PacketFromBuffer)
                      {
                        v108 = (const void *)PacketFromBuffer;
                        while (*CFDataGetBytePtr((CFDataRef)v108) != 128)
                        {
                          CFRelease(v108);
                          v108 = (const void *)SCRDFreedomScientificCreatePacketFromBuffer(v180->_safeReadBuffer);
                          if (!v108) {
                            goto LABEL_92;
                          }
                        }

                        v180->_deviceID = SCRDFreedomScientificDeviceIDForInfoEventPacket(v108);
                        CFRelease(v108);
LABEL_103:
                        deviceID = v180->_deviceID;
LABEL_104:
                        v41 = v179;
                        switch(deviceID)
                        {
                          case 2:
                            modelIdentifier = v180->_modelIdentifier;
                            v121 = @"com.apple.scrod.braille.driver.freedomscientific.focus.40.blue";
                            goto LABEL_123;
                          case 7:
                            modelIdentifier = v180->_modelIdentifier;
                            v121 = @"com.apple.scrod.braille.driver.freedomscientific.focus.2.14.blue";
                            goto LABEL_123;
                          case 8:
                            modelIdentifier = v180->_modelIdentifier;
                            v121 = @"com.apple.scrod.braille.driver.freedomscientific.focus.2.40.blue";
                            goto LABEL_123;
                          case 9:
                            modelIdentifier = v180->_modelIdentifier;
                            v121 = @"com.apple.scrod.braille.driver.freedomscientific.focus.2.80.blue";
LABEL_123:
                            v180->_modelIdentifier = &v121->isa;

                            break;
                          default:
                            break;
                        }

                        v150 = (NSLock *)objc_claimAutoreleasedReturnValue([v183 objectForKey:v180->_modelIdentifier]);
                        if (v150)
                        {
                          v151 = v150;
                          v152 = (void *)objc_claimAutoreleasedReturnValue( -[NSLock objectForKey:]( v150,  "objectForKey:",  kSCROBrailleDriverMainDisplaySize));
                          v180->_mainSize = [v152 unsignedCharValue];

                          v30 = 0;
                          v180->_isDriverLoaded = 1;
                          v37 = v183;
                          goto LABEL_145;
                        }

                        v153 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                        v154 = [v153 ignoreLogging];

                        if ((v154 & 1) == 0)
                        {
                          v155 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                          v156 = AXLoggerForFacility();
                          v157 = (os_log_s *)objc_claimAutoreleasedReturnValue(v156);

                          v158 = AXOSLogLevelFromAXLogLevel(1LL);
                          if (os_log_type_enabled(v157, v158))
                          {
                            v159 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver, Unknown model identifier [%{public}@]");
                            v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
                            v161 = _AXStringForArgs(v160);
                            v162 = (void *)objc_claimAutoreleasedReturnValue(v161);
                            if (os_log_type_enabled(v157, v158))
                            {
                              *(_DWORD *)v190 = 138543362;
                              v191 = v162;
                              _os_log_impl(&dword_0, v157, v158, "%{public}@", v190, 0xCu);
                            }
                          }
                        }

LABEL_140:
                        -[SCRDFileReader invalidate](v42->_readerThread, "invalidate");
                        v170 = v42->_readerThread;
                        v42->_readerThread = 0LL;

                        v171 = v42->_safeReadBuffer;
                        if (v171)
                        {
                          CFRelease(v171);
                          v42->_safeReadBuffer = 0LL;
                        }

                        v41 = v179;
                        [v179 removeObserver:v42];
                        -[NSLock lock](v42->_readBufferLock, "lock");
                        readBuffer = v42->_readBuffer;
                        v37 = v183;
                        if (readBuffer)
                        {
                          CFRelease(readBuffer);
                          v42->_readBuffer = 0LL;
                        }

                        v173 = v42->_readBufferLock;
                        v42->_readBufferLock = 0LL;
                        v151 = v173;

                        -[NSLock unlock](v151, "unlock");
                        device = v42->_device;
                        v42->_device = 0LL;

                        v42->_deviceID = 0;
                        v42->_comPort = -1;
                        v175 = v42->_modelIdentifier;
                        v42->_modelIdentifier = 0LL;

                        v30 = 2;
LABEL_145:

                        v35 = v181;
                        v4 = v182;
LABEL_54:

                        goto LABEL_56;
                      }
                    }
                  }

LABEL_92:
                  if (++v96 == 5) {
                    goto LABEL_103;
                  }
                  deviceID = v180->_deviceID;
                  if (deviceID) {
                    goto LABEL_104;
                  }
                }
              }

              v110 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v111 = [v110 ignoreLogging];

              if ((v111 & 1) == 0)
              {
                v112 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                v113 = AXLoggerForFacility();
                v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);

                v115 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v114, v115))
                {
                  v116 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                  v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
                  v118 = _AXStringForArgs(v117);
                  v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
                  if (os_log_type_enabled(v114, v115))
                  {
                    *(_DWORD *)v190 = 138543362;
                    v191 = v119;
                    _os_log_impl(&dword_0, v114, v115, "%{public}@", v190, 0xCu);
                  }
                }

                v41 = v179;
              }

              v180->_comPort = -1;
            }
          }

          else
          {
            v69 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v70 = [v69 ignoreLogging];

            if ((v70 & 1) == 0)
            {
              v177 = v41;
              v71 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v72 = AXLoggerForFacility();
              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);

              v73 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v47, v73))
              {
                v74 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver because the device is no longer connected over bluetooth.");
                v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                v76 = _AXStringForArgs(v75);
                v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
                if (os_log_type_enabled(v47, v73))
                {
                  *(_DWORD *)buf = 138543362;
                  v194 = v77;
                  _os_log_impl(&dword_0, v47, v73, "%{public}@", buf, 0xCu);
                }
              }

              goto LABEL_52;
            }
          }

          [v41 removeObserver:v180];
          v30 = 1;
          v35 = v181;
          v4 = v182;
          v37 = v183;
          goto LABEL_54;
        }
      }

      else
      {
LABEL_20:
      }

      v53 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      v54 = [v53 ignoreLogging];

      if ((v54 & 1) != 0)
      {
        v30 = 1;
        v35 = v181;
        v4 = v182;
        v37 = v183;
      }

      else
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v58 = AXLoggerForFacility();
        v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);

        v30 = 1;
        v60 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = v181;
        if (os_log_type_enabled(v59, v60))
        {
          v61 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver because we found no matching paired device");
          v178 = objc_claimAutoreleasedReturnValue(v61);
          v62 = _AXStringForArgs(v178);
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v59, v60))
          {
            *(_DWORD *)buf = 138543362;
            v194 = v63;
            _os_log_impl(&dword_0, v59, v60, "%{public}@", buf, 0xCu);
          }

          v4 = v182;
          v37 = v183;
          v38 = v59;
          v41 = (void *)v178;
          goto LABEL_54;
        }

        v4 = v182;
        v37 = v183;
        v38 = v59;
LABEL_56:
      }

LABEL_57:
LABEL_58:
      goto LABEL_59;
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v56 = [v55 ignoreLogging];

    if ((v56 & 1) == 0)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v65 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v65);

      v30 = 1;
      v66 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v35, v66))
      {
LABEL_59:

        goto LABEL_60;
      }

      v67 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v67);
      v68 = _AXStringForArgs(v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled((os_log_t)v35, v66))
      {
        *(_DWORD *)buf = 138543362;
        v194 = (os_log_s *)v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v66, "%{public}@", buf, 0xCu);
      }

      goto LABEL_57;
    }

    v30 = 1;
LABEL_60:

    goto LABEL_61;
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
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load FreedomScientific braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v194 = (os_log_s *)v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

      goto LABEL_58;
    }

    goto LABEL_60;
  }

  v30 = 1;
LABEL_61:

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