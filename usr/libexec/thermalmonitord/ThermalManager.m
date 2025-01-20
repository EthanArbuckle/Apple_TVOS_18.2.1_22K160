@interface ThermalManager
- (BOOL)getPotentialForcedThermalPressureLevel;
- (BOOL)useTcalAdjust:(unsigned int)a3;
- (ThermalManager)initWithConfig:(__CFDictionary *)a3;
- (__CFRunLoop)localMainRunloop;
- (__CFString)getTGraphData:(int)a3;
- (iir_filter_t)getProductFilterValues;
- (int)canSystemSleep;
- (int)canaryTempSensorIndex;
- (int)canaryTempThreshold;
- (int)desiredLoopInterval;
- (int)getModeratePressureVersion;
- (int)getProductCalibrationDefault;
- (int)getProductCalibrationSensorID;
- (int)getProductTotalPowerSensors;
- (int)getProductTotalSensors;
- (unint64_t)getMaxSensorValue;
- (unsigned)getRequiredCalibrationResistorSamples;
- (void)SaveProductString:(int)a3;
- (void)canaryModeExitEarly:(int)a3;
- (void)checkForArcOverride:(__SCPreferences *)a3 key:(__CFString *)a4;
- (void)checkForLifetimeServoOverride:(__SCPreferences *)a3 key:(__CFString *)a4;
- (void)createConnectionToCT;
- (void)createNewProduct:(__CFRunLoop *)a3;
- (void)dealloc;
- (void)getConfigurationFor:(__CFString *)a3;
- (void)hintComponentControlTakeAction;
- (void)initDataCollection;
- (void)initializeReadPrefs:(__SCPreferences *)a3;
- (void)probeAllSupervisorControlLoadingIndex;
- (void)updatePrefs:(__SCPreferences *)a3 :(BOOL)a4;
- (void)updateSystemLoad:(BOOL)a3;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation ThermalManager

- (ThermalManager)initWithConfig:(__CFDictionary *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ThermalManager;
  result = -[ThermalManager init](&v5, "init");
  if (result)
  {
    result->product = 0LL;
    result->_plistConfig = a3;
  }

  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ThermalManager;
  -[ThermalManager dealloc](&v3, "dealloc");
}

- (void)createConnectionToCT
{
}

