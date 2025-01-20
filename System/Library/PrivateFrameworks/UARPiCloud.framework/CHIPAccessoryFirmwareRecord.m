@interface CHIPAccessoryFirmwareRecord
+ (BOOL)supportsSecureCoding;
- (CHIPAccessoryFirmwareRecord)initWithCKRecord:(id)a3;
- (CHIPAccessoryFirmwareRecord)initWithCoder:(id)a3;
- (CKRecord)ckRecord;
- (NSData)digest;
- (NSDate)releaseDate;
- (NSNumber)cdVersionNumber;
- (NSNumber)firmwareVersionNumber;
- (NSNumber)hashAlgorithmType;
- (NSNumber)maxFirmwareVersionNumber;
- (NSNumber)minFirmwareVersionNumber;
- (NSString)firmwareBinaryHash;
- (NSString)firmwareFileSize;
- (NSString)firmwareURL;
- (NSString)firmwareVersion;
- (NSString)recordName;
- (NSString)recordStatus;
- (NSString)releaseNotesHash;
- (NSString)releaseNotesURL;
- (NSString)signature;
- (NSString)verificationCertificateID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)calculateDigestFromCKRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHIPAccessoryFirmwareRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHIPAccessoryFirmwareRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___CHIPAccessoryFirmwareRecord;
  self = -[CHIPAccessoryFirmwareRecord init](&v50, sel_init);
  if (!self) {
    goto LABEL_14;
  }
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

  [v4 objectForKey:@"signatureV2"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSString *)[v13 copy];
  signature = self->_signature;
  self->_signature = v14;

  if (!self->_signature) {
    goto LABEL_14;
  }
  [v4 objectForKey:@"verificationCertificateKey"];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSString *)[v16 copy];
  verificationCertificateID = self->_verificationCertificateID;
  self->_verificationCertificateID = v17;

  if (!self->_verificationCertificateID) {
    goto LABEL_14;
  }
  [v4 objectForKey:@"firmwareVersionString"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSString *)[v19 copy];
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v20;

  [v4 objectForKey:@"firmwareVersionNumber"];
  v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  firmwareVersionNumber = self->_firmwareVersionNumber;
  self->_firmwareVersionNumber = v22;

  if (!self->_firmwareVersionNumber) {
    goto LABEL_14;
  }
  [v4 objectForKey:@"minFirmwareVersionNumber"];
  v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  minFirmwareVersionNumber = self->_minFirmwareVersionNumber;
  self->_minFirmwareVersionNumber = v24;

  [v4 objectForKey:@"maxFirmwareVersionNumber"];
  v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  maxFirmwareVersionNumber = self->_maxFirmwareVersionNumber;
  self->_maxFirmwareVersionNumber = v26;

  [v4 objectForKey:@"firmwareURL"];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSString *)[v28 copy];
  firmwareURL = self->_firmwareURL;
  self->_firmwareURL = v29;

  [v4 objectForKey:@"firmwareBinaryHash"];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (NSString *)[v31 copy];
  firmwareBinaryHash = self->_firmwareBinaryHash;
  self->_firmwareBinaryHash = v32;

  if (self->_firmwareURL)
  {
    if (!self->_firmwareBinaryHash) {
      goto LABEL_14;
    }
  }

  [v4 objectForKey:@"firmwareFileSize"];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (NSString *)[v34 copy];
  firmwareFileSize = self->_firmwareFileSize;
  self->_firmwareFileSize = v35;

  if (self->_firmwareURL)
  {
    if (!self->_firmwareFileSize) {
      goto LABEL_14;
    }
  }

  [v4 objectForKey:@"hashAlgorithmType"];
  v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hashAlgorithmType = self->_hashAlgorithmType;
  self->_hashAlgorithmType = v37;

  if (self->_firmwareURL)
  {
    if (!self->_hashAlgorithmType) {
      goto LABEL_14;
    }
  }

  [v4 objectForKey:@"cdVersionNumber"];
  v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cdVersionNumber = self->_cdVersionNumber;
  self->_cdVersionNumber = v39;

  [v4 objectForKey:@"releaseNotesURL"];
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  releaseNotesURL = self->_releaseNotesURL;
  self->_releaseNotesURL = v41;

  [v4 modificationDate];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (NSDate *)[v43 copy];
  releaseDate = self->_releaseDate;
  self->_releaseDate = v44;

  [v4 objectForKey:@"recordStatus"];
  v46 = (NSString *)objc_claimAutoreleasedReturnValue();
  recordStatus = self->_recordStatus;
  self->_recordStatus = v46;

  if (self->_recordStatus)
  {
    -[CHIPAccessoryFirmwareRecord calculateDigestFromCKRecord:](self, "calculateDigestFromCKRecord:", v4);
    self = self;
    v48 = self;
  }

  else
  {
LABEL_14:
    v48 = 0LL;
  }

  return v48;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHIPAccessoryFirmwareRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___CHIPAccessoryFirmwareRecord),  "initWithCKRecord:",  self->_ckRecord);
}

- (void)encodeWithCoder:(id)a3
{
}

- (CHIPAccessoryFirmwareRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CHIPAccessoryFirmwareRecord initWithCKRecord:](self, "initWithCKRecord:", v5);
  return v6;
}

- (void)calculateDigestFromCKRecord:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CC_SHA256_Init(&c);
  digest = self->_digest;
  self->_digest = 0LL;

  [v4 allKeys];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0LL;
    uint64_t v12 = *(void *)v25;
    for (uint64_t i = *(void *)v25; ; uint64_t i = *(void *)v25)
    {
      if (i != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
      if (([v14 isEqualToString:@"firmwareVersionNumber"] & 1) != 0
        || ([v14 isEqualToString:@"minFirmwareVersionNumber"] & 1) != 0
        || [v14 isEqualToString:@"maxFirmwareVersionNumber"])
      {
        break;
      }

      if ([v14 isEqualToString:@"hashAlgorithmType"])
      {
        [v4 objectForKey:v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t data = bswap64([v15 unsignedLongLongValue]);
        CC_LONG v16 = 8;
        goto LABEL_9;
      }

      if ([v14 isEqualToString:@"cdVersionNumber"])
      {
        [v4 objectForKey:v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(data) = __rev16([v15 unsignedShortValue]);
        CC_LONG v16 = 2;
        goto LABEL_9;
      }

      if (([v14 isEqualToString:@"verificationCertificateKey"] & 1) == 0
        && ([v14 isEqualToString:@"signature"] & 1) == 0
        && ([v14 isEqualToString:@"signatureV2"] & 1) == 0)
      {
        [v4 objectForKey:v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 dataUsingEncoding:4];
        id v18 = v22 = self;
        CC_SHA256_Update(&c, (const void *)[v18 bytes], objc_msgSend(v18, "length"));

        self = v22;
        goto LABEL_10;
      }

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSNumber)firmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSNumber)minFirmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSNumber)maxFirmwareVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)firmwareURL
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)firmwareBinaryHash
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)firmwareFileSize
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)releaseNotesURL
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSString)releaseNotesHash
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSNumber)hashAlgorithmType
{
  return (NSNumber *)objc_getProperty(self, a2, 88LL, 1);
}

- (NSNumber)cdVersionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (NSString)verificationCertificateID
{
  return (NSString *)objc_getProperty(self, a2, 144LL, 1);
}

- (NSData)digest
{
  return (NSData *)objc_getProperty(self, a2, 152LL, 1);
}

- (void).cxx_destruct
{
}

@end