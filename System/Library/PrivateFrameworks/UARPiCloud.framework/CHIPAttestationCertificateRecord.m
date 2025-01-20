@interface CHIPAttestationCertificateRecord
+ (BOOL)supportsSecureCoding;
- (CHIPAttestationCertificateRecord)initWithCKRecord:(id)a3;
- (CHIPAttestationCertificateRecord)initWithCoder:(id)a3;
- (CKRecord)ckRecord;
- (NSString)intermediateCertificates;
- (NSString)recordName;
- (NSString)recordStatus;
- (NSString)rootCertificate;
- (NSString)signature;
- (NSString)verificationCertificateID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHIPAttestationCertificateRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHIPAttestationCertificateRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  if (v4
    && (v30.receiver = self,
        v30.super_class = (Class)&OBJC_CLASS___CHIPAttestationCertificateRecord,
        (self = -[CHIPAttestationCertificateRecord init](&v30, sel_init)) != 0LL))
  {
    v5 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = self->_log;
    self->_log = v5;

    v7 = (CKRecord *)[v4 copy];
    ckRecord = self->_ckRecord;
    self->_ckRecord = v7;

    [v4 recordID];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 recordName];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSString *)[v10 copy];
    recordName = self->_recordName;
    self->_recordName = v11;

    [v4 objectForKey:@"signature"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSString *)[v13 copy];
    signature = self->_signature;
    self->_signature = v14;

    [v4 objectForKey:@"verificationCertificateKey"];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSString *)[v16 copy];
    verificationCertificateID = self->_verificationCertificateID;
    self->_verificationCertificateID = v17;

    [v4 objectForKey:@"rootCertificate"];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSString *)[v19 copy];
    rootCertificate = self->_rootCertificate;
    self->_rootCertificate = v20;

    [v4 objectForKey:@"intermediateCertificates"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (NSString *)[v22 copy];
    intermediateCertificates = self->_intermediateCertificates;
    self->_intermediateCertificates = v23;

    [v4 objectForKey:@"recordStatus"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (NSString *)[v25 copy];
    recordStatus = self->_recordStatus;
    self->_recordStatus = v26;

    if (!self->_signature || !self->_verificationCertificateID || !self->_rootCertificate || !self->_recordStatus)
    {

      self = 0LL;
    }

    self = self;
    v28 = self;
  }

  else
  {
    v28 = 0LL;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHIPAttestationCertificateRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___CHIPAttestationCertificateRecord),  "initWithCKRecord:",  self->_ckRecord);
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHIPAttestationCertificateRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CHIPAttestationCertificateRecord initWithCKRecord:](self, "initWithCKRecord:", v5);
  return v6;
}

- (NSString)rootCertificate
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)intermediateCertificates
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)verificationCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void).cxx_destruct
{
}

@end