- (void)createNewProduct:(__CFRunLoop *)a3
{
  self->localMainRunloop = a3;
  int productName = self->productName;
  if (productName <= 15017679)
  {
    if (productName > 13629519)
    {
      switch(productName)
      {
        case 13629520:
          v4 = off_100060560;
          break;
        case 13882960:
          v4 = off_100060540;
          break;
        case 15000400:
          v4 = &off_100060568;
          break;
        default:
          return;
      }

      goto LABEL_25;
    }

    if (productName != 12204025)
    {
      if (productName != 12663315) {
        return;
      }
      v4 = off_100060558;
      goto LABEL_25;
    }

    goto LABEL_20;
  }

  if (productName > 16210479)
  {
    if (productName == 16210480)
    {
      v4 = off_100060530;
      goto LABEL_25;
    }

    if (productName != 16218160)
    {
      if (productName != 31189200) {
        return;
      }
      v4 = off_100060548;
      goto LABEL_25;
    }

- (void)getConfigurationFor:(__CFString *)a3
{
  return (void *)CFDictionaryGetValue(self->_plistConfig, a3);
}

- (int)getProductCalibrationDefault
{
  return -[CommonProduct calibrationResistorTempDefault](self->product, "calibrationResistorTempDefault");
}

- (int)getProductCalibrationSensorID
{
  return -[CommonProduct calibrationResistorSensor](self->product, "calibrationResistorSensor");
}

- (unsigned)getRequiredCalibrationResistorSamples
{
  return -[CommonProduct requiredCalibrationResistorSamples](self->product, "requiredCalibrationResistorSamples");
}

- (unint64_t)getMaxSensorValue
{
  return -[CommonProduct getMaxSensorValue](self->product, "getMaxSensorValue");
}

- (iir_filter_t)getProductFilterValues
{
  return -[CommonProduct getFilterValues](self->product, "getFilterValues");
}

- (int)getProductTotalSensors
{
  return -[CommonProduct totalSensors](self->product, "totalSensors");
}

- (int)getProductTotalPowerSensors
{
  return -[CommonProduct powerSensors](self->product, "powerSensors");
}

- (void)hintComponentControlTakeAction
{
}

- (void)initializeReadPrefs:(__SCPreferences *)a3
{
}

- (void)probeAllSupervisorControlLoadingIndex
{
}

- (void)SaveProductString:(int)a3
{
  self->int productName = a3;
}

- (int)getModeratePressureVersion
{
  return -[CommonProduct getModeratePressureVersion](self->product, "getModeratePressureVersion");
}

- (void)updatePrefs:(__SCPreferences *)a3 :(BOOL)a4
{
  kern_return_t v71;
  int v72;
  kern_return_t v73;
  os_log_s *v74;
  os_log_s *v75;
  os_log_s *v76;
  CFNumberRef v77;
  CFNumberRef v78;
  CFTypeID v79;
  CFNumberRef v80;
  CFNumberRef v81;
  CFTypeID v82;
  CFNumberRef v83;
  CFNumberRef v84;
  CFTypeID v85;
  CFNumberRef v86;
  CFNumberRef v87;
  CFTypeID v88;
  CFNumberRef v89;
  CFNumberRef v90;
  CFTypeID v91;
  CFNumberRef v92;
  CFNumberRef v93;
  CFTypeID v94;
  CFNumberRef v95;
  CFNumberRef v96;
  CFTypeID v97;
  uint64_t v98;
  unsigned int valuePtr;
  uint8_t buf[4];
  void v101[2];
  sub_10001A838(a3, (uint64_t)self, a4);
  CFBooleanRef Value = (CFBooleanRef)SCPreferencesGetValue(a3, @"overrideSensorLI");
  int v7 = Value == kCFBooleanTrue;
  byte_10007D471 = Value == kCFBooleanTrue;
  if (byte_10007CB30)
  {
    v8 = Value;
    v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "dis";
      if (v8 == kCFBooleanTrue) {
        v10 = "en";
      }
      *(_DWORD *)buf = 136315138;
      v101[0] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor status thermalOverrideLoadingIndex %sabled",  buf,  0xCu);
      int v7 = byte_10007D471;
    }
  }

  if (v7)
  {
    v11 = (const __CFArray *)SCPreferencesGetValue(a3, @"setSensorLI");
    if (v11)
    {
      v12 = v11;
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFArrayGetTypeID() && CFArrayGetCount(v12) == 2)
      {
        LODWORD(v98) = 0;
        valuePtr = 0;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 0LL);
        CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v98);
        v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v12, 1LL);
        CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
        if (byte_10007CB30)
        {
          v16 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            LODWORD(v101[0]) = v98;
            WORD2(v101[0]) = 1024;
            *(_DWORD *)((char *)v101 + 6) = valuePtr;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating Component ID: %d with loading index of %d",  buf,  0xEu);
          }
        }

        -[CommonProduct updateMaxLIFor::](self->product, "updateMaxLIFor::", v98, valuePtr, v98);
        SCPreferencesRemoveValue(a3, @"setSensorLI");
      }
    }

    byte_10007D471 = 0;
  }

  if (SCPreferencesGetValue(a3, @"removeOverrideSensorLI") == kCFBooleanTrue)
  {
    -[CommonProduct clearLoadingIndexOverrides](self->product, "clearLoadingIndexOverrides");
    SCPreferencesRemoveValue(a3, @"removeOverrideSensorLI");
    SCPreferencesRemoveValue(a3, @"overrideSensorLI");
    SCPreferencesCommitChanges(a3);
  }

  v17 = (const __CFNumber *)SCPreferencesGetValue(a3, @"currentComponent");
  if (v17)
  {
    CFNumberGetValue(v17, kCFNumberIntType, buf);
    SCPreferencesRemoveValue(a3, @"currentComponent");
    LODWORD(v98) = -[CommonProduct getCurrentMaxLIForComponent:]( self->product,  "getCurrentMaxLIForComponent:",  *(unsigned int *)buf);
    CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v98);
    SCPreferencesSetValue(a3, @"getCurrentLI", v18);
    SCPreferencesCommitChanges(a3);
    CFRelease(v18);
  }

  CFBooleanRef v19 = (CFBooleanRef)SCPreferencesGetValue(a3, @"overrideControlEffort");
  int v20 = v19 == kCFBooleanTrue;
  byte_10007D472 = v19 == kCFBooleanTrue;
  if (byte_10007CB30)
  {
    v21 = v19;
    v22 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "dis";
      if (v21 == kCFBooleanTrue) {
        v23 = "en";
      }
      *(_DWORD *)buf = 136315138;
      v101[0] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "<Notice> sensor status thermalOverrideControlEffort %sabled",  buf,  0xCu);
      int v20 = byte_10007D472;
    }
  }

  if (v20)
  {
    v24 = (const __CFArray *)SCPreferencesGetValue(a3, @"setSensorControlEffort");
    if (v24)
    {
      v25 = v24;
      CFTypeID v26 = CFGetTypeID(v24);
      if (v26 == CFArrayGetTypeID() && CFArrayGetCount(v25) == 2)
      {
        LODWORD(v98) = 0;
        valuePtr = 0;
        v27 = (const __CFNumber *)CFArrayGetValueAtIndex(v25, 0LL);
        CFNumberGetValue(v27, kCFNumberIntType, &v98);
        v28 = (const __CFNumber *)CFArrayGetValueAtIndex(v25, 1LL);
        CFNumberGetValue(v28, kCFNumberIntType, &valuePtr);
        if (byte_10007CB30)
        {
          v29 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            LODWORD(v101[0]) = v98;
            WORD2(v101[0]) = 1024;
            *(_DWORD *)((char *)v101 + 6) = valuePtr;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating Component ID: %d with control effort of %d",  buf,  0xEu);
          }
        }

        -[CommonProduct updateControlEffortFor::]( self->product,  "updateControlEffortFor::",  v98,  valuePtr);
      }
    }
  }

  else
  {
    -[CommonProduct clearControlEffortOverrides](self->product, "clearControlEffortOverrides");
  }

  v30 = (const __CFArray *)SCPreferencesGetValue(a3, @"hotSpotPIDTargetKey");
  if (v30)
  {
    v31 = v30;
    CFTypeID v32 = CFGetTypeID(v30);
    if (v32 == CFArrayGetTypeID() && CFArrayGetCount(v31) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      v33 = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 0LL);
      CFNumberGetValue(v33, kCFNumberIntType, &v98);
      v34 = (const __CFNumber *)CFArrayGetValueAtIndex(v31, 1LL);
      CFNumberGetValue(v34, kCFNumberIntType, &valuePtr);
      if (byte_10007CB30)
      {
        v35 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating Hotspot PID Target ID: %d with Target of %d",  buf,  0xEu);
        }
      }

      -[CommonProduct updateHotSpotPIDTargetFor::]( self->product,  "updateHotSpotPIDTargetFor::",  v98,  valuePtr);
      if (SCPreferencesGetValue(a3, @"hotSpotPIDTargetKeyPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"hotSpotPIDTargetKey");
        SCPreferencesCommitChanges(a3);
      }
    }
  }

  if (SCPreferencesGetValue(a3, @"removeHotspotTargetOverrides") == kCFBooleanTrue)
  {
    -[CommonProduct removeHotspotTargetOverrides](self->product, "removeHotspotTargetOverrides");
    SCPreferencesRemoveValue(a3, @"removeHotspotTargetOverrides");
    SCPreferencesCommitChanges(a3);
  }

  v36 = (const __CFArray *)SCPreferencesGetValue(a3, @"trapTarget");
  if (v36)
  {
    v37 = v36;
    CFTypeID v38 = CFGetTypeID(v36);
    if (v38 == CFArrayGetTypeID() && CFArrayGetCount(v37) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      v39 = (const __CFNumber *)CFArrayGetValueAtIndex(v37, 0LL);
      CFNumberGetValue(v39, kCFNumberIntType, &v98);
      v40 = (const __CFNumber *)CFArrayGetValueAtIndex(v37, 1LL);
      CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
      if (byte_10007CB30)
      {
        v41 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating Trap Hotspot ID: %d with Target of %d",  buf,  0xEu);
        }
      }

      -[CommonProduct updateTrapTargetFor::](self->product, "updateTrapTargetFor::", v98, valuePtr);
      if (SCPreferencesGetValue(a3, @"trapTargetPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"trapTarget");
        SCPreferencesCommitChanges(a3);
      }
    }
  }

  v42 = (const __CFArray *)SCPreferencesGetValue(a3, @"sleepTarget");
  if (v42)
  {
    v43 = v42;
    CFTypeID v44 = CFGetTypeID(v42);
    if (v44 == CFArrayGetTypeID() && CFArrayGetCount(v43) == 2)
    {
      LODWORD(v98) = 0;
      valuePtr = 0;
      v45 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 0LL);
      CFNumberGetValue(v45, kCFNumberIntType, &v98);
      v46 = (const __CFNumber *)CFArrayGetValueAtIndex(v43, 1LL);
      CFNumberGetValue(v46, kCFNumberIntType, &valuePtr);
      if (byte_10007CB30)
      {
        v47 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          LODWORD(v101[0]) = v98;
          WORD2(v101[0]) = 1024;
          *(_DWORD *)((char *)v101 + 6) = valuePtr;
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating Sleep Hotspot ID: %d with Target of %d",  buf,  0xEu);
        }
      }

      -[CommonProduct updateSleepTargetFor::](self->product, "updateSleepTargetFor::", v98, valuePtr);
      if (SCPreferencesGetValue(a3, @"sleepTargetPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"sleepTarget");
        SCPreferencesCommitChanges(a3);
      }
    }
  }

  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoStateSaveIntervalMinutes");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoDieTempMaxMax");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoDieTempMaxAverage");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoIntegratorState_E");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoInstantaneousAF_E");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoIntegratorState_P");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoInstantaneousAF_P");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoIntegratorState_G");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoInstantaneousAF_G");
  -[ThermalManager checkForLifetimeServoOverride:key:]( self,  "checkForLifetimeServoOverride:key:",  a3,  @"LifetimeServoDieTempTarget");
  v48 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryPercentRemainingKey");
  if (v48)
  {
    v49 = v48;
    CFTypeID v50 = CFGetTypeID(v48);
    if (v50 == CFNumberGetTypeID())
    {
      LODWORD(v98) = 0;
      CFNumberGetValue(v49, kCFNumberIntType, &v98);
      sub_100021DCC(v98);
      if (byte_10007CB30)
      {
        v51 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v101[0]) = v98;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "<Notice> Battery percent overriden to %d%%",  buf,  8u);
        }
      }
    }

    if (SCPreferencesGetValue(a3, @"kBatteryPercentRemainingKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryPercentRemainingKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v52 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryRawGasGaugeSOCKey");
  if (v52)
  {
    v53 = v52;
    CFTypeID v54 = CFGetTypeID(v52);
    if (v54 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v53, kCFNumberIntType, buf);
      sub_1000220C4(*(unsigned int *)buf);
    }

    if (SCPreferencesGetValue(a3, @"kBatteryRawGasGaugeSOCKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryRawGasGaugeSOCKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  v55 = (const __CFNumber *)SCPreferencesGetValue(a3, @"kBatteryChemSOCKey");
  if (v55)
  {
    v56 = v55;
    CFTypeID v57 = CFGetTypeID(v55);
    if (v57 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v56, kCFNumberIntType, buf);
      sub_100022020(*(int *)buf);
    }

    if (SCPreferencesGetValue(a3, @"kBatteryChemSOCKeyPersistentlyEnabled") != kCFBooleanTrue)
    {
      SCPreferencesRemoveValue(a3, @"kBatteryChemSOCKey");
      if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_100038BC0();
      }
    }
  }

  -[ThermalManager checkForArcOverride:key:](self, "checkForArcOverride:key:", a3, @"ArcModuleThresholdKey");
  -[ThermalManager checkForArcOverride:key:](self, "checkForArcOverride:key:", a3, @"ArcVirtualThresholdKey");
  CFBooleanRef v58 = (CFBooleanRef)SCPreferencesGetValue(a3, @"overrideCameraStrobeMaxLoad");
  int v59 = v58 == kCFBooleanTrue;
  byte_10007D473 = v58 == kCFBooleanTrue;
  if (byte_10007CB30)
  {
    v60 = v58;
    v61 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v62 = "dis";
      if (v60 == kCFBooleanTrue) {
        v62 = "en";
      }
      *(_DWORD *)buf = 136315138;
      v101[0] = v62;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "<Notice> Camera strobe override %sabled",  buf,  0xCu);
      int v59 = byte_10007D473;
    }
  }

  if (v59)
  {
    v63 = IOServiceMatching("AppleDieTempController");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v63);
    if (!MatchingService)
    {
      if (byte_10007CB30)
      {
        v76 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "<Notice> dieTempCtlService is NULL\n",  buf,  2u);
        }
      }

      goto LABEL_104;
    }

    io_registry_entry_t v65 = MatchingService;
    v98 = 0LL;
    v66 = (const __CFNumber *)SCPreferencesGetValue(a3, @"setCameraStrobeMaxLoad");
    if (v66)
    {
      v67 = v66;
      CFTypeID v68 = CFGetTypeID(v66);
      if (v68 == CFNumberGetTypeID()) {
        CFNumberGetValue(v67, kCFNumberSInt64Type, &v98);
      }
    }

    CFNumberRef v69 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v98);
    if (!v69)
    {
LABEL_104:
      if (SCPreferencesGetValue(a3, @"overrideCameraStrobeMaxLoadPersistentlyEnabled") != kCFBooleanTrue)
      {
        SCPreferencesRemoveValue(a3, @"overrideCameraStrobeMaxLoad");
        if (!SCPreferencesCommitChanges(a3) && os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
          sub_100038BC0();
        }
      }

      goto LABEL_108;
    }

    CFNumberRef v70 = v69;
    v71 = IORegistryEntrySetCFProperty(v65, @"CameraStrobeMaxLoad", v69);
    v72 = byte_10007CB30;
    if (v71 && byte_10007CB30)
    {
      v73 = v71;
      v74 = (os_log_s *)qword_10007CF50;
      if (!os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_98;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v101[0]) = v73;
      _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "<Notice> IORegistryEntrySetCFProperty returned %d\n",  buf,  8u);
      v72 = byte_10007CB30;
    }

    if (!v72)
    {
LABEL_100:
      CFRelease(v70);
      goto LABEL_104;
    }

