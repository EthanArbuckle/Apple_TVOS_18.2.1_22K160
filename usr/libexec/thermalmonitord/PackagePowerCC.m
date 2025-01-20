@interface PackagePowerCC
- (PackagePowerCC)initWithParams:(__CFDictionary *)a3;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)updatePowerTarget;
@end

@implementation PackagePowerCC

- (PackagePowerCC)initWithParams:(__CFDictionary *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PackagePowerCC;
  v4 = -[ComponentControl initWithCC::](&v8, "initWithCC::", 13LL, 0LL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%d PackagePower ", 13LL);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    *(&v5->super.currentPower + 1) = [(id)qword_10007D4E0 requestListID];
    -[ComponentControl updatePowerParameters:](v5, "updatePowerParameters:", a3);
    if (LOBYTE(v5->super._minPower))
    {
      [(id)qword_10007D4E0 setMaxPackagePower:v5->super._nominalPowerTarget];
      -[ComponentControl setPowerTarget:](v5, "setPowerTarget:", v5->super.releaseRate);
    }

    else
    {
      v6 = (os_log_s *)qword_10007CF50;
      if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_ERROR)) {
        sub_10003A490(v6);
      }
    }

    if (sub_100020F6C(a3, @"expectsCPMSSupport", 0LL))
    {
      [(id)qword_10007D4E0 setCPMSMitigationsEnabled:1];
      -[ComponentControl setCPMSMitigationState:](v5, "setCPMSMitigationState:", 1LL);
    }

    objc_msgSend( (id)qword_10007D4E0,  "setPackagePowerCeiling:fromDecisionSource:",  -[ComponentControl powerTarget](v5, "powerTarget"),  *(&v5->super.currentPower + 1));
    [(id)qword_10007D4E0 updatePackage];
  }

  return v5;
}

- (void)defaultAction
{
}

- (void)defaultCPMSAction
{
}

- (void)updatePowerTarget
{
  if (byte_10007CB30)
  {
    v3 = (os_log_s *)qword_10007CF50;
    if (os_log_type_enabled((os_log_t)qword_10007CF50, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[ComponentControl powerTarget](self, "powerTarget");
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "<Notice> Updating PackagePower target: %u",  (uint8_t *)v4,  8u);
    }
  }

  objc_msgSend( (id)qword_10007D4E0,  "setPackagePowerCeiling:fromDecisionSource:",  -[ComponentControl powerTarget](self, "powerTarget"),  *(&self->super.currentPower + 1));
  [(id)qword_10007D4E0 updatePackage];
}

@end