LABEL_51:
            v60 = v248;
            [v248 removeObserver:self];
            v30 = 1;
            goto LABEL_52;
          }

          if (BTDeviceGetComPortForServiceWithSandboxExtension( [v39 device],  0x2000,  buf,  512,  v266))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v42 = [v41 ignoreLogging];

            v37 = (void *)v251;
            if ((v42 & 1) == 0)
            {
              v43 = v39;
              v44 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v45 = AXLoggerForFacility();
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);

              v47 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v46, v47))
              {
                v48 = AXColorizeFormatLog(1LL, @"Failed to open bt com port - BTError [%ld]");
                v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
                v50 = _AXStringForArgs(v49);
                v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v46, v47))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v51;
                  _os_log_impl(&dword_0, v46, v47, "%{public}@", v264, 0xCu);
                }
              }

LABEL_50:
              v39 = v43;
              goto LABEL_51;
            }

            goto LABEL_51;
          }

          v37 = (void *)v251;
          if (sandbox_extension_consume(v266) == -1)
          {
            v78 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v79 = [v78 ignoreLogging];

            if ((v79 & 1) == 0)
            {
              v80 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v81 = AXLoggerForFacility();
              v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);

              v83 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v82, v83))
              {
                v84 = v39;
                v85 = AXColorizeFormatLog(1LL, @"Failed to consume BT com port sandbox extension [%ld]");
                v86 = (void *)objc_claimAutoreleasedReturnValue(v85);
                __error();
                v87 = _AXStringForArgs(v86);
                v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
                if (os_log_type_enabled(v82, v83))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v88;
                  _os_log_impl(&dword_0, v82, v83, "%{public}@", v264, 0xCu);
                }

                v39 = v84;
              }
            }
          }

          v89 = open((const char *)buf, 131074);
          self->_comPort = v89;
          if (v89 < 0)
          {
            v164 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
            v165 = [v164 ignoreLogging];

            if ((v165 & 1) == 0)
            {
              v166 = v39;
              v167 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v168 = AXLoggerForFacility();
              v169 = (os_log_s *)objc_claimAutoreleasedReturnValue(v168);

              v170 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v169, v170))
              {
                v171 = AXColorizeFormatLog(1LL, @"Failed to open com port [%ld]");
                v172 = (void *)objc_claimAutoreleasedReturnValue(v171);
                v173 = _AXStringForArgs(v172);
                v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
                if (os_log_type_enabled(v169, v170))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v174;
                  _os_log_impl(&dword_0, v169, v170, "%{public}@", v264, 0xCu);
                }
              }

              v39 = v166;
            }

            self->_comPort = -1;
            goto LABEL_51;
          }

          objc_storeStrong((id *)&self->_device, v25);
          v245 = [objc_allocWithZone(NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
          v90 = (SCRDFileReader *)[objc_allocWithZone(SCRDFileReader) initWithDelegate:self fileHandle:v245];
          readerThread = self->_readerThread;
          self->_readerThread = v90;

          Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          self->_safeReadBuffer = Mutable;
          if (!Mutable) {
            goto LABEL_171;
          }
          v93 = (NSLock *)[objc_allocWithZone(NSLock) init];
          readBufferLock = self->_readBufferLock;
          self->_readBufferLock = v93;

          if (!self->_readBufferLock) {
            goto LABEL_171;
          }
          v95 = CFDataCreateMutable(kCFAllocatorDefault, 0LL);
          self->_readBuffer = v95;
          if (!v95) {
            goto LABEL_171;
          }
          -[SCRDFileReader start](self->_readerThread, "start");
          LOBYTE(v96) = 0;
          v97 = 0;
          v98 = 0;
          v243 = v39;
          while (1)
          {
            modelIdentifier = self->_modelIdentifier;
            if (modelIdentifier || (v96 & 1) != 0 || (v97 & 1) != 0) {
              goto LABEL_133;
            }
            v259 = 63;
            __buf = 16155;
            if ((unint64_t)write(self->_comPort, &__buf, 3uLL) <= 2)
            {
              v185 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v186 = [v185 ignoreLogging];

              if ((v186 & 1) != 0) {
                goto LABEL_171;
              }
              v187 = v39;
              v188 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v189 = AXLoggerForFacility();
              v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v189);

              v191 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v190, v191))
              {
                v192 = AXColorizeFormatLog(1LL, @"Failed to write to com port for deviceIDRequest");
                v193 = (void *)objc_claimAutoreleasedReturnValue(v192);
                v194 = _AXStringForArgs(v193);
                v195 = (void *)objc_claimAutoreleasedReturnValue(v194);
                if (os_log_type_enabled(v190, v191))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v195;
                  goto LABEL_167;
                }

                goto LABEL_168;
              }

              goto LABEL_169;
            }

            v257 = 63;
            v256 = 17691;
            v255 = 1;
            v254 = 29211;
            if ((unint64_t)write(self->_comPort, &v254, 3uLL) <= 2)
            {
              v202 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v203 = [v202 ignoreLogging];

              if ((v203 & 1) != 0) {
                goto LABEL_171;
              }
              v187 = v39;
              v204 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v205 = AXLoggerForFacility();
              v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v205);

              v191 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v190, v191))
              {
                v206 = AXColorizeFormatLog(1LL, @"Failed to write to com port for enableRawBrailleKeysCommand");
                v193 = (void *)objc_claimAutoreleasedReturnValue(v206);
                v207 = _AXStringForArgs(v193);
                v195 = (void *)objc_claimAutoreleasedReturnValue(v207);
                if (os_log_type_enabled(v190, v191))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v195;
LABEL_167:
                  _os_log_impl(&dword_0, v190, v191, "%{public}@", v264, 0xCu);
                }

                goto LABEL_168;
              }

              goto LABEL_169;
            }

            v253 = 63;
            v252 = 19995;
            if ((unint64_t)write(self->_comPort, &v252, 3uLL) <= 2)
            {
              v218 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v219 = [v218 ignoreLogging];

              if ((v219 & 1) != 0) {
                goto LABEL_190;
              }
              v220 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v221 = AXLoggerForFacility();
              v179 = (os_log_s *)objc_claimAutoreleasedReturnValue(v221);

              v222 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v179, v222))
              {
                v223 = AXColorizeFormatLog(1LL, @"Failed to write to com port for serialNumberRequest");
                v182 = (void *)objc_claimAutoreleasedReturnValue(v223);
                v224 = _AXStringForArgs(v182);
                v184 = (void *)objc_claimAutoreleasedReturnValue(v224);
                if (os_log_type_enabled(v179, v222))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v184;
                  _os_log_impl(&dword_0, v179, v222, "%{public}@", v264, 0xCu);
                }

                v37 = (void *)v251;
