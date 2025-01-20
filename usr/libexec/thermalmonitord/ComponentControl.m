@interface ComponentControl
- (BOOL)allowLIOverride;
- (BOOL)initialCPMSBudgetSent;
- (BOOL)isCPMSControlActive;
- (BOOL)isCPMSControlEnabled;
- (BOOL)isEqualMType:(int)a3;
- (BOOL)shouldDoCPMSActions;
- (ComponentControl)initWithCC:(int)a3 :(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (__CFString)getPowerlogKey;
- (int)getPowerlogFieldCurrentValue;
- (int)getReleaseMaxLI;
- (int)getReleaseRate;
- (int)numberOfFields;
- (unint64_t)mitigationDetails;
- (unsigned)computePowerTarget;
- (unsigned)currentLoadingIndex;
- (unsigned)currentPower;
- (unsigned)maxLoadingIndex;
- (unsigned)powerTarget;
- (unsigned)releaseMaxLI;
- (unsigned)releaseRate;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)refreshCPMSTGraphTelemetry;
- (void)resetCPMSMitigationState;
- (void)setAllowLIOverride:(BOOL)a3;
- (void)setCPMSMitigationState:(BOOL)a3;
- (void)setCurrentLoadingIndex:(unsigned int)a3;
- (void)setCurrentPower:(unsigned int)a3;
- (void)setInitialCPMSBudgetSent:(BOOL)a3;
- (void)setIsCPMSControlActive:(BOOL)a3;
- (void)setIsCPMSControlEnabled:(BOOL)a3;
- (void)setMaxLoadingIndex:(unsigned int)a3;
- (void)setMaxLoadingIndex:(unsigned int)a3 releaseIndex:(unsigned int)a4;
- (void)setMitigationDetails:(unint64_t)a3;
- (void)setPowerTarget:(unsigned int)a3;
- (void)setReleaseMaxLI:(unsigned int)a3;
- (void)setReleaseRate:(unsigned int)a3;
- (void)testLoadingIndexLevel;
- (void)updatePowerParameters:(__CFDictionary *)a3;
@end

@implementation ComponentControl

- (ComponentControl)initWithCC:(int)a3 :(__CFDictionary *)a4
{
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ComponentControl;
  v6 = -[PidComponent initPIDWith:](&v9, "initPIDWith:", a4);
  v7 = v6;
  if (v6)
  {
    *((_BYTE *)&v6->super.controlEffort + 4) = 0;
    *(_DWORD *)&v6->allowLIOverride = 0;
    v6->currentLoadingIndex = 100;
    v6->previousValue = 100;
    v6->super.mitigationType = v5;
    v6->super.nameofComponent = 0LL;
    v6->maxLoadingIndex = 100;
    v6->releaseMaxLI = 999;
    sub_100020FE0(a4, @"MaxReleaseRate", kCFNumberIntType, &v6->releaseMaxLI);
    v7->_powerlogKeyMaxLI = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"Max LI%d", v5);
    v7->_nominalPowerTarget = 0;
    v7->_maxPower = 0;
    v7->powerTarget = 0;
    v7->currentPower = 0;
    v7->isCPMSControlActive = 0;
    LOBYTE(v7->_minPower) = 0;
    v7->mitigationDetails = 0LL;
    v7->initialCPMSBudgetSent = 0;
  }

  return v7;
}

- (void)defaultAction
{
  v2 = (os_log_s *)qword_10007CF50;
  if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
    sub_10003A914(v2);
  }
}

