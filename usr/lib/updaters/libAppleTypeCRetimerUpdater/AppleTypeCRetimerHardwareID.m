@interface AppleTypeCRetimerHardwareID
+ (BOOL)supportsSecureCoding;
- (AppleTypeCRetimerHardwareID)initWithChipID:(unsigned __int16)a3 boardID:(unsigned __int16)a4 securityEpoch:(unsigned __int8)a5 productionStatus:(unsigned __int8)a6 securityMode:(unsigned __int8)a7 securityDomain:(unsigned __int8)a8 ecid:(unint64_t)a9 nonce:(id)a10 chipRev:(unsigned __int8)a11;
- (BOOL)demote;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresPersonalization;
- (NSData)nonce;
- (NSDictionary)dictionary;
- (id)description;
- (id)nonceString;
- (unint64_t)ecid;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)chipRev;
- (unsigned)productionStatus;
- (unsigned)securityDomain;
- (unsigned)securityEpoch;
- (unsigned)securityMode;
- (void)setDemote:(BOOL)a3;
@end

@implementation AppleTypeCRetimerHardwareID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AppleTypeCRetimerHardwareID)initWithChipID:(unsigned __int16)a3 boardID:(unsigned __int16)a4 securityEpoch:(unsigned __int8)a5 productionStatus:(unsigned __int8)a6 securityMode:(unsigned __int8)a7 securityDomain:(unsigned __int8)a8 ecid:(unint64_t)a9 nonce:(id)a10 chipRev:(unsigned __int8)a11
{
  id v18 = a10;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerHardwareID;
  v19 = -[AppleTypeCRetimerHardwareID init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_chipID = a3;
    v19->_boardID = a4;
    v19->_securityEpoch = a5;
    v19->_productionStatus = a6;
    v19->_securityMode = a7;
    v19->_securityDomain = a8;
    v19->_ecid = a9;
    uint64_t v21 = [v18 copy];
    nonce = v20->_nonce;
    v20->_nonce = (NSData *)v21;

    v20->_chipRev = a11;
  }

  return v20;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@:\n", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", @"\tChip ID: 0x%04x\n", self->_chipID);
  objc_msgSend(v6, "appendFormat:", @"\tBoard ID: 0x%04x\n", self->_boardID);
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Epoch: %u\n", self->_securityEpoch);
  objc_msgSend(v6, "appendFormat:", @"\tProduction Status: %u\n", self->_productionStatus);
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Mode: %u\n", self->_securityMode);
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Domain: %u\n", self->_securityDomain);
  objc_msgSend(v6, "appendFormat:", @"\tECID: 0x%016llx\n", self->_ecid);
  v7 = -[AppleTypeCRetimerHardwareID nonceString](self, "nonceString");
  [v6 appendFormat:@"\tNonce: %@\n", v7];

  objc_msgSend(v6, "appendFormat:", @"\tChip Rev: %u", self->_chipRev);
  [NSString stringWithString:v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)nonceString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSData bytes](self->_nonce, "bytes");
  NSUInteger v5 = -[NSData length](self->_nonce, "length");
  if (v5)
  {
    NSUInteger v6 = v5;
    do
    {
      unsigned int v7 = *v4++;
      objc_msgSend(v3, "appendFormat:", @"%02x", v7);
      --v6;
    }

    while (v6);
  }

  [NSString stringWithString:v3];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AppleTypeCRetimerHardwareID *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      NSUInteger v5 = v4;
      int v6 = -[AppleTypeCRetimerHardwareID chipID](self, "chipID");
      if (v6 == -[AppleTypeCRetimerHardwareID chipID](v5, "chipID")
        && (int v7 = -[AppleTypeCRetimerHardwareID boardID](self, "boardID"),
            v7 == -[AppleTypeCRetimerHardwareID boardID](v5, "boardID"))
        && (int v8 = -[AppleTypeCRetimerHardwareID securityEpoch](self, "securityEpoch"),
            v8 == -[AppleTypeCRetimerHardwareID securityEpoch](v5, "securityEpoch"))
        && (int v9 = -[AppleTypeCRetimerHardwareID productionStatus](self, "productionStatus"),
            v9 == -[AppleTypeCRetimerHardwareID productionStatus](v5, "productionStatus"))
        && (int v10 = -[AppleTypeCRetimerHardwareID securityMode](self, "securityMode"),
            v10 == -[AppleTypeCRetimerHardwareID securityMode](v5, "securityMode"))
        && (int v11 = -[AppleTypeCRetimerHardwareID securityDomain](self, "securityDomain"),
            v11 == -[AppleTypeCRetimerHardwareID securityDomain](v5, "securityDomain")))
      {
        v12 = -[AppleTypeCRetimerHardwareID nonce](self, "nonce");
        v13 = -[AppleTypeCRetimerHardwareID nonce](v5, "nonce");
        if ([v12 isEqual:v13])
        {
          int v14 = -[AppleTypeCRetimerHardwareID chipRev](self, "chipRev");
          BOOL v15 = v14 == -[AppleTypeCRetimerHardwareID chipRev](v5, "chipRev");
        }

        else
        {
          BOOL v15 = 0;
        }
      }

      else
      {
        BOOL v15 = 0;
      }
    }

    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (NSDictionary)dictionary
{
  v16[10] = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedShort:", self->_chipID, @"ChipID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = @"BoardID";
  [MEMORY[0x189607968] numberWithUnsignedShort:self->_boardID];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = @"SecurityEpoch";
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_securityEpoch];
  NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = @"ProductionStatus";
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_productionStatus];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = @"SecurityMode";
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_securityMode];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  v15[5] = @"SecurityDomain";
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_securityDomain];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  v15[6] = @"ECID";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_ecid];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  nonce = self->_nonce;
  v16[6] = v9;
  v16[7] = nonce;
  v15[7] = @"Nonce";
  v15[8] = @"ChipRev";
  [MEMORY[0x189607968] numberWithUnsignedChar:self->_chipRev];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v11;
  v15[9] = @"Demote";
  [MEMORY[0x189607968] numberWithBool:self->_demote];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:v15 count:10];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (BOOL)requiresPersonalization
{
  return self->_securityMode != 0;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)securityEpoch
{
  return self->_securityEpoch;
}

- (unsigned)productionStatus
{
  return self->_productionStatus;
}

- (unsigned)securityMode
{
  return self->_securityMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (unint64_t)ecid
{
  return self->_ecid;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (unsigned)chipRev
{
  return self->_chipRev;
}

- (BOOL)demote
{
  return self->_demote;
}

- (void)setDemote:(BOOL)a3
{
  self->_demote = a3;
}

- (void).cxx_destruct
{
}

@end