LABEL_183:
              }

LABEL_184:
              goto LABEL_190;
            }

            self->_bluetoothChannelIsLost = 0;
            self->_hasBeenUnloaded = 0;
            v100 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
            if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v100 == kCFRunLoopRunStopped)
            {
              v175 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v176 = [v175 ignoreLogging];

              if ((v176 & 1) != 0) {
                goto LABEL_190;
              }
              v177 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v178 = AXLoggerForFacility();
              v179 = (os_log_s *)objc_claimAutoreleasedReturnValue(v178);

              v180 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v179, v180))
              {
                v181 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver, bluetoothChannelIsLost [%ld], unloaded [%ld], runLoopStatus [%ld]");
                v182 = (void *)objc_claimAutoreleasedReturnValue(v181);
                v183 = _AXStringForArgs(v182);
                v184 = (void *)objc_claimAutoreleasedReturnValue(v183);
                if (os_log_type_enabled(v179, v180))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v184;
                  _os_log_impl(&dword_0, v179, v180, "%{public}@", v264, 0xCu);
                }

                goto LABEL_183;
              }

              goto LABEL_184;
            }

            v244 = v98;
            -[NSLock lock](self->_readBufferLock, "lock");
            Length = CFDataGetLength(self->_readBuffer);
            if (Length >= 1)
            {
              v102 = Length;
              safeReadBuffer = self->_safeReadBuffer;
              BytePtr = CFDataGetBytePtr(self->_readBuffer);
              CFDataAppendBytes(safeReadBuffer, BytePtr, v102);
              v270.location = 0LL;
              v270.length = v102;
              CFDataDeleteBytes(self->_readBuffer, v270);
            }

            -[NSLock unlock](self->_readBufferLock, "unlock");
            SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 27LL);
            v105 = CFDataGetLength(self->_safeReadBuffer);
            if (v105 >= 3)
            {
              v106 = v105;
              v96 = 0LL;
              v247 = 0;
              while (1)
              {
                v107 = CFDataGetBytePtr(self->_safeReadBuffer);
                v108 = v107;
                v109 = v107[1];
                if (v109 <= 0x4A) {
                  break;
                }
                if (v109 == 75)
                {
                  if (v106 < 4)
                  {
                    v121 = 0;
                    goto LABEL_127;
                  }

                  v147 = self->_safeReadBuffer;
                  v148.location = 0LL;
                  v148.length = 4LL;
                  goto LABEL_125;
                }

                if (v109 != 78) {
                  goto LABEL_118;
                }
                if (v106 >= 0xE)
                {
                  self->_hasFeaturePack = (*((_DWORD *)v107 + 2) | *((unsigned __int16 *)v107 + 6)) != 0;
                  v272.location = 0LL;
                  v272.length = 14LL;
                  CFDataDeleteBytes(self->_safeReadBuffer, v272);
                  v122 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v123 = [v122 ignoreLogging];

                  if ((v123 & 1) == 0)
                  {
                    v124 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v125 = AXLoggerForFacility();
                    v126 = (os_log_s *)objc_claimAutoreleasedReturnValue(v125);

                    v127 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v126, v127))
                    {
                      v128 = v96;
                      v129 = AXColorizeFormatLog( 1LL,  @"Received Alva6SeriesSerialNumberCommand, Has Feature Pack [%ld]");
                      v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
                      v131 = _AXStringForArgs(v130);
                      v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
                      if (os_log_type_enabled(v126, v127))
                      {
                        *(_DWORD *)v264 = 138543362;
                        v265 = v132;
                        _os_log_impl(&dword_0, v126, v127, "%{public}@", v264, 0xCu);
                      }

                      v96 = v128;
                    }
                  }

                  v121 = 1;
                  v247 = 1;
                  goto LABEL_127;
                }

