@interface AppleTypeCRetimerFirmwareCopierOS
- (AppleTypeCRetimerFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3;
- (BOOL)createDestinationBundleFirmwareDirectoryFor:(id)a3 error:(id *)a4;
- (BOOL)parseOptions:(id)a3;
- (id)description;
- (id)readFirmwareFileDataWithError:(id *)a3;
- (id)rtKitKeyFromBuildIdentityDict:(id)a3;
@end

@implementation AppleTypeCRetimerFirmwareCopierOS

- (AppleTypeCRetimerFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerFirmwareCopierOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS initWithOptions:logFunction:logContext:]( &v13,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  v10 = v9;
  if (v9)
  {
    if (!-[AppleTypeCRetimerFirmwareCopierOS parseOptions:](v9, "parseOptions:", v8))
    {
      v11 = 0LL;
      goto LABEL_6;
    }

    -[AppleTypeCRetimerRestoreInfoHelperOS verboseLog:](v10, "verboseLog:", @"%@", v10);
  }

  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4 = a3;
  id v5 = (id)[v4 objectForKeyedSubscript:@"BuildIdentity"];
  if (v5)
  {
    id v6 =  -[AppleTypeCRetimerFirmwareCopierOS rtKitKeyFromBuildIdentityDict:]( self,  "rtKitKeyFromBuildIdentityDict:",  v5);
    if (!v6)
    {
      -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Could not find RTKitOS key in build identity dictionary");
      BOOL v25 = 0;
LABEL_20:

      goto LABEL_21;
    }

    id v7 = (id)[v5 objectForKeyedSubscript:v6];
    id v8 = (id)[v7 objectForKeyedSubscript:@"Info"];
    v9 = v8;
    if (!v8)
    {
      -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"Could not find RTKitOS info dictionary");
      BOOL v25 = 0;
LABEL_19:

      goto LABEL_20;
    }

    id v10 = (id)[v8 objectForKeyedSubscript:@"Path"];
    v11 = v10;
    if (v10)
    {
      v12 = (NSString *)[v10 copy];
      firmwarePathSuffix = self->_firmwarePathSuffix;
      self->_firmwarePathSuffix = v12;

      v14 = (NSData *)(id)[v4 objectForKeyedSubscript:@"FirmwareData"];
      firmwareOverrideData = self->_firmwareOverrideData;
      self->_firmwareOverrideData = v14;

      if (self->_firmwareOverrideData) {
        goto LABEL_12;
      }
      id v16 = (id)[v4 objectForKeyedSubscript:@"BundleDataDict"];
      if (v16)
      {
        id v28 = v16;
        v17 = (NSData *)(id)[v16 objectForKeyedSubscript:v6];
        firmwareInBundleDataDict = self->_firmwareInBundleDataDict;
        self->_firmwareInBundleDataDict = v17;

        -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Attempt to use '%@' firmware from BundleDataDict: %@",  v6,  self->_firmwareInBundleDataDict);
        id v16 = v28;
      }

      if (self->_firmwareOverrideData || self->_firmwareInBundleDataDict) {
        goto LABEL_12;
      }
      id v19 = (id)[v4 objectForKeyedSubscript:@"BundlePath"];
      if (v19)
      {
        v20 = v19;
        v21 = (NSURL *)(id)[v19 URLByAppendingPathComponent:self->_firmwarePathSuffix];
        firmwareBundleURL = self->_firmwareBundleURL;
        self->_firmwareBundleURL = v21;

LABEL_12:
        v23 = (NSURL *)(id)[v4 objectForKeyedSubscript:@"DestBundlePath"];
        destBundlePathURL = self->_destBundlePathURL;
        self->_destBundlePathURL = v23;

        BOOL v25 = 1;
LABEL_18:

        goto LABEL_19;
      }

      v26 = @"Could not find bundle path";
    }

    else
    {
      v26 = @"Could not find RTKitOS path";
    }

    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", v26);
    BOOL v25 = 0;
    goto LABEL_18;
  }

  -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", @"Could not find build identity dictionary");
  BOOL v25 = 0;
LABEL_21:

  return v25;
}

- (id)rtKitKeyFromBuildIdentityDict:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", @"Timer,RTKitOS", (void)v11))
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v9 = 0LL;
LABEL_11:

  return v9;
}

