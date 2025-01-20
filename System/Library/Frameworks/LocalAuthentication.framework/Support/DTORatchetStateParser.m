@interface DTORatchetStateParser
- ($50828A08DC8D0425568E958C1030530A)_configFromRatchetState:(SEL)a3;
- ($D506A8678E4B5D3F43C8D3396EE1B5B4)_statusFromRatchetState:(SEL)a3;
- (double)_durationFromRatchetStatus:(id *)a3 config:(id *)a4;
- (double)_resetDurationFromRatchetStatus:(id *)a3 config:(id *)a4;
- (double)_scaleDuration:(double)result;
- (id)_biometryWatchdogDTOFromConfig:(id *)a3 status:(id *)a4;
- (id)_biometryWatchdogGlobalFromConfig:(id *)a3 status:(id *)a4;
- (id)_gracePeriodStateFromConfig:(id *)a3 status:(id *)a4;
- (id)_ratchetUUIDFromACMRatchetState:(id *)a3;
- (id)gracePeriodStateFromState:(id)a3;
- (id)ratchetStateFromState:(id)a3;
- (id)watchdogPackFromState:(id)a3;
- (int64_t)_ratchetStateFromACMRatchetState:(id *)a3;
@end

@implementation DTORatchetStateParser

- (id)ratchetStateFromState:(id)a3
{
  id v4 = a3;
  -[DTORatchetStateParser _statusFromRatchetState:](self, "_statusFromRatchetState:", v4);
  -[DTORatchetStateParser _configFromRatchetState:](self, "_configFromRatchetState:", v4);

  int64_t v5 = -[DTORatchetStateParser _ratchetStateFromACMRatchetState:](self, "_ratchetStateFromACMRatchetState:", v14);
  -[DTORatchetStateParser _durationFromRatchetStatus:config:](self, "_durationFromRatchetStatus:config:", v14, v13);
  -[DTORatchetStateParser _scaleDuration:](self, "_scaleDuration:");
  double v7 = v6;
  -[DTORatchetStateParser _resetDurationFromRatchetStatus:config:]( self,  "_resetDurationFromRatchetStatus:config:",  v14,  v13);
  -[DTORatchetStateParser _scaleDuration:](self, "_scaleDuration:");
  double v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[DTORatchetStateParser _ratchetUUIDFromACMRatchetState:]( self,  "_ratchetUUIDFromACMRatchetState:",  v14));
  id v11 = [[LACDTORatchetState alloc] initWithRawValue:v5 duration:v10 resetDuration:v7 uuid:v9];

  return v11;
}

- (id)watchdogPackFromState:(id)a3
{
  id v4 = a3;
  -[DTORatchetStateParser _statusFromRatchetState:](self, "_statusFromRatchetState:", v4);
  -[DTORatchetStateParser _configFromRatchetState:](self, "_configFromRatchetState:", v4);

  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[DTORatchetStateParser _biometryWatchdogGlobalFromConfig:status:]( self,  "_biometryWatchdogGlobalFromConfig:status:",  v9,  v10));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[DTORatchetStateParser _biometryWatchdogDTOFromConfig:status:]( self,  "_biometryWatchdogDTOFromConfig:status:",  v9,  v10));
  id v7 = [[LACDTOBiometryWatchdogPack alloc] initWithBiometryWatchdogGlobal:v5 biometryWatchdogDTO:v6];

  return v7;
}

- (id)gracePeriodStateFromState:(id)a3
{
  id v4 = a3;
  -[DTORatchetStateParser _statusFromRatchetState:](self, "_statusFromRatchetState:", v4);
  -[DTORatchetStateParser _configFromRatchetState:](self, "_configFromRatchetState:", v4);

  return (id)objc_claimAutoreleasedReturnValue( -[DTORatchetStateParser _gracePeriodStateFromConfig:status:]( self,  "_gracePeriodStateFromConfig:status:",  v6,  v7));
}

- ($50828A08DC8D0425568E958C1030530A)_configFromRatchetState:(SEL)a3
{
  result = ($50828A08DC8D0425568E958C1030530A *)[a4 bytes];
  __int128 v6 = *(_OWORD *)&result->var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result->var0;
  *(_OWORD *)&retstr->var2 = v6;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&result->var4;
  return result;
}

