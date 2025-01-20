@interface OTControlArguments
+ (BOOL)supportsSecureCoding;
- (NSString)altDSID;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)deviceSessionID;
- (NSString)flowID;
- (OTControlArguments)init;
- (OTControlArguments)initWithAltDSID:(id)a3;
- (OTControlArguments)initWithAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5;
- (OTControlArguments)initWithCoder:(id)a3;
- (OTControlArguments)initWithConfiguration:(id)a3;
- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5;
- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5 flowID:(id)a6 deviceSessionID:(id)a7;
- (id)description;
- (id)makeConfigurationContext;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setFlowID:(id)a3;
@end

@implementation OTControlArguments

- (OTControlArguments)init
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:]( self,  "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:",  @"com.apple.security.keychain",  OTDefaultContext,  0LL,  0LL,  0LL);
}

- (OTControlArguments)initWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerName];
  v6 = (void *)v5;
  if (v5) {
    v7 = (const __CFString *)v5;
  }
  else {
    v7 = @"com.apple.security.keychain";
  }
  uint64_t v8 = [v4 context];
  v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = OTDefaultContext;
  }
  [v4 altDSID];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 flowID];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 deviceSessionID];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:]( self,  "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:",  v7,  v10,  v11,  v12,  v13);
  return v14;
}

- (OTControlArguments)initWithAltDSID:(id)a3
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:]( self,  "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:",  @"com.apple.security.keychain",  OTDefaultContext,  a3,  0LL,  0LL);
}

- (OTControlArguments)initWithAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:]( self,  "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:",  @"com.apple.security.keychain",  OTDefaultContext,  a3,  a4,  a5);
}

- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5
{
  return -[OTControlArguments initWithContainerName:contextID:altDSID:flowID:deviceSessionID:]( self,  "initWithContainerName:contextID:altDSID:flowID:deviceSessionID:",  a3,  a4,  a5,  0LL,  0LL);
}

- (OTControlArguments)initWithContainerName:(id)a3 contextID:(id)a4 altDSID:(id)a5 flowID:(id)a6 deviceSessionID:(id)a7
{
  v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OTControlArguments;
  v17 = -[OTControlArguments init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    if (v12) {
      v19 = v12;
    }
    else {
      v19 = @"com.apple.security.keychain";
    }
    objc_storeStrong((id *)&v17->_containerName, v19);
    objc_storeStrong((id *)&v18->_contextID, a4);
    objc_storeStrong((id *)&v18->_altDSID, a5);
    objc_storeStrong((id *)&v18->_flowID, a6);
    objc_storeStrong((id *)&v18->_deviceSessionID, a7);
  }

  return v18;
}

- (id)description
{
  v3 = (void *)NSString;
  -[OTControlArguments containerName](self, "containerName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTControlArguments contextID](self, "contextID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OTControlArguments altDSID](self, "altDSID");
  v7 = -[OTControlArguments flowID](self, "flowID");
  -[OTControlArguments deviceSessionID](self, "deviceSessionID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<OTControlArguments: container:%@, context:%@, altDSID:%@, flowID: %@, deviceSessionID: %@>", v4, v5, v6, v7, v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[OTControlArguments contextID](self, "contextID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"contextID"];
  v6 = -[OTControlArguments containerName](self, "containerName");
  [v4 encodeObject:v6 forKey:@"containerName"];
  v7 = -[OTControlArguments altDSID](self, "altDSID");
  [v4 encodeObject:v7 forKey:@"altDSID"];

  -[OTControlArguments flowID](self, "flowID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"flowID"];

  -[OTControlArguments deviceSessionID](self, "deviceSessionID");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"deviceSessionID"];
}

- (OTControlArguments)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___OTControlArguments;
  uint64_t v5 = -[OTControlArguments init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextID"];
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerName"];
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flowID"];
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSessionID"];
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v14;
  }

  return v5;
}

- (id)makeConfigurationContext
{
  v3 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  -[OTControlArguments containerName](self, "containerName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setContainerName:](v3, "setContainerName:", v4);

  -[OTControlArguments contextID](self, "contextID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setContext:](v3, "setContext:", v5);

  -[OTControlArguments altDSID](self, "altDSID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setAltDSID:](v3, "setAltDSID:", v6);
  v7 = -[OTControlArguments flowID](self, "flowID");
  -[OTConfigurationContext setFlowID:](v3, "setFlowID:", v7);

  -[OTControlArguments deviceSessionID](self, "deviceSessionID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTConfigurationContext setDeviceSessionID:](v3, "setDeviceSessionID:", v8);

  return v3;
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContextID:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setContainerName:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setFlowID:(id)a3
{
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDeviceSessionID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end