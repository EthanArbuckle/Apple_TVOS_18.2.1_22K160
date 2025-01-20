@interface NEProfileIngestionPayloadInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isSetAside;
- (NEProfileIngestionPayloadInfo)init;
- (NEProfileIngestionPayloadInfo)initWithCoder:(id)a3;
- (NSDate)profileIngestionDate;
- (NSString)payloadOrganization;
- (NSString)payloadProtocolType;
- (NSString)payloadUUID;
- (NSString)profileIdentifier;
- (NSString)profileOrganization;
- (NSString)profileUUID;
- (NSString)systemVersion;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)profileSource;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSetAside:(BOOL)a3;
- (void)setPayloadOrganization:(id)a3;
- (void)setPayloadProtocolType:(id)a3;
- (void)setPayloadUUID:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setProfileIngestionDate:(id)a3;
- (void)setProfileOrganization:(id)a3;
- (void)setProfileSource:(int64_t)a3;
- (void)setProfileUUID:(id)a3;
- (void)setSystemVersion:(id)a3;
@end

@implementation NEProfileIngestionPayloadInfo

- (NEProfileIngestionPayloadInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEProfileIngestionPayloadInfo;
  v2 = -[NEProfileIngestionPayloadInfo init](&v9, sel_init);
  if (v2)
  {
    [MEMORY[0x1896079D8] processInfo];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 operatingSystemVersionString];
    systemVersion = v2->_systemVersion;
    v2->_systemVersion = (NSString *)v4;

    uint64_t v6 = [MEMORY[0x189603F50] date];
    profileIngestionDate = v2->_profileIngestionDate;
    v2->_profileIngestionDate = (NSDate *)v6;
  }

  return v2;
}

- (NEProfileIngestionPayloadInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NEProfileIngestionPayloadInfo;
  v5 = -[NEProfileIngestionPayloadInfo init](&v23, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PayloadType"];
    payloadProtocolType = v5->_payloadProtocolType;
    v5->_payloadProtocolType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PayloadUUID"];
    payloadUUID = v5->_payloadUUID;
    v5->_payloadUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PayloadOrganization"];
    payloadOrganization = v5->_payloadOrganization;
    v5->_payloadOrganization = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileIdentifier"];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileUUID"];
    profileUUID = v5->_profileUUID;
    v5->_profileUUID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProfileOrganization"];
    profileOrganization = v5->_profileOrganization;
    v5->_profileOrganization = (NSString *)v16;

    v5->_isSetAside = [v4 decodeBoolForKey:@"isSetAside"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileIngestionDate"];
    profileIngestionDate = v5->_profileIngestionDate;
    v5->_profileIngestionDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemVersion"];
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v20;

    v5->_profileSource = [v4 decodeIntegerForKey:@"profileSource"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  -[NEProfileIngestionPayloadInfo payloadProtocolType](self, "payloadProtocolType");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v4 forKey:@"PayloadType"];
  v5 = -[NEProfileIngestionPayloadInfo payloadUUID](self, "payloadUUID");
  [v12 encodeObject:v5 forKey:@"PayloadUUID"];

  -[NEProfileIngestionPayloadInfo payloadOrganization](self, "payloadOrganization");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v6 forKey:@"PayloadOrganization"];
  v7 = -[NEProfileIngestionPayloadInfo profileIdentifier](self, "profileIdentifier");
  [v12 encodeObject:v7 forKey:@"ProfileIdentifier"];

  -[NEProfileIngestionPayloadInfo profileUUID](self, "profileUUID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v8 forKey:@"ProfileUUID"];

  -[NEProfileIngestionPayloadInfo profileOrganization](self, "profileOrganization");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v9 forKey:@"ProfileOrganization"];

  objc_msgSend( v12,  "encodeBool:forKey:",  -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"),  @"isSetAside");
  -[NEProfileIngestionPayloadInfo profileIngestionDate](self, "profileIngestionDate");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 encodeObject:v10 forKey:@"profileIngestionDate"];
  v11 = -[NEProfileIngestionPayloadInfo systemVersion](self, "systemVersion");
  [v12 encodeObject:v11 forKey:@"systemVersion"];

  objc_msgSend( v12,  "encodeInteger:forKey:",  -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource"),  @"profileSource");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[NEProfileIngestionPayloadInfo init]( +[NEProfileIngestionPayloadInfo allocWithZone:]( &OBJC_CLASS___NEProfileIngestionPayloadInfo,  "allocWithZone:",  a3),  "init");
  v5 = -[NEProfileIngestionPayloadInfo payloadProtocolType](self, "payloadProtocolType");
  -[NEProfileIngestionPayloadInfo setPayloadProtocolType:](v4, "setPayloadProtocolType:", v5);

  -[NEProfileIngestionPayloadInfo payloadUUID](self, "payloadUUID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setPayloadUUID:](v4, "setPayloadUUID:", v6);
  v7 = -[NEProfileIngestionPayloadInfo payloadOrganization](self, "payloadOrganization");
  -[NEProfileIngestionPayloadInfo setPayloadOrganization:](v4, "setPayloadOrganization:", v7);

  -[NEProfileIngestionPayloadInfo profileIdentifier](self, "profileIdentifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileIdentifier:](v4, "setProfileIdentifier:", v8);

  -[NEProfileIngestionPayloadInfo profileUUID](self, "profileUUID");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileUUID:](v4, "setProfileUUID:", v9);

  -[NEProfileIngestionPayloadInfo profileOrganization](self, "profileOrganization");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setProfileOrganization:](v4, "setProfileOrganization:", v10);

  -[NEProfileIngestionPayloadInfo setIsSetAside:]( v4,  "setIsSetAside:",  -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"));
  v11 = -[NEProfileIngestionPayloadInfo profileIngestionDate](self, "profileIngestionDate");
  -[NEProfileIngestionPayloadInfo setProfileIngestionDate:](v4, "setProfileIngestionDate:", v11);

  -[NEProfileIngestionPayloadInfo systemVersion](self, "systemVersion");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestionPayloadInfo setSystemVersion:](v4, "setSystemVersion:", v12);

  -[NEProfileIngestionPayloadInfo setProfileSource:]( v4,  "setProfileSource:",  -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource"));
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x189607940]);
  -[NEProfileIngestionPayloadInfo payloadUUID](self, "payloadUUID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"payloadUUID" andIndent:v5 options:a4];

  -[NEProfileIngestionPayloadInfo payloadOrganization](self, "payloadOrganization");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"payloadOrganization" andIndent:v5 options:a4 | 1];

  -[NEProfileIngestionPayloadInfo profileUUID](self, "profileUUID");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"profileUUID" andIndent:v5 options:a4];
  v11 = -[NEProfileIngestionPayloadInfo profileIdentifier](self, "profileIdentifier");
  [v7 appendPrettyObject:v11 withName:@"profileIdentifier" andIndent:v5 options:a4 | 1];

  -[NEProfileIngestionPayloadInfo profileOrganization](self, "profileOrganization");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v12 withName:@"profileOrganization" andIndent:v5 options:a4 | 1];
  v13 = -[NEProfileIngestionPayloadInfo payloadProtocolType](self, "payloadProtocolType");
  [v7 appendPrettyObject:v13 withName:@"payloadProtocolType" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEProfileIngestionPayloadInfo isSetAside](self, "isSetAside"),  @"isSetAside",  v5,  a4);
  -[NEProfileIngestionPayloadInfo profileIngestionDate](self, "profileIngestionDate");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v14 withName:@"profileIngestionDate" andIndent:v5 options:a4];
  v15 = -[NEProfileIngestionPayloadInfo systemVersion](self, "systemVersion");
  [v7 appendPrettyObject:v15 withName:@"systemVersion" andIndent:v5 options:a4];

  int64_t v16 = -[NEProfileIngestionPayloadInfo profileSource](self, "profileSource");
  v17 = @"unknown";
  if (v16 == 2) {
    v17 = @"mdm";
  }
  if (v16 == 1) {
    uint64_t v18 = @"user";
  }
  else {
    uint64_t v18 = v17;
  }
  [v7 appendPrettyObject:v18 withName:@"profileSource" andIndent:v5 options:a4];
  return v7;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___NEProfileIngestionPayloadInfo;
  uint64_t v5 = -[NEProfileIngestionPayloadInfo init](&v45, sel_init);
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"PayloadType"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = isa_nsstring(v6);

    if (v7)
    {
      id v8 = objc_alloc(NSString);
      [v4 objectForKeyedSubscript:@"PayloadType"];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v8 initWithString:v9];
      payloadProtocolType = v5->_payloadProtocolType;
      v5->_payloadProtocolType = (NSString *)v10;
    }

    [v4 objectForKeyedSubscript:@"PayloadUUID"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = isa_nsstring(v12);

    if (v13)
    {
      id v14 = objc_alloc(NSString);
      [v4 objectForKeyedSubscript:@"PayloadUUID"];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v14 initWithString:v15];
      payloadUUID = v5->_payloadUUID;
      v5->_payloadUUID = (NSString *)v16;
    }

    [v4 objectForKeyedSubscript:@"PayloadOrganization"];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = isa_nsstring(v18);

    if (v19)
    {
      id v20 = objc_alloc(NSString);
      [v4 objectForKeyedSubscript:@"PayloadOrganization"];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v20 initWithString:v21];
      payloadOrganization = v5->_payloadOrganization;
      v5->_payloadOrganization = (NSString *)v22;
    }

    [v4 objectForKeyedSubscript:@"PayloadRoot"];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && isa_nsdictionary(v24))
    {
      [v25 objectForKeyedSubscript:@"PayloadIdentifier"];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      int v27 = isa_nsstring(v26);

      if (v27)
      {
        id v28 = objc_alloc(NSString);
        [v25 objectForKeyedSubscript:@"PayloadIdentifier"];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v28 initWithString:v29];
        profileIdentifier = v5->_profileIdentifier;
        v5->_profileIdentifier = (NSString *)v30;
      }

      [v25 objectForKeyedSubscript:@"PayloadUUID"];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      int v33 = isa_nsstring(v32);

      if (v33)
      {
        id v34 = objc_alloc(NSString);
        [v25 objectForKeyedSubscript:@"PayloadUUID"];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v36 = [v34 initWithString:v35];
        profileUUID = v5->_profileUUID;
        v5->_profileUUID = (NSString *)v36;
      }

      [v25 objectForKeyedSubscript:@"PayloadOrganization"];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      int v39 = isa_nsstring(v38);

      if (v39)
      {
        id v40 = objc_alloc(NSString);
        [v25 objectForKeyedSubscript:@"PayloadOrganization"];
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v42 = [v40 initWithString:v41];
        profileOrganization = v5->_profileOrganization;
        v5->_profileOrganization = (NSString *)v42;
      }
    }
  }

  return v5;
}

