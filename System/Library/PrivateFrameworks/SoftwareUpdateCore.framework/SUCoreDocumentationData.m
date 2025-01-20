@interface SUCoreDocumentationData
+ (BOOL)supportsSecureCoding;
- (NSData)license;
- (NSData)readme;
- (NSData)readmeSummary;
- (NSString)humanReadableUpdateName;
- (NSString)humanReadableUpdateTitle;
- (NSString)humanReadableUpdateVersion;
- (SUCoreDocumentationData)init;
- (SUCoreDocumentationData)initWithCoder:(id)a3;
- (SUCoreDocumentationData)initWithDocumentationDataDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setHumanReadableUpdateTitle:(id)a3;
- (void)setHumanReadableUpdateVersion:(id)a3;
- (void)setLicense:(id)a3;
- (void)setReadme:(id)a3;
- (void)setReadmeSummary:(id)a3;
@end

@implementation SUCoreDocumentationData

- (SUCoreDocumentationData)init
{
  return -[SUCoreDocumentationData initWithDocumentationDataDictionary:]( self,  "initWithDocumentationDataDictionary:",  0LL);
}

- (SUCoreDocumentationData)initWithDocumentationDataDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SUCoreDocumentationData;
  v5 = -[SUCoreDocumentationData init](&v22, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ReadMe"];
    readme = v5->_readme;
    v5->_readme = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ReadMeSummary"];
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"License"];
    license = v5->_license;
    v5->_license = (NSData *)v10;

    [v4 objectForKeyedSubscript:@"HumanReadableUpdateName"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      uint64_t v13 = [objc_alloc(NSString) initWithData:v12 encoding:4];
      humanReadableUpdateName = v5->_humanReadableUpdateName;
      v5->_humanReadableUpdateName = (NSString *)v13;
    }

    [v4 objectForKeyedSubscript:@"HumanReadableUpdateTitle"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      uint64_t v16 = [objc_alloc(NSString) initWithData:v15 encoding:4];
      humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
      v5->_humanReadableUpdateTitle = (NSString *)v16;
    }

    [v4 objectForKeyedSubscript:@"HumanReadableUpdateVersion"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      uint64_t v19 = [objc_alloc(NSString) initWithData:v18 encoding:4];
      humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
      v5->_humanReadableUpdateVersion = (NSString *)v19;
    }
  }

  return v5;
}

- (id)summary
{
  v18 = (void *)NSString;
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v17 = v3;
  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  uint64_t v16 = v5;
  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  -[SUCoreDocumentationData readme](self, "readme");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = -[SUCoreDocumentationData license](self, "license");
  if (v12) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  [v18 stringWithFormat:@"SUCoreDocumentationData(humanReadableUpdateName:%@|humanReadableUpdateTitle:%@|humanReadableUpdateVersion:%@|readMe:%@|readMeSummary:%@|license:%@)", v17, v16, v7, v9, v11, v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"humanReadableUpdateName:\n%@\n", v4];
  v5 = -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  [v3 appendFormat:@"humanReadableUpdateTitle:\n%@\n", v5];

  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"humanReadableUpdateVersion:\n%@\n", v6];
  v7 = -[SUCoreDocumentationData readme](self, "readme");
  [v3 appendFormat:@"readme:\n%@\n", v7];

  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"readmeSummary:\n%@\n", v8];
  v9 = -[SUCoreDocumentationData license](self, "license");
  [v3 appendFormat:@"license:\n%@\n", v9];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreDocumentationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SUCoreDocumentationData;
  v5 = -[SUCoreDocumentationData init](&v19, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateName"];
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateTitle"];
    humanReadableUpdateTitle = v5->_humanReadableUpdateTitle;
    v5->_humanReadableUpdateTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateVersion"];
    humanReadableUpdateVersion = v5->_humanReadableUpdateVersion;
    v5->_humanReadableUpdateVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReadMe"];
    readme = v5->_readme;
    v5->_readme = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReadMeSummary"];
    readmeSummary = v5->_readmeSummary;
    v5->_readmeSummary = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"License"];
    license = v5->_license;
    v5->_license = (NSData *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  [v4 encodeObject:v5 forKey:@"HumanReadableUpdateName"];

  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"HumanReadableUpdateTitle"];
  v7 = -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  [v4 encodeObject:v7 forKey:@"HumanReadableUpdateVersion"];

  -[SUCoreDocumentationData readme](self, "readme");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"ReadMe"];
  v9 = -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  [v4 encodeObject:v9 forKey:@"ReadMeSummary"];

  -[SUCoreDocumentationData license](self, "license");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"License"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  -[SUCoreDocumentationData humanReadableUpdateName](self, "humanReadableUpdateName");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setHumanReadableUpdateName:v7];

  -[SUCoreDocumentationData humanReadableUpdateTitle](self, "humanReadableUpdateTitle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setHumanReadableUpdateTitle:v9];

  -[SUCoreDocumentationData humanReadableUpdateVersion](self, "humanReadableUpdateVersion");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setHumanReadableUpdateVersion:v11];

  -[SUCoreDocumentationData readme](self, "readme");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)[v12 copyWithZone:a3];
  [v5 setReadme:v13];

  -[SUCoreDocumentationData readmeSummary](self, "readmeSummary");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setReadmeSummary:v15];

  -[SUCoreDocumentationData license](self, "license");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setLicense:v17];

  return v5;
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSString)humanReadableUpdateTitle
{
  return self->_humanReadableUpdateTitle;
}

- (void)setHumanReadableUpdateTitle:(id)a3
{
}

- (NSString)humanReadableUpdateVersion
{
  return self->_humanReadableUpdateVersion;
}

- (void)setHumanReadableUpdateVersion:(id)a3
{
}

- (NSData)readme
{
  return self->_readme;
}

- (void)setReadme:(id)a3
{
}

- (NSData)readmeSummary
{
  return self->_readmeSummary;
}

- (void)setReadmeSummary:(id)a3
{
}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
}

- (void).cxx_destruct
{
}

@end