LABEL_126:
                v121 = 1;
LABEL_127:
                SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 27LL);
                v150 = CFDataGetLength(self->_safeReadBuffer);
                if (v150 >= 3)
                {
                  v106 = v150;
                  if ((v121 & 1) != 0) {
                    continue;
                  }
                }

                goto LABEL_131;
              }

              if (v109 != 63)
              {
                if (v109 == 69)
                {
                  v110 = v107[2];
                  self->_availableCells = v110;
                  self->_splitPointOffset = LOBYTE(self->_mainSize) - v110;
                  v271.location = 0LL;
                  v271.length = 3LL;
                  CFDataDeleteBytes(self->_safeReadBuffer, v271);
                  v111 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                  v112 = [v111 ignoreLogging];

                  if ((v112 & 1) == 0)
                  {
                    v113 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                    v114 = AXLoggerForFacility();
                    v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);

                    v116 = AXOSLogLevelFromAXLogLevel(1LL);
                    if (os_log_type_enabled(v115, v116))
                    {
                      v117 = AXColorizeFormatLog( 1LL,  @"Received Alva6SeriesActualCellsCommand with NumberOfCells [%ld]");
                      v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
                      v119 = _AXStringForArgs(v118);
                      v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
                      if (os_log_type_enabled(v115, v116))
                      {
                        *(_DWORD *)v264 = 138543362;
                        v265 = v120;
                        _os_log_impl(&dword_0, v115, v116, "%{public}@", v264, 0xCu);
                      }
                    }
                  }

                  v121 = 1;
                  v96 = 1LL;
                  goto LABEL_127;
                }

