@interface B2PIdentificationResponse
- (AppleTypeCRetimerHardwareID)hardwareID;
- (BOOL)parseResponse:(id)a3;
- (NSData)nonce;
- (id)description;
- (unint64_t)ecid;
- (unsigned)apChipRev;
- (unsigned)boardID;
- (unsigned)chipID;
- (unsigned)productionStatus;
- (unsigned)securityDomain;
- (unsigned)securityEpoch;
- (unsigned)securityMode;
@end

@implementation B2PIdentificationResponse

- (AppleTypeCRetimerHardwareID)hardwareID
{
  v3 = objc_alloc(&OBJC_CLASS___AppleTypeCRetimerHardwareID);
  uint64_t v4 = -[B2PIdentificationResponse chipID](self, "chipID");
  uint64_t v5 = -[B2PIdentificationResponse boardID](self, "boardID");
  uint64_t v6 = -[B2PIdentificationResponse securityEpoch](self, "securityEpoch");
  uint64_t v7 = -[B2PIdentificationResponse productionStatus](self, "productionStatus");
  uint64_t v8 = -[B2PIdentificationResponse securityMode](self, "securityMode");
  uint64_t v9 = -[B2PIdentificationResponse securityDomain](self, "securityDomain");
  unint64_t v10 = -[B2PIdentificationResponse ecid](self, "ecid");
  v11 = -[B2PIdentificationResponse nonce](self, "nonce");
  LOBYTE(v14) = -[B2PIdentificationResponse apChipRev](self, "apChipRev");
  v12 = -[AppleTypeCRetimerHardwareID initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:]( v3,  "initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v14);

  return v12;
}

- (BOOL)parseResponse:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] < 0x32
    || (uint64_t v5 = [v4 bytes], *(_BYTE *)v5))
  {
    BOOL v6 = 0;
  }

  else
  {
    uint64_t v7 = v5;
    self->_chipID = *(_WORD *)(v5 + 1);
    self->_boardID = *(_WORD *)(v5 + 3);
    self->_securityEpoch = *(_BYTE *)(v5 + 5);
    self->_productionStatus = *(_BYTE *)(v5 + 6);
    self->_securityMode = *(_BYTE *)(v5 + 7);
    self->_securityDomain = *(_BYTE *)(v5 + 8);
    self->_ecid = *(void *)(v5 + 9);
    [MEMORY[0x189603F48] dataWithBytes:v5 + 17 length:32];
    uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    nonce = self->_nonce;
    self->_nonce = v8;

    self->_apChipRev = *(_BYTE *)(v7 + 49);
    BOOL v6 = 1;
  }

  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___B2PIdentificationResponse;
  -[B2PResponse description](&v9, sel_description);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@\n", v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[B2PResponse status](self, "status"))
  {
    objc_msgSend(v5, "appendFormat:", @"\tChip ID: 0x%04x\n", self->_chipID);
    objc_msgSend(v5, "appendFormat:", @"\tBoard ID: 0x%04x\n", self->_boardID);
    objc_msgSend(v5, "appendFormat:", @"\tSecurity Epoch: %u\n", self->_securityEpoch);
    objc_msgSend(v5, "appendFormat:", @"\tProduction Status: %u\n", self->_productionStatus);
    objc_msgSend(v5, "appendFormat:", @"\tSecurity Mode: %u\n", self->_securityMode);
    objc_msgSend(v5, "appendFormat:", @"\tSecurity Domain: %u\n", self->_securityDomain);
    objc_msgSend(v5, "appendFormat:", @"\tECID: 0x%016llx\n", self->_ecid);
    -[NSData byteString](self->_nonce, "byteString");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 appendFormat:@"\tNonce: %@\n", v6];

    objc_msgSend(v5, "appendFormat:", @"\tAP Chip Rev: %u", self->_apChipRev);
  }

  [NSString stringWithString:v5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (unsigned)apChipRev
{
  return self->_apChipRev;
}

- (void).cxx_destruct
{
}

@end