- (void)checkForLifetimeServoOverride:(__SCPreferences *)a3 key:(__CFString *)a4
{
  CFBooleanRef Value = (const __CFNumber *)SCPreferencesGetValue(a3, a4);
  uint64_t v7 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  if (Value)
  {
    v8 = Value;
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
      uint64_t v7 = valuePtr;
    }
  }

  -[CommonProduct overrideLifetimeServoParam:value:](self->product, "overrideLifetimeServoParam:value:", a4, v7);
}

- (void)checkForArcOverride:(__SCPreferences *)a3 key:(__CFString *)a4
{
  CFBooleanRef Value = (const __CFNumber *)SCPreferencesGetValue(a3, a4);
  if (Value)
  {
    uint64_t v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID())
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
      -[CommonProduct overrideArcParam:value:](self->product, "overrideArcParam:value:", a4, valuePtr);
    }
  }

- (void)updateSystemLoad:(BOOL)a3
{
  BOOL v3 = a3;
  -[CommonProduct updateAllThermalLoad:](self->product, "updateAllThermalLoad:");
  if (byte_1000748C0) {
    -[CommonProduct updateDisplayDriver:](self->product, "updateDisplayDriver:", v3);
  }
  if (-[HidSensors isSending2DTempGridToDisplayDriverEnabled]( +[HidSensors sharedInstance](&OBJC_CLASS___HidSensors, "sharedInstance"),  "isSending2DTempGridToDisplayDriverEnabled"))
  {
    BOOL v5 = byte_1000748C0 == 0;
  }

  else
  {
    BOOL v5 = 1;
  }

  if (!v5) {
    -[CommonProduct send2DGridTempsToDisplayDriver:]( self->product,  "send2DGridTempsToDisplayDriver:",  -[CommonProduct compute2DGridTemps](self->product, "compute2DGridTemps"));
  }
  if (-[CommonProduct isSendingMaxTempToDisplayDriverEnabled](self->product, "isSendingMaxTempToDisplayDriverEnabled")
    && byte_1000748C0)
  {
    uint64_t v6 = -[CommonProduct computeMaxCGTemp](self->product, "computeMaxCGTemp");
    unsigned int v7 = dword_100074ABC - v6;
    if (v7 >= 0x33)
    {
      dword_100074ABC = v6;
      -[CommonProduct sendMaxTempToDisplayDriver:](self->product, "sendMaxTempToDisplayDriver:", v6);
    }
  }

  if (sub_100022CCC()) {
    -[CommonProduct predictSignal](self->product, "predictSignal");
  }
  -[CommonProduct updateAccessories:](self->product, "updateAccessories:", v3);
  if (dword_100074AB8 == 1)
  {
    -[CommonProduct updateLifetimeServo](self->product, "updateLifetimeServo");
    dword_100074AB8 = 0;
  }

  -[CommonProduct updateContextualClamp](self->product, "updateContextualClamp");
  -[CommonProduct updatePowerzoneTelemetry](self->product, "updatePowerzoneTelemetry");
  int v8 = dword_100074AB4;
  if (dword_100074AB4 == 120)
  {
    -[CommonProduct updateCoreAnalyticsInfo](self->product, "updateCoreAnalyticsInfo");
    int v8 = 0;
  }

  dword_100074AB4 = v8 + 1;
  ++dword_100074AB8;
}