- (id)copyLegacyDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:3];
  if (!v3) {
    goto LABEL_16;
  }
  if (self->_payloadUUID)
  {
    id v4 = (void *)[objc_alloc(NSString) initWithString:self->_payloadUUID];
    [v3 setObject:v4 forKeyedSubscript:@"PayloadUUID"];
  }

  if (self->_payloadOrganization)
  {
    uint64_t v5 = (void *)[objc_alloc(NSString) initWithString:self->_payloadOrganization];
    [v3 setObject:v5 forKeyedSubscript:@"PayloadOrganization"];
  }

  if (!self->_profileIdentifier && !self->_profileUUID && !self->_profileOrganization) {
    goto LABEL_15;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:3];
  if (!v6)
  {
LABEL_16:
    id v10 = 0LL;
    goto LABEL_17;
  }

  int v7 = (void *)v6;
  if (self->_profileIdentifier)
  {
    id v8 = (void *)[objc_alloc(NSString) initWithString:self->_profileIdentifier];
    [v7 setObject:v8 forKeyedSubscript:@"PayloadIdentifier"];
  }

  if (self->_profileUUID)
  {
    objc_super v9 = (void *)[objc_alloc(NSString) initWithString:self->_profileUUID];
    [v7 setObject:v9 forKeyedSubscript:@"PayloadUUID"];
  }

  [v3 setObject:v7 forKeyedSubscript:@"PayloadRoot"];

LABEL_15:
  id v10 = v3;
LABEL_17:

  return v10;
}

- (NSString)payloadProtocolType
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPayloadProtocolType:(id)a3
{
}

- (NSString)payloadUUID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPayloadUUID:(id)a3
{
}

- (NSString)payloadOrganization
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPayloadOrganization:(id)a3
{
}

- (NSString)profileOrganization
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProfileOrganization:(id)a3
{
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)profileUUID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setProfileUUID:(id)a3
{
}

- (NSDate)profileIngestionDate
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setProfileIngestionDate:(id)a3
{
}

- (NSString)systemVersion
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSystemVersion:(id)a3
{
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

- (void)setIsSetAside:(BOOL)a3
{
  self->_isSetAside = a3;
}

- (int64_t)profileSource
{
  return self->_profileSource;
}

- (void)setProfileSource:(int64_t)a3
{
  self->_profileSource = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end