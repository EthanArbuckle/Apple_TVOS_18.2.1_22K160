@interface AppleTypeCRetimerBoardIDFile
- (AppleTypeCRetimerBoardIDFile)initWithBoardID:(unint64_t)a3 chipID:(unsigned __int16)a4 portNumber:(unsigned __int8)a5 securityDomain:(unsigned __int8)a6;
- (NSData)data;
- (NSString)tag;
- (id)description;
- (id)generateSubfileData;
- (unint64_t)boardID;
- (unsigned)boardRevision;
- (unsigned)chipID;
- (unsigned)magic;
- (unsigned)portNumber;
- (unsigned)securityDomain;
- (unsigned)version;
@end

@implementation AppleTypeCRetimerBoardIDFile

- (AppleTypeCRetimerBoardIDFile)initWithBoardID:(unint64_t)a3 chipID:(unsigned __int16)a4 portNumber:(unsigned __int8)a5 securityDomain:(unsigned __int8)a6
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerBoardIDFile;
  v10 = -[AppleTypeCRetimerBoardIDFile init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_magic = -1161889074;
    v10->_version = 2;
    v10->_boardID = a3;
    v10->_chipID = a4;
    v10->_portNumber = a5;
    v10->_securityDomain = a6;
    uint64_t v12 = -[AppleTypeCRetimerBoardIDFile generateSubfileData](v10, "generateSubfileData");
    data = v11->_data;
    v11->_data = (NSData *)v12;
  }

  return v11;
}

- (id)generateSubfileData
{
  v10[2] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FB8] data];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int magic = self->_magic;
  [v3 appendBytes:&magic length:4];
  unsigned __int16 version = self->_version;
  [v3 appendBytes:&version length:2];
  unint64_t boardID = self->_boardID;
  [v3 appendBytes:&boardID length:8];
  unsigned __int16 chipID = self->_chipID;
  [v3 appendBytes:&chipID length:2];
  [v3 appendBytes:&self->_portNumber length:1];
  [v3 appendBytes:&self->_boardRevision length:1];
  [v3 appendBytes:&self->_securityDomain length:1];
  *(void *)((char *)v10 + 5) = 0LL;
  v10[0] = 0LL;
  [v3 appendBytes:v10 length:13];
  [MEMORY[0x189603F48] dataWithData:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)tag
{
  return (NSString *)@"_brd";
}

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@:\n", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", @"\tMagic: 0x%08x\n", self->_magic);
  objc_msgSend(v6, "appendFormat:", @"\tVersion: %u\n", self->_version);
  objc_msgSend(v6, "appendFormat:", @"\tBoard ID: 0x%016llx\n", self->_boardID);
  objc_msgSend(v6, "appendFormat:", @"\tChip ID: 0x%04x\n", self->_chipID);
  objc_msgSend(v6, "appendFormat:", @"\tPort Number: %u\n", self->_portNumber);
  objc_msgSend(v6, "appendFormat:", @"\tBoard Revision: %u\n", self->_boardRevision);
  objc_msgSend(v6, "appendFormat:", @"\tSecurity Domain: %u", self->_securityDomain);
  [NSString stringWithString:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)magic
{
  return self->_magic;
}

- (unsigned)version
{
  return self->_version;
}

- (unint64_t)boardID
{
  return self->_boardID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (unsigned)boardRevision
{
  return self->_boardRevision;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end