@interface UARPiCloudAccessoryRecord
+ (BOOL)supportsSecureCoding;
- (CKRecord)ckRecord;
- (NSArray)deploymentList;
- (NSString)deploymentStr;
- (NSString)firmwareBinaryHash;
- (NSString)firmwareFileSize;
- (NSString)firmwareURL;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)recordName;
- (NSString)recordStatus;
- (NSString)releaseDate;
- (NSString)releaseNotesFileSize;
- (NSString)releaseNotesHash;
- (NSString)releaseNotesURL;
- (NSString)releaseType;
- (NSString)signature;
- (NSString)updateClassification;
- (UARPiCloudAccessoryRecord)initWithCKRecord:(id)a3;
- (UARPiCloudAccessoryRecord)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPiCloudAccessoryRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPiCloudAccessoryRecord)initWithCKRecord:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___UARPiCloudAccessoryRecord;
  v5 = -[UARPiCloudAccessoryRecord init](&v63, sel_init);
  if (!v5)
  {
    v59 = 0LL;
    goto LABEL_18;
  }

  uint64_t v6 = [v4 copy];
  ckRecord = v5->_ckRecord;
  v5->_ckRecord = (CKRecord *)v6;

  [v4 recordID];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 recordName];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 copy];
  recordName = v5->_recordName;
  v5->_recordName = (NSString *)v10;

  if (!v5->_recordName) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"manufacturer"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 copy];
  manufacturer = v5->_manufacturer;
  v5->_manufacturer = (NSString *)v13;

  if (!v5->_manufacturer) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"recordStatus"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 copy];
  recordStatus = v5->_recordStatus;
  v5->_recordStatus = (NSString *)v16;

  if (!v5->_recordStatus) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"model"];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 copy];
  model = v5->_model;
  v5->_model = (NSString *)v19;

  if (!v5->_model) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"firmwareVersion"];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v21 copy];
  firmwareVersion = v5->_firmwareVersion;
  v5->_firmwareVersion = (NSString *)v22;

  if (!v5->_firmwareVersion) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"firmwareURL"];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v24 copy];
  firmwareURL = v5->_firmwareURL;
  v5->_firmwareURL = (NSString *)v25;

  if (!v5->_firmwareURL) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"releaseType"];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 copy];
  releaseType = v5->_releaseType;
  v5->_releaseType = (NSString *)v28;

  [v4 objectForKey:@"updateClassification"];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v30 copy];
  updateClassification = v5->_updateClassification;
  v5->_updateClassification = (NSString *)v31;

  [v4 objectForKey:@"releaseNotesURL"];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v33 copy];
  releaseNotesURL = v5->_releaseNotesURL;
  v5->_releaseNotesURL = (NSString *)v34;

  if (!v5->_releaseNotesURL) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"firmwareBinaryHash"];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v36 copy];
  firmwareBinaryHash = v5->_firmwareBinaryHash;
  v5->_firmwareBinaryHash = (NSString *)v37;

  if (!v5->_firmwareBinaryHash) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"releaseNotesHash"];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = [v39 copy];
  releaseNotesHash = v5->_releaseNotesHash;
  v5->_releaseNotesHash = (NSString *)v40;

  if (!v5->_releaseNotesHash) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"signature"];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = [v42 copy];
  signature = v5->_signature;
  v5->_signature = (NSString *)v43;

  if (!v5->_signature) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"releaseDate"];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v46 = [v45 copy];
  releaseDate = v5->_releaseDate;
  v5->_releaseDate = (NSString *)v46;

  if (!v5->_releaseDate) {
    goto LABEL_20;
  }
  [v4 objectForKey:@"firmwareFileSize"];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v49 = [v48 copy];
  firmwareFileSize = v5->_firmwareFileSize;
  v5->_firmwareFileSize = (NSString *)v49;

  if (!v5->_firmwareFileSize
    || ([v4 objectForKey:@"releaseNotesFileSize"],
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v52 = [v51 copy],
        releaseNotesFileSize = v5->_releaseNotesFileSize,
        v5->_releaseNotesFileSize = (NSString *)v52,
        releaseNotesFileSize,
        v51,
        !v5->_releaseNotesFileSize))
  {
LABEL_20:
    v59 = v5;
    v5 = 0LL;
    goto LABEL_18;
  }

  [v4 objectForKey:@"deploymentList"];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = [v54 copy];
  deploymentStr = v5->_deploymentStr;
  v5->_deploymentStr = (NSString *)v55;

  v57 = v5->_deploymentStr;
  if (v57)
  {
    v58 = (void *)MEMORY[0x1896078D8];
    v59 = -[NSString dataUsingEncoding:](v57, "dataUsingEncoding:", 4LL);
    uint64_t v60 = [v58 JSONObjectWithData:v59 options:0 error:0];
    deploymentList = v5->_deploymentList;
    v5->_deploymentList = (NSArray *)v60;

LABEL_18:
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPiCloudAccessoryRecord initWithCKRecord:]( objc_alloc(&OBJC_CLASS___UARPiCloudAccessoryRecord),  "initWithCKRecord:",  self->_ckRecord);
}

