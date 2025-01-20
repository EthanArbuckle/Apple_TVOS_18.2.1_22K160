@interface PS190HardwareID
- (BOOL)debugDisable;
- (BOOL)needsOTPProgramming;
- (BOOL)realHDCPKeysPresent;
- (BOOL)requiresPersonalization;
- (BOOL)securityMode;
- (NSData)nonce;
- (NSDictionary)dictionary;
- (NSNumber)boardID;
- (NSNumber)productionMode;
- (NSNumber)securityDomain;
- (NSString)hardwareRevision;
- (PS190HardwareID)initWithBoardID:(id)a3 certficateEpoch:(unsigned int)a4 chipID:(unsigned int)a5 debugDisable:(BOOL)a6 ecid:(unint64_t)a7 nonce:(id)a8 productionMode:(id)a9 realHDCPKeysPresent:(BOOL)a10 securityDomain:(id)a11 securityMode:(BOOL)a12 hardwareRevision:(id)a13;
- (id)description;
- (unint64_t)ecid;
- (unsigned)certificateEpoch;
- (unsigned)chipID;
@end

@implementation PS190HardwareID

- (PS190HardwareID)initWithBoardID:(id)a3 certficateEpoch:(unsigned int)a4 chipID:(unsigned int)a5 debugDisable:(BOOL)a6 ecid:(unint64_t)a7 nonce:(id)a8 productionMode:(id)a9 realHDCPKeysPresent:(BOOL)a10 securityDomain:(id)a11 securityMode:(BOOL)a12 hardwareRevision:(id)a13
{
  id v18 = a3;
  id v19 = a8;
  id v20 = a9;
  id v35 = a11;
  id v21 = a13;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PS190HardwareID;
  v22 = -[PS190HardwareID init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_boardID, a3);
    v23->_certificateEpoch = a4;
    v23->_chipID = a5;
    v23->_debugDisable = a6;
    v23->_ecid = a7;
    uint64_t v24 = [v19 copy];
    nonce = v23->_nonce;
    v23->_nonce = (NSData *)v24;

    objc_storeStrong((id *)&v23->_productionMode, a9);
    v23->_realHDCPKeysPresent = a10;
    objc_storeStrong((id *)&v23->_securityDomain, a11);
    v23->_securityMode = a12;
    if (v21)
    {
      char v26 = [v21 unsignedCharValue];
      unsigned int v27 = [v21 unsignedCharValue];
      v28 = (NSString *)(id)objc_msgSend( NSString,  "stringWithFormat:",  @"%u.%u",  v27 >> 4,  v26 & 0xF);
      hardwareRevision = v23->_hardwareRevision;
      v23->_hardwareRevision = v28;
    }

    v30 = (NSString *)(id)objc_msgSend( NSString,  "stringWithFormat:",  @"%02x%02x%02x%02x%02x%02x%02x%02x",  LOBYTE(v23->_ecid),  BYTE1(v23->_ecid),  BYTE2(v23->_ecid),  BYTE3(v23->_ecid),  BYTE4(v23->_ecid),  BYTE5(v23->_ecid),  BYTE6(v23->_ecid),  HIBYTE(v23->_ecid));
    authlistFormattedECID = v23->_authlistFormattedECID;
    v23->_authlistFormattedECID = v30;
  }

  return v23;
}

- (BOOL)requiresPersonalization
{
  return -[NSNumber unsignedIntValue](self->_securityDomain, "unsignedIntValue")
      || self->_debugDisable
      || self->_realHDCPKeysPresent
      || self->_securityMode;
}