- ($D506A8678E4B5D3F43C8D3396EE1B5B4)_statusFromRatchetState:(SEL)a3
{
  result = ($D506A8678E4B5D3F43C8D3396EE1B5B4 *)[a4 bytes];
  __int128 v6 = *(_OWORD *)&result[3].var4;
  *($0DD201535F598B6025D84F9AACEC468E *)&retstr->var3 = *($0DD201535F598B6025D84F9AACEC468E *)((char *)&result[3].var2
                                                                                             + 8);
  *(_OWORD *)&retstr->var5 = v6;
  $0DD201535F598B6025D84F9AACEC468E v7 = *($0DD201535F598B6025D84F9AACEC468E *)&result[3].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result[2].var10;
  retstr->var2 = v7;
  *(_OWORD *)((char *)&retstr->var7 + 2) = *(_OWORD *)((char *)&result[3].var5 + 2);
  return result;
}

- (double)_scaleDuration:(double)result
{
  if (LACDTORatchetStateDurationInfinite != result) {
    return result / 1000.0;
  }
  return result;
}

- (double)_durationFromRatchetStatus:(id *)a3 config:(id *)a4
{
  switch(a3->var0)
  {
    case 0:
    case 4:
      return LACDTORatchetStateDurationInfinite;
    case 1:
      unint64_t v5 = *(void *)(&a3->var0 + 1);
      goto LABEL_6;
    case 2:
      unint64_t v5 = *(void *)((char *)&a3->var5 + 2);
      goto LABEL_6;
    case 3:
      unint64_t v5 = *(unint64_t *)((char *)&a3->var7 + 2);
LABEL_6:
      double result = (double)v5;
      break;
    default:
      return result;
  }

  return result;
}

- (double)_resetDurationFromRatchetStatus:(id *)a3 config:(id *)a4
{
  switch(a3->var0)
  {
    case 0:
    case 4:
      double result = LACDTORatchetStateDurationInfinite;
      break;
    case 1:
      double result = (double)(a4->var1 + *(void *)(&a3->var0 + 1));
      break;
    case 2:
      unint64_t v5 = *(void *)((char *)&a3->var5 + 2);
      goto LABEL_6;
    case 3:
      unint64_t v5 = *(unint64_t *)((char *)&a3->var7 + 2);
LABEL_6:
      double result = (double)v5;
      break;
    default:
      return result;
  }

  return result;
}

- (int64_t)_ratchetStateFromACMRatchetState:(id *)a3
{
  uint64_t v3 = (a3->var0 - 1);
  else {
    return 0LL;
  }
}

- (id)_ratchetUUIDFromACMRatchetState:(id *)a3
{
  uint64_t v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", (char *)&a3->var1 + 4);
  if (v3)
  {
    id v4 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", 0LL);
    unsigned __int8 v5 = -[NSUUID isEqual:](v3, "isEqual:", v4);

    __int128 v6 = 0LL;
    if ((v5 & 1) == 0) {
      __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v3, "UUIDString"));
    }
  }

  else
  {
    __int128 v6 = 0LL;
  }

  return v6;
}

- (id)_gracePeriodStateFromConfig:(id *)a3 status:(id *)a4
{
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(+[LACFlags sharedInstance](&OBJC_CLASS___LACFlags, "sharedInstance"));
  unsigned int v7 = [v6 featureFlagDimpleKeyGracePeriodEnabled];

  if (v7) {
    id v8 = [[LACDTOGracePeriodState alloc] initWithTime:(double)*(unint64_t *)((char *)&a4->var8 + 2) maxThreshold:(double)a3->var5];
  }
  else {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[LACDTOGracePeriodState nullInstance](&OBJC_CLASS___LACDTOGracePeriodState, "nullInstance"));
  }
  return v8;
}

- (id)_biometryWatchdogGlobalFromConfig:(id *)a3 status:(id *)a4
{
  return  [[LACDTOBiometryWatchdog alloc] initWithIsRunning:BYTE1(a4->var4) time:(double)(*(unint64_t *)((char *)&a4->var4 + 2) / 0x3E8) minThreshold:LACDTBiometryWatchdogGlobalFallbackTime() maxThreshold:(double)(a3->var4 / 0x3E8)];
}

- (id)_biometryWatchdogDTOFromConfig:(id *)a3 status:(id *)a4
{
  return  [[LACDTOBiometryWatchdog alloc] initWithIsRunning:a4->var2.var0[12] time:(double)(*(void *)&a4->var2.var0[13] / 0x3E8uLL) minThreshold:(double)(a3->var3 / 0x3E8) maxThreshold:(double)(a3->var4 / 0x3E8)];
}

@end