- (BOOL)createDestinationBundleFirmwareDirectoryFor:(id)a3 error:(id *)a4
{
  id v6 = (id)[MEMORY[0x189604030] fileURLWithPath:a3];
  id v7 = (id)[v6 URLByDeletingLastPathComponent];
  id v8 = (id)[MEMORY[0x1896078A8] defaultManager];
  id v9 = (id)[v7 path];
  char v10 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a4];

  if ((v10 & 1) == 0)
  {
    id v11 = (id)[v7 path];
    -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to create destination bundle firmware directory at '%@' (%@)",  v11,  *a4);
  }

  return v10;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL)
  {
    uint64_t v5 = (void *)NSString;
    id v6 = -[NSURL path](destBundlePathURL, "path");
    id v7 = (id)[v5 stringWithFormat:@"%@/%@", v6, self->_firmwarePathSuffix];

    id v8 = (id)[MEMORY[0x189604030] fileURLWithPath:v7];
    id v9 = (id)[MEMORY[0x1896078A8] defaultManager];
    id v10 = (id)[v8 URLByDeletingLastPathComponent];
    id v11 = (id)[MEMORY[0x1896078A8] defaultManager];
    id v12 = (id)[v10 path];
    id v34 = 0LL;
    char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v34];
    id v14 = v34;

    if ((v13 & 1) == 0 && ([v14 isFileExistsError] & 1) == 0)
    {
      id v24 = (id)[v10 path];
      -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to create directory at '%@' (%@)",  v24,  v14);

      if (!a3)
      {
LABEL_21:
        BOOL v21 = 0;
        goto LABEL_22;
      }

      BOOL v21 = 0;
      *a3 = v14;
      goto LABEL_22;
    }

    id v15 = (id)[v8 path];
    int v16 = [v9 fileExistsAtPath:v15];

    if (v16)
    {
      id v33 = 0LL;
      char v17 = [v9 removeItemAtURL:v8 error:&v33];
      id v18 = v33;
      id v19 = v18;
      if ((v17 & 1) == 0)
      {
        id v28 = (NSString *)(id)[v8 path];
        -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to remove file at '%@' (%@)",  v28,  v19);
        goto LABEL_17;
      }
    }

    firmwareOverrideData = self->_firmwareOverrideData;
    if (firmwareOverrideData)
    {
      BOOL v21 = 1;
      if (!-[NSData writeToURL:atomically:](firmwareOverrideData, "writeToURL:atomically:", v8, 1LL))
      {
        id v22 = (id)[v8 path];
        -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to write firmware file data to '%@'",  v22);
        v23 = v22;
LABEL_20:

        goto LABEL_21;
      }

- (id)readFirmwareFileDataWithError:(id *)a3
{
  firmwareOverrideData = self->_firmwareOverrideData;
  if (firmwareOverrideData || (firmwareOverrideData = self->_firmwareInBundleDataDict) != 0LL)
  {
    uint64_t v5 = firmwareOverrideData;
  }

  else
  {
    firmwareBundleURL = self->_firmwareBundleURL;
    id v11 = 0LL;
    uint64_t v5 = (NSData *)(id)[MEMORY[0x189603F48] dataWithContentsOfURL:firmwareBundleURL options:0 error:&v11];
    id v9 = v11;
    if (!v5)
    {
      id v10 = -[NSURL path](self->_firmwareBundleURL, "path");
      -[AppleTypeCRetimerRestoreInfoHelperOS log:]( self,  "log:",  @"Failed to read firmware file at '%@' (%@)",  v10,  v9);

      if (a3) {
        *a3 = v9;
      }
    }
  }

  return v5;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x189607940];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"%@:\n", v5];

  [v6 appendFormat:@"\tFirmware path suffix: %@\n", self->_firmwarePathSuffix];
  id v7 = -[NSURL path](self->_firmwareBundleURL, "path");
  [v6 appendFormat:@"\tFirmware bundle path: %@\n", v7];

  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL)
  {
    id v9 = -[NSURL path](destBundlePathURL, "path");
    [v6 appendFormat:@"\tDestination Bundle Path: %@\n", v9];
  }

  id v10 = (id)[NSString stringWithString:v6];

  return v10;
}

- (void).cxx_destruct
{
}

@end