- (void)defaultCPMSAction
{
  uint64_t v3 = -[ComponentControl computePowerTarget](self, "computePowerTarget");
  if (self->initialCPMSBudgetSent)
  {
    if (self->previousValue != self->maxLoadingIndex)
    {
      if ((_DWORD)v3 != -[ComponentControl powerTarget](self, "powerTarget"))
      {
        -[ComponentControl setPowerTarget:](self, "setPowerTarget:", v3);
        if (byte_10007CB30)
        {
          v4 = (os_log_s *)qword_10007CF50;
          if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
          {
            int v6 = 138412802;
            v7 = -[PidComponent nameofComponent](self, "nameofComponent");
            __int16 v8 = 1024;
            unsigned int v9 = -[ComponentControl powerTarget](self, "powerTarget");
            __int16 v10 = 2048;
            unint64_t v11 = -[ComponentControl mitigationDetails](self, "mitigationDetails");
            _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> DefaultCPMSAction for %@, set powerTarget:%u with details: %llu",  (uint8_t *)&v6,  0x1Cu);
          }
        }

        -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "addToCPMSMitigationArray:withDetails:forComponent:",  -[ComponentControl powerTarget](self, "powerTarget"),  -[ComponentControl mitigationDetails](self, "mitigationDetails"),  -[PidComponent mitigationType](self, "mitigationType"));
      }

      self->maxLoadingIndex = self->previousValue;
    }
  }

  else
  {
    if (byte_10007CB30)
    {
      uint64_t v5 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412802;
        v7 = -[PidComponent nameofComponent](self, "nameofComponent");
        __int16 v8 = 1024;
        unsigned int v9 = v3;
        __int16 v10 = 2048;
        unint64_t v11 = -[ComponentControl mitigationDetails](self, "mitigationDetails");
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Initial CPMS budget sent for %@, set powerTarget:%u with details: %llu",  (uint8_t *)&v6,  0x1Cu);
      }
    }

    -[CPMSHelper addToCPMSMitigationArray:withDetails:forComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "addToCPMSMitigationArray:withDetails:forComponent:",  v3,  -[ComponentControl mitigationDetails](self, "mitigationDetails"),  -[PidComponent mitigationType](self, "mitigationType"));
    self->initialCPMSBudgetSent = 1;
  }

- (unsigned)computePowerTarget
{
  unsigned int result = self->releaseRate;
  unsigned int maxPower = self->_maxPower;
  int v5 = self->_nominalPowerTarget - maxPower;
  if (v5 >= 1)
  {
    unsigned int previousValue = self->previousValue;
    if (previousValue <= 0x64) {
      return previousValue * v5 / 0x64 + maxPower;
    }
  }

  return result;
}

- (BOOL)isEqualMType:(int)a3
{
  return -[PidComponent mitigationType](self, "mitigationType") == a3;
}

- (void)refreshCPMSTGraphTelemetry
{
  if (-[ComponentControl shouldDoCPMSActions](self, "shouldDoCPMSActions")) {
    -[CPMSHelper requestCurrentPowerCallbackForComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "requestCurrentPowerCallbackForComponent:",  -[PidComponent mitigationType](self, "mitigationType"));
  }
}

