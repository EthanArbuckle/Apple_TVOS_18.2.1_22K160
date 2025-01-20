@interface SUControllerScanManagerParam
+ (BOOL)supportsSecureCoding;
- (BOOL)rampingForeground;
- (NSData)ssoToken;
- (NSError)error;
- (NSString)baseScanUUID;
- (SUControllerScanManagerParam)init;
- (SUControllerScanManagerParam)initWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4;
- (SUControllerScanManagerParam)initWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4 completion:(id)a5;
- (SUControllerScanManagerParam)initWithCoder:(id)a3;
- (SUControllerScanManagerParam)initWithError:(id)a3;
- (SUControllerScanManagerParam)initWithParamType:(int64_t)a3 withScanOptions:(id)a4 withScanPolicy:(id)a5 withBaseScanUUID:(id)a6 withRampingForeground:(BOOL)a7 withPrimaryDescriptor:(id)a8 withSecondaryDescriptor:(id)a9 withSSOToken:(id)a10 withError:(id)a11 withPurgeCompletion:(id)a12;
- (SUControllerScanManagerParam)initWithSSOToken:(id)a3;
- (SUControllerScanManagerParam)initWithScanOptions:(id)a3;
- (SUControllerScanManagerParam)initWithScanPolicy:(id)a3 withPrimaryDescriptor:(id)a4 withSecondaryDescriptor:(id)a5;
- (SUControllerScanOptions)scanOptions;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreDescriptor)secondaryDescriptor;
- (SUCorePolicy)scanPolicy;
- (id)description;
- (id)paramTypeName;
- (id)purgeCompletion;
- (int64_t)paramType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SUControllerScanManagerParam

- (SUControllerScanManagerParam)init
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerScanManagerParam)initWithScanOptions:(id)a3
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  2LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerScanManagerParam)initWithScanPolicy:(id)a3 withPrimaryDescriptor:(id)a4 withSecondaryDescriptor:(id)a5
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  3LL,  0LL,  a3,  0LL,  0LL,  a4,  a5,  0LL,  0LL,  0LL);
}

- (SUControllerScanManagerParam)initWithSSOToken:(id)a3
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  4LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL,  0LL);
}

- (SUControllerScanManagerParam)initWithError:(id)a3
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  5LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a3,  0LL);
}

- (SUControllerScanManagerParam)initWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  1LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (SUControllerScanManagerParam)initWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4 completion:(id)a5
{
  return -[SUControllerScanManagerParam initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor:withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:]( self,  "initWithParamType:withScanOptions:withScanPolicy:withBaseScanUUID:withRampingForeground:withPrimaryDescriptor :withSecondaryDescriptor:withSSOToken:withError:withPurgeCompletion:",  6LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  0LL,  0LL,  a5);
}

- (SUControllerScanManagerParam)initWithParamType:(int64_t)a3 withScanOptions:(id)a4 withScanPolicy:(id)a5 withBaseScanUUID:(id)a6 withRampingForeground:(BOOL)a7 withPrimaryDescriptor:(id)a8 withSecondaryDescriptor:(id)a9 withSSOToken:(id)a10 withError:(id)a11 withPurgeCompletion:(id)a12
{
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a8;
  id v27 = a9;
  id v26 = a10;
  id v17 = a11;
  id v18 = a12;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SUControllerScanManagerParam;
  v19 = -[SUControllerScanManagerParam init](&v32, "init");
  v20 = v19;
  if (v19)
  {
    v19->_paramType = a3;
    objc_storeStrong((id *)&v19->_scanOptions, a4);
    objc_storeStrong((id *)&v20->_scanPolicy, a5);
    objc_storeStrong((id *)&v20->_baseScanUUID, a6);
    v20->_rampingForeground = a7;
    objc_storeStrong((id *)&v20->_primaryDescriptor, a8);
    objc_storeStrong((id *)&v20->_secondaryDescriptor, a9);
    objc_storeStrong((id *)&v20->_ssoToken, a10);
    objc_storeStrong((id *)&v20->_error, a11);
    id v21 = objc_retainBlock(v18);
    id purgeCompletion = v20->_purgeCompletion;
    v20->_id purgeCompletion = v21;
  }

  return v20;
}

