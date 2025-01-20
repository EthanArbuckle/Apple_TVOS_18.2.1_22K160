@interface Ace3SoCRestoreInfoFirmwareCopierOS
- (Ace3SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3;
- (BOOL)parseOptions:(id)a3;
- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4;
- (id)readFirmwareFileDataWithError:(id *)a3;
@end

@implementation Ace3SoCRestoreInfoFirmwareCopierOS

- (Ace3SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___Ace3SoCRestoreInfoFirmwareCopierOS;
  v9 = -[Ace3SoCRestoreInfoHelperOS initWithOptions:logFunction:logContext:]( &v13,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  v10 = v9;
  if (v9
    && (-[Ace3SoCRestoreInfoHelperOS verboseLog:]( v9,  "verboseLog:",  @"%s: input options: %@",  "-[Ace3SoCRestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]",  v8),  !-[Ace3SoCRestoreInfoFirmwareCopierOS parseOptions:](v10, "parseOptions:", v8)))
  {
    v11 = 0LL;
  }

  else
  {
    v11 = v10;
  }

  return v11;
}

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  return 0LL;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"BuildIdentity"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [v4 objectForKeyedSubscript:@"DeviceInfo"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Warning: Could not find device info dictionary");
    }
    if ([v5 count])
    {
      uint64_t v7 = -[Ace3SoCRestoreInfoFirmwareCopierOS firmwareKeyFromBuildIdentityDict:deviceInfo:]( self,  "firmwareKeyFromBuildIdentityDict:deviceInfo:",  v5,  v6);
      if (!v7)
      {
        -[Ace3SoCRestoreInfoHelperOS log:]( self,  "log:",  @"Could not find firmware key in build identity dictionary");
LABEL_26:
        BOOL v16 = 0;
        goto LABEL_27;
      }

      id v8 = (void *)v7;
      [v5 objectForKeyedSubscript:v7];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 objectForKeyedSubscript:@"Info"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        [v10 objectForKeyedSubscript:@"Path"];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v13 = v12;
        if (v12)
        {
          v14 = (NSString *)[v12 copy];
          firmwarePathSuffix = self->_firmwarePathSuffix;
          self->_firmwarePathSuffix = v14;

LABEL_11:
          [v4 objectForKeyedSubscript:@"FirmwareData"];
          v17 = (NSData *)objc_claimAutoreleasedReturnValue();
          firmwareOverrideData = self->_firmwareOverrideData;
          self->_firmwareOverrideData = v17;

          v19 = self->_firmwareOverrideData;
          if (v19)
          {
            -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Detected firmware override");
            v19 = self->_firmwareOverrideData;
          }

          if (!v19 && v8)
          {
            [v4 objectForKeyedSubscript:@"BundleDataDict"];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              [v20 objectForKeyedSubscript:v8];
              v22 = (NSData *)objc_claimAutoreleasedReturnValue();
              firmwareInBundleDataDict = self->_firmwareInBundleDataDict;
              self->_firmwareInBundleDataDict = v22;

              -[Ace3SoCRestoreInfoHelperOS log:]( self,  "log:",  @"Attempt to use '%@' firmware from BundleDataDict: %@",  v8,  self->_firmwareInBundleDataDict);
            }

            v19 = self->_firmwareOverrideData;
          }

          if (v19 || self->_firmwareInBundleDataDict) {
            goto LABEL_20;
          }
          if (self->_firmwarePathSuffix)
          {
            [v4 objectForKeyedSubscript:@"BundlePath"];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = v27;
              [v27 URLByAppendingPathComponent:self->_firmwarePathSuffix];
              v29 = (NSURL *)objc_claimAutoreleasedReturnValue();
              firmwareBundleURL = self->_firmwareBundleURL;
              self->_firmwareBundleURL = v29;

LABEL_20:
              [v4 objectForKeyedSubscript:@"DestBundlePath"];
              v24 = (NSURL *)objc_claimAutoreleasedReturnValue();
              destBundlePathURL = self->_destBundlePathURL;
              self->_destBundlePathURL = v24;

              BOOL v16 = 1;
LABEL_27:

              goto LABEL_28;
            }

            v31 = @"Could not find bundle path";
          }

          else
          {
            v31 = @"Firmware override must be specified if build identity dictionary is empty";
          }

          -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", v31);
          goto LABEL_25;
        }

        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Could not find firmware path");
      }

      else
      {
        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Could not find firmware info dictionary");
      }

LABEL_25:
      goto LABEL_26;
    }

    -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Detected empty build identity dictionary");
    id v8 = 0LL;
    goto LABEL_11;
  }

  -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Could not find build identity dictionary");
  BOOL v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL && self->_firmwarePathSuffix)
  {
    v6 = (void *)NSString;
    -[NSURL path](destBundlePathURL, "path");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"%@/%@", v7, self->_firmwarePathSuffix];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189604030] fileURLWithPath:v8];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 URLByDeletingLastPathComponent];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 path];
    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    char v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v15 = v33;

    if ((v14 & 1) == 0 && ([v15 isFileExistsError] & 1) == 0)
    {
      [v11 path];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Failed to create directory at '%@' (%@)", v24, v15);

      if (a3)
      {
        BOOL v22 = 0;
        *a3 = v15;
LABEL_22:

        return v22;
      }

- (id)readFirmwareFileDataWithError:(id *)a3
{
  firmwareOverrideData = self->_firmwareOverrideData;
  if (firmwareOverrideData || (firmwareOverrideData = self->_firmwareInBundleDataDict) != 0LL)
  {
    v5 = firmwareOverrideData;
  }

  else
  {
    firmwareBundleURL = self->_firmwareBundleURL;
    id v11 = 0LL;
    [MEMORY[0x189603F48] dataWithContentsOfURL:firmwareBundleURL options:0 error:&v11];
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v9 = v11;
    if (!v5)
    {
      v10 = -[NSURL path](self->_firmwareBundleURL, "path");
      -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", @"Failed to read firmware file at '%@' (%@)", v10, v9);

      if (a3) {
        *a3 = v9;
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end