LABEL_118:
                v121 = 1;
                v273.location = 0LL;
                v273.length = 1LL;
                CFDataDeleteBytes(self->_safeReadBuffer, v273);
                goto LABEL_127;
              }

              v133 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v134 = [v133 ignoreLogging];

              if ((v134 & 1) == 0)
              {
                v246 = v96;
                v135 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                v136 = AXLoggerForFacility();
                v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);

                v138 = AXOSLogLevelFromAXLogLevel(1LL);
                if (os_log_type_enabled(v137, v138))
                {
                  v139 = AXColorizeFormatLog(1LL, @"Received Alva6SeriesIdentityCommand with DeviceID [%ld]");
                  v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
                  v141 = _AXStringForArgs(v140);
                  v142 = (void *)objc_claimAutoreleasedReturnValue(v141);
                  if (os_log_type_enabled(v137, v138))
                  {
                    *(_DWORD *)v264 = 138543362;
                    v265 = v142;
                    _os_log_impl(&dword_0, v137, v138, "%{public}@", v264, 0xCu);
                  }
                }

                v96 = v246;
              }

              v143 = v108[2];
              if (v143 == 64)
              {
                v144 = 0;
                v145 = @"com.apple.scrod.braille.driver.alva.6.series.BC640";
                v146 = 40LL;
LABEL_123:
                v149 = self->_modelIdentifier;
                self->_modelIdentifier = &v145->isa;

                self->_deviceID = v144;
                self->_mainSize = v146;
                v37 = (void *)v251;
              }

              else if (v143 == 128)
              {
                v144 = 1;
                v145 = @"com.apple.scrod.braille.driver.alva.6.series.BC680";
                v146 = 80LL;
                goto LABEL_123;
              }

              v147 = self->_safeReadBuffer;
              v148.location = 0LL;
              v148.length = 3LL;
LABEL_125:
              CFDataDeleteBytes(v147, v148);
              goto LABEL_126;
            }

            v247 = 0;
            LOBYTE(v96) = 0;