- (BOOL)needsOTPProgramming
{
  if (!-[PS190HardwareID requiresPersonalization](self, "requiresPersonalization")) {
    return 0;
  }
  v3 = -[PS190HardwareID boardID](self, "boardID");
  if (v3)
  {
    v4 = -[PS190HardwareID securityDomain](self, "securityDomain");
    if (v4)
    {
      v5 = -[PS190HardwareID productionMode](self, "productionMode");
      BOOL v6 = v5 == 0LL;
    }

    else
    {
      BOOL v6 = 1;
    }
  }

  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (NSDictionary)dictionary
{
  id v3 = (id)[MEMORY[0x189603FC8] dictionary];
  v4 = -[PS190HardwareID boardID](self, "boardID");

  if (v4)
  {
    v5 = -[PS190HardwareID boardID](self, "boardID");
    [v3 setObject:v5 forKeyedSubscript:@"BoardID"];
  }

  id v6 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[PS190HardwareID certificateEpoch](self, "certificateEpoch"));
  [v3 setObject:v6 forKeyedSubscript:@"CertificateEpoch"];

  id v7 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  -[PS190HardwareID chipID](self, "chipID"));
  [v3 setObject:v7 forKeyedSubscript:@"ChipID"];

  id v8 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PS190HardwareID debugDisable](self, "debugDisable"));
  [v3 setObject:v8 forKeyedSubscript:@"DebugDisable"];

  if (-[PS190HardwareID ecid](self, "ecid"))
  {
    id v9 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[PS190HardwareID ecid](self, "ecid"));
    [v3 setObject:v9 forKeyedSubscript:@"ECID"];
  }

  v10 = -[PS190HardwareID nonce](self, "nonce");

  if (v10)
  {
    v11 = -[PS190HardwareID nonce](self, "nonce");
    [v3 setObject:v11 forKeyedSubscript:@"Nonce"];
  }

  v12 = -[PS190HardwareID productionMode](self, "productionMode");

  if (v12)
  {
    v13 = -[PS190HardwareID productionMode](self, "productionMode");
    [v3 setObject:v13 forKeyedSubscript:@"ProductionMode"];
  }

  id v14 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PS190HardwareID realHDCPKeysPresent](self, "realHDCPKeysPresent"));
  [v3 setObject:v14 forKeyedSubscript:@"RealHDCPKeysPresent"];

  v15 = -[PS190HardwareID securityDomain](self, "securityDomain");
  if (v15)
  {
    v16 = -[PS190HardwareID securityDomain](self, "securityDomain");
    [v3 setObject:v16 forKeyedSubscript:@"SecurityDomain"];
  }

  id v17 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PS190HardwareID securityMode](self, "securityMode"));
  [v3 setObject:v17 forKeyedSubscript:@"SecurityMode"];

  id v18 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PS190HardwareID requiresPersonalization]( self,  "requiresPersonalization"));
  [v3 setObject:v18 forKeyedSubscript:@"RequiresPersonalization"];

  id v19 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[PS190HardwareID needsOTPProgramming](self, "needsOTPProgramming"));
  [v3 setObject:v19 forKeyedSubscript:@"NeedsOTPProgramming"];

  [v3 setObject:self->_authlistFormattedECID forKeyedSubscript:@"AuthlistFormattedECID"];
  id v20 = (id)[MEMORY[0x189603F68] dictionaryWithDictionary:v3];

  return (NSDictionary *)v20;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"%@:\n", v5];

  objc_msgSend(v6, "appendFormat:", @"\tChip ID: 0x%08x\n", self->_chipID);
  if (self->_hardwareRevision) {
    [v6 appendFormat:@"\tHardware Revision: %@\n", self->_hardwareRevision];
  }
  objc_msgSend(v6, "appendFormat:", @"\tCertificate Epoch: %u\n", self->_certificateEpoch);
  boardID = self->_boardID;
  if (boardID) {
    objc_msgSend( v6,  "appendFormat:",  @"\tBoard ID: 0x%08x\n",  -[NSNumber unsignedIntValue](boardID, "unsignedIntValue"));
  }
  if (self->_debugDisable) {
    id v8 = "Yes";
  }
  else {
    id v8 = "No";
  }
  objc_msgSend(v6, "appendFormat:", @"\tDebug Disable (DBGD): %s\n", v8);
  objc_msgSend(v6, "appendFormat:", @"\tECID: 0x%016llx\n", self->_ecid);
  nonce = self->_nonce;
  if (nonce)
  {
    v10 = -[NSData byteString](nonce, "byteString");
    [v6 appendFormat:@"\tBoot Nonce Hash: %@\n", v10];
  }

  productionMode = self->_productionMode;
  if (productionMode)
  {
    if (-[NSNumber BOOLValue](productionMode, "BOOLValue")) {
      v12 = "Yes";
    }
    else {
      v12 = "No";
    }
    objc_msgSend(v6, "appendFormat:", @"\tProduction Mode: %s\n", v12);
  }

  if (self->_realHDCPKeysPresent) {
    v13 = "Yes";
  }
  else {
    v13 = "No";
  }
  objc_msgSend(v6, "appendFormat:", @"\tReal HDCP Keys Present (RHKP): %s\n", v13);
  securityDomain = self->_securityDomain;
  if (securityDomain) {
    objc_msgSend( v6,  "appendFormat:",  @"\tSecurity Domain (SDOM): %u\n",  -[NSNumber unsignedIntValue](securityDomain, "unsignedIntValue"));
  }
  if (self->_securityMode) {
    v15 = "Yes";
  }
  else {
    v15 = "No";
  }
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Mode (CSEC): %s\n", v15);
  if (-[PS190HardwareID requiresPersonalization](self, "requiresPersonalization")) {
    v16 = "Yes";
  }
  else {
    v16 = "No";
  }
  objc_msgSend(v6, "appendFormat:", @"\tPersonalization Required: %s\n", v16);
  if (-[PS190HardwareID needsOTPProgramming](self, "needsOTPProgramming")) {
    id v17 = "Yes";
  }
  else {
    id v17 = "No";
  }
  objc_msgSend(v6, "appendFormat:", @"\tNeeds OTP Programming: %s\n", v17);
  [v6 appendFormat:@"\tAuthlist Formatted ECID: %@", self->_authlistFormattedECID];
  id v18 = (id)[NSString stringWithString:v6];

  return v18;
}

- (NSNumber)boardID
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (unsigned)certificateEpoch
{
  return self->_certificateEpoch;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (BOOL)debugDisable
{
  return self->_debugDisable;
}

- (unint64_t)ecid
{
  return self->_ecid;
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSNumber)productionMode
{
  return (NSNumber *)objc_getProperty(self, a2, 56LL, 1);
}

- (BOOL)realHDCPKeysPresent
{
  return self->_realHDCPKeysPresent;
}

- (NSNumber)securityDomain
{
  return (NSNumber *)objc_getProperty(self, a2, 64LL, 1);
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (NSString)hardwareRevision
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void).cxx_destruct
{
}

@end