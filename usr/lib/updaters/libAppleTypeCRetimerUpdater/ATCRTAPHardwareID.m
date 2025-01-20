@interface ATCRTAPHardwareID
+ (id)query;
- (BOOL)productionStatus;
- (BOOL)queryHardwareParameters;
- (BOOL)securityMode;
- (NSDictionary)personalizationParameters;
- (id)description;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)securityDomain;
@end

@implementation ATCRTAPHardwareID

+ (id)query
{
  v2 = objc_alloc_init(&OBJC_CLASS___ATCRTAPHardwareID);
  if (-[ATCRTAPHardwareID queryHardwareParameters](v2, "queryHardwareParameters")) {
    v3 = v2;
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (NSDictionary)personalizationParameters
{
  v10[4] = *MEMORY[0x1895F89C0];
  v9[0] = @"ApBoardID";
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_boardID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = @"ApChipID";
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_chipID];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = @"ApProductionMode";
  [MEMORY[0x189607968] numberWithBool:self->_productionStatus];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = @"ApSecurityMode";
  [MEMORY[0x189607968] numberWithBool:self->_securityMode];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (BOOL)queryHardwareParameters
{
  v3 = (void *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    self->_boardID = [v3 unsignedIntValue];
    v5 = (void *)MGCopyAnswer();
    v6 = v5;
    if (v5)
    {
      self->_chipID = [v5 unsignedIntValue];
      v7 = (void *)MGCopyAnswer();
      v8 = v7;
      if (v7)
      {
        self->_productionStatus = [v7 BOOLValue];
        v9 = (void *)MGCopyAnswer();
        v10 = v9;
        if (v9)
        {
          self->_securityMode = [v9 BOOLValue];
          v11 = (void *)MGCopyAnswer();
          v12 = v11;
          BOOL v13 = v11 != 0LL;
          if (v11) {
            self->_securityDomain = [v11 unsignedIntValue];
          }
        }

        else
        {
          BOOL v13 = 0;
        }
      }

      else
      {
        BOOL v13 = 0;
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@:\n", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", @"\tBoard ID: 0x%08x\n", self->_boardID);
  objc_msgSend(v6, "appendFormat:", @"\tChip ID: 0x%08x\n", self->_chipID);
  if (self->_productionStatus) {
    v7 = "True";
  }
  else {
    v7 = "False";
  }
  objc_msgSend(v6, "appendFormat:", @"\tProduction Status: %s\n", v7);
  if (self->_securityMode) {
    v8 = "True";
  }
  else {
    v8 = "False";
  }
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Mode: %s\n", v8);
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Domain: %u", self->_securityDomain);
  [NSString stringWithString:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (BOOL)productionStatus
{
  return self->_productionStatus;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

@end