LABEL_131:
            v98 = v244 + 1;
            v39 = v243;
            v97 = v247;
            if (v244 == 6)
            {
              modelIdentifier = self->_modelIdentifier;
LABEL_133:
              if (modelIdentifier && (v96 & 1) != 0 && (v97 & 1) != 0)
              {
                v151 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:"));
                if (v151)
                {
                  v152 = (void *)v151;
                  if (self->_mainSize < self->_availableCells)
                  {
                    v153 = v39;
                    v154 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                    v155 = [v154 ignoreLogging];

                    if ((v155 & 1) == 0)
                    {
                      v156 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                      v157 = AXLoggerForFacility();
                      v158 = (os_log_s *)objc_claimAutoreleasedReturnValue(v157);

                      v159 = AXOSLogLevelFromAXLogLevel(1LL);
                      if (os_log_type_enabled(v158, v159))
                      {
                        v160 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver, unexpected cell count.  AvailableCells [%ld] MainSize [%ld]");
                        v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
                        v162 = _AXStringForArgs(v161);
                        v163 = (void *)objc_claimAutoreleasedReturnValue(v162);
                        if (os_log_type_enabled(v158, v159))
                        {
                          *(_DWORD *)v264 = 138543362;
                          v265 = v163;
                          _os_log_impl(&dword_0, v158, v159, "%{public}@", v264, 0xCu);
                        }
                      }
                    }

                    goto LABEL_198;
                  }

                  v30 = 0;
                  self->_isDriverLoaded = 1;
                  v210 = v245;
LABEL_177:

                  v60 = v248;
LABEL_52:
                  v35 = v249;
                  v16 = v250;
LABEL_53:

                  goto LABEL_55;
                }

                v153 = v39;
                v233 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
                v234 = [v233 ignoreLogging];

                if ((v234 & 1) == 0)
                {
                  v235 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
                  v236 = AXLoggerForFacility();
                  v237 = (os_log_s *)objc_claimAutoreleasedReturnValue(v236);

                  v238 = AXOSLogLevelFromAXLogLevel(1LL);
                  if (os_log_type_enabled(v237, v238))
                  {
                    v239 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver, Unknown model identifier [%{public}@]");
                    v240 = (void *)objc_claimAutoreleasedReturnValue(v239);
                    v241 = _AXStringForArgs(v240);
                    v242 = (void *)objc_claimAutoreleasedReturnValue(v241);
                    if (os_log_type_enabled(v237, v238))
                    {
                      *(_DWORD *)v264 = 138543362;
                      v265 = v242;
                      _os_log_impl(&dword_0, v237, v238, "%{public}@", v264, 0xCu);
                    }
                  }
                }

                v152 = 0LL;
LABEL_198:
                v37 = (void *)v251;
                v39 = v153;
LABEL_172:
                v210 = v245;
                -[SCRDFileReader invalidate](self->_readerThread, "invalidate");
                v211 = self->_readerThread;
                self->_readerThread = 0LL;

                v212 = self->_safeReadBuffer;
                if (v212)
                {
                  CFRelease(v212);
                  self->_safeReadBuffer = 0LL;
                }

                [v248 removeObserver:self];
                -[NSLock lock](self->_readBufferLock, "lock");
                readBuffer = self->_readBuffer;
                if (readBuffer)
                {
                  CFRelease(readBuffer);
                  self->_readBuffer = 0LL;
                }

                v214 = self->_readBufferLock;
                self->_readBufferLock = 0LL;
                v215 = v214;

                -[NSLock unlock](v215, "unlock");
                device = self->_device;
                self->_device = 0LL;

                self->_comPort = -1;
                self->_hasFeaturePack = 0;
                v217 = self->_modelIdentifier;
                self->_modelIdentifier = 0LL;

                v30 = 2;
                goto LABEL_177;
              }

              v208 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
              v209 = [v208 ignoreLogging];

              if ((v209 & 1) != 0)
              {
LABEL_171:
                v152 = 0LL;
                goto LABEL_172;
              }

              v225 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
              v226 = AXLoggerForFacility();
              v227 = (os_log_s *)objc_claimAutoreleasedReturnValue(v226);

              v228 = AXOSLogLevelFromAXLogLevel(1LL);
              if (os_log_type_enabled(v227, v228))
              {
                v229 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver, ModelIdentifier [%{public}@], AvailableCells [%ld], FeaturePackStatusFound [%ld]");
                v230 = (void *)objc_claimAutoreleasedReturnValue(v229);
                v231 = _AXStringForArgs(v230);
                v232 = (void *)objc_claimAutoreleasedReturnValue(v231);
                if (os_log_type_enabled(v227, v228))
                {
                  *(_DWORD *)v264 = 138543362;
                  v265 = v232;
                  _os_log_impl(&dword_0, v227, v228, "%{public}@", v264, 0xCu);
                }

                v37 = (void *)v251;
              }

LABEL_190:
              v152 = 0LL;
              v39 = v243;
              goto LABEL_172;
            }
          }

          v196 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
          v197 = [v196 ignoreLogging];

          if ((v197 & 1) != 0) {
            goto LABEL_171;
          }
          v187 = v39;
          v198 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware identifier]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "identifier"));
          v199 = AXLoggerForFacility();
          v190 = (os_log_s *)objc_claimAutoreleasedReturnValue(v199);

          v191 = AXOSLogLevelFromAXLogLevel(1LL);
          if (os_log_type_enabled(v190, v191))
          {
            v200 = AXColorizeFormatLog(1LL, @"Failed to write to com port for availableCellsRequest");
            v193 = (void *)objc_claimAutoreleasedReturnValue(v200);
            v201 = _AXStringForArgs(v193);
            v195 = (void *)objc_claimAutoreleasedReturnValue(v201);
            if (os_log_type_enabled(v190, v191))
            {
              *(_DWORD *)v264 = 138543362;
              v265 = v195;
              goto LABEL_167;
            }

LABEL_168:
            v37 = (void *)v251;
          }