- (SUControllerScanManagerParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___SUControllerScanManagerParam;
  v5 = -[SUControllerScanManagerParam init](&v27, "init");
  if (v5)
  {
    v5->_paramType = (int64_t)[v4 decodeInt64ForKey:@"paramType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(SUControllerScanOptions) forKey:@"ScanOptions"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    scanOptions = v5->_scanOptions;
    v5->_scanOptions = (SUControllerScanOptions *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(SUCorePolicy) forKey:@"ScanPolicy"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    scanPolicy = v5->_scanPolicy;
    v5->_scanPolicy = (SUCorePolicy *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"BaseScanUUID"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    baseScanUUID = v5->_baseScanUUID;
    v5->_baseScanUUID = (NSString *)v13;

    v5->_rampingForeground = [v4 decodeBoolForKey:@"RampingForeground"];
    id v15 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"PrimaryDescriptor"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    primaryDescriptor = v5->_primaryDescriptor;
    v5->_primaryDescriptor = (SUCoreDescriptor *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(SUCoreDescriptor) forKey:@"SecondaryDescriptor"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    secondaryDescriptor = v5->_secondaryDescriptor;
    v5->_secondaryDescriptor = (SUCoreDescriptor *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"SSOToken"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    ssoToken = v5->_ssoToken;
    v5->_ssoToken = (NSData *)v22;

    error = v5->_error;
    v5->_error = 0LL;

    id purgeCompletion = v5->_purgeCompletion;
    v5->_id purgeCompletion = 0LL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend( v4,  "encodeInt64:forKey:",  -[SUControllerScanManagerParam paramType](self, "paramType"),  @"paramType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam scanOptions](self, "scanOptions"));
  [v4 encodeObject:v5 forKey:@"ScanOptions"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam scanPolicy](self, "scanPolicy"));
  [v4 encodeObject:v6 forKey:@"ScanPolicy"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam baseScanUUID](self, "baseScanUUID"));
  [v4 encodeObject:v7 forKey:@"BaseScanUUID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[SUControllerScanManagerParam rampingForeground](self, "rampingForeground"),  @"RampingForeground");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam primaryDescriptor](self, "primaryDescriptor"));
  [v4 encodeObject:v8 forKey:@"PrimaryDescriptor"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam secondaryDescriptor](self, "secondaryDescriptor"));
  [v4 encodeObject:v9 forKey:@"SecondaryDescriptor"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam ssoToken](self, "ssoToken"));
  [v4 encodeObject:v10 forKey:@"SSOToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam paramTypeName](self, "paramTypeName"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam scanOptions](self, "scanOptions"));
  if (v5)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam scanOptions](self, "scanOptions"));
    id v6 = (const __CFString *)objc_claimAutoreleasedReturnValue([v22 summary]);
  }

  else
  {
    id v6 = @"none";
  }

  id v28 = (void *)v5;
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam scanPolicy](self, "scanPolicy"));
  if (v26)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam scanPolicy](self, "scanPolicy"));
    objc_super v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[SUControllerCore scanPolicySummary:](&OBJC_CLASS___SUControllerCore, "scanPolicySummary:"));
  }

  else
  {
    objc_super v32 = @"none";
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam baseScanUUID](self, "baseScanUUID"));
  if (v25) {
    id v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam baseScanUUID](self, "baseScanUUID"));
  }
  else {
    id v31 = @"none";
  }
  unsigned int v7 = -[SUControllerScanManagerParam rampingForeground](self, "rampingForeground");
  v8 = @"NO";
  if (v7) {
    v8 = @"YES";
  }
  v23 = v8;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam primaryDescriptor](self, "primaryDescriptor"));
  if (v24)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam primaryDescriptor](self, "primaryDescriptor"));
    id v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 summary]);
  }

  else
  {
    id v30 = @"none";
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam secondaryDescriptor](self, "secondaryDescriptor"));
  id v29 = (void *)v4;
  objc_super v27 = (__CFString *)v6;
  if (v9)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam secondaryDescriptor](self, "secondaryDescriptor"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 summary]);
  }

  else
  {
    id v10 = @"none";
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam ssoToken](self, "ssoToken"));
  if (v11) {
    id v12 = @"present";
  }
  else {
    id v12 = @"none";
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam error](self, "error"));
  if (v13)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam error](self, "error"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 description]);
  }

  else
  {
    v14 = @"none";
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerScanManagerParam purgeCompletion](self, "purgeCompletion"));
  uint64_t v16 = @"present";
  if (!v15) {
    uint64_t v16 = @"none";
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n              paramType: %@\n            scanOptions: %@\n             scanPolicy: %@\n           baseScanUUID: %@\n      rampingForeground: %@\n      primaryDescriptor: %@\n    secondaryDescriptor: %@\n               ssoToken: %@\n                  error: %@\n        purgeCompletion: %@\n<<<]",  v29,  v27,  v32,  v31,  v23,  v30,  v10,  v12,  v14,  v16));

  if (v13)
  {
  }

  if (v9)
  {
  }

  if (v24)
  {
  }

  if (v25) {
  if (v26)
  }
  {
  }

  if (v28)
  {
  }

  return v17;
}

- (id)paramTypeName
{
  unint64_t v2 = -[SUControllerScanManagerParam paramType](self, "paramType");
  if (v2 > 6) {
    return @"UNKNOWN";
  }
  else {
    return *(&off_100065BD8 + v2);
  }
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (SUControllerScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (NSString)baseScanUUID
{
  return self->_baseScanUUID;
}

- (BOOL)rampingForeground
{
  return self->_rampingForeground;
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (SUCoreDescriptor)secondaryDescriptor
{
  return self->_secondaryDescriptor;
}

- (NSData)ssoToken
{
  return self->_ssoToken;
}

- (NSError)error
{
  return self->_error;
}

- (id)purgeCompletion
{
  return self->_purgeCompletion;
}

- (void).cxx_destruct
{
}

@end