@interface MSCMSIdentifier
+ (id)decodeIdentifier:(heim_base_data *)a3 error:(id *)a4;
- (IssuerAndSerialNumber)issuerAndSerialNumber;
- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4;
- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4 negativeNumber:(BOOL)a5;
- (MSCMSIdentifier)initWithSkid:(id)a3;
- (NSData)issuerNameData;
- (NSData)serialNumberData;
- (NSData)skidData;
- (heim_base_data)subjectKeyId;
- (id)encodeMessageSecurityObject:(id *)a3;
- (int)type;
- (void)setIssuerAndSerialNumber:(IssuerAndSerialNumber *)a3;
- (void)setIssuerNameData:(id)a3;
- (void)setSerialNumberData:(id)a3;
- (void)setSkidData:(id)a3;
- (void)setSubjectKeyId:(heim_base_data *)a3;
- (void)setType:(int)a3;
@end

@implementation MSCMSIdentifier

- (MSCMSIdentifier)initWithSkid:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSCMSIdentifier;
  v5 = -[MSCMSIdentifier init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MSCMSIdentifier setType:](v5, "setType:", 2LL);
    -[MSCMSIdentifier setSkidData:](v6, "setSkidData:", v4);
    -[MSCMSIdentifier setSubjectKeyId:](v6, "setSubjectKeyId:", &_skid);
    v7 = -[MSCMSIdentifier skidData](v6, "skidData");
    _skid = [v7 length];

    id v8 = -[MSCMSIdentifier skidData](v6, "skidData");
    qword_18C5489A8 = [v8 bytes];
  }

  return v6;
}

- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4
{
  return -[MSCMSIdentifier initWithIssuerName:serialNumber:negativeNumber:]( self,  "initWithIssuerName:serialNumber:negativeNumber:",  a3,  a4,  0LL);
}

- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4 negativeNumber:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MSCMSIdentifier;
  objc_super v10 = -[MSCMSIdentifier init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MSCMSIdentifier setType:](v10, "setType:", 1LL);
    -[MSCMSIdentifier setIssuerNameData:](v11, "setIssuerNameData:", v8);
    -[MSCMSIdentifier setSerialNumberData:](v11, "setSerialNumberData:", v9);
    -[MSCMSIdentifier setIssuerAndSerialNumber:](v11, "setIssuerAndSerialNumber:", &_iAndSN);
    id v12 = -[MSCMSIdentifier issuerNameData](v11, "issuerNameData");
    qword_18C488078 = [v12 bytes];
    v13 = -[MSCMSIdentifier issuerNameData](v11, "issuerNameData");
    _iAndSN = [v13 length];

    id v14 = -[MSCMSIdentifier serialNumberData](v11, "serialNumberData");
    qword_18C488088 = [v14 bytes];
    v15 = -[MSCMSIdentifier serialNumberData](v11, "serialNumberData");
    qword_18C488080 = [v15 length];

    dword_18C488090 = v5;
  }

  return v11;
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v27[1] = *MEMORY[0x1895F89C0];
  -[MSCMSIdentifier type](self, "type");
  int v5 = -[MSCMSIdentifier type](self, "type");
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      if (-[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber"))
      {
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        goto LABEL_7;
      }

      v15 = MSErrorCMSDomain[0];
      id v14 = @"CMSIdentifier has inconsistent type and stored values: expected issuerAndSerialNumber";
    }

    else
    {
      id v12 = MSErrorCMSDomain[0];
      uint64_t v13 = -[MSCMSIdentifier type](self, "type");
      id v14 = @"CMSIdentifer has unknown type: %d";
      uint64_t v24 = v13;
      v15 = v12;
    }

+ (id)decodeIdentifier:(heim_base_data *)a3 error:(id *)a4
{
  if (a4 && *a4) {
    uint64_t v6 = (void *)[*a4 copy];
  }
  else {
    uint64_t v6 = 0LL;
  }
  int v7 = decode_CMSIdentifier();
  if (v7)
  {
    id v8 = MSErrorASN1Domain[0];
    uint64_t v10 = v7;
    int v9 = @"unable to decode CMS Identifier";
  }

  else
  {
    id v8 = MSErrorASN1Domain[0];
    if (v13 == a3->var0)
    {
      int v9 = @"invalid CMS Identifier choice";
      uint64_t v10 = 0LL;
    }

    else
    {
      int v9 = @"unable to decode CMS Identifier";
      uint64_t v10 = 1859794442LL;
    }
  }

  +[MSError MSErrorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___MSError,  "MSErrorWithDomain:code:underlyingError:description:",  v8,  v10,  v6,  v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v11) {
    *a4 = v11;
  }
  free_CMSIdentifier();

  return 0LL;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (IssuerAndSerialNumber)issuerAndSerialNumber
{
  return self->_issuerAndSerialNumber;
}

- (void)setIssuerAndSerialNumber:(IssuerAndSerialNumber *)a3
{
  self->_issuerAndSerialNumber = a3;
}

- (heim_base_data)subjectKeyId
{
  return self->_subjectKeyId;
}

- (void)setSubjectKeyId:(heim_base_data *)a3
{
  self->_subjectKeyId = a3;
}

- (NSData)skidData
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSkidData:(id)a3
{
}

- (NSData)serialNumberData
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSerialNumberData:(id)a3
{
}

- (NSData)issuerNameData
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIssuerNameData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end