LABEL_169:
          v39 = v187;
          goto LABEL_171;
        }
      }

      else
      {
LABEL_20:
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
      v53 = [v52 ignoreLogging];

      if ((v53 & 1) != 0)
      {
        v30 = 1;
        v35 = v249;
        v16 = v250;
        v37 = (void *)v251;
      }

      else
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
        v57 = AXLoggerForFacility();
        v39 = (void *)objc_claimAutoreleasedReturnValue(v57);

        v30 = 1;
        v58 = AXOSLogLevelFromAXLogLevel(1LL);
        v35 = v249;
        if (os_log_type_enabled((os_log_t)v39, v58))
        {
          v59 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver because we found no matching paired device");
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          v61 = _AXStringForArgs(v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
          v37 = (void *)v251;
          if (os_log_type_enabled((os_log_t)v39, v58))
          {
            *(_DWORD *)buf = 138543362;
            v268 = v62;
            _os_log_impl(&dword_0, (os_log_t)v39, v58, "%{public}@", buf, 0xCu);
          }

          v16 = v250;
          goto LABEL_53;
        }

        v16 = v250;
        v37 = (void *)v251;
LABEL_55:
      }

LABEL_56:
LABEL_57:
      goto LABEL_58;
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemBrailleHardware sharedInstance]( &OBJC_CLASS___AXSubsystemBrailleHardware,  "sharedInstance"));
    v55 = [v54 ignoreLogging];

    if ((v55 & 1) == 0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemBrailleHardware identifier](&OBJC_CLASS___AXSubsystemBrailleHardware, "identifier"));
      v64 = AXLoggerForFacility();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v64);

      v30 = 1;
      v65 = AXOSLogLevelFromAXLogLevel(1LL);
      if (!os_log_type_enabled((os_log_t)v35, v65))
      {
LABEL_58:

        goto LABEL_59;
      }

      v66 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series brialle driver because we have no bundle identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue(v66);
      v67 = _AXStringForArgs(v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled((os_log_t)v35, v65))
      {
        *(_DWORD *)buf = 138543362;
        v268 = v18;
        _os_log_impl(&dword_0, (os_log_t)v35, v65, "%{public}@", buf, 0xCu);
      }

      goto LABEL_56;
    }

    v30 = 1;
LABEL_59:

    goto LABEL_60;
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
      v34 = AXColorizeFormatLog( 1LL,  @"Failed to load Alva6Series braille driver - Unexpected transport [%ld], conforms to protocol [%ld]");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v36 = _AXStringForArgs(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled((os_log_t)v16, v33))
      {
        *(_DWORD *)buf = 138543362;
        v268 = v37;
        _os_log_impl(&dword_0, (os_log_t)v16, v33, "%{public}@", buf, 0xCu);
      }

      goto LABEL_57;
    }

    goto LABEL_59;
  }

  v30 = 1;
LABEL_60:

  return v30;
}

LABEL_36:
          v12.location = 0LL;
          v12.length = 4LL;
          goto LABEL_7;
        case 'N':
          if (v9 < 0xE) {
            goto LABEL_30;
          }
          v12.location = 0LL;
          v12.length = 14LL;
          goto LABEL_7;
        case 'T':
          if (v9 >= 4) {
            goto LABEL_36;
          }
          goto LABEL_30;
        case 'V':
          if (v9 < 0xD) {
            goto LABEL_30;
          }
          v12.location = 0LL;
          v12.length = 13LL;
          goto LABEL_7;
        default:
          if (v11[1] != 2)
          {
LABEL_11:
            v12.location = 0LL;
            v12.length = 1LL;
            goto LABEL_7;
          }

          if (v9 >= 5)
          {
            v12.location = 0LL;
            v12.length = 5LL;
LABEL_7:
            CFDataDeleteBytes(self->_safeReadBuffer, v12);
            v13 = 1;
            goto LABEL_31;
          }

LABEL_30:
          v13 = 0;
LABEL_31:
          SCRDAdvanceBufferToPacketStart(self->_safeReadBuffer, 27LL);
          v18 = CFDataGetLength(self->_safeReadBuffer);
          if (v18 < 3) {
            goto LABEL_38;
          }
          v9 = v18;
          if ((v13 & 1) == 0) {
            goto LABEL_38;
          }
          break;
      }
    }
  }

  v10 = 0LL;
LABEL_38:
  if ([v10 count]) {
    v19 = v10;
  }
  else {
    v19 = 0LL;
  }
  v20 = v19;

  return v20;
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