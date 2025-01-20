@interface PS190SoCRestoreInfoFirmwareCopierOS
- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3;
- (BOOL)parseOptions:(id)a3;
- (PS190SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4;
- (id)readFirmwareFileDataWithError:(id *)a3;
@end

@implementation PS190SoCRestoreInfoFirmwareCopierOS

- (PS190SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PS190SoCRestoreInfoFirmwareCopierOS;
  v9 = -[PS190SoCRestoreInfoHelperOS initWithOptions:logFunction:logContext:]( &v13,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  v10 = v9;
  if (v9
    && (-[PS190SoCRestoreInfoHelperOS verboseLog:]( v9,  "verboseLog:",  @"%s: input options: %@",  "-[PS190SoCRestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]",  v8),  !-[PS190SoCRestoreInfoFirmwareCopierOS parseOptions:](v10, "parseOptions:", v8)))
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
  id v5 = (id)[v4 objectForKeyedSubscript:@"BuildIdentity"];
  if (v5)
  {
    id v6 = (id)[v4 objectForKeyedSubscript:@"DeviceInfo"];
    if (!v6) {
      -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Warning: Could not find device info dictionary");
    }
    if ([v5 count])
    {
      id v7 =  -[PS190SoCRestoreInfoFirmwareCopierOS firmwareKeyFromBuildIdentityDict:deviceInfo:]( self,  "firmwareKeyFromBuildIdentityDict:deviceInfo:",  v5,  v6);
      if (!v7)
      {
        -[PS190SoCRestoreInfoHelperOS log:]( self,  "log:",  @"Could not find firmware key in build identity dictionary");
LABEL_26:
        BOOL v16 = 0;
        goto LABEL_27;
      }

      id v8 = v7;
      id v9 = (id)[v5 objectForKeyedSubscript:v7];
      id v10 = (id)[v9 objectForKeyedSubscript:@"Info"];
      if (v10)
      {
        v11 = v10;
        id v12 = (id)[v10 objectForKeyedSubscript:@"Path"];
        objc_super v13 = v12;
        if (v12)
        {
          v14 = (NSString *)[v12 copy];
          firmwarePathSuffix = self->_firmwarePathSuffix;
          self->_firmwarePathSuffix = v14;

LABEL_11:
          v17 = (NSData *)(id)[v4 objectForKeyedSubscript:@"FirmwareData"];
          firmwareOverrideData = self->_firmwareOverrideData;
          self->_firmwareOverrideData = v17;

          v19 = self->_firmwareOverrideData;
          if (v19)
          {
            -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Detected firmware override");
            v19 = self->_firmwareOverrideData;
          }

          if (!v19 && v8)
          {
            id v20 = (id)[v4 objectForKeyedSubscript:@"BundleDataDict"];
            v21 = v20;
            if (v20)
            {
              v22 = (NSData *)(id)[v20 objectForKeyedSubscript:v8];
              firmwareInBundleDataDict = self->_firmwareInBundleDataDict;
              self->_firmwareInBundleDataDict = v22;

              -[PS190SoCRestoreInfoHelperOS log:]( self,  "log:",  @"Attempt to use '%@' firmware from BundleDataDict: %@",  v8,  self->_firmwareInBundleDataDict);
            }

            v19 = self->_firmwareOverrideData;
          }

          if (v19 || self->_firmwareInBundleDataDict) {
            goto LABEL_20;
          }
          if (self->_firmwarePathSuffix)
          {
            id v27 = (id)[v4 objectForKeyedSubscript:@"BundlePath"];
            if (v27)
            {
              v28 = v27;
              v29 = (NSURL *)(id)[v27 URLByAppendingPathComponent:self->_firmwarePathSuffix];
              firmwareBundleURL = self->_firmwareBundleURL;
              self->_firmwareBundleURL = v29;

LABEL_20:
              v24 = (NSURL *)(id)[v4 objectForKeyedSubscript:@"DestBundlePath"];
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

          -[PS190SoCRestoreInfoHelperOS log:](self, "log:", v31);
          goto LABEL_25;
        }

        -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Could not find firmware path");
      }

      else
      {
        -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Could not find firmware info dictionary");
      }

LABEL_25:
      goto LABEL_26;
    }

    -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Detected empty build identity dictionary");
    id v8 = 0LL;
    goto LABEL_11;
  }

  -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Could not find build identity dictionary");
  BOOL v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL && self->_firmwarePathSuffix)
  {
    id v6 = (void *)NSString;
    id v7 = -[NSURL path](destBundlePathURL, "path");
    id v8 = (id)[v6 stringWithFormat:@"%@/%@", v7, self->_firmwarePathSuffix];

    id v9 = (id)[MEMORY[0x189604030] fileURLWithPath:v8];
    id v10 = (id)[MEMORY[0x1896078A8] defaultManager];
    id v11 = (id)[v9 URLByDeletingLastPathComponent];
    id v12 = (id)[MEMORY[0x1896078A8] defaultManager];
    id v13 = (id)[v11 path];
    id v33 = 0LL;
    char v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v33];
    id v15 = v33;

    if ((v14 & 1) == 0 && ([v15 isFileExistsError] & 1) == 0)
    {
      id v24 = (id)[v11 path];
      -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Failed to create directory at '%@' (%@)", v24, v15);

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
    id v5 = firmwareOverrideData;
  }

  else
  {
    firmwareBundleURL = self->_firmwareBundleURL;
    id v11 = 0LL;
    id v5 = (NSData *)(id)[MEMORY[0x189603F48] dataWithContentsOfURL:firmwareBundleURL options:0 error:&v11];
    id v9 = v11;
    if (!v5)
    {
      id v10 = -[NSURL path](self->_firmwareBundleURL, "path");
      -[PS190SoCRestoreInfoHelperOS log:](self, "log:", @"Failed to read firmware file at '%@' (%@)", v10, v9);

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