- (void)encodeWithCoder:(id)a3
{
  ckRecord = self->_ckRecord;
  id v5 = a3;
  [v5 encodeObject:ckRecord forKey:@"record"];
  [v5 encodeObject:self->_manufacturer forKey:@"manufacturer"];
  [v5 encodeObject:self->_recordStatus forKey:@"recordStatus"];
  [v5 encodeObject:self->_firmwareVersion forKey:@"model"];
  [v5 encodeObject:self->_firmwareURL forKey:@"firmwareURL"];
  [v5 encodeObject:self->_releaseType forKey:@"releaseType"];
  [v5 encodeObject:self->_updateClassification forKey:@"updateClassification"];
  [v5 encodeObject:self->_releaseNotesURL forKey:@"releaseNotesURL"];
  [v5 encodeObject:self->_firmwareBinaryHash forKey:@"firmwareBinaryHash"];
  [v5 encodeObject:self->_releaseNotesHash forKey:@"releaseNotesHash"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_deploymentList forKey:@"deploymentList"];
}

- (UARPiCloudAccessoryRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = -[UARPiCloudAccessoryRecord initWithCKRecord:](self, "initWithCKRecord:", v5);
  return v6;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  id v8 = a4;
  [v8 appendWithTabDepth:a3, @"Name: %@\n", self->_recordName format];
  unint64_t v6 = a3 + 1;
  [v8 appendWithTabDepth:v6, @"Status: %@\n", self->_recordStatus format];
  [v8 appendWithTabDepth:v6, @"Manufacturer: %@\n", self->_manufacturer format];
  [v8 appendWithTabDepth:v6, @"Model: %@\n", self->_model format];
  [v8 appendWithTabDepth:v6, @"Firmware Version: %@\n", self->_firmwareVersion format];
  [v8 appendWithTabDepth:v6, @"Firmware URL: %@\n", self->_firmwareURL format];
  [v8 appendWithTabDepth:v6, @"Release Type: %@\n", self->_releaseType format];
  [v8 appendWithTabDepth:v6, @"Update Classification: %@\n", self->_updateClassification format];
  if (self->_deploymentStr) {
    [v8 appendWithTabDepth:v6, @"Deployment String: %@\n", self->_deploymentStr format];
  }
  if (self->_deploymentList) {
    [v8 appendWithTabDepth:v6, @"Deployment List: %@\n", self->_deploymentList format];
  }
  [v8 appendWithTabDepth:v6, @"Release Notes URL: %@\n", self->_releaseNotesURL format];
  [v8 appendWithTabDepth:v6, @"Firmware Binary Hash: %@\n", self->_firmwareBinaryHash format];
  [v8 appendWithTabDepth:v6, @"Release Notes Hash: %@\n", self->_releaseNotesHash format];
  [v8 appendWithTabDepth:v6, @"Signature: %@\n", self->_signature format];
  if (self->_releaseDate) {
    [v8 appendWithTabDepth:v6, @"Release Date: %@\n", self->_releaseDate format];
  }
  if (self->_releaseNotesFileSize) {
    [v8 appendWithTabDepth:v6, @"Release Notes File Size: %@\n", self->_releaseNotesFileSize format];
  }
  v7 = v8;
  if (self->_firmwareFileSize)
  {
    [v8 appendWithTabDepth:v6, @"Firmware File Size: %@\n", self->_firmwareFileSize format];
    v7 = v8;
  }
}

- (id)description
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: recordName=%@, firmwareVersion=%@, firmwareURL=%@, releaseNotesURL=%@, firmwareBinaryHash=%@, releaseNotesHash=%@>", v5, self->_recordName, self->_firmwareVersion, self->_firmwareURL, self->_releaseNotesURL, self->_firmwareBinaryHash, self->_releaseNotesHash];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)recordStatus
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)firmwareURL
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSString)releaseType
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSString)updateClassification
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSString)deploymentStr
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSArray)deploymentList
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (NSString)releaseNotesURL
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (NSString)firmwareBinaryHash
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (NSString)releaseNotesHash
{
  return (NSString *)objc_getProperty(self, a2, 104LL, 1);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)releaseDate
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSString)releaseNotesFileSize
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSString)firmwareFileSize
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (CKRecord)ckRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 144LL, 1);
}

- (void).cxx_destruct
{
}

@end