- (void)setMaxLoadingIndex:(unsigned int)a3 releaseIndex:(unsigned int)a4
{
  if (!*((_BYTE *)&self->super.controlEffort + 4))
  {
    self->currentLoadingIndex = a3;
    self->unsigned int previousValue = a4;
  }

- (void)testLoadingIndexLevel
{
  if (sub_100019D18())
  {
    -[ComponentControl refreshTGraphTelemetry](self, "refreshTGraphTelemetry");
    if (!byte_10007CB31) {
      -[ComponentControl refreshCPMSTGraphTelemetry](self, "refreshCPMSTGraphTelemetry");
    }
  }

  -[ComponentControl refreshFunctionalTelemetry](self, "refreshFunctionalTelemetry");
  -[ComponentControl updateSensorExchangeTelemetry](self, "updateSensorExchangeTelemetry");
  if (byte_1000748C0) {
    BOOL v3 = byte_10007CB31 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    if (-[ComponentControl shouldDoCPMSActions](self, "shouldDoCPMSActions")) {
      -[ComponentControl defaultCPMSAction](self, "defaultCPMSAction");
    }
    else {
      -[ComponentControl defaultAction](self, "defaultAction");
    }
  }

- (BOOL)shouldDoCPMSActions
{
  BOOL v3 = -[ComponentControl isCPMSControlEnabled](self, "isCPMSControlEnabled");
  if (v3) {
    LOBYTE(v3) = -[ComponentControl isCPMSControlActive](self, "isCPMSControlActive");
  }
  return v3;
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  if (!a3)
  {
    -[ComponentControl setIsCPMSControlEnabled:](self, "setIsCPMSControlEnabled:");
LABEL_6:
    -[ComponentControl resetCPMSMitigationState](self, "resetCPMSMitigationState");
    return;
  }

  -[ComponentControl setIsCPMSControlEnabled:](self, "setIsCPMSControlEnabled:", 1LL);
  -[CPMSHelper updateCPMSClientState:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "updateCPMSClientState:",  -[PidComponent mitigationType](self, "mitigationType"));
  if (!-[CPMSHelper isCPMSSupportedClient:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "isCPMSSupportedClient:",  -[PidComponent mitigationType](self, "mitigationType")))
  {
    if (byte_10007CB30)
    {
      v4 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 67109120;
        unsigned int v11 = -[PidComponent mitigationType](self, "mitigationType");
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "<Notice> mitigationType:%u is not a supported cpms client!",  (uint8_t *)&v10,  8u);
      }
    }

    goto LABEL_6;
  }

  if (!LOBYTE(self->_minPower))
  {
    self->_unsigned int nominalPowerTarget = -[CPMSHelper getMaxPowerForComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "getMaxPowerForComponent:",  -[PidComponent mitigationType](self, "mitigationType"));
    self->_unsigned int maxPower = -[CPMSHelper getMinPowerForComponent:]( +[CPMSHelper sharedInstance](&OBJC_CLASS___CPMSHelper, "sharedInstance"),  "getMinPowerForComponent:",  -[PidComponent mitigationType](self, "mitigationType"));
    self->releaseRate = self->_nominalPowerTarget;
  }

  unsigned int nominalPowerTarget = self->_nominalPowerTarget;
  unsigned int maxPower = self->_maxPower;
  if (nominalPowerTarget) {
    BOOL v7 = nominalPowerTarget >= maxPower;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    __int16 v8 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR))
    {
      int v10 = 67109632;
      unsigned int v11 = nominalPowerTarget;
      __int16 v12 = 1024;
      unsigned int v13 = maxPower;
      __int16 v14 = 1024;
      unsigned int v15 = -[PidComponent mitigationType](self, "mitigationType");
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "<Error> Invalid power range (max:%d min%d) for mitigationType:%u",  (uint8_t *)&v10,  0x14u);
    }

    goto LABEL_6;
  }

  if (byte_10007CB30)
  {
    unsigned int v9 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      unsigned int v11 = -[PidComponent mitigationType](self, "mitigationType");
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "<Notice> Setting CPMS control Active for mitigationType:%u",  (uint8_t *)&v10,  8u);
    }
  }

  -[ComponentControl setIsCPMSControlActive:](self, "setIsCPMSControlActive:", 1LL);
}

- (void)updatePowerParameters:(__CFDictionary *)a3
{
  if (a3)
  {
    if (CFDictionaryContainsKey(a3, @"maxThermalPower"))
    {
      LOBYTE(self->_minPower) = 1;
      sub_100020FE0(a3, @"maxPower", kCFNumberIntType, &self->releaseRate);
      sub_100020FE0(a3, @"maxThermalPower", kCFNumberIntType, &self->_nominalPowerTarget);
      sub_100020FE0(a3, @"minThermalPower", kCFNumberIntType, &self->_maxPower);
      if (byte_10007CB30)
      {
        int v5 = (os_log_s *)qword_10007CF50;
        if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = -[PidComponent nameofComponent](self, "nameofComponent");
          unsigned int releaseRate = self->releaseRate;
          unsigned int nominalPowerTarget = self->_nominalPowerTarget;
          unsigned int maxPower = self->_maxPower;
          int v10 = 138413058;
          unsigned int v11 = v6;
          __int16 v12 = 1024;
          unsigned int v13 = releaseRate;
          __int16 v14 = 1024;
          unsigned int v15 = nominalPowerTarget;
          __int16 v16 = 1024;
          unsigned int v17 = maxPower;
          _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updated %@ power params with nominal:%d max: %d min: %d",  (uint8_t *)&v10,  0x1Eu);
        }
      }
    }
  }