- (void)updateSystemPowerState:(BOOL)a3
{
}

- (int)canSystemSleep
{
  return -[CommonProduct canSystemSleep](self->product, "canSystemSleep");
}

- (void)initDataCollection
{
  if (self->product) {
    -[TGraphSampler setProduct:withComponents:andHotspotSupervisors:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "setProduct:withComponents:andHotspotSupervisors:",  self->product,  -[CommonProduct listofComponentControl](self->product, "listofComponentControl"),  -[CommonProduct listOfSupervisorControl](self->product, "listOfSupervisorControl"));
  }
}

- (__CFString)getTGraphData:(int)a3
{
  return -[TGraphSampler getTGraphData:]( +[TGraphSampler sharedInstance](&OBJC_CLASS___TGraphSampler, "sharedInstance"),  "getTGraphData:",  *(void *)&a3);
}

- (BOOL)useTcalAdjust:(unsigned int)a3
{
  return -[CommonProduct useTcalAdjust:](self->product, "useTcalAdjust:", *(void *)&a3);
}

- (int)desiredLoopInterval
{
  return -[CommonProduct desiredLoopInterval](self->product, "desiredLoopInterval");
}

- (int)canaryTempSensorIndex
{
  return -[CommonProduct canaryTempSensorIndex](self->product, "canaryTempSensorIndex");
}

- (int)canaryTempThreshold
{
  return -[CommonProduct canaryTempThreshold](self->product, "canaryTempThreshold");
}

- (void)canaryModeExitEarly:(int)a3
{
}

- (BOOL)getPotentialForcedThermalPressureLevel
{
  return -[CommonProduct getPotentialForcedThermalPressureLevel]( self->product,  "getPotentialForcedThermalPressureLevel");
}

- (__CFRunLoop)localMainRunloop
{
  return self->localMainRunloop;
}

@end