- (void)resetCPMSMitigationState
{
  if (!LOBYTE(self->_minPower))
  {
    self->_unsigned int maxPower = 0;
    self->_unsigned int nominalPowerTarget = 0;
  }

  -[ComponentControl setInitialCPMSBudgetSent:](self, "setInitialCPMSBudgetSent:", 0LL);
  -[ComponentControl setIsCPMSControlActive:](self, "setIsCPMSControlActive:", 0LL);
}

- (int)getReleaseRate
{
  return self->releaseMaxLI;
}

- (int)getReleaseMaxLI
{
  return self->previousValue;
}

- (int)numberOfFields
{
  return 6;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  else {
    return (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  *(&off_100061728 + a3),  self->super.nameofComponent);
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = 72LL;
      goto LABEL_9;
    case 1:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = 76LL;
      goto LABEL_9;
    case 2:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = 84LL;
      goto LABEL_9;
    case 3:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t isCPMSControlActive = self->isCPMSControlActive;
      goto LABEL_10;
    case 4:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = 132LL;
      goto LABEL_9;
    case 5:
      BOOL v3 = kCFAllocatorDefault;
      uint64_t v4 = 136LL;
LABEL_9:
      uint64_t isCPMSControlActive = *(unsigned int *)((char *)&self->super.super.isa + v4);
LABEL_10:
      unsigned int result = (__CFString *)CFStringCreateWithFormat(v3, 0LL, @"%d", isCPMSControlActive);
      break;
    default:
      unsigned int result = 0LL;
      break;
  }

  return result;
}

- (__CFString)getPowerlogKey
{
  return self->_powerlogKeyMaxLI;
}

- (int)getPowerlogFieldCurrentValue
{
  return self->currentLoadingIndex;
}

- (BOOL)allowLIOverride
{
  return *((_BYTE *)&self->super.controlEffort + 4);
}

- (void)setAllowLIOverride:(BOOL)a3
{
  *((_BYTE *)&self->super.controlEffort + 4) = a3;
}

- (unsigned)maxLoadingIndex
{
  return self->currentLoadingIndex;
}

- (void)setMaxLoadingIndex:(unsigned int)a3
{
  self->currentLoadingIndex = a3;
}

- (unsigned)currentLoadingIndex
{
  return *(_DWORD *)&self->allowLIOverride;
}

- (void)setCurrentLoadingIndex:(unsigned int)a3
{
  *(_DWORD *)&self->allowLIOverride = a3;
}

- (unsigned)releaseMaxLI
{
  return self->previousValue;
}

- (void)setReleaseMaxLI:(unsigned int)a3
{
  self->unsigned int previousValue = a3;
}

- (unsigned)releaseRate
{
  return self->releaseMaxLI;
}

- (void)setReleaseRate:(unsigned int)a3
{
  self->releaseMaxLI = a3;
}

- (BOOL)isCPMSControlEnabled
{
  return self->isCPMSControlEnabled;
}

- (void)setIsCPMSControlEnabled:(BOOL)a3
{
  self->isCPMSControlEnabled = a3;
}

- (BOOL)isCPMSControlActive
{
  return self->isCPMSControlActive;
}

- (void)setIsCPMSControlActive:(BOOL)a3
{
  self->uint64_t isCPMSControlActive = a3;
}

- (unsigned)powerTarget
{
  return self->powerTarget;
}

- (void)setPowerTarget:(unsigned int)a3
{
  self->powerTarget = a3;
}

- (unsigned)currentPower
{
  return self->currentPower;
}

- (void)setCurrentPower:(unsigned int)a3
{
  self->currentPower = a3;
}

- (unint64_t)mitigationDetails
{
  return self->mitigationDetails;
}

- (void)setMitigationDetails:(unint64_t)a3
{
  self->mitigationDetails = a3;
}

- (BOOL)initialCPMSBudgetSent
{
  return self->initialCPMSBudgetSent;
}

- (void)setInitialCPMSBudgetSent:(BOOL)a3
{
  self->initialCPMSBudgetSent = a3;
}

@end